<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" StylesheetTheme="ProspectPages" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Register Your Account | Southern Mutual Church Insurance Company</title>
<link rel="icon" href="images/favicon.png" type="image/png">
<link rel="stylesheet" href="css/all-stylesheets.css" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" /> <%--integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">--%>
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
  <div class="register-banner col-lg-5 col-md-5 col-sm-12 col-xs-12">
   <div class="row">
    <div class="darkBlueBg login-box regular-font text-center col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div>
       <%-- <figure><a href="index.html"><img src="images/logo-white-text-small.png" alt="Southern Mututal Church Insurance Logo" /></a></figure>--%>
				
 <form id="form1" runat="server" class="form-horizontal">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>



	
 <asp:CreateUserWizard 
      ID="CreateUserWizard1"
      ContinueDestinationPageUrl="~/PolicyholderPortal/policyholder_tools.aspx"
      InvalidAnswerErrorMessage="Please enter a security answer."
      runat="server" ForeColor="#FF3300">
     <CreateUserButtonStyle CssClass="login-btn" ForeColor="White" />
     <StepPreviousButtonStyle CssClass="signup-btn" />    

<WizardSteps>
         <asp:WizardStep runat="server" StepType="Start" Title="StartStep1">
            <figure><a href="index.html"><img src="images/logo-white-text-small.png" alt="Southern Mututal Church Insurance Logo" /></a></figure>
            <h3 style="margin-bottom: 20px;color:White;">Register Your Account</h3>

         <div class="form-group">
        <asp:TextBox ID="txtCustomerNum" runat="server" MaxLength="10" CssClass="form-control white-border" AutoCompleteType="Disabled" Width="600" />
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" WatermarkText="Customer Number" TargetControlID="txtCustomerNum"></asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerNum" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
         	<!--form-group-->
         </div>

        <div class="form-group">
        <asp:DropDownList ID="ddlPolicyType" runat="server" CssClass="form-control white-border" AutoPostBack="True" Width="600">
            <asp:ListItem>SMP</asp:ListItem>
            <asp:ListItem>STD</asp:ListItem>
        </asp:DropDownList>
	    <!--form-group-->
        </div>
        <div class="form-group">
        <asp:TextBox ID="txtPolicyNum" runat="server" MaxLength="7" CssClass="form-control white-border" AutoCompleteType="Disabled" Width="600" />
        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" WatermarkText="Policy Number" TargetControlID="txtPolicyNum"></asp:TextBoxWatermarkExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPolicyNum" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
		<!--form-group-->      
	    </div>
    </asp:WizardStep>


    <asp:WizardStep runat="server" StepType="Step" Title="StepConfirm">
    <h3 style="margin-bottom: 20px;color:White;">Register Your Account</h3>

       <div class="form-group">
        <asp:FormView 
                ID="FormView1" 
                runat="server" 
                EmptyDataText="">
            <ItemTemplate>

        <div class="form-group">
           <table align="center">
             <tr style="padding:3px; text-align:left;">
               <td><label style="color:White; font-size:14px; width:90px;">The Insured:</label>
               <asp:TextBox ID="txtChurch" runat="server" Text='<%# Eval("ADD0LINE01")%>' ReadOnly="True" class="form-control white-border" Width="300" BackColor="#212934" color="gray" /></td>
             </tr>
             <tr style="padding:3px; text-align:left;">
               <td><label style="color:White; font-size:14px; width:90px;">Address:</label>
               <asp:TextBox ID="txtAddress1" runat="server" Text='<%# Eval("ADD0LINE03")%>' ReadOnly="True" class="form-control white-border" Width="300" BackColor="#212934" color="gray" /></td>
             </tr>
             <tr style="padding:3px; text-align:left;">
               <td><label style="color:White; font-size:14px; width:90px;">City:</label>
               <asp:TextBox ID="txtCity1" runat="server" Text='<%# Eval("ADD0LINE04")%>' ReadOnly="True" class="form-control white-border" Width="300" BackColor="#212934" color="gray" /></td>
             </tr>
             <tr style="padding:3px; text-align:left;">
               <td><label style="color:White; font-size:14px; width:90px;">Zip:</label>
               <asp:TextBox ID="txtZip1" runat="server" Text='<%# Eval("ZIP0POST")%>' ReadOnly="True" class="form-control white-border" Width="300" BackColor="#212934" color="gray" /></td>
             </tr>
           </table>
        <div></div>
            </ItemTemplate>
        </asp:FormView>
        <hr>
        </div>

        <div class="form-group">
                <asp:TextBox ID="txtFirstName" runat="server" AutoCompleteType="Disabled" CssClass="form-control white-border" MaxLength="20" Width="600" />
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" WatermarkText="First Name" TargetControlID="txtFirstName"></asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator3" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
        <!--form-group-->
        </div>
        <div class="form-group">
                <asp:TextBox ID="txtLastName" runat="server" AutoCompleteType="Disabled" CssClass="form-control white-border" MaxLength="20" Width="600" />
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server" WatermarkText="Last Name" TargetControlID="txtLastName"></asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLastName" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidator4" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
        <!--form-group-->
        </div>
        <div class="form-group">
                <asp:TextBox ID="txtPhone" runat="server" MaxLength="12" AutoCompleteType="Disabled" CssClass="form-control white-border" Width="600" />
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" WatermarkText="Contact Number" TargetControlID="txtPhone"></asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RequiredFieldValidator5" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
<%--            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Text="*" ErrorMessage="Check format XXX-XXX-XXXX." />
                <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Number" Mask="999-999-9999" AutoCompleteValue="999-999-9999" ClearMaskOnLostFocus="False" TargetControlID="txtPhone" PromptCharacter=" "></asp:MaskedEditExtender>
                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="RegularExpressionValidator1" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>--%>
        <!--form-group-->
        </div>  
    </asp:WizardStep>


    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
        <ContentTemplate>
        <div class="form-group">
            <label style="color:White;">
                User Name:
                <br />
                <asp:TextBox ID="UserName" runat="server" BackColor="Silver" ReadOnly="True" CssClass="form-control white-border" Width="100%" />
            </label>
            <!--form-group-->
            </div>
        <hr>
        <div class="form-group">
            <asp:TextBox ID="Password" runat="server" MaxLength="10" CssClass="form-control white-border" Width="100%" />
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" WatermarkText="Enter Your Password" TargetControlID="Password"></asp:TextBoxWatermarkExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Password" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RequiredFieldValidator5" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender> 	
        <!--form-group-->
       </div>

        <div class="form-group">
            <asp:TextBox ID="ConfirmPassword" runat="server" MaxLength="10" CssClass="form-control white-border" Width="100%" />
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" WatermarkText="Re-enter Your Password" TargetControlID="ConfirmPassword"></asp:TextBoxWatermarkExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidator6" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender> 	  
            <!--form-group-->
        </div>

        <div class="form-group">
            <asp:TextBox ID="Email" CausesValidation="true" runat="server" AutoCompleteType="Disabled" CssClass="form-control white-border" MaxLength="50" Width="100%" />
            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender7" runat="server" WatermarkText="Enter Your Email Address" TargetControlID="Email"></asp:TextBoxWatermarkExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Email" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RequiredFieldValidator7" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender> 
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email" ErrorMessage="Check your email address" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" Display="None"></asp:RegularExpressionValidator>
            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="RegularExpressionValidator2" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>
        <!--form-group-->
        </div>

        <div class="form-group">
            <asp:DropDownList ID="Question" runat="server" class="form-control  white-border" Width="100%">
                <asp:ListItem Text="-- Select A Security Question --" Value="What is your favorite color?" />
                <asp:ListItem Text="What is your favorite color? " Value="What is your favorite color?" />
                <%--<asp:ListItem Text="What is your pet's name?" Value="What is your pet's name?" />--%>
            </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Question" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
         <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RequiredFieldValidator8" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>  
        <!--form-group-->
        </div>

        <div class="form-group">
         <asp:TextBox ID="Answer" runat="server" AutoCompleteType="Disabled" CssClass="form-control  white-border" MaxLength="20" Width="100%" />
         <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender8" runat="server" WatermarkText="Enter Your Answer" TargetControlID="Answer"></asp:TextBoxWatermarkExtender>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Answer" ErrorMessage="This is a required field" Display="None"></asp:RequiredFieldValidator>
         <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="RequiredFieldValidator9" CssClass="customCalloutStyle"></asp:ValidatorCalloutExtender>  
        <!--form-group-->
        </div>  
        <div class="form-group">
            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
         <!--form-group-->
        </div> 
        </ContentTemplate>
    </asp:CreateUserWizardStep>


    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
     <ContentTemplate>
        <div style="color:White;">
            <!-- <figure><a href="index.html"><img src="images/logo-white-text-small.png" alt="Southern Mututal Church Insurance Logo" /></a></figure> -->
            <h1 style="margin-bottom: 20px;">Congratulations!</h1>
            <h3>Your account was successfully created. You now have access to the following features: </h3>
            <ul>
                <li>• Contact & Billing Information</li>
                <li>• View & Download Your Policy</li>
                <li>• View Your Claim Status</li>
            </ul>
           <%--<asp:Button ID="ContinueButton" runat="server" class="login-btn" style="color: #fff;" CausesValidation="False" CommandName="Continue" Text="Sign In" ValidationGroup="CreateUserWizard1" />--%>
           <br /><br />
           <asp:HyperLink ID="hlnk" Text="Back to login page" NavigateUrl="login.aspx" runat="server" ForeColor="White" />
        </div>          
      </ContentTemplate>
    </asp:CompleteWizardStep>

