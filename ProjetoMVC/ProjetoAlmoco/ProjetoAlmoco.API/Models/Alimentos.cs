using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoAlmoco.API.Models
{
    public class Alimentos
    {
        public int Num_IdAlimentos { get; set; }
        public string Nom_NomeAlimento { get; set; }
        public char Id_Disponivel { get; set; }
        public int Num_IdCategoria { get; set; }
    }
}