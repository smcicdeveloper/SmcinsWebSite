
Partial Class PolicyholderPortal_update_profile
    Inherits System.Web.UI.Page

    Protected Sub dlstProfile_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstProfile.EditCommand
        dlstProfile.EditItemIndex = e.Item.ItemIndex
        dlstProfile.DataBind()
    End Sub

    Protected Sub dlstProfile_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstProfile.CancelCommand
        dlstProfile.EditItemIndex = -1
        dlstProfile.DataBind()
    End Sub

    Protected Sub dlstProfile_UpdateCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstProfile.UpdateCommand
        'Get form fields
        Dim txtFirst As TextBox = CType(e.Item.FindControl("txtFirst"), TextBox)
        Dim txtLast As TextBox = CType(e.Item.FindControl("txtLast"), TextBox)
        Dim txtPhone As TextBox = CType(e.Item.FindControl("txtPhone"), TextBox)

        'Assign parameters
        odcProfile.UpdateParameters("UserNameIs").DefaultValue = dlstProfile.DataKeys(e.Item.ItemIndex).ToString()
        odcProfile.UpdateParameters("Firstname").DefaultValue = txtFirst.Text
        odcProfile.UpdateParameters("Lastname").DefaultValue = txtLast.Text
        odcProfile.UpdateParameters("Phone").DefaultValue = txtPhone.Text

        'Call ObjectDataSource Update
        odcProfile.Update()

        'Take out of Edit mode
        dlstProfile.EditItemIndex = -1
    End Sub

    Protected Sub dlstProfile_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlstProfile.DeleteCommand

    End Sub
End Class
