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
		IF((SELECT COUNT(*) FROM Usuario WITH(NOLOCK) WHERE Nom_Login = @Nom_Login) > 0)
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
	@Num_Id			int,
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
		Ex: EXEC UpdCliente 'bruno','123','Bruno','Lustosa'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WITH(NOLOCK) WHERE Num_Id = @Num_Id ) < 1)
			BEGIN PRINT 'Usuario não existente'
			RETURN 1 END
		ELSE
			UPDATE Usuario
			SET Nom_Nome = @Nom_Nome,
				Nom_Sobrenome = @Nom_Sobrenome,
				Nom_Login = @Nom_Login,
				Nom_Senha = @Nom_Senha
			WHERE Num_Id = @Num_Id 
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelCliente]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelCliente] 
GO

CREATE PROCEDURE [dbo].[DelCliente]
	@Num_Id		int
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Excluir clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclusão Realizada
				  1 - Erro na exclusão
		Ex: EXEC DelCliente 'bruno'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WITH(NOLOCK) WHERE Num_Id = @Num_Id) < 1)
			BEGIN PRINT 'Usuario não existente'
			RETURN 1 END
		ELSE
			DELETE
			FROM	Usuario
			WHERE	Num_Id = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCliente]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCliente] 
GO

CREATE PROCEDURE [dbo].[SelCliente] 
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Mostrar clientes
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro
		Ex: EXEC SelCliente
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WITH(NOLOCK)) < 1)
			BEGIN PRINT 'Sem usuarios cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Num_Id,
					Nom_Nome,
					Nom_Sobrenome,
					Nom_Login
			FROM Usuario WITH(NOLOCK)
	END
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelClienteId]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelClienteId] 
GO

CREATE PROCEDURE [dbo].[SelClienteId] 
	@Num_Id			int
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Mostrar clientes por nome
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro
		Ex: EXEC SelClienteId 14
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Usuario WITH(NOLOCK)) < 1)
			BEGIN PRINT 'Sem usuarios cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Num_Id,
					Nom_Nome,
					Nom_Sobrenome,
					Nom_Login
			FROM Usuario WITH(NOLOCK)
			WHERE	Num_Id = @Num_Id
	END
GO