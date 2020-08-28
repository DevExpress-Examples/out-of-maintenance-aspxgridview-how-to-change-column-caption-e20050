<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>ASPxGridView: Enable Users to Change Column Caption</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
			KeyFieldName="EmployeeID" ClientInstanceName="grid" OnCustomCallback="grid_CustomCallback">
			<Columns>
				<dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1" Caption="Last Name">
					<HeaderTemplate>
						<div onmousedown="return ASPxClientUtils.PreventEventAndBubble(event);" style="text-align: center">
							<dx:ASPxButton ID="showPopupBtn" runat="server" AutoPostBack="false" ClientInstanceName="showPopupBtn"
								OnInit="ASPxButton1_Init" Text="change caption" TabIndex="0">
							</dx:ASPxButton>
							<br />
							<dx:ASPxLabel ID="captionLbl" runat="server" ClientInstanceName="captionLbl" OnInit="ASPxLabel1_Init"
								Text="ASPxLabel">
							</dx:ASPxLabel>
						</div>
					</HeaderTemplate>
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
			</Columns>
		</dx:ASPxGridView>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Northwind.mdb"
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [Country] FROM [Employees]">
		</asp:AccessDataSource>
		<dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" CloseAction="CloseButton"
			HeaderText="Change Column Caption">
			<ContentCollection>
				<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxTextBox ID="captionTxtbx" runat="server" ClientInstanceName="captionTxtbx">
						<ClientSideEvents KeyDown="function(s, e) {if (event.keyCode == 13) return ASPxClientUtils.PreventEventAndBubble(event);}" />
					</dx:ASPxTextBox>
					<dx:ASPxButton ID="applyBtn" runat="server" Text="Apply" AutoPostBack="False" ClientInstanceName="applyBtn">
						<ClientSideEvents Click="function(s, e) {grid.PerformCallback(captionTxtbx.GetText());popup.Hide();}" />
					</dx:ASPxButton>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>
	</div>
	</form>
</body>
</html>