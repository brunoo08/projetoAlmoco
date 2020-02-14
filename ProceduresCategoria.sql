USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsCategoria] 
GO

CREATE PROCEDURE [dbo].[InsCategoria]
	@Nom_Nome		VARCHAR(50)
	AS
	/*
		Documenta��o
		Arquivo Fonte: Categoria
		Objetivo: Cadastrar categoria
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WHERE Nom_Nome = @Nom_Nome) > 0)
			BEGIN PRINT 'Categoria j� existe'
			RETURN 1 END
		ELSE
			INSERT INTO Categoria (Nom_Nome)
					VALUES (@Nom_Nome)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdCategoria] 
GO

CREATE PROCEDURE [dbo].[UpdCategoria]
	@Num_Id			int,
	@Nom_Nome	VARCHAR(50)
	AS
	/*
		Documenta��o
		Arquivo Fonte: Categoria
		Objetivo: Editar categoria
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Edi��o Realizada
				  1 - Erro
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WHERE Num_IdCategoria = @Num_Id) < 1)
			BEGIN PRINT 'Categoria n�o existe'
			RETURN 1 END
		ELSE
			UPDATE Categoria
			SET Nom_Nome = @Nom_Nome
			WHERE Num_IdCategoria = @Num_Id 
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelCategoria] 
GO

CREATE PROCEDURE [dbo].[DelCategoria]
	@Num_Id		int
	AS
	/*
		Documenta��o
		Arquivo Fonte: Categoria
		Objetivo: Deletar categoria
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro 
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WITH(NOLOCK) WHERE Num_IdCategoria = @Num_Id) < 0)
			BEGIN PRINT 'Categoria n�o existe'
			RETURN 1 END
		ELSE
			DELETE
			FROM Categoria
			WHERE Num_IdCategoria = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCategoria] 
GO

CREATE PROCEDURE [dbo].[SelCategoria]
	AS
	/*
		Documenta��o
		Arquivo Fonte: Categoria
		Objetivo: Mostrar categorias
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro 
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria) < 1)
			BEGIN PRINT 'N�o existem categorias cadastradas'
			RETURN 1 END
		ELSE
			SELECT  Nom_Nome,
					Num_IdCategoria
			FROM Categoria
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCategoriaId]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCategoriaId] 
GO

CREATE PROCEDURE [dbo].[SelCategoriaId] 
	@Num_Id	int
	AS
	/*
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Mostrar clientes por nome
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro
		Ex: EXEC SelCliente
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WITH(NOLOCK) WHERE Num_IdCategoria = @Num_Id) < 1)
			BEGIN PRINT 'Sem categorias cadastradas'
			RETURN 1 END
		ELSE
			SELECT	Nom_Nome,
					Num_IdCategoria
			FROM Categoria WITH(NOLOCK)
			WHERE Num_IdCategoria = @Num_Id
	END
GO