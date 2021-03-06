﻿using ProjetoAlmoco.Domain.Categoria.Dto;
using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Categoria
{
    public interface ICategoriaRepository
    {
        void post(CategoriaDto categoria);
        void put(CategoriaDto categoria);

        void delete(int Num_Id);
        IEnumerable<CategoriaDto> getAll();
        CategoriaDto get(int Num_Id);
    }
}
