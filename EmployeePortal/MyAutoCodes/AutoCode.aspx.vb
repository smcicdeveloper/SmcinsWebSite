
Partial Class EmployeePortal_MyAutoCodes_AutoCode
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            grdList.Visible = False
            'grdList.SelectedIndex = 0
            'odsAutoList.Select()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        odsAutoList.Select()
        grdList.Visible = True
    End Sub

End Class
