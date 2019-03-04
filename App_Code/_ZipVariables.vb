Imports System
Imports System.Web
Imports System.Web.Services
Imports Microsoft.VisualBasic

Public Class _ZipVariables


    Private _codeId As Integer
    Private _zipCode As String
    Private _territory As String
    Private _county As String
    Private _state As String
    Private _territoryCode As String

    Public Property CodeId As Integer
        Get
            Return _codeId
        End Get
        Set(value As Integer)
            _codeId = value
        End Set
    End Property

    Public Property ZipCode As String
        Get
            Return _zipCode
        End Get
        Set(value As String)
            _zipCode = value
        End Set
    End Property

    Public Property Territory As String
        Get
            Return _territory
        End Get
        Set(value As String)
            _territory = value
        End Set
    End Property

    Public Property County As String
        Get
            Return _county
        End Get
        Set(value As String)
            _county = value
        End Set
    End Property

    Public Property State As String
        Get
            Return _state
        End Get
        Set(value As String)
            _state = value
        End Set
    End Property

    Public Property TerritoryCode As String
        Get
            Return _territoryCode
        End Get
        Set(value As String)
            _territoryCode = value
        End Set
    End Property


End Class
