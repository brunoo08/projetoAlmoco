using ProjetoAlmoco.Domain.Alimento;
using ProjetoAlmoco.Domain.Pedidos.Dto;
using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Pedidos
{
    public interface IPedidosRepository
    {
        void post(MostraPedidosDto pedidos);
        void put(MostraPedidosDto pedidos);
        void delete(int Num_Id);
        IEnumerable<MostraPedidosDto> getAll();
        MostraPedidosDto get(int Num_Id);
    }
}
