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

-- delete rows with null values
DELETE
FROM SubjectTable
WHERE spaTest IS NULL
  AND spaTestStatus IS NULL
  AND spaPTName IS NULL
  AND spaPTRegName IS NULL
  AND spaPTAreaName IS NULL
  AND spaPTTerName IS NULL
  AND spaBall100 IS NULL
  AND spaBall12 IS NULL
  AND spaBall IS NULL
  AND spaDPALevel IS NULL;