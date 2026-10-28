/*  What are the most in-demand skills for data engineers?
What are the highest-paying skills?
What are the most optimal skills? */

-- check all column names in a table
-- PRAGMA table_info(job_postings_fact);

SELECT 
sd.skills AS skill_name,
COUNT(jpf.*) AS skill_count,

FROM job_postings_fact  as jpf
INNER JOIN skills_job_dim as sjd
ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd
ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer' 
AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
ORDER BY skill_count DESC
LIMIT 10;

/*
┌────────────┬─────────────┐
│ skill_name │ skill_count │
│  varchar   │    int64    │
├────────────┼─────────────┤
│ sql        │       29221 │
│ python     │       28776 │
│ aws        │       17823 │
│ azure      │       14143 │
│ spark      │       12799 │
│ airflow    │        9996 │
│ snowflake  │        8639 │
│ databricks │        8183 │
│ java       │        7267 │
│ gcp        │        6446 │
├────────────┴─────────────┤
│ 10 rows        2 columns │
└──────────────────────────┘
*/