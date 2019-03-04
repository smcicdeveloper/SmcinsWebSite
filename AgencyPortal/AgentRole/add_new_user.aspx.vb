
Partial Class AgencyPortal_add_new_user
    Inherits System.Web.UI.Page

    Dim globalParam1 As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'rblAgencyList.DataBind()
        'Dim agentnum As Label = CType(FormView1.FindControl("lblAgentNum"), Label)
        'agentnum.Text = CStr(Session("UserNameIs"))

    End Sub

    Protected Sub CreateUserWizard1_ActiveStepChanged(sender As Object, e As System.EventArgs) Handles CreateUserWizard1.ActiveStepChanged

    End Sub

    Protected Sub ActivateStep(ByVal sender As Object, ByVal e As System.EventArgs)
        'lstRole.DataSource = Roles.GetAllRoles()
        'lstRole.DataBind()
    End Sub

    Protected Sub DeactivateStep(ByVal sender As Object, ByVal e As System.EventArgs)
        Roles.AddUserToRole(User.Identity.Name, lstRole.SelectedValue)
    End Sub

    Protected Sub StartNextButton_Click(sender As Object, e As System.EventArgs)
        txtSubAgentNum.Text = rblAgencyList.SelectedValue

        Dim Agency As TextBox = CType(CreateUserWizardStep1.ContentTemplateContainer.FindControl("Agency"), TextBox)
        Agency.Text = rblAgencyList.SelectedValue



    End Sub

    Protected Sub StepNextButton_Click(sender As Object, e As System.EventArgs)
        ' Dim index As Integer = Int32.Parse(CreateUserWizard1.WizardSteps.Count)

    End Sub

    Protected Sub FinishButton_Click(sender As Object, e As System.EventArgs)
        'If WizardStep1.StepType = WizardStepType.Finish Then
        Session("anum") = txtSubAgentNum.Text
        Session("uname") = CreateUserWizard1.UserName.ToString
        Session("fname") = txtFname.Text
        Session("lname") = txtLname.Text
        Session("phone") = txtPhone.Text
        Session("position") = txtPosition.Text
        Session("city") = txtCity.Text
        Session("state") = ddlState.SelectedValue
        Session("role") = lstRole.SelectedValue
        odsUserProfiles.Insert()
        GridView1.DataBind()
        'End If
    End Sub

    Protected Sub srcUsers_Deleting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles srcUsers.Deleting
        e.InputParameters("username") = globalParam1
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        globalParam1 = e.Values("Username").ToString()
        srcUsers.Delete()
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim Status As Integer = CType(DataBinder.Eval(e.Row.DataItem, "Createdfrom"), Integer)
            Dim RoleIs As String = CType(DataBinder.Eval(e.Row.DataItem, "Role"), String)
            Dim colConvert As New System.Drawing.ColorConverter
            If Status = 1 Then
                Dim lnkAction As LinkButton = e.Row.FindControl("lnkAction")
                lnkAction.Enabled = False
                lnkAction.Visible = False
                e.Row.ForeColor = CType(colConvert.ConvertFromString("#491b7a"), System.Drawing.Color)
            ElseIf RoleIs = "Agent" Then
                Dim lnkAction As LinkButton = e.Row.FindControl("lnkAction")
                lnkAction.Enabled = False
                lnkAction.Visible = False
                e.Row.ForeColor = CType(colConvert.ConvertFromString("#491b7a"), System.Drawing.Color)
            ElseIf Status = 2 Then
                e.Row.ForeColor = CType(colConvert.ConvertFromString("#AD4DBB"), System.Drawing.Color)
            End If
        End If

    End Sub

    Protected Sub ContinueButton_Click(sender As Object, e As System.EventArgs)
        'FormView1.DataBind()
        'OdsAllPortal.Select()
        'odsHierarchy.Select()
        rblAgencyList.DataBind()
    End Sub
End Class
