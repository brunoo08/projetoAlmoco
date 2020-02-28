var RotasPrincipais = (function () {

    var config = {
        urls: {
            GetAllUsuario: '',
            GetUsuario: '',
            Post: '',
            Put: '',
            Delete: '',
            CarregaPost: '',
            CarregaPut: '',
            CarregaDelete: ''
        }
    };


    var GetAllUsuario = function () {
        $.get(config.urls.GetAllUsuario).done(function (data) {
            $("body").html(data);
        });
    }

    var GetUsuario = function (Num_Id) {
        $.post(config.urls.GetUsuario, { Num_Id: Num_Id }).done(function (data) {
            $("body").html(data);
        });
    }

    var CarregaPost = function () {
        $.post(config.urls.CarregaPost).done(function (data) {
            $("body").html(data);
        });
    }

    var Post = function () {
        $.post(config.urls.Post, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Num_Id: $("#Num_Id").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            GetAllUsuario();
        });
    }

    var CarregaPut = function (Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha) {
        $.post(config.urls.CarregaPut, { Nom_Login, Nom_Nome, Nom_Sobrenome, Num_Id, Nom_Senha }).done(function (data) {
            $("body").html(data);
        });
    }

    var Put = function () {
        $.post(config.urls.Put, { Nom_Login: $("#Nom_Login").val(), Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Num_Id: $("#Num_Id").val(), Nom_Senha: $("#Nom_Senha").val()}).done(function () {
            GetAllUsuario();
        });
    }

    var CarregaDelete = function ( Num_Id, Nom_Nome, Nom_Sobrenome,Nom_Login, Nom_Senha) {
        $.post(config.urls.CarregaDelete, { Num_Id, Nom_Nome, Nom_Sobrenome, Nom_Login, Nom_Senha }).done(function (data) {
            $("body").html(data);
        });
    }

    var Delete = function (Num_Id) {
        console.log(Num_Id);
        $.post(config.urls.Delete, { Num_Id: Num_Id}).done(function () {
            GetAllUsuario();
        });
    }

    var init = function ($config) {
        config = $config;
    };



    return {
        init: init,
        GetAllUsuario: GetAllUsuario,
        GetUsuario: GetUsuario,
        Post: Post,
        Put: Put,
        Delete: Delete,
        CarregaPost: CarregaPost,
        CarregaPut: CarregaPut,
        CarregaDelete: CarregaDelete
    }
})();