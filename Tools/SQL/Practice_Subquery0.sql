SELECT 
	*
FROM
(SELECT
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TaxAmt,
	Freight,
	TotalDue,
	[PurchaseOrderRank] = DENSE_RANK() OVER(PARTITION BY VendorID ORDER BY TotalDue DESC)
FROM Purchasing.PurchaseOrderHeader) A
WHERE [PurchaseOrderRank]<=3