Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports IBM.Data.DB2.iSeries
Imports System.Web.Configuration
Imports Microsoft.VisualBasic

Public Class LossDetailDB


    Private Shared ReadOnly _connectionString As String = String.Empty
    Private Shared ReadOnly _con As String = String.Empty

    Shared Sub New()
        _connectionString = WebConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        _con = WebConfigurationManager.ConnectionStrings("AllPortal").ConnectionString
        If String.IsNullOrEmpty(_connectionString) Then
            Throw New Exception("No connection String configured in Web.Config file")
        End If
    End Sub



End Class
