using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Domain.Entities
{
    public class Usuario
    {
        public int Num_Id { get; set; }
        public string Nom_Nome { get; set; }
        public string Nom_Sobrenome { get; set; }
        public string Nom_Login { get; set; }
        public string Nom_Senha { get; set; }
    }
}
