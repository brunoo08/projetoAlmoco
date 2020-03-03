using ProjetoAlmoco.Domain.Alimento;
using ProjetoAlmoco.Domain.Usuario;
using System;

namespace ProjetoAlmoco.Domain.Pedidos.Dto
{
    public class PedidosDto
    {
        public int Num_IdPedidos { get; set; }
        public int Num_IdUsuario { get; set; }
        public DateTime Dat_Date { get; set; }
        public int Num_IdAlimento { get; set; }
    }

}