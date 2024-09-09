USE TsqlTraining;
GO


-- 1. create table employee audit
CREATE TABLE EmployeeAudit (
	[id] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[empid] [INT] NOT NULL,
	[status] [VARCHAR](10) NOT NULL,
	[cerated] [datetime] NOT NULL
);
GO

CREATE TABLE Employee(
	[id] [INT],
	[first_name] [VARCHAR](30),
	[last_name] [VARCHAR](30),
	[email] [VARCHAR] (30),
	[created] [datetime]
)
GO

-- 2. membuat trigger pada table yang sudah kita buat diatas untuk mencatat log aktivitas setelah terjadi INSERT DATA
CREATE TRIGGER trg_employee
ON Employee
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO EmployeeAudit(
		empid,
		status,
		cerated
	)
	SELECT
		i.id,
		'inserted',
		GETDATE()
	FROM inserted i
	UNION ALL
	SELECT
		d.id,
		'deleted',
		GETDATE()
	FROM deleted d;

END
GO

-- 3. Melihat table setelah terjadi proses INSERT atau DELETE dan monitoring proses yang terjadi di dalam catatan log EmployeeAudit
select * from EmployeeAudit
select * from Employee

-- tes aksi INSERT DELETE untuk memicu terjadinya trigger
INSERT INTO Employee(id, first_name, last_name, email, created)
VALUES
(1,'laludoni','setiawan', 'test@gmail.com', GETDATE());

INSERT INTO Employee(id, first_name, last_name, email, created)
VALUES
(3,'joko','wi', 'jkw@gmail.com', GETDATE());

-- tes DELETE data untuk memicu terjadinya trigger di log 
DELETE FROM Employee WHERE id = 2