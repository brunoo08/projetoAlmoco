using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Repositories
{
    class AlimentoRepository
    {
        public void InsAlimento(string Nom_Nome, char Ind_Disponivel, int Num_Categoria)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "InsAlimento";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Ind_Disponivel", Ind_Disponivel));
                cmdComando.Parameters.Add(new SqlParameter("@Num_Categoria", Num_Categoria));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void UpdAlimento(string Nom_Nome, string Nom_NovoNome, char Ind_Disponivel)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "UpdAlimento";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_NovoNome", Nom_NovoNome));
                cmdComando.Parameters.Add(new SqlParameter("@Ind_Disponivel", Ind_Disponivel));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void DelAlimento(string Nom_Nome)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "DelAlimento";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void SelAlimento()
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "SelAlimento";
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

    }
}
