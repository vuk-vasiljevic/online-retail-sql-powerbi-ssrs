-- ZAHTEV 5A: Holistička funkcija - medijana vrednosti stavke

SELECT DISTINCT
    PERCENTILE_CONT(0.5) 
        WITHIN GROUP (ORDER BY Quantity * UnitPrice) 
        OVER () AS MedianLineRevenue
FROM dbo.OnlineRetailClean;

-- ZAHTEV 5B: Holistička funkcija - 90. percentil vrednosti stavke

SELECT DISTINCT
    PERCENTILE_CONT(0.9)
        WITHIN GROUP (ORDER BY Quantity * UnitPrice)
        OVER () AS P90_LineRevenue
FROM dbo.OnlineRetailClean;
