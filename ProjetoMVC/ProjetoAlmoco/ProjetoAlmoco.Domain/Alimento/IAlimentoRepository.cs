using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Alimento
{
    public interface IAlimentoRepository
    {
        void post(AlimentosDto alimentos);
        void put(AlimentosDto alimentos);
        void delete(int Num_Id);
        IEnumerable<AlimentosDto> getAll();
        IEnumerable<AlimentosDto> getDisp();
        AlimentosDto get(int Num_Id);
    }
}
