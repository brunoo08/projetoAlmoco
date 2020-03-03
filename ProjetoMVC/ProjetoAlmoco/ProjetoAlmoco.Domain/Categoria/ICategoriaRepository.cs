using ProjetoAlmoco.Domain.Categoria.Dto;
using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Categoria
{
    public interface ICategoriaRepository
    {
        void post(CategoriaDto categoria);
        void put(CategoriaDto categoria);
<<<<<<< HEAD
        void delete(CategoriaDto categoria);
=======
        void delete(int Num_Id);
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
        IEnumerable<CategoriaDto> getAll();
        CategoriaDto get(int Num_Id);
    }
}
