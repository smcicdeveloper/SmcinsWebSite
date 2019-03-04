<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_all_portal.master" MaintainScrollPositionOnPostback="true" styleSheetTheme="AgentPortal" AutoEventWireup="false" CodeFile="agency_tools.aspx.vb" Inherits="AgencyPortal_agency_tools" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 

    <script type="text/javascript">
        history.forward(1);
    </script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release" CombineScripts="false" EnablePartialRendering="False"></asp:ToolkitScriptManager>
    <div class="tools">
      <custom:ClientTabs
        id="ClientTabs1"
        Runat="server">
        <custom:Tab ID="Tab1" Text="Tools" runat="server">
        <br />
        <fieldset style="z-index:1px; background-color:#e2e2e2;padding:8px;border:1px dotted #cccccc;">
            <h2 style="color:Red;font: tahoma, Arial, Helvetica, sans-serif;">IMPORTANT NOTICES</h2> 
        <p style="width:750px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;">GA AGENTS ONLY – Effective 7-1-18, the state will require insurers to provide written notice of a reduction in coverage to a named insured no less than 45 days prior to the effective date of the proposed reduction.   While we are required to send notice to the insured via certified mail, we will not be sending a separate notice to our agents.   You will receive the renewal policy containing the renewal summary, which will describe any reductions in coverage.  This should allow you to answer any questions you receive from our policyholders.  Please contact us if you have any questions. </p>
        <p style="width:750px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;">Southern Mutual Church has added eRisk Hub Risk Management Portal for our agents. It’s designed to 
            help you better understand the risks and establish a plan to minimize the costs and effects of a data breach should one occur. There is a new link, Data Recovery eRisk Hub, in the "Other" section below that will take you to our 
            partner's eRisk Hub Welcome Page. Upon registering, you will find a wealth of information and tools to help prevent or mitigate a loss due to Data Compromise.</p>
        <p style="width:750px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;">If you wish to submit driver changes or inspections for a BA policy via email, please send the email to auto@smcins.com. All other changes should be sent to your assigned underwriter or underwriting assistant.</p>                
        </fieldset>

        <fieldset>
            <h2 style="color:Red;font: tahoma, Arial, Helvetica, sans-serif;">*** NEW - ELECTRONIC VERSIONS OF MARKETING PAMPHLETS *** </h2>
            <p><a href="../PDF/CompanyOverview.pdf" target="_blank"><img src="..\Images\CompanyOverview.jpg" style="float: left; width: 30%; margin-right: 3%; margin-bottom: 0.5em;" alt="Company Overview PDF" />
               <a href="../PDF/CoverageOverview.pdf" target="_blank"><img src="..\Images\CoverageOverview.jpg" style="float: left; width: 30%; margin-right: 3%; margin-bottom: 0.5em;" alt="Coverage Overview PDF" /></a>
            </p>
        </fieldset>

        <fieldset>
            <ol>
             <li><asp:HyperLink ID="hlnkTutorial" runat="server" Text="Agent Portal Tutorial"  NavigateUrl="../PDF/AgentPortalTutorial.pdf" target="_blank" CssClass="tool_buttons" ForeColor="White" /></li>
             <li><asp:HyperLink ID="hlnkSearch" runat="server" Text="Customer Search" NavigateUrl="~/AgencyPortal/policy_search.aspx" Target="_blank" CssClass="tool_buttons" ForeColor="White" /></li>
            </ol>
        </fieldset>

        <fieldset>
           <h3>Quote Request</h3><ul>
             <li><a href="../../apps/applog.aspx" target="_blank">Application Log</a></li>
             <li><a href="../../apps/app.aspx?Type=SMP" target="_blank">Special Multi Peril</a></li>
             <li><a href="../pdf/SMP_Application.pdf" target="_blank">PDF Version of SMP</a></li>
             <li><a href="../../apps/app.aspx?Type=BA"  target="_blank">Business Automobile</a></li>
             <li><a href="../pdf/BA_Application.pdf" target="_blank">PDF Version of BA</a></li>
             <li><a href="../../apps/app.aspx?Type=WC" target="_blank">Workers Compensation</a></li>
             <li><a href="../pdf/WC_Application.pdf" target="_blank">PDF Version of WC</a></li>
             <li><a href="../../apps/app.aspx?Type=UM" target="_blank">Umbrella Liability</a></li>
             <li><a href="../pdf/UM_Application.pdf" target="_blank">PDF Version of UM</a></li>
             <li><a href="../../pdf/HelpfulTips.pdf" target="_blank">Request Tips</a></li>
             <%--<li><a href="../quote_request.aspx" target="_blank">Test Quote</a></li>--%>
             </ul>
        </fieldset> 

            <fieldset>
            <h3>Other</h3><ul>
             <li><asp:HyperLink ID="hypPolicies" runat="server" Text="View List of Processed Policies" Target="_blank" /></li>
             <li><a href="../claimlist.aspx" target="_blank">Claim History Listing</a></li>
             <li><a href="../employee_directory.aspx" target="_blank">SMCI Employee Directory</a></li>
             <li><a href="../SupplyRequest/Order.aspx" target="_blank">Supplies Request</a></li>
             <li><a href="../../Gatekeeper.aspx" target="_blank">Gatekeeper (PDF)</a></li>
             <li><a href="https://eriskhub.com/SMCIC.php" target="_blank">Data Recovery eRisk Hub</a></li>
             <li><a href="../Forms.aspx" target="blank">Policy Forms List</a></li>
             
             </ul>
            </fieldset> 


  <%--      <fieldset>
           <h3>My Policies</h3>
           <ul>
        <li><a href="../my_policies.aspx" target="_blank">Policy List by Policy Number</a></li>
              <li><a href="../my_policies2.aspx" target="_blank">Policy List by Insured Name</a></li>
              <li><a href="../policy_search.aspx" target="_blank">Policy Search</a></li>
              </ul>
       </fieldset> --%>

       </custom:Tab>
              
        <custom:Tab ID="Tab2" Text="Production Summary" runat="server">

          <br />
          <div id="chart_box">
            <asp:DetailsView 
                ID="DetailsView1"
                SkinID="Summary" 
                runat="server"
                AutoGenerateRows="False" 
                DataSourceID="odsProdSummary">
            <Fields>
                <asp:BoundField DataField="Agent" HeaderText="Agent" Visible="False"></asp:BoundField>
                <asp:TemplateField HeaderText="MTD PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="YTD PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="EARNED PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="INFORCE PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="LOSSES PAID YTD:">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="CURRENT LOSS RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="PRIOR YEAR LOSS RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="LAE PAID YTD:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="CURRENT LAE RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="PRIOR YEAR LAE RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="TOTAL INCURRED LOSSES:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="LOSS RATIO:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField></Fields><HeaderStyle Width="180px" />
        </asp:DetailsView>
       <br />
                

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

      <custom:Tab ID="Tab3" Text="Online Forms" runat="server">
      
        <table border="0">
            <tr>
                <td colspan="2">
                     <p>
                       You will find our updated Rules Manual and state exceptions to that manual, as well as PDF copies of all SMCIC policy forms. 
                        If you need assistance with any of these forms, please do not hesitate to contact Chris Varnadoe at cvarnadoe@smcins.com or telephone at extension 108. </p><asp:HyperLink ID="HyperLink1" CssClass="tools_hyperlink" runat="server" NavigateUrl="~/pdf/InstructionClaims.pdf" Text="See Instruction for Claims" Target="_blank" ForeColor="Blue" /> 
                       <br />
                     <br />
                 </td>
            </tr>
           </table>
           <hr />
           <fieldset>
              <h3>Rules and Rates</h3>
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
                        NavigateUrl='<%#Eval("Id", "../FileHandler.ashx?id={0}")%>' 
                        Target="_blank"
                        runat="server" />
                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Filedate", "{0:d}")%>' />
                     </li>
                     </ItemTemplate>
                     <FooterTemplate>
                    </ul>
                     </FooterTemplate>
                </asp:Repeater>
            </fieldset>
            <hr />
                <fieldset>
                <h3>Loss Notice Forms</h3>
                <ul>
                   <li><asp:HyperLink ID="hyplkProp" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/proploss.pdf">Property Loss</asp:HyperLink></li>
                   <li><asp:HyperLink ID="hyplkLiability" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/liabloss.pdf">Liability Loss</asp:HyperLink></li>
                   <li><asp:HyperLink ID="hyplkAuto" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/autoloss.pdf">Business Auto Loss</asp:HyperLink></li>
                </ul>
           </fieldset>
            <fieldset>
                    <h3>Workers Compensation Loss Notice Forms</h3>
                    <ul>
                        <li><asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/GA_WC_PACKET.pdf">Georgia Packet</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/KY_WC_PACKET.pdf">Kentucky Packet</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink5" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/NC_WC_PACKET.pdf">North Carolina Packet</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink6" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/SC_WC_PACKET.pdf">South Carolina Packet</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink7" runat="server" Target="_blank" NavigateUrl="~/AgencyPortal/pdf/TN_WC_PACKET.pdf">Tennessee Packet</asp:HyperLink></li>
                    </ul>
<%--                   <asp:Repeater 
                        ID="Repeater1" 
                        runat="server" 
                        DataSourceID="odsLossClaimsForms">
                        <HeaderTemplate>
                          <ul class="fileList">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="lnkFile0" runat="server" 
                                    NavigateUrl='<%#Eval("Id", "../ClaimsLossHandler.ashx?id={0}")%>' Target="_blank" 
                                    Text='<%#Eval("FileName")%>' />
                                <asp:Label ID="lblDate0" runat="server" Text='<%#Eval("Filedate", "{0:d}")%>' />
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>  --%>
                </fieldset>

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
       <li><a href="../change_password_a.aspx">Change Password</a></li>
       <li><a href="add_new_user.aspx" target="_blank">Manage user accounts</a></li>
       <li><asp:HyperLink ID="hlnkInstruction" runat="server" ForeColor="Black" NavigateUrl="~/AgencyPortal/pdf/Agency Instructions.pdf" CssClass="wizzard_footer_hyperlink" target="_blank">Manage Accounts Instructions</asp:HyperLink></li>
    </ul>
</fieldset>

</asp:Content>


