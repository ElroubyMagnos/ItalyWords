using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using SondosProject.Tables;
using SondosProject.Views;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace SondosProject.Models
{
    public partial class MainViewModel : ObservableObject
    {
        public MainViewModel()
        {
            AllWords = new ObservableCollection<OneWord>();
            var core = new core();

            foreach (var word in core.Words)
            {
                AllWords.Add(word);
            }
        }

        public ObservableCollection<OneWord> AllWords { get; set; }

        [RelayCommand()]
        private async void Add()
        {
            var core = new core();

            await core.Words.AddAsync(new OneWord()
            {
                Arabic = "",
                Italic = ""
            });
            await core.SaveChangesAsync();

            AllWords.Add(core.Words.OrderBy(x => x.ID).Last());
        }

        [RelayCommand()]
        private async void DeleteOne(int ID)
        {
            var Removed = AllWords.FirstOrDefault(x => x.ID == ID);
            AllWords.Remove(Removed);

            var core = new core();
            core.Words.Remove(Removed);

            await core.SaveChangesAsync();
        }

        [RelayCommand()]
        private async void StartTest()
        {
            await Shell.Current.Navigation.PushAsync(new TestPage());
        }
    }
}
