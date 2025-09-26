
create table Course(
CourseCode VARCHAR(8) Primary Key,
CourseName VARCHAR(100) not null,
DepartmentID int);
show tables;

create table CLO(
CLO_ID INT PRIMARY KEY AUTO_INCREMENT,
Description TEXT,
CourseCode VARCHAR(8),
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode));
show tables;

create table GraduateAttribute(
GA_ID INT PRIMARY KEY,
Name VARCHAR(50));
show tables;

create table GraduateAttributeIndicator(
GAI_ID INT PRIMARY KEY AUTO_INCREMENT,
Description TEXT,
GA_ID INT,
FOREIGN KEY (GA_ID) REFERENCES GraduateAttribute(GA_ID));
show tables;

create table Discipline(
DisciplineID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100),
Type ENUM('Compulsory', 'Elective'));
show tables;

create table CLO_GA(
CLO_ID INT,
GA_ID INT,
PRIMARY KEY (CLO_ID, GA_ID),
FOREIGN KEY (CLO_ID) REFERENCES CLO(CLO_ID),
FOREIGN KEY (GA_ID) REFERENCES GraduateAttribute(GA_ID));
show tables;

create table Course_Discipline(
CourseCode VARCHAR(8),
DisciplineID INT,
RequirementLevel ENUM('Compulsory', 'Elective') NOT NULL,
PRIMARY KEY (CourseCode, DisciplineID),
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
FOREIGN KEY (DisciplineID) REFERENCES Discipline(DisciplineID));
show tables;

create table Level(
LevelCode CHAR(1) PRIMARY KEY,
LevelName VARCHAR(50) NOT NULL );
show tables;

create table GA_Assessment(
CourseCode VARCHAR(8),
GA_ID INT,
LevelCode CHAR(1),
PRIMARY KEY (CourseCode, GA_ID),
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
FOREIGN KEY (GA_ID) REFERENCES GraduateAttribute(GA_ID),
FOREIGN KEY (LevelCode) REFERENCES Level(LevelCode));
show tables;

