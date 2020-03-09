﻿using ProjetoAlmoco.Application.Categoria;
using ProjetoAlmoco.Application.Categoria.Model;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace ProjetoAlmoco.MVC.Controllers
{
    public class CategoriaController : Controller
    {
        private readonly CategoriaApplication _categoriaApplication;

        public CategoriaController()
        {
            _categoriaApplication = new CategoriaApplication();
        }

        public ActionResult GetAllCategoria()
        {
            HttpResponseMessage response = _categoriaApplication.GetAllCategoria();
            ViewBag.GetAllCategorys = response.Content.ReadAsAsync<List<CategoriaModel>>().Result;
            return View();
        }

        public ActionResult GetCategoria(int Num_Id)
        {
            HttpResponseMessage response = _categoriaApplication.GetCategoria(Num_Id);
            return View(response.Content.ReadAsAsync<CategoriaModel>().Result);
        }

        public ActionResult CarregaPut(CategoriaModel categoriaModel)
        {
            return View("CarregaPut", categoriaModel);
        }

        public ActionResult Put(CategoriaModel categoriaModel)
        {
            HttpResponseMessage response = _categoriaApplication.Put(categoriaModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult Post(CategoriaModel categoriaModel)
        {
            HttpResponseMessage response = _categoriaApplication.Post(categoriaModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaPost()
        {

            return View("CarregaPost", new CategoriaModel());
        }
        public ActionResult Delete(int Num_IdCategoria)
        {
            HttpResponseMessage response = _categoriaApplication.Delete(Num_IdCategoria);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaDelete(CategoriaModel categoriaModel)
        {
            return View("CarregaDelete", categoriaModel);
        }
    }
}