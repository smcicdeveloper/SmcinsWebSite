Imports System
Imports System.Web
Imports System.Web.Services

Imports Microsoft.VisualBasic

Public Class StateList
    Private _stateId As String = String.Empty
    Private _state As String = String.Empty

    Public Property Stateid As String
        Get
            Return _stateId
        End Get
        Set(ByVal value As String)
            _stateId = value
        End Set
    End Property

    Public Property State As String
        Get
            Return _state
        End Get
        Set(ByVal value As String)
            _state = value
        End Set
    End Property
End Class

Public Class CountyList
    Private _stateId As String = String.Empty
    Private _county As String

    Public Property Stateid() As String
        Get
            Return _stateId
        End Get
        Set(ByVal value As String)
            _stateId = value
        End Set
    End Property

    Public Property County() As String
        Get
            Return _county
        End Get
        Set(ByVal value As String)
            _county = value
        End Set
    End Property
End Class


