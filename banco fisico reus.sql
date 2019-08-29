-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE fornecedor (
codigo_forn Texto(1) PRIMARY KEY,
razao_forn Texto(1),
nome_forn Texto(1),
cnpj Texto(1),
telefone Texto(1),
codigo_cid Texto(1)
)

CREATE TABLE produto (
cod_prod Texto(1) PRIMARY KEY,
Desc_prod Texto(1),
Valor_unit_prod Texto(1)
)

CREATE TABLE cliente (
nomeSoci_cli Texto(1),
nomeReal_cli Texto(1),
cod_cli Texto(1) PRIMARY KEY,
cpf_cli Texto(1),
codigo_cid Texto(1)
)

CREATE TABLE estado (
nomeEstado Texto(1),
sigla Texto(1),
codigo_Estado Texto(1) PRIMARY KEY
)

CREATE TABLE cidade (
nome_cid Texto(1),
codigo_cid Texto(1) PRIMARY KEY,
populacao_cid Texto(1),
codigo_Estado Texto(1),
FOREIGN KEY(codigo_Estado) REFERENCES estado (codigo_Estado)
)

CREATE TABLE fornece (
cod_prod Texto(1),
codigo_forn Texto(1),
FOREIGN KEY(cod_prod) REFERENCES produto (cod_prod),
FOREIGN KEY(codigo_forn) REFERENCES fornecedor (codigo_forn)
)

ALTER TABLE fornecedor ADD FOREIGN KEY(codigo_cid) REFERENCES cidade (codigo_cid)
ALTER TABLE cliente ADD FOREIGN KEY(codigo_cid) REFERENCES cidade (codigo_cid)
