<%@ Page Title="" Language="VB" MasterPageFile="~/AgencyPortal/SupplyRequest/Request.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="AgencyPortal_SupplyRequest_Cart" %>

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
        <h2>SHOPPING CART</h2>
   </td>
</tr>
</table>
</div>

        <hr style="border: 1px dashed #d4d4d4;" />
        <div class="cart">
        <ul>
        <li>
        <label>Your cart: <br />
        <asp:ListBox 
             ID="lstCart" 
             runat="server" 
             CssClass="listBox1" />
         </label> 
        </li>
        </ul>
       </div>  

      <%--<div style="clear:left;"></div>--%>

   <div class="cartbuttons">
      <ul>
         <li><asp:Button ID="btnRemove" runat="server" Text="Remove Item" CssClass="buttons" Width="120" /></li>
         <li><asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CssClass="buttons" Width="120" /></li>
      </ul>
   </div>

<div class="clear"></div>            

<p id="message">
    <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>
</p>  
 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div id="footer">      
<div class="landscape">
    <ul class="command">
    <li>
        <asp:LinkButton ID="lnkContinue" runat="server" PostBackUrl="~/AgencyPortal/SupplyRequest/Order.aspx" Text="Continue Shopping" />
    </li>              
    <li>
        <asp:LinkButton ID="lnkCheckOut" runat="server" Text="Check Out" />
    </li>
    </ul>
</div>
</div> 
</asp:Content>

