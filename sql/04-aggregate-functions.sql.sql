-- ZAHTEV 4A: Distributivna funkcija SUM
-- Računanje ukupnog prihoda po državama

SELECT
    Country,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM dbo.OnlineRetailClean
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- ZAHTEV 4B: Algebarska funkcija AVG
-- Računanje prosečne vrednosti stavke po državama

SELECT
    Country,
    AVG(Quantity * UnitPrice) AS AvgOrderValue
FROM dbo.OnlineRetailClean
GROUP BY Country
ORDER BY AvgOrderValue DESC;
