
Partial Class EmployeePortal_UserAccounts_agentUserAccounts
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        srcAgentAccounts.Select()
    End Sub

    Protected Sub ddlState_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlState.SelectedIndexChanged
        srcAgentAccounts.Select()
        ReportViewer1.LocalReport.Refresh()
    End Sub
End Class
