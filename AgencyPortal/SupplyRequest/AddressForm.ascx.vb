Imports System
Imports System.Web.UI
Imports System.Data

Partial Class AgencyPortal_SupplyRequest_AddressForm
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim selecteAgent As Address = Me.GetAgentAddress
        ltlTitle.Text = selecteAgent.Title
        txtAttn.Text = selecteAgent.FullName
        txtAgent.Text = selecteAgent.Agent
        txtStreet.Text = selecteAgent.Street
        txtCity.Text = selecteAgent.City
        txtState.Text = selecteAgent.State
        txtPostalCode.Text = selecteAgent.PostalCode
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

End Class
