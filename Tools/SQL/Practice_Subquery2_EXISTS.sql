SELECT
	A.*
FROM [Purchasing].[PurchaseOrderHeader] A
WHERE EXISTS (
	SELECT 1
	FROM [Purchasing].[PurchaseOrderDetail] B
	WHERE A.PurchaseOrderID = B.PurchaseOrderID AND B.OrderQty>500 AND B.UnitPrice>50
)
ORDER BY 1

-- Another Exercise
SELECT
	A.*
FROM [Purchasing].[PurchaseOrderHeader] A
WHERE NOT EXISTS (
	SELECT 1 FROM [Purchasing].[PurchaseOrderDetail] B
	WHERE A.PurchaseOrderID = B.PurchaseOrderDetailID
	AND B.RejectedQty > 0
)