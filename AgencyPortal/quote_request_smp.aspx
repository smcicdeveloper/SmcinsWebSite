<%@ Page Language="VB" AutoEventWireup="false" CodeFile="quote_request_smp.aspx.vb" MaintainScrollPositionOnPostback="true" Inherits="AgencyPortal_quote_request_smp" %>

<%@ Register src="../WizardSteps/Quote_Request_SMP.ascx" tagname="Quote_Request_SMP" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/CSS/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:Quote_Request_SMP ID="Quote_Request_SMP1" runat="server" />
    
    </div>
    </form>
</body>
</html>
