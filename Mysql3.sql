EXERCÍCIO
=========
FAÇA UMA CONSULTA NA TABELA CLIENTE QUE
RETORNE:
- A COLUNA CÓDIGO, FORMATADA COM ATÉ 10 BYTES, SENDO ZEROS À ESQUERDA
- O NOME DO CLIENTE EM LETRAS MAIÚSCULAS
- O EMAIL DO CLIENTE EM LETRAS MINÚSCULAS
- O CPF DO CLIENTE FORMATADO 999.999.999-99
- A SENHA DO CLIENTE INVERTIDA E ENCRIPTADA, SENDO:
  - 1 -> I	
  - 3 -> E
  - 4 -> A
  - 5 -> S
  - 6 -> G


SELECT CLI.COD_CLIENTE "Código"
      ,CLI.NOME_CLIENTE "Nome do Cliente"
      ,CLI.COD_CLIENTE + 5 CALCULO
  FROM PIZZARIA.CLIENTE CLI
  
SELECT CON.NUM_PEDIDO
      ,CON.COD_PIZZA
      ,CON.DESC_TAMANHO_PIZZA
      ,CON.QUANTIDADE
      ,CON.PRECO
      ,CON.QUANTIDADE * CON.PRECO TOTAL
  FROM PIZZARIA.CONTEM CON
  
  
FUNÇÕES PARA STRING
=================
SELECT CLI.COD_CLIENTE "Código"
      ,SUBSTRING(CLI.NOME_CLIENTE,5,5) "Nome do Cliente"
      ,CONCAT(LPAD(CLI.COD_CLIENTE, 6, '0'), ' - ', CLI.NOME_CLIENTE)
      ,CLI.COD_CLIENTE + 5 CALCULO
      ,CLI.IDF_SEXO
      ,CASE CLI.IDF_SEXO
            WHEN 'F' THEN 'FEMININO'
            ELSE 'ERRO'
	   END DESC_SEXO
	  ,CASE
			WHEN CLI.COD_CLIENTE <= 10 THEN 'VIP'
            WHEN CLI.COD_CLIENTE > 10 AND CLI.COD_CLIENTE <= 20 THEN 'ESPECIAL'
            ELSE 'OUTROS'
	   END TIPO_CLIENTE
  FROM PIZZARIA.CLIENTE CLI

SELECT SUBSTRING('ALEXANDRE LEITE RANGEL', 11, 5) SUBSTRING_
      ,LENGTH('ALEXANDRE LEITE RANGEL') LENGTH_
      ,REPLACE(REPLACE(REPLACE('UNICIDPASSAT','I','1'),'A','@'),'S','5') REPLACE_
      ,REVERSE(REPLACE(REPLACE(REPLACE('UNICIDPASSAT','I','1'),'A','@'),'S','5')) REVERSE_
      ,LOCATE('@', 'PROFALRANGEL@GMAIL.COM') LOCATE_
      ,CONCAT('UM MIL, DUZENTOS E TRINTA E QUATRO REAIS E CINQUETA E SEIS CENTAVOS', REPEAT('*', 20)) REPEAT_
      ,CONCAT('+', REPEAT('-', 78), '+') REPEAT2_
      ,CONCAT('|',SPACE(45), 'TITULO DO RELATÓRIO', SPACE(45), '|') SPACE_
      ,CONCAT('ALEX','ANDRE') CONCAT_
      ,CONCAT('|',LTRIM('          ALEXANDRE LEITE RANGEL')) LTRIM_
      ,CONCAT(RTRIM('ALEXANDRE LEITE RANGEL          '),'|') RTRIM_
      ,CONCAT('|',LTRIM(RTRIM('          ALEXANDRE LEITE RANGEL          ')),'|') TRIM_
      ,LEFT('ALEXANDRE LEITE RANGEL', 9) LEFT_
      ,RIGHT('ALEXANDRE LEITE RANGEL', 6) RIGHT_
      ,UPPER('alexandre leite rangel') UPPER_
      ,LOWER('ALEXANDRE LEITE RANGEL') LOWER_
      
