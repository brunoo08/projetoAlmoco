using ProjetoAlmoco.Domain.Alimento;
using System;
using System.Web.Http;
using System.Web.Mvc;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using HttpPutAttribute = System.Web.Http.HttpPutAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace ProjetoAlmoco.Api.Controllers
{
    public class AlimentoController : ApiController
    {
        private readonly IAlimentoRepository _alimentoRepository;

        public AlimentoController(IAlimentoRepository alimentoRepository)
        {
            _alimentoRepository = alimentoRepository;
        }

        [HttpGet, Route(template: "API/Alimento/GetAll")]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(_alimentoRepository.getAll());
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
                return Ok(_alimentoRepository.get(Num_Id));

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Delete(AlimentosDto alimentos)
        {
            try
            {
                _alimentoRepository.delete(alimentos);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut]
        public IHttpActionResult Put(AlimentosDto alimentos)
        {
            try
            {
                _alimentoRepository.put(alimentos);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Post(AlimentosDto alimentos)
        {
            try
            {
                _alimentoRepository.post(alimentos);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}