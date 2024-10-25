using SondosProject.Models;
using SondosProject.Tables;

namespace SondosProject
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private async void RefreshData(object sender, TextChangedEventArgs e)
        {
            var entry = (Entry)sender;
            var updatedWord = entry.BindingContext as OneWord;

            if (updatedWord != null)
            {
                var core = new core();
                core.Words.Update(updatedWord);

                await core.SaveChangesAsync();
            }
        }
    }
}
