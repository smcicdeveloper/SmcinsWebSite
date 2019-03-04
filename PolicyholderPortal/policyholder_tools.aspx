<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_portal.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="policyholder_tools.aspx.vb" Inherits="Policyholder_policyholder_tools" %>

<%@ Register TagPrefix="custom" Namespace="myControls" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script type="text/javascript" >
        history.forward(1);
    </script>

        <h3>Policyholder Information</h3>
        <hr />
            <asp:DetailsView 
                 ID="dltAddress" 
                 runat="server" 
                 Height="50px" 
                 Width="228px" 
                 AutoGenerateRows="False" 
                 DataSourceID="odsIseries" 
                 BorderStyle="None" 
                 BorderWidth="0px">
                <Fields>
                    <asp:BoundField DataField="ADD0LINE01" HeaderText="Insured:" >
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
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
                 ID="dltContact" 
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
<br />
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
        <custom:ClientTabs id="ClientTabs1" Runat="server">

    <custom:Tab ID="Tab1" Text="Tools" runat="server">
        <div id="tools_container_top">

             <asp:GridView 
                 ID="gvSmpPolicies" 
                 runat="server" 
                 DataSourceID="srcDb2" 
                 AutoGenerateColumns="False" 
                 DataKeyNames="CustomerNum" 
                 BackColor="White" 
                 PageSize="4" 
                 BorderStyle="None" 
                 HeaderStyle-HorizontalAlign="Left" 
                 BorderColor="#E7E7FF" 
                 BorderWidth="1px" 
                 CellPadding="3" 
                 Width="505px"
                 GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="Policy Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("POLICY0NUM") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PolicyType") %>'></asp:Label>&nbsp;
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PolicyNum") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Width="125px" />
                        <ItemStyle Font-Size="11px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exp. Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ExpDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExpDate", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True" Width="125px" HorizontalAlign="Left" />
                        <ItemStyle Font-Size="11px" />
                    </asp:TemplateField>
                    <asp:HyperLinkField  DataNavigateUrlFields="HyperlinkId" HeaderText="Policy" Target="_blank" Text="View" DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:DocumentOnly,UserType:Internal,MMRecipList:Insured Copy,DocNumber:{0}">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="125px" />
                     <ItemStyle Font-Size="11px" HorizontalAlign="Center" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField  DataNavigateUrlFields="Currentpol" HeaderText="Invoice" Target="_blank" Text="View" Visible="true" DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:DocumentOnly,UserType:Internal,MMRecipList:Insured Invoice,DocNumber:{0}">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                     <ItemStyle Font-Size="11px" />
                    </asp:HyperLinkField>
                </Columns>
                   <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                   <HeaderStyle Font-Bold="True" ForeColor="#042D87" BackColor="#FFFFFF" />
                   <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                   <RowStyle BackColor="White" ForeColor="#003366" />
                   <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:GridView> 

                 <asp:GridView 
                 ID="gvOtherPolicies" 
                 runat="server" 
                 DataSourceID="srcOtherPolicies" 
                 AutoGenerateColumns="False" 
                 DataKeyNames="CustomerNum" 
                 BackColor="White" 
                 AllowPaging="True" 
                 PageSize="8" 
                 BorderStyle="None" 
                 HeaderStyle-HorizontalAlign="Left" 
                 BorderColor="#E7E7FF" 
                 BorderWidth="1px" 
                 CellPadding="3" 
                 Width="505px"
                 GridLines="Horizontal" ShowHeader="False">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="Policy number" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("POLICY0NUM") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PolicyType") %>'></asp:Label>&nbsp;
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PolicyNum") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Width="125px" />
                        <ItemStyle Font-Size="11px" HorizontalAlign="Left" Width="125px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exp. Date" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ExpDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExpDate", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True" Width="125px" HorizontalAlign="Left" />
                        <ItemStyle Font-Size="11px" Width="125px" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:HyperLinkField  DataNavigateUrlFields="HyperlinkId" Target="_blank" 
                        Text="View" 
                        DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRISrc,Level:DocumentOnly,UserType:External,MMRecipList:,Insured Invoice,Insured,MMDocNum:{0}" 
                        ShowHeader="False">
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="125px" />
                     <ItemStyle Font-Size="11px" Width="125px" HorizontalAlign="Center" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField  DataNavigateUrlFields="HyperlinkId" Target="_blank" 
                        Text="View" 
                        Visible="true"                       
                        DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRISrc,Level:DocumentOnly,UserType:External,MMRecipList:Insured Invoice,MMDocNum:{0}" 
                        ShowHeader="False" >
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                     <ItemStyle Font-Size="11px" Width="125px" HorizontalAlign="Left" />
                    </asp:HyperLinkField>
                </Columns>
                   <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                   <HeaderStyle Font-Bold="True" ForeColor="#042D87" BackColor="#FFFFFF" />
                   <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                   <RowStyle BackColor="White" ForeColor="#003366" />
                   <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:GridView> 


       </div>
           <br />
            <div id="tools_container_bottom">
            <h2>Workers Compensation Claims</h2>
            <asp:Repeater 
             ID="rptClaims" 
             runat="server" 
             DataSourceID="odsWorkers">
             <HeaderTemplate>
             <ul class="fileList">
             </HeaderTemplate>
             <ItemTemplate>
             <li>
            <asp:HyperLink 
                ID="lnkFile" 
                Text='<%#Eval("FileName")%>' 
                NavigateUrl='<%#Eval("Id", "FileHandler.ashx?id={0}")%>' 
                Target="_blank"
                runat="server" />
             </li>
             </ItemTemplate>
             <FooterTemplate>
            </ul>
             </FooterTemplate>
        </asp:Repeater>
            </div>
            <br />
            <br />
            <br />
         <asp:ObjectDataSource 
             ID="odsWorkers" 
             runat="server" 
             SelectMethod="GetWorkersCompForms" 
             TypeName="smci.SqlAccessLayer.MySqlCode">
        </asp:ObjectDataSource>
 </custom:Tab> 
        
                
 <custom:Tab ID="Tab2" Text="Account Summary" runat="server">
          <div id="billing">
          <fieldset>
          <legend>Balance</legend>
        <asp:DataList 
             ID="DataList1" 
             runat="server" 
             DataSourceID="srcGetBilling" 
             RepeatColumns="1" 
             CellPadding="4" 
             BackColor="White" 
             BorderColor="#CC9966" 
             BorderStyle="None" 
             BorderWidth="0px" 
             GridLines="Both">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <ItemStyle BackColor="White" ForeColor="#330099" />
            <ItemTemplate>
            <%--<div id="billing">--%>
                <ul>
                <li>
                <label><b>Policy Type:</b><br /> 
                <asp:Label ID="PolicyTypeLabel" runat="server" 
                    Text='<%# Eval("PolicyType") %>' ForeColor="#666666" />
                 </label>
                 </li>
                <li>
                <label><b>Exp Date:</b><br />
                <asp:Label ID="ExpDateLabel" runat="server" Text='<%# Eval("ExpDate", "{0:d}") %>' ForeColor="#666666" />
                </label>
                </li>

                <li><label><b>Total Premium:</b><br />
                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("TotalPrem", "{0:c}") %>' ForeColor="Blue" />
                </label>
                </li>
                <li><label><b>Total Paid:</b><br />
                <asp:Label ID="TotalPaidLabel" runat="server" Text='<%# Eval("TotalPaid", "{0:c}") %>' ForeColor="Green" />
                 </label>
                </li>
                <li>
                <label><b>Balance:</b><br />
                <asp:Label ID="BalanceLabel" runat="server" Text='<%# Eval("Balance", "{0:c}") %>' ForeColor="Blue" />
                 </label>
               </li>
               <li>
                <label><b>Payment Type:</b><br />
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Paymenttype") %>' ForeColor="#666666" />
                </label>
               </li>
                </ul>
               <%-- </div>--%>
                <br />
                <br />
            </ItemTemplate>
             <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        </asp:DataList>
        </fieldset>
        <br />
        <fieldset>
         <legend>Next Payment</legend>
          <asp:DataList 
               ID="DataList2" 
               runat="server" 
               DataSourceID="srcNextPayment" 
               RepeatColumns="1" 
               CellPadding="4" 
               BackColor="White" 
               BorderColor="#CC9966" 
               BorderStyle="None" 
               BorderWidth="0px" 
               GridLines="Both">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <ItemStyle BackColor="White" ForeColor="#330099" />
            <ItemTemplate>
            <%--<div id="billing">--%>
                <ul>
                <li>
                <label><b>Policy Type:</b><br /> 
                <asp:Label ID="PolicyTypeLabel" runat="server" 
                    Text='<%# Eval("PolicyType") %>' ForeColor="#666666" />
                 </label>
                 </li>
                <li>
                <label><b>Next Payment:</b><br />
                <asp:Label ID="ExpDateLabel" runat="server" Text='<%# Bind("Nextpayment", "{0:c}") %>' ForeColor="#666666" />
                </label>
                </li>
                <li><label><b>Due Date:</b><br />
                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("Datedue", "{0:d}") %>' ForeColor="" />
                </label>
                </li>
