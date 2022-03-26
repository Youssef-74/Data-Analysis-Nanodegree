SELECT tab1.Artist_name, SUM(l.Quantity*l.UnitPrice) AmountSpent
FROM Track t
JOIN (SELECT al.AlbumId Album_id, ar.ArtistId Artist_id, ar.Name Artist_name
		FROM Album al
		JOIN Artist ar
		ON ar.ArtistId = al.ArtistId) tab1
ON tab1.Album_id = t.AlbumId
JOIN InvoiceLine l
ON l.TrackId = t.TrackId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;