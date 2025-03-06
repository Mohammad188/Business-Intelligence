SELECT [OrderType] = 'Sale'
	,A.SalesOrderDetailID
      ,A.SalesOrderID
      ,A.[OrderQty]
      ,A.[UnitPrice]
      ,A.[LineTotal]
	  ,B.[OrderDate]
	  ,[OrderSizeCategory] = 
	  CASE 
	      WHEN A.[OrderQty] > 500 THEN 'Large'
		  WHEN A.[OrderQty] > 50 THEN 'Medium'
		  ELSE 'Small'
	  END
	  ,[ProductName] = C.[Name]
	  ,[Subcategory] = ISNULL(D.[Name], 'None') 
	  ,[Category] = ISNULL(E.[Name], 'None')
	  

  FROM [Sales].[SalesOrderDetail] A
  JOIN [Sales].[SalesOrderHeader] B
  ON B.SalesOrderID = A.SalesOrderID
  JOIN [Production].[Product] C
  ON A.ProductID = C.ProductID
  LEFT JOIN [Production].[ProductSubcategory] D
  ON D.ProductSubcategoryID = C.ProductSubcategoryID
  LEFT JOIN [Production].[ProductCategory] E
  ON E.ProductCategoryID = D.ProductCategoryID
  WHERE MONTH(B.[OrderDate]) = 12

  UNION

  SELECT
		[OrderType] = 'Purchase'
	 , A.[PurchaseOrderID]
      ,A.[PurchaseOrderDetailID]
      ,A.[OrderQty]
      ,A.[UnitPrice]
      ,A.[LineTotal]
	  ,B.[OrderDate]
	  ,[OrderSizeCategory] = 
	  CASE 
	      WHEN A.[OrderQty] > 500 THEN 'Large'
		  WHEN A.[OrderQty] > 50 THEN 'Medium'
		  ELSE 'Small'
	  END
	  ,[ProductName] = C.[Name]
	  ,[Subcategory] = ISNULL(D.[Name], 'None') 
	  ,[Category] = ISNULL(E.[Name], 'None')
	  

  FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderDetail] A
  JOIN [Purchasing].[PurchaseOrderHeader] B
  ON B.PurchaseOrderID = A.PurchaseOrderID
  JOIN [Production].[Product] C
  ON A.ProductID = C.ProductID
  LEFT JOIN [Production].[ProductSubcategory] D
  ON D.ProductSubcategoryID = C.ProductSubcategoryID
  LEFT JOIN [Production].[ProductCategory] E
  ON E.ProductCategoryID = D.ProductCategoryID
  WHERE MONTH(B.[OrderDate]) = 12

	ORDER BY B.[OrderDate] DESC

