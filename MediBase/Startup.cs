using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MediBase.Startup))]
namespace MediBase
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
