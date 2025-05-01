SELECT
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TotalDue,
	[NonRejectedItems] = 
	(
		SELECT 
		COUNT(*)
		FROM [Purchasing].[PurchaseOrderDetail] B
		WHERE RejectedQty = 0 AND B.PurchaseOrderID = A.PurchaseOrderID
	),
	[MostExpensiveItem] = (
		SELECT 
		MAX(unitprice)
		FROM [Purchasing].[PurchaseOrderDetail] B
		WHERE B.PurchaseOrderID = A.PurchaseOrderID
	)
FROM [Purchasing].[PurchaseOrderHeader] A