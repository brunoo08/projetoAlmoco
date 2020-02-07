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
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WHERE Nom_Nome = @Nom_Nome) > 0)
			BEGIN PRINT 'Categoria já existe'
			RETURN 1 END
		ELSE
			INSERT INTO Usuario (Nom_Nome)
					VALUES (@Nom_Nome)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdCategoria] 
GO

CREATE PROCEDURE [dbo].[UpdCategoria]
	@Nom_Nome		VARCHAR(50),
	@Nom_NovoNome	VARCHAR(50)
	AS
	/*
		Documentação
		Arquivo Fonte: Categoria
		Objetivo: Editar categoria
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Edição Realizada
				  1 - Erro
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WHERE Nom_Nome = @Nom_Nome) < 0)
			BEGIN PRINT 'Categoria não existe'
			RETURN 1 END
		ELSE
			UPDATE Categoria
			SET Nom_Nome = @Nom_NovoNome
			WHERE Nom_Nome = @Nom_Nome
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelCategoria]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelCategoria] 
GO

CREATE PROCEDURE [dbo].[DelCategoria]
	@Nom_Nome		VARCHAR(50)
	AS
	/*
		Documentação
		Arquivo Fonte: Categoria
		Objetivo: Deletar categoria
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro 
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria WHERE Nom_Nome = @Nom_Nome) < 0)
			BEGIN PRINT 'Categoria não existe'
			RETURN 1 END
		ELSE
			DELETE
			FROM Categoria
			WHERE Nom_Nome = @Nom_Nome
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
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro 
		Ex: EXEC 
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Categoria) < 1)
			BEGIN PRINT 'Não existem categorias cadastradas'
			RETURN 1 END
		ELSE
			SELECT Nom_Nome
			FROM Categoria
	END
GO