using ProjetoAlmoco.Domain.Alimento;
using ProjetoAlmoco.Domain.Pedidos.Dto;
using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Pedidos
{
    public interface IPedidosRepository
    {
        void post(PedidosDto pedidos);
        void put(PedidosDto pedidos);
        void delete(PedidosDto pedidos);
        void deleteAll(PedidosDto pedidos);
        IEnumerable<PedidosDto> getAll();
        PedidosDto get(int Num_Id);
    }
}
