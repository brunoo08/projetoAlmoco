using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Application.Alimento.Model
{
    public class AlimentoModel
    {
        public int Num_IdAlimentos { get; set; }
        public string Nom_NomeAlimento { get; set; }
        public bool Ind_Disponivel { get; set; }
        public int Num_IdCategoria { get; set; }
    }
}
