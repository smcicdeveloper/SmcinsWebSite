<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_employee_portal.master" AutoEventWireup="false" CodeFile="change_password.aspx.vb" Inherits="EmployeePortal_change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<style type="text/css">
    
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


</style>

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
            <MailDefinition BodyFileName="~/PolicyholderPortal/ChangePassword.txt" From="cvarnadoe@smcins.com" Subject="Your New Password">
            </MailDefinition>
        
        <SuccessTemplate>
        <br />
        <br />
        <div class="password-change">
            <p>Your password has been changed!</p>
            <p>You must first logout before the new password will take effect.</p>
            <p>Click the logout link above to return back to the&nbsp;Home page.</p>
        </div>
        </SuccessTemplate> 

        </asp:ChangePassword>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

