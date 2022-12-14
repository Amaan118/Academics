USE MAINDB;

CREATE TABLE SUPPLIER(
SNO INT PRIMARY KEY,
SNAME VARCHAR(25) NOT NULL,
CITY VARCHAR(50) NOT NULL,
STATE VARCHAR(50) NOT NULL
);

CREATE TABLE PARTS(
PNO INT PRIMARY KEY,
PNAME VARCHAR(25) NOT NULL,
CATEGORY VARCHAR(50) NOT NULL
);

CREATE TABLE SUPPLIER_PART(
SNO INT,
PNO INT,
PRIMARY KEY(SNO, PNO),
QTY INT
);


INSERT INTO SUPPLIER VALUES
(1, "AMAAN KHAN",  "SOLAPUR", "MAHARASHTRA"),
(2, "JASRAJ SINGH",  "NANDED", "MAHARASHTRA"),
(3, "JAGJYOT SINGH",  "BIDAR", "KARNATAKA"),
(4, "ATHARV SHINDE",  "GULBARGA", "KARNATAKA"),
(5, "JOHN DOE",  "BANGLORE", "MAHARASHTRA")
;
SELECT * FROM SUPPLIER;

INSERT INTO PARTS VALUES
(25, "ENGINE", "2-WHEELER"),
(91, "CARBORATOR", "2-WHEELER"),
(143, "CLUTCHPLATE", "4-WHEELER"),
(178, "TIRES", "2-WHEELER"),
(205, "GEAR", "4-WHEELER"),
(291, "HEADLIGHTS", "4-WHEELER"),
(301, "MUD GUARD",  "2-WHEELER"),
(400, "SUSPENSIONS", "4-WHEELER"),
(450, "SUSPENSIONS", "2-WHEELER"),
(478, "HORN", "4-WHEELER")
;
SELECT * FROM PARTS;

INSERT INTO SUPPLIER_PART VALUES
(1, 178, 8),
(1, 300, 15),
(2, 91, 4),
(2, 478, 25),
(3, 25, 10),
(3, 143, 15),
(4, 205, 19),
(4, 450, 30),
(5, 400, 12),
(5, 291, 21)
;
SELECT * FROM SUPPLIER_PART;

CREATE DATABASE STATES;
USE STATES;

CREATE TABLE MH AS (SELECT * FROM SUPPLIER WHERE STATE = "MAHARASHTRA");
CREATE TABLE KR AS (SELECT * FROM SUPPLIER WHERE STATE = "KARNATAKA");

-- CREATE DATABASE PARTS_FRAGMENTS;
-- USE PARTS_FRAGMENTS;

CREATE TABLE FRAGMENT1 AS (SELECT * FROM PARTS WHERE PNO >= 1 AND PNO <= 100);
CREATE TABLE FRAGMENT2 AS (SELECT * FROM PARTS WHERE PNO >= 101 AND PNO <= 200);
CREATE TABLE FRAGMENT3 AS (SELECT * FROM PARTS WHERE PNO >= 201 AND PNO <= 300);
CREATE TABLE FRAGMENT4 AS (SELECT * FROM PARTS WHERE PNO >= 301 AND PNO <= 400);
CREATE TABLE FRAGMENT5 AS (SELECT * FROM PARTS WHERE PNO >= 401 AND PNO <= 500);


-- CREATE DATABASE SUPPLIER_PART_FRAGMENTS;
-- USE SUPPLIER_PART_FRAGMENTS;

CREATE TABLE FRAGMENT1 AS (SELECT * FROM SUPPLIER_PARTS WHERE PNO >= 1 AND PNO <= 10);
CREATE TABLE FRAGMENT2 AS (SELECT * FROM SUPPLIER_PARTS WHERE PNO >= 11 AND PNO <= 21);
CREATE TABLE FRAGMENT3 AS (SELECT * FROM SUPPLIER_PARTS WHERE PNO >= 21 AND PNO <= 30);


-- QUERIES ON DATABASES
-- 1. DISPLAY ALL THE TWO-WHEELER PARTS IMPORTED/EXPORTED BY MAHARASHTRA
SELECT SUM(QTY) FROM SUPPLIER_PART WHERE SNO IN (SELECT SNO FROM MH);