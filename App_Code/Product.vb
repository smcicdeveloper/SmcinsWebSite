Imports Microsoft.VisualBasic

Public Class Product

    Private _productId As String
    Private _item As String
    Private _quantity As Integer


    Public Property ProductID() As String
        Get
            Return _productId
        End Get
        Set(value As String)
            _productId = value
        End Set
    End Property

    Public Property Name As String
        Get
            Return _item
        End Get
        Set(value As String)
            _item = value
        End Set
    End Property

    Public Property Quantity As Integer
        Get
            Return _quantity
        End Get
        Set(value As Integer)
            _quantity = value
        End Set
    End Property

End Class
