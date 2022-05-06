==========BANCO DE DADOS ALUNOS . V2 ====================
==========================PARTE 2========================
CREATE DATABASE ALUNOS;	
USE Alunos;

CREATE TABLE Alunos.Aluno( 
RA             INT not null,
Nome           VARCHAR (250),
Sexo       	   VARCHAR (1) comment "F - Feminino / M - Masculino",
               CONSTRAINT PK_RA primary key (RA),
               CONSTRAINT Sexo check (Sexo IN ('F', 'M'))
);
	
SELECT * FROM Aluno;
DESCRIBE ALUNO;


CREATE TABLE Turma(
Numero_Turma             INT NOT NULL,
Dt_Inicio               DATE NOT NULL,
Dt_Termino              DATE NOT NULL,
CONSTRAINT PK_Numero_Turma primary key (Numero_Turma)
);
SELECT * FROM Turma;
DESCRIBE Turma;

CREATE TABLE Matricula(
Numero_Matricula                                  INT NOT NULL,
Dt_Matricula                                     DATE NOT NULL,
Dt_Cancelamento                                  DATE NOT NULL,
RA_Aluno                                          INT NOT NULL,
Numero_Turma                                      INT NOT NULL,
CONSTRAINT PK_Numero_Matricula PRIMARY KEY (Numero_Matricula),
CONSTRAINT FK_RA_Aluno FOREIGN KEY (RA_ALUNO) REFERENCES Alunos.Aluno (RA),
CONSTRAINT FK_Num_Turma FOREIGN KEY (Numero_Turma) REFERENCES Alunos.Turma (Numero_Turma)
);
SELECT * FROM Matricula;
DESCRIBE Matricula;

DROP TABLE IF EXISTS Alunos.Disciplina;
CREATE TABLE Alunos.Disciplina ( 
Codigo                      INT NOT NULL,
Nome_Disciplina            VARCHAR (100),
CONSTRAINT PK_Codigo PRIMARY KEY (Codigo)
);
SELECT * FROM Disciplina;
DESCRIBE Disciplina;

DROP TABLE IF EXISTS Alunos.Professor;
CREATE TABLE Alunos.Professor ( 
Matr_Prof                  INT NOT NULL,
Nome_Prof             VARCHAR (150),
CONSTRAINT PK_Matr_Prof PRIMARY KEY (Matr_Prof)
);
SELECT * FROM Professor;
DESCRIBE Professor;

DROP TABLE IF EXISTS Alunos.Oferecida;
CREATE TABLE Alunos.Oferecida ( 
Num_Oferecida    INT NOT NULL,
Sala                         INT NOT NULL,
Bloco                      INT NOT NULL,
Matr_Prof             INT NOT NULL,
Cod_Disciplina      INT NOT NULL,
Numero_Turma    INT NOT NULL,
CONSTRAINT PK_Num_Oferecida PRIMARY KEY (Num_Oferecida),
CONSTRAINT FK_Matr_Prof FOREIGN KEY (Matr_Prof) REFERENCES Alunos.Professor (Matr_Prof),
CONSTRAINT FK_Cod_Disciplina FOREIGN KEY (Cod_Disciplina) REFERENCES Alunos.Disciplina(Codigo),
CONSTRAINT FK_Numero_Turma FOREIGN KEY (Numero_Turma) REFERENCES Alunos.Turma(Numero_Turma)
);		
SELECT * FROM Oferecida;
DESCRIBE Oferecida;

DROP TABLE IF EXISTS Alunos.Avaliacao;
CREATE TABLE Alunos.Avaliacao ( 
RA_Aluno                     INT NOT NULL,
Num_Oferecida                INT NOT NULL,
N_A1                         INT NOT NULL,
N_A2                         INT NOT NULL,
N_AF                         INT NOT NULL,
CONSTRAINT PK_Avaliacao  PRIMARY KEY (RA_Aluno, Num_Oferecida),
CONSTRAINT FK_RA_Alunonome  FOREIGN KEY (RA_Aluno) REFERENCES Alunos.Aluno(RA),
CONSTRAINT FK_Num_Oferecidamatr FOREIGN KEY (Num_Oferecida) REFERENCES Alunos.Oferecida(Num_Oferecida)
);

SELECT * FROM Avaliacao;
DESCRIBE Avaliacao;

SHOW TABLES;

================================ PARTE 3 ===========================
=================INSERÇÕES
3.1.1  TURMAS

SELECT * FROM turma;
DESCRIBE Turma;

INSERT INTO Turma( Numero_Turma, Dt_Inicio, Dt_Termino) 
	       VALUES ( 1, '2021-02-15', '2021-12-20');           
INSERT INTO Turma( Numero_Turma, Dt_Inicio, Dt_Termino) 
	       VALUES ( 2, '2022-02-14', '2022-12-15');
           
3.1.2  DISCIPLINAS 

DESCRIBE Disciplina; 
 
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557258,'Banco de Dados');
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557257, 'Tecnica de Programacao');
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557254, 'Engenharia de Software' ); 
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557256, 'Analise de Projetos');
INSERT INTO disciplina (Codigo, Nome_Disciplina) VALUES ( 1557621, 'Redes de Computadores' );   
SELECT * FROM Disciplina;

3,1,3  PROFESSORES

DESCRIBE Professor;

INSERT INTO Professor (Matr_Prof, Nome_Prof) VALUES ( 062050,'Nelson Thomas Farias');
INSERT INTO Professor (Matr_Prof, Nome_Prof) VALUES ( 922174,'Kaique Yago Lucca');
INSERT INTO Professor (Matr_Prof, Nome_Prof) VALUES ( 012173,'Silvana Luiza Nascimento');
INSERT INTO Professor (Matr_Prof, Nome_Prof) VALUES ( 387068,'Isaac Vinicius Barros');
INSERT INTO Professor (Matr_Prof, Nome_Prof) VALUES ( 422960,'Sergio Thales Aparício');
select * from Professor;

