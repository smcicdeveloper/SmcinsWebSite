Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports System.Net.Mail

Partial Class WizardSteps_Change_Request_Form
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim agentnum As Label = CType(FormView1.FindControl("lblAgentNum"), Label)
        'agentnum.Text = CStr(Session("UserNameIs"))
        Dim txtEmail As TextBox = CType(FormView1.FindControl("txtEmail"), TextBox)
        txtEmail.ReadOnly = True
        If IsPostBack = False Then
            Dim lblAgentNumber As Label = CType(FormView1.FindControl("lblAgentNumber"), Label)

            Dim connectionString As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
            Dim con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT EMAIL FROM AgencyProfileInformation WHERE AGENT_NUMBER=@an", con)
            cmd.Parameters.AddWithValue("@an", lblAgentNumber.Text)

            Using con
                con.Open()
                Dim result As Object = cmd.ExecuteScalar()
                If Not IsNothing(result) Then
                    txtEmail.Text = String.Format("{0:c}", result)
                Else
                    txtEmail.Text = "No Match!"
                End If

            End Using
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim lblAgency As Label = CType(FormView1.FindControl("lblAgency"), Label)
        Dim lblAgentNumber As Label = CType(FormView1.FindControl("lblAgentNumber"), Label)
        Dim lblTheInsured As Label = CType(FormView1.FindControl("lblTheInsured"), Label)
        Dim lblLocation As Label = CType(FormView1.FindControl("lblLocation"), Label)
        Dim lblCityState As Label = CType(FormView1.FindControl("lblCityState"), Label)
        Dim lblPolicy As Label = CType(FormView1.FindControl("lblPolicy"), Label)
        Dim lblPolicyNumber As Label = CType(FormView1.FindControl("lblPolicyNumber"), Label)
        Dim txtEffDate As TextBox = CType(FormView1.FindControl("txtEffDate"), TextBox)
        Dim txtCommentBox As TextBox = CType(FormView1.FindControl("txtCommentBox"), TextBox)
        Dim txtFrom As TextBox = CType(FormView1.FindControl("txtFrom"), TextBox)
        Dim txtEmail As TextBox = CType(FormView1.FindControl("txtEmail"), TextBox)
        Dim txtPhoneNumber As TextBox = CType(FormView1.FindControl("txtPhoneNumber"), TextBox)


        Dim client As New SmtpClient()
        Dim objEmail As New MailMessage("uwdept@smcins.com", "uwdept@smcins.com")
        'client.Host = "mail01.smcmain.local"
        client.Host = "10.0.0.1"
        client.Port = 25
        objEmail.Subject = "Agent’s Request Confirmation "
        objEmail.CC.Add(txtEmail.Text)
        'objEmail.CC.Add("tareheart@smcins.com")
        objEmail.Body = "<p>Your request has been received by the Underwriting Department and will be processed in a timely manner.</p>" + "<br />" + _
        "<b>Agent Number: </b>" + lblAgentNumber.Text + "<br />" + _
        "<b>The Insured: </b>" + lblTheInsured.Text + "<br />" + _
        "<b>Location: </b>" + lblLocation.Text + "<br />" + _
        "<b>City/State: </b>" + lblCityState.Text + "<br />" + _
        "<b>Policy Type: </b>" + lblPolicy.Text + "<br />" + _
        "<b>Policy Number: </b>" + lblPolicyNumber.Text + "<br />" + _
        "<b>Effect Date: </b>" + txtEffDate.Text + "<br />" + _
        "<b>Description Of Changes: </b>" + txtCommentBox.Text + "<br />" + _
        "<b>From: </b>" + txtFrom.Text + "<br />" + _
        "<b>Email: </b>" + txtEmail.Text + "<br />" + _
        "<b>Phone Number: </b>" + txtPhoneNumber.Text + "<br />" + _
        "<b>Date Sent: </b>" + Date.Today + "<br />"
        objEmail.IsBodyHtml = True

        client.Send(objEmail)

        txtEffDate.Text = String.Empty
        txtCommentBox.Text = String.Empty
        txtFrom.Text = String.Empty
        txtEmail.Text = String.Empty
        txtPhoneNumber.Text = String.Empty
    End Sub

    'Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
    '    Dim txtEffDate As TextBox = CType(FormView1.FindControl("txtEffDate"), TextBox)
    '    Dim txtCommentBox As TextBox = CType(FormView1.FindControl("txtCommentBox"), TextBox)
    '    Dim txtFrom As TextBox = CType(FormView1.FindControl("txtFrom"), TextBox)
    '    Dim txtEmail As TextBox = CType(FormView1.FindControl("txtEmail"), TextBox)
    '    Dim txtPhoneNumber As TextBox = CType(FormView1.FindControl("txtPhoneNumber"), TextBox)

    '    Dim rfvDate As RequiredFieldValidator = CType(FormView1.FindControl("rfvDate"), RequiredFieldValidator)
    '    Dim rfvCommentBox As RequiredFieldValidator = CType(FormView1.FindControl("rfvCommentBox"), RequiredFieldValidator)
    '    Dim rfvEmail As RequiredFieldValidator = CType(FormView1.FindControl("rfvEmail"), RequiredFieldValidator)
    '    Dim rfvFrom As RequiredFieldValidator = CType(FormView1.FindControl("rfvFrom"), RequiredFieldValidator)
    '    Dim rfvPhone As RequiredFieldValidator = CType(FormView1.FindControl("rfvPhone"), RequiredFieldValidator)

    '    txtEffDate.Text = String.Empty
    '    txtCommentBox.Text = String.Empty
    '    txtFrom.Text = String.Empty
    '    txtEmail.Text = String.Empty
    '    txtPhoneNumber.Text = String.Empty

    '    rfvDate.Enabled = False
    '    rfvCommentBox.Enabled = False
    '    rfvEmail.Enabled = False
    '    rfvFrom.Enabled = False
    '    rfvPhone.Enabled = False

    'End Sub

    'Protected Sub txtEmail_TextChanged(sender As Object, e As System.EventArgs)
    '    Dim txtEmail As TextBox = CType(FormView1.FindControl("txtEmail"), TextBox)
    '    txtEmail.Text = String.Empty
    'End Sub

    Protected Sub chkChangeEmail_CheckedChanged(sender As Object, e As System.EventArgs)
        Dim txtEmail As TextBox = CType(FormView1.FindControl("txtEmail"), TextBox)
        txtEmail.Text = String.Empty
        txtEmail.ReadOnly = False
    End Sub

End Class
