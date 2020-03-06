var RotasAlimento = (function () {

    var config = {
        urls: {
            GetAllAlimento: '',
            GetAlimento: '',
            Post: '',
            CarregaPost: '',
            Put: '',
            CarregaPut: '',
            Delete: '',
            CarregaDelete: '',
            GetDispAlimento: ''
        }
    };


    var GetAllAlimento = function () {
        $.get(config.urls.GetAllAlimento).done(function (data) {
            $("body").html(data);
        });
    }

    var GetDispAlimento = function () {
        $.get(config.urls.GetDispAlimento).done(function (data) {
            $("body").html(data);
        });
    }

    var GetAlimento = function (Num_Id) {
        $.post(config.urls.GetAlimento, { Num_Id: Num_Id }).done(function (data) {
            $("body").html(data);
        });
    }

    var CarregaPost = function () {
        $.post(config.urls.CarregaPost).done(function (data) {
            $("body").html(data);
        });
    }

    var Post = function () {
        $.post(config.urls.Post, { Nom_NomeAlimento: $("#Nom_NomeAlimento").val(), Ind_Disponivel: $("#check").is(':checked'), Num_IdCategoria: $("#Num_IdCategoria").val() }).done(function () {
            GetAllAlimento();
        });
    }

    var CarregaPut = function (Num_IdAlimentos, Nom_NomeAlimento) {
        console.log($("#check").is(':checked'));
        $.post(config.urls.CarregaPut, { Num_IdAlimentos, Nom_NomeAlimento, Ind_Disponivel: $("#check").is(':checked') }).done(function (data) {
            $("body").html(data);
        });
    }

    var Put = function () {
        $.post(config.urls.Put, { Num_IdAlimentos: $("#Num_IdAlimentos").val(), Nom_NomeAlimento: $("#Nom_NomeAlimento").val(), Ind_Disponivel: $("#Ind_Disponivel").is(':checked')}).done(function () {
            GetAllAlimento();
        });
    }

    var CarregaDelete = function (Num_IdAlimentos, Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria) {
        $.post(config.urls.CarregaDelete, { Num_IdAlimentos, Nom_NomeAlimento, Ind_Disponivel, Num_IdCategoria }).done(function (data) {
            $("body").html(data);
        });
    }

    var Delete = function (Num_Id) {
        $.post(config.urls.Delete, { Num_Id: Num_Id }).done(function () {
            GetAllAlimento();
        });
    }

    var init = function ($config) {
        config = $config;
    };



    return {
        init: init,
        GetAllAlimento: GetAllAlimento,
        GetAlimento: GetAlimento,
        CarregaPut: CarregaPut,
        Put: Put,
        CarregaPost: CarregaPost,
        Post: Post,
        CarregaDelete: CarregaDelete,
        Delete: Delete,
        GetDispAlimento: GetDispAlimento
    }
})();