using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Domain.Entities
{
    public class Pedidos
    {
        public int Num_IdPedidos { get; set; }
        public string Nom_Nome { get; set; }
        public string Nom_Sobrenome { get; set; }
        public DateTime Dat_Date { get; set; }
        public int um_IdAlimento { get; set; }
    }
}