FUNÇÕES PARA DATAS
==================
SELECT CURRENT_DATE DATA_HOJE
      ,CURRENT_TIME AGORA
      ,DATEDIFF(CURRENT_TIMESTAMP, '1971-04-15')/365 IDADE
      ,DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 WEEK) SUBTRAI_DATAS
      ,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 30 HOUR) ADICIONA_DATAS
      ,CURRENT_TIMESTAMP DATA_HORA
      ,YEAR(CURRENT_TIMESTAMP) YEAR_
      ,MONTH(CURRENT_TIMESTAMP) MONTH_
      ,DAY(CURRENT_TIMESTAMP) DAY_
      ,HOUR(CURRENT_TIMESTAMP) HORA
      ,MINUTE(CURRENT_TIMESTAMP) MINUTOS
      ,SECOND(CURRENT_TIMESTAMP) SEGUNDOS
      ,WEEK(CURRENT_TIMESTAMP) SEMANA
      ,QUARTER(CURRENT_TIMESTAMP) TRIMESTRE
      

FUNÇÕES PARA NÚMEROS
====================
 

-- BANCO DE DADOS TESTE
-----------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS TESTE;

DROP TABLE IF EXISTS TESTE.TIPO_PESSOA;
CREATE TABLE IF NOT EXISTS TESTE.TIPO_PESSOA (
   COD_TIPO_PESSOA INT		NOT NULL	AUTO_INCREMENT,
   DSC_TIPO_PESSOA VARCHAR(250),
   CONSTRAINT PK_TIPO_PESSOA PRIMARY KEY (COD_TIPO_PESSOA)
);

DROP TABLE IF EXISTS TESTE.PESSOA;
CREATE TABLE IF NOT EXISTS TESTE.PESSOA (
	COD_PESSOA 		INT 			NOT NULL,
	NOM_PESSOA 		VARCHAR(250),
	CPF_PESSOA 		VARCHAR(16),
	RG_PESSOA 		VARCHAR(12),
	EMAIL_PESSOA 	VARCHAR(100)	NOT NULL,
	DTA_NASC_PESSOA DATE			NOT NULL DEFAULT '1800-01-01',
	IDF_SEXO 		VARCHAR(1)		NOT NULL,
	IDF_ATIVO 		VARCHAR(1)		NOT NULL,
	COD_TIPO_PESSOA INT 			NOT NULL,
	CONSTRAINT PK_PESSOA PRIMARY KEY (COD_PESSOA),
	CONSTRAINT FK_TIPO_PESSOA
		FOREIGN KEY (COD_TIPO_PESSOA)
			REFERENCES TIPO_PESSOA (COD_TIPO_PESSOA),
	CONSTRAINT UQ_PESSOA_CPF UNIQUE (CPF_PESSOA),
	CONSTRAINT UQ_PESSOA_RG UNIQUE (RG_PESSOA),
	CONSTRAINT UQ_PESSOA_EMAIL UNIQUE (EMAIL_PESSOA),
	CONSTRAINT CK_PESSOA_SEXO CHECK (IDF_SEXO IN ('F','M')),
	CONSTRAINT CK_PESSOA_ATIVO CHECK (IDF_ATIVO IN ('S','N'))
);


INSERT INTO TESTE.PESSOA (
	COD_PESSOA,
    NOM_PESSOA,
    COD_TIPO_PESSOA,
    EMAIL_PESSOA,
	IDF_SEXO,
    IDF_ATIVO,
    DTA_NASC_PESSOA
) VALUES (
	1,
    'CLARA MÁRCIA DUARTE',
    3,
    'CLARA_MARCIA_DUARTE@CAMILAPASSOS.COM.BR',
    'F',
    'M', 
    '1961-03-15'
);

INSERT INTO TESTE.PESSOA (
	COD_PESSOA,
    NOM_PESSOA,
    COD_TIPO_PESSOA,
    EMAIL_PESSOA,
    IDF_SEXO,
    IDF_ATIVO,
    DTA_NASC_PESSOA
) VALUES (
	2,
    'ELISA LUZIA DA CONCEIÇÃO',
    3,
    'ELISA.LUZIA.DACONCEICAO@STRUCTUREESQUADRIAS.COM.BR',
    'F',
    'S',
    '1991-03-15'
);
