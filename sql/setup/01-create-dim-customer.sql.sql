USE OnlineRetailII;
GO

DROP TABLE IF EXISTS dbo.DimCustomer;
GO

SELECT DISTINCT
    CustomerID,
    Country
INTO dbo.DimCustomer
FROM dbo.OnlineRetailClean
WHERE CustomerID IS NOT NULL;
GO
