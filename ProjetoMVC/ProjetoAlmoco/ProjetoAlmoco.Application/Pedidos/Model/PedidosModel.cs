using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Application.Pedidos.Model
{
    public class PedidosModel
    {
        public int Num_IdPedidos { get; set; }
        public int Num_IdUsuario { get; set; }
        public DateTime Dat_Date { get; set; }
        public int Num_IdAlimento { get; set; }
    }
}
