CREATE DATABASE ex
GO
USE ex

CREATE TABLE filme(
id		INT				NOT NULL	IDENTITY,
titulo	VARCHAR(10)		NOT NULL,
ano		INT,
PRIMARY KEY(id)
)

CREATE TABLE estrela(
id			INT				NOT NULL	IDENTITY,
titulo		VARCHAR(50)		NOT NULL,
PRIMARY KEY(id)
)

CREATE TABLE filme_estrela(
filmeid		INT			NOT NULL,
estrelaid	INT			NOT NULL,
PRIMARY KEY (filmeid, estrelaid),
FOREIGN KEY (filmeid) REFERENCES filme(id),
FOREIGN KEY (estrelaid) REFERENCES estrela(id)
)

CREATE TABLE dvd(
num				INT				NOT NULL	IDENTITY,
data_fabricacao	DATETIME		NOT NULL	CHECK (data_fabricacao < GETDATE()),
filmeid			INT,
PRIMARY KEY(num),
FOREIGN KEY (filmeid) REFERENCES filme(id)
)

CREATE TABLE cliente(
num_cadastro	INT				NOT NULL	IDENTITY,
nome			VARCHAR(70)		NOT NULL,
locadoura		VARCHAR(150)	NOT NULL,
num				INT				NOT NULL,
cep				CHAR(8)			NOT NULL,
PRIMARY KEY(num_cadastro)
)

CREATE TABLE locacao(
dvdnum					INT				NOT NULL,
clientenum_cadastro		INT				NOT NULL,
data_locacao			INT				NOT NULL	IDENTITY,
data_devolucao			DATETIME		NOT NULL	CHECK (data_devolucao < GETDATE()),
valor					DECIMAL(7,2)	NOT NULL	CHECK (valor > 0),
PRIMARY KEY(dvdnum, clientenum_cadastro, data_locacao),
FOREIGN KEY (dvdnum) REFERENCES dvd(num),
FOREIGN KEY (clientenum_cadastro) REFERENCES cliente(num_cadastro)
)

INSERT INTO filme (id, titulo, ano) VALUES
('1001', 'Whiplash', '2015'),
('1002', 'Birdman', '2015'),
('1003', 'Interestelar', '2014'),
('1004', 'A Culpa é das estrelas', '2014'),
('1005', 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', '2014'),
('1006', 'Sing', '2016')

INSERT INTO estrela VALUES
('9901', 'Michael Keaton', 'Michael John Douglas'),
('9902', 'Emma Stone', 'Emily Jean Stone'),
('9903', 'Miles Teller', NULL),
('9904', 'Steve Carell', 'Steven John Carell'),
('9905', 'Jennifer Garner', 'Jennifer Anne Garner')

INSERT INTO filme_estrela VALUES
('1002', '9901'),
('1002', '9902'),
('1001', '9903'),
('1005', '9904'),
('1005', '9905')

INSERT INTO dvd VALUES
('10001', '2020-12-02', '1001'),
('10002', '2019-10-18', '1002'),
('10003', '2020-04-03', '1003'),
('10004', '2020-12-02', '1001'),
('10005', '2019-10-18', '1004'),
('10006', '2020-04-03', '1002'),
('10007', '2020-12-02', '1005'),
('10008', '2019-10-18', '1002'),
('10009', '2020-04-03', '1003')

INSERT INTO cliente VALUES
('5501', 'Matilde Luz', 'Rua Síria', '150', '03086040'),
('5502', 'Carlos Carreiro', 'Rua Bartolomeu Aires', '1250', '04419110'),
('5503', 'Daniel Ramalho', 'Rua Itajutiba', '169', NULL),
('5504', 'Roberta Bento', 'Rua Jayme Von Rosenburg', '36', NULL),
('5505', 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', '235', '02917110')

INSERT INTO locacao VALUES
('10001', '5502', '2021-02-18', '2021-02-21', '3.50'),
('10009', '5502', '2021-02-18', '2021-02-21', '3.50'),
('10002', '5503', '2021-02-18', '2021-02-19', '3.50'),
('10002', '5505', '2021-02-20', '2021-02-23', '3.00'),
('10004', '5505', '2021-02-20', '2021-02-23', '3.00'),
('10005', '5505', '2021-02-20', '2021-02-23', '3.00'),
('10001', '5501', '2021-02-24', '2021-02-26', '3.50'),
('10008', '5501', '2021-02-24', '2021-02-26', '3.50')