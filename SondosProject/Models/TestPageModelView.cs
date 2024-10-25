using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using SondosProject.Connectors;
using SondosProject.Tables;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SondosProject.Models
{
    public partial class TestPageModelView : ObservableObject
    {
        private async void Produce()
        {
            ShowedWords = null;
            var r1 = new Random().Next(0, 9);

            if (r1 % 2 == 0)
            {
                ArabicIsShow = true;
                ItalianIsshow = !ArabicIsShow;
            }
            else
            {
                ArabicIsShow = false;
                ItalianIsshow = !ArabicIsShow;
            }

            for (int i = 0; i < ListOf.Count(); i++)
            {
                if (ListOf[i].Degree == 0)
                {
                    ShowedWords = ListOf[i];
                    break;
                }
            }

            if (ShowedWords == null)
            {
                ShowBack = true;
                ShowSubmit = false;
                await Shell.Current.DisplayAlert("Congratz", $"You got {DegreeCount}/{TotalDegreeCount}", "Great");
                ShowResult();
            }
        }

        [ObservableProperty]
        private bool showBack = false;
        [ObservableProperty]
        private bool showSubmit = true;
        [RelayCommand()]
        private async void Back()
        {
            await Shell.Current.Navigation.PopAsync();
        }
        [RelayCommand()]
        private async void ShowResult()
        {
            WordsResult.Clear();

            foreach (var item in ListOf)
            {
                if (item.Degree == -1)
                {
                    WordsResult.Add(new OneWord()
                    {
                        Arabic = item.Arabic,
                        Italic = item.Italic,
                    });
                }
            }

            ArabicIsShow = ItalianIsshow = false;
        }
        [ObservableProperty]
        private string arabicAnswer;

        [ObservableProperty]
        private string italicAnswer;

        [RelayCommand()]
        private async void Submit()
        {
            if (ArabicIsShow)
            {
                if (ItalicAnswer == null)
                {
                    await Shell.Current.DisplayAlert("Hey!", "Please Enter the Answer", "Okay!");
                    return; 
                }

                var GotMarks = false;
                for (int i = 0; i < ListOf.Count(); i++)
                {
                    if (ListOf[i].Italic.ToLower() == ItalicAnswer.ToLower())
                    {
                        DegreeCount++;
                        GotMarks = true;
                        break;
                    }
                }

                for (int i = 0; i < ListOf.Count(); i++)
                {
                    if (ListOf[i].Arabic == ShowedWords.Arabic)
                    {
                        ListOf[i].Degree = GotMarks ? 1 : -1;
                    }
                }
            }
            else
            {
                if (ArabicAnswer == null)
                {
                    await Shell.Current.DisplayAlert("Hey!", "Please Enter the Answer", "Okay!");
                    return;
                }

                var GotMarks = false;
                for (int i = 0; i < ListOf.Count(); i++)
                {
                    if (ListOf[i].Arabic.ToLower() == ArabicAnswer.ToLower())
                    {
                        DegreeCount++;
                        GotMarks = true;
                        break;
                    }
                }

                for (int i = 0; i < ListOf.Count(); i++)
                {
                    if (ListOf[i].Italic == ShowedWords.Italic)
                    {
                        ListOf[i].Degree = GotMarks ? 1 : -1;
                    }
                }
            }

            ItalicAnswer = ArabicAnswer = "";
            Produce();
        }
        public TestPageModelView()
        {
            var core = new core();

            foreach (var word in core.Words)
            {
                ListOf.Add(new TwoWordsWithDegree()
                {
                    Arabic = word.Arabic,
                    Italic = word.Italic,
                    Degree = 0
                });
            }

            TotalDegreeCount = ListOf.Count();

            Produce();
        }

        [ObservableProperty]
        public int totalDegreeCount = 0;

        [ObservableProperty]
        private int degreeCount = 0;

        [ObservableProperty]
        public bool arabicIsShow = false;

        [ObservableProperty]
        public bool italianIsshow = true;

        [ObservableProperty]
        public TwoWordsWithDegree showedWords = new TwoWordsWithDegree();

        [ObservableProperty]
        public ObservableCollection<TwoWordsWithDegree> listOf = new ObservableCollection<TwoWordsWithDegree>();

        [ObservableProperty]
        private ObservableCollection<OneWord> wordsResult = new ObservableCollection<OneWord>();       
    }
}
