<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_agent.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="search_by_policy_number.aspx.vb" Inherits="AgencyPortal_search_by_policy_number" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="search">
     <fieldset>
          <ul> 
            <li><label>Policy Number:</label></li>
            <li><asp:TextBox ID="txtPolicyNum" runat="server" Width="271px" MaxLength="7" /></li>
            <li><asp:Button ID="btnSearch" runat="server" Text="Search" /></li>
          </ul>
    </fieldset>
   </div>
   <br /><br />
<div id="center-box">
         <asp:GridView 
            ID="GridView1" 
            runat="server" 
            EmptyDataText="No Match Found." 
            CssClass="tools_gridview"
            AllowPaging="True"
            PageSize="50" 
            AutoGenerateColumns="False" 
            BackColor="White" 
            BorderColor="#E7E7FF" 
            BorderStyle="None" 
            BorderWidth="0px" 
            CellPadding="3" 
            GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="AGENCY" HeaderText="Agency" Visible="False" 
                    SortExpression="AGENCY">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Custnumber" HeaderText="Customer Number" 
                    SortExpression="CUST0NO">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Symbol" HeaderText="Symbol" SortExpression="SYMBOL">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Policynum" HeaderText="Policy Number" 
                    SortExpression="POLICY0NUM">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="M0dule" HeaderText="Module" SortExpression="M0DULE" 
                    Visible="False">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Add0line01" HeaderText="The Insured" 
                    SortExpression="ADD0LINE01">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Eff. Date" SortExpression="EFF0DT">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Effdate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Effdate", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exp. Date" SortExpression="EXP0DT">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Expdate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Expdate", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="Type0act" HeaderText="TYPE0ACT" 
                    SortExpression="TYPE0ACT" Visible="False">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="Policynum" 
                    HeaderText="Change Request" Text="Submit Request" 
                    DataNavigateUrlFormatString="change_request_form.aspx?policynum={0}" Target="_blank"/>
                <asp:HyperLinkField DataNavigateUrlFields="Viewinvoice" 
                    DataNavigateUrlFormatString="http://172.16.1.11/Mediamgtc0smcrscriptmain/MMInterfaceCall.asp?userlist=Source:SMCRISrc,Level:DocumentOnly,UserType:External,MMRecipList:Insured Invoice,MMDocNum:{0}" 
                    HeaderText="Invoice" Target="_blank" Text="View" />
                <asp:HyperLinkField DataNavigateUrlFields="Viewpolicy" 
                    DataNavigateUrlFormatString="http://172.16.1.11/Mediamgtc0smcrscriptmain/MMInterfaceCall.asp?userlist=Source:SMCRISrc,Level:DocumentOnly,UserType:External,MMRecipList:Insured,MMDocNum:{0}" 
                    HeaderText="Policy" Target="_blank" Text="View" />
            </Columns>
            <FooterStyle BackColor="white" ForeColor="#4A3C8C" />
            <HeaderStyle Font-Bold="True" ForeColor="#042D87" BackColor="#FFFFFF" />
            <PagerSettings FirstPageText="First" LastPageText="Last" 
                Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
            <PagerStyle BackColor="White" ForeColor="#4A3C8C" 
                HorizontalAlign="Center" BorderStyle="None" />
            <RowStyle BackColor="White" ForeColor="#003366" />
            <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:GridView>
           <br />

        <asp:ObjectDataSource 
            ID="ObjectDataSource2" 
            runat="server" 
            SelectMethod="AgencyCustomerList4"
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
            <asp:ControlParameter ControlID="txtPolicyNum" Name="PolicyNumberIs" 
                PropertyName="Text" />
        </SelectParameters>
        </asp:ObjectDataSource>
        </div>
</asp:Content>

