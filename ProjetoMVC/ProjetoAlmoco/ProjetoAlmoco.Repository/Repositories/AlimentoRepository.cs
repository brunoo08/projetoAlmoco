using ProjetoAlmoco.Domain.Alimento;
using System;
using System.Collections.Generic;
namespace ProjetoAlmoco.Repository.Repositories
{
    public class AlimentoRepository : Connection , IAlimentoRepository
    {
        public IEnumerable<AlimentosDto> getAll()
        {
            ExecuteProcedure("SelAlimento");

            var allUsersData = new List<AlimentosDto>();
            using (var reader = ExecuteReader())
                while (reader.Read())
                    allUsersData.Add(new AlimentosDto
                    {
                        Num_IdAlimentos = Convert.ToInt16(reader["Num_IdAlimentos"].ToString()),
                        Nom_NomeAlimento = reader["Nom_NomeAlimento"].ToString(),
                        Ind_Disponivel = Convert.ToBoolean(reader["Ind_Disponivel"].ToString()),
                        Num_IdCategoria = Convert.ToInt16(reader["Num_IdCategoria"].ToString())
                    });

            return allUsersData;
        }

        public IEnumerable<AlimentosDto> getDisp()
        {
            ExecuteProcedure("SelAlimentosDisponiveis");

            var allUsersData = new List<AlimentosDto>();
            using (var reader = ExecuteReader())
                while (reader.Read())
                    allUsersData.Add(new AlimentosDto
                    {
                        Num_IdAlimentos = Convert.ToInt16(reader["Num_IdAlimentos"].ToString()),
                        Nom_NomeAlimento = reader["Nom_NomeAlimento"].ToString(),
                        Ind_Disponivel = Convert.ToBoolean(reader["Ind_Disponivel"].ToString()),
                        Num_IdCategoria = Convert.ToInt16(reader["Num_IdCategoria"].ToString())
                    });

            return allUsersData;
        }

        public AlimentosDto get(int Num_Id)
        {
            ExecuteProcedure("SelAlimentoId");
            AddParameter("@Num_id", Num_Id);

            using (var reader = ExecuteReader())
                if (reader.Read())
                    return new AlimentosDto
                    {
                        Num_IdAlimentos = Convert.ToInt16(reader["Num_IdAlimentos"].ToString()),
                        Nom_NomeAlimento = reader["Nom_NomeAlimento"].ToString(),
                        Ind_Disponivel = Convert.ToBoolean(reader["Ind_Disponivel"].ToString()),
                        Num_IdCategoria = Convert.ToInt16(reader["Num_IdCategoria"].ToString())
                    };

            return null;
        }

        public void delete(int Num_Id)
        {

            ExecuteProcedure("DelAlimento");
            AddParameter("@Num_Id", Num_Id);
            ExecuteNonQuery();

        }

        public void put(AlimentosDto alimentos)
        {
            ExecuteProcedure("UpdAlimento");
            AddParameter("@Num_Id", alimentos.Num_IdAlimentos);
            AddParameter("@Nom_Nome", alimentos.Nom_NomeAlimento);
            AddParameter("@Ind_Disponivel", alimentos.Ind_Disponivel);
            ExecuteNonQuery();
        }

        public void post(AlimentosDto alimentos)
        {
            ExecuteProcedure("InsAlimento");
            AddParameter("@Nom_Nome", alimentos.Nom_NomeAlimento);
            AddParameter("@Ind_Disponivel", alimentos.Ind_Disponivel);
            AddParameter("@Num_IdCategoria", alimentos.Num_IdCategoria);
            ExecuteNonQuery();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
