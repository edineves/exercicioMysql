
=====+++++++++++++++++= SEGUNDA PARTE ======

CREATE DATABASE Alunos;
USE Alunos;

CREATE TABLE Alunos.Aluno( 
RA         INT not null,
Nome       VARCHAR (250),
Sexo       VARCHAR (1) comment "F - Feminino / M - Masculino",
CONSTRAINT PK_RA primary key (RA),
CONSTRAINT Sexo check (Sexo IN ('F', 'M'))
);
SELECT * FROM Aluno;


CREATE TABLE Turma(
Numero_Turma          INT NOT NULL,
Dt_Inicio        DATETIME NOT NULL,
Dt_Termino       DATETIME NOT NULL,
CONSTRAINT PK_Numero_Turma primary key (Numero_Turma)
);
SELECT * FROM Turma;


CREATE TABLE Matricula(
Numero_Matricula            INT NOT NULL,
Dt_Matricula           DATETIME NOT NULL,
Dt_Cancelamento        DATETIME NOT NULL,
RA_Aluno                    INT NOT NULL,
Numero_Turma                INT NOT NULL,
CONSTRAINT PK_Numero_Matricula PRIMARY KEY (Numero_Matricula),
CONSTRAINT FK_RA_Aluno FOREIGN KEY (RA_ALUNO) REFERENCES Alunos.Aluno (RA),
CONSTRAINT FK_Num_Turma FOREIGN KEY (Numero_Turma) REFERENCES Alunos.Turma (Numero_Turma)
);
SELECT * FROM Matricula;

DROP TABLE IF EXISTS Alunos.Disciplina;
CREATE TABLE Alunos.Disciplina ( 
Codigo             INT NOT NULL,
Nome_Disciplina   VARCHAR (100),
CONSTRAINT PK_Codigo PRIMARY KEY (Codigo)
);
SELECT * FROM Disciplina;

DROP TABLE IF EXISTS Alunos.Professor;
CREATE TABLE Alunos.Professor ( 
Matr_Prof         INT NOT NULL,
Nome_Prof        VARCHAR (150),
CONSTRAINT PK_Matr_Prof PRIMARY KEY (Matr_Prof)
);
SELECT * FROM Professor;

DROP TABLE IF EXISTS Alunos.Oferecida;
CREATE TABLE Alunos.Oferecida ( 
Num_Oferecida   INT NOT NULL,
Sala            INT NOT NULL,
Bloco           INT NOT NULL,
Matr_Prof       INT NOT NULL,
Cod_Disciplina  INT NOT NULL,
Numero_Turma    INT NOT NULL,
CONSTRAINT PK_Num_Oferecida PRIMARY KEY (Num_Oferecida),
CONSTRAINT FK_Matr_Prof FOREIGN KEY (Matr_Prof) REFERENCES Alunos.Professor (Matr_Prof),
CONSTRAINT FK_Cod_Disciplina FOREIGN KEY (Cod_Disciplina) REFERENCES Alunos.Disciplina(Codigo),
CONSTRAINT FK_Numero_Turma FOREIGN KEY (Numero_Turma) REFERENCES Alunos.Turma(Numero_Turma)
);
SELECT * FROM Oferecida;

DROP TABLE IF EXISTS Alunos.Avaliacao;
CREATE TABLE Alunos.Avaliacao ( 
RA_Aluno1             INT NOT NULL,
Num_Oferecida         INT NOT NULL,
Matr_Prof1            INT NOT NULL,
Cod_Disciplina1       INT NOT NULL,
Nota_A1               INT NOT NULL,
Nota_A2               INT NOT NULL,
Nota_AF               INT NOT NULL,
CONSTRAINT PK_Avaliacao PRIMARY KEY (RA_Aluno1, Num_Oferecida, Matr_Prof1, Cod_Disciplina1),
CONSTRAINT FK_RA_Aluno1 FOREIGN KEY (RA_Aluno1) REFERENCES Alunos.Aluno(RA),
CONSTRAINT FK_Num_Oferecida FOREIGN KEY (Num_Oferecida) REFERENCES Alunos.Oferecida(Num_Oferecida),
CONSTRAINT FK_Matr_Prof1 FOREIGN KEY (Matr_Prof1) REFERENCES Alunos.Professor(Matr_Prof),
CONSTRAINT FK_Cod_Disciplina1  FOREIGN KEY (Cod_Disciplina1 ) REFERENCES Alunos.Disciplina(Codigo)
);
SELECT * FROM Avaliacao;

SHOW TABLES;

=================================== TERCEIRA PARTE ======
====================== 1 INSERÇÃO==

SELECT * FROM turma;
INSERT INTO Turma( Numero_Turma, Dt_Inicio, Dt_Termino) 
	       VALUES ( 1, '2021-02-15 19:00:00', '2021-12-20 19:00:00');           
INSERT INTO Turma( Numero_Turma, Dt_Inicio, Dt_Termino) 
	       VALUES (2, '2022-02-14 19:00:00', '2022-12-20 19:00:00');


