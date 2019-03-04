<%@ Page Title="" Language="VB" MasterPageFile="~/AgencyPortal/SupplyRequest/Request.master" AutoEventWireup="false" CodeFile="InvoiceForm.aspx.vb" Inherits="AgencyPortal_SupplyRequest_InvoiceForm" %>

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
        <h2>ORDERS</h2>
   </td>
</tr>
</table>
</div>

<hr style="border: 1px dashed #d4d4d4;" />

<asp:Panel ID="Panel1" runat="server"> 
 <div>
<table class="grid">
  <tr>
    <td><h5>SHIP TO:</h5></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td>
      <asp:Label ID="Label2" runat="server" Text="ATTN:" Font-Bold="True" />&nbsp;<asp:Label ID="LabelAttn" runat="server"/>
    </td>
  </tr>
    <tr>
    <td>
      <asp:Label ID="LabelAgent" runat="server"/>
    </td>
  </tr>
    <tr>
    <td>
     <asp:Label ID="LabelStreet" runat="server" />  
    </td>
  </tr>
  <tr>
    <td><asp:Label ID="LabelCity" runat="server" />
    <asp:Label ID="LabelComma" runat="server" Text="," />
    <asp:Label ID="LabelState" runat="server" />
    <asp:Label ID="LabelPostalCode" runat="server" /></td>
  </tr>
</table>
</div>
</asp:Panel> <%--End Panel 1--%>

<div class="clear"></div>

<hr />

<div class="myListbox">
    <asp:ListBox 
     ID="lstFinal" 
     runat="server" 
     Width="590px" 
     CssClass="listBox2" 
     Height="300px" />
</div>
<br />

<hr />

<asp:Panel ID="Panel2" runat="server">
    <ul>
      <li>
        <label style="font-weight:normal;">Would you like a copy of your orders be sent to your email address? <br />
       <asp:RadioButtonList 
            ID="rblSendEmail" 
            runat="server" 
            RepeatDirection="Horizontal" 
            CssClass="radiolist" 
            AutoPostBack="True">
         <asp:ListItem Text="Yes" Value="Yes" />
         <asp:ListItem Selected="True" Text="No" Value="No" />                      
       </asp:RadioButtonList> 
       </label>
    </li>
    <li>
    <label>Email: <br />
      <asp:TextBox 
        ID="txtEmail" 
        runat="server" 
        CssClass="textbox" 
        MaxLength="50" />
    </label>
    <asp:RequiredFieldValidator 
        ID="rfvEmail" 
        Text="*" 
        ControlToValidate="txtEmail" 
        ForeColor="Red"
        runat="server" />  
    <asp:RegularExpressionValidator 
        ID="regEmail" 
        runat="server" 
        ErrorMessage="Invalid email" 
        ControlToValidate="txtEmail" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
      </li>
    </ul>
</asp:Panel>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div id="footer">
<div class="landscape">
    <ul class="command">
      <li>        
          <asp:LinkButton ID="lnkFinal" runat="server" Text="Send Order" />
      </li>
      <li>     
          <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" />
      </li>
    </ul>
</div> <%--End landscape--%>
</div> <%--End Footer--%>
</asp:Content>

