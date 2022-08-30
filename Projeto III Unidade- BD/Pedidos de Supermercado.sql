USE COMPRASSUPERMERCADO;
Create DATABASE COMPRASSUPERMERCADO;

CREATE TABLE SUPERMERCADO (
    idSupermercado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeSupermercado VARCHAR(45) NOT NULL,
    unidade VARCHAR(45)
);
CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(45) NOT NULL,
    descricaoDepartamento VARCHAR(45) NOT NULL,
    idSupermercado int, 
    constraint fk_idsupermercado_departamento foreign key (idSupermercado)
		references Supermercado(idSupermercado)
);
CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numeroCasa VARCHAR(45) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    cep VARCHAR(45) NOT NULL
);
CREATE TABLE FUNCIONARIO (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFuncionario VARCHAR(45) NOT NULL,
    cpfFuncionario VARCHAR(45) NOT NULL,
    
    idEndereco INT NOT NULL,
    CONSTRAINT fk_idEndereco_Funcionario FOREIGN KEY (idEndereco)
        REFERENCES ENDERECO (idEndereco),
    idDepartamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_funcionario FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento)
);
CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(45) NOT NULL,
    cpfCliente VARCHAR(11) NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT fk_idEndereco_Cliente FOREIGN KEY (idEndereco)
        REFERENCES ENDERECO (idEndereco)
);
CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ddd VARCHAR(45) NOT NULL,
    numero VARCHAR(45) NOT NULL,
    operadora VARCHAR(45) NOT NULL,
    idFuncionario int NOT NULL,
    constraint fk_idFuncionario_Telefone foreign key (idFuncionario) 
		references Funcionario(idFuncionario),
    idCliente int NOT NULL,
    constraint fk_idCliente_Telefone foreign key (idCliente)
		references Cliente(idCliente)
);
CREATE TABLE PRODUTO (
    idProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(45) NOT NULL,
    descricaoProduto VARCHAR(100) NOT NULL,
    precoProduto DOUBLE NOT NULL
    
);
CREATE TABLE COMPRA(
 idCompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 dataCompra VARCHAR(45) NOT NULL,
 quantidadeProduto INT NOT NULL,
 valorCompra DOUBLE NOT NULL,
 idFuncionario INT NOT NULL,
    constraint fk_idFuncionario_Compra foreign key (idFuncionario) 
		references Funcionario(idFuncionario),
    idCliente INT NOT NULL,
    constraint fk_idCliente_Compra foreign key (idCliente)
		references Cliente(idCliente)
);
CREATE TABLE ITENS_PRODUTO (
	idCompra INT NOT NULL,
    constraint fk_idCompra_ItensProduto foreign key (idCompra) 
		references Compra(idCompra),
        idProduto INT NOT NULL,
    constraint fk_idProduto_ItensProduto foreign key (idProduto) 
		references Produto(idProduto),
        primary key (idCompra, idProduto)
);

CREATE INDEX idx_IDSupermercado on SUPERMERCADO (IdSupermercado);
CREATE INDEX idx_IDDepartamento on DEPARTAMENTO (idDepartamento);
CREATE INDEX idx_IDEndereco on ENDERECO (idEndereco);
CREATE INDEX idx_IDFuncionario on FUNCIONARIO (idFuncionario);
CREATE INDEX idx_IDCliente on CLIENTE (idCliente);
CREATE INDEX idx_IDTelefone on TELEFONE (idTelefone);
CREATE INDEX idx_IDProduto on PRODUTO (idProduto);
CREATE INDEX idx_IDCompra on COMPRA (idCompra);
CREATE INDEX idx_IDCompra on ITENS_PRODUTO (idCompra);

INSERT INTO SUPERMERCADO (nomeSupermercado, unidade) 
VALUES ("Açai", "PA");

INSERT INTO DEPARTAMENTO (nomeDepartamento, descricaoDepartamento, idSupermercado )
VALUES ("Caixa", "Passar as Compras", 1),
       ("Reposição", "Repor Produtos", 1), 
       ("Entrega", "Entregar as Compras", 1),
       ("Segurança", "Fiscalizar", 1),
       ("Entegas", "Receber as estregas", 1);
       
