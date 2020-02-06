using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Domain.Entities
{
    public class Alimentos
    {
        public int Num_IdAlimento { get; set; }
        public string Nom_NomeAlimento { get; set; }
        public char Ind_Disponivel { get; set; }
        public int Num_IdCategoria { get; set; }
    }
}