</WizardSteps>

     <StartNavigationTemplate>
     <table align="center">
        <tr>
            <td style="padding-right:3px;"><asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" CssClass="login-btn" ForeColor="White" Text="Next" /></td>
            <td><asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="signup-btn" Text="Cancel" PostBackUrl="~/login.aspx" /></td>
        </tr>
    </table>
     </StartNavigationTemplate>

     <StepNavigationTemplate>
     <table align="center">
       <tr>
         <td><asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" CssClass="signup-btn" Text="Previous" Visible="False" /></td>
         <td style="padding-right:3px;"><asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" CssClass="login-btn" ForeColor="White" Text="Next" /></td>
         <td><asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="signup-btn" Text="Cancel" PostBackUrl="~/index.html" /></td>
       </tr>    
     </table>
     </StepNavigationTemplate>

     <FinishNavigationTemplate>
         <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" CssClass="signup-btn" Text="Previous" />
         <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
             Text="Finish" CssClass="login-btn" ForeColor="White" 
             PostBackUrl="~/login.aspx" />
     </FinishNavigationTemplate>

 </asp:CreateUserWizard>






<%-- <button type="submit" class="login-btn">next</button>
	 <button type="button" class="signup-btn">cancel</button>--%>

    </form>
   </div>
 <!--darkBlueBg--> 

    </div>  
    <!--row--> 
  </div>    
    <!--login-banner-->
    </div>
    <div class="login-banner-img register-banner col-lg-7 col-md-7 col-sm-12 col-xs-12"> 
      <!--banner-img--> 
    </div>    
    <!--row--> 
  </div>
  <!--col-lg-12--> 
