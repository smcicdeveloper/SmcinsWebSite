<%@ Page Title="" Language="VB" MasterPageFile="~/AgencyPortal/SupplyRequest/Request.master" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="AgencyPortal_SupplyRequest_Order" %>

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
        <h2>PRODUCTS</h2>
   </td>
</tr>
</table>
</div>

<hr style="border: 1px dashed #d4d4d4;" />

<div class="order">
 <ul>
   <li>
<asp:RadioButtonList 
    ID="rblCategory" 
    runat="server"  
    AutoPostBack="True" 
    RepeatDirection="Horizontal" 
    CssClass="radioControl">
    <asp:ListItem Selected="True" Value="1">Flyers and Pamphlets</asp:ListItem>
    <asp:ListItem Value="2">Stationary</asp:ListItem>
    <asp:ListItem Value="3">Give Away</asp:ListItem>
</asp:RadioButtonList>
</li>
 <asp:SqlDataSource 
    ID="scrCategory" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:SMCI %>" 
    SelectCommand="SELECT CATEGORY_ID, CATEGORY FROM SupplyCategory">
</asp:SqlDataSource>
<li>
<label>Select Item: <br />
  <asp:DropDownList 
    ID="ddlSupplies" 
    runat="server" 
    DataSourceID="srcSupplies" 
    DataTextField="ITEM" 
    DataValueField="PRODUCT_ID" 
    CssClass="dropDownList" 
    Width="200px" 
    AutoPostBack="True">
</asp:DropDownList>  
</label>
<asp:SqlDataSource 
    ID="srcSupplies" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:SMCI %>"  
    SelectCommand="SELECT PRODUCT_ID, ITEM FROM AgentSupplyList WHERE (CATEGORY_ID = @catid)" 
    ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="rblCategory" Name="catid" 
            PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
</li>



<li>
    <asp:DataList 
        ID="DataList1" 
        runat="server" 
        DataKeyField="PRODUCT_ID" 
        DataSourceID="srcImages" 
        BackColor="White" 
        BorderColor="#d4d4d4" 
        BorderStyle="Ridge" 
        BorderWidth="1px" 
        CellPadding="3" 
        CellSpacing="1"
        CssClass="myDataList" 
        Width="390px">
    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
    <ItemTemplate>
        <div class="div_right">
        <asp:Image 
        ID="Image1" 
        runat="server" 
        ImageUrl='<%# String.Format("ProductHandler.ashx?PRODUCT_ID={0}", Eval("PRODUCT_ID")) %>' />                
        </div>
        <div class="div_left">
        <asp:Label ID="PRODLabel" runat="server" Text='<%# Eval("PRODUCT_ID") %>' Visible="false" />
        <br />
        <asp:Label ID="ITEMLabel" runat="server" Text='<%# Eval("ITEM") %>' />
        <br />
        <b><asp:Label ID="ITEMSTATUSLabel" runat="server" Text='<%# Eval("ITEM_STATUS") %>'></asp:Label></b>
        </div>
    </ItemTemplate>
    <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
</asp:DataList>

  <asp:SqlDataSource 
    ID="srcImages" 
    ConnectionString="<%$ ConnectionStrings:SMCI %>" 
    SelectCommand="SELECT PRODUCT_ID, ITEM, ITEM_STATUS, CATEGORY_ID FROM AgentSupplyList WHERE PRODUCT_ID=@productid"
    runat="server">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSupplies" Name="productid" PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
</li>
<li>
    <label>Quantity: <br />
    <asp:TextBox ID="txtQuantity" runat="server" MaxLength="3" Width="50" CssClass="textbox"></asp:TextBox>
    <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" 
        runat="server" 
        ControlToValidate="txtQuantity" 
        Display="Dynamic" 
        Text="*" 
        ForeColor="Red"
        ErrorMessage="Quantity is a required field." 
        CssClass="validator">
    </asp:RequiredFieldValidator>
    <asp:RangeValidator 
         ID="RangeValidator1" 
         runat="server" 
         ControlToValidate="txtQuantity" 
         Display="Dynamic" 
         Text="*"
         ForeColor="Red"
         ErrorMessage="Quantity must range from 1 to 500."
         MaximumValue="500" 
         MinimumValue="1" 
         Type="Integer" 
         CssClass="validator">
    </asp:RangeValidator>
    <asp:ValidationSummary 
        ID="ValidationSummary1" 
        ShowSummary="false" 
        ShowMessageBox="true" 
        runat="server" />  
</label>
</li>
 </ul>

 </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="footer">
 <div class="landscape">   
 <ul class="command">
    <li>
       <asp:LinkButton ID="lnkAdd" runat="server" Text="Add to Cart" />
   </li>
    <li>
      <asp:LinkButton ID="lnkCart" runat="server" Text="Go to Cart" CausesValidation="False" PostBackUrl="~/AgencyPortal/SupplyRequest/Cart.aspx" />
    </li>
 </ul>
</div>   
</div>
</asp:Content>