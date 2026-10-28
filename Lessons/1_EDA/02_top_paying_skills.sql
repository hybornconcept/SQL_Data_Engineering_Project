/* Question: What are the highest-paying skills for data engineer?

Calculate the median salary for each skill required in data engineer positions
Focus on remote positions with specified salaries
Include skill frequency to identify both salary and demand
Why?
◦ Helps identify which skills command the highest compensation while also showing how common those skills are, providing a more complete picture for skill development priorities.
◦ The median is used instead of the average to reduce the impact of outlier salaries. */

-- PRAGMA table_info(job_postings_fact);


SELECT 
    sd.skills AS skill_name,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.job_id) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer' 
  AND jpf.job_work_from_home = TRUE

GROUP BY sd.skills
HAVING COUNT(*) > 100
ORDER BY median_salary DESC
LIMIT 25;


/* Here are my findings from your query:

Rust is #1 at $210,000 median, but only 232 jobs - niche, premium skill.
Terraform & Golang tie at $184,000 - Terraform is the clear winner for ROI with 3,248 jobs vs Golang's 912.
Infrastructure-as-code dominates - Rust, Terraform, Golang, Spring are top 4; systems-level skills pay more than traditional data tools.
Specialized data tech pays well - Neo4j ($170k), GraphQL ($167.5k), Mongo ($162k) outrank common tools like Airflow/Kubernetes.
Compliance has value - GDPR at $169,616 shows regulatory knowledge commands high compensation.
Demand vs Pay trade-off - Highest pay = lowest frequency (Rust, Zoom, Fastapi <300 jobs). Terraform is the only skill with both high pay and high demand.
Modern Python stack emerging - FastAPI ($157.5k) makes top 10, indicating microservices/API skills are monetized in Data Engineering. */