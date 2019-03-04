
Partial Class PolicyholderPortal_CandleSafety_CandleSafetyEntry
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
        If Page.IsPostBack = False Then
            CheckDesignateStatus()
        End If
        Dim fullName As TextBox = CType(frmPerson.FindControl("txtFullName"), TextBox)
        fullName.Focus()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Session("custnum") = "000000"
    End Sub

    Protected Sub StepNextButton_Click(sender As Object, e As System.EventArgs)
        Dim StepPrevious As Button = Wizard1.FindControl("StepNavigationTemplateContainerID").FindControl("StepPreviousButton")
        Dim StepNext As Button = Wizard1.FindControl("StepNavigationTemplateContainerID").FindControl("StepNextButton")
        Dim StepCancel As Button = Wizard1.FindControl("StepNavigationTemplateContainerID").FindControl("CancelButton")

        Dim FinishButton As Button = Wizard1.FindControl("FinishNavigationTemplateContainerID").FindControl("FinishButton")
        Dim PreviousButton As Button = Wizard1.FindControl("FinishNavigationTemplateContainerID").FindControl("FinishPreviousButton")

        StepNext.Text = "Submit"
        StepNext.CausesValidation = False
        StepPrevious.Visible = False
        StepCancel.Visible = False
        FinishButton.Visible = False
        PreviousButton.Visible = False

        Dim rfvFullName As RequiredFieldValidator = CType(frmPerson.FindControl("rfvFullName"), RequiredFieldValidator)
        If grvDesignate.Rows.Count = 5 Then
            rfvFullName.Enabled = False
            'Added below on 11/22/2016
            rfvCandleUse.Enabled = False
        Else
            'FinishButton.Visible = True
            'PreviousButton.Visible = True
            'lblLimit.Visible = False
        End If
    End Sub

    Protected Sub lnkAddRecord_Click(sender As Object, e As System.EventArgs)
        If Page.IsValid Then

            Session("custnum") = String.Empty
            Session("fullname") = String.Empty
            Session("candleuse") = String.Empty
            Session("entry") = String.Empty

            'Dim lblCustNum As Label
            'lblCustNum.Text = Session("UserNameIs").ToString()
            'Session("custnum") = lblCustNum.Text.ToUpper

            Dim fullName As TextBox = CType(frmPerson.FindControl("txtFullName"), TextBox)
            Session("fullname") = fullName.Text.ToUpper

            Session("candleuse") = rblCandleUse.SelectedValue.ToUpper
            Session("entry") = "Online"

            grvDesignate.DataBind()
            CheckDesignateLimit()

        End If

    End Sub

    Sub CheckDesignateStatus()
        'Currently the gridview will auto load a total of 4 rows not 3 if you start from row 0
        'Perform this function only from the Page_Prerender process
        If grvDesignate.Rows.Count > 4 Then
            frmPerson.Enabled = False
        Else
            frmPerson.Enabled = True
        End If
    End Sub

    Sub CheckDesignateLimit()
        If grvDesignate.Rows.Count > 3 Then
            frmPerson.Enabled = False
        Else
            frmPerson.Enabled = True
        End If
    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As System.EventArgs)
        CheckDesignateLimit()
        If grvDesignate.Rows.Count = 1 Then
            rblCandleUse.Enabled = True
            'Added below on 11/22/2016
            rblCandleUse.SelectedIndex = -1
        End If
    End Sub

    Protected Sub grvDesignate_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grvDesignate.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CheckDesignateLimit()

            rblCandleUse.Enabled = False

            Dim lblCandleUse = TryCast(e.Row.FindControl("lblCandleUse"), Label)
            If lblCandleUse Is Nothing Then
                'Do Nothing
            ElseIf lblCandleUse.Text = "OPEN FLAME CANDLES" Then
                rblCandleUse.SelectedIndex = 0
            ElseIf lblCandleUse.Text = "NO CANDLES" Then
                rblCandleUse.SelectedIndex = 1
            ElseIf lblCandleUse.Text = "NON FLAME CANDLES" Then
                rblCandleUse.SelectedIndex = 2
            End If
        End If
    End Sub

    Protected Sub grvDesignate_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvDesignate.RowDeleting
        Session("designateid") = Convert.ToInt32(grvDesignate.DataKeys(e.RowIndex).Value)
    End Sub

    Protected Sub odsAddRecord_Inserted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles odsAddRecord.Inserted
        grvDesignate.DataBind()
    End Sub

    Protected Sub FinishButton_Click(sender As Object, e As System.EventArgs)

    End Sub


End Class
