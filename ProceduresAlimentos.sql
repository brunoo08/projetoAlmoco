USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsAlimento] 
GO

CREATE PROCEDURE [dbo].[InsAlimento]
	@Nom_Nome			VARCHAR(50),
	@Ind_Disponivel		bit,
	@Num_IdCategoria	int
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Cadastrar Alimentos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC InsAlimento 'Arroz Carreteiro','1',1
	*/
	BEGIN
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
	@Ind_Disponivel		bit
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Alterar Alimentos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC UpdAlimento 1,'Arroz','0'
	*/
	BEGIN
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
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC DelAlimento 8
	*/
	BEGIN
		DELETE FROM Alimentos WHERE Num_IdAlimentos = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelAlimento] 
GO

CREATE PROCEDURE [dbo].[SelAlimento]
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Mostrar Alimentos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelAlimento
	*/
	BEGIN
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
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelCliente
	*/
	BEGIN
		SELECT	Num_IdAlimentos,
				Nom_NomeAlimento,
				Ind_Disponivel,
				Num_IdCategoria
			FROM Alimentos WITH(NOLOCK)
			WHERE Num_IdAlimentos = @Num_id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelAlimentosDisponiveis]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelAlimentosDisponiveis] 
GO

CREATE PROCEDURE [dbo].[SelAlimentosDisponiveis]
	AS
	/*
		Documentação
		Arquivo Fonte: Alimentos
		Objetivo: Seecionar Alimentos disponiveis
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelAlimentosDisponiveis
	*/
	BEGIN
		SELECT  Num_IdAlimentos,
				Nom_NomeAlimento,
				Ind_Disponivel,
				Num_IdCategoria
			FROM Alimentos
			WHERE Ind_Disponivel = '1'
	END
GO