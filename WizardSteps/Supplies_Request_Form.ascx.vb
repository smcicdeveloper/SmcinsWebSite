Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports System.Web.Configuration
Imports System.Net.Mail

Partial Class WizardSteps_Supplies_Request_Form
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim agentnum As Label = CType(FormView1.FindControl("lblAgentNum"), Label)
        agentnum.Text = CStr(Session("UserNameIs"))




    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim fullname As Label = CType(FormView1.FindControl("FullnameLabel"), Label)
        Dim agentnum As Label = CType(FormView1.FindControl("lblAgentNum"), Label)

        Dim counter As Integer
        Dim start As Integer = 0
        Dim _end As Integer = DataList1.Items.Count - 1

        For counter = start To _end Step 1

            Dim chbSelect As CheckBox = CType(DataList1.Items(counter).FindControl("chbSelect"), CheckBox)
            Dim lblItem As Label = CType(DataList1.Items(counter).FindControl("ITEMLabel"), Label)
            Dim txtQuanity As TextBox = CType(DataList1.Items(counter).FindControl("txtQuanity"), TextBox)


            If chbSelect.Checked = True Then
                Dim client As New SmtpClient()
                Dim objEmail As New MailMessage("info@smcins.com", "pmoots@smcins.com")
                objEmail.Subject = "Agent’s Supply Request"
                'client.Host = "smcmail01.smcmain.local"
                client.Host = "10.0.0.1"
                client.Port = 25
                objEmail.Body = "<b>From: </b>" + fullname.Text + "<br />" + _
                "<b>Agent Number: </b>" + agentnum.Text + "<br />" + _
                "<b>Item: </b>" + lblItem.Text + "<br />" + _
                "<b>Quanity: </b>" + txtQuanity.Text + "<br />" + _
                "<b>Date: </b>" + Date.Today + "<br />"
                objEmail.IsBodyHtml = True

                client.Send(objEmail)
            End If

        Next counter

        If Page.IsPostBack = True Then

            For counter = start To _end Step 1

                Dim chbSelect As CheckBox = CType(DataList1.Items(counter).FindControl("chbSelect"), CheckBox)
                Dim lblItem As Label = CType(DataList1.Items(counter).FindControl("ITEMLabel"), Label)
                Dim txtQuanity As TextBox = CType(DataList1.Items(counter).FindControl("txtQuanity"), TextBox)

                If chbSelect.Checked = True Then
                    chbSelect.Checked = False
                    txtQuanity.Text = " "
                End If


            Next counter

        End If



    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Dim counter As Integer
        Dim start As Integer = 0
        Dim _end As Integer = DataList1.Items.Count - 1

        For counter = start To _end Step 1

            Dim chbSelect As CheckBox = CType(DataList1.Items(counter).FindControl("chbSelect"), CheckBox)
            Dim lblItem As Label = CType(DataList1.Items(counter).FindControl("ITEMLabel"), Label)
            Dim txtQuanity As TextBox = CType(DataList1.Items(counter).FindControl("txtQuanity"), TextBox)

            If chbSelect.Checked = True Then
                chbSelect.Checked = False
                txtQuanity.Text = " "
            End If
        Next counter
    End Sub


    Protected Sub DataList1_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        Dim ItemStatus As Label = CType(e.Item.FindControl("ITEMSTATUSLabel"), Label)
        Dim chbSelect As CheckBox = CType(e.Item.FindControl("chbSelect"), CheckBox)
        Dim txtQuanity As TextBox = CType(e.Item.FindControl("txtQuanity"), TextBox)
        If ItemStatus.Text = "Out-Of-Stock" Then
            chbSelect.Enabled = False
            txtQuanity.Enabled = False
            ItemStatus.ForeColor = Drawing.Color.Red
        End If
    End Sub
End Class
