Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Collections.Generic
Imports System.Collections
Imports smci.SetVaribles

Partial Class WizardSteps_Quote_Request_WC
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtAgentNum.Text = CStr(Session("UserNameIs"))

        txtAgentEmail.Focus()

        rfvPrePolicyComments.Enabled = False

        HiddenField1.Value = "WC"

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


        If rbWcLoss.SelectedValue = "Yes" Then
            rfvLossDate14a.Enabled = False
            rfvLossDescr14a.Enabled = False
            rfvLossAmt14a.Enabled = False
        End If

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

    Protected Sub rbWcLoss_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbWcLoss.SelectedIndexChanged
        If rbWcLoss.SelectedValue = "Yes" Then
            'Panel4.Enabled = True
            txtLossDate14a.Focus()
            rfvLossDate14a.Enabled = True
            rfvLossDescr14a.Enabled = True
            rfvLossAmt14a.Enabled = True
        End If
    End Sub

    'Protected Sub StepNextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    'End Sub

    Protected Sub rbPrevPolicyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
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
            'ltRequest.DataBind()
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
            If txtProfEmpNum.Text = String.Empty Then
                txtProfEmpNum.Text = "Blank"
            End If
            If txtProfEmpPay.Text = String.Empty Then
                txtProfEmpPay.Text = 0.0
            End If
            If txtAllOthNum.Text = String.Empty Then
                txtAllOthNum.Text = "Blank"
            End If
            If txtAllOthPay.Text = String.Empty Then
                txtAllOthPay.Text = 0.0
            End If
            If txtDayProNum.Text = String.Empty Then
                txtDayOthNum.Text = "Blank"
            End If
            If txtDayProPay.Text = String.Empty Then
                txtDayProPay.Text = 0.0
            End If
            If txtDayOthNum.Text = String.Empty Then
                txtDayOthNum.Text = "Blank"
            End If
            If txtDayOthPay.Text = String.Empty Then
                txtDayOthPay.Text = 0.0
            End If
            If txtDriverNum.Text = String.Empty Then
                txtDriverNum.Text = "Blank"
            End If
            If txtDriverPay.Text = String.Empty Then
                txtDriverPay.Text = 0.0
            End If
            If txtOtherNum.Text = String.Empty Then
                txtOtherNum.Text = "Blank"
            End If
            If txtOtherPay.Text = String.Empty Then
                txtOtherPay.Text = 0.0
            End If
            If txtOtherDescr.Text = String.Empty Then
                txtOtherDescr.Text = "Blank"
            End If
            odsWorkersCompA.Insert()
        End If

        If index = 2 Then
            If txtExplYes.Text = String.Empty Then
                txtExplYes.Text = "Blank"
            End If
            If txtLossDate14a.Text = String.Empty Then
                txtLossDate14a.Text = "01/01/2013"
            End If
            If txtLossDescr14a.Text = String.Empty Then
                txtLossDescr14a.Text = "Blank"
            End If
            If txtLossAmt14a.Text = String.Empty Then
                txtLossAmt14a.Text = 0.0
            End If
            If txtLossDate14b.Text = String.Empty Then
                txtLossDate14b.Text = "01/01/2013"
            End If
            If txtLossDescr14b.Text = String.Empty Then
                txtLossDescr14b.Text = "Blank"
            End If
            If txtLossAmt14b.Text = String.Empty Then
                txtLossAmt14b.Text = 0.0
            End If
            If txtLossDate14c.Text = String.Empty Then
                txtLossDate14c.Text = "01/01/2013"
            End If
            If txtLossDescr14c.Text = String.Empty Then
                txtLossDescr14c.Text = "Blank"
            End If
            If txtLossAmt14c.Text = String.Empty Then
                txtLossAmt14c.Text = 0.0
            End If
            If txtLossDate14d.Text = String.Empty Then
                txtLossDate14d.Text = "01/01/2013"
            End If
            If txtLossDescr14d.Text = String.Empty Then
                txtLossDescr14d.Text = "Blank"
            End If
            If txtLossAmt14d.Text = String.Empty Then
                txtLossAmt14d.Text = 0.0
            End If
            If txtLossDate14e.Text = String.Empty Then
                txtLossDate14e.Text = "01/01/2013"
            End If
            If txtLossDescr14e.Text = String.Empty Then
                txtLossDescr14e.Text = "Blank"
            End If
            If txtLossAmt14e.Text = String.Empty Then
                txtLossAmt14e.Text = 0.0
            End If
            odsWorkersCompB.Update()
        End If


    End Sub

    Protected Sub StepNextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
End Class
