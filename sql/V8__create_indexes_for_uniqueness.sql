CREATE
UNIQUE INDEX school_unique_index ON
School ((Name IS NULL))
WHERE Name IS NULL;

CREATE
UNIQUE INDEX subject_unique_index ON
Subject ((Test IS NULL))
WHERE Test IS NULL;