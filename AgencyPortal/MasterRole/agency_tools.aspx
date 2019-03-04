<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_all_portal.master" MaintainScrollPositionOnPostback="true" styleSheetTheme="AgentPortal" AutoEventWireup="false" CodeFile="agency_tools.aspx.vb" Inherits="AgencyPortal_agency_tools" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" >
        history.forward(1);
    </script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release" CombineScripts="false" EnablePartialRendering="False"></asp:ToolkitScriptManager>
 
     <div class="tools">
      <custom:ClientTabs id="ClientTabs1" Runat="server">
        <custom:Tab ID="Tab1" Text="Tools" runat="server">
        <br />
        <fieldset style="z-index:1px; background-color:#e2e2e2;padding:8px;border:1px dotted #cccccc;">
        <h2 style="color:Red;font: tahoma, Arial, Helvetica, sans-serif;">IMPORTANT NOTICES</h2>    
            <p style="width:750px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;"><b>** NEW ** ONLINE COMMISSION STATEMENTS – Effective with the October 2018 commissions, you will now be able to 
            access your commission statement online and will not receive a paper statement with your commission checks. You can access the statements by clicking on the Get Commission Statement link under the Other section 
            below. This new feature is only available under the Master Agent login. We have also created a new Financial Role User you can add to your account that will only be able to access these statements and nothing else. 
            Please contact us if you have any questions.</p> 
            <p style="width:750px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;"><b>GA AGENTS ONLY – Effective 7-1-18, the state will require insurers to provide written 
            notice of a reduction in coverage to a named insured no less than 45 days prior to the effective date of the proposed reduction. While we are required to send notice to the insured via certified mail, we will not 
            be sending a separate notice to our agents. You will receive the renewal policy containing the renewal summary, which will describe any reductions in coverage. This should allow you to answer any questions you 
            receive from our policyholders. Please contact us if you have any questions.</p> 
