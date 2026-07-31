-- Leetcode - Exercício 175: Combine Two Tables (https://leetcode.com/problems/combine-two-tables/)

-- Escreva uma solução que traga first name, last name, city e state de cada pessoa da tabela Person. 
-- Se o endereço de um personId não estiver presente na tabela Address, retorne null. 
-- A tabela deve ser retornada em qualquer ordem.


-- Tabela Person:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | personId    | int     |
-- | lastName    | varchar |
-- | firstName   | varchar |
-- +-------------+---------+


-- Tabela Address:
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | addressId   | int     |
-- | personId    | int     |
-- | city        | varchar |
-- | state       | varchar |
-- +-------------+---------+



-------------------------------------------------------------------------------------------------

-- Quero uma tabela final com as colunas firstName, lastName, city e state
-- A tabela Person possui as colunas lastName e firstName, enquanto a tabela Address possui as colunas city e state
-- Basta então unir tais colunas de cada tabela em uma nova tabela final, trazendo as linhas de acordo com o personId

-- Uso o comando LEFT JOIN para retornar a tabela LEFT com a adição da INTERSEÇÃO entre as tabelas, ou seja,
-- a tabela LEFT (Person) acrescida das informações da tabela RIGHT (Address) que estão na interseção entre elas (possuem mesmo personId)
SELECT 
    a.firstName, 
    a.lastName, 
    b.city, 
    b.state
FROM Person as a
LEFT JOIN Address as b
ON a.personId = b.personId


