using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Usuario
{
    public interface IUsuarioRepository
    {
        IEnumerable<UsuarioDto> getAll();
        UsuarioDto get(int Num_Id);
        void delete(int Num_Id);
        void put(UsuarioDto usuario);
        void post(UsuarioDto usuario);
        int login(UsuarioDto usuario);
    }
}
