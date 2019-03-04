
Partial Class canSaf
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
        If Page.IsPostBack = False Then
            txtCustomerNum.Text = String.Empty
            txtPostalCode.Text = String.Empty
        End If
        txtCustomerNum.Focus()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Session("custnum") = txtCustomerNum.Text
        Session("postalcode") = txtPostalCode.Text
    End Sub

    Protected Sub StartNextButton_Click(sender As Object, e As System.EventArgs)
        If Page.IsValid Then
            Session("custnum") = txtCustomerNum.Text
            Session("postalcode") = txtPostalCode.Text
        End If

        If Page.IsPostBack = True Then
            frmAddress.DataSourceID = "srcGetRecord"
            srcGetRecord.Select()
            frmAddress.DataBind()
        End If
    End Sub

    Protected Sub StepNextButton_Click(sender As Object, e As System.EventArgs)
        If Page.IsValid Then
            Session("mailingcontact") = txtMailFname.Text.ToUpper
            Session("candleuse") = rblCandleUse.SelectedValue.ToUpper
        End If
    End Sub

    Protected Sub odsAddRecord_Inserting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles odsAddRecord.Inserting
        e.InputParameters.Add("ipaddress", Request.UserHostAddress)
    End Sub

    Protected Sub FinishButton_Click(sender As Object, e As System.EventArgs)
        If Page.IsValid Then
            Session("fullname") = txtFirstName.Text.ToUpper + " " + txtLastName.Text.ToUpper

            Dim insured As TextBox = CType(frmAddress.FindControl("txtChurch"), TextBox)
            Session("church") = insured.Text.ToUpper

            Dim address As TextBox = CType(frmAddress.FindControl("txtAddress"), TextBox)
            Session("mailaddress") = address.Text.ToUpper

            Dim city As TextBox = CType(frmAddress.FindControl("txtCity"), TextBox)
            Session("mailcity") = city.Text.ToUpper

            Dim state As TextBox = CType(frmAddress.FindControl("txtState"), TextBox)
            Session("mailstate") = state.Text.ToUpper

            Dim zip As TextBox = CType(frmAddress.FindControl("txtZip"), TextBox)
            Session("mailzip") = zip.Text

            Dim location As TextBox = CType(frmAddress.FindControl("txtLocation"), TextBox)
            Session("location") = location.Text.ToUpper

            odsAddRecord.Insert()
        End If
    End Sub

    Protected Sub valComments_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
        If args.Value.Length < 10 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub valZip_ServerValidate(ByVal source As Object, ByVal args As ServerValidateEventArgs)
        If args.Value.Length < 5 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
End Class
