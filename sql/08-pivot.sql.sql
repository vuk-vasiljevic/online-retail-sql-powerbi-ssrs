-- ZAHTEV 8 (PRE): Podaci pre PIVOT transformacije
-- “Dugi format”: Country, SalesYear, Revenue

SELECT
    Country,
    YEAR(InvoiceDate) AS SalesYear,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM dbo.OnlineRetailClean
GROUP BY
    Country,
    YEAR(InvoiceDate)
ORDER BY
    Country,
    SalesYear;

-- ZAHTEV 8: Višedimenzionalni izveštaj korišćenjem PIVOT operatora
-- Prikaz ukupnog prihoda po državama, gde su godine kolone

SELECT
    Country,
    ISNULL([2009], 0) AS Revenue_2009,
    ISNULL([2010], 0) AS Revenue_2010,
    ISNULL([2011], 0) AS Revenue_2011
FROM (
    SELECT
        Country,
        YEAR(InvoiceDate) AS SalesYear,
        Quantity * UnitPrice AS Revenue
    FROM dbo.OnlineRetailClean
) AS src
PIVOT (
    SUM(Revenue)
    FOR SalesYear IN ([2009], [2010], [2011])
) AS p
ORDER BY Country;
