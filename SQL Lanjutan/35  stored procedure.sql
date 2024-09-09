
USE AdventureWorks2022;
GO

-- drop stored procedures
DROP PROCEDURE IF EXISTS upsGetAllPersonbyByFilter;
GO

-- create procedure
CREATE PROCEDURE upsGetAllPersonbyByFilter
	-- add the parameters for the stored procedure here
	@PersonType NCHAR(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements
	SET NOCOUNT ON;
	
	-- Insert statements for procedure here
	SELECT PersonType,FirstName,LastName FROM Person.Person 
	WHERE PersonType=@PersonType
END
GO

-- Cara melihat data
DECLARE @Persontype NCHAR(2)
SET @Persontype = 'SC'
EXEC dbo.upsGetAllPersonbyByFilter @Persontype