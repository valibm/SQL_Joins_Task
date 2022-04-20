create database UniDB

use UniDB

create table Students(
	Id int Primary Key Identity (1, 1),
	Name Nvarchar(50),
	Surname Nvarchar(50)
)

create table Teachers(
	Id int Primary Key Identity (1000, 1),
	Name Nvarchar(50),
	Surname Nvarchar(50)
)

create table University(
	Id int Primary Key Identity (2000, 1),
	Name Nvarchar(50),
	StudentID int Foreign Key References Students (Id),
	TeacherID int Foreign Key References Teachers (Id)
)

create table StudentCard(
	Id int Primary Key Identity (3000, 1),
	StudentID int Foreign Key References Students (Id),
	CardNO int Not Null Unique
)

Insert into Students
	Values ('Vali', 'Mustafayev' ),
           ('Rauf', 'Namazov' ),
		   ('Senan', 'Mehemmedov' ),
		   ('Terlan', 'Tahirov' ),
		   ('Tural', 'Muradov' )

Insert into Teachers
	Values ('Mehemmed', 'Mustafayev' ),
           ('Mirze', 'Namazov' ),
		   ('Rafiq', 'Mehemmedov' ),
		   ('Malik', 'Tahirov' ),
		   ('Elmira', 'Muradov' )

Insert into University (Name)
	Values ('ADNSU')

Insert into StudentCard
	Values (1, 167839),
		   (2, 673591),
		   (3, 753419),
		   (4, 551239)

Select
	uni.Name as [University Name],
	s.Name as [Student Name],
	s.Surname as [Student Surname],
	t.Name as [Teacher Name],
	t.Surname [Teacher Surname]
from Students s
	Join University uni on uni.StudentID = s.Id
	Join Teachers t on uni.TeacherID = t.Id

Select
	sc.CardNO,
	s.Name,
	s.Surname
from Students s
	join StudentCard sc on sc.Id = s.Id