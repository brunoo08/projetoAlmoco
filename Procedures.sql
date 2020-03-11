USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsPedido] 
GO

CREATE PROCEDURE [dbo].[InsPedido] 
	@Nom_Nome			varchar(25),
	@Nom_Sobrenome		varchar(25),
	@Nom_NomeAlimento	varchar(50)

	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Cadastrar pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Ex: EXEC InsPedido 'Bruno','Silveira','Lasanha'
	*/
	BEGIN
			DECLARE
				@Dat_Date		datetime,
				@Num_Id			int,
				@Num_IdAlimento int

			SELECT @Dat_Date = GETDATE() 
			SELECT @Num_Id = Num_Id FROM Usuario WHERE Nom_Nome = @Nom_Nome AND Nom_Sobrenome = @Nom_Sobrenome
			SELECT @Num_IdAlimento = Num_IdAlimentos FROM Alimentos WHERE Nom_NomeAlimento = @Nom_NomeAlimento

			PRINT (@Dat_Date)
			PRINT (@Num_Id)
			PRINT (@Num_IdAlimento)
			INSERT INTO Pedidos(Num_IdUsuario, Dat_Date, Num_IdAlimento)
				VALUES	(@Num_Id, @Dat_Date,	@Num_IdAlimento)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdPedido] 
GO	

CREATE PROCEDURE [dbo].[UpdPedido]
	@Num_IdPedido			int,
	@Nom_Nome				varchar(25),
	@Nom_Sobrenome			varchar(25),
	@Nom_NomeAlimento		varchar(50)

	AS
	/*
		Documenta��o
		Arquivo Fonte: Pedidos
		Objetivo: Cadastrar pedidos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC UpdPedido 3, 'bruno', 'silveira', 'lasanha'
	*/
	BEGIN
		DECLARE
		@Dat_Date				datetime,
		@Num_IdUsuario			int, 
		@Num_IdAlimento			int

		SELECT @Dat_Date = GETDATE() 
		SELECT @Num_IdUsuario = Num_Id FROM Usuario WHERE Nom_Nome = @Nom_Nome AND Nom_Sobrenome = @Nom_Sobrenome
		SELECT @Num_IdAlimento = Num_IdAlimentos FROM Alimentos WHERE Nom_NomeAlimento = @Nom_NomeAlimento
		UPDATE Pedidos
			SET	Num_IdUsuario = @Num_IdUsuario,
				Dat_Date = @Dat_Date,
				Num_IdAlimento = @Num_IdAlimento
			WHERE Num_IdPedidos = @Num_IdPedido
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelPedido] 
GO

CREATE PROCEDURE [dbo].[DelPedido]
	@Num_Id				int
	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Exclui pedidos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC DelPedido 8
	*/
	BEGIN
			DELETE FROM Pedidos WHERE Num_IdPedidos = @Num_Id
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
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelPedido
	*/
	BEGIN
		SELECT	Num_IdPedidos,
				Nom_Nome,
				Nom_Sobrenome,
				Dat_Date,
				Nom_NomeAlimento
			FROM Pedidos 
			INNER JOIN Alimentos ON Pedidos.Num_IdAlimento = Alimentos.Num_IdAlimentos 
			INNER JOIN Usuario ON Pedidos.Num_IdUsuario = Usuario.Num_Id;
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelPedidoId]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelPedidoId] 
GO

CREATE PROCEDURE [dbo].[SelPedidoId]
	@Num_Id	int
	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Mostra pedidos por Id
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelPedidoId 17
	*/
	BEGIN
		SELECT	Num_IdPedidos,
				Nom_Nome,
				Nom_Sobrenome,
				Dat_Date,
				Nom_NomeAlimento
			FROM Pedidos 
			INNER JOIN Alimentos ON Pedidos.Num_IdAlimento = Alimentos.Num_IdAlimentos 
			INNER JOIN Usuario ON Pedidos.Num_IdUsuario = Usuario.Num_Id
			WHERE Num_IdPedidos = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelPedidoAlimento]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelPedidoAlimento] 
GO

CREATE PROCEDURE [dbo].[SelPedidoAlimento] 
	@Num_Id			int
	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Mostra os alimentos dos pedidos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC SelPedidoAlimento	3
	*/
	BEGIN
		SELECT Nom_NomeAlimento
			FROM Alimentos A 
				INNER JOIN Pedidos P 
					ON A.Num_IdAlimentos = P.Num_IdAlimento
			WHERE P.Num_IdUsuario = @Num_Id
	END
GO