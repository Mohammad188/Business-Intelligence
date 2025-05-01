SELECT 
      P.[FirstName]
     ,P.[LastName]
	 ,H.[JobTitle]
	 ,HP.[Rate]
	 ,[AverageRate] = AVG(HP.[Rate]) OVER()
	 ,[MaximumRate] = MAX(HP.[Rate]) OVER()
	 ,[DiffFromAvgRate] = HP.[Rate] - AVG(HP.[Rate]) OVER()
	 ,[PercentofMaxRate] = (HP.[Rate] / AVG(HP.[Rate]) OVER()) *100 
	 
      
  FROM Person.Person P
  INNER JOIN HumanResources.Employee H ON P.BusinessEntityID = H.BusinessEntityID
  INNER JOIN HumanResources.EmployeePayHistory HP ON HP.BusinessEntityID = P.BusinessEntityID
