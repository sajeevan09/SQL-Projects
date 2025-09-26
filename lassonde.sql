CREATE schema engineeringCanada;
CREATE database lassondeEngineering;
use engineeringCanada;

create table Course(
CourseCode VARCHAR(8) Primary Key,
CourseName VARCHAR(100) not null,
DepartmentID int);
show tables;

Create table Product(
ProductID Integer Primary key not null,
ProductDescription varchar(50), 
Finish Varchar(20) Check (Finish IN ('Cherry', 'Natural Ash', 'White Ash')),
unitPrice Decimal(6, 2));
show tables;

create table CLO(
CLO_ID int primary key auto_increment);


create table GraduateAttribute(
GA_ID int Primary key,
Name VARCHAR(100) not null);

create table GraduateAttributeIndicator(
GAI_ID int Primary key auto_increment,
Description text not null,
GA_ID int,
foreign key (GA_ID) references GraduateAttribute(GA_ID));

create table Discipline(
DisciplineID int Primary key auto_increment,
Name VARCHAR(100) not null,
Type ENUM('Compulsory', 'Elective') not null);

create table CLO_GA(
CLO_ID int,
GA_ID int,
Primary key (CLO_ID, GA_ID),
foreign key (CLO_ID) references CLO(CLO_ID),
foreign key (GA_ID) references GraduateAttributes(GA_ID));

create table Course_Discipline(
CourseCode VARCHAR(8),
DisciplineID int, 
RequirementLevel ENUM('Compulsory', 'Elective') not null, 
Primary key (CourseCode, DisciplineID),
foreign key (CourseCode) references Course(CourseCode),
foreign key (disciplineID) references Discipline(DisciplineID));

create table Level(
LevelCode CHAR(1) Primary Key,
LevelName VARCHAR(50) not null);

create table GA_Assesment(
CourseCode VARCHAR(8),
GA_ID int,
LevelCode CHAR(1),
Primary key (CourseCode, GA_ID),
foreign key (courseCode) references Course(CourseCode),
foreign key (GA_ID) references GraduateAttribute(GA_ID),
foreign key (LevelCode) References Level(LevelCode));
show tables;

