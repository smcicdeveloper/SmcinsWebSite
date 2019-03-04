<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Change_Request_Form.ascx.vb" Inherits="WizardSteps_Change_Request_Form" %>


<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<style type="text/css">
/*********************/
/* BASIC */
/*********************/

body {
	font-family: "Century Gothic", "Gill Sans", Arial, sans-serif;
	margin: 0;
	background-color: #E6E6E6;
}

p,h1,h2,h3,h4,h5,h5,ol,ul {
	margin: 0px;
	padding: 0px;
}


/*********************/
/* LAYOUT */
/*********************/
        
#wrapper {
    width:820px;
    height:auto;
    margin-right:auto;
    margin-left:auto;
    border-right: 2px solid #000000;
    border-left: 2px solid #000000;
    background-color:#ffffff;
   /* height:auto;*/

}

#banner {
    height:65px;
    position:relative;
}

#banner ul {
	position:relative;
	top:51px;
	left:10px;
	margin-right:60px;
	list-style: none;
}
#banner ul li {
	display: inline;
	margin-right: 9px;
	float:left;
}

/*********************/
/* MAIN SECTION STYLES */
/*********************/

#main {
	padding: 3px 3px 0 10px;
	float: left;
	width: 800px;
	height:auto;
}

#main label {
    font-weight:bold;
    margin-right:15px;  
}

#main hr 
{
    border:.03em dotted gray;
    margin-top:18px;
}

#main h1 {
	color: #5F9794;
	font: bold 24px "Century Gothic", "Gill Sans", Arial, sans-serif;
	margin-bottom:15px;
}

#main ul {
    list-style:none;
    padding:9px;
}

#main ul li {
    float:left;
    margin-right:3px;
}

.label_li {
    width:235px;
}

.section {
	display: block;
	font-weight: normal;
	color: #D6ECAE;
}

#action_buttons {
	margin-top: 25px;
	margin-bottom: 10px;
	padding:10px;
}

#action_buttons li {
	list-style-type: none;
	padding: 0px;
	margin: 0;
	float: right;	
}

/* box model hacks for IE 5.5 */
#wrapper {
	overflow: hidden;
}

.privacy 
{
    font-size:11px;
    margin-top:15px;
    width:760px;
}

.clear {
	clear: both;
}

</style>



