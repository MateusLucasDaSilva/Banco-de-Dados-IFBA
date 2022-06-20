
USE OFICINA;


CREATE TABLE EMPRESA (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);


CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Departamento VARCHAR(45) NOT NULL,
    descricao_Departamento VARCHAR(10) NOT NULL,
    idEmpresa INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
);
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
CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(20) NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero_Rua VARCHAR(5) NOT NULL
);
CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Cliente VARCHAR(120) NOT NULL,
    cpf_Cliente VARCHAR(11) NOT NULL,
	idEndereco INT,
    CONSTRAINT fk_idEndereco_Cliente FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
);
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
CREATE TABLE SERVICO (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Serico VARCHAR(10) NOT NULL,
    recursos VARCHAR(200)
);
CREATE TABLE ITENS_OS(
idServico INT NOT NULL,
idOS INT NOT NULL,
CONSTRAINT fk_idServico_itens FOREIGN KEY(idServico)
 REFERENCES Servico(idServico),
CONSTRAINT fk_idOS_itens FOREIGN KEY(idOS)
 REFERENCES OS(idOS),
PRIMARY KEY (idServico, idOS)
);



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


INSERT INTO 