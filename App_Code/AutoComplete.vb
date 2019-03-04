Imports System
Imports System.IO
Imports System.Linq
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Threading
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports IBM.Data.DB2.iSeries
Imports System.Web.Configuration
Imports AjaxControlToolkit
Imports System.Web
Imports System.Web.Profile
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class AutoComplete
    Inherits System.Web.Services.WebService
    'Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("ODBCconPOINT").ConnectionString
    Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("iSeries").ConnectionString
    Dim con As iDB2Connection = New iDB2Connection(MyConnection)
    Dim ds As New DataSet
    Dim dt As New DataTable

    <WebMethod()> _
    Public Function GetData(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()

        Dim cmd As iDB2Command = New iDB2Command()
        cmd.Connection = con
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT PMS.ADD0LINE01, ASB.BUEITX, PMS.CUST0NO, PMS.ADD0LINE01 || ' ' || ASB.BUEITX As AutoCompleteColumn, MAX(PMS.MODULE) As Highest FROM SOMRC0DAT.PMSL0217 As PMS LEFT OUTER JOIN SOMRC0DAT.ASBUCPL1 As ASB ON ASB.BUASTX = PMS.POLICY0NUM AND ASB.BUADNB = PMS.MODULE AND ASB.BUARTX = PMS.SYMBOL WHERE PMS.SYMBOL  NOT IN ('SMQ','BAQ','WCQ','UMQ','STQ','BA','WC','UM') AND PMS.TYPE0ACT <> 'CN' AND (PMS.AGENCY = ?) AND (PMS.ADD0LINE01 LIKE UPPER(?)) GROUP BY PMS.ADD0LINE01, ASB.BUEITX, PMS.CUST0NO"
        'cmd.Parameters.AddWithValue("@agent", ProfileComponent.GetAgentCode())
        cmd.Parameters.AddWithValue("@agent", contextKey)
        cmd.Parameters.AddWithValue("@church", prefixText + "%")

        Try
            con.Open()
            cmd.ExecuteNonQuery()
            Dim da As New iDB2DataAdapter(cmd)
            da.Fill(ds)
        Catch ex As Exception
        Finally
            con.Close()
        End Try

        dt = ds.Tables(0)

        Dim policies As New List(Of String)
        'Dim dbValues As String

        For Each row As DataRow In dt.Rows
            'dbValues = row("AutoCompleteColumn").ToString()
            'dbValues = dbValues.ToUpper()
            'policies.Add(dbValues)
            policies.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(row("AutoCompleteColumn").ToString.Trim(), row("CUST0NO").ToString()))
        Next
        Return policies.ToArray()
    End Function


    Private Function GetAgentNumber(query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        Dim cmd As New iDB2Command(query)
        Using con As New iDB2Connection(conString)
            Using sda As New iDB2DataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Return dt
                End Using
            End Using
        End Using
    End Function

End Class