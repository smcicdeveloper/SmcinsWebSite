
Partial Class AgencyPortal_Forms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Session("Grouping") = String.Empty
        If IsPostBack = False Then
            lblTitle.Text = "Crime Forms"
            Session("Grouping") = "Crime Forms"
        End If
    End Sub

    Protected Sub grdForms_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdForms.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim MyCategory As String = CType(DataBinder.Eval(e.Row.DataItem, "Category"), String)
            Dim srcForms As SqlDataSource = CType(e.Row.FindControl("srcForms"), SqlDataSource)
            srcForms.SelectParameters("category").DefaultValue = MyCategory.ToString()
        End If
    End Sub

    Protected Sub dlstForms_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles dlstForms.SelectedIndexChanged
        Dim srcForms As SqlDataSource = CType(grdForms.FindControl("srcForms"), SqlDataSource)
        lblTitle.Text = dlstForms.SelectedValue
        Session("Grouping") = dlstForms.SelectedValue
    End Sub


End Class
