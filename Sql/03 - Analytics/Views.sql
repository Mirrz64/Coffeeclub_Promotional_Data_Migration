-- Analytics
-- Creating View

CREATE OR REPLACE VIEW offer_summary AS
SELECT
    offer_id,
    COUNT(CASE WHEN event = 'offer received' THEN 1 END) AS received,
    COUNT(CASE WHEN event = 'offer completed' THEN 1 END) AS completed,
COUNT(CASE WHEN event = 'offer viewed' THEN 1 END) AS percentcompleted,
   
    ROUND(
        (COUNT(CASE WHEN event = 'offer completed' THEN 1 END)::NUMERIC /
         NULLIF(COUNT(CASE WHEN event = 'offer received' THEN 1 END), 0)) * 100, 2
    ) AS completion_rate_percentage
FROM events
WHERE offer_id IS NOT NULL
GROUP BY offer_id
ORDER BY 4 DESC;

SELECT *
FROM offer_summary
ORDER BY percentcompleted DESC;


