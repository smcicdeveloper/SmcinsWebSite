Imports System
Imports System.Web
Imports System.Web.Services
Imports System.IO
Imports System.Collections
Imports System.Collections.Generic
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Configuration
Imports Microsoft.VisualBasic

Public Class _ContactVariables

    Private _contact_id As Integer
    Private _cust_no As String
    Private _full_name As String
    Private _church_number As String = String.Empty
    Private _cell_phone As String = String.Empty
    Private _email As String = String.Empty
    Private _department As String
    Private _department_id As Integer
    Private _notes As String = String.Empty
    Private _last_update As Date

    Public Property contact_id As Integer
        Get
            Return _contact_id
        End Get
        Set(value As Integer)
            _contact_id = value
        End Set
    End Property

    Public Property cust_no As String
        Get
            Return _cust_no
        End Get
        Set(ByVal value As String)
            _cust_no = value
        End Set
    End Property

    Public Property full_name As String
        Get
            Return _full_name.ToUpper
        End Get
        Set(value As String)
            _full_name = value
        End Set
    End Property

    Public Property church_number As String
        Get
            Return _church_number
        End Get
        Set(value As String)
            _church_number = value
        End Set
    End Property

    Public Property cell_phone As String
        Get
            Return _cell_phone
        End Get
        Set(value As String)
            _cell_phone = value
        End Set
    End Property

    Public Property email As String
        Get
            Return _email
        End Get
        Set(value As String)
            _email = value
        End Set
    End Property

    Public Property department As String
        Get
            Return _department
        End Get
        Set(value As String)
            _department = value
        End Set
    End Property

    Public Property department_id As Integer
        Get
            Return _department_id
        End Get
        Set(value As Integer)
            _department_id = value
        End Set
    End Property

    Public Property notes As String
        Get
            Return _notes
        End Get
        Set(value As String)
            _notes = value
        End Set
    End Property

    Public Property last_update As Date
        Get
            Return _last_update
        End Get
        Set(value As Date)
            _last_update = value
        End Set
    End Property

End Class
