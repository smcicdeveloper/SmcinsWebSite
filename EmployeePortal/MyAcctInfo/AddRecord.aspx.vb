Imports System.Data

Partial Class Webpages_AddRecord
    Inherits System.Web.UI.Page

    Dim CustNo As Integer
    'Dim CustNo As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim txtInsured As TextBox = CType(frmNewRecord.FindControl("txtInsured"), TextBox)
        Dim ddlState As DropDownList = CType(frmNewRecord.FindControl("ddlState"), DropDownList)
        Dim ddlCounty As DropDownList = CType(frmNewRecord.FindControl("ddlCounty"), DropDownList)
        'Dim lnkAddRecord As LinkButton = CType(frmNewRecord.FindControl("lnkAddRecord"), LinkButton)
        'Dim lnkAddRecord As LinkButton = CType(frmAddContacts.FindControl("lnkAddRecord"), LinkButton)
        HiddenDate.Value = Date.Today

        If Not Page.IsPostBack Then
            grdNew.SelectedIndex = 0
            txtInsured.Focus()
        ElseIf ddlState.TabIndex = 8 Then
            ddlCounty.Focus()
            'ddlState.SelectedIndex = True
        ElseIf lnkAddRecord.TabIndex = 27 Then
            txtInsured.Focus()
        End If

    End Sub


    Protected Sub frmNewRecord_ItemInserting(sender As Object, e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles frmNewRecord.ItemInserting

    End Sub

    Protected Sub ddlState_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Dim ddlState As DropDownList = CType(frmNewRecord.FindControl("ddlState"), DropDownList)
        Dim ddlCounty As DropDownList = CType(frmNewRecord.FindControl("ddlCounty"), DropDownList)
        odsCounty.SelectParameters("State").DefaultValue = ddlState.SelectedValue
        odsCounty.Select()
        ddlCounty.DataBind()
    End Sub

    Protected Sub frmNewRecord_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles frmNewRecord.ItemInserted
        grdNew.DataBind()
    End Sub

    Protected Sub lnkAddRecord_Click(sender As Object, e As System.EventArgs)

        Dim txtInsured As TextBox = CType(frmNewRecord.FindControl("txtInsured"), TextBox)
        Dim txtContact As TextBox = CType(frmNewRecord.FindControl("txtContact"), TextBox)
        Dim txtMailAddress As TextBox = CType(frmNewRecord.FindControl("txtMailAddress"), TextBox)
        Dim txtMailCity As TextBox = CType(frmNewRecord.FindControl("txtMailCity"), TextBox)
        Dim ddlMailState As DropDownList = CType(frmNewRecord.FindControl("ddlMailState"), DropDownList)
        Dim txtMailZip As TextBox = CType(frmNewRecord.FindControl("txtMailZip"), TextBox)
        Dim txtLocation As TextBox = CType(frmNewRecord.FindControl("txtLocation"), TextBox)
        Dim ddlState As DropDownList = CType(frmNewRecord.FindControl("ddlState"), DropDownList)
        Dim ddlCounty As DropDownList = CType(frmNewRecord.FindControl("ddlCounty"), DropDownList)
        Dim txtChurchEmail As TextBox = CType(frmNewRecord.FindControl("txtChurchEmail"), TextBox)
        Dim ddlCheckOutBy As DropDownList = CType(frmNewRecord.FindControl("ddlCheckOutBY"), DropDownList)
        Dim ddlAgency As DropDownList = CType(frmNewRecord.FindControl("ddlAgency"), DropDownList)
        Dim ActionDate1 As HtmlInputText = CType(frmNewRecord.FindControl("ActionDate1"), HtmlInputText)
        Dim ddlPolicyDesc1 As DropDownList = CType(frmNewRecord.FindControl("ddlPolicyDesc1"), DropDownList)
        Dim ActionDate2 As HtmlInputText = CType(frmNewRecord.FindControl("ActionDate2"), HtmlInputText)
        Dim ddlPolicyDesc2 As DropDownList = CType(frmNewRecord.FindControl("ddlPolicyDesc2"), DropDownList)
        Dim ActionDate3 As HtmlInputText = CType(frmNewRecord.FindControl("ActionDate3"), HtmlInputText)
        Dim ddlPolicyDesc3 As DropDownList = CType(frmNewRecord.FindControl("ddlPolicyDesc3"), DropDownList)
        Dim ActionDate4 As HtmlInputText = CType(frmNewRecord.FindControl("ActionDate4"), HtmlInputText)
        Dim ddlPolicyDesc4 As DropDownList = CType(frmNewRecord.FindControl("ddlPolicyDesc4"), DropDownList)
        Dim ActionDate5 As HtmlInputText = CType(frmNewRecord.FindControl("ActionDate5"), HtmlInputText)
        Dim ddlPolicyDesc5 As DropDownList = CType(frmNewRecord.FindControl("ddlPolicyDesc5"), DropDownList)
        Dim txtContactName As TextBox = CType(frmAddContacts.FindControl("txtContactName"), TextBox)
        Dim txtContactNumber As TextBox = CType(frmAddContacts.FindControl("txtContactNumber"), TextBox)
        Dim txtCellPhone As TextBox = CType(frmAddContacts.FindControl("txtCellPhone"), TextBox)
        Dim txtEmail As TextBox = CType(frmAddContacts.FindControl("txtEmail"), TextBox)
        Dim ddlDepartment As DropDownList = CType(frmAddContacts.FindControl("ddlDepartment"), DropDownList)
        Dim txtNotes As TextBox = CType(frmAddContacts.FindControl("txtNotes"), TextBox)

        srcAddRecord.InsertParameters("InsuredName").DefaultValue = txtInsured.Text
        srcAddRecord.InsertParameters("Contact").DefaultValue = txtContact.Text
        srcAddRecord.InsertParameters("MailAddress").DefaultValue = txtMailAddress.Text
        srcAddRecord.InsertParameters("MailCity").DefaultValue = txtMailCity.Text
        srcAddRecord.InsertParameters("MailState").DefaultValue = ddlMailState.Text
        srcAddRecord.InsertParameters("MailZip").DefaultValue = txtMailZip.Text
        srcAddRecord.InsertParameters("Location").DefaultValue = txtLocation.Text
        srcAddRecord.InsertParameters("State").DefaultValue = ddlState.SelectedValue
        srcAddRecord.InsertParameters("County").DefaultValue = ddlCounty.SelectedValue
        srcAddRecord.InsertParameters("ChurchEmail").DefaultValue = txtChurchEmail.Text
        srcAddRecord.InsertParameters("file_location").DefaultValue = ddlCheckOutBy.SelectedValue
        srcAddRecord.InsertParameters("Agency").DefaultValue = ddlAgency.SelectedValue
        srcAddRecord.InsertParameters("EffDate1").DefaultValue = ActionDate1.Value
        srcAddRecord.InsertParameters("Desc1").DefaultValue = ddlPolicyDesc1.SelectedValue
        srcAddRecord.InsertParameters("EffDate2").DefaultValue = ActionDate2.Value
        srcAddRecord.InsertParameters("Desc2").DefaultValue = ddlPolicyDesc2.SelectedValue
        srcAddRecord.InsertParameters("EffDate3").DefaultValue = ActionDate3.Value
        srcAddRecord.InsertParameters("Desc3").DefaultValue = ddlPolicyDesc3.SelectedValue
        srcAddRecord.InsertParameters("EffDate4").DefaultValue = ActionDate4.Value
        srcAddRecord.InsertParameters("Desc4").DefaultValue = ddlPolicyDesc4.SelectedValue
        srcAddRecord.InsertParameters("EffDate5").DefaultValue = ActionDate5.Value
        srcAddRecord.InsertParameters("Desc5").DefaultValue = ddlPolicyDesc5.SelectedValue
        srcAddRecord.InsertParameters("Action1").DefaultValue = " "
        srcAddRecord.InsertParameters("Action1Day").DefaultValue = " "
        srcAddRecord.InsertParameters("Action2").DefaultValue = " "
        srcAddRecord.InsertParameters("Action2Day").DefaultValue = " "
        srcAddRecord.InsertParameters("Action3").DefaultValue = " "
        srcAddRecord.InsertParameters("Action3Day").DefaultValue = " "
        srcAddRecord.InsertParameters("Action4").DefaultValue = " "
        srcAddRecord.InsertParameters("Action4Day").DefaultValue = " "
        srcAddRecord.InsertParameters("Action5").DefaultValue = " "
        srcAddRecord.InsertParameters("Action5Day").DefaultValue = " "
        srcAddRecord.InsertParameters("Comments").DefaultValue = " "
        srcAddRecord.InsertParameters("CustStatus").DefaultValue = "ACTIVE"
        srcAddRecord.InsertParameters("Proxy").DefaultValue = " "
        srcAddRecord.InsertParameters("Today").DefaultValue = Date.Today
        srcAddRecord.InsertParameters("Empnum").DefaultValue = CStr(Session("UserNameIs"))
        srcAddRecord.Insert()

        srcAddContact.InsertParameters("custnum").DefaultValue = CustNo.ToString
        srcAddContact.InsertParameters("fullname").DefaultValue = txtContactName.Text
        srcAddContact.InsertParameters("churchnum").DefaultValue = txtContactNumber.Text
        srcAddContact.InsertParameters("cellphone").DefaultValue = txtCellPhone.Text
        srcAddContact.InsertParameters("email").DefaultValue = txtEmail.Text
        srcAddContact.InsertParameters("departmentid").DefaultValue = ddlDepartment.SelectedValue
        srcAddContact.InsertParameters("notes").DefaultValue = txtNotes.Text
        srcAddContact.Insert()
        grdNew.DataBind()

    End Sub

    Protected Sub lnkAddRecord_Load(sender As Object, e As System.EventArgs) Handles lnkAddRecord.Load
        'Dim rfvFullName As RequiredFieldValidator = CType(frmAddContacts.FindControl("rfvFullName"), RequiredFieldValidator)
        'rfvFullName.Enabled = False
    End Sub

    Protected Sub srcAddRecord_Inserted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles srcAddRecord.Inserted
        'CustNo = e.OutputParameters("CustNum").ToString
        'CustNo = Convert.ToInt32(e.ReturnValue("custno"))
        'CustNo = e.OutputParameters.Values("custnum").ToString
        'CustNo = e.OutputParameters.Values(e.ReturnValue("custnum"))
        CustNo = Convert.ToInt32(e.ReturnValue).ToString()
    End Sub

End Class
