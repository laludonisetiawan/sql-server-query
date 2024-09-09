-- drop function 
DROP FUNCTION IF EXISTS unfPrform
GO

-- CERATE A FUNCTION
CREATE FUNCTION unfPerform()
RETURNS [INT]
AS
BEGIN
	--DECLARE THE RETURN VARIABLE HERE
	DECLARE @ret INT
	SET @ret = (SELECT COUNT(ProductID) FROM Production.Product WHERE ListPrice > 1000)
	
	-- return the result of the function
	RETURN @ret
END
GO