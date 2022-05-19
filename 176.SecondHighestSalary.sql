#Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.
# limit 1 offset 1, 只return 1个值, offset 跳过一个
SELECT
    (SELECT DISTINCT
        Salary
    FROM
        Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1)
    AS SecondHighestSalary
