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
 AdaptScale)
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
       UkrBall,
       UkrAdaptScale
FROM TestTable
WHERE UkrTest IS NOT NULL
   OR UkrTestStatus IS NOT NULL
   OR UkrPTName IS NOT NULL
   OR UkrPTRegName IS NOT NULL
   OR UkrPTAreaName IS NOT NULL
   OR UkrPTTerName IS NOT NULL
   OR UkrBall100 IS NOT NULL
   OR UkrBall12 IS NOT NULL
   OR UkrBall IS NOT NULL;


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

FROM TestTable
WHERE histTest IS NOT NULL
   OR histTestStatus IS NOT NULL
   OR histPTName IS NOT NULL
   OR histPTRegName IS NOT NULL
   OR histPTAreaName IS NOT NULL
   OR histPTTerName IS NOT NULL
   OR histBall100 IS NOT NULL
   OR histBall12 IS NOT NULL
   OR histBall IS NOT NULL;


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

FROM TestTable
WHERE mathTest IS NOT NULL
   OR mathTestStatus IS NOT NULL
   OR mathPTName IS NOT NULL
   OR mathPTRegName IS NOT NULL
   OR mathPTAreaName IS NOT NULL
   OR mathPTTerName IS NOT NULL
   OR mathBall100 IS NOT NULL
   OR mathBall12 IS NOT NULL
   OR mathBall IS NOT NULL;


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
FROM TestTable
WHERE physTest IS NOT NULL
   OR physTestStatus IS NOT NULL
   OR physPTName IS NOT NULL
   OR physPTRegName IS NOT NULL
   OR physPTAreaName IS NOT NULL
   OR physPTTerName IS NOT NULL
   OR physBall100 IS NOT NULL
   OR physBall12 IS NOT NULL
   OR physBall IS NOT NULL;


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
FROM TestTable
WHERE chemTest IS NOT NULL
   OR chemTestStatus IS NOT NULL
   OR chemPTName IS NOT NULL
   OR chemPTRegName IS NOT NULL
   OR chemPTAreaName IS NOT NULL
   OR chemPTTerName IS NOT NULL
   OR chemBall100 IS NOT NULL
   OR chemBall12 IS NOT NULL
   OR chemBall IS NOT NULL;


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

FROM TestTable
WHERE bioTest IS NOT NULL
   OR bioTestStatus IS NOT NULL
   OR bioPTName IS NOT NULL
   OR bioPTRegName IS NOT NULL
   OR bioPTAreaName IS NOT NULL
   OR bioPTTerName IS NOT NULL
   OR bioBall100 IS NOT NULL
   OR bioBall12 IS NOT NULL
   OR bioBall IS NOT NULL;


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

FROM TestTable
WHERE geoTest IS NOT NULL
   OR geoTestStatus IS NOT NULL
   OR geoPTName IS NOT NULL
   OR geoPTRegName IS NOT NULL
   OR geoPTAreaName IS NOT NULL
   OR geoPTTerName IS NOT NULL
   OR geoBall100 IS NOT NULL
   OR geoBall12 IS NOT NULL
   OR geoBall IS NOT NULL;


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

FROM TestTable
WHERE engTest IS NOT NULL
   OR engTestStatus IS NOT NULL
   OR engPTName IS NOT NULL
   OR engPTRegName IS NOT NULL
   OR engPTAreaName IS NOT NULL
   OR engPTTerName IS NOT NULL
   OR engBall100 IS NOT NULL
   OR engBall12 IS NOT NULL
   OR engBall IS NOT NULL
   OR engDPALevel IS NOT NULL;


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

FROM TestTable
WHERE fraTest IS NOT NULL
   OR fraTestStatus IS NOT NULL
   OR fraPTName IS NOT NULL
   OR fraPTRegName IS NOT NULL
   OR fraPTAreaName IS NOT NULL
   OR fraPTTerName IS NOT NULL
   OR fraBall100 IS NOT NULL
   OR fraBall12 IS NOT NULL
   OR fraBall IS NOT NULL
   OR fraDPALevel IS NOT NULL;


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

FROM TestTable
WHERE deuTest IS NOT NULL
   OR deuTestStatus IS NOT NULL
   OR deuPTName IS NOT NULL
   OR deuPTRegName IS NOT NULL
   OR deuPTAreaName IS NOT NULL
   OR deuPTTerName IS NOT NULL
   OR deuBall100 IS NOT NULL
   OR deuBall12 IS NOT NULL
   OR deuBall IS NOT NULL
   OR deuDPALevel IS NOT NULL;


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

FROM TestTable
WHERE spaTest IS NOT NULL
   OR spaTestStatus IS NOT NULL
   OR spaPTName IS NOT NULL
   OR spaPTRegName IS NOT NULL
   OR spaPTAreaName IS NOT NULL
   OR spaPTTerName IS NOT NULL
   OR spaBall100 IS NOT NULL
   OR spaBall12 IS NOT NULL
   OR spaBall IS NOT NULL
   OR spaDPALevel IS NOT NULL;



