using ProjetoAlmoco.Application.Usuario;
using ProjetoAlmoco.Application.Usuario.Model;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Net.Http;

namespace ProjetoAlmoco.MVC.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly UsuarioApplication _usuarioApplication;

        public UsuarioController()
        {
            _usuarioApplication = new UsuarioApplication();
        }

        public ActionResult Index()
        {
            return View("Index");
        } 

        public ActionResult GetAllUsuario()
        {
            HttpResponseMessage response = _usuarioApplication.GetAllUsuario();
            return View(response.Content.ReadAsAsync<List<UsuarioModel>>().Result);
        }

        public ActionResult GetUsuario(int Num_Id)
        {
            HttpResponseMessage response = _usuarioApplication.GetUsuario(Num_Id);
            return View(response.Content.ReadAsAsync<UsuarioModel>().Result);
        }


        public ActionResult CarregaPut(UsuarioModel usuarioModel)
        {
            return View("Put", usuarioModel);
        }

        public ActionResult Put(UsuarioModel usuarioModel)
        {
            HttpResponseMessage response = _usuarioApplication.Put(usuarioModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult Post(UsuarioModel usuarioModel)
        {
            HttpResponseMessage response = _usuarioApplication.Post(usuarioModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaPost()
        {
            
            return View("Post", new UsuarioModel());
        }

        public ActionResult Delete(UsuarioModel usuarioModel)
        {
            HttpResponseMessage response = _usuarioApplication.Delete(usuarioModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaDelete(UsuarioModel usuarioModel)
        {
            return View("Delete",usuarioModel);
        }

    }
}