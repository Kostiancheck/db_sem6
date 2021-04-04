INSERT INTO Area (RegName,
                  AreaName,
                  TerName,
                  TerTypeName)
SELECT DISTINCT Regname,
                AreaName,
                TerName,
                TerTypeName
FROM TestTable
ON CONFLICT DO NOTHING;


INSERT INTO Area (RegName,
                  AreaName,
                  TerName)
SELECT DISTINCT EORegName,
                EOAreaName,
                EOTerName
FROM TestTable
ON CONFLICT DO NOTHING;


