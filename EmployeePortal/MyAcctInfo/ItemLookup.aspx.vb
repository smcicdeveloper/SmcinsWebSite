Option Explicit On
Option Strict On
Option Infer On

Imports System
Imports System.Web
Imports System.Web.Services
Imports System.IO
Imports System.Collections.Generic
Imports System.Web.Configuration
Imports System.Linq
Imports System.Data.Linq
Imports System.Data.SqlClient
Imports System.Web.UI.HtmlControls



Partial Class Webpages_ItemLookup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            dlstRecord.Visible = False
        End If

        txtSearchBox.Focus()

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        Dim x As String = ace1Value.Value
        x.ToString()
        dlstRecord.DataKeyField = "cust_no"
        srcGetRecord.Select()
        ' dlstRecord.EditItemIndex = -1
        dlstRecord.DataBind()
        dlstRecord.Visible = True
    End Sub

    Protected Sub dlstRecord_EditCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.EditCommand
        Dim ddlCheckOut As DropDownList = CType(dlstRecord.FindControl("ddlCheckOut"), DropDownList)
        dlstRecord.EditItemIndex = e.Item.ItemIndex
        dlstRecord.DataBind()
    End Sub

    Protected Sub dlstRecord_CancelCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.CancelCommand
        dlstRecord.EditItemIndex = -1
        dlstRecord.DataBind()
    End Sub

    Protected Sub dlstRecord_UpdateCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.UpdateCommand
        ''Get form fields
        Dim txtCustNo As TextBox = CType(e.Item.FindControl("txtCustNo"), TextBox)
        Dim txtStatus As TextBox = CType(e.Item.FindControl("txtStatus"), TextBox)
        Dim ddlStatus As DropDownList = CType(e.Item.FindControl("ddlStatus"), DropDownList)
        Dim txtProxy As TextBox = CType(e.Item.FindControl("txtProxy"), TextBox)
        Dim txtInsured As TextBox = CType(e.Item.FindControl("txtInsured"), TextBox)
        Dim txtContact As TextBox = CType(e.Item.FindControl("txtContact"), TextBox)
        Dim txtMailAddress As TextBox = CType(e.Item.FindControl("txtMailAddress"), TextBox)
        Dim txtMailCity As TextBox = CType(e.Item.FindControl("txtMailCity"), TextBox)
        Dim ddlMailState As DropDownList = CType(e.Item.FindControl("ddlMailState"), DropDownList)
        Dim txtMailZip As TextBox = CType(e.Item.FindControl("txtMailZip"), TextBox)
        Dim txtLocation As TextBox = CType(e.Item.FindControl("txtLocation"), TextBox)
        Dim ddlState As DropDownList = CType(e.Item.FindControl("ddlState"), DropDownList)
        'Dim txtZip As TextBox = CType(e.Item.FindControl("txtZip"), TextBox)
        Dim txtCounty As TextBox = CType(e.Item.FindControl("txtCounty"), TextBox)
        Dim ddlCheckOut As DropDownList = CType(e.Item.FindControl("ddlCheckOut"), DropDownList)
        Dim txtContactName As TextBox = CType(e.Item.FindControl("txtContactName"), TextBox)
        Dim txtContactNumber As TextBox = CType(e.Item.FindControl("txtContactNumber"), TextBox)
        Dim txtAgency As TextBox = CType(e.Item.FindControl("txtAgency"), TextBox)
        Dim ddlAgency As DropDownList = CType(e.Item.FindControl("ddlAgency"), DropDownList)
        Dim txtEffDate1 As TextBox = CType(e.Item.FindControl("txtEffDate1"), TextBox)
        Dim txtPolicyDesc1 As TextBox = CType(e.Item.FindControl("txtPolicyDesc1"), TextBox)
        Dim txtEffDate2 As TextBox = CType(e.Item.FindControl("txtEffDate2"), TextBox)
        Dim txtPolicyDesc2 As TextBox = CType(e.Item.FindControl("txtPolicyDesc2"), TextBox)
        Dim txtEffDate3 As TextBox = CType(e.Item.FindControl("txtEffDate3"), TextBox)
        Dim txtPolicyDesc3 As TextBox = CType(e.Item.FindControl("txtPolicyDesc3"), TextBox)
        Dim txtEffDate4 As TextBox = CType(e.Item.FindControl("txtEffDate4"), TextBox)
        Dim txtPolicyDesc4 As TextBox = CType(e.Item.FindControl("txtPolicyDesc4"), TextBox)
        Dim txtEffDate5 As TextBox = CType(e.Item.FindControl("txtEffDate5"), TextBox)
        Dim txtPolicyDesc5 As TextBox = CType(e.Item.FindControl("txtPolicyDesc5"), TextBox)
        Dim ddlAction1 As DropDownList = CType(e.Item.FindControl("ddlAction1"), DropDownList)
        Dim ActionDate1 As HtmlInputText = CType(e.Item.FindControl("ActionDate1"), HtmlInputText)
        Dim calEventDate As Calendar = CType(e.Item.FindControl("calEventDate"), Calendar)
        Dim txtComment As TextBox = CType(e.Item.FindControl("txtComment"), TextBox)
        Dim ddlAction2 As DropDownList = CType(e.Item.FindControl("ddlAction2"), DropDownList)
        Dim ActionDate2 As HtmlInputText = CType(e.Item.FindControl("ActionDate2"), HtmlInputText)
        Dim ddlAction3 As DropDownList = CType(e.Item.FindControl("ddlAction3"), DropDownList)
        Dim ActionDate3 As HtmlInputText = CType(e.Item.FindControl("ActionDate3"), HtmlInputText)
        Dim ddlAction4 As DropDownList = CType(e.Item.FindControl("ddlAction4"), DropDownList)
        Dim ActionDate4 As HtmlInputText = CType(e.Item.FindControl("ActionDate4"), HtmlInputText)
        Dim ddlAction5 As DropDownList = CType(e.Item.FindControl("ddlAction5"), DropDownList)
        Dim ActionDate5 As HtmlInputText = CType(e.Item.FindControl("ActionDate5"), HtmlInputText)
        ''Assign parameters
        srcGetRecord.UpdateParameters("CustNo").DefaultValue = dlstRecord.DataKeys(e.Item.ItemIndex).ToString()

        If ddlStatus.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("CustStatus").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("CustStatus").DefaultValue = ddlStatus.Text.Trim().ToUpper
        End If

        If txtProxy.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ProxyInit").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ProxyInit").DefaultValue = txtProxy.Text.Trim().ToUpper
        End If

        If txtInsured.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("InsuredName").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("InsuredName").DefaultValue = txtInsured.Text.Trim().ToUpper
        End If

        If txtContact.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Contact").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Contact").DefaultValue = txtContact.Text.Trim().ToUpper
        End If
        If txtMailAddress.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailAddress").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailAddress").DefaultValue = txtMailAddress.Text.Trim().ToUpper
        End If

        If txtMailCity.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailCity").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailCity").DefaultValue = txtMailCity.Text.Trim().ToUpper
        End If

        If ddlMailState.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailState").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailState").DefaultValue = ddlMailState.Text.Trim().ToUpper
        End If

        If txtMailZip.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("MailZip").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("MailZip").DefaultValue = txtMailZip.Text.Trim()
        End If

        If txtCounty.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("County").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("County").DefaultValue = txtCounty.Text.Trim().ToUpper
        End If

        If txtLocation.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Location").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Location").DefaultValue = txtLocation.Text.Trim().ToUpper
        End If

        If ddlState.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("State").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("State").DefaultValue = ddlState.Text.Trim().ToUpper
        End If

        'If txtZip.Text.Trim.Length = 0 Then
        '    srcGetRecord.UpdateParameters("Zip").DefaultValue = " "
        'Else
        '    srcGetRecord.UpdateParameters("Zip").DefaultValue = txtZip.Text.Trim()
        'End If

        If ddlCheckOut.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("file_location").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("file_location").DefaultValue = ddlCheckOut.Text.Trim()
        End If

        If txtContactName.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ContactName").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ContactName").DefaultValue = txtContactName.Text.Trim().ToUpper
        End If

        If txtContactNumber.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ContactNumber").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ContactNumber").DefaultValue = txtContactNumber.Text
        End If

        If ddlAgency.Text.Trim.Length = 0 Then

            srcGetRecord.UpdateParameters.Add("AgencyNumber", " ")
        Else

            srcGetRecord.UpdateParameters.Add("AgencyNumber", ddlAgency.SelectedValue)
        End If

        If txtEffDate1.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate1").DefaultValue = txtEffDate1.Text.Trim()
        End If

        If txtPolicyDesc1.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc1").DefaultValue = txtPolicyDesc1.Text.Trim().ToUpper
        End If

        If txtEffDate2.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate2").DefaultValue = txtEffDate2.Text.Trim()
        End If
        If txtPolicyDesc2.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc2").DefaultValue = txtPolicyDesc2.Text.Trim().ToUpper
        End If

        If txtEffDate3.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate3").DefaultValue = txtEffDate3.Text
        End If

        If txtPolicyDesc3.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc3").DefaultValue = txtPolicyDesc3.Text.Trim().ToUpper
        End If

        If txtEffDate4.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate4").DefaultValue = txtEffDate4.Text.Trim()
        End If

        If txtPolicyDesc4.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc4").DefaultValue = txtPolicyDesc4.Text.ToUpper
        End If

        If txtEffDate5.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("EffDate5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("EffDate5").DefaultValue = txtEffDate5.Text.Trim()
        End If

        If txtPolicyDesc5.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Desc5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Desc5").DefaultValue = txtPolicyDesc5.Text.Trim().ToUpper
        End If

        If ddlAction1.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action1").DefaultValue = ddlAction1.Text.Trim().ToUpper
        End If

        If ActionDate1.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate1").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate1").DefaultValue = ActionDate1.Value.Trim()
        End If

        If ddlAction2.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action2").DefaultValue = ddlAction2.Text.Trim().ToUpper
        End If

        If ActionDate2.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate2").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate2").DefaultValue = ActionDate2.Value.Trim()
        End If

        '
        If ddlAction3.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action3").DefaultValue = ddlAction3.Text.Trim().ToUpper
        End If

        If ActionDate3.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate3").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate3").DefaultValue = ActionDate3.Value.Trim()
        End If

        '
        If ddlAction4.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action4").DefaultValue = ddlAction4.Text.Trim().ToUpper
        End If

        If ActionDate4.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate4").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate4").DefaultValue = ActionDate4.Value.Trim()
        End If

        '
        If ddlAction5.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Action5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Action5").DefaultValue = ddlAction5.Text.Trim().ToUpper
        End If

        If ActionDate5.Value.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("ActionDate5").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("ActionDate5").DefaultValue = ActionDate5.Value.Trim()
        End If

        If txtComment.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Comments").DefaultValue = " "
        Else
            srcGetRecord.UpdateParameters("Comments").DefaultValue = txtComment.Text.Trim()
        End If

        'System.Threading.Thread.Sleep(6000)

        'Call DataSource
        srcGetRecord.Update()

        'Take out of Edit mode
        dlstRecord.EditItemIndex = -1

    End Sub

    Protected Sub btnClear_Click(sender As Object, e As System.EventArgs) Handles btnClear.Click
        dlstRecord.EditItemIndex = -1
        ace1Value.Value = String.Empty
        txtSearchBox.Text = String.Empty
        dlstRecord.DataKeyField = "cust_no"
        srcGetRecord.Select()
        dlstRecord.DataBind()
    End Sub

    'Protected Sub calEventDate_SelectionChanged(sender As Object, e As System.EventArgs)
    '    Dim txtActionDate1 As TextBox = DirectCast(dlstRecord.Items(0).FindControl("txtActionDate1"), TextBox)
    '    Dim calEventDate As Calendar = CType(dlstRecord.Items(0).FindControl("calEventDate"), Calendar)
    '    txtActionDate1.Text = calEventDate.SelectedDate.ToString("d")
    'End Sub

    Protected Sub dlstRecord_DeleteCommand(source As Object, e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstRecord.DeleteCommand
        srcGetRecord.DeleteParameters("cust_no").DefaultValue = dlstRecord.DataKeys(e.Item.ItemIndex).ToString()
        srcGetRecord.Delete()
        dlstRecord.DataBind()
        txtSearchBox.Text = ""
    End Sub
End Class
