-- ZAHTEV 9: WINDOW sa ogranicenjem dela particije (frame)
-- Primer: 3-mesecni pokretni zbir i 3-mesečni pokretni prosek prihoda po drzavi
-- Segment: ROWS BETWEEN 2 PRECEDING AND CURRENT ROW

WITH TopCountries AS (
    SELECT TOP (5)
        Country,
        SUM(Quantity * UnitPrice) AS TotalRevenue
    FROM dbo.OnlineRetailClean
    GROUP BY Country
    ORDER BY TotalRevenue DESC
),
Monthly AS (
    SELECT
        c.Country,
        DATEFROMPARTS(YEAR(f.InvoiceDate), MONTH(f.InvoiceDate), 1) AS MonthStart,
        SUM(f.Quantity * f.UnitPrice) AS MonthlyRevenue
    FROM dbo.OnlineRetailClean AS f
    INNER JOIN TopCountries AS c
        ON c.Country = f.Country
    GROUP BY
        c.Country,
        DATEFROMPARTS(YEAR(f.InvoiceDate), MONTH(f.InvoiceDate), 1)
)
SELECT
    Country,
    MonthStart,
    MonthlyRevenue,

    -- 3-mesečni pokretni zbir (tekući + prethodna 2 meseca)
    SUM(MonthlyRevenue) OVER (
        PARTITION BY Country
        ORDER BY MonthStart
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Rolling3M_Sum,

    -- 3-mesečni pokretni prosek
    AVG(MonthlyRevenue) OVER (
        PARTITION BY Country
        ORDER BY MonthStart
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Rolling3M_Avg

FROM Monthly
ORDER BY Country, MonthStart;
