USE COMPRASSUPERMERCADO;
CREATE DATABASE COMPRASSUPERMERCADO;

CREATE TABLE SUPERMERCADO (00
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
    precoProduto INT NOT NULL
    
);
CREATE TABLE COMPRA(
 idCompra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 dataCompra VARCHAR(45) NOT NULL,
 quantidadeProduto VARCHAR(45) NOT NULL,
 valorCompra VARCHAR(45) NOT NULL,
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

INSERT INTO SUPERMERCADO (nomeSupermercado, unidade) VALUES ("Açai", "PA");
INSERT INTO DEPARTAMENTO (nomeDepartamento, descricaoDepartamento, idSupermercado )
VALUES ("Caixa", "Passar as Compras", 1), ("Reposição", "Repor Produtos", 1), ("Entrega", "Entregar as Compras", 1);
INSERT INTO ENDERECO (numeroCasa, rua, cidade, cep ) VALUES ("123", "tiago anizio 123", "paulo Afonso", "123654-54"),
 ("321", "osvaldo gamoes 432", "paulo Afonso", "123654-54"),  ("586", "santo antônio 321", "paulo Afonso", "123654-54");
INSERT INTO FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento )
 VALUES ("mateus", "153456789", 1 , 1),("lucas", "321654987", 2 , 2),("igor", "963852741", 3 , 3);
INSERT INTO CLIENTE (nomeCliente, cpfCliente,idEndereco ) VALUES ("Eduardo", "753869421", 1), 
("Dário", "735629841", 2),("Silvanio", "698741235", 3);
INSERT INTO TELEFONE (ddd, numero, operadora, idFuncionario, idCliente) VALUES ("75", "988880055", "OI", 1 , 1),
("75", "987569243", "OI", 2 , 2),("75", "9691452125", "OI", 3 , 3);
INSERT INTO PRODUTO (nomeProduto, descricaoProduto, precoProduto ) VALUES ("Arroz", "grão", 8),
("Feijão", "grão", 9), ("Macarrão", "massa", 5);
INSERT INTO COMPRA (dataCompra, quantidadeProduto, valorCompra, idFuncionario, idCliente  ) VALUES ("5 do 8 de 2022", "4", "28.00", 1, 1),
("5 do 8 de 2022", "4", 50.00, 1, 1), ("5 do 8 de 2022", "4", "37.00", 1, 1);
INSERT INTO ITENS_PRODUTO (idCompra, idProduto) VALUES (1, 1), (2, 2), (3, 3);


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
 SELECT COUNT(*) FROM cliente;
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
 
 SELECT PRECOPRODUTO
 
 
 
 