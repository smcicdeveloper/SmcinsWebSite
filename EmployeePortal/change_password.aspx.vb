
Partial Class EmployeePortal_change_password
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.ChangePassword2.ChangePasswordTemplateContainer.FindControl("CurrentPassword").Focus()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("employee_tools.aspx")
    End Sub


End Class
