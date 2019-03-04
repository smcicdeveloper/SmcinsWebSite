<%@ WebHandler Language="VB" Class="BulletinHandler" %>

Imports System
Imports System.Web
Imports System.Data
Imports System.Data.SqlClient

Public Class BulletinHandler : Implements IHttpHandler
    
    'Const conString As String = "Data Source=SMCSQL02;Initial Catalog=SMCI Test Database;Integrated Security=True"
    'Const conString As String = "Data Source=AREHEART;Initial Catalog=SMCI Test Database;Integrated Security=True"
    'Const conString As String = "Data Source=172.16.1.223;Database=SMCI_Test_Database;user id=WEBUSR;password=smcw3bu$r;"
    Const conString As String = "Data Source=172.16.1.223;Database=SMCINS_Web_Prod;user id=WEBUSR;password=smcw3bu$r;"
    
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        'context.Response.ContentType = "application/msword"
        'context.Response.ContentType = "text/plain"
        context.Response.ContentType = "application/pdf"
        
        
        Dim con As SqlConnection = New SqlConnection(conString)
        Dim cmd As SqlCommand = New SqlCommand("SELECT FileBytes, CreatedDate FROM BulletinForms WHERE Id=@Id ORDER BY CreatedDate DESC", con)
        cmd.Parameters.AddWithValue("@Id", context.Request("Id"))
        Using con
            con.Open()
            Dim file() As Byte = CType(cmd.ExecuteScalar(), Byte())
            context.Response.BinaryWrite(file)
        End Using
        'context.Response.Write("Hello World")
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class