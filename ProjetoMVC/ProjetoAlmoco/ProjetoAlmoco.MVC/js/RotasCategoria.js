var RotasCategoria = (function () {

    var config = {
        urls: {
            GetAllCategoria: '',
            GetCategoria: '',
            CarregaPut: '',
            Put: '',
            CarregaPost: '',
            Post: '',
            CarregaDelete: '',
            Delete: ''
        }
    };

    var GetAllCategoria = function () {
        $.get(config.urls.GetAllCategoria).done(function (data) {
            $("body").html(data);
        });
    }

    var GetCategoria = function (Num_Id) {
        $.post(config.urls.GetCategoria, { Num_Id: Num_Id }).done(function (data) {
            $("body").html(data);
        });
    }

    var CarregaPut = function (Num_IdCategoria, Nom_Nome) {
        $.post(config.urls.CarregaPut, { Num_IdCategoria, Nom_Nome }).done(function (data){
            $("body").html(data);
        });
    }

    var Put = function () {
        $.post(config.urls.Put, {Num_IdCategoria: $("#Num_IdCategoria").val(), Nom_Nome: $("#Nom_Nome").val()}).done(function (){
            GetAllCategoria();
        });
    }

    var CarregaPost = function () {
        $.post(config.urls.CarregaPost).done(function (data) {
            $("body").html(data);
        });
    }

    var Post = function () {
        $.post(config.urls.Post, { Nom_Nome: $("#Nom_Nome").val() }).done(function () {
            GetAllCategoria();
        });
    }

    var CarregaDelete = function (Num_IdCategoria, Nom_Nome) {
        $.post(config.urls.CarregaDelete, { Num_IdCategoria, Nom_Nome }).done(function (data) {
            $("body").html(data);
        });
    }

    var Delete = function (Num_IdCategoria) {
        $.post(config.urls.Delete, { Num_IdCategoria: Num_IdCategoria }).done(function () {
            GetAllCategoria();
        });
    }

    var init = function ($config) {
        config = $config;
    };

    
    return {
        init: init,
        GetAllCategoria: GetAllCategoria,
        GetCategoria: GetCategoria,
        CarregaPut: CarregaPut,
        Put: Put,
        CarregaPost: CarregaPost,
        Post: Post,
        CarregaDelete: CarregaDelete,
        Delete: Delete
    }
})();