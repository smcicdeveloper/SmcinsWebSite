
Partial Class Webpages_MyFiles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'If Not Page.IsPostBack Then
        '    grdStatus.SelectedIndex = 0
        'End If
    End Sub

    'Protected Sub grdStatus_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grdStatus.RowUpdating
    '    Dim ddlStatus As DropDownList = CType(Me.grdStatus.Rows(0).Cells(1).FindControl("ddlStatus"), DropDownList)

    '    If ddlStatus.Text.Trim.Length = 0 Then
    '        srcGetMyFiles.UpdateParameters("cust_status").DefaultValue = ""
    '    Else
    '        srcGetMyFiles.UpdateParameters("cust_status").DefaultValue = ddlStatus.SelectedValue
    '    End If
    'End Sub


End Class
