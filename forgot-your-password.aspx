<%@ Page Language="VB" AutoEventWireup="false" CodeFile="forgot-your-password.aspx.vb" Inherits="forgot_your_password" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Policy Holder Log In Southern Mutual Church Insurance Company</title>
<link rel="icon" href="images/favicon.png" type="image/png">
<link rel="stylesheet" href="css/all-stylesheets.css" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" /> <!-- integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
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
<%--        <h3 style="margin-bottom: 20px;">forgot your password?</h3>
        <p>
            If you've forgotten your password, enter your Customer Number below and we'll send you an e-mail message to remind you. If you do not know your Customer Number please contact our support department at <a href="tel:8009225332" style="color: #fff; font-decoration: underline;">800-922-5332</a>.
        </p>
        <span id="ContentPlaceHolder1_PasswordRecovery2_UserNameContainerID_FailureText" style="color:Red;"></span>--%>


 <form id="form1" class="form-horizontal" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
 </asp:ScriptManager>

<asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
 <UserNameTemplate>
  <div class="form-group">
        <h3 style="margin-bottom: 20px;">forgot your password?</h3>
        <p>
            If you've forgotten your password, enter your username below and we'll send you an e-mail message to remind you. If you do not know your username please contact our support department at <a href="tel:8009225332" style="color: #fff; font-decoration: underline;">800-922-5332</a>.
        </p>
        <span id="ContentPlaceHolder1_PasswordRecovery2_UserNameContainerID_FailureText" style="color:Red;"></span>

    <div class="login-field pull-left white-border">
     <i class="fa fa-user pull-left"></i>
      <%--<input name="ctl00$ContentPlaceHolder1$PasswordRecovery2$UserNameContainerID$UserName" type="text" maxlength="10" id="ContentPlaceHolder1_PasswordRecovery2_UserNameContainerID_UserName" class="form-control pull-left" placeholder="Enter Your Customer Number" required="required" aria-required="true" " />--%>
        <asp:TextBox ID="UserName" Cssclass="form-control pull-left" runat="server" MaxLength="10" AutoCompleteType="Disabled" />
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkText="Enter Your Username" TargetControlID="UserName"></asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1" CssClass="customCalloutStyle" PopupPosition="Right"></asp:ValidatorCalloutExtender>
      <!--login-field-->
    </div>
    <!--form-group-->
  </div>			 
      <%--<input type="submit" name="ctl00$ContentPlaceHolder1$PasswordRecovery2$UserNameContainerID$btnSubmit" value="Next" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$PasswordRecovery2$UserNameContainerID$btnSubmit&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))" id="ContentPlaceHolder1_PasswordRecovery2_UserNameContainerID_btnSubmit" class="login-btn" style="color: #fff;" />--%>
     <asp:Button ID="btnNext" CommandName="Submit" runat="server" Text="Next" Cssclass="login-btn" style="color: #fff;" />
       <asp:Button ID="btnCancelRecovery" runat="server" Text="Cancel" Cssclass="signup-btn" style="color: #000;" onclick="btnCancelRecovery_Click" CausesValidation="False" PostBackUrl="~/login.aspx" />
  </UserNameTemplate>

<QuestionTemplate>
  <div class="form-group">
        <h3 style="margin-bottom: 20px;">forgot your password?</h3>
        <p>
            If you've forgotten your password, enter your username below and we'll send you an e-mail message to remind you. If you do not know your username please contact our support department at <a href="tel:8009225332" style="color: #fff; font-decoration: underline;">800-922-5332</a>.
        </p>
<%--        <asp:Label id="FailureText" EnableViewState="false" ForeColor="Red" Runat="server" />
        <br />
        <asp:Label ID="Question" Text="What is your favorite color?" AssociatedControlID="Answer" runat="server">
        </asp:Label>
        <br />--%>
    <div class="login-field pull-left white-border">
     <i class="fa fa-user pull-left"></i>
        <asp:TextBox id="Answer" Runat="server" Cssclass="form-control pull-left" MaxLength="15" />
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkText="What is your favorite color?" TargetControlID="Answer"></asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Answer" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2" CssClass="customCalloutStyle" PopupPosition="Right"></asp:ValidatorCalloutExtender>
    </div>
    <!--form-group-->
  </div>	
        <asp:Button  id="btnSubmit" Text="Next" CommandName="Submit" Runat="server" Cssclass="login-btn" style="color: #fff;" /> 
        <asp:Button ID="btnCancelRecovery" runat="server" Text="Cancel" Cssclass="signup-btn" style="color: #000;" onclick="btnCancelRecovery_Click" CausesValidation="False" />       
 
    
</QuestionTemplate>

 <SuccessTemplate>
        <h3>Success</h3>
        <p>
        An email has been sent to your registered
        email account that contains your username and password. </p>
        <br /><br />
        <asp:HyperLink ID="hlnk" Text="Back to login page" NavigateUrl="login.aspx" runat="server" ForeColor="White" />
        </SuccessTemplate>
</asp:PasswordRecovery>

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
</body>
</html>
</html>
