/*This question wants the number of users in the Wave company
and hence the number of rows in the users table is enough to give 
the needed number.
But since every user in Wave Company has a unique user id
it will be more appropriate to use the u_id for checking though selecting all rows will 
give you the same output.*/
SELECT COUNT(u_id)
FROM users;