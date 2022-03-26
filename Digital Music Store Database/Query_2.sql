SELECT c.Email, c.FirstName, c.LastName, t1.name
FROM Invoice i
JOIN Customer c
ON i.CustomerId = c.CustomerId
JOIN (SELECT L.InvoiceId invoice_Id, g.Name name
		FROM Track t
		JOIN Genre g
		ON g.GenreId = t.GenreId
		JOIN InvoiceLine l
		ON l.TrackId = t.TrackId
		WHERE g.Name = 'Rock') t1
ON t1.invoice_id = i.InvoiceId 
GROUP BY 1
ORDER BY 1;