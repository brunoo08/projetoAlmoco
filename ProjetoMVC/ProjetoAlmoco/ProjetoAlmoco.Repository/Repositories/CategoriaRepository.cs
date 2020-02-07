using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Repositories
{
    class CategoriaRepository
    {
        public void InsCategoria(string Nom_Nome)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "InsCategoria";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void UpdCategoria(string Nom_Nome, string Nom_NovoNome)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "UpdCategoria";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_NovoNome", Nom_NovoNome));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void DelCategoria(string Nom_Nome)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "DelCategoria";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void SelCategoria()
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "SelCategoria";
                using (var Context = new Context())
                {
                    Context.executaComandoComRetorno(cmdComando);
                }
            }

        }
    }
}
