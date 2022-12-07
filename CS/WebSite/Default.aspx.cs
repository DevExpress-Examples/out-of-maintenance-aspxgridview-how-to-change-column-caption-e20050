using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    string caption
    {
        get
        {
            if (Session["caption"] == null) Session["caption"] = "";
            return (string)Session["caption"];
        }
        set { Session["caption"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            Session.Clear();
        if (Session["caption"] == null) Session["caption"] = "Last Name";
        grid.Columns[0].Caption = (string)Session["caption"];
    }
    protected void ASPxButton1_Init(object sender, EventArgs e)
    {
        ASPxButton btn = (ASPxButton)sender;
        GridViewHeaderTemplateContainer container = (GridViewHeaderTemplateContainer)btn.NamingContainer;
        string Caption = container.Column.Caption;
        btn.ClientSideEvents.Click = string.Format("function(s,e){{captionTxtbx.SetText('{0}');popup.Show();}}", Caption);
    }
    protected void ASPxLabel1_Init(object sender, EventArgs e)
    {
        ASPxLabel lbl = (ASPxLabel)sender;
        GridViewHeaderTemplateContainer container = (GridViewHeaderTemplateContainer)lbl.NamingContainer;
        lbl.Text = container.Column.Caption;
    }
    protected void grid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        grid.Columns[0].Caption = e.Parameters;
        Session["caption"] = e.Parameters;
    }

}