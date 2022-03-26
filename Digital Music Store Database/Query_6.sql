SELECT MAX(sub.Purchases) Purchases, sub.Country, sub.Name, sub.GenreId
FROM (SELECT SUM(tab1.Quantity) Purchases, tab1.Country, g.Name, g.GenreId
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
		GROUP BY 2,3) sub
GROUP BY 2;

