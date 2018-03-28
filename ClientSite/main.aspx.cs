using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{    protected void Page_Load(object sender, EventArgs e)
    {
        PanelWarning.Visible = false;
        //System.Threading.Thread.Sleep(5000);
        if (!Page.IsPostBack)
        {
           
            getResults();
         
        }
    }

    private void getResults()
    {
        try

        {
            String URL = "http://localhost:55923/CDRestService.svc/GetData";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.KeepAlive = false;
            WebResponse response = request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string json = reader.ReadToEnd();

            DataTable table = JsonConvert.DeserializeObject<DataTable>(json);
            //Console.WriteLine(json);
            RepeaterAlbums.DataSource = table;
            RepeaterAlbums.DataBind();
        }
        catch (Exception)
        {

        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        String searchName = TextBox1.Text;
        try

        {
            String URL = "http://localhost:55923/CDRestService.svc/GetSearchResults/"+searchName;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.KeepAlive = false;
            WebResponse response = request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string json = reader.ReadToEnd();


            DataTable table = JsonConvert.DeserializeObject<DataTable>(json);
            //Console.WriteLine(json);
            RepeaterAlbums.DataSource = table;
            RepeaterAlbums.DataBind();

            System.Diagnostics.Debug.WriteLine(json);
            if (table != null)
            {
                if (table.Rows.Count <= 0)
                {
                      System.Diagnostics.Debug.WriteLine("empty");
                    PanelWarning.Visible = true;

                }
            

            }



        }
        catch (Exception)
        {

        }

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        getResults();
        TextBox1.Text = string.Empty;
    }
}