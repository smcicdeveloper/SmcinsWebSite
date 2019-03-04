
Partial Class WizardSteps_Step1_Register
    Inherits System.Web.UI.UserControl

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Page.IsPostBack = False Then
            txtCustomerNum.Text = String.Empty
            txtPolicyNum.Text = String.Empty
            ddlPolicyType.SelectedValue = ddlPolicyType.SelectedValue
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Panel2.Visible = False
        Panel3.Visible = False

        Session("custnum") = txtCustomerNum.Text
        Session("symb01") = ddlPolicyType.SelectedValue
        Session("policynum") = txtPolicyNum.Text

        'If Not IsNothing(Session("custnum")) Then
        '    txtCustomerNum.Text = CStr(Session("custnum"))
        'End If
        'If Not IsNothing(Session("symb0l")) Then
        '    ddlPolicyType.SelectedValue = CStr(Session("symb0l"))
        'End If
        'If Not IsNothing(Session("policynum")) Then
        '    txtPolicyNum.Text = CStr(Session("policynum"))
        'End If

    End Sub

    Protected Sub CreateUserWizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles CreateUserWizard1.NextButtonClick

        If Page.IsValid Then
            Panel1.Visible = False
            Panel2.Visible = True
            Panel3.Visible = False

            Session("custnum") = txtCustomerNum.Text
            CreateUserWizard1.UserName = CStr(Session("custnum"))
            Session("symb0l") = ddlPolicyType.SelectedValue
            Session("policynum") = txtPolicyNum.Text

            Session("fname") = txtFirstName.Text
            Session("lname") = txtLastName.Text
            Session("phone") = txtPhone.Text
        End If

        If Page.IsPostBack = True Then
            FormView1.DataSourceID = "odsStatusCheck"
            odsStatusCheck.Select()
            FormView1.DataBind()
        End If

    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        If FormView1.DataItemCount = 0 Then
            CreateUserWizard1.Enabled = False
            Panel1.Visible = False
            Panel2.Visible = False
            Panel3.Visible = True
        Else
            Dim insured As TextBox = CType(FormView1.FindControl("txtChurch"), TextBox)
            Session("church") = insured.Text

            Dim address As TextBox = CType(FormView1.FindControl("txtAddress1"), TextBox)
            Session("address") = address.Text

            Dim city As TextBox = CType(FormView1.FindControl("txtCity1"), TextBox)
            Session("city") = city.Text

            Dim zip As TextBox = CType(FormView1.FindControl("txtZip1"), TextBox)
            Session("zip") = zip.Text
        End If

    End Sub

    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        If Page.IsPostBack = True Then
            odsUserProfiles.Insert()
        End If

        'Dim rfvEmail As RequiredFieldValidator = CType(CreateUserWizard1.TemplateControl.FindControl("rfvEmail"), RequiredFieldValidator)

        'CreateUserWizard1.PasswordRegularExpressionErrorMessage.ToString()

    End Sub

    Protected Sub CreateUserWizard1_PreviousButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles CreateUserWizard1.PreviousButtonClick
        Panel1.Visible = False
        Panel2.Visible = True
        Panel3.Visible = False
    End Sub

    Protected Sub CreateUserWizard1_CancelButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CancelButtonClick
 
        MsgBox("Are you sure you want to cancel?")
        txtCustomerNum.Text = String.Empty
        txtPolicyNum.Text = String.Empty
        txtFirstName.Text = String.Empty
        txtLastName.Text = String.Empty
        txtPhone.Text = String.Empty
        Session("custnum") = txtCustomerNum.Text
        Session("symb01") = String.Empty
        Session("policynum") = txtPolicyNum.Text

        Response.Redirect("~/default.aspx")
        'CreateUserWizard1.CancelDestinationPageUrl = "~/default.aspx"

    End Sub

    Protected Sub CreateUserWizard1_ContinueButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.ContinueButtonClick
        Session("UserNameIs") = CreateUserWizard1.UserName
    End Sub

End Class
