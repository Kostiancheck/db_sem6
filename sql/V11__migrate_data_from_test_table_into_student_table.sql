INSERT INTO Student (OUTID,
                     ExamYear,
                     Birth,
                     SexTypeName,
                     RegTypeName,
                     ClassProfileName,
                     ClassLangName,
                     Area,
                     School)
SELECT OUTID,
       ExamYear,
       Birth,
       SexTypeName,
       RegTypeName,
       ClassProfileName,
       ClassLangName,
       (SELECT AreaID
        FROM Area as area
        WHERE tt.RegName = area.RegName
          AND tt.AreaName = area.AreaName
          AND tt.TerName = area.TerName) as area,
       (SELECT SchoolID
        FROM School as school
        WHERE tt.EOName = school.Name)   as school
FROM TestTable as tt;

