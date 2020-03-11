using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ProjetoAlmoco.Application.Pedidos.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Application.Pedidos
{
    public class PedidosApplication
    {
        static HttpClient client = new HttpClient();

        public HttpResponseMessage GetAllPedidos()
        {
            string URL = "http://localhost:58473/api/pedidos/getAll";
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(URL).Result;

            return response;
        }

        public HttpResponseMessage GetPedidos(int Num_Id)
        {
            string URL = "http://localhost:58473/api/pedidos" + "?Num_Id=" + Num_Id.ToString();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(URL).Result;

            return response;
        }

        public HttpResponseMessage Put(MostraPedidosModel mostrapedidosModel)
        {
            string URL = "http://localhost:58473/api/pedidos/Put";
            //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = client.PutAsync(URL, mostrapedidosModel, new JsonMediaTypeFormatter
            {
                SerializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Include,
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    ContractResolver = new DefaultContractResolver
                    {
                        IgnoreSerializableAttribute = true
                    }
                }
            }).Result;


            return response;
        }

        public HttpResponseMessage Post(MostraPedidosModel pedidosModel)
        {
            string URL = "http://localhost:58473/api/pedidos/Post";
            //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = client.PostAsync(URL, pedidosModel, new JsonMediaTypeFormatter
            {
                SerializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Include,
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    ContractResolver = new DefaultContractResolver
                    {
                        IgnoreSerializableAttribute = true
                    }
                }
            }).Result;


            return response;
        }

        public HttpResponseMessage Delete(int Num_Id)
        {
            string URL = "http://localhost:58473/api/pedidos/Delete" + "?Num_Id=" + Num_Id.ToString();
            //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.DeleteAsync(URL).Result;


            return response;
        }
    }
}
