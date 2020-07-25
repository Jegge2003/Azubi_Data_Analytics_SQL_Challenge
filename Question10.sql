/*This question wants the specific wallets that have sent more than 10,000,000 CFA
in transfers in the last month. Since every wallet is given a unique id as source_wallet_id
and the send_amount_scalar shows the amount transferred, it is ideal to get those columns
based on the conditions. The conditions are that the send_amount_currency should be CFA
and the when_created should be 1 month ago or within 1 month.
*/
SELECT source_wallet_id,
       send_amount_scalar AS "amount_sent_in_last_month"
FROM transfers
WHERE send_amount_currency = 'CFA'
    AND (send_amount_scalar>10000000)
    AND (transfers.when_created BETWEEN (NOW() - '1 month'::INTERVAL) AND NOW());