SELECT * FROM Disciplina;
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 7258,'Banco de Dados');
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557257, 'Tecnica de Programacao');
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557254, 'Engenharia de Software' ); 
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557256, 'Analise de Projetos');
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557621, 'Redes de Computadores' );   
                   
				
SELECT * FROM Aluno;
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 25992538, 'Edison Neves Soares','M');
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 25705440, 'Iago Rocha Cezimbra','M');
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 26216809, 'Patrick Roberto Gaspar','M');
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 26433061, 'Tales Ferreira Silva','M'); 
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 27054012,  'Vinicius Padula da Costa ','M');

DELETE FROM Alunos.Aluno WHERE RA = 1;

INSERT INTO Aluno (RA, Nome, Sexo) VALUES  ( 09319725,'Fátima Nina Fernandes','F'),
										   (80386560,'Francisca Antônia Lorena Santos','F'),
										   (91039662,'Rodeigo Vicente Ruan Ferreira','M'),
										   (74794008,'Débora Rosa Mariah Ribeiro','F'),
                                           (14435857, 'Pietra Lorena Luiza Viana','F');
                                           
INSERT INTO Aluno (RA, Nome, Sexo) VALUES   (27253725, 'João Ricardo Felipe Viana','M'),
											( 314665778, 'Nathan Osvaldo José da Mota','M'),
											( 25547092,  'Luiza Ana Gonçalves','F'),
											( 18117930, 'Marcelo Lucas Danilo Novaes','M'),
											( 255495705, 'Tatiane Emanuelly Rodrigues','F'),
											( 41414294, 'Elias Lucca Pietro Santos','M'),
											( 228603699 , 'Alana Carla Elisa Corte Real','F'),
											( 17840752, 'Juan César Bruno Mendes','M' ),
											( 273739261, 'Alícia Carolina Rebeca Porto','F'),
											( 28609362, 'Isadora Andreia Bernardes','F');
                                           
 SELECT * FROM Matricula;
 DESCRIBE Matricula;
 INSERT INTO Matricula ( Numero_Matricula, Dt_Matricula, Dt_Cancelamento,  RA_Aluno, Numero_Turma) 
	                    VALUES( 1 , '2022-02-02 19:00:00', '2022-12-20 19:00:00', 25992538, 2),
							  ( 2 , '2022-02-01 19:00:00', '2022-12-20 19:00:00' , 25705440, 2),
                              ( 3 , '2022-02-05 19:00:00','2022-12-20 19:00:00' , 26216809,  2),
                              ( 4 , '2022-02-06 19:00:00', '2022-12-20 19:00:00' , 26433061, 2),
                              ( 5 , '2022-02-04 19:00:00', '2022-12-20 19:00:00' , 27054012, 2),
                              ( 6 , '2022-02-05 19:00:00', '2022-12-20 19:00:00' , 09319725, 2),
                              ( 7 , '2022-02-08 19:00:00', '2022-12-20 19:00:00' , 80386560, 2),
                              ( 8 , '2022-02-10 19:00:00', '2022-12-20 19:00:00' , 91039662, 2),
                              ( 9 , '2022-02-13 19:00:00', '2022-12-20 19:00:00' , 74794008, 2),
                              ( 10 , '2022-02-14 19:00:00', '2022-12-20 19:00:00' , 14435857, 2);
                              
INSERT INTO Matricula ( Numero_Matricula, Dt_Matricula, Dt_Cancelamento,  RA_Aluno, Numero_Turma) 
	                    VALUES( 11 , '2021-02-02 19:00:00', '2021-12-19 19:00:00' , 27253725, 1),                        
							  ( 12 , '2021-02-01 19:00:00', '2021-12-19 19:00:00', 314665778, 1),
                              ( 13 , '2021-02-05 19:00:00', '2021-12-19 19:00:00' , 25547092,  1),
                              ( 14 , '2021-02-06 19:00:00', '2021-12-19 19:00:00', 18117930, 1),
                              ( 15 , '2021-02-04 19:00:00', '2021-12-19 19:00:00', 255495705 , 1),
                              ( 16 , '2021-02-05 19:00:00', '2021-12-19 19:00:00', 41414294, 1),
                              ( 17 , '2021-02-08 19:00:00', '2021-12-19 19:00:00', 228603699 , 1),
                              ( 18 , '2021-02-10 19:00:00', '2021-12-19 19:00:00', 17840752, 1),
                              ( 19 , '2021-02-13 19:00:00', '2021-12-19 19:00:00', 273739261, 1),
                              ( 20, '2021-02-14 19:00:00', '2021-12-19 19:00:00', 28609362, 1);                                                                         
 SELECT * FROM Matricula;
 DESCRIBE Matricula;
 
 
                                           
=++++++++++++++++++++++++++++= 3.2 CONSULTAS =========
mostre os
nomes dos alunos matriculados em uma Disciplina de uma Turma, que
devem ser informados (0,2 ponto).

SELECT Nome_Alunos FROM Disciplina;