<%--                <li><label><br />
                <asp:Label ID="TotalPaidLabel" runat="server" Text='<%# Eval("Message") %>' ForeColor="Red" />
                 </label>
                </li>--%>
                </ul>
               <%-- </div>--%>
                <br />
                <br />
            </ItemTemplate>
             <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        </asp:DataList>
           <br />
        <asp:Label ID="lblEmptyData" runat="server" />
        <br />
    </fieldset>
        </div>
          <div class="clearthefloats"></div>
 </custom:Tab> 
        
           
      <custom:Tab ID="Tab3" Text="Payment History" runat="server">
       <asp:GridView 
        ID="gvCost" 
        BorderWidth="1px"
        BorderStyle="None"
        runat="server" 
        AutoGenerateColumns="False" 
        DataSourceID="srcPaymentInfo"
        AllowPaging="True" 
        PageSize="15" 
        HeaderStyle-HorizontalAlign="Left" 
        BackColor="White" 
        BorderColor="#E7E7FF" 
        CellPadding="3" 
        GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
        <asp:BoundField DataField="D3POLTYPE" HeaderText="Policy Number" 
                SortExpression="D3POLTYPE" >
        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
            <ItemStyle Font-Size="11px" />
        </asp:BoundField>
            <asp:BoundField DataField="D3D4RCPTID" HeaderText="Check Number" 
                SortExpression="D3D4RCPTID">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <ItemStyle Font-Size="11px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Amt Received" SortExpression="AMOUNT">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AMOUNT", "{0:c}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("AMOUNT", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <ItemStyle Font-Size="11px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="D3WRITDATE">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("D3WRITDATE", "{0:d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("D3WRITDATE", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Font-Size="11px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#d8eaf6" ForeColor="#4A3C8C" HorizontalAlign="Center" />
         <HeaderStyle Font-Bold="True" ForeColor="#042D87" BackColor="#FFFFFF" />
        <PagerStyle BackColor="#d8eaf6" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#003366" />
        <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
       </asp:GridView>  
  </custom:Tab>  
          
  <custom:Tab ID="Tab4" Text="Claim History" runat="server">
       <asp:GridView 
        ID="gvClaimPmts" 
        BorderWidth="1px"
        BorderStyle="None"
        runat="server" 
        AutoGenerateColumns="False" 
        DataSourceID="srcClaimPmts"
        AllowPaging="True" 
        PageSize="15" 
        HeaderStyle-HorizontalAlign="Left" 
        BackColor="White" 
        BorderColor="#E7E7FF" 
        CellPadding="3" 
        GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="CLAIM" HeaderText="Claim Number" 
                    SortExpression="CLAIM" >
                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <ItemStyle Font-Size="11px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Check Date" SortExpression="DRFTPRTDTE">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DRFTPRTDTE", "{0:d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DRFTPRTDTE", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Font-Size="11px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount Paid" SortExpression="DRFTAMT">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DRFTAMT", "{0:c}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DRFTAMT", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <ItemStyle Font-Size="11px" />
            </asp:TemplateField>
            <asp:BoundField DataField="DRFTNUMBER" HeaderText="Check Number" 
                SortExpression="DRFTNUMBER">
            <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="125px" />
                <ItemStyle Font-Size="11px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#d8eaf6" ForeColor="#4A3C8C" HorizontalAlign="Center" />
         <HeaderStyle Font-Bold="True" ForeColor="#042D87" BackColor="#FFFFFF" />
        <PagerStyle BackColor="#d8eaf6" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#003366" />
        <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
       </asp:GridView>
   </custom:Tab>
<%--  <div class="clearthefloats"></div>--%>
  </custom:ClientTabs>

 

<asp:ObjectDataSource 
    ID="srcAgency" 
    runat="server"
    SelectMethod="ReadAgencyInfo"
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
</asp:ObjectDataSource>
<%-- <br /><br />--%>

    <asp:ObjectDataSource 
    ID="srcDb2" 
    runat="server" 
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="TheInsuredSMPInfo" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
    </SelectParameters>
    </asp:ObjectDataSource>
       
    <asp:ObjectDataSource 
    ID="srcOtherPolicies" 
    runat="server" 
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="TheInsuredOtherInfo" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
    </SelectParameters>
    </asp:ObjectDataSource>

<%-- <br /><br />--%>
<asp:ObjectDataSource 
    ID="srcIseries" 
    runat="server" 
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="TestCustomerInfo" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
<SelectParameters>
<asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
 </SelectParameters>
</asp:ObjectDataSource>
 <%--<br /><br />--%>
<asp:ObjectDataSource 
    ID="srcGetBilling" 
    runat="server"
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="GetBilling" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
<SelectParameters>
    <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
</SelectParameters>
</asp:ObjectDataSource>
<%--<br /><br />--%>
<asp:ObjectDataSource 
    ID="srcNextPayment" 
    runat="server"
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="GetNextPayment" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
<SelectParameters>
    <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
</SelectParameters>
</asp:ObjectDataSource>
<%--<br /><br />--%>
<asp:ObjectDataSource 
    ID="srcGetAgency" 
    runat="server"
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="GetAgencyInfo" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
<SelectParameters>
    <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
</SelectParameters>
</asp:ObjectDataSource>
<%--<br /><br />--%>
<asp:ObjectDataSource 
    ID="srcPaymentInfo" 
    runat="server"
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="GetBillingDetails" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
<SelectParameters>
    <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
</SelectParameters>
</asp:ObjectDataSource>
<%--<br /><br />--%>
<asp:ObjectDataSource 
    ID="srcClaimPmts" 
    runat="server"
    EnableCaching="true"
    CacheDuration="Infinite"
    SelectMethod="GetClaimPayments" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
<SelectParameters>
    <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
</SelectParameters>
</asp:ObjectDataSource>
</asp:Content>


