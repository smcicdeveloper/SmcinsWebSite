Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Collections.Generic
Imports System.Collections
Imports smci.SetVaribles

Partial Class WizardSteps_Quote_Request_SMP
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("ddate") = Today.Date

        txtAgentNum.Text = CStr(Session("UserNameIs"))

        txtAgentEmail.Focus()

        rfvPrePolicyComments.Enabled = False

        HiddenField1.Value = "SMP"

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

        'Pastoral Counseling
        txtExplain.Enabled = False
        'txtExplain.ReadOnly = True
        txtExplain.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        If rbAllegations.SelectedValue = "No" Then
            'txtExplain.Text = "Blank"
            rfvExplain.Enabled = False
        End If

        'Step 7
        'txtPropOwner.ReadOnly = True
        'txtSchoolKids.ReadOnly = True
        'txtCemeteryAddress.ReadOnly = True
        'rfvPropOwner.Enabled = False
        'txtPropOwner.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        rfvPropOwner.Enabled = False
        rfvSchoolKids.Enabled = False
        rfvCemeteryAddress.Enabled = False

        'If rbActiveSchool.SelectedValue = "Yes" Then
        '    rfvSchoolKids.Enabled = True
        'Else
        '    rfvSchoolKids.Enabled = False
        '    txtSchoolKids.Text = "0"
        '    txtSchoolKids.ReadOnly = True
        '    txtSchoolKids.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;color:silver;")
        'End If
        'txtCemeteryAddress.Enabled = False
        'txtCemeteryAddress.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")

        If rbUnderLoss.SelectedValue = "Yes" Then
            ' Panel1.Enabled = False
        End If

        rfvLossDate7a.Enabled = False
        rfvLossDescr7a.Enabled = False
        rfvLossAmt7a.Enabled = False


        'Step 9
        txtExplainCharges.Enabled = False
        txtExplainCharges.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        rfvExplainCharges.Enabled = False

        'Step 10
        txtExplainLosses.Enabled = False
        txtExplainLosses.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        rfvExpLoss.Enabled = False

        'Index 11
        txtExpAmountPaid.Enabled = False
        txtExpAmountPaid.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        rfvExpAmountPaid.Enabled = False

        'Employee Pratices
        'txtDrugs.Enabled = False
        'txtDrugs.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        'txtExtra.Enabled = False
        'txtExtra.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        'txtClaim.Enabled = False
        'txtClaim.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        'txtCancelled.Enabled = False
        'txtCancelled.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        If rbDrugTest.SelectedValue = "No" Then
            rfvDrugs.Enabled = False
            txtDrugs.ReadOnly = True
        End If
        If rbPraticeClaims.SelectedValue = "No" Then
            rfvExtra.Enabled = False
            txtExtra.ReadOnly = True
        End If
        If rbRiseClaim.SelectedValue = "No" Then
            rfvClaim.Enabled = False
            txtClaim.ReadOnly = True
        End If
        If rbPriorCoverage.SelectedValue = "No" Then
            rfvCancelled.Enabled = False
            txtCancelled.ReadOnly = True
        End If

        'Step 11
        'Panel3.Enabled = False
        rfvLossDate11a.Enabled = False
        rfvLossDescr11a.Enabled = False
        rfvLossAmt11a.Enabled = False

        'Step 14
        ' Panel4.Enabled = False
        rfvLossDate14a.Enabled = False
        rfvLossDescr14a.Enabled = False
        rfvLossAmt14a.Enabled = False

        'Step 15
        'Panel5.Enabled = False
        rfvLossDate15a.Enabled = False
        rfvLossDescr15a.Enabled = False
        rfvLossAmt15a.Enabled = False
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
                ltRequest.Text = String.Format(result3)
                HiddenField2.Value = String.Format(result3)
                HiddenField3.Value = String.Format(result3)
                HiddenField4.Value = String.Format(result3)
                HiddenField5.Value = String.Format(result3)
            Else
                ltRequest.Text = "No Request Number!"
                HiddenField2.Value = "0000"
            End If
        End Using

        If index = 1 Then
            Session("Money") = "0"
            Session("Blank") = "Blank"
            Session("No") = "No"
            odsAddSmp.Insert()
        End If

        'check index 12/06/2012
        If index = 4 Then
            Session("Money") = "0"
            Session("Blank") = "Blank"
            Session("No") = "No"
            If txtComments.Text = String.Empty Then
                txtComments.Text = "Blank"
            End If
            odsUpdateSmpApp1.Update()
        End If

        If index = 5 Then
            odsUpdateSmpApp2.Update()
        End If

        If index = 7 Then
            If rbAllegations.SelectedValue = "No" Then
                txtExplain.Text = "Blank"
            End If
            odsInsertPastoral.Insert()
        End If

        If index = 6 Then
            If txtOthAct.Text = String.Empty Then
                txtOthAct.Text = "Blank"
            End If
            If txtAvgAtt.Text = String.Empty Then
                txtAvgAtt.Text = "0"
            End If
            If txtLossDate7b.Text = String.Empty Then
                txtLossDate7b.Text = "01/01/2013"
            End If
            If txtLossDescr7b.Text = String.Empty Then
                txtLossDescr7b.Text = "Blank"
            End If
            If txtLossAmt7b.Text = String.Empty Then
                txtLossAmt7b.Text = 0
            End If
            If txtLossDate7c.Text = String.Empty Then
                txtLossDate7c.Text = "01/01/2013"
            End If
            If txtLossDescr7c.Text = String.Empty Then
                txtLossDescr7c.Text = "Blank"
            End If
            If txtLossAmt7c.Text = String.Empty Then
                txtLossAmt7c.Text = 0
            End If
            If txtLossDate7d.Text = String.Empty Then
                txtLossDate7d.Text = "01/01/2013"
            End If
            If txtLossDescr7d.Text = String.Empty Then
                txtLossDescr7d.Text = "Blank"
            End If
            If txtLossAmt7d.Text = String.Empty Then
                txtLossAmt7d.Text = 0
            End If
            If txtLossDate7e.Text = String.Empty Then
                txtLossDate7e.Text = "01/01/2013"
            End If
            If txtLossDescr7e.Text = String.Empty Then
                txtLossDescr7e.Text = "Blank"
            End If
            If txtLossAmt7e.Text = String.Empty Then
                txtLossAmt7e.Text = 0
            End If
            odsUpdateSmpApp3.Update()
        End If

        If index = 8 Then
            If rbCharges.SelectedValue = "No" Then
                txtExplainCharges.Text = "Blank"
            End If
            odsSexMiscon.Insert()
        End If

        If index = 9 Then
            If rbLostCoverage.SelectedValue = "No" Then
                txtExplainLosses.Text = "Blank"
            End If
            odsSupCoverage.Insert()
        End If

        If index = 10 Then
            If rbDrugTest.SelectedValue = "No" Then
                txtDrugs.Text = "Blank"
                'rfvDrugs.Enabled
            End If
            If rbPraticeClaims.SelectedValue = "No" Then
                txtExtra.Text = "Blank"
            End If
            If rbRiseClaim.SelectedValue = "No" Then
                txtClaim.Text = "Blank"
            End If
            If rbPriorCoverage.SelectedValue = "No" Then
                txtCancelled.Text = "Blank"
            End If
            odsEmployeePractice.Insert()
        End If

        If index = 11 Then
            If txtFull1.Text = String.Empty Then
                txtFull1.Text = 0
            End If
            If txtPart1.Text = String.Empty Then
                txtPart1.Text = 0
            End If
            If txtVolunteer1.Text = String.Empty Then
                txtVolunteer1.Text = 0
            End If
            If txtFull2.Text = String.Empty Then
                txtFull2.Text = 0
            End If
            If txtPart2.Text = String.Empty Then
                txtPart2.Text = 0
            End If
            If txtVolunteer2.Text = String.Empty Then
                txtVolunteer2.Text = 0
            End If
            If txtFull3.Text = String.Empty Then
                txtFull3.Text = 0
            End If
            If txtPart3.Text = String.Empty Then
                txtPart3.Text = 0
            End If
            If txtVolunteer3.Text = String.Empty Then
                txtVolunteer3.Text = 0
            End If
            If txtFull4.Text = String.Empty Then
                txtFull4.Text = 0
            End If
            If txtPart4.Text = String.Empty Then
                txtPart4.Text = 0
            End If
            If txtVolunteer4.Text = String.Empty Then
                txtVolunteer4.Text = 0
            End If
            If txtFull5.Text = String.Empty Then
                txtFull5.Text = 0
            End If
            If txtPart5.Text = String.Empty Then
                txtPart5.Text = 0
            End If
            If txtVolunteer5.Text = String.Empty Then
                txtVolunteer5.Text = 0
            End If
            If txtFull6.Text = String.Empty Then
                txtFull6.Text = 0
            End If
            If txtPart6.Text = String.Empty Then
                txtPart6.Text = 0
            End If
            If txtVolunteer6.Text = String.Empty Then
                txtVolunteer6.Text = 0
            End If
            If rbAgainSchool.SelectedValue = "No" Then
                txtExpAmountPaid.Text = "Blank"
            End If
            If rbPropertiesList.SelectedValue = "Yes" Then
                txtPropOwner.Text = "Blank"
            End If
            If rbActiveSchool.SelectedValue = "No" Then
                txtSchoolKids.Text = "Blank"
            End If
            If rbCemeteryLoc.SelectedValue = "Yes" Then
                txtCemeteryAddress.Text = "Blank"
            End If
            odsTeachersLiability.Insert()
        End If

        If index = 12 Then
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

        If index = 14 Then
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
                txtDayProNum.Text = "Blank"
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

        If index = 15 Then
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

        If index = 16 Then
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

        'Wizard1.ActiveStepIndex = index

        Dim grdLocation As GridView = CType(Wizard1.FindControl("grdLocation"), GridView)
        Dim grdBuilding As GridView = CType(Wizard1.FindControl("grdBuilding"), GridView)
        Dim ddlLocation As DropDownList = CType(dtlInsertBuilding.FindControl("ddlLocation"), DropDownList)

        If index = 3 Then
            'ddlLocation.DataBind()
        End If

        If index = 2 And grdLocation.Rows.Count = 0 Then
            MsgBox("need Location")
            ' ElseIf index = 2 And grdLocation.Rows.Count > 0 Then
            'rfvAddress.Dispose()
            'rfvCity.Dispose()
            'rfvZip.Dispose()
            'revZip.Dispose()
            'rfvCounty.Dispose()
            'vs14.Dispose()
            'ElseIf index = 3 And grdBuilding.Rows.Count = 0 Then
            '    MsgBox("Need Building")
        ElseIf index = 5 And ddPCliab.SelectedValue > 0 And ddSMMliab.SelectedValue > 0 And ddDOliab.SelectedValue > 0 And ddEPLliab.SelectedValue > 0 And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 7 'Check to see if all five have been selected - goto pastoral page / first 
        ElseIf index = 5 And ddPCliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 7 'Check to see if all five have been selected - goto sexual misconduct page / second 
        ElseIf index = 5 And ddSMMliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 8 'Check to see if all five have been selected - goto directors page / forth 
        ElseIf index = 5 And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9 'Check to see if all five have been selected - goto directors page / fifth 
        ElseIf index = 5 And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10 'Scenario if pastoral is greater than zero and if sexual misconduct is greater than zero goto pastoral page
        ElseIf index = 5 And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11 'Scenario if pastoral is greater than zero and if sexual misconduct is greater than zero goto sexual misconduct page
        ElseIf index = 5 And ddPCliab.SelectedValue = 0 And ddSMMliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6 'Check to see if all five have been selected - goto directors page / third 



        ElseIf index = 7 And txtNumEmp.Text > "0" And ddSMMliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 8 'Check after completing the pastoral form if there was a value for sexual misconduct and goto the sexual misconduct page
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9 'Check after completing the pastoral form if there was a value for directors page and goto directors page page
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10 'Employee
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11 'Teacher
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddSMMliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6


        ElseIf index = 8 And rbMisconduct.SelectedValue = "Yes" And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9
        ElseIf index = 8 And rbMisconduct.SelectedValue = "No" And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9
        ElseIf index = 8 And rbMisconduct.SelectedValue = "No" And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 8 And rbMisconduct.SelectedValue = "No" And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 8 And rbMisconduct.SelectedValue = "Yes" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 8 And rbMisconduct.SelectedValue = "No" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 8 And rbMisconduct.SelectedValue = "Yes" And ddPCliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6
        ElseIf index = 8 And rbMisconduct.SelectedValue = "No" And ddPCliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6



        ElseIf index = 9 And rbLostCoverage.SelectedValue = "Yes" And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 9 And rbLostCoverage.SelectedValue = "No" And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 9 And rbLostCoverage.SelectedValue = "No" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 9 And rbLostCoverage.SelectedValue = "No" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 9 And rbLostCoverage.SelectedValue = "Yes" And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6
        ElseIf index = 9 And rbLostCoverage.SelectedValue = "No" And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6


        ElseIf index = 10 And txtTotalEmployees.Text > "0" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 10 And txtTotalEmployees.Text > "0" And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6


        ElseIf index = 5 And ddPCliab.SelectedValue = 0 And ddSMMliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6 'Check to see if all three have been selected - goto pastoral page / first 
        ElseIf index = 6 And rbPropertiesList.SelectedValue = "Yes" Then
            Wizard1.ActiveStepIndex = 12
        ElseIf index = 6 And rbPropertiesList.SelectedValue = "No" Then
            Wizard1.ActiveStepIndex = 12
        ElseIf index = 11 And rbTeacherPerform.SelectedValue = "Yes" Then
            Wizard1.ActiveStepIndex = 6
        ElseIf index = 11 And rbTeacherPerform.SelectedValue = "No" Then
            Wizard1.ActiveStepIndex = 6
        End If

        cmpNumEmp.ValueToCompare = 0
        cmpTotalEmp.ValueToCompare = 0
        'page 223
        'If index = 3 And grdBuilding.Rows.Count = 0 Then
        '    MsgBox("Need Building")
        'End If

    End Sub

    Protected Sub dlstBuild_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstBuild.EditCommand
        dlstBuild.EditItemIndex = e.Item.ItemIndex
        dlstBuild.DataBind()
    End Sub

    Protected Sub dlstBuild_UpdateCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstBuild.UpdateCommand
        'Get form fields
        Dim ddlOccupancy As DropDownList = CType(e.Item.FindControl("ddlOccupancy"), DropDownList)
        Dim txtConValue As TextBox = CType(e.Item.FindControl("txtConValue"), TextBox)
        Dim txtBuildValue As TextBox = CType(e.Item.FindControl("txtBuildValue"), TextBox)
        Dim ddlLocation As DropDownList = CType(e.Item.FindControl("ddlLocation"), DropDownList)
        Dim ddlExterior As DropDownList = CType(e.Item.FindControl("ddlExterior"), DropDownList)
        Dim ddlFireClass As DropDownList = CType(e.Item.FindControl("ddlFireClass"), DropDownList)
        Dim txtFireDistrict As TextBox = CType(e.Item.FindControl("txtFireDistrict"), TextBox)
        Dim ddlInterior As DropDownList = CType(e.Item.FindControl("ddlInterior"), DropDownList)
        Dim txtSqFeet As TextBox = CType(e.Item.FindControl("txtSqFeet"), TextBox)

        'Assign Parameters
        odsAllBuilding.UpdateParameters("Buildnumber").DefaultValue = dlstBuild.DataKeys(e.Item.ItemIndex).ToString()
        odsAllBuilding.UpdateParameters("BuildOccupancy").DefaultValue = ddlOccupancy.SelectedValue
        odsAllBuilding.UpdateParameters("Locnum").DefaultValue = ddlLocation.SelectedValue
        odsAllBuilding.UpdateParameters("Buildvalue").DefaultValue = txtBuildValue.Text
        odsAllBuilding.UpdateParameters("Contentvalue").DefaultValue = txtConValue.Text
        odsAllBuilding.UpdateParameters("ExtConstr").DefaultValue = ddlExterior.SelectedValue
        odsAllBuilding.UpdateParameters("IntConstr").DefaultValue = ddlInterior.SelectedValue
        odsAllBuilding.UpdateParameters("SqFeet").DefaultValue = txtSqFeet.Text
        odsAllBuilding.UpdateParameters("Fireclass").DefaultValue = ddlFireClass.SelectedValue
        odsAllBuilding.UpdateParameters("firedistrict").DefaultValue = txtFireDistrict.Text

        'Call ObjectDataSource

        odsAllBuilding.Update()
        dlstBuild.EditItemIndex = -1

    End Sub

    Protected Sub dlstBuild_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstBuild.CancelCommand
        dlstBuild.EditItemIndex = -1
        dlstBuild.DataBind()
    End Sub

    Protected Sub dlstBuild_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstBuild.DeleteCommand
        'Assign parameters
        odsAllBuilding.DeleteParameters("Buildnumber").DefaultValue = dlstBuild.DataKeys(e.Item.ItemIndex).ToString()

        'Call odsAllBuilding Delete
        odsAllBuilding.Delete()
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

    Protected Sub odsGeneralInfo_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles odsGeneralInfo.Inserting

    End Sub

    Protected Sub chbCarrier_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chbCarrier.CheckedChanged

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

    Protected Sub ddEBLliab_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        If ddEBLliab.SelectedValue = "0" Then
            '    rfvFTEmp.Enabled = False
            '    txtFTEmp.Text = String.Empty
            'Else
            '    rfvFTEmp.Enabled = True
        End If
    End Sub

    Protected Sub rbPropertiesList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbPropertiesList.SelectedIndexChanged
        'Index 6 -Underwritting
        If rbPropertiesList.SelectedValue = "Yes" Then
            txtPropOwner.Text = String.Empty
            txtPropOwner.ReadOnly = True
        ElseIf rbPropertiesList.SelectedValue = "No" Then
            txtPropOwner.Text = String.Empty
            txtPropOwner.ReadOnly = False
            rfvPropOwner.Enabled = True
        End If
    End Sub

    Protected Sub rbActiveSchool_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbActiveSchool.SelectedIndexChanged
        'Index 6 -Underwritting
        If rbActiveSchool.SelectedValue = "Yes" Then
            txtSchoolKids.Text = String.Empty
            txtSchoolKids.ReadOnly = False
            rfvSchoolKids.Enabled = True
        ElseIf rbActiveSchool.SelectedValue = "No" Then
            txtSchoolKids.Text = String.Empty
            txtSchoolKids.ReadOnly = True
        End If
    End Sub

    Protected Sub rbCemeteryLoc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbCemeteryLoc.SelectedIndexChanged
        'Index 6 -Underwritting
        If rbCemeteryLoc.SelectedValue = "Yes" Then
            txtCemeteryAddress.Text = String.Empty
            txtCemeteryAddress.ReadOnly = True
        ElseIf rbCemeteryLoc.SelectedValue = "No" Then
            txtCemeteryAddress.Text = String.Empty
            txtCemeteryAddress.ReadOnly = False
            rfvCemeteryAddress.Enabled = True
        End If
    End Sub

    Protected Sub rbUnderLoss_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbUnderLoss.SelectedIndexChanged
        If rbUnderLoss.SelectedValue = "No" Then
            'Panel1.Enabled = False
            txtLossDate7a.Text = String.Empty
            txtLossDescr7a.Text = String.Empty
            txtLossAmt7a.Text = String.Empty
            txtLossDate7b.Text = String.Empty
            txtLossDescr7b.Text = String.Empty
            txtLossAmt7b.Text = String.Empty
            txtLossDate7c.Text = String.Empty
            txtLossDescr7c.Text = String.Empty
            txtLossAmt7c.Text = String.Empty
            txtLossDate7d.Text = String.Empty
            txtLossDescr7d.Text = String.Empty
            txtLossAmt7d.Text = String.Empty
            txtLossDate7e.Text = String.Empty
            txtLossDescr7e.Text = String.Empty
            txtLossAmt7e.Text = String.Empty
        End If

        If rbUnderLoss.SelectedValue = "Yes" Then
            'Panel1.Enabled = True
            txtLossDate7a.Focus()
            rfvLossDate7a.Enabled = True
            rfvLossDescr7a.Enabled = True
            rfvLossAmt7a.Enabled = True
        End If
    End Sub

    Protected Sub rbAllegations_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbAllegations.SelectedIndexChanged
        'Index 7
        If rbAllegations.SelectedValue = "Yes" Then
            txtExplain.Enabled = True
            txtExplain.ReadOnly = False
            txtExplain.Focus()
            txtExplain.Text = String.Empty
            txtExplain.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            rfvExplain.Enabled = True
        ElseIf rbAllegations.SelectedValue = "No" Then
            txtExplain.Enabled = True
            txtExplain.ReadOnly = True
            txtExplain.Text = "Blank"
            txtExplain.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;Color:silver;")
            rfvExplain.Enabled = False
        End If
    End Sub

    Protected Sub rbCharges_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbCharges.SelectedIndexChanged
        'Index 8
        If rbCharges.SelectedValue = "Yes" Then
            txtExplainCharges.Enabled = True
            txtExplainCharges.ReadOnly = False
            txtExplainCharges.Focus()
            txtExplainCharges.Text = String.Empty
            txtExplainCharges.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            rfvExplainCharges.Enabled = True
        ElseIf rbCharges.SelectedValue = "No" Then
            txtExplainCharges.Enabled = True
            txtExplainCharges.Text = "Blank"
            txtExplainCharges.ReadOnly = True
            txtExplainCharges.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;Color:silver;")
        End If
    End Sub

    Protected Sub rbLostCoverage_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbLostCoverage.SelectedIndexChanged
        'Index 9
        If rbLostCoverage.SelectedValue = "Yes" Then
            txtExplainLosses.Enabled = True
            txtExplainLosses.ReadOnly = False
            txtExplainLosses.Focus()
            txtExplainLosses.Text = String.Empty
            txtExplainLosses.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;")
            rfvExpLoss.Enabled = True
        ElseIf rbLostCoverage.SelectedValue = "No" Then
            txtExplainLosses.Enabled = True
            txtExplainLosses.Text = "Blank"
            txtExplainLosses.ReadOnly = True
            txtExplainLosses.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;color:silver;")
        End If
    End Sub

    Protected Sub rbDrugTest_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbDrugTest.SelectedIndexChanged
        'Index 10
        If rbDrugTest.SelectedValue = "Yes" Then
            rfvDrugs.Enabled = True
            '    txtDrugs.Enabled = True
            '    txtDrugs.ReadOnly = False
            '    txtDrugs.Focus()
            '    txtDrugs.Text = String.Empty
            '    txtDrugs.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;")
            '    'Place a require validator here
        ElseIf rbDrugTest.SelectedValue = "No" Then
            '    txtDrugs.Enabled = True
            txtDrugs.Text = String.Empty
            '    txtDrugs.ReadOnly = True
            '    txtDrugs.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;Color:silver;")
        End If
    End Sub

    Protected Sub rbPraticeClaims_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbPraticeClaims.SelectedIndexChanged
        'Index 10
        If rbPraticeClaims.SelectedValue = "Yes" Then
            rfvExtra.Enabled = True
            '    txtExtra.Enabled = True
            '    txtExtra.ReadOnly = False
            '    txtExtra.Focus()
            '    txtExtra.Text = String.Empty
            '    txtExtra.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;")
            '    'Place a require validator here
        ElseIf rbPraticeClaims.SelectedValue = "No" Then
            '    txtExtra.Enabled = True
            txtExtra.Text = String.Empty
            '    txtExtra.ReadOnly = True
            '    txtExtra.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;color:silver;")
        End If
    End Sub

    Protected Sub rbRiseClaim_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbRiseClaim.SelectedIndexChanged
        'Index 10
        If rbRiseClaim.SelectedValue = "Yes" Then
            rfvClaim.Enabled = True
            '    txtClaim.Enabled = True
            '    txtClaim.ReadOnly = False
            '    txtClaim.Focus()
            '    txtClaim.Text = String.Empty
            '    txtClaim.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;")
        ElseIf rbRiseClaim.SelectedValue = "No" Then
            '    txtClaim.Enabled = True
            txtClaim.Text = String.Empty
            '    txtClaim.ReadOnly = True
            '    txtClaim.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;color:silver;")
        End If
    End Sub

    Protected Sub rbPriorCoverage_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbPriorCoverage.SelectedIndexChanged
        'Index 10
        If rbPriorCoverage.SelectedValue = "Yes" Then
            rfvCancelled.Enabled = True
            '    txtCancelled.Enabled = True
            '    txtCancelled.ReadOnly = False
            '    txtCancelled.Focus()
            '    txtCancelled.Text = String.Empty
            '    txtCancelled.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;")
        ElseIf rbPriorCoverage.SelectedValue = "No" Then
            '    txtCancelled.Enabled = True
            txtCancelled.Text = String.Empty
            '    txtCancelled.ReadOnly = True
            '    txtCancelled.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;color:silver;")
        End If
    End Sub

    Protected Sub rbAgainSchool_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbAgainSchool.SelectedIndexChanged
        'Index 11
        If rbAgainSchool.SelectedValue = "Yes" Then
            txtExpAmountPaid.Enabled = True
            txtExpAmountPaid.ReadOnly = False
            txtExpAmountPaid.Focus()
            txtExpAmountPaid.Text = String.Empty
            txtExpAmountPaid.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;")
            rfvExpAmountPaid.Enabled = True
        ElseIf rbAgainSchool.SelectedValue = "No" Then
            txtExpAmountPaid.Enabled = True
            txtExpAmountPaid.Text = "Blank"
            txtExpAmountPaid.ReadOnly = True
            txtExpAmountPaid.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width:.07em;color:silver;")
        End If
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

    Protected Sub rbWcLoss_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbWcLoss.SelectedIndexChanged
        If rbWcLoss.SelectedValue = "Yes" Then
            'Panel4.Enabled = True
            txtLossDate14a.Focus()
            rfvLossDate14a.Enabled = True
            rfvLossDescr14a.Enabled = True
            rfvLossAmt14a.Enabled = True
        End If
    End Sub

    Protected Sub rbUmLoss_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbUmLoss.SelectedIndexChanged
        If rbWcLoss.SelectedValue = "Yes" Then
            'Panel5.Enabled = True
            txtLossDate15a.Focus()
            rfvLossDate15a.Enabled = True
            rfvLossDescr15a.Enabled = True
            rfvLossAmt15a.Enabled = True
        End If
    End Sub

    Protected Sub rbPrevPolicyList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbPrevPolicyList.SelectedIndexChanged

        If rbPrevPolicyList.SelectedValue = "Yes" Then
            rfvPrePolicyComments.Enabled = True
        End If
    End Sub

    Protected Sub StepNextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub


    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.ActiveStepChanged

    End Sub

    Protected Sub FinishButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub


End Class
