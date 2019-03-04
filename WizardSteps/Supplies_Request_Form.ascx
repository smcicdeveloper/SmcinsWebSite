<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Supplies_Request_Form.ascx.vb" Inherits="WizardSteps_Supplies_Request_Form" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>

<style type="text/css">
/*********************/
/* BASIC */
/*********************/

body {
	font-family: "Century Gothic", "Gill Sans", Arial, sans-serif;
	margin: 0;
	background:#E6E6E6 url('../CSS/Images/page_bg.png') repeat-y center top;
}

p,h1,h2,h3,h4,h5,h5,ol,ul {
	margin: 0px;
	padding: 0px;
}

a img { 
	border: none;
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
   height:auto;
}

#banner {
    height:65px;
    position:relative;
    text-align:right;
}

#banner ul {
	position:relative;
	top:51px;
	left:10px;
	margin-right:60px;
	list-style: none;
}
#banner li {
	display: inline;
	margin-right: 3px;
	float:left;
}

/*********************/
/* MAIN SECTION STYLES */
/*********************/

#main {
	padding: 3px 3px 0 10px;
	float: left;
	width: 800px;
	margin-bottom:15px;
}

#main label {
    font-weight:bold;
    margin-right:15px;  
    padding:5px;
}

#main hr {
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
    margin-top:4px;
}

#main ul li {
    float:left;
    margin-right:1px;
}

#main fieldset {
    height:110px;
    margin-bottom:30px;
}

#main td, th {
    padding:5px;
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

#footer {
	padding: 3px 3px 0 10px;
	width: 545px;
	margin-bottom:15px;
	margin:auto;
	border:0px solid black;
	clear:both;
}

#footer ul {
    list-style:none;
    padding:9px;
}

#footer ul li {
    display:inline;
    margin-right:3px;
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

.div_left {
	float: left;
	margin-right:20px;
	width:auto;
	height:105px;
	border:0px solid black;
	padding-left:5px;
    vertical-align:middle;
}

.div_right {
	float: right;
	margin: 0px;
	width:165px;
	height:105px;
	border:0px solid black;
	padding:4px;
	background-color:#ececec;
}

.div_right li {
    border:0px solid black;
    width:70px;
}

.myDataList {
 	margin:auto;	
}

</style>


<div id="wrapper">

<asp:FormView 
     ID="FormView1" 
     runat="server" 
     DataSourceID="OdsAllPortal">
     <ItemTemplate>

         <div id="banner">
             <ul>
           <li><asp:Label ID="FullnameLabel" runat="server" Text='<%# Bind("Fullname") %>' /></li>
            <li><label>Agent Number:</label>&nbsp;<asp:Label ID="lblAgentNum" runat="server" /></li>
             </ul>
         </div>

      </ItemTemplate>
 </asp:FormView>

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

    <br />
    <div id="main">

    <fieldset>
    <ul>
      <li>
     <label>Select Category:
     <br />
         <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="scrCategory" 
            DataTextField="CATEGORY" DataValueField="CATEGORY_ID" Width="160px" 
            AutoPostBack="True">
         </asp:DropDownList>
     </label>
     </li>
   </ul>

 </fieldset>
        <asp:DataList 
             ID="DataList1" 
             runat="server" 
             DataKeyField="PRODUCT_ID" 
             DataSourceID="srcImages" 
             BackColor="White" 
             BorderColor="White" 
             BorderStyle="Ridge" 
             BorderWidth="2px" 
             CellPadding="3" 
             CellSpacing="1"
             CssClass="myDataList" 
             Width="545px">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
            <ItemTemplate>
              <div class="div_left">
                <asp:Image 
                ID="Image1" 
                runat="server" 
                ImageUrl='<%# String.Format("ProductHandler.ashx?PRODUCT_ID={0}", Eval("PRODUCT_ID")) %>' />
              </div>
              <div class="div_left">
                <asp:Label ID="ITEMLabel" runat="server" Text='<%# Eval("ITEM") %>' />
                <br />
                <b><asp:Label ID="ITEMSTATUSLabel" runat="server" Text='<%# Eval("ITEM_STATUS") %>'></asp:Label></b>
              </div>
              <div class="div_right">
              <ul>
                <li><label>Select:</label></li>
                 <li><asp:CheckBox ID="chbSelect" AutoPostBack="false" runat="server" /></li>
              </ul>
              <ul>
              <li><label>Quanity:</label></li>
               <li><asp:TextBox ID="txtQuanity" runat="server" TextMode="SingleLine" Width="30" Height="20" MaxLength="4" /></li>
              </ul>
              </div>
              <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>


        </div>
        <div id="footer">
        <ul>
         <li>
          <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
         </li>
         <li>
             <asp:Button ID="btnClear" runat="server" Text="Clear" /></li>
        </ul> 
        </div>


    </div>

     <asp:SqlDataSource 
        ID="srcImages" 
        ConnectionString="<%$ ConnectionStrings:SMCI %>" 
        SelectCommand="SELECT PRODUCT_ID, ITEM, ITEM_STATUS FROM AgentSupplyList WHERE CATEGORY_ID=@catid"
        runat="server">
         <SelectParameters>
             <asp:ControlParameter ControlID="ddlCategory" Name="catid" PropertyName="SelectedValue" />
         </SelectParameters>
   </asp:SqlDataSource>

    <asp:SqlDataSource 
         ID="scrCategory" 
         runat="server" 
         ConnectionString="<%$ ConnectionStrings:SMCI %>" 
         SelectCommand="SELECT CATEGORY_ID, CATEGORY FROM SupplyCategory">
    </asp:SqlDataSource>

<%--    <asp:SqlDataSource 
         ID="scrItemList" 
         runat="server" 
         ConnectionString="<%$ ConnectionStrings:SMCI %>" 
         SelectCommand="SELECT AgentSupplyList.PRODUCT_ID, AgentSupplyList.IMAGE, AgentSupplyList.ITEM, AgentSupplyList.CATEGORY_ID, SupplyCategory.CATEGORY FROM AgentSupplyList INNER JOIN SupplyCategory ON AgentSupplyList.CATEGORY_ID = SupplyCategory.CATEGORY_ID">
    </asp:SqlDataSource>--%>
