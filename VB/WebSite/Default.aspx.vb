Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private Property caption() As String
		Get
			If Session("caption") Is Nothing Then
				Session("caption") = ""
			End If
			Return CStr(Session("caption"))
		End Get
		Set(ByVal value As String)
			Session("caption") = value
		End Set
	End Property
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not Page.IsPostBack) Then
			Session.Clear()
		End If
		If Session("caption") Is Nothing Then
			Session("caption") = "Last Name"
		End If
		grid.Columns(0).Caption = CStr(Session("caption"))
	End Sub
	Protected Sub ASPxButton1_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim btn As ASPxButton = CType(sender, ASPxButton)
		Dim container As GridViewHeaderTemplateContainer = CType(btn.NamingContainer, GridViewHeaderTemplateContainer)
		Dim Caption As String = container.Column.Caption
		btn.ClientSideEvents.Click = String.Format("function(s,e){{captionTxtbx.SetText('{0}');popup.Show();}}", Caption)
	End Sub
	Protected Sub ASPxLabel1_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim lbl As ASPxLabel = CType(sender, ASPxLabel)
		Dim container As GridViewHeaderTemplateContainer = CType(lbl.NamingContainer, GridViewHeaderTemplateContainer)
		lbl.Text = container.Column.Caption
	End Sub
	Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
		grid.Columns(0).Caption = e.Parameters
		Session("caption") = e.Parameters
	End Sub

End Class