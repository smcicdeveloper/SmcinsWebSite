<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AddressForm.ascx.vb" Inherits="AgencyPortal_SupplyRequest_AddressForm" %>

<fieldset>
 <legend>
     <asp:Literal 
          ID="ltlTitle" 
          Text="Address Form" 
          runat="server" />
 </legend>

 <table>
 <tr>
  <td><asp:Label ID="lblAttn" runat="server" Text="Attn:" AssociatedControlID="txtStreet" /></td>
  <td><asp:TextBox ID="txtAttn" runat="server" CssClass="textbox" ReadOnly="True" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblAgent" runat="server" Text="Agency:" AssociatedControlID="txtAgent" /></td>
  <td><asp:TextBox ID="txtAgent" runat="server" Width="350px" CssClass="textbox" 
          ReadOnly="True" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblStreet" runat="server" Text="Street:" AssociatedControlID="txtStreet" /></td>
  <td><asp:TextBox ID="txtStreet" runat="server" CssClass="textbox" ReadOnly="True" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblCity" runat="server" Text="City:" AssociatedControlID="txtCity" /></td>
  <td><asp:TextBox ID="txtCity" runat="server" CssClass="textbox" ReadOnly="True" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblState" runat="server" Text="State:" AssociatedControlID="txtState" /></td>
  <td><asp:TextBox ID="txtState" runat="server" CssClass="textbox" ReadOnly="True" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblPostalCode" runat="server" Text="Postal code:" AssociatedControlID="txtPostalCode" /></td>
  <td><asp:TextBox ID="txtPostalCode" runat="server" CssClass="textbox" 
          ReadOnly="True" /></td>
 </tr>
 </table>

</fieldset>



  <asp:SqlDataSource 
    ID="srcAgents" 
    ConnectionString="<%$ ConnectionStrings:SMCI %>" 
    SelectCommand="SELECT abi.AGENT_NUMBER, abi.NAME_OF_AGENCY, api.FIRST_NAME + ' ' + api.LAST_NAME As FULL_NAME, aai.MAILING_ADDRESS, aai.MAILING_CITY, aai.MAILING_STATE, aai.MAILING_ZIP FROM AgencyAddressInformation AS aai INNER JOIN AgencyProfileInformation AS api ON aai.AGENT_NUMBER = api.AGENT_NUMBER INNER JOIN AgencyBusinessInformation As abi ON aai.AGENT_NUMBER = abi.AGENT_NUMBER WHERE abi.AGENT_NUMBER=@UserNameIs"
    runat="server">
        <SelectParameters>
            <asp:SessionParameter 
            Name="UserNameIs" 
            SessionField="UserNameIs" 
            Type="String" />
        </SelectParameters>
</asp:SqlDataSource>

   <asp:ObjectDataSource 
        ID="OdsAllPortal" 
        runat="server" 
        SelectMethod="GetAgentName" 
        TypeName="smci.SqlAccessLayer.MySqlCode">
    <SelectParameters>
        <asp:SessionParameter 
        Name="UserNameIs" 
        SessionField="UserNameIs" 
        Type="String" />
    </SelectParameters>
    </asp:ObjectDataSource>