<%--        <p style="width:500px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;">Please be aware you must use <b>Internet Explorer</b> to view/download policies and invoices. If you have IE 10, you must use Compatibility Mode. Other browsers will be supported in the near future.</p> --%>      
            <p style="width:750px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;"><b>If you wish to submit driver changes or inspections for a BA policy via email, please send the email to auto@smcins.com. All other changes should be sent to your assigned underwriter or underwriting assistant.</p>                  
        </fieldset>

       <fieldset>
            <h2 style="color:Red;font: tahoma, Arial, Helvetica, sans-serif;">*** NEW - ELECTRONIC VERSIONS OF MARKETING PAMPHLETS *** </h2>
            <p><a href="../PDF/CompanyOverview.pdf" target="_blank"><img src="..\Images\CompanyOverview.jpg" style="float: left; width: 30%; margin-right: 3%; margin-bottom: 0.5em;" alt="Company Overview PDF" />
               <a href="../PDF/CoverageOverview.pdf" target="_blank"><img src="..\Images\CoverageOverview.jpg" style="float: left; width: 30%; margin-right: 3%; margin-bottom: 0.5em;" alt="Coverage Overview PDF" />
            </p>
        </fieldset>

        <fieldset>
            <ol>
             <li><asp:HyperLink ID="hlnkTutorial" runat="server" Text="Agent Portal Tutorial"  NavigateUrl="../PDF/AgentPortalTutorial.pdf" target="_blank" CssClass="tool_buttons" ForeColor="White" /></li>
             <li><asp:HyperLink ID="hlnkSearch" runat="server" Text="Customer Search" NavigateUrl="~/AgencyPortal/policy_search.aspx" Target="_blank" CssClass="tool_buttons" ForeColor="White" /></li>
            </ol>
        </fieldset>

        <fieldset>
           <h3>Quote Request</h3>
           <ul>
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
          <%-- <fieldset>
            <h3>Policyholder Request</h3><ul>
             <li><a href="#">Address Change</a></li>
             <li><a href="#">Increase Coverages</a></li>
             <li><a href="#">Decrease Coverages</a></li>
             <li><a href="#">View Claim History</a></li>
             </ul>
           </fieldset> --%>
         <fieldset>
            <h3>Other</h3><ul>
             <li><asp:HyperLink ID="hypPolicies" runat="server" Text="View List of Processed Policies" Target="_blank" /></li>
             <li><a href="../claimlist.aspx" target="_blank">Claim History Listing</a></li>
             <li><a href="../employee_directory.aspx" target="_blank">SMCI Employee Directory</a></li>
             <li><a href="../bulletin.aspx" target="_blank">Agency Bulletins (PDF)</a></li>
             <li><a href="../../Gatekeeper.aspx" target="_blank">Gatekeeper (PDF)</a></li>
             <li><a href="../SupplyRequest/Order.aspx" target="_blank">Supplies Request</a></li>
             <li><a href="https://eriskhub.com/SMCIC.php" target="_blank">Data Recovery eRisk Hub</a></li>
             <li><a href="../Forms.aspx" target="blank">Policy Forms List</a></li>
             <li><asp:LinkButton ID="lnkShowPopup" runat="server" Text="Get Commission Statement" /></li>
             </ul>
        </fieldset> 



             <asp:Panel ID="Popup1" runat="server" CssClass="modalPopup" style="display:none;">
             <asp:Panel ID="PopupHeader1" runat="server" CssClass="modalHeader">
             <span style="float:left;">
             Get Commission Information
             <br />           
             </span>
             <span style="float: right;">
              <asp:Image ID="PopupClose1" runat="server" ImageUrl="~/AgencyPortal/CSS/Images/BlackCloseButton.png"  Height="17" Width="18" CssClass="modalHeaderImageButton" />
            </span>  
             </asp:Panel>
             <asp:Panel ID="PopupContent1" runat="server" CssClass="modalContent">
                <br />
                <div class="landscape">
                <ul>
                <li>
                  <label>Select Agency: <br />
                    <asp:DropDownList 
                     ID="ddlSelectAgency" 
                     runat="server"
                     CssClass="dropDownList" 
                     AutoPostBack="False" 
                     DataSourceID="sdsHierarchy" 
                     DataTextField="MasterID" 
                     DataValueField="MasterID" 
                     Width="125px">
                </asp:DropDownList>                 
                  </label>
                </li>
                 <li>
                 <label>Year: <br />
                 <asp:DropDownList ID="ddlYear" runat="server" Width="75px" CssClass="dropDownList" AutoPostBack="True">
                         <asp:ListItem Text="2019" Value="119"></asp:ListItem>
                         <asp:ListItem Text="2018" Value="118"></asp:ListItem>
                 </asp:DropDownList>
                </label>
                 </li>

                </ul>

                <ul>
                 <li>
                 <label>Month: <br />
                 <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropDownList" Width="115px">
                 <asp:ListItem Text="January" Value="01"></asp:ListItem>
                 <asp:ListItem Text="February" Value="02"></asp:ListItem>
                 <asp:ListItem Text="March" Value="03"></asp:ListItem>
                 <asp:ListItem Text="April" Value="04"></asp:ListItem>
                 <asp:ListItem Text="May" Value="05"></asp:ListItem>
                 <asp:ListItem Text="June" Value="06"></asp:ListItem>
                 <asp:ListItem Text="July" Value="07"></asp:ListItem>
                 <asp:ListItem Text="August" Value="08"></asp:ListItem>
                 <asp:ListItem Text="September" Value="09"></asp:ListItem>
                 <asp:ListItem Text="October" Value="10"></asp:ListItem>
                 <asp:ListItem Text="November" Value="11"></asp:ListItem>
                 <asp:ListItem Text="December" Value="12"></asp:ListItem>
                 </asp:DropDownList>
                </label>
                 </li>
                </ul>
            </div>
             <div class="clear">
                <p class="modal">
                 Choose the year and month for your statement.
                </p>
             </div>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <asp:LinkButton ID="lnkCommission" CausesValidation="false" Text="Show Statement" runat="server" CssClass="ActionButton" />  
                </ContentTemplate>
            </asp:UpdatePanel>               
                                      
             </asp:Panel>    
          </asp:Panel>

                <asp:ModalPopupExtender 
                     ID="PopupExtender" 
                     runat="server"
                     TargetControlID="lnkShowPopup" 
                     PopupControlID="Popup1" 
                     BackgroundCssClass="modalBackground" 
                     OkControlID="PopupOk1" 
                     CancelControlID="PopupClose1" 
                     DropShadow="true" />

