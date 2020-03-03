using ProjetoAlmoco.Domain.Categoria;
using ProjetoAlmoco.Domain.Categoria.Dto;
using System;
using System.Collections.Generic;

namespace ProjetoAlmoco.Repository.Repositories
{
    public class CategoriaRepository : Connection, ICategoriaRepository
    {
        public void post(CategoriaDto categoria)
        {
            ExecuteProcedure("InsCategoria");
            AddParameter("@Nom_Nome", categoria.Nom_Nome);
            ExecuteNonQuery();
        }

        public void put(CategoriaDto categoria)
        {
            ExecuteProcedure("UpdCategoria");
            AddParameter("@Num_Id", categoria.Num_IdCategoria);
            AddParameter("@Nom_Nome",categoria.Nom_Nome);
            ExecuteNonQuery();
        }

<<<<<<< HEAD
        public void delete(CategoriaDto categoria)
        {
            ExecuteProcedure("DelCategoria");
            AddParameter("@Num_Id", categoria.Num_IdCategoria);
=======
        public void delete(int Num_Id)
        {
            ExecuteProcedure("DelCategoria");
            AddParameter("@Num_Id", Num_Id);
>>>>>>> 2299ab25f14e87c57933939fa57168f5b8d5602c
            ExecuteNonQuery();
        }

        public IEnumerable<CategoriaDto> getAll()
        {
            ExecuteProcedure("SelCategoria");

            var allUsersData = new List<CategoriaDto>();
            using (var reader = ExecuteReader())
                while (reader.Read())
                    allUsersData.Add(new CategoriaDto
                    {
                        Num_IdCategoria = Convert.ToInt16(reader["Num_IdCategoria"].ToString()),
                        Nom_Nome = reader["Nom_Nome"].ToString()
                    });

            return allUsersData;
        }

        public CategoriaDto get(int Num_Id)
        {
            ExecuteProcedure("SelCategoriaId");
            AddParameter("@Num_Id", Num_Id);

            using (var reader = ExecuteReader())
                if (reader.Read())
                    return new CategoriaDto
                    {
                        Num_IdCategoria = Convert.ToInt16(reader["Num_IdCategoria"].ToString()),
                        Nom_Nome = reader["Nom_Nome"].ToString()
                    };

            return null;
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
