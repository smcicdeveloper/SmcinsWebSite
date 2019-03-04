<%@ Control Language="VB" AutoEventWireup="false" CodeFile="bulletin_form_list.ascx.vb" Inherits="WizardSteps_bulletin_form_list" %>

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

    <div id="wrapper">

     <div id="banner">
     <h1>Bulletin Forms</h1>
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
                NavigateUrl='<%#Eval("Id", "BulletinHandler.ashx?id={0}")%>' 
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
             SelectCommand="SELECT Id, FileName, CreatedDate FROM BulletinForms ORDER BY CreatedDate DESC">
            <InsertParameters>
                <asp:Parameter Name="Filename" />
                <asp:Parameter Name="Createddate" />
                <asp:Parameter Name="Filebytes" />
            </InsertParameters>
        </asp:SqlDataSource>