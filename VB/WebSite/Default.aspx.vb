Imports Microsoft.VisualBasic
#Region "Using"
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxPopupControl
Imports AjaxControlToolkit
#End Region
Partial Public Class Grid_Editing_AjaxCalendarExtenderlInEditForm_AjaxCalendarExtenderlInEditForm
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		e.Cancel = True ' Data modifications are not allowed in the online demo
	End Sub
End Class
