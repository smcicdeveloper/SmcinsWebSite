Imports Microsoft.VisualBasic

Public Class _LossDetailVariables

    Private _agency As String
    Private _policyno As String
    Private _mod As String
    Private _lossdate As String
    Private _lossdescription As String
    Private _totalloss As Decimal

    Public Property Agency As String
        Get
            Return _agency
        End Get
        Set(value As String)
            _agency = value
        End Set
    End Property

    Public Property Policyno As String
        Get
            Return _policyno
        End Get
        Set(value As String)
            _policyno = value
        End Set
    End Property

    Public Property Mode As String
        Get
            Return _mod
        End Get
        Set(value As String)
            _mod = value
        End Set
    End Property

    Public Property LossDate As String
        Get
            Return _lossdate
        End Get
        Set(value As String)
            _lossdate = value
        End Set
    End Property

    Public Property LossDescription As String
        Get
            Return _lossdescription
        End Get
        Set(value As String)
            _lossdescription = value
        End Set
    End Property

    Public Property TotalLoss As Decimal
        Get
            Return _totalloss
        End Get
        Set(value As Decimal)
            _totalloss = value
        End Set
    End Property

End Class

Public Class _LossDetailGrowthVaiable
    Private _growth As Decimal

    Public Property Growth As Decimal
        Get
            Return _growth
        End Get
        Set(value As Decimal)
            _growth = value
        End Set
    End Property


End Class
