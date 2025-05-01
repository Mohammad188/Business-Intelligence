-- Excersice 1
SELECT 
	BusinessEntityID,
	JobTitle,
	HireDate,
	VacationHours,
	[FirstHireVacationHours] = FIRST_VALUE(VacationHours) OVER(PARTITION BY JobTitle ORDER BY HireDate)
FROM HumanResources.Employee
ORDER BY JobTitle, HireDate

-- Excersice 2
SELECT
	A.ProductID,
	A.Name,
	B.ListPrice,
	B.ModifiedDate,
	[HighestPrice] = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice DESC),
	[LowestCost] = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice),
	[PriceRange] = FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice DESC)-FIRST_VALUE(B.ListPrice) OVER(PARTITION BY A.ProductID ORDER BY B.ListPrice)
FROM Production.Product A
JOIN Production.ProductListPriceHistory B ON A.ProductID = B.ProductID
ORDER BY A.ProductID, B.ModifiedDate