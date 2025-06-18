---TABELAS
--Pessoa (cpf​, gênero, nascimento, nome, cep∗, num_endereço, complemento)
--	cep referência Endereço(cep)


CREATE TABLE Pessoa (
	cpf VARCHAR2(12) NOT NULL,
	nome VARCHAR2(25) NOT NULL,
    genero VARCHAR2(10) NOT NULL, 
	nascimento DATE NOT NULL,
    cep VARCHAR2(8) not null,
    num_endereço VARCHAR2(4) NOT NULL,
    complemento VARCHAR2(30),
	CONSTRAINT pessoa_pkey PRIMARY KEY (cpf),
    CONSTRAINT cep_fkey FOREIGN KEY (cep) REFERENCES Endereço(cep),
);

CREATE TABLE Endereço(---ACHO QUE TEM ERRO COM OS CEP SENDO PRIMARY KEY
    cep VARCHAR2(8) NOT NULL,
    rua VARCHAR2(40) NOT NULL,
    bairro VARCHAR2(15)NOT NULL,
    cidade VARCHAR2(15)NOT NULL,
    CONSTRAINT endereco_pkey PRIMARY KEY(cep),
);

CREATE TABLE Telefone(
    cpf_t VARCHAR2(12) NOT NULL,
    telefone VARCHAR2(11) NOT NULL,
    CONSTRAINT telefone_pkey PRIMARY KEY (telefone, cpf_t),
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa(cpf),
);

CREATE TABLE Email(
    cpf_e VARCHAR2(12) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    CONSTRAINT email_pkey PRIMARY KEY (cpf_e, email),
    CONSTRAINT email_fkey FOREIGN KEY (cpf_e) REFERENCES Pessoa(cpf),
);

CREATE TABLE Cliente(--saber se pode colocar as duas como chave estrangeira 
    cpf_c VARCHAR2(12) NOT NULL,
    cpf_indicador VARCHAR2(12),
    CONSTRAINT cliente_pkey PRIMARY KEY (cpf_c),
    CONSTRAINT cliente_fkey FOREIGN KEY(cpf_c, cpf_indicador) REFERENCES Pessoa(cpf)
);

CREATE TABLE Dependete(
    cpf_responsavel VARCHAR2(12) NOT NULL,
    num_seq VARCHAR2(5) NOT NULL,
    nome VARCHAR2(10) NOT NULL,
    CONSTRAINT dependente_pkey  PRIMARY KEY(cpf_responsavel, num_seq),
    CONSTRAINT dependente_fkey FOREIGN KEY (cpf_responsavel) REFERENCES Cliente(cpf_c)

);
--FUNCIONARIO

-- PROMOÇÃO
CREATE SEQUENCE num_alugueis INCREMENT BY 1 START WITH 0;

CREATE TABLE Funcionario(
    num_alugueis INTEGER NOT NULL,
    cpf_f VARCHAR2(12) NOT NULL,
    cargo VARCHAR2(13) NOT NULL,
    CONSTRAINT funcionario
);