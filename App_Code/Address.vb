Imports Microsoft.VisualBasic

Public Class Address

    Private _title As String
    Private _fullname As String
    Private _agent As String
    Private _street As String
    Private _city As String
    Private _state As String
    Private _postalcode As String

    Public Property Title() As String
        Get
            Return _title
        End Get
        Set(value As String)
            _title = value
        End Set
    End Property

    Public Property FullName() As String
        Get
            Return _fullname
        End Get
        Set(value As String)
            _fullname = value
        End Set
    End Property

    Public Property Agent() As String
        Get
            Return _agent
        End Get
        Set(value As String)
            _agent = value
        End Set
    End Property

    Public Property Street() As String
        Get
            Return _street
        End Get
        Set(value As String)
            _street = value
        End Set
    End Property

    Public Property City() As String
        Get
            Return _city
        End Get
        Set(value As String)
            _city = value
        End Set
    End Property

    Public Property State() As String
        Get
            Return _state
        End Get
        Set(value As String)
            _state = value
        End Set
    End Property

    Public Property PostalCode() As String
        Get
            Return _postalcode
        End Get
        Set(value As String)
            _postalcode = value
        End Set
    End Property

End Class
