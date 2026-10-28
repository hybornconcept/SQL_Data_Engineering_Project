/* Find the top 10 companies for posting jobs
  criteria is that they must have >3000 job postings.
  LIMIT TO US only*/

EXPLAIN ANALYZE
SELECT 
    cd.name AS company_name,
    COUNT(jpf.job_id) AS job_postings_count
FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON cd.company_id = jpf.company_id
WHERE jpf.job_country LIKE '%United States%'
GROUP BY cd.name
HAVING COUNT(jpf.job_id) > 3000
ORDER BY job_postings_count DESC;