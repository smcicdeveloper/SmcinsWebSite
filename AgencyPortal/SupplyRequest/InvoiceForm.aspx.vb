Imports System
Imports System.IO
Imports System.Web.UI
Imports System.Data
Imports System.Web.Configuration
Imports System.Net.Mail


Partial Class AgencyPortal_SupplyRequest_InvoiceForm
    Inherits System.Web.UI.Page

    Private cart As CartItemList

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtEmail.Enabled = False
        rfvEmail.Enabled = False

        LabelAttn.Text = Session("myname").ToString()
        LabelAgent.Text = Session("myagency").ToString()
        LabelStreet.Text = Session("mystreet").ToString()
        LabelCity.Text = Session("mycity").ToString()
        LabelState.Text = Session("mystate").ToString()
        LabelPostalCode.Text = Session("myzip").ToString()

        If Page.IsPostBack = False Then
            cart = CartItemList.GetCart
            Dim cartItem As CartItem
            For i = 0 To cart.Count - 1
                cartItem = cart(i)
                lstFinal.Items.Add(cartItem.Display)
            Next
        End If
    End Sub

    Protected Sub lnkFinal_Click(sender As Object, e As System.EventArgs) Handles lnkFinal.Click
        SendConfirmation()
        Session.Remove("Cart")
        Response.Redirect("Confirmation.aspx")
    End Sub


    Private Sub SendConfirmation()
        Dim client As New SmtpClient("10.0.0.1")
        client.Port = 25
        Dim msg As New MailMessage("info@smcins.com", "pmoots@smcins.com")
        msg.Subject = "Order Confirmation"
        If rblSendEmail.SelectedValue = "Yes" Then
            msg.CC.Add(txtEmail.Text)
        End If

        cart = CartItemList.GetCart
        msg.Body = Me.GetConfirmationMessage()

        msg.IsBodyHtml = True

        Dim cartItem As CartItem
        For i = 0 To cart.Count - 1
            cartItem = cart(i)
            msg.Body += "" + lstFinal.Items(i).Text + "<br />"
        Next i

        client.Send(msg)

    End Sub

    Private Function GetConfirmationMessage() As String
        'Dim message As String
        'message = "<html><head><title>Order confirmation</title></head>" + _
        '          "<body><div style='width: 800px;margin: 0 auto;background-color: #4785C6;'><table style='width:75%;'><tr><td><img alt='Company Logo' src='smcic-logo-white.png' /></td><td></td><td><h2>ORDERS</h2></td></tr></table></div>" + _
        '          "</td></tr><tr><td></td><td></td><td><h5>SHIP TO:</h5>" + _
        '          "<span style='list-style-type:none;align:left;padding-left:3px;'><ul>" + _
        '          "<li style='list-style-type:none;'><label>ATTN: </label>" + LabelAttn.Text + "</li>" + _
        '          "<li style='list-style-type:none;'>" + LabelAgent.Text + "</li>" + _
        '          "<li style='list-style-type:none;'>" + LabelStreet.Text + "</li>" + _
        '          "<li style='list-style-type:none;'>" + LabelCity.Text + "," + LabelState.Text + " " + LabelPostalCode.Text + "</li>" + _
        '          "</span>" + "</td></tr></table><hr style='border-style:dotted;' /></body></html>"
        'Return message

        Dim body As String = String.Empty
        Dim reader As StreamReader = New StreamReader(Server.MapPath("Email.htm"))
        body = reader.ReadToEnd

        body = body.Replace("{Attn}", LabelAttn.Text)
        body = body.Replace("{Title}", LabelAttn.Text)
        body = body.Replace("{Agent}", LabelAgent.Text)
        body = body.Replace("{Street}", LabelStreet.Text)
        body = body.Replace("{City}", LabelCity.Text)
        body = body.Replace("{State}", LabelState.Text)
        body = body.Replace("{Zip}", LabelPostalCode.Text)

        Return body
    End Function

    Protected Sub rblIncorp_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles rblSendEmail.SelectedIndexChanged
        If rblSendEmail.SelectedValue = "Yes" Then
            txtEmail.Enabled = True
            rfvEmail.Enabled = True
        Else
            txtEmail.Enabled = False
            rfvEmail.Enabled = False
        End If
    End Sub

    Protected Sub lnkCancel_Click(sender As Object, e As System.EventArgs) Handles lnkCancel.Click
        cart = CartItemList.GetCart
        If cart.Count > 0 Then
            cart.Clear()
            lstFinal.Items.Clear()
        End If
        Response.Redirect("Order.aspx")
    End Sub
End Class
