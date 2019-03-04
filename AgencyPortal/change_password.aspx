<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_login.master" AutoEventWireup="false" CodeFile="change_password.aspx.vb" Inherits="PolicyholderPortal_change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 

<div id="inside_login_box">
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
<%--                <asp:ValidationSummary 
                     ID="vsChangePassword" 
                     runat="server" 
                     ShowMessageBox="True" 
                     ShowSummary="False" />--%>
<%--               <asp:RequiredFieldValidator 
                     ID="FailureText" 
                     runat="server" 
                     ErrorMessage="Password incorrect or New Password invalid. New Password length minimum: {0}. Non-alphanumeric characters required: {1}." 
                     Text="*" 
                     ControlToValidate="CurrentPassword" />--%>
         <br />
           <div id="password-change">
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
                 Text="Cancel" onclick="btnCancel_Click" />
            </div>
          </ChangePasswordTemplate>
            <MailDefinition BodyFileName="~/PolicyholderPortal/ChangePassword.txt" From="info@smcins.com" 
                Subject="Your New Password">
            </MailDefinition>
        
        <SuccessTemplate>
            Your password has been changed!
            <br /><br />
            <asp:HyperLink ID="hlnk" Text="Back to My Account" NavigateUrl="~/PolicyholderPortal/policyholder_tools.aspx" runat="server" />
        </SuccessTemplate> 

        </asp:ChangePassword>

</div>
</asp:Content>

