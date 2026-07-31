-- Leetcode - 185. Department Top Three Salaries (https://leetcode.com/problems/department-top-three-salaries/)

-- Uma empresa quer saber quem ganha mais em cada um dos departamentos da empresa.
-- Funcionários que ganham mais em um departamento têm ovsalário dentro do top 3 maiores salários de um departamento.
-- Escreva uma solução para encontrar o top 3 salário maiores em cada departamento. Retorne em qualquer ordem.

-- Employee
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+

-- Department
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+


--------------------------------------------------------------------------------------


-- Quero encontrar o top 3 salários mais altos em cada departamento
-- Tenho as tabelas Employee de funcionários, que traz o salário e o departamento de cada
-- e tenho a tabela Department com o nome do departamento

-- Vou usar LEFT JOIN para acrescentar à tabela LEFT Employee o nome do departamento, que está na tabela RIGHT Department 
-- E então na tabela resultante do JOIN, vou rankear com DENSE_RANK (para não ter gaps) ordenando por salary 
-- e particionando por departamento (name da tabela Department), assim tenho os salários rankeados por departamento
-- Depois coloco uma condição para a tabela final em que só os registros com rank < 4, ou seja, de 1 a 3, vão ser considerados

SELECT 
    c.Department,
    c.Employee,
    c.Salary
FROM    
    -- Query interna que junta as tabelas por LEFT JOIN e rankea os salários por departamento
    (SELECT
        a.id,
        a.name as Employee,
        a.salary as Salary,
        a.departmentId,
        b.name as Department,
        DENSE_RANK() OVER(PARTITION BY b.name ORDER BY a.salary DESC) as rn
    FROM Employee as a
    LEFT JOIN Department as b
    ON a.departmentId = b.id) AS c
-- Filtro para a tabela final, retornando apenas registros dentro dos top 3 salários mais altos em cada departamento
WHERE rn < 4

