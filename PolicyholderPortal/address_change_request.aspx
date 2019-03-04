<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_portal.master" AutoEventWireup="false" CodeFile="address_change_request.aspx.vb" Inherits="PolicyholderPortal_address_change_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <h3>Policyholder Information</h3>
        <hr />
            <asp:DetailsView 
                 ID="dltAddress" 
                 runat="server" 
                 Height="50px" 
                 Width="228px" 
                 AutoGenerateRows="False" 
                 DataSourceID="odsIseries" BorderStyle="None" BorderWidth="0px">
                <Fields>
                    <asp:TemplateField HeaderText="Insured:">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ADD0LINE01") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ADD0LINE01") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInsured" runat="server" Text='<%# Bind("ADD0LINE01") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True" Font-Size="11px" />
                        <ItemStyle Font-Size="11px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ADD0LINE03" HeaderText="Address:" >
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ADD0LINE04" HeaderText="City/State:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZIP0POST" HeaderText="Zip:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                </Fields>
                <HeaderStyle Font-Bold="True" Font-Size="11px" />
            </asp:DetailsView>
            <br />
            <h3>Mailing Address</h3>
            <hr />
            <asp:DetailsView 
                 ID="dltMailingAddress" 
                 runat="server" 
                 Height="50px" 
                 Width="228px"
                 AutoGenerateRows="False" 
                 DataSourceID="odsIseries" BorderStyle="None" BorderWidth="0px">
                <Fields>
                    <asp:BoundField DataField="ADD0LINE03" HeaderText="Address:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ADD0LINE04" HeaderText="City/State:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZIP0POST" HeaderText="Zip">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                </Fields>
            </asp:DetailsView>
            <br />
            <h3>Contact Representative</h3>
            <hr />
            <asp:DetailsView 
                 ID="DetailsView1" 
                 runat="server" 
                 Height="50px" 
                 Width="228px"
                 AutoGenerateRows="False" 
                 DataSourceID="OdsAllPortal" 
                 BorderStyle="None" 
                 BorderWidth="0px">
                <Fields>
                    <asp:BoundField DataField="FullName" HeaderText="Contact Name:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" Width="85px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="phone" HeaderText="Phone">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                </Fields>
            </asp:DetailsView>

         <asp:ObjectDataSource 
            ID="odsIseries" 
            runat="server" 
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="TestCustomerInfo" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
          <asp:SessionParameter 
            Name="UserNameIs" 
            SessionField="UserNameIs" />
        </SelectParameters>
        </asp:ObjectDataSource>

      <asp:ObjectDataSource 
        ID="OdsAllPortal" 
        runat="server" 
        SelectMethod="GetUserProfile" 
        TypeName="smci.SqlAccessLayer.MySqlCode">
    <SelectParameters>
      <asp:SessionParameter 
        Name="UserNameIs" 
        SessionField="UserNameIs" 
        Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<h3>Address Change Request</h3>
<div id="address_change">
<fieldset>

<ul>
<li><label>Street:</label></li>
<li><asp:TextBox ID="txtStreet" runat="server" Width="276px" MaxLength="45" />&nbsp;<asp:RequiredFieldValidator ID="rfvStreet" runat="server" ControlToValidate="txtStreet" ErrorMessage="Missing street information." Text="*" ForeColor="Red" /></li>
</ul>
<ul>
<li><label>City:</label></li>
<li><asp:TextBox ID="txtCity" runat="server" Width="181px" MaxLength="25" />&nbsp;<asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="Missing City's name." Text="*" ForeColor="Red" /></li>
</ul>
<ul>
<li><label>State:</label></li>
<li>
   <asp:DropDownList 
         ID="ddlState" 
         runat="server">
       <asp:ListItem>GA</asp:ListItem>
       <asp:ListItem>NC</asp:ListItem>
       <asp:ListItem>SC</asp:ListItem>
       <asp:ListItem>TN</asp:ListItem>
    </asp:DropDownList>
</li>
</ul>
<ul>
<li><label>Zip:</label></li>
<li><asp:TextBox ID="txtZip" runat="server" Width="103px" MaxLength="5" />&nbsp;<asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZip" ErrorMessage="Missing zip code." Text="*" ForeColor="Red" /></li>
</ul>
<ul>
<li><label>Attn:</label></li>
<li><asp:TextBox ID="txtAttn" runat="server" Width="180px" MaxLength="25" /></li>
</ul>
<br />
    <asp:LinkButton 
         ID="lbtnSubmit" 
         Text="Submit Request" 
         runat="server" />
    &nbsp;|&nbsp;
    <asp:HyperLink 
         ID="hlnk" 
         Text="Back to My Account" 
         NavigateUrl="~/PolicyholderPortal/policyholder_tools.aspx" 
         runat="server" />
<br /><br />
</fieldset>
</div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
</asp:Content>


