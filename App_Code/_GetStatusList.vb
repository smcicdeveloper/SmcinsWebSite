Imports System
Imports System.Web
Imports System.Web.Services
Imports System.Web.Configuration
Imports System.Configuration
Imports System.ComponentModel
Imports System.IO
Imports System.Collections
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class _GetStatusList

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetList() As List(Of _StatusVariables)

        Dim Status As New List(Of _StatusVariables)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT category_id, category_name FROM StatusList"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeList As New _StatusVariables()
                SeeList.category_id = CType(reader("category_id"), String)
                SeeList.category_name = CType(reader("category_name"), String)
                Status.Add(SeeList)
            End While
        End Using
        Return Status
        'End Using
    End Function

End Class
