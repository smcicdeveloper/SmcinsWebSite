
Partial Class EmployeePortal_MyNewBusiness_NewBusiness
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'If IsPostBack = False Then
        'grdRecords.Visible = False
        'End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click

        'Dim txtAgent As TextBox = CType(DataList1.FindControl("txtAgent"), TextBox)
        'srcNewBusiness.SelectParameters.Add("Agent", 4011)
        grdRecords.DataSourceID = "srcNewBusiness"
        srcNewBusiness.Select()
        grdRecords.DataBind()
        'grdRecords.Visible = True
        ' DataList1.DataBind()
    End Sub

    'Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
    '    grdRecords.DataSourceID = "srcNewBusiness"
    '    srcNewBusiness.Select()
    '    grdRecords.DataBind()
    '    grdRecords.Visible = True
    'End Sub


End Class
