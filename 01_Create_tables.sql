 /*
 Author: Dominik Piliszek-Słowiński
 Date: march/april 2018
 Version 1.0
 
 Script creating tables for datamodel
 */



DROP TABLE `Profile`;


DROP TABLE `Contact`;


DROP TABLE `PersonHst`;


DROP TABLE `Person`;



-- ************************************** `Person`

CREATE TABLE `Person`
(
 `PersonID`            INT unsigned NOT NULL AUTO_INCREMENT ,
 `Name`                VARCHAR(50) NOT NULL ,
 `Surname`             VARCHAR(50) NOT NULL ,
 `University_Profile`  VARCHAR(100) ,
 `Full_Course_Name`    VARCHAR(200) ,
 `Academic_Year`       TINYINT unsigned ,
 `Description`         TEXT COMMENT 'Short description providing personal motivation behind application' ,
 `Organization_Status` TINYINT unsigned NOT NULL DEFAULT 0 COMMENT 'Status mapping
0 - applicated and not recruited
1 - succesful application
2 - regular member
3 - project key person (local level)
4 - organization key person (local level)
5 - project key person (global level)
6 - organization key person (global level)
7 - board member
8 - alumni' ,
 `Insert_Date`         DATE NOT NULL ,
 `Update_Date`         DATE NOT NULL ,
 `CV_File`             MEDIUMBLOB NOT NULL ,
 `Additional_File`     MEDIUMBLOB COMMENT 'There is possibility to upload additional file.' ,
 `Region`              VARCHAR(45) ,

PRIMARY KEY (`PersonID`)
);





-- ************************************** `Profile`

CREATE TABLE `Profile`
(
 `PersonID`                 INT unsigned NOT NULL ,
 `ProfileID`                INT unsigned NOT NULL AUTO_INCREMENT ,
 `Group_Work`               TINYINT unsigned NOT NULL ,
 `People_Management`        TINYINT unsigned NOT NULL ,
 `Decisionmaking`           TINYINT unsigned NOT NULL ,
 `Individual_Work`          TINYINT unsigned NOT NULL ,
 `Interpersonal_Skills`     TINYINT unsigned NOT NULL ,
 `Public_Speaking`          TINYINT unsigned NOT NULL ,
 `Sales`                    TINYINT unsigned NOT NULL ,
 `Negotioation_Skills`      TINYINT unsigned NOT NULL ,
 `Public_Funds_Application` TINYINT unsigned NOT NULL ,
 `Project_Managing`         TINYINT unsigned NOT NULL ,
 `Capywriting`              TINYINT unsigned NOT NULL ,
 `Social_Media`             TINYINT unsigned NOT NULL ,
 `Programming`              TINYINT unsigned NOT NULL ,
 `Graphic_Design`           TINYINT NOT NULL ,
 `WWW_Development`          TINYINT unsigned NOT NULL ,

PRIMARY KEY (`PersonID`, `ProfileID`),
KEY `fkIdx_58` (`PersonID`),
CONSTRAINT `FK_58` FOREIGN KEY `fkIdx_58` (`PersonID`) REFERENCES `Person` (`PersonID`)
);





-- ************************************** `Contact`

CREATE TABLE `Contact`
(
 `PersonID`     INT unsigned NOT NULL ,
 `ContactID`    INT unsigned NOT NULL AUTO_INCREMENT ,
 `Contact_Type` TINYINT unsigned NOT NULL COMMENT '0 - telephone
1 - external email
2 - internal email' ,
 `Contact`      VARCHAR(60) NOT NULL ,

PRIMARY KEY (`PersonID`, `ContactID`),
KEY `fkIdx_43` (`PersonID`),
CONSTRAINT `FK_43` FOREIGN KEY `fkIdx_43` (`PersonID`) REFERENCES `Person` (`PersonID`)
);





-- ************************************** `PersonHst`

CREATE TABLE `PersonHst`
(
 `PersonID`            INT unsigned NOT NULL ,
 `Valid_From`          DATE NOT NULL ,
 `Name`                VARCHAR(50) NOT NULL ,
 `Surname`             VARCHAR(50) NOT NULL ,
 `University_Profile`  VARCHAR(100) ,
 `Full_course_Name`    VARCHAR(200) ,
 `Academic_Year`       TINYINT unsigned ,
 `Description`         TEXT ,
 `Organization_Status` TINYINT NOT NULL DEFAULT 0 ,
 `Valid_To`            DATE NOT NULL COMMENT 'Update date as Valid_to date. Inserted via trigger' ,
 `CV_File`             MEDIUMBLOB NOT NULL ,
 `Additional_File`     MEDIUMBLOB COMMENT 'Additional file' ,
 `Region`              VARCHAR(45) NOT NULL ,

PRIMARY KEY (`PersonID`, `Valid_From`),
KEY `fkIdx_27` (`PersonID`),
CONSTRAINT `FK_27` FOREIGN KEY `fkIdx_27` (`PersonID`) REFERENCES `Person` (`PersonID`)
);




