USE [ProjetoAlmoco]

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelDisponiveis]') AND objectproperty(id, N'IsPROCEDURE')=1)
	DROP PROCEDURE [dbo].[SelDisponiveis] 
GO

CREATE PROCEDURE [dbo].[SelDisponiveis]
	AS
	/*
		Documentação
		Arquivo Fonte: Alimentos
		Objetivo: Seecionar Alimentos disponiveis
		Autor: Bruno Silveira, Jefferson Russi, Laura Ratis
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

