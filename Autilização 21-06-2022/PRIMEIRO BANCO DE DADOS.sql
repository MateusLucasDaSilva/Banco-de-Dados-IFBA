
use oficina;

create database oficina;

CREATE TABLE Empresa (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);

CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bairroEndereco VARCHAR(30) NOT NULL,
    ruaEndereco VARCHAR(30) NOT NULL,
    numeroEndereco INT NOT NULL,
    cepEndereco VARCHAR(12) NOT NULL
);

CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ddd INT NOT NULL,
    numero INT NOT NULL,
    idFuncionario int,
    constraint fk_idFuncionario_Telefone foreign key (idFuncionario) 
		references Funcionario(idFuncionario),
    idCliente int,
    constraint fk_idCliente_Telefone foreign key (idCliente)
		references Cliente(idCliente)
);

CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(45) NOT NULL,
    descricaoDepartamento VARCHAR(100) NOT NULL,
    idEmpresa INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
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

CREATE TABLE OS (
    idOS INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataSolicitacao VARCHAR(10) NOT NULL,
    dataPrevisao VARCHAR(10),
    resposta VARCHAR(45),
    idFuncionario INT NOT NULL,
    CONSTRAINT fk_idFuncionario_OS FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
    idDepartamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_OS FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
    idCliente INT NOT NULL,
    CONSTRAINT fk_idCliente_OS FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente)
);

CREATE TABLE Servico (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(45) NOT NULL,
    recursos VARCHAR(200) NOT NULL
);

CREATE TABLE ITENS_OS (
	idServico int not null,
    constraint fk_idServico_ItensOS foreign key (idServico) 
		references Servico(idServico),
	idOS int not null,
    constraint fk_idOS_ItensOS foreign key (idOS) 
		references OS(idOS),
	primary key (idServico, idOS)
);

-- INDEX:

CREATE INDEX idx_IDEmpresa on Empresa (idEmpresa);
CREATE INDEX idx_IDEndereco on Endereco (idEndereco);
CREATE INDEX idx_IDTelefone on Telefone (idTelefone);
CREATE INDEX idx_IDDepartamento on Departamento (idDepartamento);
CREATE INDEX idx_IDFuncionario on Funcionario (idFuncionario);
CREATE INDEX idx_IDCliente on Cliente (idCliente);
CREATE INDEX idx_IDos on OS (idOS);
CREATE INDEX idx_IDServico on Servico (idServico);
CREATE INDEX idx_IDServico on ITENS_OS (idServico);
CREATE INDEX idx_IDos on ITENS_OS (idOS);

-- INSERT:

-- endereço 1:
insert into ENDERECO (bairroEndereco, ruaEndereco, numeroEndereco, cepEndereco) values ("Perpetuo Socorro", "Joana Angelica", "530", "48603-000");
-- endereço 2:
insert into ENDERECO (bairroEndereco, ruaEndereco, numeroEndereco, cepEndereco) values ("BNH", "Sol", "27", "48609-001");

