<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_agent.master" AutoEventWireup="false" CodeFile="my_policies3.aspx.vb" Inherits="AgencyPortal_my_policies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<hr />
<div id="tools">
        <div id="center-box">
           <asp:GridView 
                ID="GridView3" 
                runat="server" 
                EmptyDataText="No Match Found." 
                DataSourceID="ObjectDataSource1" 
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
                    <asp:BoundField DataField="Custnumber" HeaderText="Cust.  No." 
                        SortExpression="CUST0NO">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Symbol" HeaderText="Symbol" SortExpression="SYMBOL" 
                        Visible="False">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Policynum" HeaderText="Policy" 
                        SortExpression="POLICY0NUM">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="M0dule" HeaderText="Module" SortExpression="M0DULE" 
                        Visible="False">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Add0line01" HeaderText="Insured Name" 
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
                    <asp:HyperLinkField DataNavigateUrlFields="Viewinvoice" 
                        DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:DocumentOnly,UserType:Internal,MMRecipList:Insured Invoice,DocNumber:{0}" 
                        HeaderText="Invoice" Target="_blank" Text="View" />
                    <asp:HyperLinkField DataNavigateUrlFields="Viewpolicy" 
                        DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:DocumentOnly,UserType:Internal,MMRecipList:Insured Copy,DocNumber:{0}" 
                        HeaderText="Policy" Target="_blank" Text="View" />
                </Columns>
                <FooterStyle BackColor="white" ForeColor="#4A3C8C" />
                <HeaderStyle Font-Bold="True" ForeColor="#042D87" BackColor="#FFFFFF" 
                    HorizontalAlign="Left" />
                <PagerSettings FirstPageText="First" LastPageText="Last" 
                    Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                <PagerStyle BackColor="White" ForeColor="#4A3C8C" 
                    HorizontalAlign="Center" BorderStyle="None" />
                <RowStyle BackColor="White" ForeColor="#003366" />
                <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
           </asp:GridView>
           <br />

          <asp:ObjectDataSource 
               ID="ObjectDataSource1" 
               runat="server" 
               SelectMethod="AgencyCustomerList3"
               TypeName="smci.DataAccessLayer.MySqlIdb2Code">
           <SelectParameters>
            <asp:QueryStringParameter Name="Policynum" QueryStringField="policynum" />
          </SelectParameters>
          </asp:ObjectDataSource>
          </div>
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

</asp:Content>