<%--        <fieldset>
           <h3>My Policies</h3>
           <ul>
              <li><a href="../my_policies.aspx" target="_blank">Policy List by Policy Number</a></li>
              <li><a href="../my_policies2.aspx" target="_blank">Policy List by Insured Name</a></li>
              <%--<li><a href="search_by_policy_number.aspx" target="_blank">Search by Policy Number</a></li>  
           </ul>
       </fieldset> 
--%>            
         </custom:Tab>
              
         <custom:Tab ID="Tab2" Text="Production Summary" runat="server">
            <div>
            <div id="chart_box">
            <ol>
            <li><label>Select Agency:</label></li>
                <li><asp:DropDownList 
                     ID="DropDownList1" 
                     runat="server"
                     CssClass="selectagentdropdownstyle" 
                     AutoPostBack="True" 
                     DataSourceID="sdsHierarchy" 
                     DataTextField="MasterID" 
                     DataValueField="MasterID">
                </asp:DropDownList></li>
            </ol>
          <br /><br />
          
            <asp:DetailsView 
                ID="DetailsView1" 
                runat="server" 
                SkinID="Summary" 
                DataSourceID="odsProdSummary" 
                AutoGenerateRows="False"
                EmptyDataText="No data avaiable for this agency at this time.">
            <Fields>
                <asp:BoundField DataField="Agent" HeaderText="AGENCY NUMBER:">
                   <HeaderStyle Font-Bold="True" ForeColor="#0000CC" />
                   <ItemStyle Font-Bold="True" ForeColor="#CA5D22" />
                </asp:BoundField>
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
      </div>
        <hr />
      </div>
              <div>
              <asp:DetailsView 
                      ID="DetailsView2" 
                      SkinID="Summary" 
                      runat="server"                
                      AutoGenerateRows="False" 
                      DataSourceID="odsAllSummary"
                      EmptyDataText="No data avaiable for all agencies at this time.">
                       <Fields>
                <asp:BoundField DataField="Agent" HeaderText="ALL AGENCIES">
                    <HeaderStyle Font-Bold="True" ForeColor="#2A8500" />
                   <ItemStyle Font-Bold="True" ForeColor="#8D43DB" />
                </asp:BoundField>
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
            </div>
      
<%--        <asp:ObjectDataSource 
            ID="odsProdSummary" 
            runat="server" 
            SelectMethod="MyProductionSummary" 
            TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
            </SelectParameters>
            </asp:ObjectDataSource>--%>

           <asp:ObjectDataSource 
            ID="odsProdSummary" 
            runat="server" 
            SelectMethod="MyProductionSummary" 
            TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="UserNameIs" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            </asp:ObjectDataSource>

            <asp:ObjectDataSource 
            ID="odsAllSummary" 
            runat="server" 
            SelectMethod="AllProductionSummary" 
            TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
            </SelectParameters>
            </asp:ObjectDataSource>


            <asp:SqlDataSource 
                 ID="sdsHierarchy" 
                 runat="server" 
                 ConnectionString="<%$ ConnectionStrings:AllPortal%>" 
                 ProviderName="System.Data.SqlClient" 
                 SelectCommand="SELECT MasterID FROM AgencyOriginationTable WHERE (MasterKeyID = @UserNameIs)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

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
                        If you need assistance with any of these forms, please do not hesitate to contact Chris Varnadoe at cvarnadoe@smcins.com or telephone at extension 108. 
                        </p><asp:HyperLink ID="HyperLink1" CssClass="tools_hyperlink" runat="server" NavigateUrl="~/pdf/InstructionClaims.pdf" Text="See Instruction for Claims" Target="_blank" ForeColor="Blue" /> 
                       <br />
                     <br />
                 </td>
            </tr>
        </table>
             <hr />
             <fieldset>
                <h3>Rules and Rates</h3><asp:Repeater 
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
       <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AgencyPortal/pdf/Agency Instructions.pdf" CssClass="wizzard_footer_hyperlink" target="_blank">Manage Accounts Instructions</asp:HyperLink></li>
    </ul>
</fieldset>

</asp:Content>


