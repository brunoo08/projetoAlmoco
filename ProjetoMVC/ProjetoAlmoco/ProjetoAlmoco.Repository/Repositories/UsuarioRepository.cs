using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Repositories
{
    public class UsuarioRepository
    {
        public void SelCliente()
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "SelCliente";
                using (var Context = new Context())
                {
                    Context.executaComandoComRetorno(cmdComando);
                }
            }
  
        }

        public void DelCliente(string Nom_Login)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "DelCliente";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Login", Nom_Login));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void UpdCliente(string Nom_Login, string Nom_Senha, string Nom_Nome, string Nom_Sobrenome)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "UpdCliente";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Login", Nom_Login));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Senha", Nom_Senha));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Sobrenome", Nom_Sobrenome));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void InsCliente(string Nom_Nome, string Nom_Sobrenome, string Nom_Login, string Nom_Senha)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "InsCliente";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Sobrenome", Nom_Sobrenome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Login", Nom_Login));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Senha", Nom_Senha));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }
    }
}
