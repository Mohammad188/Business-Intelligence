SELECT 
	A.Name ProductName,
	A.ListPrice,
	ProductSubcategory = B.Name,
	[ProductCategory] = C.Name,
	[AvgPriceByCategory] = AVG(A.ListPrice) OVER(PARTITION BY C.Name),
	[AvgPriceByCategoryAndSubcategory] = AVG(A.ListPrice) OVER(PARTITION BY C.Name, B.Name),
	[ProductVsCategoryDelta] = A.ListPrice - AVG(A.ListPrice) OVER(PARTITION BY C.Name)

FROM Production.Product A
JOIN Production.ProductSubcategory B ON A.ProductSubcategoryID = B.ProductSubcategoryID
JOIN Production.ProductCategory C ON C.ProductCategoryID = B.ProductCategoryID