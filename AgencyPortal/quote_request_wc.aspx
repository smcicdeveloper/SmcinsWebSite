<%@ Page Language="VB" AutoEventWireup="false" CodeFile="quote_request_wc.aspx.vb" Inherits="AgencyPortal_quote_request_wc" %>

<%@ Register src="../WizardSteps/Quote_Request_WC.ascx" tagname="Quote_Request_WC" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/CSS/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:Quote_Request_WC ID="Quote_Request_WC1" runat="server" />
    
    </div>
    </form>
</body>
</html>
