<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_all_portal.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="agency_tools.aspx.vb" Inherits="AgencyPortal_agency_tools" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" >
        history.forward(1);
    </script>

    <div class="tools">
      <custom:ClientTabs
        id="ClientTabs1"
        Runat="server" CssClass="left_side">
        <custom:Tab ID="Tab1" Text="Tools" runat="server">
        <br />
        <fieldset style="z-index:1px; background-color:#0000FF;padding:8px;border:1px dotted #cccccc;">
        <h2 style="color:Red;font: tahoma, Arial, Helvetica, sans-serif;">Alert!</h2>
        <p style="width:500px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;">Please be aware you must use <b>Internet Explorer</b> to view/download policies and invoices. If you have IE 10, you must use Compatibility Mode. Other browsers will be supported in the near future.</p>
        
        </fieldset>
        <fieldset>
           <h3>Quote Request</h3>
           <ul>
             <li><a href="../apps/applog.aspx" target="_blank">Application Log</a></li>
             <li><a href="../apps/app.aspx?Type=SMP" target="_blank">Special Multi Peril</a></li>
             <li><a href="pdf/SMP_Application.pdf" target="_blank">PDF Version of SMP</a></li>
             <li><a href="../apps/app.aspx?Type=BA"  target="_blank">Business Automobile</a></li>
             <li><a href="../apps/app.aspx?Type=WC" target="_blank">Workers Compensation</a></li>
             <li><a href="../apps/app.aspx?Type=UM" target="_blank">Umbrella Liability</a></li>
             <li><a href="../pdf/HelpfulTips.pdf" target="_blank">Request Tips</a></li></ul>
       </fieldset> 
