IF OBJECT_ID('Trigger_01', 'TR') IS NOT NULL
	DROP TRIGGER Trigger_01
GO
CREATE TRIGGER Trigger_01 ON tblBook
AFTER Update
AS
	DECLARE  @ID VARCHAR(8), @Quantity INT
	SELECT @ID = bookID, @Quantity = quantity FROM inserted
	IF @Quantity = 0
	update tblBook
	set status ='false'
	where bookID = @ID	

GO


IF OBJECT_ID('Trigger_02', 'TR') IS NOT NULL
	DROP TRIGGER Trigger_02
GO
CREATE TRIGGER Trigger_02 ON tblOrder_Details
AFTER insert
AS
	DECLARE  @ID VARCHAR(8), @Quantity INT
	SELECT @ID = bookID, @Quantity = quantity FROM inserted
	update tblBook
	set quantity = quantity-  @Quantity
	where bookID = @ID	
GO
