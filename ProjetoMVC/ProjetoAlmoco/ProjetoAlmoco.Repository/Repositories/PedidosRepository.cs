using ProjetoAlmoco.Domain.Alimento;
using ProjetoAlmoco.Domain.Pedidos;
using ProjetoAlmoco.Domain.Pedidos.Dto;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Repositories
{
    public class PedidosRepository : Connection , IPedidosRepository
    {
        public IEnumerable<MostraPedidosDto> getAll()
        {
            ExecuteProcedure("SelPedido");

            var allUsersData = new List<MostraPedidosDto>();
            using (var reader = ExecuteReader())
                while (reader.Read())
                    allUsersData.Add(new MostraPedidosDto
                    {
                        Num_IdPedidos = Convert.ToInt16(reader["Num_IdPedidos"].ToString()),
                        Nom_Nome = reader["Nom_Nome"].ToString(),
                        Nom_Sobrenome = reader["Nom_Sobrenome"].ToString(),
                        //Dat_Date = Convert.ToDateTime(reader["Dat_Date"].ToString()),
                        Nom_NomeAlimento = reader["Nom_NomeAlimento"].ToString()
                    });

            return allUsersData;
        }

        public MostraPedidosDto get(int Num_Id)
        {
            ExecuteProcedure("SelPedidoId");
            AddParameter("@Num_Id", Num_Id);

            using (var reader = ExecuteReader())
                if (reader.Read())
                    return new MostraPedidosDto
                    {
                        Num_IdPedidos = Convert.ToInt16(reader["Num_IdPedidos"].ToString()),
                        Nom_Nome = reader["Nom_Nome"].ToString(),
                        Nom_Sobrenome = reader["Nom_Sobrenome"].ToString(),
                        //Dat_Date = Convert.ToDateTime(reader["Dat_Date"].ToString()),
                        Nom_NomeAlimento = reader["Nom_NomeAlimento"].ToString()
                    };

            return null;
        }

        public void delete(int Num_Id)
        {

            ExecuteProcedure("DelPedido");
            AddParameter("@Num_Id",Num_Id);
            ExecuteNonQuery();

        }

        public void put(MostraPedidosDto pedidos)
        {
            ExecuteProcedure("UpdPedido");
            AddParameter("@Num_IdPedido", pedidos.Num_IdPedidos);
            AddParameter("@Nom_Nome", pedidos.Nom_Nome);
            AddParameter("@Nom_Sobrenome", pedidos.Nom_Sobrenome);
            AddParameter("@Nom_NomeAlimento", pedidos.Nom_NomeAlimento);
            ExecuteNonQuery();
        }

        public void post(MostraPedidosDto pedidos)
        {
            ExecuteProcedure("InsPedido");
            AddParameter("@Nom_Nome", pedidos.Nom_Nome);
            AddParameter("@Nom_Sobrenome", pedidos.Nom_Sobrenome);
            AddParameter("@Nom_NomeAlimento", pedidos.Nom_NomeAlimento);
            ExecuteNonQuery();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
