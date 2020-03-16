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
           
            return View();
        }

        public ActionResult GetAlimento(int Num_Id)
        {
            HttpResponseMessage response = _alimentoApplication.GetAlimento(Num_Id);
            return View(response.Content.ReadAsAsync<AlimentoModel>().Result);
        }

        public ActionResult GetDispAlimento()
        {
            HttpResponseMessage response = _alimentoApplication.GetDispAlimento();
            return View(response.Content.ReadAsAsync<List<AlimentoModel>>().Result);
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

        public ActionResult CarregaPost(int Num_IdCategoria)
        {
            var alimentoModel = new AlimentoModel();
            alimentoModel.Num_IdCategoria = Num_IdCategoria;
            return View("CarregaPost", alimentoModel);
        }

        public ActionResult Delete(int Num_Id)
        {
            HttpResponseMessage response = _alimentoApplication.Delete(Num_Id);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaDelete(AlimentoModel alimentoModel, int Num_IdAlimento)
        {
            alimentoModel.Num_IdAlimentos = Num_IdAlimento;
            return View("CarregaDelete", alimentoModel);
        }
    }
}