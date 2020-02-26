using ProjetoAlmoco.Domain.Usuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace ProjetoAlmoco.Repository.Repositories
{
    public class UsuarioRepository : Connection, IUsuarioRepository
    {
        public IEnumerable<UsuarioDto> getAll()
        {
            ExecuteProcedure("SelCliente");

            var allUsersData = new List<UsuarioDto>();
            using (var reader = ExecuteReader())
                while (reader.Read())
                    allUsersData.Add(new UsuarioDto
                    {
                        Num_Id = Convert.ToInt16(reader["Num_id"].ToString()),
                        Nom_Nome = reader["Nom_Nome"].ToString(),
                        Nom_Sobrenome = reader["Nom_Sobrenome"].ToString(),
                        Nom_Login = reader["Nom_Login"].ToString(),
                    });

            return allUsersData;
        }

        public UsuarioDto get(int Num_Id)
        {
            ExecuteProcedure("SelClienteId");
            AddParameter("@Num_Id",Num_Id);

            using (var reader = ExecuteReader())
                if (reader.Read())
                    return new UsuarioDto
                    {
                        Num_Id = Convert.ToInt16(reader["Num_Id"].ToString()),
                        Nom_Nome = reader["Nom_Nome"].ToString(),
                        Nom_Sobrenome = reader["Nom_Sobrenome"].ToString(),
                        Nom_Login = reader["Nom_Login"].ToString()
                    };

            return null;
        }

        public void delete(int Num_Id)
        {
            
            ExecuteProcedure("DelCliente");
            AddParameter("@Num_Id",Num_Id);
            ExecuteNonQuery();

        }

        public void put(UsuarioDto usuario)
        {
            ExecuteProcedure("UpdCliente");
             AddParameter("@Num_Id", usuario.Num_Id);
            AddParameter("@Nom_Login", usuario.Nom_Login);
            AddParameter("@Nom_Senha", usuario.Nom_Senha);
            AddParameter("@Nom_Nome", usuario.Nom_Nome);
            AddParameter("@Nom_Sobrenome", usuario.Nom_Sobrenome);
            ExecuteNonQuery();
        }

        public void post(UsuarioDto usuario)
        {
            ExecuteProcedure("InsCliente");
            AddParameter("@Nom_Nome", usuario.Nom_Nome);
            AddParameter("@Nom_Sobrenome", usuario.Nom_Sobrenome);
            AddParameter("@Nom_Login", usuario.Nom_Login);
            AddParameter("@Nom_Senha", usuario.Nom_Senha);
            ExecuteNonQuery();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

      
    }
}
