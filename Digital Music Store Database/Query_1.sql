SELECT sub.Country, MAX(sub.spent) TotalSpent, sub.CustomerId, sub.FirstName, sub.LastName
FROM (SELECT c.Country, SUM(i.Total) spent, c.FirstName, c.LastName, c.CustomerId
		FROM Customer c
		JOIN Invoice i
		ON i.CustomerId = c.CustomerId
		GROUP BY 1,5) sub
GROUP BY 1
ORDER BY 2 DESC



