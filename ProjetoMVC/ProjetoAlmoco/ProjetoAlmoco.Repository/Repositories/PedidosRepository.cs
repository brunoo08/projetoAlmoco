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
        public IEnumerable<PedidosDto> getAll()
        {
            ExecuteProcedure("SelPedido");

            var allUsersData = new List<PedidosDto>();
            using (var reader = ExecuteReader())
                while (reader.Read())
                    allUsersData.Add(new PedidosDto
                    {
                        Num_IdPedidos = Convert.ToInt16(reader["Num_IdPedidos"].ToString()),
                        Num_IdUsuario = Convert.ToInt16(reader["Num_IdUsuario"].ToString()),
                        Dat_Date = Convert.ToDateTime(reader["Dat_Date"].ToString()),
                        Num_IdAlimento = Convert.ToInt16(reader["Num_IdAlimento"].ToString()),
                    });

            return allUsersData;
        }

        public PedidosDto get(int Num_Id)
        {
            ExecuteProcedure("SelPedidoId");
            AddParameter("@Num_Id", Num_Id);

            using (var reader = ExecuteReader())
                if (reader.Read())
                    return new PedidosDto
                    {
                        Num_IdPedidos = Convert.ToInt16(reader["Num_IdPedidos"].ToString()),
                        Num_IdUsuario = Convert.ToInt16(reader["Num_IdUsuario"].ToString()),
                        Dat_Date = Convert.ToDateTime(reader["Dat_Date"].ToString()),
                        Num_IdAlimento = Convert.ToInt16(reader["Num_IdAlimento"].ToString()),
                    };

            return null;
        }

        public void delete(PedidosDto pedidos)
        {

            ExecuteProcedure("DelPedido");
            AddParameter("@Num_Id", pedidos.Num_IdPedidos);
            ExecuteNonQuery();

        }

        public void deleteAll(PedidosDto pedidos)
        {

            ExecuteProcedure("DelPedidoAll");
            ExecuteNonQuery();

        }

        public void put(PedidosDto pedidos)
        {
            ExecuteProcedure("UpdPedido");
            AddParameter("@Num_IdPedido", pedidos.Num_IdPedidos);
            AddParameter("@Num_IdUsuario", pedidos.Num_IdUsuario);
            AddParameter("@Num_IdAlimento", pedidos.Num_IdAlimento);
            ExecuteNonQuery();
        }

        public void post(PedidosDto pedidos)
        {
            ExecuteProcedure("InsPedido");
            AddParameter("@Num_Id", pedidos.Num_IdUsuario);
            AddParameter("@Num_IdAlimento", pedidos.Num_IdAlimento);
            ExecuteNonQuery();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