</div>

<asp:ObjectDataSource 
     ID="ObjectDataSource1" 
     runat="server" 
     SelectMethod="ReadPolicyStep1"
     TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:SessionParameter Name="custnum" SessionField="custnum" Type="String" />
        <asp:SessionParameter Name="symb0l" SessionField="symb0l" Type="String" />
        <asp:SessionParameter Name="policynum" SessionField="policynum" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource 
     ID="odsStatusCheck" 
     runat="server" 
     SelectMethod="ReadPolicyStep1"
     TypeName="smci.DataAccessLayer.MySqlIdb2Code">
    <SelectParameters>
        <asp:SessionParameter Name="custnum" SessionField="custnum" Type="String" />
        <asp:SessionParameter Name="symb0l" SessionField="symb0l" Type="String" />
        <asp:SessionParameter Name="policynum" SessionField="policynum" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource 
     ID="odsUserProfiles" 
     runat="server" 
     InsertMethod="CreateUserProfile"
     TypeName="smci.SqlAccessLayer.MySqlCode" 
     SelectMethod="GetWorkersCompForms">
    <InsertParameters>
        <asp:SessionParameter Name="userName" SessionField="custnum" Type="String" />
        <asp:SessionParameter Name="firstName" SessionField="fname" Type="String" />
        <asp:SessionParameter Name="lastName" SessionField="lname" Type="String" />
        <asp:SessionParameter Name="theInsured" SessionField="church" Type="String" />
        <asp:SessionParameter Name="address" SessionField="address" Type="String" />
        <asp:SessionParameter Name="city" SessionField="city" Type="String" />
        <asp:SessionParameter Name="zip" SessionField="zip" Type="String" />
        <asp:SessionParameter Name="phone" SessionField="phone" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>





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

