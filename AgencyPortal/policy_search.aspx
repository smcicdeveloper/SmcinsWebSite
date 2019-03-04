<%@ Page Title="" Language="VB" MasterPageFile="~/policySearch.master" AutoEventWireup="false" CodeFile="policy_search.aspx.vb" Inherits="AgencyPortal_policy_search" %>

<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Web.UI.ExtenderControl" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="IBM.Data.DB2.iSeries" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script runat="server">
    
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        AutoCompExt1.ContextKey = Session("AgentNumber")
        'Profile.AgentId = Session("AgentNumber")
        txtSearch.Focus()
        
        Dim x As String = ace1Value.Value
    End Sub
            
</script>


    <script type="text/javascript">

        function AutoCompExt1_itemSelected(sender, e) {
            var ace1Value = $get('<%= ace1Value.ClientID %>');
            ace1Value.value = e.get_value();
        }

        function showing(e, args) {
            $.each(e._completionListElement.childNodes, function (key, value) {
                value.innerHTML = value.innerHTML.toString('CUST0NO:', '<b>CUST0NO:</b>');              
            });
        }


        function dialog() {
            $('#dialog').dialog({ autoOpen: true, minWidth: 975, hide: true });
        };


        function GetScollerPosition() {
            var scrollX, scrollY;

            if (document.all) {
                if (!document.documentElement.scrollLeft)
                    scrollX = document.body.scrollLeft;
                else
                    scrollX = document.documentElement.scrollLeft;

                if (!document.documentElement.scrollTop)
                    scrollY = document.body.scrollTop;
                else
                    scrollY = document.documentElement.scrollTop;
            }

            else {
                scrollX = window.pageXOffset;
                scrollY = window.pageYOffset;
            }

            document.getElementById("XPos").value = scrollX;
            document.getElementById("YPos").value = scrollY;
        }

</script>



    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>


    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release" CombineScripts="false" EnablePartialRendering="False"></asp:ToolkitScriptManager>--%>


<div class="po_search">
<ul>
 <li><label>Search</label>
 </li>
 <li style="margin-top:8px;"><hr /></li>
</ul>
<br />
<br />

<fieldset style="clear:both;width:90%;padding:15px; background-color:#eaecee;">
<ul style="margin-left:1px;font-family:Calibri, Arial, sans-serif; color:#2471a3;" >
<li><p>Begin typing the customer name, pause for the server to retrieve the data, click on a customer, then click 'Search'.</p></li>
</ul>
</fieldset>

<br />


<ul>
  <li>
<asp:TextBox 
        ID="txtSearch" 
        runat="server" 
        CssClass="textbox " 
        Width="450px" onkeyup="" />

<%--           OnClientItemSelected="AutoCompExt1_itemSelected"
           FirstRowSelected="true"
       ShowOnlyCurrentWordInCompletionListItem="True"    
           --%>

      <asp:AutoCompleteExtender 
           ID="AutoCompExt1" 
           EnableCaching="True"
           MinimumPrefixLength="1"
           TargetControlID="txtSearch"
           ServicePath="AutoComplete.asmx"
           ServiceMethod="GetData" 
           CompletionInterval="1000"
           CompletionSetCount="1000000000"         
           CompletionListCssClass="autocomplete_completionListElement" 
           CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
           CompletionListItemCssClass="autocomplete_listItem"
           FirstRowSelected="true" 
           OnClientItemSelected="AutoCompExt1_itemSelected"
           runat="server" 
           UseContextKey="true"         
           DelimiterCharacters="">
      </asp:AutoCompleteExtender>


<asp:HiddenField 
    ID="ace1Value" 
    runat="server" />
  </li>
  <li>
      <asp:RequiredFieldValidator ID="rfvSearch" runat="server" Text="*" Font-Size="Smaller" ErrorMessage="Please select a policyholder before hitting search" ForeColor="Red" ControlToValidate="txtSearch" />
  </li>
  <li style="margin-top:5px;">
      <asp:Button ID="btnSearch" runat="server" Text="Search" Width="80px" />
  </li>
    <li style="margin-top:5px;">
      <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px" CausesValidation="false" />
  </li>
</ul>


</div>


