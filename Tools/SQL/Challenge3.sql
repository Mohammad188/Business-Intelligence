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
  FROM [AdventureWorks2019].[Person].[Person] A

  JOIN [Person].[BusinessEntityAddress] E
  ON E.BusinessEntityID = A.BusinessEntityID

  JOIN [Person].[Address] B
  ON E.AddressID = B.AddressID

  JOIN [Person].[StateProvince] C
  ON B.StateProvinceID = C.StateProvinceID

  JOIN [Person].[CountryRegion] D
  ON C.CountryRegionCode = D.CountryRegionCode

  WHERE A.PersonType = 'SP' OR ((LEFT(B.PostalCode, 1)='9') AND (LEN(B.PostalCode) = 5) AND (D.[Name]='United States'))
												