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
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(5000);
        if (!Page.IsPostBack)
        {
            String URL = "http://localhost:55923/CDRestService.svc/";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(URL);
            request.KeepAlive = false;
            WebResponse response = request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string json = reader.ReadToEnd();

            DataTable table = JsonConvert.DeserializeObject<DataTable>(json);
            Console.WriteLine(json);
            RepeaterAlbums.DataSource = table;
            RepeaterAlbums.DataBind();
        }
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {

    }
}