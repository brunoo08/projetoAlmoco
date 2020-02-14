using ProjetoAlmoco.Application;
using System.Web.Mvc;

namespace ProjetoAlmoco.MVC.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
    }
}