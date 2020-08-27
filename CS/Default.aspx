<%-- BeginRegion Tags and page properties --%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Editing_AjaxCalendarExtenderlInEditForm_AjaxCalendarExtenderlInEditForm" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web"
	TagPrefix="dx" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
	Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Use AJAX Extenders in the EditForm template</title>
</head>
<body>
	<form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager" runat="server">
		</asp:ScriptManager>
		<ajaxToolkit:CalendarExtender runat="server" ID="dummyExtender" TargetControlID="dummyTextBox">
		</ajaxToolkit:CalendarExtender>
		<asp:TextBox ID="dummyTextBox" runat="server" Visible="false"></asp:TextBox>
		<asp:UpdatePanel ID="UpdatePanel" runat="server">
			<ContentTemplate>
				<dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" EnableCallBacks="false" 
					DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False"
					OnRowUpdating="grid_RowUpdating" Width="50%"
					OnRowInserting="grid_RowInserting" OnRowValidating="grid_RowValidating" OnParseValue="grid_ParseValue">
					<%-- BeginRegion Columns --%>
					<Columns>
						<dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="true" ShowNewButton="true">
						</dx:GridViewCommandColumn>
						<dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
							<EditFormSettings VisibleIndex="0" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
							<EditFormSettings VisibleIndex="1" />
						</dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="Title" VisibleIndex="4">
							<EditFormSettings VisibleIndex="2" ColumnSpan="2" />
						</dx:GridViewDataColumn>
						<dx:GridViewDataMemoColumn FieldName="Notes" Visible="False">
						</dx:GridViewDataMemoColumn>
						<dx:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
							<EditFormSettings Visible="false" />
						</dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
							<EditFormSettings VisibleIndex="4" />
						</dx:GridViewDataColumn>
					</Columns>
					<%-- EndRegion --%>
					<SettingsPager Mode="ShowAllRecords" />
					<Templates>
						<EditForm>
							<div style="padding: 4px 4px 3px 4px">
								<dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
									runat="server"></dx:ASPxGridViewTemplateReplacement>
								Birth Date (asp:TextBox + ajaxToolkit:CalendarExtender):
                            <asp:TextBox ID="extBirthDate" runat="server" Text='<%# Bind("BirthDate") %>' />
							</div>
							<ajaxToolkit:CalendarExtender runat="server" ID="calendarExtender" TargetControlID="extBirthDate">
							</ajaxToolkit:CalendarExtender>
							<div style="text-align: right; padding: 2px 2px 2px 2px">
								<dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
									runat="server"></dx:ASPxGridViewTemplateReplacement>
								<dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
									runat="server"></dx:ASPxGridViewTemplateReplacement>
							</div>
						</EditForm>
					</Templates>
				</dx:ASPxGridView>
			</ContentTemplate>
		</asp:UpdatePanel>
		<%-- BeginRegion DataSource --%>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]"
			DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Notes]) VALUES (?, ?, ?, ?, ?, ?)"
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
		<p>
			Note: data modifications are not allowed in the online demo
		</p>
	</form>
</body>
</html>
