using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Repositories
{
    class PedidosRepository
    {
        public void InsPedido(string Nom_Nome, string Nom_Sobrenome, string Nom_Alimento)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "InsPedido";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Sobrenome", Nom_Sobrenome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Alimento", Nom_Alimento));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void UpdPedido(string Nom_Nome, string Nom_Sobrenome, string Nom_Alimento, string Nom_NovoAlimento)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "UpdPedido";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Sobrenome", Nom_Sobrenome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_NomeAlimento", Nom_Alimento));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_NomeAlimento", Nom_NovoAlimento));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void DelPedido(string Nom_Nome, string Nom_Sobrenome)
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "DelPedido";
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Nome", Nom_Nome));
                cmdComando.Parameters.Add(new SqlParameter("@Nom_Sobrenome", Nom_Sobrenome));
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }

        public void SelPedido()
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "SelPedido";
                using (var Context = new Context())
                {
                    Context.executaComandoComRetorno(cmdComando);
                }
            }

        }

        public void DelTodosPedido()
        {
            SqlCommand cmdComando;
            using (cmdComando = new SqlCommand())
            {
                cmdComando.CommandText = "DelTodosPedido";
                using (var Context = new Context())
                {
                    Context.executaComando(cmdComando);
                }
            }

        }
    }
}
