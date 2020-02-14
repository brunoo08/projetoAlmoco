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
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC InsPedido 17, 1
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK) WHERE Num_IdAlimentos = @Num_IdAlimento) < 1)
			BEGIN PRINT 'Alimento não existe'
			RETURN 1 END
		ELSE
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
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Cadastro Realizado
				  1 - Erro no Cadastro
		Ex: EXEC UpdPedido 6,17,5
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos WITH(NOLOCK) WHERE Num_IdPedidos = @Num_IdPedido) < 1)
			BEGIN PRINT 'Pedido não existe'
			RETURN 1 END
		ELSE
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
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclusão Realizado
				  1 - Erro no Cadastro
		Ex: EXEC DelPedido 8
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos WITH(NOLOCK) WHERE Num_IdPedidos = @Num_Id) < 1)
			BEGIN PRINT 'Usuario não existente'
			RETURN 1 END
		ELSE
			DELETE
			FROM Pedidos 
			WHERE Num_IdPedidos = @Num_Id
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelPedido]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelPedido] 
GO

CREATE PROCEDURE [dbo].[SelPedido]
	AS
	/*
		Documenta��o
		Arquivo Fonte: Pedidos
		Objetivo: Mostra pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclus�o Realizado
				  1 - Erro no Cadastro
		Ex: EXEC SelPedido
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos WITH(NOLOCK)) < 1)
			BEGIN PRINT 'Sem pedidos cadastrados'
			RETURN 1 END
		ELSE
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
		Documenta��o
		Arquivo Fonte: Pedidos
		Objetivo: Mostra pedidos
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
		Data: 03/02/2020
		Retornos: 0 - Exclus�o Realizado
				  1 - Erro no Cadastro
		Ex: EXEC SelPedido
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Pedidos WITH(NOLOCK)) < 1)
			BEGIN PRINT 'Sem pedidos cadastrados'
			RETURN 1 END
		ELSE
			SELECT	Num_IdPedidos,
					Num_IdUsuario,
					Dat_Date,
					Num_IdAlimento
			FROM Pedidos WITH(NOLOCK)
			WHERE Num_IdPedidos = @Num_Id
	END
GO