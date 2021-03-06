import os
import csv
import logging
import psycopg2
import pandas as pd
import matplotlib.pyplot as plt

from datetime import datetime, timedelta
from psycopg2.errors import lookup

LOG = logging.getLogger(__name__)
logging.basicConfig(
    filename="database_logs.log",
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(name)s::%(funcName)s: %(message)s"
)

YEARS = [2019, 2020]

SUBJECTS_LIST = ["Ukr", "hist", "math", "phys", "chem", "bio", "geo", "eng", "fra", "deu", "spa"]
STUDENT_COLUMNS = ['OUTID', 'Birth', 'SEXTYPENAME', 'REGNAME', 'AREANAME', 'TERNAME', 'REGTYPENAME', 'TerTypeName',
                   'ClassProfileNAME', 'ClassLangName', 'EONAME', 'EOTYPENAME', 'EORegName', 'EOAreaName', 'EOTerName',
                   'EOParent']
SUBJECT_COLUMNS_STR = ["OUTID", "Test", "TestStatus", "PTName", "PTRegName", "PTAreaName", "PTTerName"]
SUBJECT_COLUMNS_INT = ["Ball100", "Ball12", "Ball"]

STUDENT_TABLE_NAME = "StudentTable"
SUBJECT_TABLE_NAME = "SubjectTable"
LAST_ROW_TABLE = "LastRowTable"


def create_student_insert_query(row, year):
    insert_query = f"insert into {STUDENT_TABLE_NAME} values" + str(
        tuple([row[el].replace("'", "`") for el in STUDENT_COLUMNS]) + (year,))
    return insert_query + ";"


def create_subject_insert_query(row):
    insert_query = f"insert into {SUBJECT_TABLE_NAME} values"
    outid = row[SUBJECT_COLUMNS_STR[0]]
    for subject in SUBJECTS_LIST:
        if row[subject + SUBJECT_COLUMNS_STR[2]] == "null":
            continue
        insert_subjects_string = "('" + outid + "','" + subject + "',"
        subject_info_str = [
            row[f"{subject}{el}"].replace("'", "`")
            for el in SUBJECT_COLUMNS_STR[1:]
        ]
        subject_info_ball = [
            row[f"{subject}{el}"].replace(",", ".")
            for el in SUBJECT_COLUMNS_INT
        ]

        try:
            dpa_level = row["DPALevel"]
        except KeyError:
            dpa_level = "null"

        try:
            adapt_scale = row["AdaptScale"]
        except KeyError:
            adapt_scale = "null"

        insert_subject_query = (
                insert_subjects_string
                + "'"
                + "','".join(subject_info_str)
                + "'"
                + ","
                + ",".join(subject_info_ball)
                + ","
                + dpa_level
                + ","
                + adapt_scale
                + "),"
        )
        insert_query += insert_subject_query

    insert_query = insert_query[:-1] + ";"  # delete last coma and add ";"
    return insert_query


def get_breakpoint(cursor):
    try:
        cursor.execute(f"SELECT fileyear, rowNumber FROM {LAST_ROW_TABLE};")
        buf = cursor.fetchall()  # try fetchone()
        file_year = buf[0][0]
        row_number = buf[0][1]
    except Exception as e:
        LOG.info(f"Cannot get data from {LAST_ROW_TABLE}: {e}")
        file_year = YEARS[0]
        row_number = 0
    return file_year, row_number


def get_previous_run_time(cursor):
    try:
        cursor.execute(f"SELECT workTimeMicroseconds FROM {LAST_ROW_TABLE};")
        buf = cursor.fetchall()  # try fetchone()
        previous_run_work_time = buf[0][0]
    except Exception as e:
        LOG.info(f"Cannot get data from {LAST_ROW_TABLE}: {e}")
        previous_run_work_time = None

    return timedelta(microseconds=previous_run_work_time)


def get_user_query(cursor, filename):
    """Варіант 14: Порівняти середній бал з Англійської мови у кожному регіоні у 2020 та 2019 роках
    серед тих кому було зараховано тест"""
    LOG.info("Getting data for users query")

    user_query = f"""Select student.regname, student.examyear, AVG(subject.ball100)::Numeric(10, 3) AS englishAverageMark
    From {STUDENT_TABLE_NAME} as student
    INNER JOIN {SUBJECT_TABLE_NAME} as subject
    ON student.outid = subject.outid
    Where subject.subjtype = 'eng' AND subject.teststatus = 'Зараховано'
    Group by student.examyear, student.regname
    Order by  englishAverageMark desc"""

    to_csv_query = f"COPY ({user_query}) TO STDOUT WITH CSV HEADER"

    with open(filename, 'w') as f:
        cursor.copy_expert(to_csv_query, f)
    LOG.info(f"Users query data recorded into {filename}")


