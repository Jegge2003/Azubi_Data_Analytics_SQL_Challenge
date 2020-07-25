/*The number of transfers that has been sent in the currency CFA
requires that we look through the unique transfer ids that have CFA
as the currency in the send_amount_currency column.
It will be more appropriate to use the transfer_id since every transfer
in the company has a specific and unique id attached to it.
*/
SELECT COUNT(transfer_id)
FROM transfers
WHERE send_amount_currency = 'CFA';
