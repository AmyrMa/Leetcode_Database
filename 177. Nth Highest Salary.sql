Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.


为second highest salary的拓展, 这里不能直接offset (n-1) 要提前设置offset的值
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT(
            SELECT DISTINCT
                salary
            FROM Employee
            ORDER BY salary DESC
            LIMIT 1 OFFSET N
      )
  );
END
