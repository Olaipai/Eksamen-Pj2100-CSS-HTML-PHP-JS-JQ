/* 1.utkast av databasesystem til nettsiden
Skrevet av Markus Sørensen 11.03.2015 */


/* Lager en tabell, rom, som inneholder informasjon om grupperommene */
create table Rom
(
Id int NOT NULL,
Antall Varchar(1) NOT NULL,
Prosjektor Varchar(3) NOT NULL,
constraint Rom_Id_Pk Primary Key Rom(Id)
);

/* Lager en tabell, student, som inneholder navn knyttet til en studentmail */
create table Student
(
Mail Varchar(100) NOT NULL,
Navn Varchar(100),
constraint Student_Mail_Pk Primary Key Student(Mail)
);


/* Lager tabell, booking, som tar imot verdier fra rom og student og oppretter en reservasjon med egen ID og dato */
create table Booking
(
Id int NOT NULL auto_increment,
Dato Varchar(10) NOT NULL,
Mail Varchar(100) NOT NULL,
Rom_Id int NOT NULL,
constraint Booking_Id_Pk Primary Key Booking(Id),
constraint Booking_Mail_Fk Foreign Key Booking(Mail) references Student(Mail),
constraint Booking_Rom_Id_Fk Foreign Key Booking(Rom_Id) references Rom(Id)
);


/* Testverdier for Rom-tabellen */
Insert into Rom (Id, Antall, Prosjektor)
VALUES (1, 2, 'Nei'), (2, 2, 'Ja'), (3, 3, 'Nei'), (4, 3, 'Ja'), (5, 4, 'Nei'), (6, 4, 'Ja');

/* Testverdier for Student-tabellen */
Insert into Student (Mail, Navn) 
VALUES ('navn@navnesen.com', 'Navn Navnesen'), ('Ola@nordmann.no', 'Ola Nordmann')

/* Testverdier for Booking-tabellen */
Insert into Booking (Dato, Mail, Rom_Id) 
VALUES ('01.01.2001', Mail, Rom_Id)
Select ins.Id, Mail FROM Student JOIN Booking On ins.Mail = Student.Mail,
Select ins.Id, Rom.Id FROM Rom JOIN Booking On ins.Rom_Id = Rom.Id;
