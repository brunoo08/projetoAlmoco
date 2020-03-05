using ProjetoAlmoco.Application.Alimento;
using ProjetoAlmoco.Application.Alimento.Model;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace ProjetoAlmoco.MVC.Controllers
{
    public class AlimentoController : Controller
    {
        private readonly AlimentoApplication _alimentoApplication;

        public AlimentoController()
        {
            _alimentoApplication = new AlimentoApplication();
        }

        public ActionResult GetAllAlimento()
        {
            HttpResponseMessage response = _alimentoApplication.GetAllAlimento();
            return View(response.Content.ReadAsAsync<List<AlimentoModel>>().Result);
        }

        public ActionResult GetAlimento(int Num_Id)
        {
            HttpResponseMessage response = _alimentoApplication.GetAlimento(Num_Id);
            return View(response.Content.ReadAsAsync<AlimentoModel>().Result);
        }

        public ActionResult CarregaPut(AlimentoModel alimentoModel)
        {
            return View("CarregaPut", alimentoModel);
        }

        public ActionResult Put(AlimentoModel alimentoModel)
        {
            HttpResponseMessage response = _alimentoApplication.Put(alimentoModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult Post(AlimentoModel alimentoModel)
        {
            HttpResponseMessage response = _alimentoApplication.Post(alimentoModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaPost()
        {
            return View("CarregaPost", new AlimentoModel());
        }

        public ActionResult Delete(int Num_Id)
        {
            HttpResponseMessage response = _alimentoApplication.Delete(Num_Id);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaDelete(AlimentoModel alimentoModel)
        {
            return View("CarregaDelete", alimentoModel);
        }
    }
}