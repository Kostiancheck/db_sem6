INSERT INTO School (Area,
                    Name,
                    TypeName,
                    Parent)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.EORegName = area.RegName
                   AND tt.EOAreaName = area.AreaName
                   AND tt.EOTerName = area.TerName) as area,
                tt.EOName,
                tt.EOTypeName,
                tt.EOParent
FROM TestTable as tt ON CONFLICT DO NOTHING;


INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.UkrPTRegName = area.RegName
                   AND tt.UkrPTAreaName = area.AreaName
                   AND tt.UkrPTTerName = area.TerName) as area,
                tt.UkrPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.histPTRegName = area.RegName
                   AND tt.histPTAreaName = area.AreaName
                   AND tt.histPTTerName = area.TerName) as area,
                tt.histPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.mathPTRegName = area.RegName
                   AND tt.mathPTAreaName = area.AreaName
                   AND tt.mathPTTerName = area.TerName) as area,
                tt.mathPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.physPTRegName = area.RegName
                   AND tt.physPTAreaName = area.AreaName
                   AND tt.physPTTerName = area.TerName) as area,
                tt.physPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.chemPTRegName = area.RegName
                   AND tt.chemPTAreaName = area.AreaName
                   AND tt.chemPTTerName = area.TerName) as area,
                tt.chemPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.bioPTRegName = area.RegName
                   AND tt.bioPTAreaName = area.AreaName
                   AND tt.bioPTTerName = area.TerName) as area,
                tt.bioPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.geoPTRegName = area.RegName
                   AND tt.geoPTAreaName = area.AreaName
                   AND tt.geoPTTerName = area.TerName) as area,
                tt.geoPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.engPTRegName = area.RegName
                   AND tt.engPTAreaName = area.AreaName
                   AND tt.engPTTerName = area.TerName) as area,
                tt.engPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.fraPTRegName = area.RegName
                   AND tt.fraPTAreaName = area.AreaName
                   AND tt.fraPTTerName = area.TerName) as area,
                tt.fraPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.deuPTRegName = area.RegName
                   AND tt.deuPTAreaName = area.AreaName
                   AND tt.deuPTTerName = area.TerName) as area,
                tt.deuPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;

INSERT INTO School (Area,
                    Name)
SELECT DISTINCT (SELECT AreaID
                 FROM Area as area
                 WHERE tt.spaPTRegName = area.RegName
                   AND tt.spaPTAreaName = area.AreaName
                   AND tt.spaPTTerName = area.TerName) as area,
                tt.spaPTName
FROM TestTable as tt ON CONFLICT DO NOTHING;
