<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_agent.master" AutoEventWireup="false" CodeFile="policyholder_info.aspx.vb" Inherits="AgencyPortal_policyholder_info" %>


<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" >
        history.forward(1);
    </script>

     <div id="tools">
     <div id="center-box">
      <custom:ClientTabs
        id="ClientTabs1"
        Runat="server">
        <custom:Tab ID="Tab1" Text="Account Summary" runat="server">
         <div id="billing">
          <fieldset>
          <legend style="font-family:Verdana; font-weight:bold; font-size:14px; color:#010fff;">Balance</legend>
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
            <div>
                <ul style="list-style: none;">
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
                </div>
                <br />
                <br />
            </ItemTemplate>
             <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        </asp:DataList>
        </fieldset>
        <hr />
        <fieldset>
         <legend style="font-family:Verdana; font-weight:bold; font-size:14px; color:#010fff;">Next Payment</legend>
          <asp:DataList 
               ID="DataList2" 
               runat="server" 
               DataSourceID="srcNextPayment" 
               RepeatColumns="1" 
               CellPadding="4" 
               BackColor="White" 
               BorderColor="#CC9966"
               BorderStyle="None" 
               BorderWidth="0px" Width="620px" 
               GridLines="Both">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <ItemStyle BackColor="White" ForeColor="#330099" />
            <ItemTemplate>
            <%--<div id="billing">--%>
                <ul style="list-style: none;">
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
    </fieldset>
    <br />
        </div>
          <div class="clearthefloats"></div>
        </custom:Tab>     
        <custom:Tab ID="Tab2" Text="Payment History" runat="server">
<asp:GridView 
        ID="gvCost" 
        BorderWidth="0px"
        BorderStyle="None"
        runat="server" 
        AutoGenerateColumns="False" 
        DataSourceID="srcPaymentInfo"
        AllowPaging="True" 
        PageSize="25" 
        HeaderStyle-HorizontalAlign="Left" 
        BackColor="White" 
        BorderColor="Silver" 
        CellPadding="5" 
        GridLines="Horizontal" 
        Font-Names="Verdana" 
        Font-Size="12px" 
        ForeColor="Silver" 
        Width="720px" EmptyDataText="No Payment History At This Time">
        <AlternatingRowStyle BackColor="#EFEFEF" />
        <Columns>
        <asp:BoundField DataField="D3POLTYPE" HeaderText="Policy Number" SortExpression="D3POLTYPE" >
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
           <EmptyDataRowStyle ForeColor="Black" />
        <FooterStyle BackColor="Yellow" ForeColor="#4A3C8C" HorizontalAlign="Center" />
         <HeaderStyle Font-Bold="True" ForeColor="#010FFF" BackColor="#FFFFFF" />
                    <PagerSettings Mode="NextPrevious" NextPageText="Next" 
                        PreviousPageText="Previous" />
        <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Center" BorderStyle="None" />
        <RowStyle BackColor="White" ForeColor="#003366" />
        <SelectedRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#333333" />
       </asp:GridView>
        </custom:Tab>
        <custom:Tab ID="Tab3" Text="Claim History" runat="server">
<asp:GridView 
            ID="gvClaimPmts" 
            BorderWidth="0px"
            BorderStyle="None"
            runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="srcClaimPmts"
            AllowPaging="True" 
            PageSize="25" 
            HeaderStyle-HorizontalAlign="Left" 
            BackColor="White" 
            BorderColor="Silver" 
            CellPadding="5" 
            GridLines="Horizontal" 
            Font-Names="Verdana" 
            Font-Size="12px" 
            ForeColor="Silver" 
            EmptyDataText="No Claim History At This Time"
            Width="720px">
            <AlternatingRowStyle BackColor="#EFEFEF" />
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
               <EmptyDataRowStyle ForeColor="Black" />
            <FooterStyle BackColor="#d8eaf6" ForeColor="#4A3C8C" HorizontalAlign="Center" />
             <HeaderStyle Font-Bold="True" ForeColor="#010FFF" BackColor="#FFFFFF" />
               <PagerSettings Mode="NextPrevious" NextPageText="Next" 
                   PreviousPageText="Previous" />
            <PagerStyle BackColor="White" ForeColor="#4A3C8C" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#003366" />
            <SelectedRowStyle BackColor="#C1C1C1" Font-Bold="True" ForeColor="#F7F7F7" />
           </asp:GridView>
        </custom:Tab>
      </custom:ClientTabs>
    </div>
    </div>

        <asp:ObjectDataSource 
            ID="srcGetBilling" 
            runat="server"
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="GetBilling" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserNameIs" Type="String" 
                QueryStringField="UserNameIs" />
        </SelectParameters>
     </asp:ObjectDataSource>
     <%--<br />--%>
     <asp:ObjectDataSource 
            ID="srcNextPayment" 
            runat="server"
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="GetNextPayment" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserNameIs" QueryStringField="UserNameIs" />
        </SelectParameters>
        </asp:ObjectDataSource>
       <%-- <br />--%>
       <asp:ObjectDataSource 
            ID="srcPaymentInfo" 
            runat="server"
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="GetBillingDetails" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserNameIs" QueryStringField="UserNameIs" />
        </SelectParameters>
        </asp:ObjectDataSource>
     <%-- <br />--%>
     <asp:ObjectDataSource 
        ID="srcClaimPmts" 
        runat="server"
        EnableCaching="true"
        CacheDuration="Infinite"
        SelectMethod="GetClaimPayments" 
        TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:QueryStringParameter Name="UserNameIs" QueryStringField="UserNameIs" />
    </SelectParameters>
    </asp:ObjectDataSource>
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

</asp:Content>


