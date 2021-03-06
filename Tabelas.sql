CREATE DATABASE ProjetoAlmoco

USE [ProjetoAlmoco]

CREATE TABLE Usuario(
	Num_Id				int				identity,
	Nom_Nome		varchar(50),
	Nom_Sobrenome	varchar(50),
	Nom_Login		varchar(10),
	Nom_Senha		varchar(10),
	Num_Admin		bit,

	CONSTRAINT PK_Usuario PRIMARY KEY (Num_Id)
)

CREATE TABLE Categoria(
	Num_IdCategoria		int			identity,
	Nom_Nome			varchar(25)

	CONSTRAINT PK_Categoria	PRIMARY KEY (Num_IdCategoria)
)

CREATE TABLE Alimentos(
	Num_IdAlimentos		int				identity,
	Nom_NomeAlimento	varchar(50),
	Ind_Disponivel		bit,
	Num_IdCategoria		int,

	CONSTRAINT PK_Alimentos PRIMARY KEY (Num_IdAlimentos),
	CONSTRAINT FK_Categoria_Alimentos	FOREIGN KEY (Num_IdCategoria) REFERENCES Categoria(Num_IdCategoria) ON DELETE CASCADE

)

CREATE TABLE Pedidos(
	Num_IdPedidos				int				identity,
	Num_IdUsuario				int,
	Num_IdAlimento				int,
	Dat_Date					datetime,
	

	CONSTRAINT PK_Pedidos			PRIMARY KEY (Num_IdPedidos),
	CONSTRAINT FK_Usuario_Pedido	FOREIGN KEY (Num_IdUsuario)	 REFERENCES Usuario(Num_Id) ON DELETE CASCADE,
	CONSTRAINT FK_Alimentos_Pedido	FOREIGN KEY (Num_IdAlimento) REFERENCES Alimentos(Num_IdAlimentos) ON DELETE CASCADE
)