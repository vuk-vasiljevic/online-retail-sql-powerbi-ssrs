-- ZAHTEV 2A: INNER JOIN (uzima samo redove koji imaju poklapanje u svim tabelama)
SELECT TOP (20)
    f.InvoiceNo,
    f.InvoiceDate,
    f.Quantity,
    f.UnitPrice,
    (f.Quantity * f.UnitPrice) AS LineRevenue,
    p.Description AS ProductName,
    c.Country
FROM dbo.OnlineRetailClean AS f
INNER JOIN dbo.DimProduct  AS p ON p.StockCode  = f.StockCode
INNER JOIN dbo.DimCustomer AS c ON c.CustomerID = f.CustomerID
ORDER BY f.InvoiceDate DESC;

-- ZAHTEV 2B: LEFT JOIN (zadržava sve redove iz leve tabele, čak i ako nema poklapanja)
SELECT TOP (50)
    f.InvoiceNo,
    f.InvoiceDate,
    f.StockCode,
    f.Quantity,
    f.UnitPrice,
    f.CustomerID,
    c.Country
FROM dbo.OnlineRetailClean AS f
LEFT JOIN dbo.DimCustomer AS c
    ON c.CustomerID = f.CustomerID
WHERE f.CustomerID IS NULL
ORDER BY f.InvoiceDate DESC;
