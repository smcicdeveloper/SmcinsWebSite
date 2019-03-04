﻿Imports Microsoft.VisualBasic

Public Class CartItem

    Public Sub New()

    End Sub

    Public Property Product As Product
    Public Property Quantity As Integer

    Public Sub New(ByVal product As Product, ByVal quantity As Integer)
        Me.Product = product
        Me.Quantity = quantity
    End Sub

    Public Sub AddQuantity(ByVal quantity As Integer)
        Me.Quantity += quantity
    End Sub

    Public Function Display() As String
        Return Product.Name & " (" & Quantity.ToString() & ")"
    End Function

End Class
