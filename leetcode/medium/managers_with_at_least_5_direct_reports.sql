-- Leetcode - 570. Managers with at Least 5 Direct Reports (https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)

-- Escreva uma solução para encontrar os gerentes que possuem 5 ou mais subordinados. 
-- Retorne a tabela em qualquer ordem.

-- Employee
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+



----------------------------------------------------------------------------



-- Quero encontrar os manager que possuem no mínimo 5 subordinados
-- Na tabelas, todos os funcionários (manager e não manager) são um id, os ids que são manager possuem managerId nulo
-- Os manager portanto são os ids que possuem managerId nulo
-- Posso usar a coluna managerId para entender quais ids são relacionados a cada manager
-- a partir disso, posso enumerar os ids e então filtrar os managers que possuírem mais de 5 ids atrelados a ele

-- Usei RANK para separando cada manager como uma partição e dentro dessas partições enumero ids dos employee
-- Então filtro essa tabela rankeada para pegar apenas os managerId que possuem rn >= 5
-- Uso CTE para que a query fique mais legível, assim tenho uma lista dos managerId que possuem 5 ou mais subordinados
with managers_5_reports_list as (
    -- Uso o distinct porque não quero que os manager se repitam
    SELECT distinct managerId FROM (
        SELECT
            id,
            name,
            department,
            managerId,
            RANK() OVER(PARTITION BY managerId ORDER BY id) as rn
        FROM Employee) as a
    WHERE rn >= 5)

-- Mas ainda preciso atrelar o nome do manager ao managerId, para identificar quem é
-- Faço um INNER JOIN para cruzar o managerId da tabela managers_5_reports_list com os ids da tabela Employee para descobrir o nome do manager
-- Uso o INNER JOIN porque quero apenas a INTERSEÇÃO entre as tabelas, ou seja, os name correspondentes ao managerId dos manager da lista managers_5_reports_list
SELECT name FROM Employee as b
INNER JOIN managers_5_reports_list as c
ON b.id = c.managerId