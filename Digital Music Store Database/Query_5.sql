SELECT tab1.Artist_name, SUM(tab2.Quantity)*tab2.UnitPrice AmountSpent, tab2.Customer_id, tab2.FirstName, tab2.LastName
FROM Track t
JOIN (SELECT al.AlbumId Album_id, ar.ArtistId Artist_id, ar.Name Artist_name
		FROM Album al
		JOIN Artist ar
		ON ar.ArtistId = al.ArtistId) tab1
ON tab1.Album_id = t.AlbumId
JOIN (SELECT l.TrackId Track_id, i.InvoiceId Invoice_id, l.InvoiceLineId InvoiceLine_id, l.Quantity, l.UnitPrice, c.CustomerId Customer_id, c.FirstName, c.LastName
		FROM Invoice i
		JOIN InvoiceLine l
		ON i.InvoiceId = l.InvoiceId
		JOIN Customer c
		ON c.CustomerId = i.CustomerId
		)tab2
ON tab2.Track_id = t.TrackId
WHERE Artist_name = 'Iron Maiden'
GROUP BY 1,3
ORDER BY 2 DESC;
