Imports System
Imports System.Web
Imports System.Web.Services
Imports Microsoft.VisualBasic

Public Class _Commission

    Private _policynumber As String
    Private _insuredname As String
    Private _effdt As String
    Private _paidpremium As String
    Private _comrate As String
    Private _paidcommission As String
    Private _originalprem As String
    Private _d2b7st As String
    Private _daterange As String

    Public Property POLICYNUMBER As String
        Get
            Return _policynumber
        End Get
        Set(ByVal value As String)
            _policynumber = value
        End Set
    End Property

    Public Property INSUREDNAME As String
        Get
            Return _insuredname
        End Get
        Set(ByVal value As String)
            _insuredname = value
        End Set
    End Property

    Public Property EFFDT As String
        Get
            Return _effdt
        End Get
        Set(ByVal value As String)
            _effdt = value
        End Set
    End Property

    Public Property PAIDPREMIUM As String
        Get
            Return _paidpremium
        End Get
        Set(ByVal value As String)
            _paidpremium = value
        End Set
    End Property

    Public Property COMRATE As String
        Get
            Return _comrate
        End Get
        Set(ByVal value As String)
            _comrate = value
        End Set
    End Property

    Public Property PAIDCOMMISSION As String
        Get
            Return _paidcommission
        End Get
        Set(ByVal value As String)
            _paidcommission = value
        End Set
    End Property

    Public Property ORIGINALPREM As String
        Get
            Return _originalprem
        End Get
        Set(ByVal value As String)
            _originalprem = value
        End Set
    End Property

    Public Property D2B7ST As String
        Get
            Return _d2b7st
        End Get
        Set(ByVal value As String)
            _d2b7st = value
        End Set
    End Property

    Public Property DATERANGE As String
        Get
            Return _daterange
        End Get
        Set(ByVal value As String)
            _daterange = value
        End Set
    End Property

End Class
