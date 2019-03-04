Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports IBM.Data.DB2.iSeries
Imports System.Web.Configuration

Partial Class AgencyPortal_agency_tools
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    'Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
    '    Dim agentnum As Label = CType(FormView1.FindControl("lblAgentNum"), Label)
    '    Session("UserNameIs") = agentnum.Text
    'End Sub
End Class
