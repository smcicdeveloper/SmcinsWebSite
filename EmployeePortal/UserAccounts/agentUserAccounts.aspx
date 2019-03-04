<%@ Page Language="VB" AutoEventWireup="false" CodeFile="agentUserAccounts.aspx.vb" Inherits="EmployeePortal_UserAccounts_agentUserAccounts" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agency Production Report</title>

<style type="text/css">
    
    /* Reset tags
   Reset agent stylesheet
-----------------------------------------------------------*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}

/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}    

body {
    background-color:#aaaaaa;
    font-size: .80em;
    font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
    margin: 4px auto;
    max-width:90%;
    
}

#head {
    background-color:#212934; 
    border-bottom:solid 1px #8e8d8d;
    padding:2%; 
    color:White;   
}

#container {
    background-color:#ffffff;
   -moz-box-shadow:2px 2px 5px #000;
   -webkit-box-shadow:2px 2px 5px #000;
    box-shadow: 2px 2px 5px #000;    
}

aside {  
   background-color:#f3f3f3;
   width:18%;
   float:left;
   height:1500px;
   padding:2%;   
}

section {
    /*background-color:#0bc915; */        
    float:left;
    padding:2%;
    width:70%;
    /*height:400px;*/
}

.clear {
    clear:left;
}

.repeater {
    font-size:14px;
    margin:0px 0px 5px 5px;
    width: 100%; 
    }
            
.repeater th {
    width:20%;
    padding:8px;
    text-align:left;
    font-weight:bold;
    }
            
.repHeader {
    text-align:left;  
    width:20%; 
    font-weight:bold;        
    } 
    
.repColumn {
    font-size:14px;
    margin:1px; 
   }  
   
.repColumn tr {
    width:50%;
    text-align:left;
    font-weight:;
  }      
            
.row td {
    text-align:left;    
    padding:5px;
    /*border-bottom:0px dotted #ddd;  */    
    } 

.subHeader th {
    color:#5e5f5f;
    text-decoration:underline;
   }
   
.searchList {
    list-style:none;
   }  
   
section h1 {
    font-weight:bold; 
    text-decoration: underline;
    }  
    
.dropDownList {
 padding:2px;
 margin-top:6px;
 border-radius: 5px;
 border: 1px solid #d4d4d4;
 width:100%;
}   

.dropDownList {
	font-size:11px;
}  

.dropDownList:hover {
  border: 1px solid #A980A3
} 

</style>

</head>
<body>
    <form id="form1" runat="server">
    

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

 <div id="container">
    
    <header id="head">
        <h1>AGENCY USER ACCOUNTS</h1>
    </header>

    <aside>
    <ul class="searchList">
     <li>
         <asp:DropDownList 
              ID="ddlState" 
              runat="server" 
              CssClass="dropDownList" 
              AutoPostBack="True">           
             <asp:ListItem Value="GA" Text="GEORGIA" />
             <asp:ListItem Value="KY" Text="KENTUCKY" />
             <asp:ListItem Value="NC" Text="NORTH CAROLINA" />
             <asp:ListItem Value="SC" Text="SOUTH CAROLINA" />
             <asp:ListItem Value="TN" Text="TENNESSEE" />
             <asp:ListItem Value="VA" Text="VIRGINIA" />
         </asp:DropDownList>
     </li>
    </ul>
    <br />


 </aside>
   <section>

        <rsweb:ReportViewer 
               ID="ReportViewer1" 
               runat="server"
               Font-Names="Verdana" 
               Font-Size="8pt" 
               InteractiveDeviceInfos="(Collection)" 
               WaitMessageFont-Names="Verdana" 
               WaitMessageFont-Size="14pt" 
               Width="1280px" Height="1000px">
            <LocalReport ReportPath="EmployeePortal\UserAccounts\Report.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="srcAgentAccounts" Name="AgencyUserAccounts" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
 
 </section>

    <br class="clear" />

</div>

<asp:ObjectDataSource 
        ID="srcAgentAccounts" 
        runat="server" 
        SelectMethod="GetUserAccountData" 
        TypeName="UserAccountDB">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlState" Name="stateParam" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:ObjectDataSource>




</form>
</body>
</html>
