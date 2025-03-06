SELECT A.[BusinessEntityID]
      ,A.[PersonType]
      --,[FullName] = A.[FirstName] + ' ' + ISNULL(A.[MiddleName]+ ' ', ' ') + A.[LastName]
	  ,[FullName] = A.[FirstName] + ' ' +
	  CASE WHEN A.MiddleName IS NULL THEN '' ELSE A.MiddleName + ' ' END +
	  A.[LastName]
	  ,[Address] = B.AddressLine1
	  ,B.City
	  ,B.PostalCode
	  ,[State] = C.[Name]
	  ,[Country] = D.[Name]
	  ,ISNULL(F.[JobTitle], 'NA')
	  ,[JobCategory] =  
	  CASE 
		  WHEN F.[JobTitle] LIKE '%Manager%' OR F.[JobTitle] LIKE '%President%' OR F.[JobTitle] LIKE 'Executive' THEN 'Management'
		  WHEN F.[JobTitle] LIKE '%Engineer%' THEN 'Engineering'
		  WHEN F.[JobTitle] LIKE '%Production%' THEN 'Production'
		  WHEN F.[JobTitle] LIKE '%Marketing%' THEN 'Marketing'
		  WHEN F.[JobTitle] IS NULL THEN 'NA'
	      WHEN F.[JobTitle] IN ('Recruiter', 'Benefits Specialist', 'Human Resources Administrative Assistant') THEN 'Human Resources'
		  ELSE 'Other'
	  END
  FROM [AdventureWorks2019].[Person].[Person] A

  JOIN [Person].[BusinessEntityAddress] E
  ON E.BusinessEntityID = A.BusinessEntityID

  JOIN [Person].[Address] B
  ON E.AddressID = B.AddressID

  JOIN [Person].[StateProvince] C
  ON B.StateProvinceID = C.StateProvinceID

  JOIN [Person].[CountryRegion] D
  ON C.CountryRegionCode = D.CountryRegionCode

  LEFT JOIN [HumanResources].[Employee] F
  ON F.BusinessEntityID = A.BusinessEntityID

  WHERE A.PersonType = 'SP' OR ((LEFT(B.PostalCode, 1)='9') AND (LEN(B.PostalCode) = 5) AND (D.[Name]='United States'))
												