<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>Policy Holder Log In Southern Mutual Church Insurance Company</title>
<link rel="icon" href="images/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="css/all-stylesheets.css" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" /> <!--integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Fav and touch icons -->

<style type="text/css">
    
.customCalloutStyle div, .customCalloutStyle td{
    border: solid 1px Red;
    background-color:White;
    color:Black;
    font-family:Tahoma, Geneva, sans-serif;
}
</style>

</head>
<body class="login-page">
	
	
	
<!-- Here is the DIV where we are loading page-loader.html, using javascript -->
	<div id="page-loader">  </div>
<!--=========================================================================--> 
	
	
<!-- Here is the DIV where we are loading navigation.html, using javascript -->
	<div id="navbar">  </div>
<!--========================================================================--> 
	
	
<!--====================================-->
<!--============== Login ===============--> 
<!--====================================-->
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="main-login">
  <div class="row">
  <div class="login-p-banner col-lg-5 col-md-5 col-sm-12 col-xs-12">
   <div class="row">
    <div class="darkBlueBg login-box regular-font text-center col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div>
       <!-- <figure><a href="index.html"><img src="images/logo-white-text-small.png" alt="Southern Mututal Church Insurance Logo" /></a></figure> -->
       <!-- <h3 style="margin-bottom: 20px;">log in to your account</h3>-->

         <%--<form class="form-horizontal" role="form">--%>
    <form id="form1" class="form-horizontal" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>



 <asp:Login ID="Login1" runat="server" loggingIn="Login1_LoggingIn">
     <LayoutTemplate>

    <div class="form-group">

<h3 style="margin-bottom: 20px;">log in to your account</h3>
    <div class="login-field pull-left white-border">		
     <i class="fa fa-hand-pointer pull-left"></i>	
     		
    <select name="type-of-login" id="type-of-login" class="form-control">
			<option selected="selected" value="0">I'm A Policyholder</option>
			<option value="1">I'm An Agent</option>
			<option value="2">I'm An Employee</option>
	</select>

<%--        <asp:DropDownList ID="ddlLoginType" CssClass="form-control" runat="server">
            <asp:ListItem Text="I'm A Policyholder" Value="0"></asp:ListItem>
            <asp:ListItem Text="I'm An Agent" Value="1"></asp:ListItem>
            <asp:ListItem Text="I'm An Employee" Value="2"></asp:ListItem>
        </asp:DropDownList>--%>
		</div>
		<!--form-group-->
     </div>	
        
  <div class="form-group">
    <div class="login-field pull-left white-border">
     <i class="fa fa-user pull-left"></i>
      <%--<input type="text" class="form-control pull-left" autocomplete="username" name="Username" id="UserName" placeholder="Username" required="required">--%>
        <asp:TextBox ID="UserName" CssClass="form-control pull-left" AutoCompleteType="None" runat="server" ValidateRequestMode="Enabled" MaxLength="10" />  
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkText="Username" TargetControlID="UserName"></asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="This is a required field" ForeColor="Black" Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
      <!--login-field-->
    </div>
    <!--form-group-->
  </div>


  <div class="form-group">
    <div class="login-field pull-left white-border">
     <i class="fa fa-key pull-left"></i>
      <%--<input type="password" class="form-control pull-left" autocomplete="password" name="pwd" id="Password" placeholder="Password"  required="required">--%>
        <asp:TextBox ID="Password" CssClass="form-control pull-left" AutoCompleteType="Disabled" runat="server" ValidateRequestMode="Enabled" MaxLength="20" TextMode="Password"  />
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" WatermarkText="Password" TargetControlID="Password" runat="server"></asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="This is a required field" ForeColor="Black" Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
      <!--login-field-->
    </div>
    <!--form-group-->
  </div>

				 
      <%--<button type="submit" class="login-btn">login</button>--%>
      <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" CommandName="Login" Text="login" ForeColor="White" />

      <%--<a href="register.aspx"><button type="button" class="signup-btn">register</button></a>--%>
         <asp:Button ID="btnRegister" runat="server" Text="register" class="signup-btn" PostBackUrl="~/register.aspx" CausesValidation="False" />
        <%--<asp:LinkButton ID="lnkBtnRegister" Text="register" class="signup-btn" runat="server" PostBackUrl="~/register.html" /> --%>


      <div class="remember">
      <div class="checkbox">
        <a href="forgot-your-password.aspx">Forgot password</a>
        <!--checkbox-->
      </div>
      <!--remember-->
      </div>
   </LayoutTemplate>
</asp:Login>







</form>
      </div>
      <!--darkBlueBg--> 
    </div>  
    <!--row--> 
  </div>    
    <!--login-banner-->
    </div>
    <div class="login-banner-img login-p-banner col-lg-7 col-md-7 col-sm-12 col-xs-12"> 
      <!--banner-img--> 
    </div>    
    <!--row--> 
  </div>
  <!--col-lg-12--> 
</div>
<!-- Here is the DIV where we are loading footer.html, using javascript -->
	<div id="footer">  </div>
<!--====================================================================--> 









<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.12.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap/bootstrap.js"></script> 
<!-- Custom --> 
<script src="js/custom.js"></script>
<script type="text/javascript">
    function pageLoad() {
    }
</script>


<%--    <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
</body>
</html>
