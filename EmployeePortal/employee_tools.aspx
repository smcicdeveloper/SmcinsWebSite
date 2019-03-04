<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_employee_portal.master" AutoEventWireup="false" CodeFile="employee_tools.aspx.vb" Inherits="EmployeePortal_employee_toolss" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
.box {
    margin-top:10px;
    padding-bottom:40%;}
</style>
<div class="box">
 <div id="tools">
        <custom:ClientTabs
        id="ClientTabs1"
        Runat="server">
        <custom:Tab ID="Tab1" Text="Annual Leave" runat="server">
         <ul class="links">
            <li><a href="../annualleave/annualleave.aspx" target="_blank">Annual Leave</a></li>
         </ul>
        </custom:Tab>
        <custom:Tab ID="Tab2" Text="Tools" runat="server">
                <ul class="links">                    
                    <li><a href="../emptools/support.aspx" target="_blank">Support Request</a></li>
                    <li><a href="change_password.aspx" target="_blank">Reset Password</a></li>                  
                    <li><a href="../AgencyPortal/employee_directory.aspx" target="_blank">Employee Directory</a></li>
                    <li><asp:HyperLink ID="hypLnkBenefits" Text="2018-2019 Benefits Guide" NavigateUrl="~/EmployeePortal/pdf/SMCI_2018_2019_FULL_BenefitGuideWithNotices.pdf" runat="server" Target="_blank" /></li>
                    <li><asp:HyperLink ID="hypLnkRevised" Text="Revised UHC All Savers Page" NavigateUrl="~/EmployeePortal/pdf/UHCAllSaversRevisedRatesPage.pdf" runat="server" Target="_blank" /></li>
                    <li><asp:HyperLink ID="hypLnkHandbook" Text="Employee Handbook" NavigateUrl="~/EmployeePortal/pdf/RevisedEmployeeHandbook2015.pdf" runat="server" Target="_blank" /></li>
                    <li><asp:HyperLink ID="hlnkOfficeNumbers" Text="2018 Office Numbers" runat="server" NavigateUrl="~/EmployeePortal/pdf/2018 Office Numbers.pdf" Target="_blank" /></li>
                    <li><a href="Forms.aspx" target="blank">Policy Forms List</a></li>
                    <li><asp:HyperLink ID="hlnkDesignation" Text="2018 Designations Directory" runat="server" NavigateUrl="~/EmployeePortal/pdf/2018DesignationsDirectoryEdition1-1.pdf" Target="_blank" /></li>
                    <li><asp:HyperLink ID="hlnkReferralPolicy" Text="Employee Referral Policy" NavigateUrl="~/EmployeePortal/pdf/EmployeeReferralPolicy.pdf" Target="_blank" runat="server" /></li>
                    <li><a href="FAQs.aspx" target="_blank">Frequently Asked Questions </a></li>
                </ul>
        </custom:Tab>
        <custom:Tab ID="Tab3" Text="In House Apps" runat="server">
        <ul class="links">
            <li><a href="MyAcctInfo/Search.aspx" target="_blank">Account Information</a></li>
            <li><a href="MyAutoCodes/AutoCode.aspx" target="_blank">Auto Codes</a></li>
            <li><a href="claimlist.aspx" target="_blank">Claim History Listing</a></li>
            <li><a href="../emptools/expensereport.aspx" target="_blank">Expense Report</a></li>
            <li><a href="../emptools/inspections.aspx" target="_blank">Inspections</a></li>
            <li><a href="MyNewBusiness/SearchNewBusiness.aspx" target="_blank">New Business</a></li>
            <li><a href="MyCandleSafety/AddRecord.aspx" target="_blank">Candle Safety App</a></li> 
            <li><a href="AgentReport/agencyProductionReport.aspx" target="_blank">Agency Production Report</a></li>
            <li><a href="UserAccounts/agentUserAccounts.aspx" target="_blank">Agency User Account Information</a></li>
<%--            <li><a href="LossControl/ShareFiles.aspx" target="_blank">Add Share Files</a></li>
            <li><a href="LossControl/SearchShareFiles.aspx" target="_blank">Search Share File</a></li>--%>
            <li></li>           
        </ul>
        </custom:Tab>
        <custom:Tab ID="Tab4" Text="Reports" runat="server">
         <ul class="links">           
            <li><a href="../emptools/projprems.aspx" target="_blank">Projected Premiums</a></li>
            <li><a href="../emptools/polcount.aspx" target="_blank">Policy Count</a></li>
            <li><a href="../emptools/denom.aspx" target="_blank">Denomination Count</a></li>
         </ul>
        </custom:Tab>
        </custom:ClientTabs>
   </div>
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

