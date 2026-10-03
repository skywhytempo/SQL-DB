select p.firstName as firstName, p.lastName as lastName, a.city, a.state
from Person as p
left join Address as a on p.personId = a.personId;