Imports System
Imports System.Web
Imports System.Web.Services
Imports Microsoft.VisualBasic

Public Class _CandleSafetyVariables

    Private _candleID As Integer
    Private _designateID As Integer
    Private _custNum As String
    Private _churchName As String
    Private _actualLocation As String
    Private _mailingContact As String
    Private _mailingAddress As String
    Private _mailingCity As String
    Private _mailingState As String
    Private _mailingZip As String
    Private _candleUse As String
    Private _fullName As String
    Private _entryDate As Date
    Private _entryRecipient As String
    Private _total As Integer
    Private _ipAddress As String
    Private _year As Integer


    Public Property candleid As Integer
        Get
            Return _candleID
        End Get
        Set(value As Integer)
            _candleID = value
        End Set
    End Property

    Public Property designateid As Integer
        Get
            Return _designateID
        End Get
        Set(value As Integer)
            _designateID = value
        End Set
    End Property

    Public Property custnum As String
        Get
            Return _custNum
        End Get
        Set(value As String)
            _custNum = value
        End Set
    End Property

    Public Property churchname As String
        Get
            Return _churchName
        End Get
        Set(value As String)
            _churchName = value
        End Set
    End Property

    Public Property actuallocation As String
        Get
            Return _actualLocation
        End Get
        Set(value As String)
            _actualLocation = value
        End Set
    End Property

    Public Property mailingcontact As String
        Get
            Return _mailingContact
        End Get
        Set(value As String)
            _mailingContact = value
        End Set
    End Property

    Public Property mailingaddress As String
        Get
            Return _mailingAddress
        End Get
        Set(value As String)
            _mailingAddress = value
        End Set
    End Property

    Public Property mailingcity As String
        Get
            Return _mailingCity
        End Get
        Set(value As String)
            _mailingCity = value
        End Set
    End Property

    Public Property mailingstate As String
        Get
            Return _mailingState
        End Get
        Set(value As String)
            _mailingState = value
        End Set
    End Property

    Public Property mailingzip As String
        Get
            Return _mailingZip
        End Get
        Set(value As String)
            _mailingZip = value
        End Set
    End Property

    Public Property candleuse As String
        Get
            Return _candleUse
        End Get
        Set(value As String)
            _candleUse = value
        End Set
    End Property

    Public Property fullname As String
        Get
            Return _fullName
        End Get
        Set(value As String)
            _fullName = value
        End Set
    End Property

    Public Property entrydate As Date
        Get
            Return _entryDate
        End Get
        Set(value As Date)
            _entryDate = value
        End Set
    End Property

    Public Property entryRecipient As String
        Get
            Return _entryRecipient
        End Get
        Set(value As String)
            _entryRecipient = value
        End Set
    End Property

    Public Property Total As Integer
        Get
            Return _total
        End Get
        Set(value As Integer)
            _total = value
        End Set
    End Property

    Public Property ipaddress As String
        Get
            Return _ipAddress
        End Get
        Set(value As String)
            _ipAddress = value
        End Set
    End Property

    Public Property Year As Integer
        Get
            Return _year
        End Get
        Set(value As Integer)
            _year = value
        End Set
    End Property

End Class
