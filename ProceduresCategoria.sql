USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsCategoria] 
GO

CREATE PROCEDURE [dbo].[InsCategoria]
	@Nom_Nome		VARCHAR(50)
	AS
	/*
		Documentação
		Arquivo Fonte: Categoria
		Objetivo: Cadastrar categoria
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC 'Massa'
	*/
	BEGIN
		INSERT INTO Categoria (Nom_Nome)
			VALUES (@Nom_Nome)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdCategoria] 
GO

CREATE PROCEDURE [dbo].[UpdCategoria]
	@Num_Id			int,
	@Nom_Nome		VARCHAR(50)
	AS
	/*
		Documentação
		Arquivo Fonte: Categoria
		Objetivo: Editar categoria
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC UpdCategoria 1, 'Arroz'
	*/
	BEGIN
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
		Documentação
		Arquivo Fonte: Categoria
		Objetivo: Deletar categoria
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC DelCategoria 2
	*/
	BEGIN
		DELETE FROM Categoria WHERE Num_IdCategoria = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCategoria] 
GO

CREATE PROCEDURE [dbo].[SelCategoria]
	AS
	/*
		Documentação
		Arquivo Fonte: Categoria
		Objetivo: Mostrar categorias
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelCategoria
	*/
	BEGIN
		SELECT  Nom_Nome,
				Num_IdCategoria
			FROM Categoria
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelCategoriaId]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelCategoriaId] 
GO

CREATE PROCEDURE [dbo].[SelCategoriaId] 
	@Num_Id		int
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Mostrar categoria por Id
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelCliente 17
	*/
	BEGIN
		SELECT	Nom_Nome,
				Num_IdCategoria
			FROM Categoria WITH(NOLOCK)
			WHERE Num_IdCategoria = @Num_Id
	END
GO