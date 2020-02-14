using ProjetoAlmoco.Domain.Usuario;
using System;
using System.Web.Http;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace ProjetoAlmoco.Api.Controllers
{
    public class UsuarioController : ApiController
    {
        private readonly IUsuarioRepository _usuarioRepository;

        public UsuarioController(IUsuarioRepository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet, Route(template: "API/Usuario/GetAll")]
        public IHttpActionResult GetAll()
        {
            try
            {
                return Ok(_usuarioRepository.getAll());
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
                return Ok(_usuarioRepository.get(Num_Id));
                
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Delete(UsuarioDto usuario)
        {
            try
            {
                _usuarioRepository.delete(usuario);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }

        public IHttpActionResult Put(UsuarioDto usuario)
        {
            try
            {
                _usuarioRepository.put(usuario);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Post(UsuarioDto usuario)
        {
            try
            {
                _usuarioRepository.post(usuario);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}