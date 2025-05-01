SELECT
	BusinessEntityID,
	JobTitle,
	VacationHours,
	[MaxVacationHours] = (SELECT MAX(VacationHours) FROM [HumanResources].[Employee]),
	[PercentVacationHours] = (VacationHours*1.0) / (SELECT MAX(VacationHours) FROM [HumanResources].[Employee])
FROM [HumanResources].[Employee]
WHERE ((VacationHours*1.0) / (SELECT MAX(VacationHours) FROM [HumanResources].[Employee])) >= 0.8
