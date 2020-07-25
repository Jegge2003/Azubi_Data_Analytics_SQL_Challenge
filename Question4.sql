/*This question wants the total agent_transactions of each month
of 2018. Since the when_created is made up of date and time, the year must be extracted
together with the months and afterwards the agent_transactions will be grouped by the months.
*/
SELECT COUNT(atx_id) AS "agent_transactions per month from January to December, 2018"
FROM agent_transactions AS atx
WHERE EXTRACT(YEAR
              FROM when_created)=2018
GROUP BY EXTRACT(MONTH
                 FROM when_created);