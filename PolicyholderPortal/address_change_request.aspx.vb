Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports System.Web.Configuration
Imports System.Net.Mail

Partial Class PolicyholderPortal_address_change_request
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub lbtnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbtnSubmit.Click
        Dim custnum As String = CStr(Session("UserNameIs"))
        Dim insured As Label = CType(dltAddress.FindControl("lblInsured"), Label)
        Dim client As New SmtpClient()

        Dim objEmail As New MailMessage("info@smcins.com", "uwdept@smcins.com")
        'client.Host = "smcmail01.smcmain.local"
        client.Host = "10.0.0.1"
        client.Port = 25
        objEmail.Subject = "Policyholder’s Request"
        objEmail.Body = "<b>Address change request from: </b>" + insured.Text + "<br />" + _
        "<b>Customer Number: </b>" + custnum.ToString + "<br /><br /><hr />" + _
        "<b>New Address: </b>" + txtStreet.Text + "<br />" + _
        "<b>New City: </b>" + txtCity.Text + "<br />" + _
        "<b>New State: </b>" + ddlState.SelectedValue + "<br />" + _
        "<b>New Zip: </b>" + txtZip.Text + "<br />" + _
        "<b>Attn To: </b>" + txtAttn.Text + "<br />" + _
        "<b>Date: </b>" + Date.Today + "<br />"
        objEmail.IsBodyHtml = True

        client.Send(objEmail)

        txtStreet.Text = String.Empty
        txtCity.Text = String.Empty
        txtZip.Text = String.Empty
        txtAttn.Text = String.Empty

    End Sub


End Class
