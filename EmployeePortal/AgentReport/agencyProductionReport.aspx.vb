
Partial Class EmployeePortal_AgentReport_agencyProductionReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        srcGetYear.Select()
    End Sub

    Protected Sub ddlAgency_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlAgency.SelectedIndexChanged
        Session("Agency") = ddlAgency.SelectedValue
        Session("YY") = ddlYear.SelectedValue

        srcInsertFirstRecord.Insert()
        srcUpdate.Update()
        srcUpdateWritten.Update()

        ObjectDataSource1.Select()
        srcGetLossRatio.Select()
        ReportViewer1.LocalReport.Refresh()

        Session("Agency") = String.Empty
        Session("YY") = String.Empty
    End Sub

    Protected Sub ddlYear_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlYear.SelectedIndexChanged
        Session("Agency") = ddlAgency.SelectedValue
        Session("YY") = ddlYear.SelectedValue

        srcInsertFirstRecord.Insert()
        srcUpdate.Update()
        srcUpdateWritten.Update()

        ObjectDataSource1.Select()
        ReportViewer1.LocalReport.Refresh()

        ObjectDataSource1.Select()
        ReportViewer1.LocalReport.Refresh()

        Session("Agency") = String.Empty
        Session("YY") = String.Empty
    End Sub


    'Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
    '    Session("Agency") = ddlAgency.SelectedValue
    '    Session("YY") = ddlYear.SelectedValue

    '    srcGetYear.Select()
    'End Sub
End Class