<%--       <fieldset>
            <h3>Policyholder Request</h3><ul>
             <li><a href="#">Address Change</a></li>
             <li><a href="#">Increase Coverages</a></li>
             <li><a href="#">Decrease Coverages</a></li>
             <li><a href="#">View Claim History</a></li>
             </ul>
      </fieldset> --%>
        <fieldset>
            <h3>Other</h3>
            <ul>
             <li><asp:HyperLink ID="hypPolicies" runat="server" Text="View List of Processed Policies" Target="_blank" /></li>
             <li><a href="claimlist.aspx" target="_blank">Claim History Listing</a></li>
             <li><a href="employee_directory.aspx" target="_blank">SMCI Employee Directory</a></li>
             <li><a href="bulletin.aspx" target="_blank">Agency Bulletins (PDF)</a></li>
             <li><a href="request_supplies.aspx" target="_blank">Supplies Request</a></li>
             
            </ul>
           </fieldset> 
           <fieldset>
           <h3>My Policies</h3>
           <ul>
              <li><a href="my_policies.aspx" target="_blank">Policy List by Policy Number</a></li>
              <li><a href="my_policies2.aspx" target="_blank">Policy List by Insured Name</a></li>
              <%--<li><a href="search_by_policy_number.aspx" target="_blank">Search by Policy Number</a></li>  --%>         
           </ul>
           </fieldset>
           
           </custom:Tab>
           
          <custom:Tab ID="Tab2" Text="Production Summary" runat="server">

          <br />
          <div id="chart_box">
            <asp:DetailsView 
                ID="DetailsView1" 
                runat="server" 
                Height="50px" 
                Width="412"
                DataSourceID="odsProdSummary" 
                AutoGenerateRows="False" 
                BorderStyle="None" 
                Font-Names="Calibri" 
                BorderColor="White" 
                BorderWidth="0px">
            <Fields>
                <asp:BoundField DataField="Agent" HeaderText="Agent" Visible="False"></asp:BoundField>
                <asp:TemplateField HeaderText="MTD PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="YTD PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EARNED PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="INFORCE PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LOSSES PAID YTD:">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CURRENT LOSS RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PRIOR YEAR LOSS RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="LAE PAID YTD:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CURRENT LAE RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PRIOR YEAR LAE RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>

               <asp:TemplateField HeaderText="TOTAL INCURRED LOSSES:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="LOSS RATIO:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
            </Fields>
            <HeaderStyle Width="180px" />
        </asp:DetailsView>
       <br />
             <%--   <asp:Chart ID="Chart1" runat="server" DataSourceID="odsProdSummary" 
                BackColor="211, 223, 240" BackGradientStyle="VerticalCenter" 
                BorderlineDashStyle="Solid" IsSoftShadows="False" Width="412" CssClass="chart">
                <Series>
                    <asp:Series Name="MTDPREM" Legend="Default" YValueMembers="Mtdprem" 
                        YValuesPerPoint="10" YValueType="Double" ToolTip="#VAL{C}" 
                        CustomProperties="DrawingStyle=Cylinder, EmptyPointValue=Zero, PointWidth=1, DrawSideBySide=True" 
                        LabelToolTip="#VAL{C}" MarkerSize="10">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" Legend="Default" Name="YTDPREM" 
                        YValueMembers="Ytdprem" YValuesPerPoint="10" YValueType="Double" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" 
                        LabelToolTip="#VAL{C}">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" Legend="Default" Name="EARNPREM" 
                        YValueMembers="Earnprem" YValuesPerPoint="10" YValueType="Double" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" 
                        LabelToolTip="#VAL{C}">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" 
                        LabelToolTip="#VAL{C}" Legend="Default" 
                        Name="INFORCEPREM" YValueMembers="Inforceprem" YValuesPerPoint="10" 
                        YValueType="Double">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" Legend="Default" 
                        Name="CURRRESV" YValueMembers="Currresv" YValuesPerPoint="10">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" Legend="Default" 
                        Name="PRIORRESV" YValueMembers="Priorresv" YValuesPerPoint="10">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" CustomProperties="PointWidth=1" 
                        Legend="Default" Name="PAIDYTD" YValueMembers="Paidytd" YValuesPerPoint="10">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" Legend="Default" 
                        Name="LAECURRRESV" YValueMembers="Laecurrresv" YValuesPerPoint="10">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" Legend="Default" 
                        Name="LAEPRIORRESV" YValueMembers="Laepriorresv" YValuesPerPoint="10">
                    </asp:Series>
                    <asp:Series ChartArea="ChartArea1" 
                        CustomProperties="DrawingStyle=Cylinder, PointWidth=1" Legend="Default" 
                        Name="LAEPAIDYTD" YValueMembers="Laepaidytd" YValuesPerPoint="10">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" AlignmentOrientation="Horizontal">
                        <Area3DStyle LightStyle="Realistic" WallWidth="10" />
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Default">
                    </asp:Legend>
                </Legends>
            </asp:Chart>--%>

            </div>
      
        <asp:ObjectDataSource 
            ID="odsProdSummary" 
            runat="server" 
            SelectMethod="MyProductionSummary" 
            TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
            </SelectParameters>
            </asp:ObjectDataSource>
    </custom:Tab>  
           

      <asp:ObjectDataSource 
          ID="ObjectDataSource1" 
          runat="server" 
          SelectMethod="AgencyCustomerList" 
          TypeName="smci.DataAccessLayer.MySqlIdb2Code">
          <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
          </SelectParameters>
         </asp:ObjectDataSource>
         

      <asp:ObjectDataSource 
          ID="odsCustList" 
          runat="server" 
          SelectMethod="AgencyCustomerList4" 
          TypeName="smci.DataAccessLayer.MySqlIdb2Code">
          <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
          </SelectParameters>
         </asp:ObjectDataSource>

      <custom:Tab ID="Tab3" Text="Online Claims & Forms" runat="server">
      
        <table border="0">
            <tr>
                <td colspan="2">
                     <p>
                       You will find our updated Rules Manual and state exceptions to that manual, as well as PDF copies of all SMCIC policy forms. 
                        If you need assistance with any of these forms, please do not hesitate to contact Chris Varnadoe at cvarnadoe@smcins.com or telephone at extension 108.
                    </p> 
                       <asp:HyperLink ID="HyperLink1" CssClass="tools_hyperlink" runat="server" NavigateUrl="~/pdf/InstructionClaims.pdf" Text="See Instruction for Claims" Target="_blank" ForeColor="Blue" /> 
                       <br />
                     <br />
                 </td>
            </tr>
            <tr>
                <td class="left_side">
                 <h3>Policy Forms</h3>
                    <asp:Repeater 
                         ID="Repeater2" 
                         runat="server" 
                         DataSourceID="odsPolicyForms">
                         <HeaderTemplate>
                         <ul class="fileList">
                         </HeaderTemplate>
                         <ItemTemplate>
                         <li>
                        <asp:HyperLink 
                            ID="lnkFile" 
                            Text='<%#Eval("FileName")%>' 
                            NavigateUrl='<%#Eval("Id", "PolicyHandler.ashx?id={0}")%>' 
                            Target="_blank"
                            runat="server" />
                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Filedate", "{0:d}")%>' />
                         </li>
                         </ItemTemplate>
                         <FooterTemplate>
                        </ul>
                         </FooterTemplate>
                    </asp:Repeater>
                </td>
                <td>
                    <h3>Claims Loss Forms</h3>
                    <asp:Repeater 
                         ID="Repeater1" 
                         runat="server" 
                         DataSourceID="odsLossClaimsForms">
                        <HeaderTemplate>
                          <ul class="fileList">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="lnkFile0" runat="server" 
                                    NavigateUrl='<%#Eval("Id", "ClaimsLossHandler.ashx?id={0}")%>' Target="_blank" 
                                    Text='<%#Eval("FileName")%>' />
                                <asp:Label ID="lblDate0" runat="server" Text='<%#Eval("Filedate", "{0:d}")%>' />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                  </td>
            </tr>
            <tr>
                <td class="left_side">
                <h3>State Exception Forms</h3>
                 <asp:Repeater 
                     ID="Repeater3" 
                     runat="server" 
                     DataSourceID="odsFiles">
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
                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Filedate", "{0:d}")%>' />
                     </li>
                     </ItemTemplate>
                     <FooterTemplate>
                    </ul>
                     </FooterTemplate>
                </asp:Repeater>
                 </td>
                <td>
                <h3>Loss Forms</h3>
