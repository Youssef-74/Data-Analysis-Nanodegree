SELECT table1.Artist_id, table1.Artist_name, COUNT(t.TrackId) songs
FROM Track t
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN (SELECT al.AlbumId Album_id, ar.ArtistId Artist_id, ar.Name Artist_name
		FROM Album al
		JOIN Artist ar
		ON ar.ArtistId = al.ArtistId)table1
ON  table1.Album_id = t.AlbumId
WHERE g.Name = 'Rock'
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10;


