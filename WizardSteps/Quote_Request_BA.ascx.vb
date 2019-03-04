Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Collections.Generic
Imports System.Collections
Imports smci.SetVaribles

Partial Class WizardSteps_Quote_Request_BA
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("ddate") = Today.Date

        txtAgentNum.Text = CStr(Session("UserNameIs"))

        txtAgentEmail.Focus()

        rfvPrePolicyComments.Enabled = False

        HiddenField1.Value = "BA"

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

        'Step 11
        'Panel3.Enabled = False
        rfvLossDate11a.Enabled = False
        rfvLossDescr11a.Enabled = False
        rfvLossAmt11a.Enabled = False

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

    'commented out on 12-20-2012 replace the original first page with the smp first page
    'Protected Sub rbPreviousPolicyYes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    If rbPreviousPolicyYes.Checked = True Then
    '        rfvPrePolicyComments.Enabled = True
    '    End If
    'End Sub

    Protected Sub rbPrevPolicyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        If rbPrevPolicyList.SelectedValue = "Yes" Then
            rfvPrePolicyComments.Enabled = True
        End If
    End Sub

    Protected Sub chbNoCarrier_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        If chbNoCarrier.Checked = True Then
            txtCurrCarrier.Text = "Blank"
            txtCurrCarrier.ReadOnly = True
            rfvCurrCarrier.Enabled = False

            txtCurrCarrier.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;color:silver;")
        Else
            txtCurrCarrier.Enabled = True
            rfvCurrCarrier.Enabled = True
            txtCurrCarrier.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If
    End Sub

    'Protected Sub rbLoss11Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    If rbLoss11Yes.Checked = True Then
    '        Panel3.Enabled = True
    '        txtLossDate11a.Focus()
    '        rfvLossDate11a.Enabled = True
    '        rfvLossDescr11a.Enabled = True
    '        rfvLossAmt11a.Enabled = True
    '    End If
    'End Sub

    'Protected Sub rbLoss11No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    '    If rbLoss11No.Checked = True Then
    '        Panel3.Enabled = False
    '        txtLossDate11a.Text = String.Empty
    '        txtLossDescr11a.Text = String.Empty
    '        txtLossAmt11a.Text = String.Empty
    '        txtLossDate11b.Text = String.Empty
    '        txtLossDescr11b.Text = String.Empty
    '        txtLossAmt11b.Text = String.Empty
    '        txtLossDate11c.Text = String.Empty
    '        txtLossDescr11c.Text = String.Empty
    '        txtLossAmt11c.Text = String.Empty
    '        txtLossDate11d.Text = String.Empty
    '        txtLossDescr11d.Text = String.Empty
    '        txtLossAmt11d.Text = String.Empty
    '        txtLossDate11e.Text = String.Empty
    '        txtLossDescr11e.Text = String.Empty
    '        txtLossAmt11e.Text = String.Empty
    '    End If
    'End Sub

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
                HiddenField5.Value = String.Format(result3)
            Else
                'ltRequest.Text = "No Request Number!"
                HiddenField5.Value = "0000"
            End If
        End Using

        If index = 1 Then
            If txtExpComments.Text = String.Empty Then
                txtExpComments.Text = "Blank"
            End If
            If txtLossDate11a.Text = String.Empty Then
                txtLossDate11a.Text = "01/01/2013"
            End If
            If txtLossDescr11a.Text = String.Empty Then
                txtLossDescr11a.Text = "Blank"
            End If
            If txtLossAmt11a.Text = String.Empty Then
                txtLossAmt11a.Text = 0
            End If
            If txtLossDate11b.Text = String.Empty Then
                txtLossDate11b.Text = "01/01/2013"
            End If
            If txtLossDescr11b.Text = String.Empty Then
                txtLossDescr11b.Text = "Blank"
            End If
            If txtLossAmt11b.Text = String.Empty Then
                txtLossAmt11b.Text = 0
            End If
            If txtLossDate11c.Text = String.Empty Then
                txtLossDate11c.Text = "01/01/2013"
            End If
            If txtLossDescr11c.Text = String.Empty Then
                txtLossDescr11c.Text = "Blank"
            End If
            If txtLossAmt11c.Text = String.Empty Then
                txtLossAmt11c.Text = 0
            End If
            If txtLossDate11d.Text = String.Empty Then
                txtLossDate11d.Text = "01/01/2013"
            End If
            If txtLossDescr11d.Text = String.Empty Then
                txtLossDescr11d.Text = "Blank"
            End If
            If txtLossAmt11d.Text = String.Empty Then
                txtLossAmt11d.Text = 0
            End If
            If txtLossDate11e.Text = String.Empty Then
                txtLossDate11e.Text = "01/01/2013"
            End If
            If txtLossDescr11e.Text = String.Empty Then
                txtLossDescr11e.Text = "Blank"
            End If
            If txtLossAmt11e.Text = String.Empty Then
                txtLossAmt11e.Text = 0
            End If
            odsAddBa.Insert()
        End If

    End Sub

    Protected Sub dlstVehicle_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstVehicle.CancelCommand
        dlstVehicle.EditItemIndex = -1
        dlstVehicle.DataBind()
    End Sub

    Protected Sub dlstVehicle_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstVehicle.DeleteCommand
        'Assign parameters
        odsChurchVehicle.DeleteParameters("VehicleId").DefaultValue = dlstVehicle.DataKeys(e.Item.ItemIndex).ToString()

        'Call odsChurchVehicle Delete
        odsChurchVehicle.Delete()
    End Sub

    Protected Sub dlstVehicle_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstVehicle.EditCommand
        dlstVehicle.EditItemIndex = e.Item.ItemIndex
        dlstVehicle.DataBind()
    End Sub

    Protected Sub dlstVehicle_UpdateCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstVehicle.UpdateCommand
        'Get form fields
        Dim txtYear As TextBox = CType(e.Item.FindControl("txtYear"), TextBox)
        Dim txtMake As TextBox = CType(e.Item.FindControl("txtMake"), TextBox)
        Dim txtModel As TextBox = CType(e.Item.FindControl("txtModel"), TextBox)
        Dim txtVin As TextBox = CType(e.Item.FindControl("txtVin"), TextBox)
        Dim txtNumOfPass As TextBox = CType(e.Item.FindControl("txtNumOfPass"), TextBox)
        Dim txtCost As TextBox = CType(e.Item.FindControl("txtCost"), TextBox)
        Dim txtCounty As TextBox = CType(e.Item.FindControl("txtCounty"), TextBox)
        Dim ddlRadius As DropDownList = CType(e.Item.FindControl("ddlRadius"), DropDownList)
        Dim ddlLiability As DropDownList = CType(e.Item.FindControl("ddlLiability"), DropDownList)
        Dim ddlComp As DropDownList = CType(e.Item.FindControl("ddlComp"), DropDownList)
        Dim ddlCollision As DropDownList = CType(e.Item.FindControl("ddlCollision"), DropDownList)
        Dim ddlRental As DropDownList = CType(e.Item.FindControl("ddlRental"), DropDownList)
        Dim ddlTowing As DropDownList = CType(e.Item.FindControl("ddlTowing"), DropDownList)


        'Assign Parameters
        odsChurchVehicle.UpdateParameters("Vehicleid").DefaultValue = dlstVehicle.DataKeys(e.Item.ItemIndex).ToString()
        odsChurchVehicle.UpdateParameters("Year").DefaultValue = txtYear.Text
        odsChurchVehicle.UpdateParameters("Make").DefaultValue = txtMake.Text
        odsChurchVehicle.UpdateParameters("Model").DefaultValue = txtModel.Text
        odsChurchVehicle.UpdateParameters("VIN").DefaultValue = txtVin.Text
        odsChurchVehicle.UpdateParameters("Numofpassen").DefaultValue = txtNumOfPass.Text
        odsChurchVehicle.UpdateParameters("Costnew").DefaultValue = txtCost.Text
        odsChurchVehicle.UpdateParameters("County").DefaultValue = txtCounty.Text
        odsChurchVehicle.UpdateParameters("Radiusofoperation").DefaultValue = ddlRadius.SelectedValue
        odsChurchVehicle.UpdateParameters("Liability").DefaultValue = ddlLiability.SelectedValue
        odsChurchVehicle.UpdateParameters("Compdeduct").DefaultValue = ddlComp.SelectedValue
        odsChurchVehicle.UpdateParameters("Collision").DefaultValue = ddlCollision.SelectedValue
        odsChurchVehicle.UpdateParameters("Rental").DefaultValue = ddlRental.SelectedValue
        odsChurchVehicle.UpdateParameters("Towing").DefaultValue = ddlTowing.SelectedValue


        'Call ObjectDataSource
        odsChurchVehicle.Update()
        dlstVehicle.EditItemIndex = -1

    End Sub

    Protected Sub rbBaLoss_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbBaLoss.SelectedIndexChanged
        'Index 12
        If rbBaLoss.SelectedValue = "Yes" Then
            'Panel3.Enabled = True
            txtLossDate11a.Focus()
            rfvLossDate11a.Enabled = True
            rfvLossDescr11a.Enabled = True
            rfvLossAmt11a.Enabled = True
        Else
            'Panel3.Enabled = False
            txtLossDate11a.Text = "01/01/2013"
            txtLossDescr11a.Text = "Blank"
            txtLossAmt11a.Text = 0
            txtLossDate11b.Text = "01/01/2013"
            txtLossDescr11b.Text = "Blank"
            txtLossAmt11b.Text = 0
            txtLossDate11c.Text = "01/01/2013"
            txtLossDescr11c.Text = "Blank"
            txtLossAmt11c.Text = 0
            txtLossDate11d.Text = "01/01/2013"
            txtLossDescr11d.Text = "Blank"
            txtLossAmt11d.Text = 0
            txtLossDate11e.Text = "01/01/2013"
            txtLossDescr11e.Text = "Blank"
            txtLossAmt11e.Text = 0
        End If
    End Sub

    Protected Sub StepNextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
End Class
