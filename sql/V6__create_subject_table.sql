CREATE TABLE Subject
(
    SubjectID  SERIAL PRIMARY KEY,
    Test VARCHAR(256),
    CONSTRAINT  subject_unique UNIQUE (Test)

);