def create_tables(conn, cursor):
    LOG.info("Creating tables")
    with open('queries/CreateStudentTable.sql') as create_file:
        student_table_create = create_file.read().format(table_name=STUDENT_TABLE_NAME)
        # print(student_table_create)

    with open('queries/CreateSubjectTable.sql') as create_file:
        subject_table_create = create_file.read().format(table_name=SUBJECT_TABLE_NAME, fk_table=STUDENT_TABLE_NAME)
        # print(subject_table_create)

    with open('queries/CreateLastRowTable.sql') as create_file:
        row_table_create = create_file.read().format(table_name=LAST_ROW_TABLE)
        # print(subject_table_create)

    try:
        cursor.execute(student_table_create)
        LOG.info(f"Table {STUDENT_TABLE_NAME} created successfully")
    except lookup("42P07"):  # psycopg2.errors.DuplicateTable: relation "studenttable" already exists
        LOG.info(f"Table {STUDENT_TABLE_NAME} already exists")
    conn.commit()

    try:
        cursor.execute(subject_table_create)
        LOG.info(f"Table {SUBJECT_TABLE_NAME} created successfully")
    except lookup("42P07"):  # psycopg2.errors.DuplicateTable: relation "subjecttable" already exists
        LOG.info(f"Table {SUBJECT_TABLE_NAME} already exists")
    conn.commit()

    try:
        cursor.execute(row_table_create)
        cursor.execute(f"INSERT INTO {LAST_ROW_TABLE} VALUES (0, 0, 0)")  # set default values
        LOG.info(f"Table {STUDENT_TABLE_NAME} created successfully")
    except lookup("42P07"):  # psycopg2.errors.DuplicateTable: relation "subjecttable" already exists
        LOG.info(f"Table {LAST_ROW_TABLE} already exists")
    conn.commit()


def insert_data(conn, cursor, csv_filename, year, last_row_number, start_time):
    previous_stack_time = start_time
    LOG.info(f"Inserting data from {last_row_number} row from file for {year} year")
    with open(csv_filename, encoding="cp1251") as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=';')

        i = 0
        for row in csv_reader:
            # skip rows before the row where the program has broken
            i += 1
            print(i)
            if i <= last_row_number:
                continue

            insert_student_query = create_student_insert_query(row, year)
            insert_subject_query = create_subject_insert_query(row)

            try:
                cursor.execute(insert_student_query)
                cursor.execute(insert_subject_query)
            except Exception as e:
                end_time = datetime.now()
                LOG.info(f"Break time {end_time}")
                LOG.info(f"Executing time {end_time - start_time}")
                LOG.info(f"Я упал: {e}")
                conn.rollback()
                raise e

            if i % 50 == 0:
                now = datetime.now()
                try:
                    cursor.execute(f"UPDATE {LAST_ROW_TABLE} SET rowNumber={i}, fileyear={year}, "
                                   "workTimeMicroseconds=workTimeMicroseconds+"
                                   f"{(now - previous_stack_time).microseconds};")
                    conn.commit()
                except Exception as e:
                    LOG.info(f"Я упал: {e}")
                    conn.rollback()
                    raise e
                previous_stack_time = now
        try:
            conn.commit()  # commit last changes, because i % 50 can be not 0
        except Exception as e:
            LOG.info(f"Я упал: {e}")
            conn.rollback()
            raise e

    LOG.info(f"Inserting from {csv_filename} is finished")


def build_plot(filename):
    LOG.info(f"Building plot for data from {filename} file")
    data = pd.read_csv(filename, sep=',')
    data['year_region'] = data['examyear'].astype(str) + "-" + data['regname']

    figure = data.plot.bar(x='year_region', y='englishaveragemark', color="orange", figsize=(20, 7))
    plt.ylabel('Середній бал')
    plt.xlabel('рік-регіон')
    plt.title(
        'Середній бал з Англійської мови у кожному регіоні у 2020 та 2019 роках серед тих, кому було зараховано тест'
    )
    for p in figure.patches:
        figure.annotate(str(p.get_height()), (p.get_x() * 1.0001, p.get_height() * 0.02), rotation=90)

    picture_path = 'results_photo/AverageMarkByRegion.png'
    plt.savefig(picture_path, bbox_inches='tight')
    LOG.info(f"Plot saved into {picture_path}")


def main():
    conn = psycopg2.connect(
        dbname=os.environ.get("db_name"),
        user=os.environ.get("db_user"),
        password=os.environ.get("db_password"),
        host=os.environ.get("db_host")
    )
    cursor = conn.cursor()
    # create_tables(conn, cursor)  # create tables (conn.commit inside)
    #
    # file_year, row_number = get_breakpoint(cursor)
    # conn.commit()
    #
    # start_time = datetime.now()
    # LOG.info(f"Start time {start_time}")
    #
    # if file_year:  # start from the last row that was inserted
    #     index = YEARS.index(file_year)
    #     for year in YEARS[index:]:
    #         insert_data(conn, cursor, f"Odata{year}File.csv", year, row_number, start_time)
    #         row_number = 0
    # else:  # else start from the beginning
    #     for year in YEARS:
    #         insert_data(conn, cursor, f"Odata{year}File.csv", year, row_number, start_time)
    #         row_number = 0
    #
    inserting_time = get_previous_run_time(cursor)
    # end_time = datetime.now()
    # LOG.info(f"End time {end_time}")
    # LOG.info(f"Inserting executing time {end_time - start_time}")

    filename = "resultFile.csv"

    # get_user_query(cursor, filename)
    # conn.commit()

    build_plot(filename)

    cursor.close()
    conn.close()

    LOG.info("Program is finished")
    LOG.info(f"Total inserting executing time {inserting_time}")


if __name__ == "__main__":
    main()

#  number of all rows in files = 733112
