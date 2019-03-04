<%@ Page Language="VB" AutoEventWireup="false" CodeFile="my_policy_search.aspx.vb" Inherits="AgencyPortal_my_policy_search" %>

<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Web.UI.ExtenderControl" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="IBM.Data.DB2.iSeries" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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


    <style type="text/css">
        
    h1, h2, h3, h4, p, ul, ol, body, html {
	    margin: 0px;
	    padding: 0px;
    }
    a img { 
	    border: none;
    }
    body {
	    background:#E6E6E6 url('../CSS/Images/page_bg_2.png') repeat-y center top;
	    /*font: 75% Verdana, Arial, Helvetica, sans-serif;*/
    }       
        
    #wrapper {
        width:934px;
        height:auto;
        margin-right:auto;
        margin-left:auto;
        border-right: 2px solid #000000;
        border-left: 2px solid #000000;
        background-color:#ffffff;
    }
        
    #wrapper hr {
        border:.05em dotted silver;
        margin:0 0 10px 0;
    }
        
    #wrapper h3 {
        margin-left:5px;
        margin-top:5px;
    }
        
    #main {
        padding-left:10px;
        background-color:White;
        display:inline;
    }
    #search {
        text-align:left;
        font: 90% tahoma, Arial, Helvetica, sans-serif;
    }
    #search fieldset {
        height:65px;
        width:890px;
        margin:0px; 
   }
    #search ul {
        margin-top: 18px;
	    padding-left: 3px;
	    list-style: none;
	}
	#search li {
	    display: inline;
	    margin-right: 3px;
	    padding-bottom: .5em;
	}
             
/****** LOGO STYLES ***************************/

    #logo {
        height:123px;
        position:relative;
        /*background-image: url('../CSS/Images/agent_logo.png');
        background-repeat: no-repeat;
        background-position: left;*/
    }
    #logo p {
        margin:0;
    }
    #logo ul {
	    margin: 0px;
	    padding: 0px;
	    list-style: none;
    }
    #logo li {
	    display: inline;
	    margin-right: 3px;
	    padding-bottom: .5em; /* to display bottom border on links in IE */
    }
    #sitetools {
        text-align:right;
    }
    #sitetools li a {
	    font-size: 1em;
	    text-decoration: none;
	    color: #10214e;
	    line-height: 2em;
	    background: #DCE5FF;
	    padding: 5px;
	    height: 2em;
	    border: 1px solid #4D69B0;
	    font-weight: bold;
    }
    #sitetools li a:hover {
	    color:#DCE5FF;
	    background-color:#10214e;
    }
        
/*****Top Bar*************************************/   
             
    #top_bar {
        margin-bottom:0px;
        position:relative;
        top:0px;
        left:0px;
        right:0px;
        background-color:#ffffff;
        overflow:hidden;
    }
        
    #top_bar ul {
        width:450px;
        margin-top:3px;
        border:0px solid black;
        text-align:left;
        margin-left:.75em;           
    }
        
    #top_bar li {
	    display: inline;
	    /*margin-right:.5em;
	    padding-right:1.5em;*/
	        
    }
        
    #top_bar p {
        /*text-align:right;*/
        color:#a9c2f6;
        float:right;
        margin:.05em .5em .2em 0;
        font-weight:bold;
        clear:both;
    }        
               
    .top_bar_label {
        font-weight:bold;
    }
        
    .top_bar_welcome {
        font: 90% tahoma, Arial, Helvetica, sans-serif;
        color:#000000;
    }
        
    .top_bar_agent_number {
        font: 90% tahoma, Arial, Helvetica, sans-serif;
        color:#4b5358;
    }
        
    .top_bar_logout {
    font: 90% tahoma, Arial, Helvetica, sans-serif;
    }
        
    .formView {
        margin:0;
        padding:0;
        float:left;
        }
        
