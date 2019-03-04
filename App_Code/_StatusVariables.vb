Option Explicit On
Option Strict On
Option Infer On
Imports System
Imports System.Web
Imports System.Web.Services
Imports System.IO
Imports System.Collections
Imports System.Collections.Generic
'Imports System.Linq
'Imports System.Data.Linq
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Configuration
'Imports System.Data.Linq.Mapping
Imports Microsoft.VisualBasic

Public Class _StatusVariables

    Private _category_id As Integer
    Private _category_name As String


    'Read-only property
    '<Column(IsPrimaryKey:=True, IsDbGenerated:=True)> _
    Public Property category_id As Integer
        Get
            Return _category_id
        End Get
        Set(ByVal value As Integer)
            _category_id = value
        End Set
    End Property

    '<Column()>
    Public Property category_name As String
        Get
            Return _category_name
        End Get
        Set(ByVal value As String)
            _category_name = value
        End Set
    End Property

End Class
