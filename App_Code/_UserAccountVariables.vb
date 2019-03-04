Imports Microsoft.VisualBasic

Public Class _UserAccountVariables

    Private _username As String
    Private _masterid As String
    Private _subagentid As String
    Private _email As String
    Private _fullname As String
    Private _agency As String
    Private _phone As String
    Private _title As String
    Private _city As String
    Private _state As String
    Private _role As String
    Private _date As Date

    Public Property Username() As String
        Get
            Return _username
        End Get
        Set(value As String)
            _username = value
        End Set
    End Property

    Public Property MasterId() As String
        Get
            Return _masterid
        End Get
        Set(value As String)
            _masterid = value
        End Set
    End Property

    Public Property SubAgentId() As String
        Get
            Return _subagentid
        End Get
        Set(value As String)
            _subagentid = value
        End Set
    End Property

    Public Property Email() As String
        Get
            Return _email
        End Get
        Set(value As String)
            _email = value
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

    Public Property Agency() As String
        Get
            Return _agency
        End Get
        Set(value As String)
            _agency = value
        End Set
    End Property

    Public Property Telephone() As String
        Get
            Return _phone
        End Get
        Set(value As String)
            _phone = value
        End Set
    End Property

    Public Property Title() As String
        Get
            Return _title
        End Get
        Set(value As String)
            _title = value
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

    Public Property Role() As String
        Get
            Return _role
        End Get
        Set(value As String)
            _role = value
        End Set
    End Property

    Public Property DateCreated() As Date
        Get
            Return _date
        End Get
        Set(value As Date)
            _date = value
        End Set
    End Property

End Class