<asp:Panel ID="Panel1" runat="server" Visible="False">   
 <div id="tools">
     <div id="center-box">
      <custom:clienttabs
        id="ClientTabs1"
        Runat="server">
        <custom:Tab ID="Tab1" Text="Account Summary" runat="server">
         <div id="billing">
          <fieldset>
          <legend style="font-family:Verdana; font-weight:bold; font-size:14px; color:#010fff;">Balance</legend>
    <asp:GridView 
         ID="grvSummary" 
         BorderWidth="0px"
         BorderStyle="None"
         runat="server" 
         AutoGenerateColumns="False"
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
         Width="720px" 
         EmptyDataText="No Summary At This Time">
         <AlternatingRowStyle BackColor="#EFEFEF" />
        <Columns>
            <asp:TemplateField HeaderText="Policy:">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PolicyType") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="PolicyTypeLabel" runat="server" Text='<%# Bind("PolicyType") %>' ForeColor="#666666"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Exp Date:">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ExpDate") %>' ForeColor="#666666"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ExpDateLabel" runat="server" Text='<%# Bind("ExpDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Premium:">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TotalPrem") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TotalPremLabel" runat="server" Text='<%# Bind("TotalPrem", "{0:c}") %>' ForeColor="Blue"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Paid:">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TotalPaid") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TotalPaidLabel" runat="server" Text='<%# Bind("TotalPaid", "{0:c}") %>' ForeColor="Green"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Balance:">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Balance") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="BalanceLabel" runat="server" Text='<%# Bind("Balance", "{0:c}") %>' ForeColor="Blue"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Type:" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Paymenttype") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="PaymentTypeLabel" runat="server" Text='<%# Bind("Paymenttype") %>' ForeColor="#666666"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="Policynum,Symbol"
                        DataNavigateUrlFormatString="change_request_form.aspx?policynum={0}&amp;symbol={1}" HeaderText="Change Request" Target="_blank" Text="Submit Request">
                   <HeaderStyle HorizontalAlign="Left" />
               <ItemStyle HorizontalAlign="Center" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="VIEWIT" 
                        DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:DocumentOnly,UserType:Internal,MMRecipList:Insured Invoice,DocNumber:{0}" 
                        HeaderText="Invoice" Target="_blank" Text="View" >
                    <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="VIEWIT" 
                        DataNavigateUrlFormatString="http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:DocumentOnly,UserType:Internal,MMRecipList:Insured Copy,DocNumber:{0}" 
                        HeaderText="Policy" Target="_blank" Text="View" >
                    <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="PolicyNum" 
                        DataNavigateUrlFormatString="my_policies3.aspx?policynum={0}"
                        HeaderText="Archive" Target="_blank" Text="View" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
        </Columns>
         <EmptyDataRowStyle ForeColor="Black" />
        <FooterStyle BackColor="Yellow" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <HeaderStyle Font-Bold="True" ForeColor="#010FFF" BackColor="#FFFFFF" HorizontalAlign="Left"></HeaderStyle>
                    <PagerSettings Mode="NextPrevious" NextPageText="Next" 
                        PreviousPageText="Previous" />
        <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Center" BorderStyle="None" />
        <RowStyle BackColor="White" ForeColor="#003366" />
        <SelectedRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
        </fieldset>
        <hr />
        <fieldset>
         <legend style="font-family:Verdana; font-weight:bold; font-size:14px; color:#010fff;">Next Payment</legend>
          <asp:DataList 
               ID="DataList2" 
               runat="server" 
               
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
      </custom:clienttabs>
    </div>
    </div>
</asp:Panel>
        <asp:ObjectDataSource 
            ID="srcGetBilling" 
            runat="server"
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="GetBilling" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="UserNameIs" PropertyName="Value" />
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
            <asp:ControlParameter ControlID="ace1Value" Name="UserNameIs" PropertyName="Value" />
        </SelectParameters>
        </asp:ObjectDataSource>
       <%-- <br />--%>
       <asp:ObjectDataSource 
            ID="srcPaymentInfo" 
            runat="server"
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="GetBillingDetails2" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="UserNameIs" PropertyName="Value" />
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
        <asp:ControlParameter ControlID="ace1Value" Name="UserNameIs" PropertyName="Value" />
    </SelectParameters>
    </asp:ObjectDataSource>

     <asp:ValidationSummary 
         ID="ValidationSummary1" 
         ShowSummary="false" 
         ShowMessageBox="true" 
         runat="server" /> 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

