/*
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
id is the primary key for this table.
Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
 

Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.
*/

#Approach 1: 复制两个 scores的表格,一个s1,一个s2  s1 为输出表格, s2 里面为distinct score, 通过count s2.score有多少大于等于s1.score 来判断rank, 然后输出s1
SELECT s1.score, (
    SELECT count(DISTINCT score)
    FROM Scores s2
    WHERE s2.score >= s1.score) AS 'rank'
    FROM Scores s1
    ORDER BY s1.score DESC;
/*
Approach 2: 利用DENSE_RANK, 
                                      DENSE_RANK() OVER (
                                          PARTITION BY <expression>[{,<expression>...}]
                                          ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
                                      )
First, the PARTITION BY clause divides the result sets produced by the FROM clause into partitions. The DENSE_RANK() function is applied to each partition.
partition的作用是分区,
Second, the ORDER BY  clause specifies the order of rows in each partition on which the DENSE_RANK() function operates.
 */ 
SELECT 
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores;

