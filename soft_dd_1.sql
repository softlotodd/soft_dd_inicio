use soft_dd;

CREATE TABLE TIPO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	
	TIPO VARCHAR(32) NOT NULL,				
	PRIMARY KEY(CODIGO)					
);

CREATE TABLE FUNCIONARIO (
    CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    FUNCIONARIO VARCHAR(64) NOT NULL,
    TELEFONE VARCHAR(9) NULL,
    ENDERECO VARCHAR(45) NULL,
    DEPARTAMENTO VARCHAR(45) NULL,
    PRIMARY KEY(CODIGO)
);

CREATE TABLE TERMINAL (
   CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
   TERMINAL VARCHAR(64) NOT NULL,
   TIPO INTEGER UNSIGNED NOT NULL,
   FUNCIONARIO INTEGER UNSIGNED NOT NULL,
   VALOR DOUBLE NOT NULL,
   PRIMARY KEY(CODIGO),
   INDEX FK_TIPO(TIPO),
   INDEX FK_FUNCIONARIO(FUNCIONARIO),
   FOREIGN KEY(TIPO) REFERENCES TIPO(CODIGO),
   FOREIGN KEY(FUNCIONARIO) REFERENCES FUNCIONARIO(CODIGO)

);

CREATE TABLE FUNC (
  CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  FUNC VARCHAR(64) NOT NULL,
  TERMINAL VARCHAR(230) NOT NULL,
  PRIMARY KEY(CODIGO)

);

CREATE TABLE AUTENTICACAO (
  CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  FUNC INTEGER UNSIGNED NOT NULL,
  DATAHORA DATETIME NOT NULL,               -- amrmazena data e hora em uma unica coluna
  PRIMARY KEY(CODIGO),
  INDEX FK_FUNC(FUNC),
  FOREIGN KEY (FUNC) REFERENCES FUNC(CODIGO)

);

CREATE TABLE PEDIDO_DETALHE (
 AUTENTICACAO INTEGER UNSIGNED NOT NULL,
 TERMINAL INTEGER UNSIGNED NOT NULL,
 VALOR DOUBLE NOT NULL,
 INDEX FK_AUTENTICACAO(AUTENTICACAO),
 INDEX FK_TERMINAL(TERMINAL),
 PRIMARY KEY(AUTENTICACAO, TERMINAL),                    -- chave primaria composta
 FOREIGN KEY (AUTENTICACAO) REFERENCES AUTENTICACAO(CODIGO),
 FOREIGN KEY (TERMINAL) REFERENCES TERMINAL(CODIGO)

);