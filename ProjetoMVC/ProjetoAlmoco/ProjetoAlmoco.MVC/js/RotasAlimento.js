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

    var CarregaPost = function (Num_IdCategoria) {
        console.log(Num_IdCategoria);
        $.post(config.urls.CarregaPost, { Num_IdCategoria: Num_IdCategoria}).done(function (data) {
            $("#CarregaPostAlimento").html(data);
            var modal = document.getElementById("modal-adicionar-alimento");
            modal.style.display = "block";
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

    var CarregaDelete = function (Num_IdAlimentos) {
        console.log(Num_IdAlimentos);
        $.post(config.urls.CarregaDelete, { Num_IdAlimentos: Num_IdAlimentos }).done(function (data) {
            $("#CarregaDeleteAlimento").html(data);
            var modal = document.getElementById("modal-excluir-alimento");
            modal.style.display = "block";
        });
    }

    var Delete = function (Num_Id) {
        console.log(Num_Id);
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