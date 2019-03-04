Imports System
Imports System.Data
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports AjaxControlToolkit

Partial Class EmployeePortal_MyNewBusiness_SearchNewBusiness
    Inherits System.Web.UI.Page

    'Protected Sub Page_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
    '    For Each valControl As BaseValidator In Page.Validators
    '        Dim assControl As WebControl = Page.FindControl(valControl.ControlToValidate)
    '        If Not valControl.IsValid Then
    '            assControl.BackColor = Drawing.Color.Cyan
    '        Else
    '            assControl.BackColor = Drawing.Color.White
    '        End If
    '    Next
    'End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not (ToolkitScriptManager1.IsInAsyncPostBack) Then
            grdRecords.SelectedIndex = 0
        End If

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click

        If txtQuoteDate.Text = String.Empty And txtEffDate.Text = String.Empty And ddlAgency.SelectedValue = String.Empty And txtLocation.Text = String.Empty And txtChurchName.Text = String.Empty And txtCurrentCarrier.Text = String.Empty And ddlLossControlSearch.SelectedValue = String.Empty And txtReqNo.Text = String.Empty And ddlUnderwriterSearch.SelectedValue = String.Empty Then
            grdRecords.EmptyDataText = "No data entered."
            grdRecords.DataBind()
        Else
            grdRecords.DataSourceID = "srcNewBusiness"
            srcNewBusiness.Select()
            grdRecords.EmptyDataText = "No Match Found."
            grdRecords.DataBind()
        End If

    End Sub

    Protected Sub btnClear_Click(sender As Object, e As System.EventArgs) Handles btnClear.Click

        srcGetRecord.SelectParameters("NewBusId").DefaultValue = 0
        txtQuoteDate.Text = String.Empty
        txtEffDate.Text = String.Empty
        ddlAgency.SelectedValue = String.Empty
        txtLocation.Text = String.Empty
        txtChurchName.Text = String.Empty
        txtCurrentCarrier.Text = String.Empty
        txtReqNo.Text = String.Empty
        ddlLossControlSearch.SelectedValue = String.Empty
        ddlUnderwriterSearch.SelectedValue = String.Empty
        grdRecords.DataSourceID = "srcGetRecord"
        grdRecords.EmptyDataText = "Data cleared."

    End Sub

    Protected Sub grdRecords_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdRecords.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes("onmouseover") = "this.style.backgroundColor='aquamarine';"
            e.Row.Attributes("onmouseout") = "this.style.backgroundColor='white';"

            'srcGetRecord.SelectParameters("NewBusId").DefaultValue = grdRecords.SelectedRow.Cells(1).ToString
            'e.Row.Attributes.Add("onclick", "saveScrollPosition(); " & ClientScript.GetPostBackClientHyperlink(Me.grdRecords, "Select$" & e.Row.RowIndex))
            'e.Row.Attributes["onclick"]=ClientScript.GetPostBackEventReference(this.grdRecords,"Select$"+e.Row.RowIndex.ToString());
        End If

    End Sub

    Protected Sub frmSearch_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles frmSearch.ItemUpdated
        grdRecords.DataBind()
    End Sub

    Protected Sub frmSearch_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles frmSearch.ItemDeleted

        srcGetRecord.SelectParameters("NewBusId").DefaultValue = 0
        grdRecords.DataSourceID = "srcGetRecord"
        txtQuoteDate.Text = String.Empty
        txtEffDate.Text = String.Empty
        ddlAgency.SelectedValue = String.Empty
        txtLocation.Text = String.Empty
        txtChurchName.Text = String.Empty
        txtCurrentCarrier.Text = String.Empty
        txtReqNo.Text = String.Empty
        ddlLossControlSearch.SelectedValue = String.Empty
        ddlUnderwriterSearch.SelectedValue = String.Empty
        grdRecords.DataBind()

    End Sub

    Protected Sub frmNew_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles frmNew.ItemInserted
        grdRecords.DataBind()
    End Sub



    Protected Sub grdRecords_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles grdRecords.SelectedIndexChanged
        Dim gvrow As GridViewRow = grdRecords.SelectedRow
        Dim id As String = gvrow.Cells(1).Text.ToString()

        srcGetRecord.SelectParameters("NewBusId").DefaultValue = id

        'bind FormView
        frmSearch.DataBind()

        'show ModalPopupExtender
        mpe1.Show()
    End Sub

    Protected Sub frmNew_ItemInserting(sender As Object, e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles frmNew.ItemInserting

        Dim txtQuoteDateInsert As TextBox = CType(frmNew.FindControl("txtQuoteDateInsert"), TextBox)
        srcAddRecord.InsertParameters("QuoteDate").DefaultValue = txtQuoteDateInsert.Text

        Dim txtEffDateInsert As TextBox = CType(frmNew.FindControl("txtEffDateInsert"), TextBox)
        srcAddRecord.InsertParameters("CurrDate").DefaultValue = txtEffDateInsert.Text

        Dim txtChurchNameInsert As TextBox = CType(frmNew.FindControl("txtChurchNameInsert"), TextBox)
        srcAddRecord.InsertParameters("Church").DefaultValue = txtChurchNameInsert.Text

        Dim txtLocationInsert As TextBox = CType(frmNew.FindControl("txtLocationInsert"), TextBox)
        srcAddRecord.InsertParameters("Location").DefaultValue = txtLocationInsert.Text

        Dim ddlStateInsert As DropDownList = CType(frmNew.FindControl("ddlStateInsert"), DropDownList)
        srcAddRecord.InsertParameters("State").DefaultValue = ddlStateInsert.SelectedValue

        Dim ddlAgencyInsert As DropDownList = CType(frmNew.FindControl("ddlAgencyInsert"), DropDownList)
        srcAddRecord.InsertParameters("Agent").DefaultValue = ddlAgencyInsert.SelectedValue

        Dim ddlLossControlInsert As DropDownList = CType(frmNew.FindControl("ddlLossControlInsert"), DropDownList)
        srcAddRecord.InsertParameters("LossControl").DefaultValue = ddlLossControlInsert.SelectedValue

        Dim ddlUnderwriterInsert As DropDownList = CType(frmNew.FindControl("ddlUnderwriterInsert"), DropDownList)
        srcAddRecord.InsertParameters("UW").DefaultValue = ddlUnderwriterInsert.SelectedValue

        Dim txtCurrentCarrierInsert As TextBox = CType(frmNew.FindControl("txtCurrentCarrierInsert"), TextBox)
        srcAddRecord.InsertParameters("Carrier").DefaultValue = txtCurrentCarrierInsert.Text

        Dim txtCurrentPremiumInsert As TextBox = CType(frmNew.FindControl("txtCurrentPremiumInsert"), TextBox)
        If txtCurrentPremiumInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("Currprem").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("Currprem").DefaultValue = txtCurrentPremiumInsert.Text
        End If

        Dim chkSmpQuoteInsert As CheckBox = CType(frmNew.FindControl("chkSmpQuoteInsert"), CheckBox)
        srcAddRecord.InsertParameters("SmpQuoted").DefaultValue = chkSmpQuoteInsert.Checked

        Dim chkUmbQuoteInsert As CheckBox = CType(frmNew.FindControl("chkUmbQuoteInsert"), CheckBox)
        srcAddRecord.InsertParameters("UmbQuoted").DefaultValue = chkUmbQuoteInsert.Checked

        Dim chkBaQuoteInsert As CheckBox = CType(frmNew.FindControl("chkBaQuoteInsert"), CheckBox)
        srcAddRecord.InsertParameters("BaQuoted").DefaultValue = chkBaQuoteInsert.Checked

        Dim chkWcQuoteInsert As CheckBox = CType(frmNew.FindControl("chkWcQuoteInsert"), CheckBox)
        srcAddRecord.InsertParameters("WcQuoted").DefaultValue = chkWcQuoteInsert.Checked

        Dim chkNotWrittenInsert As CheckBox = CType(frmNew.FindControl("chkNotWrittenInsert"), CheckBox)
        srcAddRecord.InsertParameters("NotWritten").DefaultValue = chkNotWrittenInsert.Checked

        Dim txtReasonInsert As TextBox = CType(frmNew.FindControl("txtReasonInsert"), TextBox)
        srcAddRecord.InsertParameters("Reason").DefaultValue = txtReasonInsert.Text

        Dim txtDateWrittenInsert As TextBox = CType(frmNew.FindControl("txtDateWrittenInsert"), TextBox)
        srcAddRecord.InsertParameters("DateWritten").DefaultValue = txtDateWrittenInsert.Text

        Dim txtReqNoInsert As TextBox = CType(frmNew.FindControl("txtReqNoInsert"), TextBox)
        srcAddRecord.InsertParameters("RequestNo").DefaultValue = txtReqNoInsert.Text

        Dim txtInspectionInsert As TextBox = CType(frmNew.FindControl("txtInspectionInsert"), TextBox)
        srcAddRecord.InsertParameters("InspAppt").DefaultValue = txtInspectionInsert.Text

        Dim txtDeclinedDateInsert As TextBox = CType(frmNew.FindControl("txtDeclinedDateInsert"), TextBox)
        srcAddRecord.InsertParameters("DeclineDate").DefaultValue = txtDeclinedDateInsert.Text

        Dim chkSmpWrittenInsert As CheckBox = CType(frmNew.FindControl("chkSmpWrittenInsert"), CheckBox)
        srcAddRecord.InsertParameters("SmpWritten").DefaultValue = chkSmpWrittenInsert.Checked

        Dim chkUmbWrittenInsert As CheckBox = CType(frmNew.FindControl("chkUmbWrittenInsert"), CheckBox)
        srcAddRecord.InsertParameters("UmbWritten").DefaultValue = chkUmbWrittenInsert.Checked

        Dim chkBaWrittenInsert As CheckBox = CType(frmNew.FindControl("chkBaWrittenInsert"), CheckBox)
        srcAddRecord.InsertParameters("BaWritten").DefaultValue = chkBaWrittenInsert.Checked

        Dim chkWcWrittenInsert As CheckBox = CType(frmNew.FindControl("chkWcWrittenInsert"), CheckBox)
        srcAddRecord.InsertParameters("WcWritten").DefaultValue = chkWcWrittenInsert.Checked

        Dim txtCustNoInsert As TextBox = CType(frmNew.FindControl("txtCustNoInsert"), TextBox)
        srcAddRecord.InsertParameters("CustNo").DefaultValue = txtCustNoInsert.Text

        Dim txtSmpPremInsert As TextBox = CType(frmNew.FindControl("txtSmpPremInsert"), TextBox)
        If txtSmpPremInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("SmpPrem").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("SmpPrem").DefaultValue = txtSmpPremInsert.Text
        End If


        Dim txtUmbPremInsert As TextBox = CType(frmNew.FindControl("txtUmbPremInsert"), TextBox)
        If txtUmbPremInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("UmbPrem").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("UmbPrem").DefaultValue = txtUmbPremInsert.Text
        End If


        Dim txtBaPremInsert As TextBox = CType(frmNew.FindControl("txtBaPremInsert"), TextBox)
        If txtBaPremInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("BaPrem").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("BaPrem").DefaultValue = txtBaPremInsert.Text
        End If


        Dim txtWcPremInsert As TextBox = CType(frmNew.FindControl("txtWcPremInsert"), TextBox)
        If txtWcPremInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("WcPrem").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("WcPrem").DefaultValue = txtWcPremInsert.Text
        End If

        Dim chkSeacoastInsert As CheckBox = CType(frmNew.FindControl("chkSeacoastInsert"), CheckBox)
        srcAddRecord.InsertParameters("Seacoast").DefaultValue = chkSeacoastInsert.Checked

        'Check for Nulls
        Dim txtSeacoastExpInsert As TextBox = CType(frmNew.FindControl("txtSeacoastExpInsert"), TextBox)
        If txtSeacoastExpInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("SeacoastExp").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("SeacoastExp").DefaultValue = txtSeacoastExpInsert.Text
        End If

        Dim txtIrpmFactorInsert As TextBox = CType(frmNew.FindControl("txtIrpmFactorInsert"), TextBox)
        If txtIrpmFactorInsert.Text.Trim.Length = 0 Then
            srcAddRecord.InsertParameters("IrpmFactor").DefaultValue = "0.00"
        Else
            srcAddRecord.InsertParameters("IrpmFactor").DefaultValue = txtIrpmFactorInsert.Text
        End If

    End Sub

    Protected Sub frmSearch_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles frmSearch.ItemUpdating

        srcGetRecord.UpdateParameters("Newbusid").DefaultValue = frmSearch.DataKey("NewbusId")

        Dim txtQuoteDateEdit As TextBox = CType(frmSearch.FindControl("txtQuoteDateEdit"), TextBox)
        srcGetRecord.UpdateParameters("QuoteDate").DefaultValue = txtQuoteDateEdit.Text

        Dim txtEffDateEdit As TextBox = CType(frmSearch.FindControl("txtEffDateEdit"), TextBox)
        srcGetRecord.UpdateParameters("CurrDate").DefaultValue = txtEffDateEdit.Text

        Dim txtChurchNameEdit As TextBox = CType(frmSearch.FindControl("txtChurchNameEdit"), TextBox)
        srcGetRecord.UpdateParameters("Church").DefaultValue = txtChurchNameEdit.Text

        Dim txtLocationEdit As TextBox = CType(frmSearch.FindControl("txtLocationEdit"), TextBox)
        srcGetRecord.UpdateParameters("Location").DefaultValue = txtLocationEdit.Text

        Dim ddlStateEdit As DropDownList = CType(frmSearch.FindControl("ddlStateEdit"), DropDownList)
        srcGetRecord.UpdateParameters("State").DefaultValue = ddlStateEdit.SelectedValue
        'srcGetRecord.UpdateParameters("State").DefaultValue = ddlStateEdit.Text

        Dim ddlAgencyEdit As DropDownList = CType(frmSearch.FindControl("ddlAgencyEdit"), DropDownList)
        srcGetRecord.UpdateParameters("Agent").DefaultValue = ddlAgencyEdit.SelectedValue

        Dim ddlLossControlEdit As DropDownList = CType(frmSearch.FindControl("ddlLossControlEdit"), DropDownList)
        srcGetRecord.UpdateParameters("LossControl").DefaultValue = ddlLossControlEdit.SelectedValue

        Dim ddlUnderwriterEdit As DropDownList = CType(frmSearch.FindControl("ddlUnderwriterEdit"), DropDownList)
        srcGetRecord.UpdateParameters("UW").DefaultValue = ddlUnderwriterEdit.SelectedValue

        Dim txtCurrentCarrierEdit As TextBox = CType(frmSearch.FindControl("txtCurrentCarrierEdit"), TextBox)
        srcGetRecord.UpdateParameters("Carrier").DefaultValue = txtCurrentCarrierEdit.Text

        'Check for nulls
        Dim txtCurrentPremiumEdit As TextBox = CType(frmSearch.FindControl("txtCurrentPremiumEdit"), TextBox)
        If txtCurrentPremiumEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("Currprem").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("Currprem").DefaultValue = txtCurrentPremiumEdit.Text
        End If

        Dim chkSmpQuoteEdit As CheckBox = CType(frmSearch.FindControl("chkSmpQuoteEdit"), CheckBox)
        srcGetRecord.UpdateParameters("SmpQuoted").DefaultValue = chkSmpQuoteEdit.Checked

        Dim chkUmbQuoteEdit As CheckBox = CType(frmSearch.FindControl("chkUmbQuoteEdit"), CheckBox)
        srcGetRecord.UpdateParameters("UmbQuoted").DefaultValue = chkUmbQuoteEdit.Checked

        Dim chkBaQuoteEdit As CheckBox = CType(frmSearch.FindControl("chkBaQuoteEdit"), CheckBox)
        srcGetRecord.UpdateParameters("BaQuoted").DefaultValue = chkBaQuoteEdit.Checked

        Dim chkWcQuoteEdit As CheckBox = CType(frmSearch.FindControl("chkWcQuoteEdit"), CheckBox)
        srcGetRecord.UpdateParameters("WcQuoted").DefaultValue = chkWcQuoteEdit.Checked

        Dim chkNotWrittenEdit As CheckBox = CType(frmSearch.FindControl("chkNotWrittenEdit"), CheckBox)
        srcGetRecord.UpdateParameters("NotWritten").DefaultValue = chkNotWrittenEdit.Checked

        Dim txtReasonEdit As TextBox = CType(frmSearch.FindControl("txtReasonEdit"), TextBox)
        srcGetRecord.UpdateParameters("Reason").DefaultValue = txtReasonEdit.Text

        Dim txtDateWrittenEdit As TextBox = CType(frmSearch.FindControl("txtDateWrittenEdit"), TextBox)
        srcGetRecord.UpdateParameters("DateWritten").DefaultValue = txtDateWrittenEdit.Text

        Dim txtReqNoEdit As TextBox = CType(frmSearch.FindControl("txtReqNoEdit"), TextBox)
        srcGetRecord.UpdateParameters("RequestNo").DefaultValue = txtReqNoEdit.Text

        Dim txtInspectionEdit As TextBox = CType(frmSearch.FindControl("txtInspectionEdit"), TextBox)
        srcGetRecord.UpdateParameters("InspAppt").DefaultValue = txtInspectionEdit.Text

        Dim txtDeclinedDateEdit As TextBox = CType(frmSearch.FindControl("txtDeclinedDateEdit"), TextBox)
        srcGetRecord.UpdateParameters("DeclineDate").DefaultValue = txtDeclinedDateEdit.Text

        Dim chkSmpWrittenEdit As CheckBox = CType(frmSearch.FindControl("chkSmpWrittenEdit"), CheckBox)
        srcGetRecord.UpdateParameters("SmpWritten").DefaultValue = chkSmpWrittenEdit.Checked

        Dim chkUmbWrittenEdit As CheckBox = CType(frmSearch.FindControl("chkUmbWrittenEdit"), CheckBox)
        srcGetRecord.UpdateParameters("UmbWritten").DefaultValue = chkUmbWrittenEdit.Checked

        Dim chkBaWrittenEdit As CheckBox = CType(frmSearch.FindControl("chkBaWrittenEdit"), CheckBox)
        srcGetRecord.UpdateParameters("BaWritten").DefaultValue = chkBaWrittenEdit.Checked

        Dim chkWcWrittenEdit As CheckBox = CType(frmSearch.FindControl("chkWcWrittenEdit"), CheckBox)
        srcGetRecord.UpdateParameters("WcWritten").DefaultValue = chkWcWrittenEdit.Checked

        Dim txtCustNoEdit As TextBox = CType(frmSearch.FindControl("txtCustNoEdit"), TextBox)
        srcGetRecord.UpdateParameters("CustNo").DefaultValue = txtCustNoEdit.Text

        'Check for nulls
        Dim txtSmpPremEdit As TextBox = CType(frmSearch.FindControl("txtSmpPremEdit"), TextBox)
        If txtSmpPremEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("SmpPrem").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("SmpPrem").DefaultValue = txtSmpPremEdit.Text
        End If

        Dim txtUmbPremEdit As TextBox = CType(frmSearch.FindControl("txtUmbPremEdit"), TextBox)
        If txtUmbPremEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("UmbPrem").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("UmbPrem").DefaultValue = txtUmbPremEdit.Text
        End If

        Dim txtBaPremEdit As TextBox = CType(frmSearch.FindControl("txtBaPremEdit"), TextBox)
        If txtBaPremEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("BaPrem").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("BaPrem").DefaultValue = txtBaPremEdit.Text
        End If

        Dim txtWcPremEdit As TextBox = CType(frmSearch.FindControl("txtWcPremEdit"), TextBox)
        If txtWcPremEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("WcPrem").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("WcPrem").DefaultValue = txtWcPremEdit.Text
        End If

        Dim chkSeacoastEdit As CheckBox = CType(frmSearch.FindControl("chkSeacoastEdit"), CheckBox)
        srcGetRecord.UpdateParameters("Seacoast").DefaultValue = chkSeacoastEdit.Checked

        'Check for nulls
        Dim txtSeacoastExpEdit As TextBox = CType(frmSearch.FindControl("txtSeacoastExpEdit"), TextBox)
        If txtSeacoastExpEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("SeacoastExp").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("SeacoastExp").DefaultValue = txtSeacoastExpEdit.Text
        End If


        Dim txtIrpmFactorEdit As TextBox = CType(frmSearch.FindControl("txtIrpmFactorEdit"), TextBox)
        If txtIrpmFactorEdit.Text.Trim.Length = 0 Then
            srcGetRecord.UpdateParameters("IrpmFactor").DefaultValue = "0.00"
        Else
            srcGetRecord.UpdateParameters("IrpmFactor").DefaultValue = txtIrpmFactorEdit.Text
        End If
    End Sub

    Protected Sub btnOk_Click(sender As Object, e As System.EventArgs)

        Dim txtQuoteDateInsert As TextBox = CType(frmNew.FindControl("txtQuoteDateInsert"), TextBox)
        txtQuoteDateInsert.Text = String.Empty

        Dim txtEffDateInsert As TextBox = CType(frmNew.FindControl("txtEffDateInsert"), TextBox)
        txtEffDateInsert.Text = String.Empty

        Dim txtChurchNameInsert As TextBox = CType(frmNew.FindControl("txtChurchNameInsert"), TextBox)
        txtChurchNameInsert.Text = String.Empty

        Dim txtLocationInsert As TextBox = CType(frmNew.FindControl("txtLocationInsert"), TextBox)
        txtLocationInsert.Text = String.Empty

        Dim ddlStateInsert As DropDownList = CType(frmNew.FindControl("ddlStateInsert"), DropDownList)
        ddlStateInsert.SelectedValue = String.Empty

        Dim ddlAgencyInsert As DropDownList = CType(frmNew.FindControl("ddlAgencyInsert"), DropDownList)
        ddlAgencyInsert.SelectedValue = String.Empty

        Dim ddlLossControlInsert As DropDownList = CType(frmNew.FindControl("ddlLossControlInsert"), DropDownList)
        ddlLossControlInsert.SelectedValue = String.Empty

        Dim ddlUnderwriterInsert As DropDownList = CType(frmNew.FindControl("ddlUnderwriterInsert"), DropDownList)
        ddlUnderwriterInsert.SelectedValue = String.Empty

        Dim txtCurrentCarrierInsert As TextBox = CType(frmNew.FindControl("txtCurrentCarrierInsert"), TextBox)
        txtCurrentCarrierInsert.Text = String.Empty

        Dim txtCurrentPremiumInsert As TextBox = CType(frmNew.FindControl("txtCurrentPremiumInsert"), TextBox)
        txtCurrentPremiumInsert.Text = String.Empty

        Dim chkSmpQuoteInsert As CheckBox = CType(frmNew.FindControl("chkSmpQuoteInsert"), CheckBox)
        chkSmpQuoteInsert.Checked = False

        Dim chkUmbQuoteInsert As CheckBox = CType(frmNew.FindControl("chkUmbQuoteInsert"), CheckBox)
        chkUmbQuoteInsert.Checked = False

        Dim chkBaQuoteInsert As CheckBox = CType(frmNew.FindControl("chkBaQuoteInsert"), CheckBox)
        chkBaQuoteInsert.Checked = False

        Dim chkWcQuoteInsert As CheckBox = CType(frmNew.FindControl("chkWcQuoteInsert"), CheckBox)
        chkWcQuoteInsert.Checked = False

        Dim chkNotWrittenInsert As CheckBox = CType(frmNew.FindControl("chkNotWrittenInsert"), CheckBox)
        chkNotWrittenInsert.Checked = False

        Dim txtReasonInsert As TextBox = CType(frmNew.FindControl("txtReasonInsert"), TextBox)
        txtReasonInsert.Text = String.Empty

        Dim txtDateWrittenInsert As TextBox = CType(frmNew.FindControl("txtDateWrittenInsert"), TextBox)
        txtDateWrittenInsert.Text = String.Empty

        Dim txtReqNoInsert As TextBox = CType(frmNew.FindControl("txtReqNoInsert"), TextBox)
        txtReqNoInsert.Text = String.Empty

        Dim txtInspectionInsert As TextBox = CType(frmNew.FindControl("txtInspectionInsert"), TextBox)
        txtInspectionInsert.Text = String.Empty

        Dim txtDeclinedDateInsert As TextBox = CType(frmNew.FindControl("txtDeclinedDateInsert"), TextBox)
        txtDeclinedDateInsert.Text = String.Empty

        Dim chkSmpWrittenInsert As CheckBox = CType(frmNew.FindControl("chkSmpWrittenInsert"), CheckBox)
        chkSmpWrittenInsert.Checked = False

        Dim chkUmbWrittenInsert As CheckBox = CType(frmNew.FindControl("chkUmbWrittenInsert"), CheckBox)
        chkUmbWrittenInsert.Checked = False

        Dim chkBaWrittenInsert As CheckBox = CType(frmNew.FindControl("chkBaWrittenInsert"), CheckBox)
        chkBaWrittenInsert.Checked = False

        Dim chkWcWrittenInsert As CheckBox = CType(frmNew.FindControl("chkWcWrittenInsert"), CheckBox)
        chkWcWrittenInsert.Checked = False

        Dim txtCustNoInsert As TextBox = CType(frmNew.FindControl("txtCustNoInsert"), TextBox)
        txtCustNoInsert.Text = String.Empty

        Dim txtSmpPremInsert As TextBox = CType(frmNew.FindControl("txtSmpPremInsert"), TextBox)
        txtSmpPremInsert.Text = String.Empty

        Dim txtUmbPremInsert As TextBox = CType(frmNew.FindControl("txtUmbPremInsert"), TextBox)
        txtUmbPremInsert.Text = String.Empty

        Dim txtBaPremInsert As TextBox = CType(frmNew.FindControl("txtBaPremInsert"), TextBox)
        txtBaPremInsert.Text = String.Empty

        Dim txtWcPremInsert As TextBox = CType(frmNew.FindControl("txtWcPremInsert"), TextBox)
        txtWcPremInsert.Text = String.Empty

        Dim chkSeacoastInsert As CheckBox = CType(frmNew.FindControl("chkSeacoastInsert"), CheckBox)
        chkSeacoastInsert.Checked = False

        Dim txtSeacoastExpInsert As TextBox = CType(frmNew.FindControl("txtSeacoastExpInsert"), TextBox)
        txtSeacoastExpInsert.Text = String.Empty

        Dim txtIrpmFactorInsert As TextBox = CType(frmNew.FindControl("txtIrpmFactorInsert"), TextBox)
        txtIrpmFactorInsert.Text = String.Empty

    End Sub


End Class
