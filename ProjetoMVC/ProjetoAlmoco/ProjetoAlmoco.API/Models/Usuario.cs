﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoAlmoco.API.Models
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