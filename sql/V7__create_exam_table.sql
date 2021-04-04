CREATE TABLE Exam
(
    StudentOUTID UUID,
    Subject      INT,
    School       INT,

    TestStatus   VARCHAR(256),
    Ball100      FLOAT,
    Ball12       FLOAT,
    Ball         FLOAT,
    DPALevel     VARCHAR(128) DEFAULT NULL,
    AdaptScale   SMALLINT DEFAULT NULL,

    PRIMARY KEY (StudentOUTID, Subject),

    CONSTRAINT fk_student_exam
        FOREIGN KEY (StudentOUTID)
            REFERENCES Student (OUTID),

    CONSTRAINT fk_exam_school
        FOREIGN KEY (School)
            REFERENCES School (SchoolID),

    CONSTRAINT fk_exam_subject
        FOREIGN KEY (Subject)
            REFERENCES Subject (SubjectID)
);