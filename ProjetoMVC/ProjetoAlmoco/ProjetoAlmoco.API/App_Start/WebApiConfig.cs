﻿using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using System.Web.Http.Dependencies;

namespace ProjetoAlmoco.Api
{
    public static class WebApiConfig
    {
        public static void Register(this HttpConfiguration config, IDependencyResolver dependencyResolver)
        {
            config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute("Ping", "", new { controller = "Ping", action = "Get" });
            config.Routes.MapHttpRoute("DefaultApi", "API/{controller}/{action}", new { controller = "Ping", action = RouteParameter.Optional });

            config.Formatters.Clear();
            config.Formatters.Add(new JsonMediaTypeFormatter
            {
                SerializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Ignore,
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    ContractResolver = new DefaultContractResolver
                    {
                        IgnoreSerializableAttribute = true
                    }
                }
            });

            config.DependencyResolver = dependencyResolver;
        }
    }
}