/*
Question: What are top paying data analyst jobs?
-Identify the top 10 highest paying Data Analyst jobs that are done remotely
-Identify top 5 in-demand skills for data analyst
-remove nulls
focus on all job postings
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY   
    demand_count DESC
LIMIT 5
