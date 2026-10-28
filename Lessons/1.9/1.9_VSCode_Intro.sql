SELECT 42 as answer;

SELECT * From company_dim limit 5;

SELECT * From company_dim  WHERE name in ('Facebook', 'Meta');
SELECT * From skills_job_dim  LIMIT 5;
SELECT * From skills_dim  LIMIT 5;
PRAGMA show_tables;
DESCRIBE job_postings_fact;

-- .mode duckbox
-- .maxwidth 250
-- .maxrows 40