
Partial Class EmployeePortal_MyCandleSafety_AddRecord
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
        If Page.IsPostBack = True Then
            'Do nothing
        Else
            txtCustomerNum.Text = String.Empty
            rblCandleUse.Enabled = False
            frmPerson.Enabled = False
        End If

        'Dim lblLimit As Label = CType(frmPerson.FindControl("lblLimit"), Label)
        'If grvDesignate.Rows.Count = 5 Then
        '    lblLimit.Visible = True
        'End If


        txtCustomerNum.Focus()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Session("custnum") = txtCustomerNum.Text

        'Dim lblLimit As Label = CType(frmPerson.FindControl("lblLimit"), Label)
        'lblLimit.Visible = False

        'Dim rfvFullName As RequiredFieldValidator = CType(frmPerson.FindControl("rfvFullName"), RequiredFieldValidator)
        'rfvFullName.Enabled = False

    End Sub

    Protected Sub valComments_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
        If args.Value.Length < 4 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub valName_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
        If args.Value.Length > 1 Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub


    Protected Sub btnLookUp_Click(sender As Object, e As System.EventArgs) Handles btnLookUp.Click

        ' If Page.IsValid Then
        Session("custnum") = txtCustomerNum.Text
        'End If

        If Page.IsPostBack = True Then

            frmAddress.DataSourceID = "srcGetRecord"
            frmAddress.DataBind()

            If frmAddress.DataItemCount > 0 Then
                Dim lblLimit As Label = CType(frmPerson.FindControl("lblLimit"), Label)
                Dim lblCustNum As Label = CType(frmAddress.FindControl("lblCustNum"), Label)
                lblCustNum.Text = txtCustomerNum.Text
                rblCandleUse.Enabled = True
                frmPerson.Enabled = True
                lblLimit.Visible = False
                grvDesignate.DataBind()
            End If

        End If

        CheckDesignateLimit()

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs)
        CheckDesignateLimit()
        If grvDesignate.Rows.Count = 1 Then
            rblCandleUse.Enabled = True
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

    Protected Sub lnkAddRecord_Click(sender As Object, e As System.EventArgs)
        If Page.IsValid Then

            'Dim rfvFullName As RequiredFieldValidator = CType(frmPerson.FindControl("rfvFullName"), RequiredFieldValidator)
            'rfvFullName.Enabled = True

            Session("custnum") = String.Empty
            Session("fullname") = String.Empty
            Session("candleuse") = String.Empty
            Session("entry") = String.Empty

            Dim lblCustNum As Label = CType(frmAddress.FindControl("lblCustNum"), Label)
            If txtCustomerNum.Text.Length = 4 Then
                Session("custnum") = "000000" + lblCustNum.Text
            Else
                Session("custnum") = "00000" + lblCustNum.Text
            End If


            Dim fullName As TextBox = CType(frmPerson.FindControl("txtFullName"), TextBox)
            Session("fullname") = fullName.Text.ToUpper

            Session("candleuse") = rblCandleUse.SelectedValue.ToUpper
            Session("entry") = "In House"

        End If

    End Sub

    Protected Sub srcAddPerson_Inserted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles srcAddPerson.Inserted
        grvDesignate.DataBind()
        CheckDesignateLimit()
    End Sub

    Sub CheckDesignateLimit()
        Dim lblLimit As Label = CType(frmPerson.FindControl("lblLimit"), Label)

        If grvDesignate.Rows.Count = 5 Then
            frmPerson.Enabled = False
            'lblLimit.Text = "No more than five people can be submitted."
            'lblLimit.Visible = True
        Else
            frmPerson.Enabled = True
            'lblLimit.Visible = False
        End If
    End Sub

    Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As MenuEventArgs)
        Dim index As Integer = Int32.Parse(e.Item.Value)
        MultiView1.ActiveViewIndex = index
    End Sub


End Class


