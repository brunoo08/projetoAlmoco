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
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Cadastrar clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC InsCliente 'Bruno','Silveira','bruno','123'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WHERE Nom_Login = @Nom_Login) > 0)
			BEGIN PRINT 'Nome de usuario j� existe'
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
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Editar clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Edi��o Realizada
				  1 - Erro na edi��o
		Ex: EXEC UpdCliente 'bruno','123','Bruno','Lustosa'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WHERE Nom_Login = @Nom_Login) < 1)
			BEGIN PRINT 'Usuario n�o existente'
			RETURN 1 END
		ELSE
			UPDATE Usuario
			SET Nom_Nome = @Nom_Nome,
				Nom_Sobrenome = @Nom_Sobrenome,
				Nom_Login = @Nom_Login,
				Nom_Senha = @Nom_Senha
			WHERE Nom_Login = @Nom_Login 
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelCliente]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelCliente] 
GO

CREATE PROCEDURE [dbo].[DelCliente]
	@Nom_Login		varchar(50) = NULL
	AS
	/*
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Excluir clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclus�o Realizada
				  1 - Erro na edi��o
		Ex: EXEC DelCliente 'bruno'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WHERE Nom_Login = @Nom_Login) < 1)
			BEGIN PRINT 'Usuario n�o existente'
			RETURN 1 END
		ELSE
			DELETE
			FROM	Usuario
			WHERE	Nom_Login = @Nom_Login
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCliente]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCliente] 
GO

CREATE PROCEDURE [dbo].[SelCliente] 
	AS
	/*
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Mostrar clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro
		Ex: EXEC SelCliente
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario) < 1)
			BEGIN PRINT 'Sem usuarios cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Nom_Nome,
					Nom_Sobrenome,
					Nom_Login
			FROM Usuario
	END
GO