INSERT INTO ENDERECO (numeroCasa, rua, cidade, cep ) 
VALUES ("123", "tiago anizio 123", "paulo Afonso", "123654-54"),
	   ("321", "osvaldo gamoes 432", "paulo Afonso", "123654-54"), 
       ("586", "santo antônio 321", "paulo Afonso", "123654-54"),
       ("951", "sebastião espedito 754", "paulo Afonso", "123654-54"),
       ("753", "coronel jon sá 784", "paulo Afonso", "123654-54");
       
INSERT INTO FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento )
VALUES ("mateus", "153456789", 1 , 1),
       ("eleno", "986357421", 1 , 1),
       ("saulo", "765893241", 2 , 2), 
       ("tiado", "968532741", 2 , 2), 
       ("lamartine", "196853247", 3 , 3), 
       ("sueli", "136254897", 3 , 3), 
       ("irinel", "862459317", 4 , 4), 
	   ("bernardo", "842659731", 4 , 4),
	   ("igor", "785694123", 5 , 5),
	   ("daniel", "365214987", 5 , 5);
        
INSERT INTO CLIENTE (nomeCliente, cpfCliente,idEndereco ) 
VALUES ("Eduardo", "111111111", 1), 
       ("Dário", "222222222", 2),
       ("sileno", "986573214", 1), 
       ("cabeça", "874596321", 2),
       ("lontrino", "986574321", 1), 
       ("cabiel", "735629841", 2),
       ("eniel", "6532174157", 1), 
       ("lisbido", "735629841", 2),
       ("jonato", "666666666", 1), 
       ("sirinel", "777777777", 3);
       
INSERT INTO TELEFONE (ddd, numero, operadora, idFuncionario, idCliente) 
VALUES ("75", "988880055", "OI", 1 , 1),
       ("75", "987569243", "OI", 2 , 2),
       ("75", "9691452125", "OI", 3 , 3),
       ("75", "988880055", "OI", 4 , 4),
       ("75", "987569243", "OI", 5 , 5),
       ("75", "9691452125", "OI", 6 , 6),
       ("75", "988880055", "OI", 7 , 7),
       ("75", "987569243", "OI", 8 , 8),
       ("75", "9691452125", "OI", 9 , 8),
       ("75", "988880055", "OI", 10 , 10);
       
INSERT INTO PRODUTO (nomeProduto, descricaoProduto, precoProduto )  
VALUES ("Arroz", "grão", 8.00),
      ("Feijão", "grão", 9.00), 
      ("Macarrão", "massa", 5.00),
      ("bala", "doce", 1.00),
      ("ameixa", "fruta", 5.00), 
      ("milho", "grão", 4.00),
      ("trigo", "farinha", 7.00),
      ("miojo", "massa", 2.00), 
      ("tomate", "fruta", 3.00),
      ("cuscuz", "farinha", 4.00);
      
INSERT INTO COMPRA (dataCompra, quantidadeProduto, valorCompra, idFuncionario, idCliente  ) 
VALUES   ("5 do 8 de 2022", 4, 28.00, 1, 1),
         ("5 do 8 de 2022", 32, 50.00, 2, 2), 
         ("10 do 9 de 2022", 42, 70.00, 1, 3),
         ("10 do 9 de 2022", 12, 40.00, 2, 4),
         ("11 do 11 de 2022", 6, 89.00, 1, 5), 
         ("11 do 11 de 2022", 17, 23.00, 2, 6),
         ("1 do 12 de 2022", 13, 85.00, 1, 7),
         ("1 do 12 de 2022", 2, 25.00, 2, 8), 
         ("25 do 12 de 2022", 26, 76.00, 1, 9),
         ("25 do 12 de 2022", 19, 90.00, 2, 10);
         
INSERT INTO ITENS_PRODUTO (idCompra, idProduto) 
VALUES (1, 1), 
       (2, 1), 
       (3, 2),
       (4, 2), 
       (5, 3), 
       (6, 3),
       (7, 4), 
       (8, 4), 
       (9, 5),
       (10, 5);


