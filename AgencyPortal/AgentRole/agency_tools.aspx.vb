Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports IBM.Data.DB2.iSeries
Imports System.Web.Configuration
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Partial Class AgencyPortal_agency_tools
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ProcessedDate As DateTime
        Dim PolDate As String
        ProcessedDate = DateTime.Now.AddDays(-1)
        PolDate = ProcessedDate.ToString("MM/dd/yyyy")
        hypPolicies.NavigateUrl = "http://www.policies.smcins.com/Mediamgtc0smcrscriptmain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:Inbox,MMAgent:" & Session("UserNameIs") & ",MMDateProd:" & PolDate

    End Sub

End Class
