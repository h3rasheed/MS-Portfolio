SELECT dept_name, ROUND(AVG(tot_cred), 2) AS dept_avg_credits
FROM student
GROUP BY dept_name
ORDER BY dept_name;