<div id="wrapper">
<asp:FormView 
     ID="FormView1" 
     runat="server" 
     DataSourceID="ObjectDataSource1">
     <ItemTemplate>

         <div id="banner">
             <ul>
                 <li>
                     <label>
                     Agency:</label></li>
                 <li>
                     <asp:Label ID="lblAgency" runat="server" Text=""></asp:Label>
                 </li>
             </ul>
             <ul>
                 <li>
                     <label>
                     Agent Number:</label></li>
                 <li>
                     <asp:Label ID="lblAgentNumber" runat="server" Text='<%# Eval("AGENCY")%>'></asp:Label>
                 </li>
             </ul>
         </div>


         <div id="main">
             <hr />
             <h1>
                 POLICY ENDORSEMENT:<span>CHANGE REQUEST FORM</span></h1>
             <ul>
                 <li class="label_li">
                     <label>
                     Insured Name:</label></li>
                 <li>
                     <asp:Label ID="lblTheInsured" runat="server" Text='<%# Eval("ADD0LINE01")%>'></asp:Label>
                 </li>
             </ul>
             <br />
             <ul>
                 <li class="label_li">
                     <label>
                     Location of Church:</label></li>
                 <li>
                     <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("ADD0LINE03")%>'></asp:Label>
                 </li>
             </ul>
             <br />
             <ul>
               <li class="label_li">
                 <label>City/State:</label>
               </li>
               <li>
                 <asp:Label ID="lblCityState" runat="server" Text='<%# Eval("ADD0LINE04")%>'></asp:Label>
               </li>
             </ul>
             <br />
             <ul>
                 <li class="label_li">
                     <label>
                     Policy Type:</label></li>
                 <li>
                     <asp:Label ID="lblPolicy" runat="server" Text='<%# Eval("SYMBOL")%>'></asp:Label>
                 </li>
                 <li>
                     <asp:Label ID="lblPolicyNumber" runat="server" Text='<%# Eval("POLICY0NUM")%>'></asp:Label></li>
             </ul>
             <br />
             <ul>
                 <li class="label_li">
                     <label>
                     Effective Date of Change:</label></li>
                 <li>
                     <asp:TextBox ID="txtEffDate" runat="server" MaxLength="10"></asp:TextBox>
                 </li>
                 <li>
                     <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                         ControlToValidate="txtEffDate" ErrorMessage="Missing Effective Date Field." 
                         Text="*" ForeColor="red" />
                 </li>
                 <li>
                     <asp:RegularExpressionValidator ID="revDate" runat="server" 
                         ControlToValidate="txtEffDate" ErrorMessage="Date Format Should be MM/DD/YYYY" 
                         Text="*" ForeColor="red" ValidationExpression="^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$" />
                 </li>
             </ul>
             <br />
             <ul>
                 <li>
                     <label>
                     Description of Change:<br />
                     <br />
                     <asp:TextBox ID="txtCommentBox" runat="server" Height="117px" 
                         TextMode="MultiLine" Width="574px"></asp:TextBox>
                     </label>
                 </li>
                 <li>
                     <asp:RequiredFieldValidator ID="rfvCommentBox" runat="server" 
                         ControlToValidate="txtCommentBox" ErrorMessage="Missing Description" Text="*" ForeColor="red" />
                 </li>
             </ul>
             <div class="clear">
             </div>
             <hr />
             <h2>
                 AGENTS INFORMATION</h2>
             <ul>
                 <li class="label_li">
                     <label>
                     Requested By:</label></li>
                 <li>
                     <asp:TextBox ID="txtFrom" runat="server" MaxLength="25"></asp:TextBox>
                 </li>
                 <li>
                     <asp:RequiredFieldValidator ID="rfvFrom" runat="server" 
                         ControlToValidate="txtFrom" ErrorMessage="Please Enter Requested By" Text="*" ForeColor="red" />
                 </li>
             </ul>
             <br />
             <ul>
                 <li class="label_li">
                     <label>
                     Your E-Mail:</label></li>
                 <li>
                     <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" ForeColor="GrayText"></asp:TextBox>                       
                 </li>
                 <li>
                     <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                         ControlToValidate="txtEmail" ErrorMessage="Please Enter an Email Address" 
                         ForeColor="red" Text="*" />
                 </li>
                 <li>
                     <asp:RegularExpressionValidator ID="refEmail" runat="server" 
                         ControlToValidate="txtEmail" ErrorMessage="Wrong Email Format" ForeColor="red" Text="*" 
                         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                 </li>
                 <li><asp:CheckBox ID="chkChangeEmail" runat="server" 
                         Text="Change e-mail if not correct" AutoPostBack="True" Font-Size="11px" 
                         oncheckedchanged="chkChangeEmail_CheckedChanged" /></li>
             </ul>
             <br />
             <ul>
                 <li class="label_li">
                     <label>
                     Phone Number:</label></li>
                 <li>
                     <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="12"></asp:TextBox>
                 </li>
                 <li>
                     <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                         ControlToValidate="txtPhoneNumber" 
                         ErrorMessage="Please Enter Your Contact Number" ForeColor="red" Text="*" />
                 </li>
                 <li>
                     <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                         ControlToValidate="txtPhoneNumber" ForeColor="red" 
                         ErrorMessage="Phone Number Format should be XXX-XXX-XXXX" Text="*" 
                         ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                 </li>
             </ul>
             <br class="clear" />
<%--             <p class="privacy">
                 CosmoFarmer.com believes that your privacy is important. Information collected 
                 at this site is limited to our network of 9,872 partner affiliates. Your 
                 information will only be shared among them, and as part of our network&#39;s 
                 anti-spam policy you will be limited to one e-mail per partner affiliate per 
                 day, not to exceed a total of 9,872 e-mails a day. If you wish to opt out of 
                 this program please call us between the hours of 9:01-9:03am GMT.</p>--%>
         </div>


     </ItemTemplate>
  </asp:FormView>

  <!-- end main -->
 <br class="clear" />
  <div id="action_buttons">
    <ul>
        <li><asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="False" /></li>
        <li><asp:Button ID="btnSubmit" runat="server" Text="Submit" /></li>
    </ul>
  </div>
    <asp:ValidationSummary ID="ValidationSummary1" ShowMessageBox="true" 
        runat="server" ShowSummary="False" />
  <br />
  </div>
  <!-- end wrapper -->
<%--         <asp:ObjectDataSource 
          ID="odsCustList" 
          runat="server" 
          SelectMethod="AgencyCustomerList2" 
          TypeName="smci.DataAccessLayer.MySqlOdbcCode">
          <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
          </SelectParameters>
         </asp:ObjectDataSource>--%>

    <asp:ObjectDataSource 
    ID="ObjectDataSource1" 
    runat="server" 
    SelectMethod="AgencyCustomerList5" 
    TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:QueryStringParameter Name="policynum" QueryStringField="policynum"  />
        <asp:QueryStringParameter Name="symbol" QueryStringField="symbol" />
    </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
     ID="odsStatusCheck" 
     runat="server" 
     SelectMethod="ReadPolicyStep1"
     TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:SessionParameter Name="custnum" SessionField="custnum" Type="String" />
        <asp:SessionParameter Name="symb0l" SessionField="symb0l" Type="String" />
        <asp:SessionParameter Name="policynum" SessionField="policynum" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

