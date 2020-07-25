/*Since the question is looking for different users, 
I had the idea that there can be a situation where a particular user with a unique id
will make multiple transfers hence making his id appear more than once in the table.
To take care of this, I used the "DISTINCT" keyword to get the right values.
*/
SELECT COUNT(DISTINCT u_id)
FROM transfers
WHERE send_amount_currency = 'CFA';