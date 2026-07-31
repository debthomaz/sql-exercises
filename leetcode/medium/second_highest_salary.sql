-- Leetcode - 176. Second Highest Salary (https://leetcode.com/problems/second-highest-salary/)

-- Escreva uma solução para encontrar o segundo maior salário entre os funcionários.
-- Se não houver um segundo maior salário, retorne null.

-- Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+



-----------------------------------------------------------------------------


-- Quero o segundo maior salário da tabela de funcionários
-- Primeiro vou ordenar a tabela em ordem DECRESCENTE, para então usar o DENSE_RANK
-- Portanto, cada valor de salary terá o seu determinado rank e o rank 2 será o segundo maior salário
-- Depois vou filtrar a tabela para exibir apenas o salário com rank = 2, que será o segundo maior salário


-- Usando DENSE_RANK para rankear as linhas de acordo com os valores de salary em ordem DESC
with base as (
    SELECT 
        id,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) as rn
    FROM Employee
)

-- O rank setou todas as linhas de salary com mesmo valor no mesmo rank, então basta pegar o MAX ou MIN da coluna salary cujo rank = 2
-- para ter o segundo maior salário, pois os valores de um mesmo rank são iguais, então trazer o valor MIN ou MAX do mesmo rank é equivalente
-- MIN e MAX também garantem que caso não tenha um valor no rank 2, retornará null
SELECT
    MAX(salary) AS SecondHighestSalary
FROM base
WHERE rn = 2
