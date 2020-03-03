var RotasPrincipais = (function () {

    var config = {
        urls: {
            Usuario_GetAllUsuario: '',
            Usuario_GetUsuario: '',
            Usuario_Post: '',
            Usuario_Put: '',
            Usuario_Delete: '',
            Usuario_CarregaPost: '',
            Usuario_CarregaPut: '',
            Usuario_CarregaDelete: ''
        }
    };


    var Usuario_GetAllUsuario = function () {
        $.get(config.urls.GetAllUsuario).done(function (data) {
            $("body").html(data);
        });
    }

    var Usuario_GetUsuario = function (Num_Id) {
        $.post(config.urls.GetUsuario, { Num_Id: Num_Id }).done(function (data) {
            $("body").html(data);
        });
    }

    var Usuario_CarregaPost = function () {
        $.post(config.urls.Usuario_CarregaPost).done(function (data) {
            $("body").html(data);
        });
    }

    var Usuario_Post = function () {
        if ($("#Nom_Login").val() && $("#Nom_Nome").val() && $("#Nom_Sobrenome").val() && $("#Nom_Senha").val()) {
        $.post(config.urls.Post, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            Usuario_GetAllUsuario();
        });

        }
    }

    var Usuario_CarregaPut = function (Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha) {
        $.post(config.urls.Usuario_CarregaPut, { Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha }).done(function (data) {
            $("body").html(data);
        });
    }

    var Usuario_Put = function () {
        $.post(config.urls.Put, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Num_Id: $("#Num_Id").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            Usuario_GetAllUsuario();
        });
    }

    var Usuario_CarregaDelete = function ( Num_Id, Nom_Nome, Nom_Sobrenome,Nom_Login, Nom_Senha) {
        $.post(config.urls.Usuario_CarregaDelete, { Num_Id, Nom_Nome, Nom_Sobrenome, Nom_Login, Nom_Senha }).done(function (data) {
            $("body").html(data);
        });
    }

    var Usuario_Delete = function (Num_Id) {
        console.log(Num_Id);
        $.post(config.urls.Delete, { Num_Id: Num_Id}).done(function () {
            Usuario_GetAllUsuario();
        });
    }

    var init = function ($config) {
        config = $config;
    };



    return {
        init: init,
        Usuario_GetAllUsuario: Usuario_GetAllUsuario,
        Usuario_GetUsuario: Usuario_GetUsuario,
        Usuario_Post: Usuario_Post,
        Usuario_Put: Usuario_Put,
        Usuario_Delete: Usuario_Delete,
        Usuario_CarregaPost: Usuario_CarregaPost,
        Usuario_CarregaPut: Usuario_CarregaPut,
        Usuario_CarregaDelete: Usuario_CarregaDelete
    }
})();