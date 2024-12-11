/*
    Name: <Haneefuddin Rasheed>
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 4- PART 2
*/

--------------------------------------------------------------------------------
/*				                 Query 8            		  		          */
--------------------------------------------------------------------------------

 SELECT dept_name
FROM department
INTERSECT
SELECT DISTINCT dept_name
FROM instructor
ORDER BY dept_name;



--------------------------------------------------------------------------------
/*				                  Query 9           		  		          */
--------------------------------------------------------------------------------

SELECT course_id
FROM course
EXCEPT
SELECT DISTINCT prereq_id
FROM prereq
ORDER BY course_id;


--------------------------------------------------------------------------------
/*				                  Query 10           		  		          */
--------------------------------------------------------------------------------
  
(SELECT dept_name 
 FROM department 
 WHERE budget < 50000)

UNION


(SELECT d.dept_name 
 FROM department d, instructor i 
 WHERE d.dept_name = i.dept_name AND i.salary > 100000)

UNION


(SELECT d.dept_name
 FROM department d, student s
 WHERE d.dept_name = s.dept_name AND s.tot_cred = (SELECT MAX(tot_cred) FROM student))

ORDER BY dept_name;

   
--------------------------------------------------------------------------------
/*				                  Query 11           		  		          */
--------------------------------------------------------------------------------

SELECT 
    c.course_id AS course_id, 
    c.title AS course_name, 
    p.prereq_id AS prereq_id, 
    pc.title AS prereq_name
FROM 
    course c
JOIN 
    prereq p ON c.course_id = p.course_id
JOIN 
    course pc ON p.prereq_id = pc.course_id
ORDER BY 
    c.course_id, 
    p.prereq_id;


--------------------------------------------------------------------------------
/*				                  Query 12           		  		          */
--------------------------------------------------------------------------------

SELECT s.id
FROM student s
LEFT OUTER JOIN takes t ON s.id = t.id
WHERE t.course_id IS NULL;

    



  