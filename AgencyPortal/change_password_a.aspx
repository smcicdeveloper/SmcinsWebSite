<%@ Page Language="VB" AutoEventWireup="false" CodeFile="change_password_a.aspx.vb" Inherits="AgencyPortal_change_password_a" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        /*Normalization*/
         h1, h2, h3, h4, p, ul, ol, body, html {
	        margin: 0px;
	        padding: 0px;
        }
        a img { 
	        border: none;
	    }
	    ol, ul {
	        list-style:none;
	    }
	    table {
	        border-collapse:collapse;
	        border-spacing:o;
	    }
	    body {
            background:#E6E6E6 url('../CSS/Images/background-bar.png') repeat-x center top;
	    }
	    #wrapper {
           width:934px;
           height:570px;
           margin-right:auto;
           margin-left:auto;
           margin-bottom:0px;
          /* border-right: 2px solid #000000;
           border-left: 2px solid #000000;
           background-color:#ffffff;*/
        }
        #logo {
            height:80px;
            background-color:#000000;
            position:relative;
            text-align:right;
        }
       #logo ul {
	        margin: 0px;
	        padding: 0px;
	        padding-top:38px;
	        list-style: none;
        }
        #logo li {
	        display: inline;
	        margin-right: 3px;
	        padding-bottom: .5em; /* to display bottom border on links in IE */
        }
       #logo img {
           border:0px;
       }
        #main {
            padding-left:10px;
            background-color:White;
            display:inline;
        }
        .login_style_box {
            width:880px;
            height:420px;
            float: left;
            margin-top:50px;
            margin-left:20px;
            margin-right: 20px;
            border: 1px dotted black;
            padding-left: 5px;
            background-color:#ffffff;
            font: 90% tahoma, Arial, Helvetica, sans-serif;
        }
        .login_style_box li {
            display: inline;          
        }
        #password-recovery {
            width:480px;
            border:0px solid black;
            float:left;
            padding:5px;
        }
        #password-recovery label {
            font-weight:bold;
        }
        #existing-users {
            width:225px;
            border:0px solid black;
            float:left;
            padding:25px;
        }   
        #existing-users h3 {
            padding:5px 0 9px 0;
            color:#244999;
        }
        #existing-users label {
            font-weight:bold;
            font-size:14px;
            color:Gray;
        }
        #new-user {
            border-style: none none none dashed;
            border-width: 1px;
            border-color: black;
            margin-left:14px;
            width: 220px;
            height: 233px;
            float: left;
            padding: 4px 0 0 18px;    
        }
        #new-user h3 {
            margin-bottom:7px;
        }
        #new-user ul li {
             margin-left:12px;
             font-size:14px;
             list-style-type:disc;
             display:list-item;
        }
        .loginError {
            position:relative;
            color:Red;
        }
        .users-textbox {
            width:200px;
            height:25px;
            padding:3px;
            font-size:16px;
        }
        .password-change h3 {
            padding:5px 0 5px 0;
            margin-left:10px;
        }
        .password-change p {
            padding-bottom:3px;
            margin-left:10px;
        }
        .password-change ul li {
            margin-left:25px;
            font-size:14px;
            list-style-type:disc;
            display:list-item;
        }
        #footer {
            clear: both;
            background-color: #8DC0E0;
            padding: 10px;
            text-align: center;
            border-bottom:.07em solid #dfdfdf;
        }
        /*****Site Map***************************************/
        #site_map {
           width:auto;
           height:130px;
           margin-right:auto;
           margin-left:auto;
           margin-bottom:0px;
           background:#5e5b5b url('../CSS/Images/background-bottom-bar.png') repeat-x center bottom;
           font:70% tahoma, Arial, Helvetica, sans-serif;
        }
        #center_site_map h3 {
            color:#ffffff;
            font-size:13px;
            padding-bottom:3px;
        }
         #center_site_map ul {
            float:left;
            margin-right:30px;
            margin-left:30px;
            padding:5px;
         }
          #center_site_map ul li {
            list-style-type: none;  
            padding-top:3px;
         }
          #center_site_map a {
             font:70% tahoma, Arial, Helvetica, sans-serif;
             color:#ffffff;
         }
          #center_site_map a:hover {
            text-decoration:underline;
         }
        /* #center_site_map {
             width:934px;           
             margin-right:auto;
             margin-left:auto;
         }*/
         #center_site_map {
             width:934px;           
             margin-right:auto;
             margin-left:auto;
            text-align: center;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
    <div id="logo">
 
     <ul>
       <li><asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" 
               LogoutPageUrl="~/login/login_a.aspx" 
               LogoutImageUrl="~/CSS/Images/logout-link.png" /></li>
     </ul>
    </div>
    <div class="login_style_box">
        <asp:ChangePassword 
             ID="ChangePassword2" 
             DisplayUserName="True"
             runat="server" 
             ChangePasswordFailureText="Password incorrect or New Password invalid. " >
            <ChangePasswordTemplate>
            <asp:Label
                id="FailureText"
                EnableViewState="False"
                ForeColor="Red"
                CssClass="changeLabel"
                Runat="server" />
         <br />
           <div class="password-change">
            <h3>Changing Your Password?</h3>
               <p>New passwords must have:</p>
               <br />
                 <ul>
                  <li>Minimum Length of 7.</li>
                  <li>Maximum Length of 15.</li>
                  <li>At Least one special character (!, *, @, #, etc.)</li>
                 </ul>
               </div>

            <div id="existing-users">
            <label>User Name:</label>
            <br />
            <asp:TextBox
                id="UserName"
                Runat="server" 
                CssClass="users-textbox" 
                MaxLength="10" 
                AutoCompleteType="Disabled" 
                ReadOnly="True" TabIndex="-1" />
            <br /><br />
            <label>Current Password:</label>
            <br />
            <asp:TextBox
                id="CurrentPassword"
                TextMode="Password"
                Runat="server" 
                CssClass="users-textbox" 
                MaxLength="25" />

            <br /><br />
            <label>New Password:</label>
            <br />
            <asp:TextBox
                id="NewPassword"
                TextMode="Password"
                Runat="server" 
                CssClass="users-textbox" 
                MaxLength="15" />
            <br /><br />
            <asp:Button
                id="btnChangePassword"
                Text="Change Password"
                CommandName="ChangePassword"
                Runat="server" />   
             <asp:Button 
                 ID="btnCancel" 
                 runat="server" 
                 Text="Cancel" 
                 onclick="btnCancel_Click" />
            </div>
          </ChangePasswordTemplate>
            <MailDefinition BodyFileName="~/PolicyholderPortal/ChangePassword.txt" From="cvarnadoe@smcins.com" 
                Subject="Your New Password">
            </MailDefinition>
        
        <SuccessTemplate>
        <br />
        <br />
        <div class="password-change">
            <p>Your password has been changed!</p>
            <p>You must first logout before the new password will take effect.</p>
            <p>Click the logout link above to return back to the agency portal login.</p>
        </div>
        </SuccessTemplate> 

        </asp:ChangePassword>
    </div>
    </div>
     <div id="site_map">
        <div id="center_site_map">
           <br /><br />
            <h3>Copyright&#169; 2012 Southern Mutual Church Insurance</h3>
            <h3>P.O. Box 9346 - 201 Greenlawn Drive - Columbia, SC 29290</h3>
            <h3>Office (803)776-9365 - Toll Free (800)922-5332</h3>
   
        </div>
     </div>
    </form>
</body>
</html>
