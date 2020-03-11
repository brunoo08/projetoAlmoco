using ProjetoAlmoco.Domain.Alimento;
using ProjetoAlmoco.Domain.Pedidos;
using ProjetoAlmoco.Domain.Pedidos.Dto;
using System;
using System.Web.Http;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using HttpPutAttribute = System.Web.Http.HttpPutAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace ProjetoAlmoco.Api.Controllers
{
    public class PedidosController : ApiController
    {
        private readonly IPedidosRepository _pedidosRepository;

        public PedidosController(IPedidosRepository pedidosRepository)
        {
            _pedidosRepository = pedidosRepository;
        }

        [HttpGet, Route(template: "API/Pedidos/GetAll")]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(_pedidosRepository.getAll());
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Get(int Num_Id)
        {
            try
            {
                return Ok(_pedidosRepository.get(Num_Id));

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Delete(int Num_Id)
        {
            try
            {
                _pedidosRepository.delete(Num_Id);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut]
        public IHttpActionResult Put(MostraPedidosDto mostrapedidos)
        {
            try
            {
                _pedidosRepository.put(mostrapedidos);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Post(MostraPedidosDto pedidos)
        {
            try
            {
                _pedidosRepository.post(pedidos);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}