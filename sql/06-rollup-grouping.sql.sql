-- ZAHTEV 6: Napredno grupisanje po više dimenzija (Country, Year) + hijerarhija pomoću ROLLUP

SELECT
    Country,
    YEAR(InvoiceDate) AS SalesYear,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM dbo.OnlineRetailClean
GROUP BY ROLLUP (Country, YEAR(InvoiceDate))
ORDER BY
    Country,
    SalesYear;
