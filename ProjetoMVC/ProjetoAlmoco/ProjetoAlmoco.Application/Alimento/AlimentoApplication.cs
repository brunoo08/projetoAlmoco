using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ProjetoAlmoco.Application.Alimento.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoAlmoco.Application.Alimento
{
    public class AlimentoApplication
    {
        static HttpClient client = new HttpClient();

        public HttpResponseMessage GetAllAlimento()
        {
            string URL = "http://localhost:58473/api/alimento/getall";
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(URL).Result;

            return response;
        }

        public HttpResponseMessage GetDispAlimento()
        {
            string URL = "http://localhost:58473/api/alimento/getDisp";
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(URL).Result;

            return response;
        }

        public HttpResponseMessage GetAlimento(int Num_Id)
        {
            string URL = "http://localhost:58473/api/alimento" + "?Num_Id=" + Num_Id.ToString();
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(URL).Result;

            return response;
        }

        public HttpResponseMessage GetDispAlimento()
        {
            string URL = "http://localhost:58473/api/alimento/getDisp";
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(URL).Result;

            return response;
        }

        public HttpResponseMessage Put(AlimentoModel alimentoModel)
        {
            string URL = "http://localhost:58473/api/alimento/Put";
            //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = client.PutAsync(URL, alimentoModel, new JsonMediaTypeFormatter
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

        public HttpResponseMessage Post(AlimentoModel alimentoModel)
        {
            string URL = "http://localhost:58473/api/alimento/Post";
            //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = client.PostAsync(URL, alimentoModel, new JsonMediaTypeFormatter
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
            string URL = "http://localhost:58473/api/alimento/Delete" + "?Num_Id=" + Num_Id.ToString();
            //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.DeleteAsync(URL).Result;


            return response;
        }
    }
}