/******Tabs***************************************/

    .tab {
        padding:2px 25px;
        border:solid 1px #a9c2f6;
        cursor:pointer;
    }

    .unselectedTab {
        background-color:#046fb5;
        color:#ffffff;
        font-weight:bold;
        font: 75% tahoma, Arial, Helvetica, sans-serif;
    }

    .selectedTab {
        background-color:#a9c2f6;
        color:#063e72;
        border-bottom:solid 1px white;
        font: 75% tahoma, Arial, Helvetica, sans-serif;
    }

    .tabs {
        position:relative;
        top:3px;
        left:15px;
    }

    .tabContent {
        border:Solid 1px #a9c2f6;
        background-color:#ffffff;
        padding:10px;          
        width:800px; /*control the width of the tab box*/
    }

    .tabContent p {
        font-size:12px;
        padding:5px;
        color:#626364;
    }

        #tools {
        margin-top:10px;
        margin-left:10px; /*move the tab box to the right*/
        color:#4b5358;
    }
    
    #tools p {
        margin-top:15px;
        margin-bottom:15px;
        width:500px;
        letter-spacing:.1em;
        line-height:125%;
        font: 70% tahoma, Arial, Helvetica, sans-serif;
    }
    
    #tools h3 {
        margin-bottom:4px;
        color:#046fb5;
        font-weight:bold;
        font: 100% tahoma, Arial, Helvetica, sans-serif;
    }
    
    #tools fieldset {
        border:0px;
        margin-bottom:15px;
    }
               
    #tools table td {
        padding:4px 25px 2px 2px;
        caption-side:top;
        vertical-align:text-top
    }
        
    #tools table li, #tools fieldset li {
        padding:3px;
        font: 100% tahoma, Arial, Helvetica, sans-serif;
        }
         
    #tools table a, #tools fieldset a {
        text-decoration:none;
        color:#4b5358;
    }
    
    #tools table a:hover, #tools fieldset a:hover {
            text-decoration:underline;
            color:#046fb5;
        }
     
    #tools table ul, #tools fieldset ul {
        font-size:11px;
        list-style:disc;
        margin-left:18px;
        padding-bottom:3px;
    }
     
    #tools a {
        text-decoration:none;
        color:Blue;
        } 
     
    #tools a:hover {
        text-decoration:underline;
        color:Blue;
    }
           
    #tools ol {
        margin:20px 15px 5px 0;padding:0;
    }
    
    #tools ol li {
        display: inline;
        list-style-type:none;
    }
        
    .tools_hyperlink {
        font: 75% tahoma, Arial, Helvetica, sans-serif;
        padding-left:5px;
    }
        
    .tools_gridview {
        font: 70% tahoma, Arial, Helvetica, sans-serif;
    }
    
        /*****Billing Policyholder Tools****** 
      #billing ul {
        list-style: none;
        margin-top:10px;
        margin-bottom:20px;
        padding:0;
        font-family: Calibri, sans-serif;
        font-size:12px;
    }
    
    #billing ul li {
        float:left;
        margin-right:25px;
    }

    #billing label {
        margin:0;
        padding:0;
    }*/
        
    #chart_box {
        border:0px solid black; 
        clear:both;
    }
        
    #chart_box ol {
        border:0px solid black;
        }
         
    #chart_box ol li {
        display: inline;
        list-style-type:none;
        }
         
    #chart_box li {
        float:left;
	    margin-right:3px;
	    width:280px;
	    overflow:hidden;
	    }
	     
	 #center-box {
	    margin-left:50px;
	    margin-bottom:55px;
	    }
                
    .left_side  {
        width:350px;
    }
           
    #right_side {
        border:1px solid black;        
        width:300px;
        text-align:left;
        overflow:auto;
    }
        
    #right_side p {
        font-size:11px;
        word-spacing:2px;
        padding:3px;
        margin-top:3px;
    }
        
    /* Bottom Bar */
      
    #bottom_bar {
        clear: both;
        background-color: White;
        padding:10px;
        text-align: center;
        height:305px; 
    }
    
    /*****FIND POLICY*****************************************/
    
    .po_search {
      margin:10px 0 160px 25px;
    
    }
    
    .po_search ul li label {
      margin:0px;
      padding:0px;
    }
    
    .po_search ul {
       list-style: none;
       margin-top:15px;  
    }
    
    .po_search ul li {
       float: left;
       margin-left:1px;
       border:0px solid black;
       padding:4px;
    }
    
    .po_search hr {
        border: 1px solid #1f1f1f;
        width:800px;
    }
    
    .textbox {
         padding:4px;
         margin-top:4px;
         border-radius: 5px;
         border: 1px solid #d4d4d4;
         font-family : Tahoma ;
         font-size : small ;
    }
    
    .gridview {
        font-size:11px;
        margin:20px; 
    }
            
    .gridview td, gridview th {
        padding:8px;
    }
            
    .grHeader {
        text-align:left;  
        width:150px;         
    }  
            
    .row td {
        border-bottom:1px dotted #ddd;
        width:150px;
        text-align:left;
    } 
    
    .autocomplete_completionListElement {
        margin : 0px!important ;
        background-color : inherit ;
        color : windowtext ;
        border : buttonshadow ;
        border-width : 1px ;
        border-style : solid ;
        cursor : 'default' ;
        overflow : auto ;
        height : 200px ;
        font-family : Tahoma ;
        font-size : small ;
        text-align : left ;
        list-style-type : none ;
    }

    .autocomplete_highlightedListItem {
        background-color : #ffff99 ;
        color : black ;
        padding : 1px ;
    }

    .autocomplete_listItem {
        background-color : window ;
        color : windowtext ;
        padding : 1px ;
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
	overflow:hidden;
    }
    /*******FOOTER****************************************/
   #_footer {
    clear: both;
    background-color: #046fb5;
    padding: 10px;
    text-align: center;
    border-bottom:.07em solid #dfdfdf;
}
   #_footer h5 {
       margin:0;
       font: 70% tahoma, Arial, Helvetica, sans-serif;
       color:#ffffff;
       padding:4px;
   }
   
   .close_img {z-index:5px;position:relative;top:-45px;left:790px;}
   
   
   /*********New User Box******************************/
    #new_user_box {
        margin-top:50px;
    }
    #new_user_box h1 {
        margin:7px 0 15px 15px;
        font: 145% tahoma, Arial, Helvetica, sans-serif;
        color:#045f9c;
    }
    #go_left {
    position:relative;
    float:left;
    width:430px;
    height:375px;
    margin-left:10px;
    margin-right:10px;
    padding:25px;
    border: 1px dotted #045f9c;
    /*background-color:#E2E2E2;*/
    }
    #go_left ul {
      list-style:none;
      padding:9px;
      
    }
    #go_left ul li {
      float:left;
      margin-right:3px;
      
    }
    #go_left li {
       width:175px;
       padding:5px;
       font: 70% tahoma, Arial, Helvetica, sans-serif;
       border:0px solid black;
    }
    #go_left table td {
        padding:5px;
    }
    #go_left h4 {
        margin:0;
        font-family:tahoma, Arial, Helvetica, sans-serif;
    }
        #go_left h5 {
        margin:0;
        font:70% tahoma, Arial, Helvetica, sans-serif;
        font-weight:bold;
    }
    .agent_list {
        padding:4px;
    } 
    #go_left p {
        width:160px;
        font: 70% tahoma, Arial, Helvetica, sans-serif;
        color:Black;
        padding:0px;
        font-weight:bold;
    } 
    #go_right {
    position:relative;
    float:left;
    width:300px;
    height:375px;
    margin-right:10px;
    margin-left:20px;
    /*padding:25px;
    border: 1px dotted #045f9c;*/
    overflow:auto;
    /*background-color:#E2E2E2;*/
    } 
    #go_right table td {
      border:0px;
      border-bottom:1px dotted #AAAAAA;
      padding:4px;
    }
    .btnStep {
        width:125px;
        padding:5px;
        font: 80% tahoma, Arial, Helvetica, sans-serif;
    } 
    .wizzard_textbox {
        font: 100% tahoma, Arial, Helvetica, sans-serif;
    } 
    .role_listbox {
       font: 80% tahoma, Arial, Helvetica, sans-serif;
       padding:3px;
    }   
    #wizzard_footer {
        width:800px;
        clear:both;
        margin:35px 0 0 10px;
        border: 1px dotted #045f9c;
        font: 80% tahoma, Arial, Helvetica, sans-serif;
        padding:10px;
       /* background-color:#E2E2E2;*/
    }
        #wizzard_footer ul {
        padding:6px;
    }
    #wizzard_footer ul li {
        list-style-type:disc;
        margin-left:10px;
    }
    #wizzard_footer p {
        padding:10px;
    }
    .wizzard_footer_hyperlink {
        padding:10px;
        font: 85% tahoma, Arial, Helvetica, sans-serif;
    }
    