<%--                    <asp:Repeater 
                         ID="Repeater4" 
                         runat="server" 
                         DataSourceID="odsLossForms">
                        <HeaderTemplate>
                          <ul class="fileList">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="lnkFile0" runat="server" NavigateUrl='<%#Eval("Id", "LossHandler.ashx?id={0}")%>' Target="_blank" Text='<%#Eval("FileName")%>' />
                                <asp:Label ID="lblDate0" runat="server" Text='<%#Eval("Filedate", "{0:d}")%>' />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>--%>
                       <ul>
                         <li><asp:HyperLink ID="hyplkProp" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/proploss.pdf">Property Loss</asp:HyperLink></li>
                        <li><asp:HyperLink ID="hyplkLiability" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/liabloss.pdf">Liability Loss</asp:HyperLink></li>
                       </ul>
                  </td>
            </tr>
        </table>

        <asp:ObjectDataSource 
             ID="odsFiles" 
             runat="server" 
             SelectMethod="GetFiles" 
             TypeName="smci.SqlAccessLayer.MySqlCode">
        </asp:ObjectDataSource>
       
        <asp:ObjectDataSource 
             ID="odsPolicyForms" 
             runat="server" 
             SelectMethod="GetPolicyForms" 
             TypeName="smci.SqlAccessLayer.MySqlCode">
        </asp:ObjectDataSource>
      
         <asp:ObjectDataSource 
             ID="odsLossClaimsForms" 
             runat="server" 
             SelectMethod="GetClaimsLossForms" 
             TypeName="smci.SqlAccessLayer.MySqlCode">
        </asp:ObjectDataSource>

        <asp:ObjectDataSource 
             ID="odsLossForms" 
             runat="server" 
             SelectMethod="GetLossForms" 
             TypeName="smci.SqlAccessLayer.MySqlCode">
        </asp:ObjectDataSource>

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

         </custom:Tab>
      </custom:ClientTabs>


    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<fieldset>
    <h3>My Account</h3>
    <ul>
       <li><a href="change_password_a.aspx">Change Password</a></li>
    </ul>
</fieldset>

</asp:Content>


