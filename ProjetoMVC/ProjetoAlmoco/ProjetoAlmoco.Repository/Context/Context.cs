using ProjetoAlmoco.Domain.Entities;
using System;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Context
{ 
    public class Context : IDisposable
    {
        private readonly SqlConnection minhaConexao;

        public Context()
        {
            string _connectionString = "Data Source=ESTAGIO15;Initial Catalog=ProjetoAlmoco;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            minhaConexao = new SqlConnection(_connectionString);
            minhaConexao.Open();
        }
        


        public void Dispose()
        {
            if (minhaConexao.State == ConnectionState.Open)
                minhaConexao.Close();
        }

    }
}
