<%@ Page Title="" Language="VB" MasterPageFile="~/AgencyPortal/SupplyRequest/Request.master" AutoEventWireup="false" CodeFile="AddressCheck.aspx.vb" Inherits="AgencyPortal_SupplyRequest_AddressCheck" %>

<%@ Register src="AddressForm.ascx" tagname="AddressForm" tagprefix="uc1" %>

<script runat="server">
    Public ReadOnly Property radioString() As String
        Get
            Return rdlMail.Text
        End Get
    End Property
    
    Public ReadOnly Property streetString() As String
        Get
            Return txtStreet.Text
        End Get
    End Property
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="header">
<table>
<tr>
    <td>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/AgencyPortal/SupplyRequest/Images/smcic-logo-white.png" />        
        </td>
    <td style="width:85%;">
        </td>
    <td>
        <h2>SHIPMENT</h2>
   </td>
</tr>
</table>
</div>

<hr style="border: 1px dashed #d4d4d4;" />

<%--<div class="content">--%>
<asp:RadioButton 
        ID="rdlMail" 
        runat="server" 
        Text="Ship To:" 
        GroupName="Go" 
        AutoPostBack="True" 
        Checked="True"   
        CssClass="radioControl" />
       
<asp:Panel ID="Panel1" runat="server" CssClass="panel">
<uc1:AddressForm ID="AddressForm1" runat="server" />
</asp:Panel>

<br />

<asp:RadioButton 
    ID="rdlShip" 
    runat="server" 
    Text="Ship To:" 
    GroupName="Go" 
    AutoPostBack="True" 
    CssClass="radioControl" />
<br />

 <asp:Panel ID="Panel2" runat="server" CssClass="panel">   
<fieldset>
 <legend>
     <asp:Literal 
          ID="ltlTitle" 
          Text="Shipping Address" 
          runat="server" />
 </legend>

 <table>
 <tr>
  <td><asp:Label ID="lblAttn" runat="server" Text="Attn:" AssociatedControlID="txtStreet" /></td>
  <td><asp:TextBox ID="txtAttn" runat="server" MaxLength="25" CssClass="textbox" /></td>
  <td><asp:RequiredFieldValidator ID="reqAttn" Text="*" ControlToValidate="txtAttn" runat="server" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblAgent" runat="server" Text="Agency:" AssociatedControlID="txtAgent" /></td>
  <td><asp:TextBox ID="txtAgent" runat="server" Width="350px" MaxLength="125" CssClass="textbox" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblStreet" runat="server" Text="Street:" AssociatedControlID="txtStreet" /></td>
  <td><asp:TextBox ID="txtStreet" runat="server" MaxLength="45" CssClass="textbox" /></td>
  <td><asp:RequiredFieldValidator ID="reqStreet" Text="*" ControlToValidate="txtStreet" runat="server" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblCity" runat="server" Text="City:" AssociatedControlID="txtCity" /></td>
  <td><asp:TextBox ID="txtCity" runat="server" MaxLength="20" CssClass="textbox" /></td>
  <td><asp:RequiredFieldValidator ID="reqCity" Text="*" ControlToValidate="txtCity" runat="server" /></td>
 </tr>
  <tr>
  <td><asp:Label ID="lblState" runat="server" Text="State:" AssociatedControlID="ddlState" /></td>
  <td><asp:DropDownList ID="ddlState" runat="server" CssClass="dropDownList">
        <asp:ListItem>GA</asp:ListItem>
        <asp:ListItem>KY</asp:ListItem>
        <asp:ListItem>NC</asp:ListItem>
        <asp:ListItem>SC</asp:ListItem>
        <asp:ListItem>TN</asp:ListItem>
        <asp:ListItem>VA</asp:ListItem>
    </asp:DropDownList>
  </td>
 </tr>
  <tr>
  <td><asp:Label ID="lblPostalCode" runat="server" Text="Postal code:" AssociatedControlID="txtPostalCode" /></td>
  <td><asp:TextBox ID="txtPostalCode" runat="server" MaxLength="5" CssClass="textbox" /></td>
  <td><asp:RequiredFieldValidator ID="reqZip" Text="*" ControlToValidate="txtPostalCode" runat="server" /></td>
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

</asp:Panel>

<%--</div>--%> <%--End content--%>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="footer">
<div class="landscape">
<ul class="command">
<li>
  <asp:LinkButton ID="lnkSubmit" runat="server" Text="Submit" onclick="lnkSubmit_Click" />
</li>
</ul>         
</div> <%--End landscape--%>
</div> <%--End Footer--%>
</asp:Content>

