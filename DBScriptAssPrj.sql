USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'DB_ASSIGNMENT')
BEGIN
	ALTER DATABASE DB_ASSIGNMENT SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE DB_ASSIGNMENT SET ONLINE;
	DROP DATABASE DB_ASSIGNMENT;
END

GO

CREATE DATABASE DB_ASSIGNMENT
GO

USE DB_ASSIGNMENT
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[PackageTypes]    Script Date: 24/10/2022 23:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User](
	id int primary key,
	account nvarchar(50) not null,
	password nvarchar(50) not null
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Faculty(
	id nvarchar(10) primary key,
	name nvarchar(50) not null
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Semester(
	id nvarchar(10) primary key,
	name nvarchar(50) not null
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Student(
	id nvarchar(10) primary key,
	name nvarchar(50) not null,
	facultyID nvarchar(10) references Faculty(id)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE StudentSemester(
	stuID nvarchar(10) references Student(id),
	semID nvarchar(10) references Semester(id),
	primary key (stuID, semID)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Class(
	id nvarchar(10) primary key,
	facultyID nvarchar(10) references Faculty(id)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE StudentAndClass(
	stuID nvarchar(10) references Student(id),
	classID nvarchar(10) references Class(id),
	primary key (stuID, classID)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Subject(
	id nvarchar(10) primary key,
	name nvarchar(50) not null,
	numOfCredits int
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE SubjectClass(
	classID nvarchar(10) references Class(id),
	subjectID nvarchar(10) references Subject(id),
	primary key (classID, subjectID)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE StudentAndSubject(
	stuID nvarchar(10) references Student(id),
	subID nvarchar(10) references Subject(id),
	banStatus bit,
	primary key (stuID, subID)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Question(
	id int primary key,
	content nvarchar(2000) not null,
	subjectID nvarchar(10) references Subject(id)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Answer(
	id int primary key,
	content nvarchar(1000) not null,
	quesID int references Question(id)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE CorrectAns(
	id int primary key,
	correctAns int references Answer(id),
	quesID int references Question(id)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Test(
	id int primary key, 
	category nvarchar(50),
	weight int,
	subID nvarchar(10) not null references Subject(id),
	stuID nvarchar(10) not null references Student(id)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE QuestionOfTheTest(
	testID int references Test(id),
	questionID int,
	answerID int,
	trueOrFalse bit,
	qContent nvarchar(2000),
	aContent nvarchar(2000),
	caContent nvarchar(1000),
	yourAContent nvarchar(1000),
	primary key(testID, questionID)
)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Mark(
	id int primary key,
	value int check(value >= 0 and value <=10),
	testID int references Test(id)
)
GO
INSERT INTO [User](id, account, password) VALUES(1, 'admin', '123')
INSERT INTO [User](id, account, password) VALUES(2, 'tadai', 'admindai')
INSERT INTO [User](id, account, password) VALUES(3, 'tientd', 'admintien')
GO
INSERT INTO Faculty(id, name) VALUES('SE', 'Software Engineering')
INSERT INTO Faculty(id, name) VALUES('IA', 'Information Assurance')
INSERT INTO Faculty(id, name) VALUES('AI', 'Artificial Intelligence')
INSERT INTO Faculty(id, name) VALUES('IS', 'Information System')

INSERT INTO Faculty(id, name) VALUES('DM', 'Digital Marketing')
INSERT INTO Faculty(id, name) VALUES('EL', 'English Language')
INSERT INTO Faculty(id, name) VALUES('JP', 'Japanese')
INSERT INTO Faculty(id, name) VALUES('KR', 'Korean')
GO
INSERT INTO Semester(id, name) VALUES('SP', 'Spring')
INSERT INTO Semester(id, name) VALUES('SU', 'Summer')
INSERT INTO Semester(id, name) VALUES('FA', 'Fall')
GO
INSERT INTO Student(id, name, facultyID) VALUES('HE161138', 'TaVanDai', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161139', 'LeTuanAnh', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161340', 'NguyenPhuongDuy', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161447', 'DoTrongTuan', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161481', 'MaiNgocTu', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161557', 'LuuVanHuu', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161733', 'VuDuyHung', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161843', 'DaoXuanTrung', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE161924', 'NguyenTienDat', 'SE')
INSERT INTO Student(id, name, facultyID) VALUES('HE163206', 'LeManhTri', 'SE')

INSERT INTO Student(id, name, facultyID) VALUES('IA163375', 'NguyenTienNam', 'IA')
INSERT INTO Student(id, name, facultyID) VALUES('IA163416', 'PhamTuanAnh', 'IA')
INSERT INTO Student(id, name, facultyID) VALUES('IA163442', 'PhamThuLan', 'IA')
INSERT INTO Student(id, name, facultyID) VALUES('IA163473', 'LeMinhNam', 'IA')
INSERT INTO Student(id, name, facultyID) VALUES('IA163528', 'NguyenTienThanh', 'IA')

INSERT INTO Student(id, name, facultyID) VALUES('AI163634', 'NguyenDinhHoangAnh', 'AI')
INSERT INTO Student(id, name, facultyID) VALUES('AI163789', 'HaAnhDung', 'AI')
INSERT INTO Student(id, name, facultyID) VALUES('AI163795', 'NguyenDucLinh', 'AI')

INSERT INTO Student(id, name, facultyID) VALUES('IS163893', 'LeBaTrinh', 'IS')
INSERT INTO Student(id, name, facultyID) VALUES('IS170833', 'NguyenPhungThinh', 'IS')

INSERT INTO Student(id, name, facultyID) VALUES('DM171777', 'DongTrungHieu', 'DM')
INSERT INTO Student(id, name, facultyID) VALUES('DM176312', 'ChuDucDuong', 'DM')

INSERT INTO Student(id, name, facultyID) VALUES('EL163436', 'BuiPhuongLan', 'EL')
INSERT INTO Student(id, name, facultyID) VALUES('EL160192', 'VuongKienTrung', 'EL')

INSERT INTO Student(id, name, facultyID) VALUES('JP160813', 'VuongThanhDat', 'JP')
INSERT INTO Student(id, name, facultyID) VALUES('JP160975', 'DaoAnhTu', 'JP')

INSERT INTO Student(id, name, facultyID) VALUES('KR130687', 'PhamMaiSonTung', 'KR')
INSERT INTO Student(id, name, facultyID) VALUES('KR153240', 'CaoThinhHung', 'KR')
GO
INSERT INTO Class(id, facultyID) VALUES('SE1709', 'SE')
INSERT INTO Class(id, facultyID) VALUES('IA1701', 'IA')
INSERT INTO Class(id, facultyID) VALUES('AI1711', 'AI')
INSERT INTO Class(id, facultyID) VALUES('IS1722', 'IS')
INSERT INTO Class(id, facultyID) VALUES('EL1705', 'EL')
INSERT INTO Class(id, facultyID) VALUES('JP1707', 'JP')
INSERT INTO Class(id, facultyID) VALUES('KR1706', 'KR')
INSERT INTO Class(id, facultyID) VALUES('DM1702', 'DM')
GO
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161138', 'SE1709')--HE161138 HE161139 HE161140 HE161447 HE161481 HE161557 HE161733 HE161843 HE161924 HE163206
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161139', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161340', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161447', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161481', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161557', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161733', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161843', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE161924', 'SE1709')
INSERT INTO StudentAndClass(stuID, classID) VALUES('HE163206', 'SE1709')

INSERT INTO StudentAndClass(stuID, classID) VALUES('IA163375', 'IA1701') --IA163375 IA163416 IA163442 IA163473 IA163528
INSERT INTO StudentAndClass(stuID, classID) VALUES('IA163416', 'IA1701')
INSERT INTO StudentAndClass(stuID, classID) VALUES('IA163442', 'IA1701')
INSERT INTO StudentAndClass(stuID, classID) VALUES('IA163473', 'IA1701')
INSERT INTO StudentAndClass(stuID, classID) VALUES('IA163528', 'IA1701')

INSERT INTO StudentAndClass(stuID, classID) VALUES('AI163634', 'AI1711') --AI163634 AI163789 AI163795
INSERT INTO StudentAndClass(stuID, classID) VALUES('AI163789', 'AI1711')
INSERT INTO StudentAndClass(stuID, classID) VALUES('AI163795', 'AI1711')

INSERT INTO StudentAndClass(stuID, classID) VALUES('IS163893', 'IS1722') --IS163893 IS170833
INSERT INTO StudentAndClass(stuID, classID) VALUES('IS170833', 'IS1722')

INSERT INTO StudentAndClass(stuID, classID) VALUES('DM171777', 'DM1702') --DM171777 DM176312
INSERT INTO StudentAndClass(stuID, classID) VALUES('DM176312', 'DM1702')

INSERT INTO StudentAndClass(stuID, classID) VALUES('EL163436', 'EL1705') -- EL163436 EL160192
INSERT INTO StudentAndClass(stuID, classID) VALUES('EL160192', 'EL1705')

INSERT INTO StudentAndClass(stuID, classID) VALUES('JP160813', 'JP1707') --JP160813 JP160975
INSERT INTO StudentAndClass(stuID, classID) VALUES('JP160975', 'JP1707')

INSERT INTO StudentAndClass(stuID, classID) VALUES('KR130687', 'KR1706') --KR130687 KR153240
INSERT INTO StudentAndClass(stuID, classID) VALUES('KR153240', 'KR1706')
GO
INSERT INTO Subject(id, name, numOfCredits) VALUES('PRF192', 'Fundamental Programming', 3)
INSERT INTO Subject(id, name, numOfCredits) VALUES('MAE101', 'Mathematics for Engineering', 3)
INSERT INTO Subject(id, name, numOfCredits) VALUES('PRJ301', 'Java Web Application Development', 3)
INSERT INTO Subject(id, name, numOfCredits) VALUES('DBI202', 'Introduction to Databases', 3)
INSERT INTO Subject(id, name, numOfCredits) VALUES('OSG202', 'Operating Systems', 3)

INSERT INTO Subject(id, name, numOfCredits) VALUES('ECR201', 'Critical Reading', 3)
INSERT INTO Subject(id, name, numOfCredits) VALUES('SEM101', 'Semantics', 3)
GO
--HE161138 HE161139 HE161140 HE161447 HE161481 HE161557 HE161733 HE161843 HE161924 HE163206
--IA163375 IA163416 IA163442 IA163473 IA163528
--AI163634 AI163789 AI163795
--IS163893 IS170833
--DM171777 DM176312
-- EL163436 EL160192
--JP160813 JP160975
--KR130687 KR153240
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161138', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161139', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161340', 'MAE101', 1)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161447', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161481', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161557', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161733', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161843', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161924', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE163206', 'MAE101', 1)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163375', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163416', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163442', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163473', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('AI163634', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('AI163789', 'MAE101', 1)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('AI163795', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IS163893', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IS170833', 'MAE101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163528', 'MAE101', 0)

INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161138', 'PRF192', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161924', 'PRF192', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163473', 'PRF192', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('AI163789', 'PRF192', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IS170833', 'PRF192', 0)

INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161138', 'PRJ301', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161733', 'PRJ301', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IS170833', 'PRJ301', 1)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163528', 'PRJ301', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('AI163795', 'PRJ301', 0)

INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161481', 'DBI202', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163416', 'DBI202', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163528', 'DBI202', 1)

INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161138', 'OSG202', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('IA163416', 'OSG202', 1)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('HE161557', 'OSG202', 0)

INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('EL163436', 'ECR201', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('EL160192', 'ECR201', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('JP160813', 'ECR201', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('KR130687', 'ECR201', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('KR153240', 'ECR201', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('JP160975', 'ECR201', 0)

INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('KR130687', 'SEM101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('KR153240', 'SEM101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('JP160975', 'SEM101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('EL163436', 'SEM101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('EL160192', 'SEM101', 0)
INSERT INTO StudentAndSubject(stuID, subID, banStatus) VALUES('JP160813', 'SEM101', 0)
GO
--PRF192 MAE101 PRJ301 DBI202 OSG202 ECR201 SEM101
INSERT INTO Question(id, content, subjectID) VALUES(1, 'C99 standard guarantees uniqueness of ____ characters for internal names', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(1, '31', 1)
INSERT INTO Answer(id, content, quesID) VALUES(2, '63', 1)
INSERT INTO Answer(id, content, quesID) VALUES(3, '12', 1)
INSERT INTO Answer(id, content, quesID) VALUES(4, '14', 1)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(1, 2, 1)

INSERT INTO Question(id, content, subjectID) VALUES(2, 'C99 standard guarantess uniqueness of _____ characters for external names', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(5, '31', 2)
INSERT INTO Answer(id, content, quesID) VALUES(6, '6', 2)
INSERT INTO Answer(id, content, quesID) VALUES(7, '12', 2)
INSERT INTO Answer(id, content, quesID) VALUES(8, '14', 2)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(2, 5, 2)

INSERT INTO Question(id, content, subjectID) VALUES(3, 'Which of the following is not a valid variable name declaration?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(9, 'int __a3;', 3)
INSERT INTO Answer(id, content, quesID) VALUES(10, 'int __3a;', 3)
INSERT INTO Answer(id, content, quesID) VALUES(11, 'int __A3;', 3)
INSERT INTO Answer(id, content, quesID) VALUES(12, 'None of the mentioned', 3)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(3, 12, 3)

INSERT INTO Question(id, content, subjectID) VALUES(4, 'Variable names beginning with underscore is not encouraged. Why?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(13, 'It is not standardized', 4)
INSERT INTO Answer(id, content, quesID) VALUES(14, 'To avoid conflicts since assemblers and loaders use such names', 4)
INSERT INTO Answer(id, content, quesID) VALUES(15, 'To avoid conflicts since library routines use such names', 4)
INSERT INTO Answer(id, content, quesID) VALUES(16, 'To avoid conflicts with environment variables of an operating system', 4)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(4, 15, 4)

INSERT INTO Question(id, content, subjectID) VALUES(5, 'All keywords in C are in', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(17, 'LowerCase letters', 5)
INSERT INTO Answer(id, content, quesID) VALUES(18, 'UpperCase letters', 5)
INSERT INTO Answer(id, content, quesID) VALUES(19, 'CamelCase letters', 5)
INSERT INTO Answer(id, content, quesID) VALUES(20, 'None', 5)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(5, 17, 5)

INSERT INTO Question(id, content, subjectID) VALUES(6, 'Which of the following is not a valid C variable name?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(21, 'int number;', 6)
INSERT INTO Answer(id, content, quesID) VALUES(22, 'float rate;', 6)
INSERT INTO Answer(id, content, quesID) VALUES(23, 'int variable_count;', 6)
INSERT INTO Answer(id, content, quesID) VALUES(24, 'int $main;', 6)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(6, 24, 6)

INSERT INTO Question(id, content, subjectID) VALUES(7, 'Which of the following is not a valid variable name declaration?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(25, 'float PI = 3.14;', 7)
INSERT INTO Answer(id, content, quesID) VALUES(26, 'double PI = 3.14;', 7)
INSERT INTO Answer(id, content, quesID) VALUES(27, 'int PI = 3.14;', 7)
INSERT INTO Answer(id, content, quesID) VALUES(28, '#define PI 3.14', 7)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(7, 28, 7)

INSERT INTO Question(id, content, subjectID) VALUES(8, 'Which of the following cannot be a variable name in C?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(29, 'volatile', 8)
INSERT INTO Answer(id, content, quesID) VALUES(30, 'true', 8)
INSERT INTO Answer(id, content, quesID) VALUES(31, 'friend', 8)
INSERT INTO Answer(id, content, quesID) VALUES(32, 'export', 8)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(8, 29, 8)

INSERT INTO Question(id, content, subjectID) VALUES(9, 'The format identifier [%i] is also used for _____ data type?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(33, 'char', 9)
INSERT INTO Answer(id, content, quesID) VALUES(34, 'int', 9)
INSERT INTO Answer(id, content, quesID) VALUES(35, 'float', 9)
INSERT INTO Answer(id, content, quesID) VALUES(36, 'double', 9)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(9, 34, 9)

INSERT INTO Question(id, content, subjectID) VALUES(10, 'Which data type is most suitable for storing a number 65000 in a 32-bit system?', 'PRF192')
INSERT INTO Answer(id, content, quesID) VALUES(37, 'signed short', 10)
INSERT INTO Answer(id, content, quesID) VALUES(38, 'unsigned short', 10)
INSERT INTO Answer(id, content, quesID) VALUES(39, 'long', 10)
INSERT INTO Answer(id, content, quesID) VALUES(40, 'int', 10)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(10, 38, 10)

--MAE101
INSERT INTO Question(id, content, subjectID) VALUES(11, 'Which of the following statements are true? (u, v in R3)', 'MAE101')
INSERT INTO Answer(id, content, quesID) VALUES(41, '|| -5u || = -5|| u ||', 11)
INSERT INTO Answer(id, content, quesID) VALUES(42, '|| u-v || = || u || -|| v ||', 11)
INSERT INTO Answer(id, content, quesID) VALUES(43, 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 11)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(11, 43, 11)

INSERT INTO Question(id, content, subjectID) VALUES(12, 'Which of the following statements are true?', 'MAE101')
INSERT INTO Answer(id, content, quesID) VALUES(44, 'if {X, Y} is orthogonal in Rn then {X, X+Y} is also orthogonal.', 12)
INSERT INTO Answer(id, content, quesID) VALUES(45, 'if {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.', 12)
INSERT INTO Answer(id, content, quesID) VALUES(46, 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 12)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(12, 46, 12)

INSERT INTO Question(id, content, subjectID) VALUES(13, 'Let A be a 3 x 3 matrix. Choose correct statement', 'MAE101')
INSERT INTO Answer(id, content, quesID) VALUES(47, 'det(-A) = -det(A)', 13)
INSERT INTO Answer(id, content, quesID) VALUES(48, 'det(2A) = 2det(A)', 13)
INSERT INTO Answer(id, content, quesID) VALUES(49, 'det(A^T) = det(A)', 13)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(13, 49, 13)

INSERT INTO Question(id, content, subjectID) VALUES(14, 'If A and AB are invertible, which of the followingstatements are true?', 'MAE101')
INSERT INTO Answer(id, content, quesID) VALUES(50, 'B is invertible', 14)
INSERT INTO Answer(id, content, quesID) VALUES(51, 'BA = AB', 14)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(14, 50, 14)

INSERT INTO Question(id, content, subjectID) VALUES(15, 'For a homogeneous system of 4 equations in 5 unknowns, which of the following statements are true?', 'MAE101')
INSERT INTO Answer(id, content, quesID) VALUES(52, 'The system can be inconsistent.', 15)
INSERT INTO Answer(id, content, quesID) VALUES(53, 'The system can have a unique solution.', 15)
INSERT INTO Answer(id, content, quesID) VALUES(54, 'The system can have infinitely many solutions.', 15)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(15, 54, 15)

--PRJ301
INSERT INTO Question(id, content, subjectID) VALUES(16, 'Given the HTTP message fragment: HTTP/1.1 500 Internal Server Errors Choose the correct statement Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(55, 'The fragment message describes the request line of HTTP response message', 16)
INSERT INTO Answer(id, content, quesID) VALUES(56, 'The fragment message describes the status line of HTTP response message', 16)
INSERT INTO Answer(id, content, quesID) VALUES(57, 'The fragment message describes the status line of HTTP request message', 16)
INSERT INTO Answer(id, content, quesID) VALUES(58, 'The fragment message describes the header information of HTTP response message', 16)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(16, 56, 16)

INSERT INTO Question(id, content, subjectID) VALUES(17, 'Which scripting element lets you define methods or fields that get inserted into the main body of the servlet class (outside of the _jspService method that is called by service to process the request)? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(59, 'expression', 17)
INSERT INTO Answer(id, content, quesID) VALUES(60, 'scriptlet', 17)
INSERT INTO Answer(id, content, quesID) VALUES(61, 'declaration', 17)
INSERT INTO Answer(id, content, quesID) VALUES(62, 'comment', 17)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(17, 61, 17)

INSERT INTO Question(id, content, subjectID) VALUES(18, 'Which method returns the actual length of the request sent by the client? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(63, 'getContentLength()', 18)
INSERT INTO Answer(id, content, quesID) VALUES(64, 'getParameter()', 18)
INSERT INTO Answer(id, content, quesID) VALUES(65, 'getServerName()', 18)
INSERT INTO Answer(id, content, quesID) VALUES(66, 'getAttribute()', 18)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(18, 63, 18)

INSERT INTO Question(id, content, subjectID) VALUES(19, 'Which of the followings is a correct syntax of the method that is used to get the initialized parameter in ServletContext or ServletConfig? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(67, 'String getInitializedParameter(String name);', 19)
INSERT INTO Answer(id, content, quesID) VALUES(68, 'String getInitParameter(String name);', 19)
INSERT INTO Answer(id, content, quesID) VALUES(69, 'All of the others.', 19)
INSERT INTO Answer(id, content, quesID) VALUES(70, 'String getContextParameter(String name);', 19)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(19, 68, 19)

INSERT INTO Question(id, content, subjectID) VALUES(20, 'Which of the following statements about the Servlet is false? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(71, 'Servlets are portable', 20)
INSERT INTO Answer(id, content, quesID) VALUES(72, 'Initialization code in servlets is executed every time the program is made to run', 20)
INSERT INTO Answer(id, content, quesID) VALUES(73, 'None of the others', 20)
INSERT INTO Answer(id, content, quesID) VALUES(74, 'Servlets are easy to use', 20)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(20, 72, 20)

INSERT INTO Question(id, content, subjectID) VALUES(21, 'Which of the following attributes of the Page directive is used to specify the page to display errors which may occur in the JSP page? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(75, 'exception', 21)
INSERT INTO Answer(id, content, quesID) VALUES(76, 'isErrorPage', 21)
INSERT INTO Answer(id, content, quesID) VALUES(77, 'Error', 21)
INSERT INTO Answer(id, content, quesID) VALUES(78, 'errorPage', 21)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(21, 78, 21)

INSERT INTO Question(id, content, subjectID) VALUES(22, 'Which of the following attributes of the Page directive is used to specify the page to display errors which may occur in the JSP page? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(79, 'exception', 22)
INSERT INTO Answer(id, content, quesID) VALUES(80, 'isErrorPage', 22)
INSERT INTO Answer(id, content, quesID) VALUES(81, 'Error', 22)
INSERT INTO Answer(id, content, quesID) VALUES(82, 'errorPage', 22)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(22, 78, 22)

INSERT INTO Question(id, content, subjectID) VALUES(23, 'Name the implicit variable available to JSP pages that may be used to access all the other implicit objects. Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(83, 'pageContext', 23)
INSERT INTO Answer(id, content, quesID) VALUES(84, 'request', 23)
INSERT INTO Answer(id, content, quesID) VALUES(85, 'response', 23)
INSERT INTO Answer(id, content, quesID) VALUES(86, 'page', 23)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(23, 83, 23)
 
INSERT INTO Question(id, content, subjectID) VALUES(24, 'Which of the following statement is an expression in scripting element? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(87, '<%= for(int i=0; i<n; i++) {out.println(i)} %>', 24)
INSERT INTO Answer(id, content, quesID) VALUES(88, '<%= x + y - 8 %>', 24)
INSERT INTO Answer(id, content, quesID) VALUES(89, 'All of the others', 24)
INSERT INTO Answer(id, content, quesID) VALUES(90, '<%= x + y; %>', 24)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(24, 88, 24)

INSERT INTO Question(id, content, subjectID) VALUES(25, 'Which of the following statements about the Servlet is false? Select one:', 'PRJ301')
INSERT INTO Answer(id, content, quesID) VALUES(91, 'Servlets are portable', 25)
INSERT INTO Answer(id, content, quesID) VALUES(92, 'Initialization code in servlets is executed every time the program is made to run', 25)
INSERT INTO Answer(id, content, quesID) VALUES(93, 'None of the others', 25)
INSERT INTO Answer(id, content, quesID) VALUES(94, 'Servlets are easy to use', 25)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(25, 92, 25)

--DBI202
INSERT INTO Question(id, content, subjectID) VALUES(26, 'Which of following is never used as a data model?', 'DBI202')
INSERT INTO Answer(id, content, quesID) VALUES(95, 'Hierarchical data model', 26)
INSERT INTO Answer(id, content, quesID) VALUES(96, 'Graph-based data model', 26)
INSERT INTO Answer(id, content, quesID) VALUES(97, 'Tree-based data model', 26)
INSERT INTO Answer(id, content, quesID) VALUES(98, 'None of the others', 26)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(26, 98, 26)

INSERT INTO Question(id, content, subjectID) VALUES(27, 'A ____ is a relation name, together with the attributes of that relation.', 'DBI202')
INSERT INTO Answer(id, content, quesID) VALUES(99, 'schema', 27)
INSERT INTO Answer(id, content, quesID) VALUES(100, 'database', 27)
INSERT INTO Answer(id, content, quesID) VALUES(101, 'database instance', 27)
INSERT INTO Answer(id, content, quesID) VALUES(102, 'schema instance', 27)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(27, 99, 27)

INSERT INTO Question(id, content, subjectID) VALUES(28, 'A ___ is a notation for describing the structure of the data in a database, along with the constraints on that data', 'DBI202')
INSERT INTO Answer(id, content, quesID) VALUES(103, 'data model', 28)
INSERT INTO Answer(id, content, quesID) VALUES(104, 'database management system', 28)
INSERT INTO Answer(id, content, quesID) VALUES(105, 'data operation', 28)
INSERT INTO Answer(id, content, quesID) VALUES(106, 'data manipulation', 28)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(28, 103, 28)

INSERT INTO Question(id, content, subjectID) VALUES(29, 'A _____ is a language for defining data structures', 'DBI202')
INSERT INTO Answer(id, content, quesID) VALUES(107, 'DDL', 29)
INSERT INTO Answer(id, content, quesID) VALUES(108, 'DML', 29)
INSERT INTO Answer(id, content, quesID) VALUES(109, 'DCL', 29)
INSERT INTO Answer(id, content, quesID) VALUES(110, 'None of the others', 29)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(29, 107, 29)

INSERT INTO Question(id, content, subjectID) VALUES(30, 'Which statement is used to remove a relation named R?', 'DBI202')
INSERT INTO Answer(id, content, quesID) VALUES(111, 'DROP TABLE R;', 30)
INSERT INTO Answer(id, content, quesID) VALUES(112, 'REMOVE TABLE R;', 30)
INSERT INTO Answer(id, content, quesID) VALUES(113, 'DELETE TABLE R;', 30)
INSERT INTO Answer(id, content, quesID) VALUES(114, 'TRUNCATE TABLE R;', 30)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(30, 111, 30)

--OSG202
INSERT INTO Question(id, content, subjectID) VALUES(31, 'Which of the following statements is incorrect about user mode and kernel mode??', 'OSG202')
INSERT INTO Answer(id, content, quesID) VALUES(115, 'In kernel mode, the OS can execute every instruction in the instruction set', 31)
INSERT INTO Answer(id, content, quesID) VALUES(116, 'In user mode, user program can execute only a subset of instructions', 31)
INSERT INTO Answer(id, content, quesID) VALUES(117, 'Having two modes of operation helps prevent user programs from accessing critical instructions', 31)
INSERT INTO Answer(id, content, quesID) VALUES(118, 'None of the above', 31)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(31, 118, 31)

INSERT INTO Question(id, content, subjectID) VALUES(32, 'Random Access memory:', 'OSG202')
INSERT INTO Answer(id, content, quesID) VALUES(119, 'Is typically faster than cache memory', 32)
INSERT INTO Answer(id, content, quesID) VALUES(120, 'Is volatile', 32)
INSERT INTO Answer(id, content, quesID) VALUES(121, 'Can only be read sequentially', 32)
INSERT INTO Answer(id, content, quesID) VALUES(122, 'Stores all the files on the computer', 32)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(32, 120, 32)

INSERT INTO Question(id, content, subjectID) VALUES(33, 'The four main structural elements of a computer system are:', 'OSG202')
INSERT INTO Answer(id, content, quesID) VALUES(123, 'Processor, Registers, I/O Modules, Main Memory', 33)
INSERT INTO Answer(id, content, quesID) VALUES(124, 'Processor, Registers, Main Memory, System Bus', 33)
INSERT INTO Answer(id, content, quesID) VALUES(125, 'Processor, Main Memory, I/O Modules, System Bus', 33)
INSERT INTO Answer(id, content, quesID) VALUES(126, 'None of the above', 33)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(33, 125, 33)

INSERT INTO Question(id, content, subjectID) VALUES(34, 'What is the main characteristic of embedded operating system?', 'OSG202')
INSERT INTO Answer(id, content, quesID) VALUES(127, 'Multiple CPU', 34)
INSERT INTO Answer(id, content, quesID) VALUES(128, 'Time-sharing', 34)
INSERT INTO Answer(id, content, quesID) VALUES(129, 'Many I/O devices', 34)
INSERT INTO Answer(id, content, quesID) VALUES(130, 'Restriction of memory size, speed of CPU, screen size, powers', 34)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(34, 130, 34)

INSERT INTO Question(id, content, subjectID) VALUES(35, 'A Control/Status register that contains the address of the next instruction to be fetched is called the:', 'OSG202')
INSERT INTO Answer(id, content, quesID) VALUES(131, 'Instruction Register (IR)', 35)
INSERT INTO Answer(id, content, quesID) VALUES(132, 'Program Counter (PC)', 35)
INSERT INTO Answer(id, content, quesID) VALUES(133, 'Program Status Word (PSW)', 35)
INSERT INTO Answer(id, content, quesID) VALUES(134, 'All of the above', 35)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(35, 132, 35)

--ECR201 SEM101
INSERT INTO Question(id, content, subjectID) VALUES(36, 'The gap between speaker meaning and sentence meaning is such that it is even possible for a speaker to convey a quite intelligible by using a sentence whose literal meaning is ____ or nonsensical.', 'SEM101')
INSERT INTO Answer(id, content, quesID) VALUES(135, 'synonymous', 36)
INSERT INTO Answer(id, content, quesID) VALUES(136, 'contradictory', 36)
INSERT INTO Answer(id, content, quesID) VALUES(137, 'sufficient', 36)
INSERT INTO Answer(id, content, quesID) VALUES(138, 'conclusive', 36)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(36, 136, 36)

INSERT INTO Question(id, content, subjectID) VALUES(37, 'Identify the EXPERIENCER in the following sentence: "The burst of gunfire was heard by the soldiers"', 'SEM101')
INSERT INTO Answer(id, content, quesID) VALUES(139, 'burst', 37)
INSERT INTO Answer(id, content, quesID) VALUES(140, 'gunfire', 37)
INSERT INTO Answer(id, content, quesID) VALUES(141, 'heard', 37)
INSERT INTO Answer(id, content, quesID) VALUES(142, 'soldiers', 37)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(37, 142, 37)

INSERT INTO Question(id, content, subjectID) VALUES(38, 'Identify the AFFECTED in the following sentence: "His fans sent him birthday presents"', 'SEM101')
INSERT INTO Answer(id, content, quesID) VALUES(143, 'His fans', 38)
INSERT INTO Answer(id, content, quesID) VALUES(144, 'sent', 38)
INSERT INTO Answer(id, content, quesID) VALUES(145, 'him', 38)
INSERT INTO Answer(id, content, quesID) VALUES(146, 'birthday presents', 38)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(38, 146, 38)

INSERT INTO Question(id, content, subjectID) VALUES(39, 'In "They give me some advice," GIVE is ____', 'SEM101')
INSERT INTO Answer(id, content, quesID) VALUES(147, 'one-place predicate', 39)
INSERT INTO Answer(id, content, quesID) VALUES(148, 'two-place predicate', 39)
INSERT INTO Answer(id, content, quesID) VALUES(149, 'three-place predicate', 39)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(39, 149, 39)

INSERT INTO Question(id, content, subjectID) VALUES(40, 'Is the following sentence an equative sentence?
"Ted is an idiot"', 'SEM101')
INSERT INTO Answer(id, content, quesID) VALUES(150, 'Yes', 40)
INSERT INTO Answer(id, content, quesID) VALUES(151, 'No', 40)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(40, 151, 40)

--ECR201
INSERT INTO Question(id, content, subjectID) VALUES(41, 'A method of valuing the cost of goods sold that uses the cost of the oldest items in inventory first. What is it?', 'ECR201')
INSERT INTO Answer(id, content, quesID) VALUES(152, 'FIFO', 41)
INSERT INTO Answer(id, content, quesID) VALUES(153, 'LIFO', 41)
INSERT INTO Answer(id, content, quesID) VALUES(154, 'Weighted Average', 41)
INSERT INTO Answer(id, content, quesID) VALUES(155, 'Specific method', 41)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(41, 152, 41)

INSERT INTO Question(id, content, subjectID) VALUES(42, 'The operating activities of a business exclude:', 'ECR201')
INSERT INTO Answer(id, content, quesID) VALUES(156, 'Borrowing', 42)
INSERT INTO Answer(id, content, quesID) VALUES(157, 'Purchasing', 42)
INSERT INTO Answer(id, content, quesID) VALUES(158, 'Marketing', 42)
INSERT INTO Answer(id, content, quesID) VALUES(159, 'Distribution', 42)
INSERT INTO CorrectAns(id, correctAns, quesID) VALUES(42, 156, 42)

--TEST
INSERT INTO Test(id, category, weight, subID, stuID) VALUES(1, 'Progress Test', 15, 'MAE101', 'HE161138')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(1, 11, 43, 1, 'Which of the following statements are true? (u, v in R3)', '|| -5u || = -5|| u ||uwu|| u-v || = || u || -|| v ||uwuIf u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(1, 12, 46, 1, 'Which of the following statements are true?', 'if {X, Y} is orthogonal in Rn then {X, X+Y} is also orthogonal.uwuif {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.uwuif {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(1, 13, 48, 0, 'Let A be a 3 x 3 matrix. Choose correct statement', 'det(-A) = -det(A)uwudet(2A) = 2det(A)uwudet(A^T) = det(A)uwu', 'det(A^T) = det(A)', 'det(2A) = 2det(A)')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(1, 14, 50, 1, 'If A and AB are invertible, which of the followingstatements are true?', 'B is invertibleuwuBA = AB', 'B is invertible', 'B is invertible')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(1, 15, 54, 1, 'For a homogeneous system of 4 equations in 5 unknowns, which of the following statements are true?', 'The system can be inconsistent.uwuThe system can have a unique solution.uwuThe system can have infinitely many solutions.', 'The system can have infinitely many solutions.', 'The system can have infinitely many solutions.')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(2, 'Progress Test', 15, 'MAE101', 'HE161139')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(2, 11, 41, 0, 'Which of the following statements are true? (u, v in R3)', '|| -5u || = -5|| u ||uwu|| u-v || = || u || -|| v ||uwuIf u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', '|| -5u || = -5|| u ||')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(2, 12, 45, 0, 'Which of the following statements are true?', 'if {X, Y} is orthogonal in Rn then {X, X+Y} is also orthogonal.uwuif {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.uwuif {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(2, 13, 47, 0, 'Let A be a 3 x 3 matrix. Choose correct statement', 'det(-A) = -det(A)uwudet(2A) = 2det(A)uwudet(A^T) = det(A)uwu', 'det(A^T) = det(A)', 'det(-A) = -det(A)')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(2, 14, 51, 0, 'If A and AB are invertible, which of the followingstatements are true?', 'B is invertibleuwuBA = AB', 'B is invertible', 'BA = AB')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(2, 15, 54, 1, 'For a homogeneous system of 4 equations in 5 unknowns, which of the following statements are true?', 'The system can be inconsistent.uwuThe system can have a unique solution.uwuThe system can have infinitely many solutions.', 'The system can have infinitely many solutions.', 'The system can have infinitely many solutions.')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(3, 'Progress Test', 15, 'MAE101', 'HE161340')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(3, 11, 43, 1, 'Which of the following statements are true? (u, v in R3)', '|| -5u || = -5|| u ||uwu|| u-v || = || u || -|| v ||uwuIf u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(3, 12, 45, 0, 'Which of the following statements are true?', 'if {X, Y} is orthogonal in Rn then {X, X+Y} is also orthogonal.uwuif {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.uwuif {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(3, 13, 47, 0, 'Let A be a 3 x 3 matrix. Choose correct statement', 'det(-A) = -det(A)uwudet(2A) = 2det(A)uwudet(A^T) = det(A)uwu', 'det(A^T) = det(A)', 'det(-A) = -det(A)')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(3, 14, 51, 0, 'If A and AB are invertible, which of the followingstatements are true?', 'B is invertibleuwuBA = AB', 'B is invertible', 'BA = AB')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(3, 15, 54, 1, 'For a homogeneous system of 4 equations in 5 unknowns, which of the following statements are true?', 'The system can be inconsistent.uwuThe system can have a unique solution.uwuThe system can have infinitely many solutions.', 'The system can have infinitely many solutions.', 'The system can have infinitely many solutions.')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(4, 'Progress Test', 15, 'MAE101', 'HE161447')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(4, 11, 43, 1, 'Which of the following statements are true? (u, v in R3)', '|| -5u || = -5|| u ||uwu|| u-v || = || u || -|| v ||uwuIf u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(4, 12, 46, 1, 'Which of the following statements are true?', 'if {X, Y} is orthogonal in Rn then {X, X+Y} is also orthogonal.uwuif {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.uwuif {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(4, 13, 47, 0, 'Let A be a 3 x 3 matrix. Choose correct statement', 'det(-A) = -det(A)uwudet(2A) = 2det(A)uwudet(A^T) = det(A)uwu', 'det(A^T) = det(A)', 'det(-A) = -det(A)')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(4, 14, 51, 0, 'If A and AB are invertible, which of the followingstatements are true?', 'B is invertibleuwuBA = AB', 'B is invertible', 'BA = AB')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(4, 15, 54, 1, 'For a homogeneous system of 4 equations in 5 unknowns, which of the following statements are true?', 'The system can be inconsistent.uwuThe system can have a unique solution.uwuThe system can have infinitely many solutions.', 'The system can have infinitely many solutions.', 'The system can have infinitely many solutions.')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(5, 'Progress Test', 15, 'MAE101', 'HE161924')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(5, 11, 43, 1, 'Which of the following statements are true? (u, v in R3)', '|| -5u || = -5|| u ||uwu|| u-v || = || u || -|| v ||uwuIf u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.', 'If u, v, u+v are nonzero and u and (u+v) are parallel, then u and v are also parallel.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(5, 12, 46, 1, 'Which of the following statements are true?', 'if {X, Y} is orthogonal in Rn then {X, X+Y} is also orthogonal.uwuif {X,Y} and {Z, W} are both orthogonal then {X,Y,Z,W} is also orthogonal.uwuif {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.', 'if {X, Y} is orthonormal then {X-Y, X+Y} is orthogonal.')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(5, 13, 47, 0, 'Let A be a 3 x 3 matrix. Choose correct statement', 'det(-A) = -det(A)uwudet(2A) = 2det(A)uwudet(A^T) = det(A)uwu', 'det(A^T) = det(A)', 'det(-A) = -det(A)')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(5, 14, 51, 0, 'If A and AB are invertible, which of the followingstatements are true?', 'B is invertibleuwuBA = AB', 'B is invertible', 'BA = AB')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(5, 15, 54, 1, 'For a homogeneous system of 4 equations in 5 unknowns, which of the following statements are true?', 'The system can be inconsistent.uwuThe system can have a unique solution.uwuThe system can have infinitely many solutions.', 'The system can have infinitely many solutions.', 'The system can have infinitely many solutions.')


INSERT INTO Test(id, category, weight, subID, stuID) VALUES(6, 'Progress Test', 15, 'OSG202', 'HE161138')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(6, 31, 118, 1, 'Which of the following statements is incorrect about user mode and kernel mode??', 'In kernel mode, the OS can execute every instruction in the instruction setuwuIn user mode, user program can execute only a subset of instructionsuwuHaving two modes of operation helps prevent user programs from accessing critical instructionsuwuNone of the above', 'None of the above', 'None of the above')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(6, 32, 120, 1, 'Random Access memory:', 'Is typically faster than cache memoryuwuIs volatileuwuCan only be read sequentiallyuwuStores all the files on the computer', 'Is volatile', 'Is volatile')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(6, 33, 125, 1, 'The four main structural elements of a computer system are:', 'Processor, Registers, I/O Modules, Main MemoryuwuProcessor, Registers, Main Memory, System BusuwuProcessor, Main Memory, I/O Modules, System BusuwuNone of the above', 'Processor, Main Memory, I/O Modules, System Bus', 'Processor, Main Memory, I/O Modules, System Bus')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(6, 34, 130, 1, 'What is the main characteristic of embedded operating system?', 'Multiple CPUuwuTime-sharinguwuMany I/O devicesuwuRestriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(6, 35, 132, 1, 'A Control/Status register that contains the address of the next instruction to be fetched is called the:', 'Instruction Register (IR)uwuProgram Counter (PC)uwuProgram Status Word (PSW)uwuAll of the above', 'Program Counter (PC)', 'Program Counter (PC)')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(7, 'Progress Test', 15, 'OSG202', 'HE161481')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(7, 31, 118, 1, 'Which of the following statements is incorrect about user mode and kernel mode??', 'In kernel mode, the OS can execute every instruction in the instruction setuwuIn user mode, user program can execute only a subset of instructionsuwuHaving two modes of operation helps prevent user programs from accessing critical instructionsuwuNone of the above', 'None of the above', 'None of the above')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(7, 32, 120, 1, 'Random Access memory:', 'Is typically faster than cache memoryuwuIs volatileuwuCan only be read sequentiallyuwuStores all the files on the computer', 'Is volatile', 'Is volatile')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(7, 33, 125, 1, 'The four main structural elements of a computer system are:', 'Processor, Registers, I/O Modules, Main MemoryuwuProcessor, Registers, Main Memory, System BusuwuProcessor, Main Memory, I/O Modules, System BusuwuNone of the above', 'Processor, Main Memory, I/O Modules, System Bus', 'Processor, Main Memory, I/O Modules, System Bus')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(7, 34, 127, 0, 'What is the main characteristic of embedded operating system?', 'Multiple CPUuwuTime-sharinguwuMany I/O devicesuwuRestriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers', 'Multiple CPU')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(7, 35, 131, 0, 'A Control/Status register that contains the address of the next instruction to be fetched is called the:', 'Instruction Register (IR)uwuProgram Counter (PC)uwuProgram Status Word (PSW)uwuAll of the above', 'Program Counter (PC)', 'Instruction Register (IR)')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(8, 'Progress Test', 15, 'OSG202', 'HE161481')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(8, 31, 115, 0, 'Which of the following statements is incorrect about user mode and kernel mode??', 'In kernel mode, the OS can execute every instruction in the instruction setuwuIn user mode, user program can execute only a subset of instructionsuwuHaving two modes of operation helps prevent user programs from accessing critical instructionsuwuNone of the above', 'None of the above', 'In kernel mode, the OS can execute every instruction in the instruction set')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(8, 32, 119, 0, 'Random Access memory:', 'Is typically faster than cache memoryuwuIs volatileuwuCan only be read sequentiallyuwuStores all the files on the computer', 'Is volatile', 'Is typically faster than cache memory')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(8, 33, 125, 1, 'The four main structural elements of a computer system are:', 'Processor, Registers, I/O Modules, Main MemoryuwuProcessor, Registers, Main Memory, System BusuwuProcessor, Main Memory, I/O Modules, System BusuwuNone of the above', 'Processor, Main Memory, I/O Modules, System Bus', 'Processor, Main Memory, I/O Modules, System Bus')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(8, 34, 130, 1, 'What is the main characteristic of embedded operating system?', 'Multiple CPUuwuTime-sharinguwuMany I/O devicesuwuRestriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(8, 35, 132, 1, 'A Control/Status register that contains the address of the next instruction to be fetched is called the:', 'Instruction Register (IR)uwuProgram Counter (PC)uwuProgram Status Word (PSW)uwuAll of the above', 'Program Counter (PC)', 'Program Counter (PC)')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(9, 'Progress Test', 15, 'OSG202', 'HE161557')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(9, 31, 118, 1, 'Which of the following statements is incorrect about user mode and kernel mode??', 'In kernel mode, the OS can execute every instruction in the instruction setuwuIn user mode, user program can execute only a subset of instructionsuwuHaving two modes of operation helps prevent user programs from accessing critical instructionsuwuNone of the above', 'None of the above', 'None of the above')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(9, 32, 120, 1, 'Random Access memory:', 'Is typically faster than cache memoryuwuIs volatileuwuCan only be read sequentiallyuwuStores all the files on the computer', 'Is volatile', 'Is volatile')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(9, 33, 126, 0, 'The four main structural elements of a computer system are:', 'Processor, Registers, I/O Modules, Main MemoryuwuProcessor, Registers, Main Memory, System BusuwuProcessor, Main Memory, I/O Modules, System BusuwuNone of the above', 'Processor, Main Memory, I/O Modules, System Bus', 'None of the above')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(9, 34, 130, 1, 'What is the main characteristic of embedded operating system?', 'Multiple CPUuwuTime-sharinguwuMany I/O devicesuwuRestriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(9, 35, 132, 1, 'A Control/Status register that contains the address of the next instruction to be fetched is called the:', 'Instruction Register (IR)uwuProgram Counter (PC)uwuProgram Status Word (PSW)uwuAll of the above', 'Program Counter (PC)', 'Program Counter (PC)')

INSERT INTO Test(id, category, weight, subID, stuID) VALUES(10, 'Progress Test', 15, 'OSG202', 'AI163634')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(10, 31, 118, 1, 'Which of the following statements is incorrect about user mode and kernel mode??', 'In kernel mode, the OS can execute every instruction in the instruction setuwuIn user mode, user program can execute only a subset of instructionsuwuHaving two modes of operation helps prevent user programs from accessing critical instructionsuwuNone of the above', 'None of the above', 'None of the above')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(10, 32, 119, 0, 'Random Access memory:', 'Is typically faster than cache memoryuwuIs volatileuwuCan only be read sequentiallyuwuStores all the files on the computer', 'Is volatile', 'Is typically faster than cache memory')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(10, 33, 126, 0, 'The four main structural elements of a computer system are:', 'Processor, Registers, I/O Modules, Main MemoryuwuProcessor, Registers, Main Memory, System BusuwuProcessor, Main Memory, I/O Modules, System BusuwuNone of the above', 'Processor, Main Memory, I/O Modules, System Bus', 'None of the above')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(10, 34, 129, 0, 'What is the main characteristic of embedded operating system?', 'Multiple CPUuwuTime-sharinguwuMany I/O devicesuwuRestriction of memory size, speed of CPU, screen size, powers', 'Restriction of memory size, speed of CPU, screen size, powers', 'Many I/O devices')
INSERT INTO QuestionOfTheTest(testID, questionID, answerID, trueOrFalse, qContent, aContent, caContent, yourAContent) VALUES(10, 35, 132, 1, 'A Control/Status register that contains the address of the next instruction to be fetched is called the:', 'Instruction Register (IR)uwuProgram Counter (PC)uwuProgram Status Word (PSW)uwuAll of the above', 'Program Counter (PC)', 'Program Counter (PC)')

INSERT INTO Mark(id, value, testID) VALUES(1, 8, 1)
INSERT INTO Mark(id, value, testID) VALUES(2, 2, 2)
INSERT INTO Mark(id, value, testID) VALUES(3, 4, 3)
INSERT INTO Mark(id, value, testID) VALUES(4, 6, 4)
INSERT INTO Mark(id, value, testID) VALUES(5, 6, 5)
INSERT INTO Mark(id, value, testID) VALUES(6, 10, 6)
INSERT INTO Mark(id, value, testID) VALUES(7, 6, 7)
INSERT INTO Mark(id, value, testID) VALUES(8, 6, 8)
INSERT INTO Mark(id, value, testID) VALUES(9, 8, 9)
INSERT INTO Mark(id, value, testID) VALUES(10, 4, 10)