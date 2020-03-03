using ProjetoAlmoco.Domain.Alimento;
using ProjetoAlmoco.Domain.Categoria;
using ProjetoAlmoco.Domain.Pedidos;
using ProjetoAlmoco.Domain.Usuario;
using ProjetoAlmoco.Repository.Repositories;
using SimpleInjector;
using SimpleInjector.Lifestyles;

namespace ProjetoAlmoco.Api.App_Start
{
    public class SimpleInjectorContainer
    {
        private static readonly Container container = new Container();

        public static Container Build()
        {
            container.Options.DefaultScopedLifestyle = new AsyncScopedLifestyle();

            RegisterRepositories();
            RegisterServices();

            container.Verify();
            return container;
        }

        private static void RegisterRepositories()
        {
            container.Register<IUsuarioRepository, UsuarioRepository>();
            container.Register<ICategoriaRepository, CategoriaRepository>();
            container.Register<IAlimentoRepository, AlimentoRepository>();
            container.Register<IPedidosRepository, PedidosRepository>();
        }

        private static void RegisterServices()
        {
        }
    }
}