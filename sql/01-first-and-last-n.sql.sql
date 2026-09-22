-- ZAHTEV 1A: Prvih N torki (TOP N)
-- Tabela: dbo.OnlineRetailClean
SELECT TOP (20) *
FROM dbo.OnlineRetailClean
ORDER BY InvoiceDate ASC;

-- ZAHTEV 1B: Poslednjih N torki (TOP N uz obrnuto sortiranje)
SELECT TOP (20) *
FROM dbo.OnlineRetailClean
ORDER BY InvoiceDate DESC;
