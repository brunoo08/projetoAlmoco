USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[InsPedido] 
GO

CREATE PROCEDURE [dbo].[InsPedido] 
	@Num_Id				int,
	@Num_IdAlimento		int

	AS
	/*
		Documentação
		Arquivo Fonte: Pedidos
		Objetivo: Cadastrar pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Ex: EXEC InsPedido 17, 5
	*/
	BEGIN
			DECLARE
				@Dat_Date		date

			SELECT @Dat_Date = GETDATE() 

			INSERT INTO Pedidos(Num_IdUsuario, Dat_Date, Num_IdAlimento)
				VALUES	(@Num_Id, @Dat_Date,	@Num_IdAlimento)
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[UpdPedido] 
GO	

CREATE PROCEDURE [dbo].[UpdPedido]
	@Num_IdPedido				int,
	@Num_IdUsuario				int,
	@Num_IdAlimento				int

	AS
	/*
		Documenta��o
		Arquivo Fonte: Pedidos
		Objetivo: Cadastrar pedidos
		Autor: Bruno Silveira
		Data: 03/02/2020
		Ex: EXEC UpdPedido 6,17,5
	*/
	BEGIN
		DECLARE
		@Dat_Date				date

		SELECT @Dat_Date = GETDATE() 
	
		UPDATE Pedidos
			SET	Num_IdUsuario = @Num_IdUsuario,
				Dat_Date = @Dat_Date,
				Num_IdAlimento = @Num_IdAlimento
			WHERE 	Num_IdPedidos = @Num_IdPedido
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

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DelPedidoAll]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[DelPedidoAll] 
GO

CREATE PROCEDURE [dbo].[DelPedidoAll]
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
			DELETE FROM Pedidos
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
				Num_IdUsuario,
				Dat_Date,
				Num_IdAlimento
			FROM Pedidos WITH(NOLOCK)
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
				Num_IdUsuario,
				Dat_Date,
				Num_IdAlimento
			FROM Pedidos WITH(NOLOCK)
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
		Ex: EXEC SelPedidoAlimento	17
	*/
	BEGIN
		SELECT Nom_NomeAlimento
			FROM Alimentos A 
				INNER JOIN Pedidos P 
					ON A.Num_IdAlimentos = P.Num_IdAlimento
			WHERE P.Num_IdUsuario = @Num_Id
	END
GO