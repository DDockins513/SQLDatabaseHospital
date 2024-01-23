Drop database projectdb;
CREATE DATABASE ProjectDB;
USE ProjectDB;

CREATE TABLE Nurse (
    nurseID INT PRIMARY KEY NOT NULL,
    nurseHoursWorked VARCHAR(20),
    labPhoneNumber VARCHAR(20),
    nurseAddress VARCHAR(50),
    nurseType VARCHAR(20),
    nurseLastName VARCHAR(50),
    nurseFirstName VARCHAR(50)
);

CREATE TABLE Doctor (
    docID INT PRIMARY KEY NOT NULL,
    docHoursWorked VARCHAR(20),
	docPhoneNumber VARCHAR(20),
    docAddress VARCHAR(50),
    docType VARCHAR(20),
    docLastName VARCHAR(50),
    docFirstName VARCHAR(50)
);

CREATE TABLE Department (
    departID INT PRIMARY KEY NOT NULL,
    departPhoneNumber VARCHAR(20),
    departType VARCHAR(20),
    departName VARCHAR(30),
    docID INT,
    nurseID INT,
	FOREIGN KEY (nurseID) REFERENCES Nurse(nurseID),
    FOREIGN KEY (docID) REFERENCES Doctor(docID)
);

create table Laboratory (
    labID int primary key NOT NULL,
    labName varchar(50),
    labPhoneNumber varchar(20),
    labNum numeric(5),
    labType varchar(30),
    labSupplies varchar(30),
    departID int,
    foreign key (departID) references Department(departID)
    );
    
 create table Patient (
    patID int primary key NOT NULL,
    patLastName varchar(50),
    patFirstName varchar(50),
    patAddress varchar(50),
    patPhoneNumber varchar(50),
    DOB varchar(30),
    SSN numeric(15),
    diagnosis varchar(50),
    nurseID int,
    foreign key (NurseID) references Nurse(NurseID)
    );
    
create table Appointment(
    apptID int primary key not null,
    apptDate varchar(30),
    apptTime varchar(10),
    reason varchar(50),
    treatment varchar(50),
    patID int,
    foreign key (patID) references Patient(patID)
    );
    create table room(
    roomID int primary key not null,
    roomPhoneNum varchar(50),
    roomType varchar(20),
    roomNum varchar(20),
    roomStatus varchar(12),
    nurseID int,
    docID int,
    FOREIGN KEY (nurseID) REFERENCES Nurse(nurseID),
    FOREIGN KEY (docID) REFERENCES Doctor(docID)
);

create table bill(
    docCharge varchar(50),
    roomCharge varchar(20),
    billID int primary key not null,
    labCharge varchar(50),
    billDate varchar(12),
    docID int,
    FOREIGN KEY (docID) REFERENCES Doctor(docID),
    roomID int,
    FOREIGN KEY (roomID) REFERENCES room(roomID),
    labID int,
    FOREIGN KEY (labID) REFERENCES Laboratory(labID)
);

create table payment(
    paymentType varchar(20),
    amount varchar(20),
    paymentID int primary key not null,
    paymentStatus varchar(20),
    billID int,
    foreign key (billID) references bill(billID),
    docID int,
    FOREIGN KEY (docID) REFERENCES Doctor(docID),
        roomID int,
    FOREIGN KEY (roomID) REFERENCES room(roomID),
    labID int,
    FOREIGN KEY (labID) REFERENCES Laboratory(labID)
);

INSERT INTO Nurse (nurseID, nurseHoursWorked, labPhoneNumber,nurseAddress,nurseType,nurseLastName,nurseFirstName)
VALUES 
	(12112, '7', '843-555-6544', '502 rode way', 'Labor', 'Smith', 'Betty' ),
    (13412, '5', '843-555-6544', '222 sea boy', 'RN', 'rod', 'sam' ),
    (16612, '12', '843-555-6544', '502 bye new', 'HEAD', 'lowban', 'Rick' ),
    (17512, '16', '843-555-6544', '502 helping ro', 'CNA', 'semore', 'Joe' );
    
   INSERT INTO Doctor (docID, docHoursWorked, docPhoneNumber,docAddress,docType,docLastName,docFirstName)
VALUES 
	(22322, '7', '843-445-6674', '117 rockstreet', 'Heart', 'ruyn', 'tom' ),
    (24332, '6', '843-222-7874', '232 sleed drive', 'Brain', 'smart', 'fred' ),
    (24452, '4', '843-532-7711', '222 sea boy', 'Labor', 'fredrick', 'dan' ),
    (27762, '14', '843-335-6344', '502 rode way', 'Labor', 'tomonran', 'jeff' );
    
    INSERT INTO Department (DepartID,DepartPhoneNumber,DepartType,DepartName)