3.1.4  ALUNOS

DESCRIBE ALUNO;

INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 25992538, 'Edison Neves Soares','M');
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 25705440, 'Iago Rocha Cezimbra','M');
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 26216809, 'Patrick Roberto Gaspar','M');
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 26433061, 'Tales Ferreira Silva','M'); 
INSERT INTO Aluno (RA, Nome, Sexo) VALUES ( 27054012,  'Vinicius Padula da Costa ','M');

INSERT INTO Aluno (RA, Nome, Sexo) VALUES  ( 09319725,'Fátima Nina Fernandes','F'),
					              (80386560,'Francisca Antônia Lorena Santos','F'),
									(91039662,'Rodeigo Vicente Ruan Ferreira','M'),
					                   (74794008,'Débora Rosa Mariah Ribeiro','F'),
									   (14435857, 'Pietra Lorena Luiza Viana','F');
                                           
INSERT INTO Aluno (RA, Nome, Sexo) VALUES    ( 27253725, 'João Ricardo Felipe Viana','M'),
					                       ( 314665778, 'Nathan Osvaldo José da Mota','M'),
						                           ( 25547092,  'Luiza Ana Gonçalves','F'),
						                    ( 18117930, 'Marcelo Lucas Danilo Novaes','M'),
						                   ( 255495705, 'Tatiane Emanuelly Rodrigues','F'),
						                      ( 41414294, 'Elias Lucca Pietro Santos','M'),
										( 228603699 , 'Alana Carla Elisa Corte Real','F'),
						                      ( 17840752, 'Juan César Bruno Mendes','M' ),
						                  ( 273739261, 'Alícia Carolina Rebeca Porto','F'),
						                      ( 28609362, 'Isadora Andreia Bernardes','F');
SELECT * FROM Aluno;

3.1.3 MATRICULAS 

DESCRIBE Matricula;
INSERT INTO Matricula ( Numero_Matricula, Dt_Matricula, Dt_Cancelamento, RA_Aluno, Numero_Turma) 
						     VALUES( 121 , '2022-02-02', '2022-12-15', 25992538, 2),
		                           ( 122 , '2022-02-01', '2022-12-15', 25705440, 2),
                                   ( 123 , '2022-02-05', '2022-12-15', 26216809, 2),
                                   ( 124 , '2022-02-06', '2022-12-15', 26433061, 2),
                                   ( 125 , '2022-02-04', '2022-12-15', 27054012, 2),
                                   ( 126 , '2022-02-05', '2022-12-15', 09319725, 2),
                                   ( 127 , '2022-02-08', '2022-12-15', 80386560, 2),
                                   ( 128 , '2022-02-10', '2022-12-15', 91039662, 2),
                                   ( 129 , '2022-02-13', '2022-12-15', 74794008, 2),
                                   ( 130 , '2022-02-14', '2022-12-15', 14435857, 2);
                              
INSERT INTO Matricula ( Numero_Matricula, Dt_Matricula, Dt_Cancelamento,  RA_Aluno, Numero_Turma) 
				             VALUES( 111, '2021-02-02', '2021-12-20', 27253725, 1),                       
			                       ( 112, '2021-02-01', '2021-12-20', 314665778, 1),
                                   ( 113, '2021-02-05', '2021-12-20', 25547092, 1),
                                   ( 114, '2021-02-06', '2021-12-20', 18117930, 1),
                                   ( 115, '2021-02-04', '2021-12-20', 255495705, 1),
                                   ( 116, '2021-02-05', '2021-12-20', 41414294, 1),
                                   ( 117, '2021-02-08', '2021-12-20', 228603699, 1),
                                   ( 118, '2021-02-10', '2021-12-20', 17840752, 1),
                                   ( 119, '2021-02-13', '2021-12-20', 273739261, 1),
                                   ( 120, '2021-02-14', '2021-12-20', 28609362, 1);                                                                       
 SELECT * FROM Matricula;

========================= 3.2 CONSULTAS ===========================
3.2.1  - CONSULTAS 

SELECT ALUNO.NOME, MATRICULA.RA_ALUNO,TURMA.NUMERO_TURMA,DISCIPLINA.NOME_DISCIPLINA
	FROM ALUNOS.ALUNO      
	INNER JOIN ALUNOS.MATRICULA  ON ALUNO.RA = MATRICULA.RA_ALUNO    
	INNER JOIN ALUNOS.TURMA      ON TURMA.NUMERO_TURMA
    INNER JOIN ALUNOS.DISCIPLINA ON DISCIPLINA.CODIGO 
    WHERE TURMA.NUMERO_TURMA='2'
    AND NOME_DISCIPLINA = 'Banco de Dados' 



3.2.2  - CONSULTAS =================================================================
/* Listando a Turma vigente:*/

SELECT TURMA.NUMERO_TURMA, TURMA.DT_INICIO, TURMA.DT_TERMINO
FROM ALUNOS.TURMA
WHERE TURMA.DT_TERMINO = '2022-12-15';

/* listando a turma vigente e o RA dos Alunos */ 

SELECT TURMA.NUMERO_TURMA, TURMA.DT_INICIO, TURMA.DT_TERMINO, MATRICULA.RA_ALUNO
FROM  ALUNOS.TURMA, ALUNOS.MATRICULA
WHERE TURMA.DT_TERMINO = '2022-12-15' AND DT_MATRICULA > '2021-12-20';







