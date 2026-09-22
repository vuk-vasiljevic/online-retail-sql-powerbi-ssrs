-- ZAHTEV 7A: Kumulativni prihod po mesecima (WINDOW funkcija SUM OVER)

SELECT
    YEAR(InvoiceDate)  AS SalesYear,
    MONTH(InvoiceDate) AS SalesMonth,
    SUM(Quantity * UnitPrice) AS MonthlyRevenue,

    SUM(SUM(Quantity * UnitPrice)) OVER (
        ORDER BY YEAR(InvoiceDate), MONTH(InvoiceDate)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS CumulativeRevenue

FROM dbo.OnlineRetailClean
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    SalesYear,
    SalesMonth;

-- ZAHTEV 7B: Poređenje prihoda sa prethodnim mesecom (LAG)

WITH MonthlyRevenue AS (
    SELECT
        YEAR(InvoiceDate)  AS SalesYear,
        MONTH(InvoiceDate) AS SalesMonth,
        SUM(Quantity * UnitPrice) AS Revenue
    FROM dbo.OnlineRetailClean
    GROUP BY
        YEAR(InvoiceDate),
        MONTH(InvoiceDate)
)
SELECT
    SalesYear,
    SalesMonth,
    Revenue,
    LAG(Revenue) OVER (ORDER BY SalesYear, SalesMonth) AS PreviousMonthRevenue,
    Revenue - LAG(Revenue) OVER (ORDER BY SalesYear, SalesMonth) AS RevenueChange
FROM MonthlyRevenue
ORDER BY SalesYear, SalesMonth;

-- ZAHTEV 7C: Procenat učešća mesečnog prihoda u ukupnom prihodu

SELECT
    YEAR(InvoiceDate)  AS SalesYear,
    MONTH(InvoiceDate) AS SalesMonth,
    SUM(Quantity * UnitPrice) AS MonthlyRevenue,

    100.0 * SUM(Quantity * UnitPrice)
        / SUM(SUM(Quantity * UnitPrice)) OVER () AS RevenuePercentage
FROM dbo.OnlineRetailClean
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    SalesYear,
    SalesMonth;
