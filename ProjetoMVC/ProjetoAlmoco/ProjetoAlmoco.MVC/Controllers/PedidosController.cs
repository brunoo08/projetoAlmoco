using ProjetoAlmoco.Application.Pedidos;
using ProjetoAlmoco.Application.Pedidos.Model;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace ProjetoAlmoco.MVC.Controllers
{
    public class PedidosController : Controller
    {
        private readonly PedidosApplication _pedidosApplication;

        public PedidosController()
        {
            _pedidosApplication = new PedidosApplication();
        }

        public ActionResult GetAllPedidos()
        {
            HttpResponseMessage response = _pedidosApplication.GetAllPedidos();
            return View(response.Content.ReadAsAsync<List<MostraPedidosModel>>().Result);
        }

        public ActionResult GetPedidos(int Num_Id)
        {
            HttpResponseMessage response = _pedidosApplication.GetPedidos(Num_Id);
            return View(response.Content.ReadAsAsync<MostraPedidosModel>().Result);
        }

        public ActionResult CarregaPut(MostraPedidosModel mostrapedidosModel)
        {
            return View("CarregaPut", mostrapedidosModel);
        }

        public ActionResult Put(MostraPedidosModel mostrapedidosModel)
        {
            HttpResponseMessage response = _pedidosApplication.Put(mostrapedidosModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult Post(MostraPedidosModel pedidosModel)
        {
            HttpResponseMessage response = _pedidosApplication.Post(pedidosModel);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaPost()
        {
            return View("CarregaPost", new MostraPedidosModel());
        }

        public ActionResult Delete(int Num_Id)
        {
            HttpResponseMessage response = _pedidosApplication.Delete(Num_Id);

            if (!response.IsSuccessStatusCode)
                return new HttpStatusCodeResult(200); //view de erro
            return new HttpStatusCodeResult(200);
        }

        public ActionResult CarregaDelete(MostraPedidosModel pedidosModel)
        {
            return View("CarregaDelete", pedidosModel);
        }



    }
}