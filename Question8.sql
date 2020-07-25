/*This question requires the building a table that has the columns transfer_kind, country and volume.
The country is obtained from the ledger_location field of the wallets table, the transfer_kind is
obtained from the kind field of the transfers table, the volume field is obtained from the sum of the
sent amounts(send_amount_scalar field of the transfers table). These columns form teh send_volume_country_and_kind
table. These fields are obtained from the inner joining of the transfers table and the wallets table based on the
source_wallet_id and the wallet_id of the transfers and the wallets tables respectively.
The condition is that the time of transaction(when_created field of the transfers table) is within a week.
After
*/
SELECT transfers.kind AS transfer_kind,
       wallets.ledger_location AS country,
       SUM(transfers.send_amount_scalar) AS volume INTO send_volume_country_and_kind
FROM transfers
INNER JOIN wallets ON transfers.source_wallet_id = wallets.wallet_id
WHERE (transfers.when_created BETWEEN (NOW() - INTERVAL '1 week') AND NOW())
GROUP BY country,
         transfer_kind;