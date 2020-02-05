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
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Cadastrar Alimentos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC InsAlimento 'Arroz Carreteiro','1',1
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WHERE Nom_NomeAlimento = @Nom_Nome) > 1)
			BEGIN PRINT 'Alimento já cadastrado'
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
	@Nom_Nome			VARCHAR(50),
	@Nom_NovoNome		VARCHAR(50),
	@Ind_Disponivel		char(1)
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Alterar Alimentos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Alteração Realizada
				  1 - Erro 
		Ex: EXEC UpdAlimento 'Arroz Branco','Arroz','0'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WHERE Nom_NomeAlimento = @Nom_Nome) < 1)
			BEGIN PRINT 'Alimento não existe'
			RETURN 1 END
		ELSE
			UPDATE	Alimentos
			SET	Nom_NomeAlimento = @Nom_NovoNome,
				Ind_Disponivel = @Ind_Disponivel
			WHERE Nom_NomeAlimento = @Nom_Nome
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelAlimento] 
GO

CREATE PROCEDURE [dbo].[DelAlimento]
	@Nom_Nome			VARCHAR(50)
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
		IF((SELECT COUNT(*) FROM Alimentos WHERE Nom_NomeAlimento = @Nom_Nome) < 1)
			BEGIN PRINT 'Alimento não existe'
			RETURN 1 END
		ELSE
			DELETE 
			FROM Alimentos
			WHERE Nom_NomeAlimento = @Nom_Nome
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
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - OK
				  1 - Erro 
		Ex: EXEC SelAlimento
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos) < 1)
			BEGIN PRINT 'Sem alimentos cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Nom_NomeAlimento,
					Ind_Disponivel,
					Num_IdCategoria
			FROM Alimentos
	END
GO