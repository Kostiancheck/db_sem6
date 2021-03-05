CREATE TABLE {table_name} (OutID UUID,
    SubjType VARCHAR (64),
    Test VARCHAR (512),
    TestStatus VARCHAR (256),
    PTName TEXT,
    PTRegName TEXT ,
    PTAreaName VARCHAR (512),
    PTTerName VARCHAR (256),
    Ball100 SMALLINT ,
    Ball12 SMALLINT ,
    Ball SMALLINT ,
    DPALevel SMALLINT ,
    AdaptScale SMALLINT DEFAULT 0,
    PRIMARY KEY (OutID, SubjType),
    CONSTRAINT fk_student
        FOREIGN KEY(Outid)
        REFERENCES {fk_table}(Outid)
    );

