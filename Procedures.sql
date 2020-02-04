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
		Ex: EXEC InsPedido 'BRUNO','SILVEIRA','Arroz Branco'
	*/
	BEGIN
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

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[AltPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[AltPedido] 
GO	

CREATE PROCEDURE [dbo].[AltPedido]
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
		Ex: EXEC AltPedido ...
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
