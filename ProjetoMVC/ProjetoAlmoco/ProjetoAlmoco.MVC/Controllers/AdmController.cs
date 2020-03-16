using ProjetoAlmoco.Application.Categoria;
using ProjetoAlmoco.Application.Categoria.Model;
using ProjetoAlmoco.Application.Alimento;
using ProjetoAlmoco.Application.Alimento.Model;
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

        private readonly AlimentoApplication _alimentoApplication;

        public AdmController()
        {
            _categoriaApplication = new CategoriaApplication();
            _alimentoApplication = new AlimentoApplication();
        }
        // GET: Adm
        public ActionResult Index()
        {
            HttpResponseMessage response = _categoriaApplication.GetAllCategoria();
            ViewBag.GetAllCategorys = response.Content.ReadAsAsync<List<CategoriaModel>>().Result;
            HttpResponseMessage response2 = _alimentoApplication.GetAllAlimento();
            ViewBag.GetAllAliment = response2.Content.ReadAsAsync<List<AlimentoModel>>().Result;
            return View();
        }
    }
}