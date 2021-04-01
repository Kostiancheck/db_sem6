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

