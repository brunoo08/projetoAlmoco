using System;

namespace ProjetoAlmoco.Application.Pedidos.Model
{
    public class MostraPedidosModel
    {
        public int Num_IdPedidos { get; set; }
        public string Nom_Nome { get; set; }
        public string Nom_Sobrenome { get; set; }
        public DateTime Dat_Date { get; set; }
        public string Nom_NomeAlimento { get; set; }
    }
}
