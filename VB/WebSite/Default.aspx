<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Editing_AjaxCalendarExtenderlInEditForm_AjaxCalendarExtenderlInEditForm" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="AjaxControlToolkit"  Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>    

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Use AJAX Extenders in the EditForm template</title>
</head>
<body>
	<form id="form1" runat="server">

	<asp:ScriptManager ID="ScriptManager" runat="server">  </asp:ScriptManager>
	<ajaxToolkit:CalendarExtender runat="server" ID="dummyExtender" TargetControlID="dummyTextBox"></ajaxToolkit:CalendarExtender>
	<asp:TextBox ID="dummyTextBox" runat="server" Visible="false"></asp:TextBox>
	<asp:UpdatePanel ID="UpdatePanel" runat="server">
	<ContentTemplate>
	<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" EnableCallBacks="false" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" OnRowUpdating="grid_RowUpdating" Width="50%">
		<%-- BeginRegion Columns --%>
		<Columns>
			<dxwgv:GridViewCommandColumn VisibleIndex="0">
				<EditButton Visible="True" />
				<NewButton Visible="True" />
			</dxwgv:GridViewCommandColumn>
			<dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
				<EditFormSettings VisibleIndex="0" />
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
				<EditFormSettings VisibleIndex="1" />
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="4">
				<EditFormSettings VisibleIndex="2" ColumnSpan="2" />
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataMemoColumn FieldName="Notes" Visible="False">
			</dxwgv:GridViewDataMemoColumn>
			<dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
				<EditFormSettings Visible="false" />
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
				<EditFormSettings VisibleIndex="4" />
			</dxwgv:GridViewDataColumn>
		</Columns>
		<%-- EndRegion --%>
		<SettingsPager Mode="ShowAllRecords"/>
		<Templates>
			<EditForm>
			<div style="padding:4px 4px 3px 4px">
			<dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
				Birth Date (asp:TextBox + ajaxToolkit:CalendarExtender): <asp:TextBox ID="extBirthDate" runat="server" Text='<%#Bind("BirthDate")%>' />
			</div>
			<ajaxToolkit:CalendarExtender runat="server" ID="calendarExtender" TargetControlID="extBirthDate"></ajaxToolkit:CalendarExtender>
			<div style="text-align:right; padding:2px 2px 2px 2px">
				<dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
				<dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
			</div>
			</EditForm>
		</Templates>
	</dxwgv:ASPxGridView>
	</ContentTemplate>
	</asp:UpdatePanel>
	<%-- BeginRegion DataSource --%>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]" 
		DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" 
		InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Notes]) VALUES (?, ?, ?, ?, ?, ?)" 
		UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [Title] = ?, [BirthDate] = ?, [HireDate] = ?, [Notes] = ? WHERE [EmployeeID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="EmployeeID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="LastName" Type="String" />
			<asp:Parameter Name="FirstName" Type="String" />
			<asp:Parameter Name="Title" Type="String" />
			<asp:Parameter Name="BirthDate" Type="DateTime" />
			<asp:Parameter Name="HireDate" Type="DateTime" />
			<asp:Parameter Name="Notes" Type="String" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="LastName" Type="String" />
			<asp:Parameter Name="FirstName" Type="String" />
			<asp:Parameter Name="Title" Type="String" />
			<asp:Parameter Name="BirthDate" Type="DateTime" />
			<asp:Parameter Name="HireDate" Type="DateTime" />
			<asp:Parameter Name="Notes" Type="String" />
		</InsertParameters>
	</asp:AccessDataSource>
	<%-- EndRegion --%>
	<p>Note: data modifications are not allowed in the online demo</p>
	</form>
</body>
</html>
