-- ZAHTEV 3A: Filtriranje nad pojedinacnim vrednostima (WHERE)
-- Primer: prikaz transakcija sa negativnom kolicinom i velikom vrednoscu stavke
SELECT TOP (50)
    InvoiceNo,
    InvoiceDate,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    (Quantity * UnitPrice) AS LineRevenue,
    CustomerID,
    Country
FROM dbo.OnlineRetailClean
WHERE
    Quantity < 0                 
    OR (Quantity * UnitPrice) >= 1000  
ORDER BY InvoiceDate DESC;

-- ZAHTEV 3B: Filtriranje nad agregiranim vrednostima (HAVING)
-- Primer: kupci sa ukupnim prihodom vecim od 10000
SELECT TOP (20)
    CustomerID,
    Country,
    SUM(Quantity * UnitPrice) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS NumInvoices
FROM dbo.OnlineRetailClean
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country
HAVING SUM(Quantity * UnitPrice) > 10000
ORDER BY TotalRevenue DESC;
