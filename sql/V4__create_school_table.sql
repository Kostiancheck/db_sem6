CREATE TABLE School
(
    SchoolID   SERIAL PRIMARY KEY,
    Area       INT,

    Name     TEXT,
    TypeName VARCHAR(512) DEFAULT NULL,
    Parent   TEXT DEFAULT NULL,

    CONSTRAINT  school_unique UNIQUE (NAME),
    CONSTRAINT fk_school_area
        FOREIGN KEY (Area)
            REFERENCES Area (AreaID)
);