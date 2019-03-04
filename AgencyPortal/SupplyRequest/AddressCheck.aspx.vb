Imports System
Imports System.Web.UI
Imports System.Data

Partial Class AgencyPortal_SupplyRequest_AddressCheck
    Inherits System.Web.UI.Page

    Dim radioString As RadioButton

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim selecteAgent As Address = Me.GetAgentAddress
        Panel1.Enabled = True
        Panel2.Enabled = False

        If rdlMail.Checked = True Then
            reqAttn.Enabled = False
            reqStreet.Enabled = False
            reqCity.Enabled = False
            reqZip.Enabled = False
        Else
            reqAttn.Enabled = True
            reqStreet.Enabled = True
            reqCity.Enabled = True
            reqZip.Enabled = True
        End If

    End Sub

    Private Function GetAgentAddress() As Address
        Dim addressTable As DataView = CType(srcAgents.Select(DataSourceSelectArguments.Empty), DataView)
        Dim address As New Address
        address.Title = "Mailing Address"
        address.FullName = addressTable(0)("FULL_NAME").ToString
        address.Agent = addressTable(0)("NAME_OF_AGENCY").ToString
        address.Street = addressTable(0)("MAILING_ADDRESS").ToString
        address.City = addressTable(0)("MAILING_CITY").ToString
        address.State = addressTable(0)("MAILING_STATE").ToString
        address.PostalCode = addressTable(0)("MAILING_ZIP").ToString
        Return address
    End Function


    Protected Sub rdlMail_CheckedChanged(sender As Object, e As EventArgs) Handles rdlMail.CheckedChanged
        If rdlMail.Checked = True Then
            Panel1.Enabled = True
            Panel2.Enabled = False
            'reqStreet.Enabled = False
        End If
    End Sub

    Protected Sub rdlShip_CheckedChanged(sender As Object, e As EventArgs) Handles rdlShip.CheckedChanged
        If rdlShip.Checked = True Then
            Panel1.Enabled = False
            Panel2.Enabled = True
        End If
    End Sub

    Protected Sub lnkSubmit_Click(sender As Object, e As EventArgs) Handles lnkSubmit.Click
        Dim selecteAgent As Address = Me.GetAgentAddress

        If rdlMail.Checked = True Then
            Session("myname") = selecteAgent.FullName.ToUpper
            Session("myagency") = selecteAgent.Agent.ToUpper
            Session("mystreet") = selecteAgent.Street.ToUpper
            Session("mycity") = selecteAgent.City.ToUpper
            Session("mystate") = selecteAgent.State.ToUpper
            Session("myzip") = selecteAgent.PostalCode
        Else
            Session("myname") = txtAttn.Text.ToUpper
            Session("myagency") = txtAgent.Text.ToUpper
            Session("mystreet") = txtStreet.Text.ToUpper
            Session("mycity") = txtCity.Text.ToUpper
            Session("mystate") = ddlState.SelectedValue
            Session("myzip") = txtPostalCode.Text
        End If


        Response.Redirect("InvoiceForm.aspx")
    End Sub


End Class
