
Partial Class AgencyPortal_SupplyRequest_Confirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblConfirm.Text = "Thank you for your order. It will be shipped on " &
    Today.AddDays(1) & "."
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As System.EventArgs) Handles btnReturn.Click
        Dim url As String = "http:" & ConfigurationManager.AppSettings("AppPath") & "Order.aspx"
        Response.Redirect(url)
    End Sub
End Class
