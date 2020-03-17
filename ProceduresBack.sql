USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelDisponiveis]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelDisponiveis] 
GO

CREATE PROCEDURE [dbo].[SelDisponiveis]
	AS
	/*
		Documentação
		Arquivo Fonte: Alimentos
		Objetivo: Selecionar Alimentos disponiveis
		Autor: Bruno Silveira
		Data: 03/02/2020
		Retornos: 0 - ok
				  1 - Erro
		Ex: EXEC SelDisponiveis
	*/
	BEGIN
		IF((SELECT COUNT(*) FROM Alimentos WITH(NOLOCK)) < 1)
			BEGIN PRINT 'Sem pedidos cadastrados'
			RETURN 1 END
		ELSE
			SELECT  Num_IdAlimentos,
					Nom_NomeAlimento,
					Num_IdCategoria
			FROM Alimentos
			WHERE Ind_Disponivel = '1'
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[VerificaLogin]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[VerificaLogin] 
GO

CREATE PROCEDURE [dbo].[VerificaLogin]
	@login		VARCHAR(15),
	@senha		varchar(15)
	AS
	/*
		Documentação
		Arquivo Fonte: Clientes
		Objetivo: Verificar Login
		Autor: Bruno Silveira
		Data: 11/03/2020
		Retornos: 0 - ok admin
				  10 - ok 
				  200 - erro
		Ex: EXEC Login
	*/
	BEGIN
		IF EXISTS (SELECT * FROM Usuario WHERE Nom_Login = @login AND Nom_Senha = @senha AND Num_Admin = 1)
			BEGIN PRINT 'Login aceito ADM'
			RETURN 0 END
		IF EXISTS (SELECT * FROM Usuario WHERE Nom_Login = @login AND Nom_Senha = @senha)
			BEGIN PRINT 'Login aceito'
			RETURN 10 END
		ELSE 
			BEGIN PRINT 'Usuario nao cadastrado'
			RETURN 200 END
	END
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[TransformaDisp]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[TransformaDisp] 
GO

CREATE PROCEDURE [dbo].[TransformaDisp]
	@Num_id			int
	AS
	/*
		Documentação
		Arquivo Fonte: Alimentos
		Objetivo: Tornar alimento disponivel
		Autor: Bruno Silveira
		Data: 17/03/2020
		Retornos: 0 - ok 
				  1 - erro
		Ex: EXEC TransformaDisp
	*/
	BEGIN
		IF((SELECT Ind_Disponivel FROM Alimentos WHERE Num_IdAlimentos = @Num_id) = 1 )
			UPDATE Alimentos
			SET Ind_Disponivel = 0
			WHERE Num_IdAlimentos = @Num_id
		ELSE 
			UPDATE Alimentos
			SET Ind_Disponivel = 1
			WHERE Num_IdAlimentos = @Num_id
	END
GO

