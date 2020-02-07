USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsPedido] 
GO

CREATE PROCEDURE [dbo].[InsPedido] 
	@Nom_Nome			VARCHAR(50) = NULL,
	@Nom_Sobrenome		VARCHAR(50) = NULL,
	@Nom_Alimento		VARCHAR(50) = NULL

	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Cadastrar pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC InsPedido 'Bruno','Silveira','Arroz'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WHERE Nom_NomeAlimento = @Nom_Alimento) < 1)
			BEGIN PRINT 'Alimento não existe'
			RETURN 1 END
		ELSE
			DECLARE
				@Dat_Date		date,
				@Num_IdAlimento	int

			SELECT @Dat_Date = GETDATE()

			SELECT @Num_IdAlimento = Num_IdAlimentos 
			FROM Alimentos 
			WHERE Nom_NomeAlimento = @Nom_Alimento

			INSERT INTO Pedidos (Nom_Nome, Nom_Sobrenome, Dat_Date, Num_IdAlimento)
				VALUES	(@Nom_Nome, @Nom_Sobrenome, @Dat_Date,	@Num_IdAlimento)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdPedido] 
GO	

CREATE PROCEDURE [dbo].[UpdPedido]
	@Nom_Nome			VARCHAR(25) = NULL,
	@Nom_Sobrenome		VARCHAR(25) = NULL,
	@Nom_Alimento		VARCHAR(50) = NULL,
	@Nom_NovoAlimento	VARCHAR(50) = NULL

	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Cadastrar pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC UpdPedido 'Bruno','Silveira','Arroz','Arroz Carreteiro'
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos WHERE Nom_Nome = @Nom_Nome AND Nom_Sobrenome = @Nom_Sobrenome) < 1)
			BEGIN PRINT 'Pedido não existe'
			RETURN 1 END
		ELSE
			DECLARE
			@Dat_Date				date,
			@Num_IdAlimento			int,
			@Num_IdAlimentoAntigo	int

			SELECT @Dat_Date = GETDATE()

			SELECT @Num_IdAlimentoAntigo = Num_IdAlimentos
			FROM Alimentos
			WHERE Nom_NomeAlimento = @Nom_Alimento

			SELECT @Num_IdAlimento = Num_IdAlimentos 
			FROM Alimentos 
			WHERE Nom_NomeAlimento = @Nom_NovoAlimento
				
			UPDATE Pedidos
			SET	Nom_Nome = @Nom_Nome,
				Nom_Sobrenome = @Nom_Sobrenome,
				Dat_Date = @Dat_Date,
				Num_IdAlimento = @Num_IdAlimento
			WHERE 	Nom_Nome = @Nom_Nome AND
					Nom_Sobrenome = @Nom_Sobrenome AND
					Num_IdAlimento = @Num_IdAlimentoAntigo
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelPedido] 
GO

CREATE PROCEDURE [dbo].[DelPedido]
	@Nom_Nome			VARCHAR(25) = NULL,
	@Nom_Sobrenome		VARCHAR(25) = NULL
	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Exclui pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclusão Realizado
				  1 - Erro no Cadastro
		Ex: EXEC DelPedido 'Bruno','Silveira'
	*/
	BEGIN
		DELETE
		FROM Pedidos
		WHERE Nom_Nome = @Nom_Nome AND
			Nom_Sobrenome = @Nom_Sobrenome
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelPedido] 
GO

CREATE PROCEDURE [dbo].[SelPedido]
	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Mostra pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Ok
				  1 - Erro no Cadastro
		Ex: EXEC SelPedido
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos) < 1)
			BEGIN PRINT 'Sem pedidos cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Nom_Nome,
					Nom_Sobrenome,
					Dat_Date,
					Num_IdAlimento
			FROM Pedidos
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelTodosPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelTodosPedido] 
GO

CREATE PROCEDURE [dbo].[DelTodosPedido]
	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Apaga todos os pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclusão Realizado
				  1 - Erro no Cadastro
		Ex: EXEC SelPedido
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos) < 1)
			BEGIN PRINT 'Sem pedidos cadastrados'
			RETURN 1 END
		ELSE
			DELETE 
			FROM Pedidos
	END
GO