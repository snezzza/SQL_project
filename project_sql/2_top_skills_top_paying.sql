/*
Question: What are top paying data analyst jobs?
-Identify the top 10 highest paying Data Analyst jobs that are done remotely
-Identify top 5 in-demand skills for data analyst
-remove nulls
*/


WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN   
        company_dim
    ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        salary_year_avg IS NOT NULL AND
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
    )

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Summary:
The data shows a significant demand for skills related to data handling, programming, and visualization.
SQL: The most sought-after skill, likely due to its broad application in managing and querying databases. Essential for data analysis, reporting, and ensuring data integrity.
Python: A versatile programming language widely used for data analysis, machine learning, and automation. Its high demand indicates the importance of scripting and data manipulation skills.
Tableau: A leading data visualization tool, emphasizing the need for creating clear, interactive visual representations of data for decision-making.
These top skills reflect the critical capabilities needed for data science and analytics roles, focusing on managing and interpreting data, programming proficiency, and the ability to present data insights effectively.


*/