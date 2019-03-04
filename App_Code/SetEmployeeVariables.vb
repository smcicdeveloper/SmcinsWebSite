Imports System
Imports System.Collections.Generic
Imports smci.DataAccessLayer

Namespace smci.employees

    Public Class SetEmployeeVariables

        Private _empNum As String = String.Empty
        Private _firstName As String = String.Empty
        Private _lastName As String = String.Empty
        Private _fullname As String = String.Empty
        Private _address As String = String.Empty
        Private _city As String = String.Empty
        Private _state As String = String.Empty
        Private _zip As String = String.Empty
        Private _email As String = String.Empty
        Private _departid As Integer
        Private _datecreated As Date


        Public Property Employeenumber() As String
            Get
                Return _empNum
            End Get
            Set(ByVal value As String)
                _empNum = value
            End Set
        End Property

        Public Property Firstname() As String
            Get
                Return _firstName
            End Get
            Set(ByVal value As String)
                _firstName = value
            End Set
        End Property

        Public Property Lastname() As String
            Get
                Return _lastName
            End Get
            Set(ByVal value As String)
                _lastName = value
            End Set
        End Property

        Public Property Fullname() As String
            Get
                Return _fullname
            End Get
            Set(ByVal value As String)
                _fullname = value
            End Set
        End Property

        Public Property Address() As String
            Get
                Return _address
            End Get
            Set(ByVal value As String)
                _address = value
            End Set
        End Property

        Public Property City() As String
            Get
                Return _city
            End Get
            Set(ByVal value As String)
                _city = value
            End Set
        End Property

        Public Property State() As String
            Get
                Return _state
            End Get
            Set(ByVal value As String)
                _state = value
            End Set
        End Property

        Public Property Zip() As String
            Get
                Return _zip
            End Get
            Set(ByVal value As String)
                _zip = value
            End Set
        End Property

        Public Property Email() As String
            Get
                Return _email
            End Get
            Set(ByVal value As String)
                _email = value
            End Set
        End Property

        Public Property Departid() As Integer
            Get
                Return _departid
            End Get
            Set(ByVal value As Integer)
                _departid = value
            End Set
        End Property

        Public Property Datemade() As Date
            Get
                Return _datecreated
            End Get
            Set(ByVal value As Date)
                _datecreated = value
            End Set
        End Property

    End Class

End Namespace