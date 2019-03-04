Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Collections.Generic
Imports System.Collections
Imports smci.SetVaribles

Partial Class WizardSteps_Quote_Request_UM
    Inherits System.Web.UI.UserControl

    Protected Sub StepNextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtAgentNum.Text = CStr(Session("UserNameIs"))

        txtAgentEmail.Focus()

        rfvPrePolicyComments.Enabled = False

        HiddenField1.Value = "UM"

        'This method will automatically generate agency information on General Information form
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmd1 As New SqlCommand("SELECT NAME_OF_AGENCY FROM AgencyBusinessInformation WHERE AGENT_NUMBER=@an", con)
        Dim cmd2 As New SqlCommand("SELECT FIRST_NAME + ' ' + LAST_NAME As FULL_NAME FROM AgencyProfileInformation WHERE AGENT_NUMBER=@an", con)
        cmd1.Parameters.AddWithValue("@an", txtAgentNum.Text)
        cmd2.Parameters.AddWithValue("@an", txtAgentNum.Text)

        Using con
            con.Open()
            Dim result1 As Object = cmd1.ExecuteScalar()
            Dim result2 As Object = cmd2.ExecuteScalar()
            If Not IsNothing(result1) Then
                txtAgency.Text = String.Format("{0:c}", result1)
            Else
                txtAgency.Text = "No Match!"
            End If

            If Not IsNothing(result2) Then
                txtAgentName.Text = String.Format("{0:c}", result2)
            Else
                txtAgentName.Text = "No Match!"
            End If
        End Using

        rfvLossDate15a.Enabled = False
        rfvLossDescr15a.Enabled = False
        rfvLossAmt15a.Enabled = False

    End Sub

    Protected Sub chbCarrier_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        If chbCarrier.Checked = True Then
            txtCarrier.Text = "Blank"
            txtExDate.Text = Today.Date
            txtCarrier.ReadOnly = True
            txtExDate.ReadOnly = True
            'txtCarrier.Enabled = False
            'txtExDate.Enabled = False
            rfvExDate.Enabled = False
            rfvCarrier.Enabled = False
            'txtCarrier.Text = String.Empty
            'txtExDate.Text = String.Empty
            txtCarrier.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;Color:silver;")
            txtExDate.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;Color:silver;")
        Else
            txtCarrier.Enabled = True
            txtExDate.Enabled = True
            rfvExDate.Enabled = True
            rfvCarrier.Enabled = True
            txtCarrier.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            txtExDate.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

    End Sub


    'Protected Sub rbPreviousPolicyYes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    '    If rbPreviousPolicyYes.Checked = True Then
    '        rfvPrePolicyComments.Enabled = True
    '    End If
    'End Sub

    Protected Sub rbPrevPolicyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbPrevPolicyList.SelectedIndexChanged
        If rbPrevPolicyList.SelectedValue = "Yes" Then
            rfvPrePolicyComments.Enabled = True
        End If
    End Sub

    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.NextButtonClick
        Dim index As Integer = Int32.Parse(e.CurrentStepIndex.ToString)

        If txtAgentEmail2.Text = String.Empty Then
            txtAgentEmail2.Text = "Blank"
        End If
        If txtPrem.Text = String.Empty Then
            txtPrem.Text = "0.00"
        End If
        If txtWebAddr.Text = String.Empty Then
            txtWebAddr.Text = "Blank"
        End If
        If txtPhone2.Text = String.Empty Then
            txtPhone2.Text = "Blank"
        End If
        If txtComments1.Text = String.Empty Then
            txtComments1.Text = "Blank"
        End If
        If txtMortgLP.Text = String.Empty Then
            txtMortgLP.Text = "Blank"
        End If

        If index = 0 Then
            odsGeneralInfo.Insert()
        End If

        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmd3 As New SqlCommand("SELECT RequestNumber FROM GeneralInformationApplication WHERE AgentNumber=@an AND SubmitDate=@sd", con)
        cmd3.Parameters.AddWithValue("@an", txtAgentNum.Text)
        cmd3.Parameters.AddWithValue("@sd", Today.Date)

        Using con
            con.Open()
            Dim result3 As Object = cmd3.ExecuteScalar()

            If Not IsNothing(result3) Then
                HiddenField2.Value = String.Format(result3)

            Else
                HiddenField2.Value = "0000"
            End If
        End Using

        If index = 1 Then
            If txtUmPriorCarrier.Text = String.Empty Then
                txtUmPriorCarrier.Text = 0
            End If
            If txtUmExpComments.Text = String.Empty Then
                txtUmExpComments.Text = "Blank"
            End If
            If txtLossDate15a.Text = String.Empty Then
                txtLossDate15a.Text = "01/01/2013"
            End If
            If txtLossDescr15a.Text = String.Empty Then
                txtLossDescr15a.Text = "Blank"
            End If
            If txtLossAmt15a.Text = String.Empty Then
                txtLossAmt15a.Text = 0
            End If
            If txtLossDate15b.Text = String.Empty Then
                txtLossDate15b.Text = "01/01/2013"
            End If
            If txtLossDescr15b.Text = String.Empty Then
                txtLossDescr15b.Text = "Blank"
            End If
            If txtLossAmt15b.Text = String.Empty Then
                txtLossAmt15b.Text = 0
            End If
            If txtLossDate15c.Text = String.Empty Then
                txtLossDate15c.Text = "01/01/2013"
            End If
            If txtLossDescr15c.Text = String.Empty Then
                txtLossDescr15c.Text = "Blank"
            End If
            If txtLossAmt15c.Text = String.Empty Then
                txtLossAmt15c.Text = 0
            End If
            If txtLossDate15d.Text = String.Empty Then
                txtLossDate15d.Text = "01/01/2013"
            End If
            If txtLossDescr15d.Text = String.Empty Then
                txtLossDescr15d.Text = "Blank"
            End If
            If txtLossAmt15d.Text = String.Empty Then
                txtLossAmt15d.Text = 0
            End If
            If txtLossDate15e.Text = String.Empty Then
                txtLossDate15e.Text = "01/01/2013"
            End If
            If txtLossDescr15e.Text = String.Empty Then
                txtLossDescr15e.Text = "Blank"
            End If
            If txtLossAmt15e.Text = String.Empty Then
                txtLossAmt15e.Text = 0
            End If
            odsUmbrella.Insert()
        End If

    End Sub

    Protected Sub rbUmLoss_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbUmLoss.SelectedIndexChanged
        If rbUmLoss.SelectedValue = "Yes" Then
            txtLossDate15a.Focus()
            rfvLossDate15a.Enabled = True
            rfvLossDescr15a.Enabled = True
            rfvLossAmt15a.Enabled = True
        End If
    End Sub
End Class
