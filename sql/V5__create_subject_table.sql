CREATE TABLE SubjectTable
(
    OUTID      UUID,
    SubjType   VARCHAR(64),
    Test       VARCHAR(512),
    TestStatus VARCHAR(256),
    PTName     TEXT,
    PTRegName  TEXT,
    PTAreaName VARCHAR(512),
    PTTerName  VARCHAR(256),
    Ball100    FLOAT,
    Ball12     FLOAT,
    Ball       FLOAT,
    DPALevel   VARCHAR(128) DEFAULT NULL,
    AdaptScale SMALLINT DEFAULT NULL,
    PRIMARY KEY (OUTID, SubjType),
    CONSTRAINT fk_student
        FOREIGN KEY (OUTID)
            REFERENCES StudentTable (OUTID)
);
