using ProjetoAlmoco.Application.Categoria;
using ProjetoAlmoco.Application.Categoria.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace ProjetoAlmoco.MVC.Controllers
{
    public class AdmController : Controller
    {
        private readonly CategoriaApplication _categoriaApplication;

        public AdmController()
        {
            _categoriaApplication = new CategoriaApplication();
        }
        // GET: Adm
        public ActionResult Index()
        {
            HttpResponseMessage response = _categoriaApplication.GetAllCategoria();
            ViewBag.GetAllCategorys = response.Content.ReadAsAsync<List<CategoriaModel>>().Result;
            return View();
        }
    }
}