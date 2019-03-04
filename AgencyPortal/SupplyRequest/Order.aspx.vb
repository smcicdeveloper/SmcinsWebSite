Imports System
Imports System.Web.UI
Imports System.Data

Partial Class AgencyPortal_SupplyRequest_Order
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub rblCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rblCategory.SelectedIndexChanged
        ddlSupplies.DataBind()
    End Sub

    Private Function GetSelectedProduct() As Product
        Dim productTable As DataView = CType(srcImages.Select(DataSourceSelectArguments.Empty), DataView)
        Dim product As New Product
        product.ProductID = productTable(0)("PRODUCT_ID").ToString
        product.Name = productTable(0)("ITEM").ToString
        Return product
    End Function

    Protected Sub lnkAdd_Click(sender As Object, e As EventArgs) Handles lnkAdd.Click
        If Page.IsValid Then
            Dim selectedProduct As Product = Me.GetSelectedProduct
            Dim cart As CartItemList = CartItemList.GetCart
            Dim cartItem As CartItem = cart(selectedProduct.ProductID)
            If cartItem Is Nothing Then
                cart.AddItem(selectedProduct, CInt(txtQuantity.Text))
            Else
                cartItem.AddQuantity(CInt(txtQuantity.Text))
            End If
            'Me.DisplayCart()
            Response.Redirect("Cart.aspx")
        End If
    End Sub

    Protected Sub DataList1_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        Dim ItemStatus As Label = CType(e.Item.FindControl("ITEMSTATUSLabel"), Label)
        If ItemStatus.Text = "Out-Of-Stock" Then
            txtQuantity.Enabled = False
            ItemStatus.ForeColor = Drawing.Color.Red
        Else
            txtQuantity.Enabled = True
            ItemStatus.ForeColor = Drawing.Color.Green
        End If
    End Sub
End Class
