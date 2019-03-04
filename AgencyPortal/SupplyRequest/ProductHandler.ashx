<%@ WebHandler Language="VB" Class="ProductHandler" %>
Imports System.Data
Imports System.Web
Imports System.Web.Configuration
Imports System.Web.UI
Imports System.Web.UI.WebControls

''' <summary>
''' Displays an image corresponding to the Id passed
''' in a query string field
''' </summary>

Public Class ProductHandler
    Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        ' Get the Id of the image to display
        Dim productId As String = context.Request.QueryString("PRODUCT_ID")
 
        ' Use SqlDataSource to grab image bytes, image size 126x153, dropshadow 30
        Dim src As SqlDataSource = New SqlDataSource()
        src.ConnectionString = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        src.SelectCommand = "SELECT IMAGE FROM AgentSupplyList WHERE PRODUCT_ID=" + productId
 
        ' Return a DataView
        Dim view As DataView = CType(src.Select(DataSourceSelectArguments.Empty), DataView)
        context.Response.BinaryWrite(CType(view(0)("IMAGE"), Byte()))
 
        ' Return a DataReader
        'src.DataSourceMode = SqlDataSourceMode.DataReader
        'Dim reader As IDataReader = CType(src.Select(DataSourceSelectArguments.Empty), IDataReader)
        'reader.Read()
        'context.Response.BinaryWrite(CType(reader("Image"), Byte()))
        'reader.Close()
 
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
 
End Class