USE [ProjetoAlmoco]

INSERT INTO Usuario (Nom_Nome,Nom_Sobrenome, Nom_Login, Nom_Senha) VALUES ('Bruno','Silveira','bruno',123);
INSERT INTO Usuario (Nom_Nome,Nom_Sobrenome, Nom_Login, Nom_Senha) VALUES ('Laura','Ratis','laura',123);
INSERT INTO Usuario (Nom_Nome,Nom_Sobrenome, Nom_Login, Nom_Senha) VALUES ('Gustavo','Henrique','gustavo',123);
INSERT INTO Usuario (Nom_Nome,Nom_Sobrenome, Nom_Login, Nom_Senha) VALUES ('Joao','Silva','joao',123);
INSERT INTO Usuario (Nom_Nome,Nom_Sobrenome, Nom_Login, Nom_Senha) VALUES ('Maria','Alves','maria',123);

INSERT INTO Categoria (Nom_Nome) VALUES ('Arroz');
INSERT INTO Categoria (Nom_Nome) VALUES ('Feijao');
INSERT INTO Categoria (Nom_Nome) VALUES ('Massa');
INSERT INTO Categoria (Nom_Nome) VALUES ('Carne');
INSERT INTO Categoria (Nom_Nome) VALUES ('Vegetal');


INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Arroz Branco', '1', 1);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Arroz Carreteiro', '1', 1);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Feijao Caldo', '1', 2);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Feijao Preto', '1', 2);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Feijao Tropeiro', '1', 2);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Strogonoff', '1', 4);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Macarrão', '1', 3);
INSERT INTO Alimentos (Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) VALUES ('Lasanha', '1', 3);

INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (1,1);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (1,3);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (1,6);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (2,2);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (2,3);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (2,8);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (3,7);
INSERT INTO Pedidos (Num_IdUsuario, Num_IdAlimento) VALUES (4,8);


