using ProjetoAlmoco.Application.Usuario;
using ProjetoAlmoco.Application.Usuario.Model;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Net.Http;
using ProjetoAlmoco.Api.Controllers;

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
                return View("Erro1"); //view de erro 
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

        public ActionResult Delete(int Num_Id)
        {
            HttpResponseMessage response = _usuarioApplication.Delete(Num_Id);

            if (!response.IsSuccessStatusCode)
                return View("Erro1");   //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaDelete(UsuarioModel usuarioModel)
        {
            return View("Delete",usuarioModel);
        }

        public ActionResult Login(UsuarioModel usuarioModel)
        {
            HttpResponseMessage response = _usuarioApplication.Login(usuarioModel);
            if (response.Content.Headers.ContentLength == 1)
            {
                return RedirectToAction("Index", "Adm");
            }
            if (response.Content.Headers.ContentLength == 2)
            {
                return RedirectToAction("Index", "User");
            }
            else
            {
                return View("Erro");
            }
            
        }

    }

}