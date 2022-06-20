
USE OFICINA;


CREATE TABLE EMPRESA (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);
insert into EMPRESA ( nomeEmpresa, tipo) values(  "Oficina do zezinho", "matriz");
insert into EMPRESA ( nomeEmpresa, tipo) values(  "tonhinho", "filial");

CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Departamento VARCHAR(45) NOT NULL,
    descricao_Departamento VARCHAR(10) NOT NULL,
    idEmpresa INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
);
insert into DEPARTAMENTO ( nome_Departamento, descricao_Departamento, idEmpresa ) values(  "lavagem", "lavagem", 1);


CREATE TABLE FUNCIONARIO (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Funcionario VARCHAR(120) NOT NULL,
    cpf_Funcionario VARCHAR(11) NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT fk_idEndereco_funcionario FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco),
    
    idDepartamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_funcionario FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento)
);
insert into FUNCIONARIO ( nome_Funcionario, cpf_Funcionario, idEndereco, idDepartamento ) values("brenda","65846846", 1, 6);


CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(4) NOT NULL,
    ddd VARCHAR(2) NOT NULL,
    numero_Telefone VARCHAR(9) NOT NULL,
    idFuncionario INT,
    idCliente INT,
    CONSTRAINT fk_idfuncionario_telefone FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
	CONSTRAINT fk_idCliente_telefone FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);
insert into TELEFONE ( codigo, ddd, numero_Telefone, idFuncionario, idCliente ) values(  "55", "75", "988068976", 1, 1);


CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(20) NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero_Rua VARCHAR(5) NOT NULL
);
insert into ENDERECO ( estado, rua, numero_Rua ) values(  "Bahia", "Marechal 556", "12");
insert into ENDERECO ( estado, rua, numero_Rua ) values(  "Bahia", "Centro", "3");


CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Cliente VARCHAR(120) NOT NULL,
    cpf_Cliente VARCHAR(11) NOT NULL,
	idEndereco INT,
    CONSTRAINT fk_idEndereco_Cliente FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
);
insert into CLIENTE ( nome_Cliente, cpf_Cliente, idEndereco ) values(  "Mateus", "86592970596", 1);
CREATE TABLE OS (
    idOs INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataSolicitacao VARCHAR(10) NOT NULL,
    dataPrevisao VARCHAR(10) NOT NULL,
    resposta VARCHAR(10) NOT NULL,
    idFuncionario INT NOT NULL,
    idDepartamento INT NOT NULL,
	idCliente INT NOT NULL,
    CONSTRAINT fk_idFuncionario_OS FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
    CONSTRAINT fk_idDepartamento_OS FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
    CONSTRAINT fk_idCliente_OS FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);
insert into OS ( dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente ) values(  "200522",  "300522","Sim", 1, 1, 1);


CREATE TABLE SERVICO (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Serico VARCHAR(10) NOT NULL,
    recursos VARCHAR(200)
);
insert into SERVICO ( nome_Serico, recursos ) values(  "trocaPenel", "chave de roda, e macaco idraulico");


CREATE TABLE ITENS_OS(
idServico INT NOT NULL,
idOS INT NOT NULL,
CONSTRAINT fk_idServico_itens FOREIGN KEY(idServico)
 REFERENCES Servico(idServico),
CONSTRAINT fk_idOS_itens FOREIGN KEY(idOS)
 REFERENCES OS(idOS),
PRIMARY KEY (idServico, idOS)
);
insert into ITENS_OS ( idServico, idOS ) values( 1, 2);



CREATE INDEX IDX_EMPRESA ON EMPRESA(idEmpresa);
CREATE INDEX IDX_DEPARTAMENTO ON DEPARTAMENTO(idDepartamento);
CREATE INDEX IDX_FUNCIONARIO ON FUNCIONARIO(idFuncionario);
CREATE INDEX IDX_TELEFONE ON TELEFONE(idTelefone);
CREATE INDEX IDX_ENDERECO ON ENDERECO(idEndereco);
CREATE INDEX IDX_ENDERECO ON ENDERECO(idEndereco);
CREATE INDEX IDX_ENDERECO ON ENDERECO(idEndereco);
CREATE INDEX IDX_CLIENTE ON CLIENTE(idFuncionario);
CREATE INDEX IDX_OS ON OS(idOS);
CREATE INDEX IDX_SERVICO ON SERVICO(idSERVICO);
CREATE INDEX IDX_ITENS_OS ON ITENS_OS(idOS);
CREATE INDEX IDX_ITENS_SERVICO ON ITENS_OS(idServico);



