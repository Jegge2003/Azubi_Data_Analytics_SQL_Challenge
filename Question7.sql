/*This questions wants the addition of a Country column to the table we created in Question6.
To achieve this, I copied the columns City(which is agents.city), Volume(which is the count of agent_transactions.atx_ids)
and Country(which is agents.country)into a new table called atx_volume_city_summary_with_Country.
The Country, City and Volume columns are produced from joining the agents table and the agent_transactions table
based on the similar column(agent_id). The condition set for the process is that the time of the transaction should be
a week ago and it should be grouped by country and city from the agents table.
*/
SELECT City,
       Volume,
       Country INTO atx_volume_city_summary_with_Country
FROM
    (Select agents.city AS City,
            agents.country AS Country,
            COUNT(agent_transactions.atx_id) AS Volume
     FROM agents
     INNER JOIN agent_transactions ON agents.agent_id = agent_transactions.agent_id
     where (agent_transactions.when_created BETWEEN (NOW() - INTERVAL '1 week') AND NOW())
     GROUP BY agents.country,
              agents.city) as atx_volume_summary_with_Country;