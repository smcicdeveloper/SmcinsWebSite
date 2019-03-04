<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Employee_Directory.ascx.vb" Inherits="WizardSteps_Employee_Directory" %>

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

/*****FIND EMPLOYEE***************************************/
#ep_top {
    margin-top:12px;
    margin-bottom:10px;
    /*margin-left:11%;*/
}

#ep_top fieldset {
    /*width:650px;*/
    height:auto;
    padding:8px;
    border:0px;
    margin-bottom:30px;
}
        
#ep_top fieldset legend {
    font-weight:bold;
}

#ep_top table   {
    margin-top:10px;
}
        
#ep_top table tr {
    height:30px;
}

#ep_top fieldset label {
       
}
        
#ep_top span {
    padding:0px;
}
        
.div_datalist {padding:5px;}

.image-left {
	float: left;
	margin-right: 10px;
	margin-bottom: 10px;
}

/*.image-left {
   float: left;
   margin-right: 10px;
   margin-bottom: 10px;
   overflow:hidden;*/

</style>

<div id="wrapper">
 <div id="ep_top">
            <fieldset>
              <legend>Employee Search</legend>
                <table border="0">
                    <tr>
                        <td>
                        <label>Choose Department:</label>
                             <br />
                            <asp:DropDownList 
                                 ID="ddlDepart" 
                                 runat="server" 
                                 AutoPostBack="True"
                                 Width="180px">
                                <asp:ListItem>Officers</asp:ListItem>
                                <asp:ListItem>Financial Services</asp:ListItem>
                                <asp:ListItem>Accounting</asp:ListItem>
                                <asp:ListItem>Claims</asp:ListItem>
                                <asp:ListItem>Loss Control</asp:ListItem>
                                <asp:ListItem>Marketing</asp:ListItem>
                                <asp:ListItem>Support Services</asp:ListItem>
                                <asp:ListItem>Underwriting</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </fieldset>
    
    <fieldset style="background-color:#EFEFEF;height:1400px;">
           <asp:DataList 
             ID="dlstImages" 
             DataSourceID="srcImages"
             runat="server" 
             DataKeyField="IMAGE_ID" 
             RepeatColumns="2" 
             BorderColor="#CCCCCC" 
             BorderStyle="None" 
             BorderWidth="1px" 
             CellPadding="4" 
             ForeColor="Black" 
             GridLines="Horizontal" >
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" CssClass="image-left" ImageUrl='<%# String.Format("DynamicImage.ashx?IMAGE_ID={0}", Eval("IMAGE_ID")) %>' />
                <div>
                <b><asp:Label ID="Label1" runat="server" Text='<%# Eval("NAME") %>' /></b>
                <br />
                <span><asp:Label ID="lblDepart" runat="server" Text='<%# Eval("DEPARTMENT") %>' style="color: #710071" /></span>
                <br />
                <span><i><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("TITLE") %>' /></i></span>
                <br />
                <span><asp:Label ID="lblState" runat="server" Text='<%# Eval("STATE") %>' /></span>
                <br />
                <span><asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EMAIL") %>' style="color:blue;" /></span>
                <br />
                <span><asp:Label ID="lblExtension" runat="server" Text='<%# Eval("EXTENSION") %>' /></span>
                </div>
                <br />
                 <br />
            </ItemTemplate>
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
    
            </fieldset>
                   <asp:SqlDataSource 
                        ID="srcImages" 
                        ConnectionString="<%$ ConnectionStrings:SMCI %>" 
                        SelectCommand="SELECT IMAGE_ID, NAME, DEPARTMENT, TITLE, STATE, EMAIL, EXTENSION FROM EmployeeImages WHERE DEPARTMENT=@Depart "
                        runat="server">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="ddlDepart" Name="Depart" 
                               PropertyName="SelectedValue" />
                       </SelectParameters>
                </asp:SqlDataSource>

            </div>
       </div>