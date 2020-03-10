function seuPedido(){
    var modal1 = document.getElementById("modal-fazer-pedido");
    var modal2 = document.getElementById("modal-seu-pedido");

    modal1.style.display = "none";
    modal2.style.display = "block";
}

function editarPedido(){
    // var modal1 = document.getElementById("modal-seu-pedido");
    var modalEditar = document.getElementById("modal-editar-pedido");

    // modal1.style.display = "none"
    modalEditar.style.display = "block"
}


function fecharEditar() {
    var modalEditar = document.getElementById("modal-editar-pedido");
    modalEditar.style.display = "none";
}

function fechaErro(){
    var modal4 = document.getElementById("modal-erro-editar-categoria");
    modal4.style.display = "none";
}