ALTER TABLE departamento CHANGE nome_departamento nomeDepartamento Varchar(100) not null;
-- Modicficar um campo da tabela

ALTER TABLE FUNCINARIO ADD Teste_de_adicao varchar(100);
-- adicionando um novo elemento da tabela 

ALTER TABLE FUNCINARIO DROP Teste_de_adicao;
-- excluindo um campo da tebela
SELECT*FROM funcionario;
-- exibi todos os dados cadastrados na tabela 

SELECT*FROM empresa where IdEmpresa;
-- busca apenas 1 registro

UPDATE funcionario SET nome_Funcionario = "lucas" WHERE idfuncionario = 2;
-- atualiza os dados de um campo da tabela
DELETE FROM servico WHERE idServico >= 2 and idServico <= 6  ;
-- deletar uma lisra de elementos cadastrados na tabela

SELECT C.NOME_CLIENTE, T.NUMERO,C.CPF_CLIENTE, E.RUAENDERECO FROM CLIENTE C, TELEFONE T, ENDERECO E WHERE 
C.IDCLIENTE = T.IDCLIENTE AND C.IDENDERECO = E.IDENDERECO ;
--  buscar elementos especificos da tebela 

SELECT F.nome_Funcionario, S.Nome_serico from Funcinario F, Servico S, OS O, ITENS_OS I WHERE F.IdFuncionario = O.IdFuncionario;


INSERT INTO departamento (nome_departamento,descricao_departamento,idEmpresa)
VALUES
  ("Donec egestas.","mus. Donec dignissim magna a tortor. Nunc commodo auctor",1),
  ("taciti sociosqu","vel quam dignissim pharetra.",1),
  ("iaculis odio.","dictum eu, placerat eget, venenatis a, magna.",1),
  ("dui, in","sit amet orci. Ut sagittis lobortis mauris.",1),
  ("Nam consequat","consectetuer ipsum nunc id enim. Curabitur massa.",1),
  ("tristique pharetra.","Nulla tincidunt, neque",1),
  ("non, lacinia","Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam",1),
  ("Suspendisse dui.","Vestibulum ante ipsum primis in faucibus orci",1),
  ("montes, nascetur","commodo hendrerit. Donec porttitor tellus non magna.",1),
  ("varius. Nam","scelerisque, lorem ipsum sodales purus, in",1);



INSERT INTO endereco (estado,rua,numero_Rua)
VALUES
  ("375-4237 Eget, Rd.","consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis","sodales. Mauris blandit enim consequat"),
  ("Ap #511-5218 Eleifend. Av.","sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet.","Curabitur consequat,"),
  ("425-2533 Curabitur Road","nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna","dolor egestas rhoncus. Proin"),
  ("P.O. Box 724, 7276 Quis Rd.","hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet","Nullam"),
  ("760 Tristique St.","et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac","Proin non massa"),
  ("6914 Cum Avenue","Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,","dolor, nonummy ac, feugiat non, lobortis"),
  ("Ap #636-9296 Imperdiet Av.","sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit","ultricies sem magna nec quam. Curabitur vel lectus."),
  ("4530 Ac Road","montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris","hendrerit neque. In ornare sagittis"),
  ("P.O. Box 535, 4569 Facilisis. St.","aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc","Mauris magna. Duis dignissim"),
  ("961-9213 Est Rd.","ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin","diam dictum sapien. Aenean massa. Integer vitae nibh.");


INSERT INTO funcionario (nome_funcionario,cpf_funcionario,idEndereco,idDepartamento)
VALUES
  ("Demetria Williamson","3059375",6,18),
  ("Marah Wade","2714547",7,9),
  ("Alma Foster","6186468",2,7),
  ("Hiram Griffin","1445708",4,12),
  ("Judith Oneil","5738055",8,9),
  ("Lucian Boyer","2163351",5,8),
  ("Claire Shannon","3824676",6,11),
  ("Celeste Brennan","6230618",5,17),
  ("Joel Chambers","3339325",2,19),
  ("Raven Hendrix","5892546",8,19);
