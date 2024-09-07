USE DemoERD
GO


-- self relationship (hierarki)
ALTER TABLE Karyawan
ADD ManagerID INT NULL;

ALTER TABLE Karyawan
ADD CONSTRAINT FK_ManagerID
FOREIGN KEY (ManagerID) REFERENCES Karyawan(KaryawanID)