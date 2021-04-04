CREATE TABLE Area
(
    AreaID      SERIAL PRIMARY KEY,

    RegName     VARCHAR(256),
    AreaName    VARCHAR(512),
    TerName     VARCHAR(256),
    TerTypeName VARCHAR(128) DEFAULT NULL,
    CONSTRAINT area_unique UNIQUE (RegName, AreaName, TerName)
);

