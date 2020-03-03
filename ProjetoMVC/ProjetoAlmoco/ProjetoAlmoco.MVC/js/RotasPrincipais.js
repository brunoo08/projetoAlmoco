var RotasPrincipais = (function () {

    var config = {
        urls: {
<<<<<<< HEAD
            Usuario_GetAllUsuario: '',
            Usuario_GetUsuario: '',
            Usuario_Post: '',
            Usuario_Put: '',
            Usuario_Delete: '',
            Usuario_CarregaPost: '',
            Usuario_CarregaPut: '',
            Usuario_CarregaDelete: ''
=======
            GetAllUsuario: '',
            GetUsuario: '',
            Post: '',
            Put: '',
            Delete: '',
            CarregaPost: '',
            CarregaPut: '',
            CarregaDelete: ''
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
        }
    };


<<<<<<< HEAD
    var Usuario_GetAllUsuario = function () {
=======
    var GetAllUsuario = function () {
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
        $.get(config.urls.GetAllUsuario).done(function (data) {
            $("body").html(data);
        });
    }

<<<<<<< HEAD
    var Usuario_GetUsuario = function (Num_Id) {
=======
    var GetUsuario = function (Num_Id) {
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
        $.post(config.urls.GetUsuario, { Num_Id: Num_Id }).done(function (data) {
            $("body").html(data);
        });
    }

<<<<<<< HEAD
    var Usuario_CarregaPost = function () {
        $.post(config.urls.Usuario_CarregaPost).done(function (data) {
=======
    var CarregaPost = function () {
        $.post(config.urls.CarregaPost).done(function (data) {
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
            $("body").html(data);
        });
    }

<<<<<<< HEAD
    var Usuario_Post = function () {
        if ($("#Nom_Login").val() && $("#Nom_Nome").val() && $("#Nom_Sobrenome").val() && $("#Nom_Senha").val()) {
        $.post(config.urls.Post, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            Usuario_GetAllUsuario();
        });

        }
    }

    var Usuario_CarregaPut = function (Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha) {
        $.post(config.urls.Usuario_CarregaPut, { Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha }).done(function (data) {
=======
    var Post = function () {
        $.post(config.urls.Post, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Num_Id: $("#Num_Id").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            GetAllUsuario();
        });
    }

    var CarregaPut = function (Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha) {
        $.post(config.urls.CarregaPut, { Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha }).done(function (data) {
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
            $("body").html(data);
        });
    }

<<<<<<< HEAD
    var Usuario_Put = function () {
        $.post(config.urls.Put, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Num_Id: $("#Num_Id").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            Usuario_GetAllUsuario();
        });
    }

    var Usuario_CarregaDelete = function ( Num_Id, Nom_Nome, Nom_Sobrenome,Nom_Login, Nom_Senha) {
        $.post(config.urls.Usuario_CarregaDelete, { Num_Id, Nom_Nome, Nom_Sobrenome, Nom_Login, Nom_Senha }).done(function (data) {
=======
    var Put = function () {
        $.post(config.urls.Put, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Num_Id: $("#Num_Id").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            GetAllUsuario();
        });
    }

    var CarregaDelete = function ( Num_Id, Nom_Nome, Nom_Sobrenome,Nom_Login, Nom_Senha) {
        $.post(config.urls.CarregaDelete, { Num_Id, Nom_Nome, Nom_Sobrenome, Nom_Login, Nom_Senha }).done(function (data) {
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
            $("body").html(data);
        });
    }

<<<<<<< HEAD
    var Usuario_Delete = function (Num_Id) {
        console.log(Num_Id);
        $.post(config.urls.Delete, { Num_Id: Num_Id}).done(function () {
            Usuario_GetAllUsuario();
=======
    var Delete = function (Num_Id) {
        console.log(Num_Id);
        $.post(config.urls.Delete, { Num_Id: Num_Id}).done(function () {
            GetAllUsuario();
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
        });
    }

    var init = function ($config) {
        config = $config;
    };



    return {
        init: init,
<<<<<<< HEAD
        Usuario_GetAllUsuario: Usuario_GetAllUsuario,
        Usuario_GetUsuario: Usuario_GetUsuario,
        Usuario_Post: Usuario_Post,
        Usuario_Put: Usuario_Put,
        Usuario_Delete: Usuario_Delete,
        Usuario_CarregaPost: Usuario_CarregaPost,
        Usuario_CarregaPut: Usuario_CarregaPut,
        Usuario_CarregaDelete: Usuario_CarregaDelete
=======
        GetAllUsuario: GetAllUsuario,
        GetUsuario: GetUsuario,
        Post: Post,
        Put: Put,
        Delete: Delete,
        CarregaPost: CarregaPost,
        CarregaPut: CarregaPut,
        CarregaDelete: CarregaDelete
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
    }
})();