# Exploratory Data Analysis w/ SQL: Job Market Analysis

![Project 1 Overview](https://raw.githubusercontent.com/lukebarousse/SQL_Data_Engineering_Projects/02ee6765c579571ff6a7da26ec398b305edc6b92/Images/1_1_Project1_EDA.png)

This project uses SQL to explore remote data engineering job postings. Three queries examine which skills appear most often, which are associated with higher median pay, and which offer a useful balance of demand and compensation.

## Executive Summary

- **Demand:** Ranked the ten most frequently listed skills in remote data engineer roles.
- **Compensation:** Compared median annual salaries by skill and included posting counts for context.
- **Prioritization:** Combined median salary with log-transformed skill counts to create a balanced ranking.
- **Tools and methods:** Used joins, grouping, aggregate functions, filters, and calculated metrics in SQL.

Start with these queries:

1. [`01_top_demanded_skils.sql`](./01_top_demanded_skils.sql) - Count the most frequently requested skills.
2. [`02_top_paying_skills.sql`](./02_top_paying_skills.sql) - Compare median salary and posting volume.
3. [`03_optimal_skills.sql`](./03_optimal_skills.sql) - Rank skills using both salary and demand.

## Problem & Context

People choosing what to learn for data engineering roles may want to know:

- Which skills appear in the greatest number of job postings?
- Which skills are associated with the highest median salaries?
- Which skills combine a meaningful level of demand with strong pay?

The queries join job postings to a skill-mapping table and a skills catalog. This structure lets each job be associated with multiple skills while keeping job details and skill descriptions in their respective tables.

![Data Warehouse](./Images/1_2_Data_Warehouse.png)

- **Fact table:** `job_postings_fact` stores job-level information, including job title, work arrangement, and salary.
- **Dimension table:** `skills_dim` contains the skill names.
- **Bridge table:** `skills_job_dim` connects postings to the skills they request.
- **Company dimension:** `company_dim` contains company details and is part of the wider warehouse model.

The analysis focuses on remote Data Engineer positions. The salary-based rankings use median annual salary, and the optimal-skills query excludes postings without a reported annual salary.

## Tech Stack

- **Query engine:** DuckDB
- **Query language:** SQL
- **Data organization:** Fact, dimension, and bridge tables
- **Development environment:** VS Code and the DuckDB command-line interface
- **Version control:** Git and GitHub

## Analysis Overview

### Query Structure

1. [Top Demanded Skills](./01_top_demanded_skils.sql) - Counts skills in remote Data Engineer postings and returns the ten most common.
2. [Top Paying Skills](./02_top_paying_skills.sql) - Calculates median annual salary and demand count for skills appearing in more than 100 postings, then returns the top 25 by pay.
3. [Optimal Skills](./03_optimal_skills.sql) - Multiplies median salary by the natural log of demand, scales the result, and returns the 25 highest-scoring skills.

### Key Insights

- SQL and Python lead the demand query, with AWS and Azure also appearing frequently.
- The salary query shows that a high median salary does not necessarily mean a skill appears in many postings.
- In the optimal-skills results, Terraform ranks first, with Python, AWS, and SQL also near the top.
- Taking the natural logarithm of demand reduces the influence of very high posting counts, allowing salary to contribute meaningfully to the combined score.

## SQL Skills Demonstrated

### Query Design & Optimization

- **Joins:** Connects job postings to the skills bridge and skill catalog using `INNER JOIN`.
- **Aggregations:** Uses `COUNT()` and `MEDIAN()` to summarize demand and salary.
- **Filtering:** Limits the analysis by job title and remote-work flag; the optimal-skills query additionally requires a reported annual salary.
- **Sorting and limiting:** Orders results by the relevant measure and uses `LIMIT` to return a focused list.

### Data Analysis Techniques

- **Grouping:** Groups records by skill to compare demand and compensation.
- **Aggregate filtering:** Uses `HAVING` to exclude skills with low posting counts.
- **Transformations:** Applies `LN()` to demand counts in the combined ranking.
- **Derived metric:** Calculates an optimal score from median salary and log-transformed demand.
- **Missing values:** The optimal-skills query filters out postings without an annual salary before calculating results.

---

Course reference: [SQL Data Engineering Projects by Luke Barousse](https://github.com/lukebarousse/SQL_Data_Engineering_Projects/tree/main/1_EDA).