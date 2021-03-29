-- Create tables
CREATE TABLE StudentTable
(
    OUTID            UUID PRIMARY KEY,
    ExamYear         SMALLINT,
    Birth            SMALLINT,
    SexTypeName      VARCHAR(128),
    Regname          VARCHAR(256),
    AreaName         VARCHAR(512),
    TerName          VARCHAR(256),
    RegTypeName      VARCHAR(1024),
    TerTypeName      VARCHAR(128),
    ClassProfileName VARCHAR(256),
    ClassLangName    VARCHAR(256),
    EOName           TEXT,
    EOTypeName       VARCHAR(512),
    EORegName        TEXT,
    EOAreaName       VARCHAR(512),
    EOTerName        VARCHAR(512),
    EOParent         TEXT
);

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

-- Insert students info
INSERT INTO StudentTable (OUTID,
                          Birth,
                          SexTypeName,
                          Regname,
                          AreaName,
                          TerName,
                          RegTypeName,
                          TerTypeName,
                          ClassProfileName,
                          ClassLangName,
                          EOName,
                          EOTypeName,
                          EORegName,
                          EOAreaName,
                          EOTerName,
                          EOParent,
                          ExamYear)
SELECT OUTID,
       Birth,
       SEXTYPENAME,
       REGNAME,
       AREANAME,
       TERNAME,
       REGTYPENAME,
       TerTypeName,
       ClassProfileNAME,
       ClassLangName,
       EONAME,
       EOTYPENAME,
       EORegName,
       EOAreaName,
       EOTerName,
       EOParent,
       examYear

FROM TestTable;

-- Insert data by subjects
INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'Ukr',
       UkrTest,
       UkrTestStatus,
       UkrPTName,
       UkrPTRegName,
       UkrPTAreaName,
       UkrPTTerName,
       UkrBall100,
       UkrBall12,
       UkrBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'hist',
       histTest,
       histTestStatus,
       histPTName,
       histPTRegName,
       histPTAreaName,
       histPTTerName,
       histBall100,
       histBall12,
       histBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'math',
       mathTest,
       mathTestStatus,
       mathPTName,
       mathPTRegName,
       mathPTAreaName,
       mathPTTerName,
       mathBall100,
       mathBall12,
       mathBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'phys',
       physTest,
       physTestStatus,
       physPTName,
       physPTRegName,
       physPTAreaName,
       physPTTerName,
       physBall100,
       physBall12,
       physBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'chem',
       chemTest,
       chemTestStatus,
       chemPTName,
       chemPTRegName,
       chemPTAreaName,
       chemPTTerName,
       chemBall100,
       chemBall12,
       chemBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'bio',
       bioTest,
       bioTestStatus,
       bioPTName,
       bioPTRegName,
       bioPTAreaName,
       bioPTTerName,
       bioBall100,
       bioBall12,
       bioBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball)
SELECT OUTID,
       'geo',
       geoTest,
       geoTestStatus,
       geoPTName,
       geoPTRegName,
       geoPTAreaName,
       geoPTTerName,
       geoBall100,
       geoBall12,
       geoBall

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball,
 DPALevel)
SELECT OUTID,
       'eng',
       engTest,
       engTestStatus,
       engPTName,
       engPTRegName,
       engPTAreaName,
       engPTTerName,
       engBall100,
       engBall12,
       engBall,
       engDPALevel

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball,
 DPALevel)
SELECT OUTID,
       'fra',
       fraTest,
       fraTestStatus,
       fraPTName,
       fraPTRegName,
       fraPTAreaName,
       fraPTTerName,
       fraBall100,
       fraBall12,
       fraBall,
       fraDPALevel

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball,
 DPALevel)
SELECT OUTID,
       'deu',
       deuTest,
       deuTestStatus,
       deuPTName,
       deuPTRegName,
       deuPTAreaName,
       deuPTTerName,
       deuBall100,
       deuBall12,
       deuBall,
       deuDPALevel

FROM TestTable;

INSERT INTO SubjectTable
(OUTID,
 SubjType,
 Test,
 TestStatus,
 PTName,
 PTRegName,
 PTAreaName,
 PTTerName,
 Ball100,
 Ball12,
 Ball,
 DPALevel)
SELECT OUTID,
       'spa',
       spaTest,
       spaTestStatus,
       spaPTName,
       spaPTRegName,
       spaPTAreaName,
       spaPTTerName,
       spaBall100,
       spaBall12,
       spaBall,
       spaDPALevel
FROM TestTable;


-- Delete previous table
DROP TABLE TestTable;