USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsCliente]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsCliente] 
GO

CREATE PROCEDURE [dbo].[InsCliente]
	@Nom_Nome		varchar(50),
	@Nom_Sobrenome	varchar(50),
	@Nom_Login		varchar(10),
	@Nom_Senha		varchar(10)

	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Cadastrar clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC InsCliente ...
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WHERE Nom_Login = @Nom_Login) < 1)
			BEGIN PRINT 'Usuario já existe'
			RETURN 1 END
		ELSE
			INSERT INTO Usuario (Nom_Nome, Nom_Sobrenome, Nom_Login, Nom_Senha)
					VALUES (@Nom_Nome, @Nom_Sobrenome, @Nom_Login, @Nom_Senha)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdCliente]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdCliente] 
GO

CREATE PROCEDURE [dbo].[UpdCliente]
	@Nom_Login		varchar(50) = NULL,
	@Nom_Senha		varchar(50) = NULL,
	@Nom_Nome		varchar(50) = NULL,
	@Nom_Sobrenome	varchar(50) = NULL
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Editar clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Edição Realizada
				  1 - Erro na edição
		Ex: EXEC InsCliente ...
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WHERE Nom_Login = @Nom_Login AND Nom_Senha = @Nom_Senha) < 1)
			BEGIN PRINT 'Usuario não existente'
			RETURN 1 END
		ELSE
			UPDATE Usuario
			SET Nom_Nome = @Nom_Nome,
				Nom_Sobrenome = @Nom_Sobrenome,
				Nom_Login = @Nom_Login,
				Nom_Senha = @Nom_Senha
			WHERE Nom_Login = @Nom_Login AND
				  Nom_Senha = @Nom_Senha
	END
GO
