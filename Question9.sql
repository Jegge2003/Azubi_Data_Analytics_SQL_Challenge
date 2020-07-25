/*This question wants the transaction counts which is appropriate to count the transfer ids(transfer_id)
and the number of unique senders can be obtained from the distinct source wallet ids from the transfers table
(DISTINCT transfers.source_wallet_id) since there can be an occurrence of a user making multiple transactions.
The country is obtained from the ledger_location field of the wallets table, the transfer_kind is
obtained from the kind field of the transfers table, the volume field is obtained from the sum of the
sent amounts(send_amount_scalar field of the transfers table).
These will be obtained when the transfer table is inner joined the wallets table based on their source wallet ids and
wallet ids. The condition is that the transaction time should be between now and a week ago.
The grouping will be done based on the country and transfer_kind.
*/
SELECT COUNT(DISTINCT transfers.source_wallet_id) AS unique_senders,
       COUNT(transfer_id) AS transaction_count,
       transfers.kind AS transfer_kind,
       wallets.ledger_location AS country,
       SUM(transfers.send_amount_scalar) AS volume
FROM transfers
INNER JOIN wallets ON transfers.source_wallet_id = wallets.wallet_id
WHERE (transfers.when_created BETWEEN (NOW() - INTERVAL '1 week') AND NOW())
GROUP BY country,
         transfer_kind;