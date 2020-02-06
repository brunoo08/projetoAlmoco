using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoAlmoco.API.Models
{
    public class Pedidos
    {
        public int Num_IdPedidos { get; set; }
        public string Nom_Nome { get; set; }
        public string Nom_Sobrenome { get; set; }
        public DateTime Dat_Date { get; set; }
        public int Num_IdAlimento { get; set; }
    }
}