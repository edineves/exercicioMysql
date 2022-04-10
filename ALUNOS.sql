CREATE DATABASE Alunos;
USE Alunos;

CREATE TABLE Alunos.Aluno( 
RA         INT not null,
Nome       VARCHAR (250),
Sexo       VARCHAR (1) comment "F - Feminino / M - Masculino",
CONSTRAINT PK_RA primary key (RA),
CONSTRAINT Sexo check (Sexo IN ('F', 'M'))
);

CREATE TABLE Turma(
Numero_Turma          INT NOT NULL,
Dt_Inicio        DATETIME NOT NULL,
Dt_Termino       DATETIME NOT NULL,
CONSTRAINT PK_Numero_Turma primary key (Numero_Turma)
);

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

DROP TABLE IF EXISTS Alunos.Disciplina;
CREATE TABLE Alunos.Disciplina ( 
Codigo             INT NOT NULL,
Nome_Disciplina   VARCHAR (100),
CONSTRAINT PK_Codigo PRIMARY KEY (Codigo)
);

DROP TABLE IF EXISTS Alunos.Professor;
CREATE TABLE Alunos.Professor ( 
Matr_Prof         INT NOT NULL,
Nome_Prof        VARCHAR (150),
CONSTRAINT PK_Matr_Prof PRIMARY KEY (Matr_Prof)
);

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

DROP TABLE IF EXISTS Alunos.Avaliacao;
CREATE TABLE Alunos.Avaliacao ( 
RA_Aluno1             INT NOT NULL,
Num_Oferecida        INT NOT NULL,
Matr_Prof1            INT NOT NULL,
Cod_Disciplina1       INT NOT NULL,
Nota_A1              INT NOT NULL,
Nota_A2              INT NOT NULL,
Nota_AF              INT NOT NULL,
CONSTRAINT PK_Avaliacao PRIMARY KEY (RA_Aluno1, Num_Oferecida, Matr_Prof1, Cod_Disciplina1),
CONSTRAINT FK_RA_Aluno1 FOREIGN KEY (RA_Aluno1) REFERENCES Alunos.Aluno(RA),
CONSTRAINT FK_Num_Oferecida FOREIGN KEY (Num_Oferecida) REFERENCES Alunos.Oferecida(Num_Oferecida),
CONSTRAINT FK_Matr_Prof1 FOREIGN KEY (Matr_Prof1) REFERENCES Alunos.Professor(Matr_Prof),
CONSTRAINT FK_Cod_Disciplina1  FOREIGN KEY (Cod_Disciplina1 ) REFERENCES Alunos.Disciplina(Codigo)
);

SHOW TABLES;
SELECT * FROM  Avaliacao;