SELECT* FROM SUPERMERCADO;
SELECT* FROM DEPARTAMENTO;
SELECT* FROM ENDERECO;
SELECT* FROM FUNCIONARIO;
SELECT* FROM CLIENTE;
SELECT* FROM TELEFONE;
SELECT* FROM PRODUTO;
SELECT* FROM COMPRA;
SELECT* FROM ITENS_PRODUTO;



SELECT F.nomeFuncionario, T.operadora FROM FUNCIONARIO F, TELEFONE T
WHERE (F.idFuncionario = T.idFuncionario) and F.idFuncionario = 1;

SELECT F.nomeFuncionario, T.operadora, T.numero , E.cidade FROM FUNCIONARIO F, TELEFONE T, ENDERECO E
WHERE (F.idFuncionario = T.idFuncionario) AND (F.idEndereco = E.idEndereco) AND F.idFuncionario = 1;

SELECT P.nomeproduto, C.nomeCliente, CP.dataCompra, CP.valorCompra  FROM PRODUTO P
 INNER JOIN ITENS_PRODUTO IP  ON (P.idProduto = IP.idProduto) INNER JOIN COMPRA CP ON (IP.idCompra = CP.idCompra) 
 INNER JOIN CLIENTE C ON  (CP.idCliente = C.idCliente) and C.idCLiente = 1;
 
 
 -- FUNÇÕES DE AGREGAÇÃO
 -- (Quatidade de Registros)
 SELECT  COUNT(*) FROM produto;
 -- (Quatidade de Registros) retorna a quantidade de cadastro (Obs.. não conta valores null)
 SELECT  COUNT(distinct nomeProduto) FROM produto;
 SELECT  COUNT(distinct cidade) FROM endereco;
 
 -- (Valor maximo) Produto com maior valor cadastrado
 SELECT MAX(precoProduto) FROM produto;
 
 -- (Valor minimo) Produto com menor valor cadastrado
 SELECT MIN(precoProduto) FROM produto;
 
 -- (Soma dos Valoes) soma o preco de todos os produtos cadastrados
 SELECT SUM(precoProduto) FROM produto;
 
 -- (Media) Soma todos os valores e dividi pela quantidade 
 SELECT AVG(precoProduto) FROM produto;
 SELECT ROUND(AVG(precoProduto),2) FROM produto;
 
 
 -- Avaliação da III Unidade
 
 -- subQuery como uma coluna ( quantidade de vendas feitas por um funcionario)
  SELECT F.nomeFuncionario, (SELECT COUNT(C.idCompra) from COMPRA C
  WHERE C.idFuncionario = F.idFuncionario) As Quantia_de_Vendas from FUNCIONARIO F;
 
 
 -- subquery como um filtro (Data e valor da compra realizada pelo cliente x)
SELECT C.dataCompra, C.valorCompra, C.idCliente 
FROM COMPRA C
WHERE C.idCliente IN(SELECT CL.idCliente from Cliente CL);


 -- SubQuery como uma fonte de dados (nome do produto e media do valor da compra)
select x.nomeProduto, x.Media_da_Compra from (select p.nomeProduto, (select avg (c.valorCompra) from 
    Compra c, Itens_Produto ip where p.idProduto = ip.idProduto and c.idCompra = ip.idCompra) as 
     Media_da_Compra from Produto p) x;
 
 
 
 
 -- procedure sem paramentro
 DELIMITER $$
CREATE PROCEDURE LISTAR_CLIENTES()
BEGIN 
	select * from CLIENTE;
END $$
DELIMITER ;

CALL LISTAR_CLIENTES;


 -- procedure com parametro
 DELIMITER $$
CREATE PROCEDURE INSERIRPRODUTO
(IN  nome VARCHAR(45),
 IN descricao VARCHAR(100),
 IN preco INT)
BEGIN 
	INSERT INTO PRODUTO
    (nomeProduto, descricaoProduto, precoProduto)
    VALUES 
    (nome, descricao, preco );
     select *from produto;
END $$
DELIMITER ;
 
 CALL INSERIRPRODUTO("cebola", "raiz", 3);
 

 
 
 
 