</style>

<script runat="server">
    
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load   
        Application("MyAgentCode") = Session("AgentNumber")
        txtSearch.Focus()
        
        Dim x As String = ace1Value.Value
    End Sub
            
</script>


</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
     <div id="logo">
          <asp:Image ID="Image1" runat="server" ImageUrl="~/CSS/Images/agent-logo.png" />
              <a href="javascript:window.close();"><img alt="" 
              src="../CSS/Images/close-link.png" class="close_img" /></a>
    
      </div>

      <div id="top_bar">

    </div>
   
    
      <div id="main">

          <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
          </asp:ScriptManager>

<div class="po_search">
<ul>
 <li><label>Search</label>
 </li>
 <li style="margin-top:8px;"><hr /></li>
</ul>
<br />
<ul>
  <li>
<asp:TextBox 
        ID="txtSearch" 
        runat="server" 
        CssClass="textbox " 
        Width="450px" />

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
           DelimiterCharacters="">
      </asp:AutoCompleteExtender>


<asp:HiddenField 
    ID="ace1Value" 
    runat="server" />

  </li>
  <li style="margin-top:5px;">
      <asp:Button ID="btnSearch" runat="server" Text="Look Up" Width="80px" />
  </li>
    <li style="margin-top:5px;">
      <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px" />
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
          <legend style="font-family:Verdana; font-weight:bold; font-size:14px; color:#010fff;">Account Summary</legend>
        <asp:DataList 
             ID="DataList1" 
             runat="server"             
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



     </div>
    <div id="bottom_bar">

    </div>
   <div id="_footer">
    <h5>Copyright&#169; 2017 Southern Mutual Church Insurance</h5>
    <h5>P.O. Box 9346 - 201 Greenlawn Drive - Columbia, SC 29290</h5>
    <h5>Office (803)776-9365 - Toll Free (800)922-5332</h5>
   </div>  
    </div>

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
            SelectMethod="GetBillingDetails" 
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


    </form>
</body>
</html>
