/*This question wants to know if for a give number of agents, they are collaboratively withdrawers or depositors.
This can be achieved by adding the deposits by the given number of agents separately and the withdrawals
also separately. Afterwards, the results are summed together and if the value is negative then they are
net depositors but if positive then they are net withdrawers.
This will be taken from the agent_transactions table and the condition is that the transaction time
should be between a week ago and now.
*/
SELECT SUM(CASE
               WHEN amount > 0 THEN amount
               else 0
           END) AS withdrawal,
       SUM(CASE
               WHEN amount < 0 then amount
               else 0
           END) AS deposit,
       CASE
           WHEN ((SUM(CASE
                          WHEN amount > 0 THEN amount
                          else 0
                      END)) > ((SUM(CASE
                                        WHEN amount < 0 then amount
                                        else 0
                                    END))) * -1) THEN 'withdrawer'
           ELSE 'depositor'
       END as agent_status,
       COUNT (*)
FROM agent_transactions
WHERE when_created BETWEEN (now() - '1 week'::INTERVAL) AND now();