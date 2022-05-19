#uses of left join, add the second table to the left tables
SELECT firstName, lastName, city, state
FROM Person LEFT JOIN Address
ON Person.personId = Address.personId
;
