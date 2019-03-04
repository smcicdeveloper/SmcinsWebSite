
Partial Class PolicyholderPortal_change_password
    Inherits System.Web.UI.Page

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim rvfPass As RequiredFieldValidator = CType(ChangePassword2.FindControl("rvfPassword"), RequiredFieldValidator)
        'Dim vsPass As ValidationSummary = CType(ChangePassword2.FindControl("vsChangePassword"), ValidationSummary)
        'vsPass.Enabled = False
        'rvfPass.Enabled = False
        Response.Redirect("policyholder_tools.aspx")


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.ChangePassword2.ChangePasswordTemplateContainer.FindControl("CurrentPassword").Focus()
    End Sub
End Class
