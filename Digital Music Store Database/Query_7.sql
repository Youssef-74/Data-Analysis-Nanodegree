SELECT g.Name, SUM(tab1.Quantity) Purchases
FROM Track t
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN (SELECT l.TrackId, l.Quantity, c.Country
		FROM Invoice i
		JOIN InvoiceLine l
		ON i.InvoiceId = l.InvoiceId
		JOIN Customer c
		ON c.CustomerId = i.CustomerId
		)tab1
ON tab1.TrackId = t.TrackId 
WHERE tab1.Country = 'USA'
GROUP BY 1
ORDER BY 2 DESC;