insert into EMPRESA (nomeEmpresa, tipo) values ("ZX", "Matriz");
insert into SERVICO (nomeServico, recursos) values ("jogar bola", "xxxxxx");
insert into DEPARTAMENTO (nomeDepartamento, descricaoDepartamento, idEmpresa) values ("Diren", "Direção da empresa", 1);
insert into CLIENTE (nomeCliente, cpfCliente, idEndereco) values ("Ze Maria", "12345678998", 2);
insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("mariana", "98765432123", 1, 1);
insert into TELEFONE (ddd, numero, idFuncionario, idCliente) values ("75", "40028922", 1, 1);
insert into OS (dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values ("10/04/22", "17/04/22", "yyy", 1, 1, 1);
insert into ITENS_OS (idServico, idOs) values ("5", "5");

-- SELECT:

Select * from empresa;
Select * from endereco;
Select * from departamento;
Select * from servico;
Select * from cliente;
Select * from funcionario;
Select * from telefone;
Select * from os;
Select * from itens_os;

Select * from os, funcionario;
Select ddd, numero from telefone;

-- UPDATE:

UPDATE cliente set nomecliente = "firula" where idcliente = 1;

-- Querys:

select f.nomeFuncionario, s.nomeServico from funcionario f, servico s, itens_os x, os o where
	f.idFuncionario = o.idFuncionario and
    o.idOS = x.idOS and
    s.idServico = x.idServico;
    

-- NOVOS INSERTS:

insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("lucas", "98188708776", 1, 1);
insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("isadora", "7514538742", 1, 1);
insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("taty", "14526975359", 1, 1);
insert into FUNCIONARIO (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("pedro", "24863147859", 1, 1);

insert into OS (dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values ("22/04/22", "29/04/22", "www", 2, 1, 1);
insert into OS (dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values ("02/05/22", "07/05/22", "mmm", 3, 1, 1);

insert into ITENS_OS (idServico, idOs) values ("1", "2");
insert into ITENS_OS (idServico, idOs) values ("1", "3");

INSERT INTO departamento (nomeDepartamento,descricaoDepartamento,idEmpresa)
	VALUES
		("erat volutpat.","Donec non justo. Proin non",1),
		("Donec est","orci. Donec nibh. Quisque nonummy ipsum",1),
		("natoque penatibus","Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,",1),
		("non, feugiat","ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris",1),
		("lectus ante","Quisque libero lacus, varius et, euismod et, commodo at,",1),
		("Suspendisse tristique","lorem ut aliquam iaculis, lacus",1),
		("leo. Cras","non leo. Vivamus nibh dolor,",1),
		("amet massa.","nonummy ipsum non",1),
		("metus. In","ut, sem. Nulla interdum. Curabitur dictum. Phasellus in",1),
		("est, vitae","cursus a, enim. Suspendisse aliquet, sem",1);
        
INSERT INTO endereco (bairroEndereco,ruaEndereco,numeroEndereco,cepEndereco)
	VALUES
		("ornare","sapien molestie","627","42525688"),
		("pede sagittis augue,","enim mi tempor","486","44378202"),
		("non quam. Pellentesque","Morbi","857","43272065"),
		("et, eros.","mauris sit","163","57761741"),
		("vel","pellentesque. Sed dictum.","744","56613113"),
		("pretium","placerat","292","59548788"),
		("nonummy. Fusce fermentum","interdum","594","57767646"),
		("lorem. Donec elementum,","porttitor scelerisque","792","23541855"),
		("Donec tempus,","Integer","375","81361262"),
		("In tincidunt congue","amet ultricies","763","38712830"),
		("montes","egestas","523","36656096"),
		("est,","augue scelerisque","407","47467577"),
		("dictum eu, eleifend","feugiat. Lorem","856","24982805"),
		("vestibulum","adipiscing lacus.","221","77821840"),
		("dolor. Quisque","eleifend. Cras sed","326","40313167"),
		("Nam interdum enim","at arcu.","408","38506343"),
		("pede,","Suspendisse tristique neque","138","21565770"),
		("nec ante","fringilla","388","13014781"),
		("justo.","convallis erat, eget","568","15741254"),
		("et risus.","amet","428","12874662");

INSERT INTO funcionario (nomeFuncionario,cpfFuncionario,idEndereco,idDepartamento)
	VALUES
		("aliquet","54586883623",13,6),
		("luctus","05135199112",14,7),
		("bibendum.","26244408871",13,11),
		("nisi","98384388478",5,2),
		("lorem","41616337656",22,6),
		("mauris,","54548716084",13,8),
		("lectus","22877619633",20,8),
		("feugiat.","36083741578",8,10),
		("tempor","03113422993",13,7),
		("aliquet.","76545716280",9,10),
		("Aliquam","00165691858",11,8),
		("a,","07580454333",8,8),
		("non,","44735724585",17,11),
		("velit","84841576359",19,5),
		("porttitor","35839758866",19,6),
		("non,","34522421278",7,6),
		("Proin","67628114233",18,5),
		("bibendum","86042349884",9,6),
		("sagittis","52866645693",8,4),
		("elit.","43876556367",19,7);
        
INSERT INTO cliente (nomeCliente,cpfCliente,idEndereco)
	VALUES
		("volutpat","85484289241",6),
		("rutrum","56321418092",4),
		("non,","02984441825",20),
		("commodo","88182619013",17),
		("est.","52774524576",6),
		("eu,","58014257028",1),
		("est","97043880808",12),
		("ac","46728867188",14),
		("a,","46335520525",10),
		("consectetuer","90232404107",13);
        
INSERT INTO os (dataSolicitacao,dataPrevisao,resposta,idFuncionario,idDepartamento,idCliente)
	VALUES
		("8810602","5267141","accumsan",11,3,7),
		("5692563","5508452","ullamcorper. Duis",9,2,3),
		("5458850","5486447","varius",22,4,6),
		("7811506","1557365","ante",4,4,4),
		("5366658","2420844","Proin eget odio.",8,8,3),
		("6981392","4515169","interdum ligula",19,9,4),
		("7552328","5361334","aliquam arcu.",23,3,11),
		("4202783","8652123","felis.",23,1,5),
		("3328810","7483937","faucibus ut,",6,5,3),
		("4852322","6701426","nisl. Quisque",4,10,3);

INSERT INTO Servico (nomeServico,recursos)
	VALUES
		("dolor","sed"),
		("hendrerit.","posuere"),
		("arcu.","augue ac"),
		("nulla","lectus convallis est,"),
		("sollicitudin","eu neque"),
		("blandit","mi"),
		("mollis","per conubia nostra,"),
		("ligula","ullamcorper eu,"),
		("Integer","Ut sagittis"),
		("ac,","porttitor");

INSERT INTO itens_OS (idServico,idOS)
	VALUES
		(2,45),
		(3,46),
		(4,47),
		(5,48),
		(6,49),
		(7,50),
		(8,51),
		(9,52),
		(10,53),
		(11,54);


-- JOINS INNER: 

-- Listar os serviços realizados por um determinado departamento:
select d.idDepartamento, d.nomeDepartamento, s.nomeServico from servico s inner join Itens_OS i ON (i.idServico = s.idServico)
	inner join OS os ON (i.idOS= os.idOS)
    inner join Departamento d ON (d.idDepartamento = os.idDepartamento)
    and d.idDepartamento = 5;

-- Listar os funcionários que já realizaram algum tipo de serviço:
select f.idFuncionario, f.nomeFuncionario, s.nomeServico from servico s inner join Itens_OS i ON (i.idServico = s.idServico)
	inner join OS os ON (i.idOS = os.idOS)
    inner join Funcionario f ON (f.idFuncionario = os.idFuncionario);
     
-- Saber quais clientes já realizaram determinado serviço:
select c.idCliente, c.nomeCliente, s.nomeServico from servico s inner join Itens_OS i ON (i.idServico = s.idServico)
	inner join OS os ON (i.idOS = os.idOS)
    inner join Cliente c ON (c.idCliente = os.idCliente);








