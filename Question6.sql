/*This questions wants to see a table that has a City and Volume column where the City
column is referenced to the city column of the agents table and the volume is referenced to the
count of the atx_ids of the agent_transactions table. To do this the two tables must be joined
with an inner join using the agent_id in both tables as a point of contact.
Afterwards, the last week must be taken into consideration since the question wants the last week
and it should be grouped by city from the agents table.
*/
SELECT City,
       Volume INTO atx_volume_city_summary
FROM
    (Select agents.city AS City,
            COUNT(agent_transactions.atx_id) AS Volume
     FROM agents
     INNER JOIN agent_transactions ON agents.agent_id = agent_transactions.agent_id
     WHERE (agent_transactions.when_created BETWEEN (NOW() - INTERVAL '1 week') AND NOW())
     GROUP BY agents.city) AS atx_volume_summary;