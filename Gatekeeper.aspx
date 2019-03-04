﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Gatekeeper.aspx.vb" Inherits="Gatekeeper" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gatekeeper</title>
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
    height:800px;
    margin-right:auto;
    margin-left:auto;
    border-right: 2px solid #000000;
    border-left: 2px solid #000000;
    border-bottom: 2px solid #000000;
    background-color:#ffffff;
   /* height:auto;*/
}

/* box model hacks for IE 5.5 */
#wrapper {
	overflow: hidden;
}

#banner {
    height:100px;
    position:relative;
    border:0px solid black;
}

#banner h1 {
    margin-top:50px;
    padding:3px;
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

.clear {
	clear: both;
}

</style>


</head>
<body>
    <form id="form1" runat="server">
<div id="wrapper">

     <div id="banner">
     <h1>Gatekeeper</h1>
     </div>

    <div id="main">
    
        <asp:Repeater 
             ID="rptFiles" 
             runat="server" 
             DataSourceID="srcFiles">
             <HeaderTemplate>
             <ul class="fileList">
             </HeaderTemplate>
             <ItemTemplate>
             <li>
            <asp:HyperLink 
                ID="lnkFile" 
                Text='<%#Eval("FileName")%>' 
                NavigateUrl='<%#Eval("Id", "~/AgencyPortal/BulletinHandler.ashx?id={0}")%>' 
                Target="_blank"
                runat="server" />
             <asp:Label ID="lblDate" runat="server" Text='<%#Eval("CreatedDate", "{0:d}")%>' ForeColor="blue" />
             </li>
             </ItemTemplate>
             <FooterTemplate>
            </ul>
             </FooterTemplate>
        </asp:Repeater>
        </div>
<%--        <div id="footer">
        </div>--%>
    </div>
    <br />
   
            <asp:SqlDataSource 
             ID="srcFiles" 
             runat="server" 
             ConnectionString="<%$ ConnectionStrings:SMCI %>" 
             InsertCommand="INSERT BulletinForms (FileName, CreatedDate, FileBytes) VALUES (@Filename, @Createddate, @Filebytes)" 
             SelectCommand="SELECT Id, FileName, CreatedDate FROM BulletinForms WHERE FileType = 'Gatekeeper' ORDER BY CreatedDate DESC">
            <InsertParameters>
                <asp:Parameter Name="Filename" />
                <asp:Parameter Name="Createddate" />
                <asp:Parameter Name="Filebytes" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
