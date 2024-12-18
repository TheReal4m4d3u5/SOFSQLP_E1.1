




-- Write SQL DDL corresponding to the schema in Figure 3.18.
-- Make any reasonable assumptions about data types, and be sure to declare primary and foreign keys.

CREATE TABLE Person (
    driver_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

-- Create Car table
CREATE TABLE Car (
    license VARCHAR(15) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

-- Create Accident table
CREATE TABLE Accident (
    report_number VARCHAR(15) PRIMARY KEY,
    date DATE,
    location VARCHAR(100)
);

-- Create Owns table
CREATE TABLE Owns (
    driver_id VARCHAR(10),
    license VARCHAR(15),
    PRIMARY KEY (driver_id, license),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id),
    FOREIGN KEY (license) REFERENCES Car(license)
);

-- Create Participated table
CREATE TABLE Participated (
    license VARCHAR(15),
    report_number VARCHAR(15),
    damage_amount DECIMAL(10, 2),
    PRIMARY KEY (license, report_number),
    FOREIGN KEY (license) REFERENCES Car(license),
    FOREIGN KEY (report_number) REFERENCES Accident(report_number)
);