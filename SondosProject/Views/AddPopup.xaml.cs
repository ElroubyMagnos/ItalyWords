using CommunityToolkit.Maui.Views;

namespace SondosProject.Views;

public partial class AddPopup : Popup
{
	public static bool Added = false;
	public AddPopup()
	{
		InitializeComponent();
	}

    private void Button_Clicked(object sender, EventArgs e)
    {
		Added = true;
		Close();
    }
}