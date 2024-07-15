/*
Question: What are top paying data analyst jobs?
look at average salary asspcoated with each skill for DA positions
focuses on roles woth specified salaries, regardless of job_location

*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_saalry
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'  AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY   
    average_saalry DESC
LIMIT 25

/*

Top skills by average salary include PySpark, Bitbucket, and Couchbase, with PySpark leading 
significantly. These high-paying skills highlight the demand for expertise in big data processing, version control systems, and database management. The prominence of these skills suggests a strong market need for advanced data handling and collaborative development tools.

*/