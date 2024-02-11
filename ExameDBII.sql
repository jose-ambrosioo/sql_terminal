DROP DATABASE IF EXISTS ExameDBII;
CREATE DATABASE ExameDBII;
USE ExameDBII;

CREATE TABLE produtos 
(
codprod INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL, 
custo INT NOT NULL, 
preco INT NOT NULL, 
PRIMARY KEY (codprod)
);

/*******Dados dos produtos************/
INSERT INTO produtos(nome, custo, preco) VALUES('Computador', '70000', '80000') ;
INSERT INTO produtos(nome, custo, preco) VALUES('Televisor', '40000', '55000') ;
INSERT INTO produtos(nome, custo, preco) VALUES('Arca', '20000', '23000') ;
INSERT INTO produtos(nome, custo, preco) VALUES('Tapete', '1200', '3700') ;

CREATE TABLE Departamentos 
(
codDep INT NOT NULL AUTO_INCREMENT,
nomeDep VARCHAR(20) NOT NULL, 
PRIMARY KEY (codDep)
);

/*******Dados dos Departamentos************/
INSERT INTO Departamentos(nomeDep) VALUES('Operador') ;
INSERT INTO Departamentos(nomeDep) VALUES('Supervisora') ;
INSERT INTO Departamentos(nomeDep) VALUES('Directora') ;


CREATE TABLE Empregados 
(
numero INT NOT NULL, 
nome VARCHAR(20) NOT NULL, 
salario INT NOT NULL, 
codCadastro INT NOT NULL, 
PRIMARY KEY (numero) 
);

/*******Dados dos Empregados************/
INSERT INTO Empregados(numero, nome, salario, codCadastro) VALUES('002', 'Domingos', '1000', '002') ;
INSERT INTO Empregados(numero, nome, salario, codCadastro) VALUES('001', 'Domilde', '2000', '001') ;
INSERT INTO Empregados(numero, nome, salario, codCadastro) VALUES('432', 'Helena', '5000', '432') ;
INSERT INTO Empregados(numero, nome, salario, codCadastro) VALUES('433', 'Alexandra', '3000', '433') ;
INSERT INTO Empregados(numero, nome, salario, codCadastro) VALUES('344', 'Jandira', '10000', '344') ;

CREATE TABLE Cadastros 
(
numero INT NOT NULL,
codDep INT NOT NULL, 
PRIMARY KEY (numero), 
FOREIGN KEY (numero) REFERENCES Empregados(numero),
FOREIGN KEY (codDep) REFERENCES Departamentos(codDep)
);

/*******Dados dos Cadastros************/
INSERT INTO Cadastros(numero, codDep) VALUES(1, 1) ;
INSERT INTO Cadastros(numero, codDep) VALUES(2, 1) ;




/*******Triggers do Produto*******/
DELIMITER $$
CREATE TRIGGER actualizaPrecoProduto AFTER UPDATE
ON Produtos
	FOR EACH ROW
	SET NEW.preco = (NEW.preco * 1.50);
	
	SELECT * FROM produtos;
DELIMITER ;
