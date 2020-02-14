USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsAlimento] 
GO

CREATE PROCEDURE [dbo].[InsAlimento]
	@Nom_Nome			VARCHAR(50),
	@Ind_Disponivel		char(1),
	@Num_IdCategoria	int
	AS
	/*
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Cadastrar Alimentos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC InsAlimento 'Arroz Carreteiro','1',1
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK) WHERE Nom_NomeAlimento = @Nom_Nome) > 1)
			BEGIN PRINT 'Alimento j� cadastrado'
			RETURN 1 END
		ELSE
			INSERT INTO Alimentos(Nom_NomeAlimento,Ind_Disponivel, Num_IdCategoria)
					VALUES (@Nom_Nome,@Ind_Disponivel, @Num_IdCategoria)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdAlimento] 
GO

CREATE PROCEDURE [dbo].[UpdAlimento]
	@Num_Id				int,
	@Nom_Nome			VARCHAR(50),
	@Ind_Disponivel		char(1)
	AS
	/*
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Alterar Alimentos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Altera��o Realizada
				  1 - Erro 
		Ex: EXEC UpdAlimento 'Arroz Branco','Arroz','0'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK) WHERE Num_IdAlimentos = @Num_Id) < 1)
			BEGIN PRINT 'Alimento n�o existe'
			RETURN 1 END
		ELSE
			UPDATE	Alimentos
			SET	Nom_NomeAlimento = @Nom_Nome,
				Ind_Disponivel = @Ind_Disponivel
			WHERE Num_IdAlimentos = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelAlimento] 
GO

CREATE PROCEDURE [dbo].[DelAlimento]
	@Num_Id			int
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Excluir Alimentos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclusão Realizada
				  1 - Erro 
		Ex: EXEC DelAlimento 'Arroz Carreteiro'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK) WHERE Num_IdAlimentos = @Num_Id) < 1)
			BEGIN PRINT 'Alimento não existe'
			RETURN 1 END
		ELSE
			DELETE 
			FROM Alimentos 
			WHERE Num_IdAlimentos = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelAlimento] 
GO

CREATE PROCEDURE [dbo].[SelAlimento]
	AS
	/*
		Documenta��o
		Arquivo Fonte: Clientes
		Objetivo: Mostrar Alimentos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro 
		Ex: EXEC SelAlimento
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK)) < 1)
			BEGIN PRINT 'Sem alimentos cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Num_IdAlimentos,
					Nom_NomeAlimento,
					Ind_Disponivel,
					Num_IdCategoria
			FROM Alimentos WITH(NOLOCK)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelAlimentoId]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelAlimentoId] 
GO

CREATE PROCEDURE [dbo].[SelAlimentoId] 
	@Num_id  int
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Mostrar clientes por nome
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro
		Ex: EXEC SelCliente
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK) WHERE Num_IdAlimentos = @Num_id) < 1)
			BEGIN PRINT 'Sem alimentos cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Num_IdAlimentos,
					Nom_NomeAlimento,
					Ind_Disponivel,
					Num_IdCategoria
			FROM Alimentos WITH(NOLOCK)
			WHERE Num_IdAlimentos = @Num_id
	END
GO