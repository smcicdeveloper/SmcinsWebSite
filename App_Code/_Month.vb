Imports Microsoft.VisualBasic

Public Class _Month

    Private _jan As Date
    Private _feb As Date
    Private _mar As Date
    Private _apr As Date
    Private _may As Date
    Private _jun As Date
    Private _jul As Date
    Private _aug As Date
    Private _sep As Date
    Private _oct As Date
    Private _nov As Date
    Private _dec As Date
    Private _quote_date As String
    Private _smp_quoted As String



    Public Property Jan As Date
        Get
            Return _jan
        End Get
        Set(value As Date)
            _jan = value
        End Set
    End Property

    Public Property Feb As Date
        Get
            Return _feb
        End Get
        Set(value As Date)
            _feb = value
        End Set
    End Property

    Public Property Mar As Date
        Get
            Return _mar
        End Get
        Set(value As Date)
            _mar = value
        End Set
    End Property

    Public Property Apr As Date
        Get
            Return _apr
        End Get
        Set(value As Date)
            _apr = value
        End Set
    End Property

    Public Property May As Date
        Get
            Return _may
        End Get
        Set(value As Date)
            _may = value
        End Set
    End Property

    Public Property Jun As Date
        Get
            Return _jun
        End Get
        Set(value As Date)
            _jun = value
        End Set
    End Property

    Public Property Jul As Date
        Get
            Return _jul
        End Get
        Set(value As Date)
            _jul = value
        End Set
    End Property

    Public Property Aug As Date
        Get
            Return _aug
        End Get
        Set(value As Date)
            _aug = value
        End Set
    End Property

    Public Property Sep As Date
        Get
            Return _sep
        End Get
        Set(value As Date)
            _sep = value
        End Set
    End Property

    Public Property Oct As Date
        Get
            Return _oct
        End Get
        Set(value As Date)
            _oct = value
        End Set
    End Property

    Public Property Nov As Date
        Get
            Return _nov
        End Get
        Set(value As Date)
            _nov = value
        End Set
    End Property

    Public Property Dec As Date
        Get
            Return _dec
        End Get
        Set(value As Date)
            _dec = value
        End Set
    End Property

    Public Property QuoteDate As String
        Get
            Return _quote_date
        End Get
        Set(ByVal value As String)
            _quote_date = value
        End Set
    End Property

    Public Property SmpQuoted As String
        Get
            Return _smp_quoted
        End Get
        Set(ByVal value As String)
            _smp_quoted = value
        End Set
    End Property

End Class
