<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Step1_Register.ascx.vb" Inherits="WizardSteps_Step1_Register" %>

<div id="check-policy-box">
    <div id="policy-controls">
        <asp:CreateUserWizard 
             ID="CreateUserWizard1" 
             runat="server" 
             ContinueDestinationPageUrl="~/PolicyholderPortal/policyholder_tools.aspx"
             DisplayCancelButton="True" 
             ContinueButtonText="Sign In" 
             InvalidAnswerErrorMessage="Please enter a security answer.">
        <MailDefinition BodyFileName="~/login/register.txt" From="info@smcins.com" Subject="Registration Confirmation">
            </MailDefinition>
            <WizardSteps>
                <asp:WizardStep runat="server" AllowReturn="False" StepType="Start" Title="WizardStep1">
                    <table border="0">
                        <tr>
                            <td>
                                <label>
                                    Customer Number:
                                    <br />
                                    <asp:TextBox ID="txtCustomerNum" runat="server" MaxLength="10" CssClass="contentbox"
                                        AutoCompleteType="Disabled" />
                                </label>
                            </td>
                            <td>
                                <br />
                                <asp:RequiredFieldValidator 
                                     ID="RequiredFieldValidator1" 
                                     runat="server" 
                                     ForeColor="Red"
                                     ErrorMessage="Missing Customer Number."
                                     Text="*" 
                                     ControlToValidate="txtCustomerNum" />
                                <asp:RegularExpressionValidator 
                                     ID="RegularExpressionValidator2" 
                                     runat="server" 
                                     ForeColor="Red"
                                     ErrorMessage="Numeric Values Only for Customer Number."
                                     Text="*" 
                                     ValidationExpression="^\d+$" 
                                     ControlToValidate="txtCustomerNum" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Policy Type:
                                    <br />
                                    <asp:DropDownList ID="ddlPolicyType" runat="server" Height="28px" 
                                    Width="146px" CssClass="contentbox" AutoPostBack="True">
                                        <asp:ListItem>SMP</asp:ListItem>
                                        <asp:ListItem>STD</asp:ListItem>
                                    </asp:DropDownList>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Policy Number:
                                    <br />
                                    <asp:TextBox ID="txtPolicyNum" runat="server" MaxLength="7" CssClass="contentbox"
                                        AutoCompleteType="Disabled" />
                                </label>
                            </td>
                            <td>
                                <br />
                                <asp:RequiredFieldValidator 
                                     ID="RequiredFieldValidator2" 
                                     runat="server" 
                                     ForeColor="Red"
                                     ErrorMessage="Missing Policy Number."
                                     Text="*" 
                                     ControlToValidate="txtPolicyNum">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator 
                                     ID="RegularExpressionValidator1" 
                                     runat="server" 
                                     ForeColor="Red"
                                     ErrorMessage="Numeric Values Only for Policy Number."
                                     Text="*" 
                                     ValidationExpression="^\d+$" 
                                     ControlToValidate="txtPolicyNum" />
                                <asp:ValidationSummary 
                                       ID="ValidationSummary1" 
                                       runat="server" 
                                       ShowMessageBox="True"
                                       ShowSummary="False" />
                            </td>
                        </tr>
                    </table>
                    <%-- <br />--%>
                </asp:WizardStep>
                <asp:WizardStep 
                        runat="server" 
                        Title="WizardStep2" 
                        StepType="Step">
                    <asp:FormView 
                         ID="FormView1" 
                         runat="server" 
                         EmptyDataText="">
                        <ItemTemplate>
                            <table border="0">
                                <tr>
                                    <td>
                                        <label>
                                            The Insured:
                                            <asp:TextBox ID="txtChurch" runat="server" Text='<%# Eval("ADD0LINE01")%>' ReadOnly="True"
                                                Width="230px" BackColor="#CCCCCC" />
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Address:
                                            <asp:TextBox ID="txtAddress1" runat="server" Text='<%# Eval("ADD0LINE03")%>' ReadOnly="True"
                                                Width="230px" BackColor="#CCCCCC" />
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <label>
                                        City:
                                        <asp:TextBox ID="txtCity1" runat="server" Text='<%# Eval("ADD0LINE04")%>' ReadOnly="True"
                                            Width="230px" BackColor="#CCCCCC" />
                                    </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Zip:
                                            <br />
                                            <asp:TextBox ID="txtZip1" runat="server" Text='<%# Eval("ZIP0POST")%>' ReadOnly="True"
                                                BackColor="#CCCCCC" />
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <table border="0">
                        <tr>
                            <td>
                                <label>
                                    First Name:
                                    <br />
                                    <asp:TextBox ID="txtFirstName" runat="server" AutoCompleteType="Disabled" CssClass="contentbox"
                                        MaxLength="20" />
                                </label>
                            </td>
                            <td>
                                <br />
                                <asp:RequiredFieldValidator 
                                       ID="RequiredFieldValidator3" 
                                       ControlToValidate="txtFirstName"
                                       ForeColor="Red"
                                       runat="server" 
                                       Text="*" 
                                       ErrorMessage="First Name Missing Value." />
                               <asp:RegularExpressionValidator 
                                        ID="RegularExpressionValidator3" 
                                        ControlToValidate="txtFirstName"
                                        ForeColor="Red"
                                        runat="server" 
                                        Text="*"
                                        ValidationExpression="^[a-zA-Z]+$" 
                                        ErrorMessage="Letters only for first name." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Last Name:
                                    <br />
                                    <asp:TextBox ID="txtLastName" runat="server" AutoCompleteType="Disabled" CssClass="contentbox"
                                        MaxLength="20" />
                                </label>
                            </td>
                            <td>
                                <br />
                                <asp:RequiredFieldValidator 
                                       ID="RequiredFieldValidator4" 
                                       runat="server" 
                                       ControlToValidate="txtLastName"
                                       ForeColor="Red"
                                       Text="*" 
                                       ErrorMessage="Last Name Missing Value." />
                                <asp:RegularExpressionValidator 
                                        ID="RegularExpressionValidator4" 
                                        ControlToValidate="txtLastName"
                                        ForeColor="Red"
                                        runat="server" 
                                        Text="*"
                                        ValidationExpression="^[a-zA-Z]+$" 
                                        ErrorMessage="Letters only for last name." />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Contact Number:
                                    <br />
                                    <asp:TextBox ID="txtPhone" runat="server" MaxLength="12" AutoCompleteType="Disabled"
                                        CssClass="contentbox" />
                                </label>
                            </td>
                            <td>
                                <br />
                                <asp:RequiredFieldValidator 
                                     ID="rfvPhone" 
                                     runat="server" 
                                     ForeColor="Red"
                                     ControlToValidate="txtPhone"
                                     Text="*" 
                                     ErrorMessage="Phone Missing Value" />
                                <asp:RegularExpressionValidator 
                                     ID="revPhone" 
                                     runat="server" 
                                     ForeColor="Red"
                                     ErrorMessage="Phone Must Be XXX-XXX-XXXX Numerical Format"
                                     Text="*" 
                                     ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" 
                                     ControlToValidate="txtPhone" />
                                <asp:ValidationSummary 
                                     ID="ValidationSummary2" 
                                     runat="server" 
                                     ShowMessageBox="True"
                                     ShowSummary="False" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:CreateUserWizardStep runat="server">
                    <ContentTemplate>
                        <table border="0">
                            <tr>
                                <td>
                                    <label>
                                        User Name:
                                        <br />
                                        <asp:TextBox ID="UserName" runat="server" BackColor="Silver" ReadOnly="True" CssClass="contentbox" />
                                    </label>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Password:
                                        <br />
                                        <asp:TextBox ID="Password" TextMode="Password" runat="server" MaxLength="10" CssClass="contentbox" />
                                    </label>
                                </td>
                                <td>
                                <br />
                                <asp:RequiredFieldValidator 
                                     ID="PasswordRequired" 
                                     runat="server" 
                                     ControlToValidate="Password"
                                     ForeColor="Red"
                                     Text="*"
                                     ErrorMessage="Password is required." 
                                     ToolTip="Password is required." 
                                     ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Confirm Password:
                                        <br />
                                        <asp:TextBox 
                                             ID="ConfirmPassword" 
                                             TextMode="Password" 
                                             runat="server" 
                                             MaxLength="10"
                                             CssClass="contentbox" />
                                    </label>
                                </td>
                                <td>
                                <br />
                                  <asp:RequiredFieldValidator 
                                       ID="ConfirmPasswordRequired" 
                                       runat="server" 
                                       ControlToValidate="ConfirmPassword"
                                       ForeColor="Red"
                                       Text="*"
                                       ErrorMessage="Confirm Password is required." 
                                       ToolTip="Confirm Password is required."
                                       ValidationGroup="CreateUserWizard1" />
                                  <asp:CompareValidator 
                                       ID="PasswordCompare" 
                                       runat="server" 
                                       ForeColor="Red"
                                       ControlToCompare="Password"
                                       ControlToValidate="ConfirmPassword" 
                                       Display="Dynamic" 
                                       ErrorMessage="The Password and Confirmation Password must match."
                                       Text="*"
                                       ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        E-mail:
                                        <br />
                                        <asp:TextBox 
                                             ID="Email" CausesValidation="true" runat="server" AutoCompleteType="Disabled"
                                            CssClass="contentbox" MaxLength="50" />
                                    </label>
                                </td>
                                <td>
                                    <br />
                                     <asp:RequiredFieldValidator 
                                          ID="EmailRequired" 
                                          runat="server" 
                                          ForeColor="Red"
                                          ControlToValidate="Email"
                                          Text="*"
                                          ErrorMessage="E-mail is required." 
                                          ToolTip="E-mail is required." 
                                          ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Security Question:
                                        <br />
                                        <asp:DropDownList ID="Question" runat="server" Font-Size="13pt" ForeColor="Black"
                                            Height="25px">
                                            <asp:ListItem Text="What is your favorite color? " Value="What is your favorite color?" />
                                            <asp:ListItem Text="What is your pet's name?" Value="What is your pet's name?" />
                                        </asp:DropDownList>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Answer:
                                        <br />
                                        <asp:TextBox ID="Answer" runat="server" AutoCompleteType="Disabled" CssClass="contentbox"
                                            MaxLength="20" />
                                    </label>
                                </td>
                                <td>
                                <br />
                                   <asp:RequiredFieldValidator 
                                        ID="AnswerRequired" 
                                        runat="server" 
                                        ForeColor="Red"
                                        ControlToValidate="Answer"
                                        Text="*"
                                        ErrorMessage="Security answer is required." 
                                        ToolTip="Security answer is required."
                                        ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                            <tr>
                              <td style="color: red">
                              <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                               <asp:ValidationSummary 
                                   ID="ValidationSummary10" 
                                   runat="server" 
                                   ShowMessageBox="True"
                                   ShowSummary="False" 
                                   ValidationGroup="CreateUserWizard1"/>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <p>
                                        Congratulations! Your account was successfully created. You now have access to the
                                        following features:
                                    </p>
                                    <ol>
                                        <li>Contact and billing info</li>
                                        <li>View/Download Policy</li>
                                        <li>View Claim status</li>
                                    </ol>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                        Text="Sign In" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
    <div id="instruction-box">
        <asp:Panel ID="Panel1" runat="server">
            <h3>
                Instructions</h3>
            <p>
                In order to register on our web site. You must have an active customer number and
                an in-force SMP or STD policy.</p>
            <ol>
                <li>Type in your customer number</li>
                <li>Select policy type</li>
                <li>Enter a valid policy number</li>
                <li>Click next</li>
            </ol>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/CSS/Images/Customer-Bill-Invoice-small.png"
                BorderStyle="Solid" BorderWidth=".07em" BorderColor="silver" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <h3>
                Profile</h3>
            <p>
                In this step you will create your user profile.</p>
            <ol>
                <li>Please provide a contact name and phone number, then click &#39;Next&#39;.</li>
                <li>The maximum password length is 15 alpha-numeric characters, and must include at
                    least one special character.</li>
                <li>Select a security question to use if you need to reset your passord.</li>
                <li>Click the create user button to create your account.</li>
            </ol>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <p style="color: Red;">
                The policy you have entered is showing as cancelled in our system and is not valid
                for registering online. Please check the number you have entered and submit again.
                If you have the correct number and feel you have received this message in error,
                please contact us at 1-800-922-5332.</p>
            <br />
            <a href="../login/register.aspx">Click here to go back to registration</a>
        </asp:Panel>
    </div>
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
