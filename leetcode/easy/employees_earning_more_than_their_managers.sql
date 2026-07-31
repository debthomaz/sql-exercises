-- Leetcode - Exercício 181: Employees Earning More Than Their Managers (https://leetcode.com/problems/employees-earning-more-than-their-managers/)

-- Escreva uma solução que traga os funcionários que ganham mais que seus gerentes.
-- O resultado pode estar em qualquer ordem.

-- Tabela Employee:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+


-------------------------------------------------------------------------------------------------



-- Quero uma tabela final com as colunas Employee dos funcionários que ganham mais que seus gerentes
-- Os funcionários estão todos na coluna name, não há distinção entre eles
-- Na coluna de id também não há distinção entre funcionários e gerentes
-- Mas cada id é vinculado a um managerId, que é o id do gerente daquele funcionário
-- Se o managerId é nulo, significa que o funcionário não tem gerente
-- Portanto, quero fazer um JOIN da tabela Employee com ela mesma, separando os salários em colunas diferentes: employeeSalary e managerSalary


-- Uso o comando LEFT JOIN para retornar a tabela Employee com a coluna salary como employeeSalary com a adição da mesma tabela Employee 
-- mas com a coluna salary como managerSalary, vinculando o managerId com o id da tabela Employee
-- com as colunas employeeSalary e managerSalary, posso comparar os salários de cada funcionário com o salário do seu gerente e obter aqueles que ganham mais que seus gerentes
SELECT c.Employee FROM
    -- Query interna que retorna a tabela Employee com as colunas employeeSalary e managerSalary
    (SELECT
        a.id,
        a.name as Employee,
        a.salary as employeeSalary,
        a.managerId,
        b.salary as managerSalary
    FROM Employee as a
    LEFT JOIN (SELECT id, salary FROM Employee) as b
    ON b.id = a.managerId
    ) as c
-- Filtro para retornar apenas os funcionários que ganham mais que seus gerentes
WHERE c.employeeSalary > c.managerSalary

