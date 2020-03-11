var RotasPedidos = (function () {

    var config = {
        urls: {
            GetAllAlimento: '',
            GetPedidos: '',
            Post: '',
            CarregaPost: '',
            Put: '',
            CarregaPut: '',
            Delete: '',
            CarregaDelete: '',
            DeleteAll: ''
        }
    };


    var GetAllPedidos = function () {
        $.get(config.urls.GetAllPedidos).done(function (data) {
            $("body").html(data);
        });
    }

    var GetPedidos = function (Num_Id) {
        $.post(config.urls.GetPedidos, { Num_Id: Num_Id }).done(function (data) {
            $("body").html(data);
        });
    }

    var CarregaPost = function () {
        $.post(config.urls.CarregaPost).done(function (data) {
            $("body").html(data);
        });
    }

    var Post = function () {
        $.post(config.urls.Post, { Nom_Nome: $("#Nom_Nome").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Nom_NomeAlimento: $("#Nom_NomeAlimento").val()}).done(function () {
            GetAllPedidos();
        });
    }

    var CarregaPut = function (Num_IdPedidos,Nom_Nome,Nom_Sobrenome,Nom_NomeAlimento) {
        $.post(config.urls.CarregaPut, { Num_IdPedidos, Nom_Nome, Nom_Sobrenome, Nom_NomeAlimento }).done(function (data) {
            $("body").html(data);
        });
    }

    var Put = function () {
        $.post(config.urls.Put, { Num_IdPedidos: $("#Num_IdPedidos").val(), Nom_Nome: $("#Nom_Nome").val(),Dat_Date: $("#Dat_Date").val(), Nom_Sobrenome: $("#Nom_Sobrenome").val(), Nom_NomeAlimento: $("#Nom_NomeAlimento").val() }).done(function () {
            GetAllPedidos();
        });
    }

    var CarregaDelete = function (Num_IdPedidos, Nom_Nome, Nom_Sobrenome, Nom_NomeAlimento) {
        $.post(config.urls.CarregaDelete, { Num_IdPedidos, Nom_Nome, Nom_Sobrenome, Nom_NomeAlimento }).done(function (data) {
            $("body").html(data);
        });
    }

    var Delete = function (Num_Id) {
        $.post(config.urls.Delete, { Num_Id: Num_Id }).done(function () {
            GetAllAlimento();
        });
    }

    var DeleteAll = function () {
        $.get(config.urls.DeleteAll).done(function () {
            GetAllAlimento();
        });
    }

    var init = function ($config) {
        config = $config;
    };



    return {
        init: init,
        GetAllPedidos: GetAllPedidos,
        GetPedidos: GetPedidos,
        CarregaPut: CarregaPut,
        Put: Put,
        CarregaPost: CarregaPost,
        Post: Post,
        CarregaDelete: CarregaDelete,
        Delete: Delete,
        DeleteAll: DeleteAll
    }
})();