SELECT A.[PurchaseOrderID]   
      ,A.[OrderDate]
	  ,B.Name
	  ,A.[TotalDue]
	  ,[PrevOrderFromVendorAmt] = LAG(A.[TotalDue], 1) OVER(PARTITION BY A.VendorID ORDER BY A.[OrderDate])
	  ,[NextOrderByEmployeeVendor] = LEAD(B.Name, 1) OVER(PARTITION BY A.[EmployeeID] ORDER BY A.[OrderDate])
	  ,[Next2OrderByEmployeeVendor] = LEAD(B.Name, 2) OVER(PARTITION BY A.[EmployeeID] ORDER BY A.[OrderDate])
      
  FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader] A
  JOIN Purchasing.Vendor B ON A.VendorID = B.BusinessEntityID
  WHERE A.[TotalDue]>500 AND YEAR(A.[OrderDate])>=2013

  ORDER BY A.VendorID, A.[OrderDate]
