/*  CS 155A
    yzhao_project_part2.sql 
    Yan Zhao  Spring 2017 */ 

\W  

USE bank;

/* Query 1 */

SELECT c.last_name, c.city 
FROM borrow b, customer c 
WHERE b.customer_id = c.customer_id;

/* Query 2 */

SELECT * 
FROM loan 
ORDER BY amount DESC, loan_number;

/* Query 3 */

SELECT AVG(balance) 
FROM account;

/* Query 4 */

SELECT br.branch_name, AVG(a.balance)  
FROM branch br, account a 
WHERE br.branch_number = a.branch_number 
GROUP BY a.branch_number 
HAVING count(*) > 1;

/* Query 5 */

SELECT br.branch_name, AVG(a.balance)  
FROM branch br, account a 
WHERE br.branch_number = a.branch_number 
GROUP BY a.branch_number 
HAVING count(*) > 1 AND AVG(a.balance) > 500;

/* Query 6 */

SELECT c.first_name, c.last_name, c.city 
FROM customer c 
JOIN borrow b ON (c.customer_id = b.customer_id) 
JOIN loan l ON (b.loan_number = l.loan_number) 
WHERE l.branch_number = 'B-3030';

/* Query 7 */

SELECT count(*) 
FROM account 
WHERE balance > 500 AND balance < 1200;

/* Query 8 */

SELECT first_name, last_name 
FROM customer 
WHERE streer LIKE '%Lane';

/* Query 9 */

SELECT customer_id 
FROM borrow 
WHERE customer_id IN 
      (SELECT customer_id 
       FROM loan 
       WHERE customer_id IN 
             (SELECT customer_id 
              FROM credit 
              WHERE loan_number IN
                    (SELECT loan_number 
                     FROM loan 
                     WHERE branch_number = 'B-3030')));
                     
/* 10 */

SELECT customer_id 
FROM credit cr JOIN account a
WHERE cr.account_number = a.account_number 
AND branch_number = (SELECT(branch_number) 
                       FROM branch br 
                       WHERE br.branch_name = 'Fresno');
                       
            
/* 11 */
SELECT customer_id 
FROM credit cr JOIN account a
WHERE cr.account_number = a.account_number 
AND branch_number = (SELECT(branch_number) 
                       FROM branch br 
                       WHERE br.branch_number = 
                             (SELECT branch_number 
                              FROM account 
                              WHERE account_number = 
                                    (SELECT account_number 
                                     FROM credit 
                                     WHERE customer_id = 
                                           (SELECT customer_id 
                                            FROM customer 
                                            WHERE last_name = 'Smith'))));
                                            
                                            
                                            
/* 12 */

SELECT branch_name 
FROM branch 
WHERE assets > (SELECT assets 
                FROM branch 
                WHERE branch_city = 'Palo Alto');
                
/* 13 */

SELECT last_name 
FROM customer c, credit cr 
WHERE c.customer_id = cr.customer_id 
AND cr.account_number = (SELECT account_number 
                        FROM account 
                        WHERE branch_number = 'B-9090');

/* 14 */
SELECT first_name, last_name 
FROM customer 
WHERE customer_id IN 
      (SELECT customer_id 
       FROM credit 
       WHERE account_number IN 
             (SELECT account_number 
              FROM account 
              WHERE branch_number = 'B-9090')) 
ORDER BY last_name;


/* 15 */

SELECT branch_number, COUNT(*) as number_of_customers  
FROM loan 
GROUP BY branch_number;
                        
/* 16 */ 

SELECT br.branch_name 
FROM branch AS br 
JOIN account AS a ON br.branch_number = a.branch_number 
WHERE br.branch_number = 'B-1010';

/* 17 */

SELECT branch_name, fname, lname, hire_date 
FROM employee e JOIN branch br 
WHERE e.branch_number = br.branch_number;

/* 18 */
SELECT branch_name, count(*) as number_of_employees 
FROM employee e JOIN branch br 
WHERE e.branch_number = br.branch_number 
GROUP BY e.branch_number;

/* 19 */
CREATE VIEW branch_summary AS 
SELECT branch_number, COUNT(*) AS account_count 
FROM account 
GROUP BY branch_number; 

SELECT * 
FROM branch_summary;


-- Correct answer query 4 
SELECT b.branch_name, AVG(a.balance) 
FROM branch b 
JOIN account a ON b.branch_number = a.branch_number 
GROUP BY b.branch_name 

-- query 5 
SELECT b.branch_name, AVG(a.balance) 
FROM branch b 
JOIN account a ON b.branch_number = a.branch_number 
GROUP BY b.branch_name 
HAVING AVG(a.balance) > 500 

-- query 9 
SELECT DISTINCT customer_id 
FROM borrow be 
JOIN loan l ON br.loan_number = l.loan_number 
JOIN branch b ON l.branch_number = b.branch_number 
AND branch_name = 'Alameda' 
AND customer_id IN (
                    SELECT DISTINCT customer_id 
                    FROM credit cr 
                    JOIN account a ON cr.account_number = a.account_number 
                    JOIN branch b ON a.branch_number = b. branch_number 
                    AND branch_name = 'Alameda'
                    ) 
                    
                    
-- query 17 
SELECT DISTINCT b.branch_name, COUNT(e.emp_id) AS number_of_employees, MAX(e.hire_date) AS maximum_hire_date 
FROM branch b 
JOIN employee e ON b.branch_number = e.branch_number 
GROUP BY b.branch_name 

-- query 20 (-3)