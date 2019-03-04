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
        Runat="server"><custom:Tab ID="Tab1" Text="Tools" runat="server">
        <br />
        <fieldset style="z-index:1px; background-color:#e2e2e2;padding:8px;border:1px dotted #cccccc;">
        <h2 style="color:Red;font: tahoma, Arial, Helvetica, sans-serif;">Alert!</h2>
        <p style="width:500px;letter-spacing:.15em;line-height:150%;font: 80% tahoma, Arial, Helvetica, sans-serif;">Please be aware you must use <b>Internet Explorer</b> to view/download policies and invoices. If you have IE 10, you must use Compatibility Mode. Other browsers will be supported in the near future.</p>
        </fieldset>
        <fieldset>
           <h3>Quote Request</h3><ul>
             <li><a href="../../apps/applog.aspx" target="_blank">Application Log</a></li>
             <li><a href="../../apps/app.aspx?Type=SMP" target="_blank">Special Multi Peril</a></li>
             <li><a href="../pdf/SMP_Application.pdf" target="_blank">PDF Version of SMP</a></li>
             <li><a href="../pdf/BA_Application.pdf" target="_blank">PDF Version of BA</a></li>
             <li><a href="../../apps/app.aspx?Type=WC" target="_blank">Workers Compensation</a></li>
             <li><a href="../pdf/WC_Application.pdf" target="_blank">PDF Version of WC</a></li>
             <li><a href="../../apps/app.aspx?Type=UM" target="_blank">Umbrella Liability</a></li>
             <li><a href="../pdf/UM_Application.pdf" target="_blank">PDF Version of UM</a></li>
             <li><a href="../../pdf/HelpfulTips.pdf" target="_blank">Request Tips</a></li>
             </ul>
             </fieldset> 
             <br />
        </custom:Tab>
             

      </custom:ClientTabs>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">

<fieldset>
    <h3>My Account</h3>
    <ul>
       <li><a href="../change_password_a.aspx">Change Password</a></li>
    </ul>
</fieldset>

</asp:Content>




