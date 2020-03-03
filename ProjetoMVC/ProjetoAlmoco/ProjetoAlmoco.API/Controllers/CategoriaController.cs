using ProjetoAlmoco.Domain.Categoria;
using ProjetoAlmoco.Domain.Categoria.Dto;
using System;
using System.Web.Http;

namespace ProjetoAlmoco.Api.Controllers
{
    public class CategoriaController : ApiController
    {
        private readonly ICategoriaRepository _categoriaRepository;

        public CategoriaController(ICategoriaRepository categoriaRepository)
        {
            _categoriaRepository = categoriaRepository;
        }

        [HttpGet, Route(template: "API/Categoria/GetAll")]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(_categoriaRepository.getAll());
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
                return Ok(_categoriaRepository.get(Num_Id));

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
                _categoriaRepository.delete(Num_Id);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut]
        public IHttpActionResult Put(CategoriaDto categoria)
        {
            try
            {
                _categoriaRepository.put(categoria);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Post(CategoriaDto categoria)
        {
            try
            {
                _categoriaRepository.post(categoria);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}