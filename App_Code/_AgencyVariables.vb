Imports System
Imports System.Web
Imports System.Web.Services
Imports Microsoft.VisualBasic

Public Class _AgencyVariables

    Private _agentnum As String
    Private _agencyname As String
    Private _fullname As String



    Public Property agency_number As String
        Get
            Return _agentnum
        End Get
        Set(value As String)
            _agentnum = value
        End Set
    End Property

    Public Property agency_name As String
        Get
            Return _agencyname
        End Get
        Set(value As String)
            _agencyname = value
        End Set
    End Property

    Public Property FullName As String
        Get
            Return _fullname
        End Get
        Set(value As String)
            _fullname = value
        End Set
    End Property

End Class
