CREATE TABLE Student
(
    OUTID            UUID PRIMARY KEY,
    Area             INT,
    School           INT,

    ExamYear         SMALLINT,
    Birth            SMALLINT,
    SexTypeName      VARCHAR(128),
    RegTypeName      VARCHAR(1024),
    ClassProfileName VARCHAR(256),
    ClassLangName    VARCHAR(256),

    CONSTRAINT fk_student_area
        FOREIGN KEY (Area)
            REFERENCES Area (AreaID),

    CONSTRAINT fk_student_school
        FOREIGN KEY (School)
            REFERENCES School (SchoolID)
);