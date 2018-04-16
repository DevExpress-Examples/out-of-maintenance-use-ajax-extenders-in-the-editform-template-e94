#region Using
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxTabControl;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxPopupControl;
using AjaxControlToolkit;
#endregion
public partial class Grid_Editing_AjaxCalendarExtenderlInEditForm_AjaxCalendarExtenderlInEditForm : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
		e.Cancel = true; // Data modifications are not allowed in the online demo
    }
}
