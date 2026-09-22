USE OnlineRetailII;
GO

DROP TABLE IF EXISTS dbo.DimProduct;
GO

SELECT DISTINCT
    StockCode,
    Description
INTO dbo.DimProduct
FROM dbo.OnlineRetailClean
WHERE StockCode IS NOT NULL;
GO