VALUES 
	(13233, '843-552-1111','Labor','BabyStation' ),
    (13222,'843-552-1111','Labor','BabyStation' ),
    (13323,'843-552-1111','Labor','BabyStation' ),
    (13555,'843-552-1221','Heart','HeartStation' ),
    (13766,'843-552-1221','Heart','HeartStation' ),
    (13565,'843-552-1221','Heart','HeartStation' ),
    (13988,'843-552-2331','Brain','BrainStation' ),
    (13986,'843-552-2331','Brain','BrainStation' ),
    (13467,'843-552-2331','Brain','BrainStation' ),
    (13648,'843-552-2331','Labor','BrainStation' );
    
    INSERT INTO room (roomID,roomPhoneNum, roomType, roomNum,roomStatus)
VALUES 
	(20010,'843-331-1111','Labor',10,'OPEN' ),
    (20011,'843-332-1111','Labor',11,'CLOSED' ),
    (20012,'843-333-1111','Labor',12,'CLOSED' ),
    (20013,'843-334-1111','Heart',13,'OPEN' ),
    (20014,'843-335-1111','Heart',14,'CLOSED' ),
    (20015,'843-336-1111','Heart',15,'OPEN' ),
    (20016,'843-337-1111','Heart',16,'OPEN' ),
    (20017,'843-338-1111','Labor',17,'CLOSED' ),
    (20018,'843-339-1111','Labor',18,'OPEN' ),
    (20019,'843-330-1111','Labor',19,'OPEN' );
    
        INSERT INTO bill (billID,docCharge,roomCharge,labCharge,billDate)
VALUES 
	(10010,'120$','300$','250$','4/2/2023' ),
    (10011,'190$','300$','350$','5/7/2023' ),
    (10012,'180$','300$','250$','4/10/2023' ),
    (10013,'160$','400$','200$','8/3/2023' ),
    (10014,'100$','300$','250$','9/2/2023' ),
    (10015,'110$','200$','250$','1/23/2024' ),
    (10016,'160$','200$','150$','6/16/2023' ),
    (10017,'120$','200$','250$','7/11/2023' ),
    (10018,'170$','300$','450$','9/5/2023' ),
    (10019,'165$','300$','150$','9/12/2023' );
    INSERT INTO payment (paymentType,amount,paymentID,paymentStatus)
VALUES 
('Cash','670$',10020,'PAID' ),
('CHECK','840$',10021,'PAID' ),
('Cash','730$',10022,'UNPAID' ),
('CARD','760$',10023,'PAID' ),
('CHECK','650$',10024,'UNPAID' ),
('Cash','560$',10025,'UNPAID' ),
('CARD','510$',10026,'UNPAID' ),
('CARD','570$',10027,'UNPAID' ),
('Cash','920$',10028,'UNPAID' ),
('CHECK','615$',10029,'PAID' );
  
Insert into Laboratory (labID, labName, labPhoneNumber, labNum, labType, labSupplies) values
    (30001, 'Chemistry Lab', '843-661-1256', '00001', 'Glucose Tests', 'Glucose Meter'),
    (30002, 'Hematology Lab', '843-661-1256', '00002', 'Blood Tests', 'Hematology Analyzer'),
    (30003, 'Microbiology Lab', '843-661-1256', '00003', 'Glucose Tests', 'Microscope'),
    (30004, 'Immunology Lab', '843-661-1256', '00004', 'Glucose Tests', 'Masks'),
    (30005, 'Cytology Lab', '843-661-1256', '00005', 'Glucose Tests', 'Goggles'),
    (30006, 'Pathology Lab', '843-661-1256', '00006', 'Glucose Tests', 'Gloves');
Insert into Patient (patID, patLastName, patFirstName, patAddress, patPhoneNumber, DOB, SSN, diagnosis) values
    (84560, 'Young', 'Steve', '5345 Niner Way', '843-367-3088', '01-01-1977', 123456789, 'Flu'),
    (84561, 'Brady', 'James', '2823 Patriot Place', '843-455-5215', '12-01-1950', 462398246, 'COVID-19'),
    (84562, 'Smalls', 'Jaden', '6548 Fox Drive', '843-369-5248', '03-22-1980', 776432581, 'Diabetes'),
    (84563, 'Jones', 'Maria', '6034 Johns Court', '843-775-6324', '08-05-1977', 674392848, 'High Blood Pressure'),
    (84564, 'Bank', 'Mark', '5345 Citadel Boulevard', '843-910-0257', '10-15-2000', 987543789, 'Strep Throat');
Insert into Appointment (apptID, apptDate, apptTime, reason, treatment) values
    (65312, '05-06-22', '8:50', 'Headache', 'Excedrin'),
    (65313, '02-23-23', '11:30', 'Cold Shivers', 'Aspirin'),
    (65314, '12-06-22', '10:45', 'Blurry Vision', 'Insulin'),
    (65316, '11-10-22', '12:20', 'Chest Pain', 'ACE Inhibitor'),
    (65318, '07-16-22', '3:00', 'Throat Soreness', 'Excedrin');
    
    select *  FROM Nurse;
    select *  FROM Doctor;
    select *  FROM Department;
    select *  FROM Laboratory;
    select *  FROM Patient;
    select *  FROM Appointment;
    select *  FROM room;
    select *  FROM bill;
    select *  FROM payment;