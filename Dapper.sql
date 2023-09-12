CREATE DATABASE IF NOT EXISTS Dapper;

USE Dapper;

CREATE TABLE IF NOT EXISTS Species (
    speciesId INT AUTO_INCREMENT PRIMARY KEY,
    speciesName VARCHAR(64),
    breed VARCHAR(64),
    HeartRateLowAlarm DOUBLE,
    HeartRateHighAlarm DOUBLE,
    RespiratoryRateLowAlarm DOUBLE,
    RespiratoryRateHighAlarm DOUBLE,
    CoreTempLowAlarm DOUBLE,
    CoreTempHighAlarm DOUBLE
);

CREATE TABLE IF NOT EXISTS Animals (
    animalId INT AUTO_INCREMENT PRIMARY KEY,
    speciesId INT,
    name VARCHAR(64),
    weight DOUBLE,
    age INT,
    sex VARCHAR(50),
    healthHistory VARCHAR(128),
    diagnosis VARCHAR(128),
    ownerName VARCHAR(64),
    ownerNumber VARCHAR(20),
    FOREIGN KEY (speciesId) REFERENCES Species(speciesId)
);

CREATE TABLE IF NOT EXISTS Users (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    animalId INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    password VARCHAR(255),
    FOREIGN KEY (animalId) REFERENCES Animals(animalId)
);

CREATE TABLE IF NOT EXISTS TemporaryUsers (
    tempUserId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    animalId INT,
    firstName VARCHAR(64),
    lastName VARCHAR(64),
    specialization VARCHAR(128),
    contactNumber VARCHAR(20),
    userName VARCHAR(64),
    password VARCHAR(255),
    time TIME,
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (animalId) REFERENCES Animals(animalId)
);

CREATE TABLE IF NOT EXISTS Reports (
    reportId INT AUTO_INCREMENT PRIMARY KEY,
    animalId INT,
    userId INT,
    tempUserId INT,
    description VARCHAR(128),
    reportDate DATE,
    timeAlarm TIME,
    averageHeartTemp DOUBLE,
    averageRespiTemp DOUBLE,
    averageCoreTemp DOUBLE,
    heartRate DOUBLE,
    respiRate DOUBLE,
    coreTempRate DOUBLE,
    Notes VARCHAR(255),
    FOREIGN KEY (animalId) REFERENCES Animals(animalId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (tempUserId) REFERENCES TemporaryUsers(tempUserId)
);
