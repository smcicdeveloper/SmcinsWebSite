'Option Explicit On
'Option Strict On
'Option Infer On

Imports System
Imports System.Web
Imports System.Web.Services
Imports System.IO
Imports System.Collections.Generic
Imports System.Web.Configuration
'Imports System.Linq
'Imports System.Data.Linq
Imports System.Data.SqlClient
Imports System.Web.UI.HtmlControls

Partial Class emptools_MyAcctInfo_Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            dlstRecord.Visible = False
        End If
        'This will make the cursor always appear on top of page after each dlstRecord.DataBind()
        'txtSearchBox.Focus()
        'If mpe1. = True Then
        'End If

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        Dim x As String = ace1Value.Value
        dlstRecord.DataKeyField = "cust_no"
        srcGetRecord.Select()
        dlstRecord.DataBind()
        dlstRecord.Visible = True
    End Sub

    Protected Sub dlstRecord_EditCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.EditCommand
        dlstRecord.EditItemIndex = e.Item.ItemIndex
        dlstRecord.DataBind()
    End Sub

    Protected Sub dlstRecord_CancelCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.CancelCommand
        dlstRecord.EditItemIndex = -1
        dlstRecord.DataBind()
    End Sub

    Protected Sub dlstRecord_Load(sender As Object, e As System.EventArgs) Handles dlstRecord.Load
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False
    End Sub

    Protected Sub dlstRecord_UpdateCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.UpdateCommand
        ''Get form fields
        Dim txtCustNoEdit As TextBox = CType(e.Item.FindControl("txtCustNoEdit"), TextBox)
        Dim txtStatusEdit As TextBox = CType(e.Item.FindControl("txtStatusEdit"), TextBox)
        Dim ddlStatusEdit As DropDownList = CType(e.Item.FindControl("ddlStatusEdit"), DropDownList)
        Dim dllProxyEdit As DropDownList = CType(e.Item.FindControl("ddlProxyEdit"), DropDownList)
        Dim txtInsuredEdit As TextBox = CType(e.Item.FindControl("txtInsuredEdit"), TextBox)
        Dim txtContactEdit As TextBox = CType(e.Item.FindControl("txtContactEdit"), TextBox)
        Dim txtMailAddressEdit As TextBox = CType(e.Item.FindControl("txtMailAddressEdit"), TextBox)
        Dim txtMailCityEdit As TextBox = CType(e.Item.FindControl("txtMailCityEdit"), TextBox)
        Dim ddlMailStateEdit As DropDownList = CType(e.Item.FindControl("ddlMailStateEdit"), DropDownList)
        Dim txtMailZipEdit As TextBox = CType(e.Item.FindControl("txtMailZipEdit"), TextBox)
        Dim txtLocationEdit As TextBox = CType(e.Item.FindControl("txtLocationEdit"), TextBox)
        Dim ddlStateEdit As DropDownList = CType(e.Item.FindControl("ddlStateEdit"), DropDownList)
        'Dim txtZip As TextBox = CType(e.Item.FindControl("txtZip"), TextBox)
        Dim txtCountyEdit As TextBox = CType(e.Item.FindControl("txtCountyEdit"), TextBox)
        Dim ddlCheckOutEdit As DropDownList = CType(e.Item.FindControl("ddlCheckOutEdit"), DropDownList)
        'Dim txtContactNameEdit As TextBox = CType(e.Item.FindControl("txtContactNameEdit"), TextBox)
        'Dim txtContactNumberEdit As TextBox = CType(e.Item.FindControl("txtContactNumberEdit"), TextBox)
        Dim txtChurchEmailEdit As TextBox = CType(e.Item.FindControl("txtChurchEmailEdit"), TextBox)
        Dim txtAgencyEdit As TextBox = CType(e.Item.FindControl("txtAgencyEdit"), TextBox)
        Dim ddlAgencyEdit As DropDownList = CType(e.Item.FindControl("ddlAgencyEdit"), DropDownList)
        Dim txtEffDate1Edit As TextBox = CType(e.Item.FindControl("txtEffDate1Edit"), TextBox)
        Dim txtPolicyDesc1Edit As TextBox = CType(e.Item.FindControl("txtPolicyDesc1Edit"), TextBox)
        Dim txtEffDate2Edit As TextBox = CType(e.Item.FindControl("txtEffDate2Edit"), TextBox)
        Dim txtPolicyDesc2Edit As TextBox = CType(e.Item.FindControl("txtPolicyDesc2Edit"), TextBox)
        Dim txtEffDate3Edit As TextBox = CType(e.Item.FindControl("txtEffDate3Edit"), TextBox)
        Dim txtPolicyDesc3Edit As TextBox = CType(e.Item.FindControl("txtPolicyDesc3Edit"), TextBox)
        Dim txtEffDate4Edit As TextBox = CType(e.Item.FindControl("txtEffDate4Edit"), TextBox)
        Dim txtPolicyDesc4Edit As TextBox = CType(e.Item.FindControl("txtPolicyDesc4Edit"), TextBox)
        Dim txtEffDate5Edit As TextBox = CType(e.Item.FindControl("txtEffDate5Edit"), TextBox)
        Dim txtPolicyDesc5Edit As TextBox = CType(e.Item.FindControl("txtPolicyDesc5Edit"), TextBox)
        Dim ddlAction1Edit As DropDownList = CType(e.Item.FindControl("ddlAction1Edit"), DropDownList)
        Dim ActionDate1Edit As HtmlInputText = CType(e.Item.FindControl("ActionDate1Edit"), HtmlInputText)
        Dim calEventDateEdit As Calendar = CType(e.Item.FindControl("calEventDateEdit"), Calendar)
        Dim txtCommentEdit As TextBox = CType(e.Item.FindControl("txtCommentEdit"), TextBox)
        Dim ddlAction2Edit As DropDownList = CType(e.Item.FindControl("ddlAction2Edit"), DropDownList)
        Dim ActionDate2Edit As HtmlInputText = CType(e.Item.FindControl("ActionDate2Edit"), HtmlInputText)
        Dim ddlAction3Edit As DropDownList = CType(e.Item.FindControl("ddlAction3Edit"), DropDownList)
        Dim ActionDate3Edit As HtmlInputText = CType(e.Item.FindControl("ActionDate3Edit"), HtmlInputText)
        Dim ddlAction4Edit As DropDownList = CType(e.Item.FindControl("ddlAction4Edit"), DropDownList)
        Dim ActionDate4Edit As HtmlInputText = CType(e.Item.FindControl("ActionDate4Edit"), HtmlInputText)
        Dim ddlAction5Edit As DropDownList = CType(e.Item.FindControl("ddlAction5Edit"), DropDownList)
        Dim ActionDate5Edit As HtmlInputText = CType(e.Item.FindControl("ActionDate5Edit"), HtmlInputText)
        ''Assign parameters
        srcGetRecord.UpdateParameters("CustNo").DefaultValue = dlstRecord.DataKeys(e.Item.ItemIndex).ToString()

        If ddlStatusEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("CustStatus").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("CustStatus").DefaultValue = ddlStatusEdit.Text.Trim().ToUpper
        End If

        If dllProxyEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("proxy_init").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("proxy_init").DefaultValue = dllProxyEdit.SelectedValue
        End If

        If txtInsuredEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("InsuredName").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("InsuredName").DefaultValue = txtInsuredEdit.Text.Trim().ToUpper
        End If

        If txtContactEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Contact").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Contact").DefaultValue = txtContactEdit.Text.Trim().ToUpper
        End If

        If txtMailAddressEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailAddress").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailAddress").DefaultValue = txtMailAddressEdit.Text.Trim().ToUpper
        End If

        If txtMailCityEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailCity").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailCity").DefaultValue = txtMailCityEdit.Text.Trim().ToUpper
        End If

        If ddlMailStateEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailState").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailState").DefaultValue = ddlMailStateEdit.Text.Trim().ToUpper
        End If

        If txtMailZipEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailZip").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailZip").DefaultValue = txtMailZipEdit.Text.Trim()
        End If

        If txtCountyEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("County").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("County").DefaultValue = txtCountyEdit.Text.Trim().ToUpper
        End If

        If txtChurchEmailEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ChurchEmail").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ChurchEmail").DefaultValue = txtChurchEmailEdit.Text.Trim().ToUpper
        End If

        If txtLocationEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Location").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Location").DefaultValue = txtLocationEdit.Text.Trim().ToUpper
        End If

        If ddlStateEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("State").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("State").DefaultValue = ddlStateEdit.Text.Trim().ToUpper
        End If

        If ddlCheckOutEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("file_location").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("file_location").DefaultValue = ddlCheckOutEdit.Text.Trim()
        End If

        'If txtContactNameEdit.Text.Trim.Length = 0 Then
        '    srcGetRecord.UpdateParameters("ContactName").DefaultValue = " "
        'Else
        '    srcGetRecord.UpdateParameters("ContactName").DefaultValue = txtContactNameEdit.Text.Trim().ToUpper
        'End If

        'If txtContactNumberEdit.Text.Trim.Length = 0 Then
        '    srcGetRecord.UpdateParameters("ContactNumber").DefaultValue = " "
        'Else
        '    srcGetRecord.UpdateParameters("ContactNumber").DefaultValue = txtContactNumberEdit.Text
        'End If

        If ddlAgencyEdit.Text.Trim.Length = 0 Then

            srcGetRecord.UpdateParameters.Add("AgencyNumber", " ")
        Else

            srcGetRecord.UpdateParameters.Add("AgencyNumber", ddlAgencyEdit.SelectedValue)
        End If

        If txtEffDate1Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate1").DefaultValue = txtEffDate1Edit.Text.Trim()
        End If

        If txtPolicyDesc1Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc1").DefaultValue = txtPolicyDesc1Edit.Text.Trim().ToUpper
        End If

        If txtEffDate2Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate2").DefaultValue = txtEffDate2Edit.Text.Trim()
        End If
        If txtPolicyDesc2Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc2").DefaultValue = txtPolicyDesc2Edit.Text.Trim().ToUpper
        End If

        If txtEffDate3Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate3").DefaultValue = txtEffDate3Edit.Text
        End If

        If txtPolicyDesc3Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc3").DefaultValue = txtPolicyDesc3Edit.Text.Trim().ToUpper
        End If

        If txtEffDate4Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate4").DefaultValue = txtEffDate4Edit.Text.Trim()
        End If

        If txtPolicyDesc4Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc4").DefaultValue = txtPolicyDesc4Edit.Text.ToUpper
        End If

        If txtEffDate5Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate5").DefaultValue = txtEffDate5Edit.Text.Trim()
        End If

        If txtPolicyDesc5Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc5").DefaultValue = txtPolicyDesc5Edit.Text.Trim().ToUpper
        End If

        If ddlAction1Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action1").DefaultValue = ddlAction1Edit.Text.Trim().ToUpper
        End If

        If ActionDate1Edit.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate1").DefaultValue = ActionDate1Edit.Value.Trim()
        End If

        If ddlAction2Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action2").DefaultValue = ddlAction2Edit.Text.Trim().ToUpper
        End If

        If ActionDate2Edit.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate2").DefaultValue = ActionDate2Edit.Value.Trim()
        End If

        '
        If ddlAction3Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action3").DefaultValue = ddlAction3Edit.Text.Trim().ToUpper
        End If

        If ActionDate3Edit.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate3").DefaultValue = ActionDate3Edit.Value.Trim()
        End If

        '
        If ddlAction4Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action4").DefaultValue = ddlAction4Edit.Text.Trim().ToUpper
        End If

        If ActionDate4Edit.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate4").DefaultValue = ActionDate4Edit.Value.Trim()
        End If

        '
        If ddlAction5Edit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action5").DefaultValue = ddlAction5Edit.Text.Trim().ToUpper
        End If

        If ActionDate5Edit.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate5").DefaultValue = ActionDate5Edit.Value.Trim()
        End If

        If txtCommentEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Comments").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Comments").DefaultValue = txtCommentEdit.Text.Trim()
        End If

        'System.Threading.Thread.Sleep(6000)

        'Call DataSource
        srcGetRecord.Update()

        'Take out of Edit mode
        dlstRecord.EditItemIndex = -1

        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False

    End Sub

    Protected Sub btnClear_Click(sender As Object, e As System.EventArgs) Handles btnClear.Click
        dlstRecord.EditItemIndex = -1
        ace1Value.Value = String.Empty
        txtSearchBox.Text = String.Empty
        dlstRecord.DataKeyField = "cust_no"
        srcGetRecord.Select()
        dlstRecord.DataBind()
    End Sub

    Protected Sub dlstRecord_DeleteCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.DeleteCommand
        srcGetRecord.DeleteParameters("cust_no").DefaultValue = dlstRecord.DataKeys(e.Item.ItemIndex).ToString()
        srcGetRecord.Delete()
        dlstRecord.DataBind()
        txtSearchBox.Text = ""
    End Sub

    Protected Sub grvEditAllCalls_Load(sender As Object, e As System.EventArgs)
        Dim gv = CType(sender, GridView)
        Dim lblDepartment As Label = CType(gv.Rows(0).FindControl("lblDepartment"), Label)
        lblDepartment.Visible = False
    End Sub

    Protected Sub dlvAddContact_ItemInserting(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dlvAddContact.ItemInserting
        srcAddContact.InsertParameters("custnum").DefaultValue = ace1Value.Value
    End Sub

    Protected Sub dlvAddContact_ItemInserted(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dlvAddContact.ItemInserted
        dlstRecord.DataBind()
    End Sub


    Protected Sub lnkAddContact_Click(sender As Object, e As System.EventArgs)
        dlvAddContact.Enabled = True
        Dim txtAddFullName As TextBox = CType(dlvAddContact.FindControl("txtAddFullName"), TextBox)
        txtAddFullName.Text = String.Empty
        Dim txtAddChurchNum As TextBox = CType(dlvAddContact.FindControl("txtAddChurchNum"), TextBox)
        txtAddChurchNum.Text = String.Empty
        Dim txtAddCellPhone As TextBox = CType(dlvAddContact.FindControl("txtAddCellPhone"), TextBox)
        txtAddCellPhone.Text = String.Empty
        Dim txtAddEmail As TextBox = CType(dlvAddContact.FindControl("txtAddEmail"), TextBox)
        txtAddEmail.Text = String.Empty
        Dim ddlDepartment As DropDownList = CType(dlvAddContact.FindControl("ddlDepartment"), DropDownList)
        ddlDepartment.SelectedValue = "1"
        Dim txtAddNotes As TextBox = CType(dlvAddContact.FindControl("txtAddNotes"), TextBox)
        txtAddNotes.Text = String.Empty
        mpe1.Show()
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = True

    End Sub

    Protected Sub lnkAddContact_Unload(sender As Object, e As System.EventArgs)
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False
    End Sub



    Protected Sub lnkButtonDeleteAll_Click(sender As Object, e As System.EventArgs)
        srcDeleteAllContacts.Delete()
    End Sub

    Protected Sub lnkButtonSave_Load(sender As Object, e As System.EventArgs)
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False
    End Sub

    Protected Sub lnkButtonUpdate_Load(sender As Object, e As System.EventArgs)
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False
    End Sub

    Protected Sub lnkCancelContact_Click(sender As Object, e As System.EventArgs)
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False
    End Sub

    Protected Sub OK_Click(sender As Object, e As System.EventArgs)
        Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        rfvAddFullName.Enabled = False
    End Sub

    Protected Sub grvEditAllCalls_RowUpdated(sender As Object, e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        dlstRecord.DataBind()
    End Sub

    Protected Sub grvEditAccounting_RowUpdated(sender As Object, e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        dlstRecord.DataBind()
    End Sub

    Protected Sub grvEditClaims_RowUpdated(sender As Object, e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        dlstRecord.DataBind()
    End Sub

    Protected Sub grvEditLossControl_RowUpdated(sender As Object, e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        dlstRecord.DataBind()
    End Sub

    Protected Sub grvEditMarketing_RowUpdated(sender As Object, e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        dlstRecord.DataBind()
    End Sub

    Protected Sub grvEditUnderwriting_RowUpdated(sender As Object, e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        dlstRecord.DataBind()
    End Sub

    Protected Sub grvEditAllCalls_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblDepartment = TryCast(e.Row.FindControl("lblDepartment"), Label)
            If lblDepartment Is Nothing Then
                'Do Nothing
            ElseIf lblDepartment.Text = "1" Then
                lblDepartment.Visible = False
            End If
        End If
    End Sub

    Protected Sub grvEditAccounting_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblDepartment = TryCast(e.Row.FindControl("lblDepartment"), Label)
            If lblDepartment Is Nothing Then
                'Do Nothing
            ElseIf lblDepartment.Text = "200" Then
                lblDepartment.Visible = False
            End If
        End If
    End Sub

    Protected Sub grvEditClaims_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblDepartment = TryCast(e.Row.FindControl("lblDepartment"), Label)
            If lblDepartment Is Nothing Then
                'Do Nothing
            ElseIf lblDepartment.Text = "500" Then
                lblDepartment.Visible = False
            End If
        End If
    End Sub

    Protected Sub grvEditLossControl_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Dim contact = TryCast(e.Row.DataItem, _ContactVariables)
            Dim lblDepartment = TryCast(e.Row.FindControl("lblDepartment"), Label)
            'Dim ddlEditDepartmentId = TryCast(e.Row.FindControl("lblDepartment"), Label)

            If lblDepartment Is Nothing Then
                'Do Nothing
            ElseIf lblDepartment.Text = "420" Then
                lblDepartment.Visible = False
            End If
        End If

    End Sub

    Protected Sub grvEditMarketing_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblDepartment = TryCast(e.Row.FindControl("lblDepartment"), Label)
            If lblDepartment Is Nothing Then
                'Do Nothing
            ElseIf lblDepartment.Text = "410" Then
                lblDepartment.Visible = False
            End If
        End If
    End Sub

    Protected Sub grvEditUnderwriting_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblDepartment = TryCast(e.Row.FindControl("lblDepartment"), Label)
            If lblDepartment Is Nothing Then
                'Do Nothing
            ElseIf lblDepartment.Text = "400" Then
                lblDepartment.Visible = False
            End If
        End If
    End Sub

    Protected Sub lnkButtonSave_Click(sender As Object, e As System.EventArgs)
        'Dim rfvAddFullName As RequiredFieldValidator = CType(dlvAddContact.FindControl("rfvAddFullName"), RequiredFieldValidator)
        'rfvAddFullName.Enabled = False
    End Sub


End Class
