DROP TABLE produto;

DROP TABLE cliente CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

-- COMANDOS DQL (Data Query Language)

--Visualizando a tabela de clientes
SELECT * FROM clients

-- Selecionando colunas específicas 
SELECT firstname,lastname FROM clients

--Visualizando a tabela produtos
SELECT * FROM products 

--nome do produto, preço e desconto
SELECT productname, price, discount FROM products

--DESAFIO: exibir o nome do produto, preço e o preço com desconto
SELECT productname, price, price-price*discount AS "Desconto em reais" FROM products

--Exibe valores sem repetição
SELECT DISTINCT brand FROM products

--Calculadora
SELECT 	11*3

--funções
SELECT random ()

-- SELECT com clausula WHERE
 
--Operadores de comparação >,<, >=, <=, <> ou !=

-- Exibir produtos com valor acima de 100 reais 

SELECT productname, price FROM products 
WHERE price>=100

-- Operadores lógicos: AND, OR e NOT

-- Produtos entre 100 e 800 reais

SELECT productname, price FROM products
WHERE price>=100 AND price<=800 

-- Produtos cujo preço esteja abaixo de 100 ou acima de 800
SELECT productname, price FROM products
WHERE price<=100 OR price>=800

-- Desafio: listar todos os produtos da marca dell
SELECT productname FROM products
WHERE brand = 'dell'

-- Desafio: Listar todos os produtos criados por joão

SELECT productname, idclient FROM products
WHERE idclient = 2

--Desafio: listar todos os clientes com o id par
SELECT firstname, idclient FROM clients
WHERE idclient %2=0

-- COUNT
-- Quantos produtos foram vendidos no total?
SELECT COUNT (idproduct) FROM products

--Função avg (média)
--Qual o preço médio dos produtos vendidos?
SELECT AVG (price) FROM products

--Função max (máximo)
--Qual o preço mais alto negociando?
SELECT MIN(price) FROM products

--Função sum (soma)
--Qual o valor total vendido
SELECT SUM(price) FROM products

--ORDER BY / DESC
SELECT * FROM clients 
ORDER BY firstname

-- Exercícios:

-- 1. Quantos produtos da marca dell foram vendidos?
-- 2. Quantos produtos João comprou?
-- 3. Qual o preço médio dos produtos da dell?
-- 4. Qual o produto mais caro vendido?
-- 5. Qual o produto mais barato vendido?
-- 6. Qual o valor total de equipamentos dell vendidos?
-- 7. Quanto Rodrigo já gastou no eCommerce?
-- 8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.

--Exercicio 01
SELECT COUNT (idproduct) FROM products
WHERE brand = 'dell'

--Exercicio 02
SELECT productname, idclient FROM products
WHERE idclient = 2

--Exercicio 03
SELECT AVG (price) FROM products
WHERE brand = 'dell'

--Exercicio 04
SELECT MAX(productname) FROM products 
WHERE price = (SELECT MAX (price) FROM products)


--Exercicio 05
SELECT MIN(price) FROM products
WHERE price = (SELECT MIN (price) FROM products)

--Exercicio 06
SELECT SUM(price) FROM products
WHERE brand = 'dell'

--Exercicio 07
SELECT SUM(price) FROM products
WHERE idclient = 1

--Exercicio 08
SELECT productname, price FROM products
WHERE category = 'eletronicos'
ORDER BY price

--Exercicio 09
SELECT productname, price FROM products
WHERE idclient = 1
ORDER BY price DESC



