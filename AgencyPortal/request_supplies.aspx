<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="request_supplies.aspx.vb" Inherits="AgencyPortal_request_supplies" %>



<%@ Register src="../WizardSteps/Supplies_Request_Form.ascx" tagname="Supplies_Request_Form" tagprefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Supplies_Request_Form ID="Supplies_Request_Form1" runat="server" />
    </div>
    </form>
</body>
</html>
