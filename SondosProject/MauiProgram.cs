using Microsoft.Extensions.Logging;
using CommunityToolkit;
using CommunityToolkit.Maui;
using CommunityToolkit.Maui.Core;
using SondosProject.Tables;

namespace SondosProject
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            new core().Database.EnsureCreated();

            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkitCore()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
