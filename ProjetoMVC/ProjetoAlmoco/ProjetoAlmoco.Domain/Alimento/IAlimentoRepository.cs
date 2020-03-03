using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Alimento
{
    public interface IAlimentoRepository
    {
        void post(AlimentosDto alimentos);
        void put(AlimentosDto alimentos);
        void delete(AlimentosDto alimentos);
        IEnumerable<AlimentosDto> getAll();
        IEnumerable<AlimentosDto> getDisp();
        AlimentosDto get(int Num_Id);
    }
}
