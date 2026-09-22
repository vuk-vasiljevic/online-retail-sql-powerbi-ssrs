-- ZAHTEV 11A: Kreiranje SQL VIEW-a za mesečni prihod po državama

CREATE OR ALTER VIEW dbo.v_MonthlyRevenueByCountry
AS
SELECT
    Country,
    YEAR(InvoiceDate) AS SalesYear,
    MONTH(InvoiceDate) AS SalesMonth,
    SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM dbo.OnlineRetailClean
GROUP BY
    Country,
    YEAR(InvoiceDate),
    MONTH(InvoiceDate);
GO

-- Provera sadržaja view-a
SELECT TOP (20)
*
FROM dbo.v_MonthlyRevenueByCountry
ORDER BY Country, SalesYear, SalesMonth;

-- ZAHTEV 11B: Materijalizacija VIEW-a u fizičku tabelu

DROP TABLE IF EXISTS dbo.MonthlyRevenueByCountry_Table;
GO

SELECT *
INTO dbo.MonthlyRevenueByCountry_Table
FROM dbo.v_MonthlyRevenueByCountry;
GO

SELECT COUNT(*) AS BrojRedova
FROM dbo.MonthlyRevenueByCountry_Table;
