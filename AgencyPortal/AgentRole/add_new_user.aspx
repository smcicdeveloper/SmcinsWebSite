<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_agent.master" AutoEventWireup="false" CodeFile="add_new_user.aspx.vb" Inherits="AgencyPortal_add_new_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <div id="new_user_box">
<%--          <asp:FormView 
            ID="FormView1" 
            runat="server" 
            CssClass="formView"
            DataSourceID="OdsAllPortal">
          <ItemTemplate>
            <ul>
               <li class="top_bar_welcome"><asp:Label ID="Label1" runat="server" Text="Welcome," CssClass="top_bar_label" />&nbsp;<asp:Label ID="FullnameLabel" runat="server" Text='<%# Bind("Fullname") %>' CssClass="top_bar_label" /></li>
               <li>-</li>
                <li class="top_bar_agent_number"><asp:Label ID="Label2" runat="server" Text="Agent Number:" CssClass="top_bar_label" />&nbsp;<asp:Label ID="lblAgentNum" runat="server" /></li>
            </ul>
         </ItemTemplate>
    </asp:FormView>--%>

    <h1>Create User Wizard</h1>
        <div id="go_left">
          <asp:CreateUserWizard 
               ID="CreateUserWizard1" 
               runat="server" 
               CssClass="fontStyle" 
               Font-Bold="True" 
               Font-Size="Medium" 
               ContinueDestinationPageUrl="~/AgencyPortal/AgentRole/add_new_user.aspx">
                    <WizardSteps>
                        <asp:WizardStep ID="WizardStep1" runat="server" StepType="Start" Title="SelectAgency">
                        <h5>My Agency List</h5>
                        <br />
                            <asp:RadioButtonList 
                                 ID="rblAgencyList" 
                                 runat="server" 
                                 DataSourceID="odsHierarchy" 
                                 DataTextField="Fullname" 
                                 DataValueField="Agentnumber" 
                                 RepeatColumns="1" 
                                 CellPadding="4" 
                                 CellSpacing="2" 
                                 CssClass="tools_gridview" 
                                 CausesValidation="True">
                            </asp:RadioButtonList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="rblAgencyList" runat="server" ErrorMessage="Select Agency" Text="*" ForeColor="White" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                            <br />
                                <p>Please select one agency to begin the process.</p>
                        </asp:WizardStep>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <CustomNavigationTemplate>
                               <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" CssClass="btnStep" Text="Create User" ValidationGroup="CreateUserWizard1" />
                            </CustomNavigationTemplate>
                            <ContentTemplate>
                                <table border="0" style="font-weight: bold; font: 70% tahoma, Arial, Helvetica, sans-serif;">
                                    <tr>
                                        <td align="center" class="createUser_title" colspan="2">
                                            <h4>Sign Up for Your New Account</h4></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="AgentNumberLabel" runat="server" Text="Agency"></asp:Label>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="Agency" runat="server" ReadOnly="True" CssClass="wizzard_textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="Agency" runat="server" ErrorMessage="Master Agent number is required." ToolTip="Master Agent number is required." ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                       </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="Small" MaxLength="10" 
                                                CssClass="wizzard_textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" Font-Size="Small" TextMode="Password" 
                                                MaxLength="12" CssClass="wizzard_textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" Font-Size="Small" 
                                                TextMode="Password" MaxLength="12" CssClass="wizzard_textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                                ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server" Font-Size="Small" MaxLength="45" 
                                                CssClass="wizzard_textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label></td>
                                        <td>
                                            <%--<asp:TextBox ID="Question" runat="server"></asp:TextBox>--%>
                                            <asp:DropDownList ID="Question" runat="server" CssClass="wizzard_textbox">
                                                <asp:ListItem Text="What is your favorite color?" Value="What is your favorite color?" />
                                                <asp:ListItem Text="What is the name of your pet?" Value="What is the name of your pet?" />
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                ErrorMessage="Security question is required." ToolTip="Security question is required."
                                                ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: normal">
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server" Font-Size="Small" MaxLength="12" 
                                                CssClass="wizzard_textbox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                                                ValidationGroup="CreateUserWizard1" Text="*" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: red">
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:WizardStep 
                             ID="WizardStep2" 
                             runat="server" 
                             Title="Choose your role" 
                             StepType="Step" 
                             OnActivate="ActivateStep"
                             OnDeactivate="DeactivateStep">
                            <h5>Select a role:</h5>
                            <br />
                            <br />
                            <asp:ListBox ID="lstRole" runat="server" Width="275px" 
                                CssClass="role_listbox">
                                <asp:ListItem>Associate</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:ListBox>
                            <br />
                            <br />
                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep3" runat="server" StepType="Finish" Title="CreateProfile">
                        <table border="0" style="font-weight: bold; font: 70% tahoma, Arial, Helvetica, sans-serif;">
                        <tr>
                          <td align="center" class="createUser_title" colspan="2">
                             <h4>Create Profile for User</h4></td>
                        </tr>
                        <tr>
                          <td align="right" style="font-weight: normal">
                          <asp:Label ID="Label1" runat="server" Text="Agent ID:"></asp:Label>
                          </td>
                        <td>
                           <asp:TextBox ID="txtSubAgentNum" runat="server" ReadOnly="True" 
                                CssClass="wizzard_textbox"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSubAgentNum" runat="server" ErrorMessage="Required Agent Id" Text="*" ForeColor="Red" />
                        </td>
                        </tr>
                        <tr>
                          <td align="right" style="font-weight: normal">
                             <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                          </td>
                          <td>
                             <asp:TextBox ID="txtFname" runat="server" MaxLength="25" CssClass="wizzard_textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFname"  runat="server" ErrorMessage="Required First Name" Text="*" ForeColor="Red" />
                          </td>
                        </tr>
                        <tr>
                          <td align="right" style="font-weight: normal">
                            <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                            </td>
                          <td>
                             <asp:TextBox ID="txtLname" runat="server" MaxLength="25" CssClass="wizzard_textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLname"  runat="server" ErrorMessage="Required Last Name" Text="*" ForeColor="Red" />
                          </td>
                        </tr>
                         <tr>
                          <td align="right" style="font-weight: normal">
                            <asp:Label ID="Label4" runat="server" Text="Phone:"></asp:Label>
                          </td>
                          <td>
                             <asp:TextBox ID="txtPhone" runat="server" MaxLength="12" CssClass="wizzard_textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtPhone"  runat="server" ErrorMessage="Required Contact Number" Text="*" ForeColor="Red" />
                          </td>
                        </tr>
                        <tr>
                          <td align="right" style="font-weight: normal">
                             <asp:Label ID="Label5" runat="server" Text="Position:"></asp:Label>
                          </td>
                          <td>
                            <asp:TextBox ID="txtPosition" runat="server" MaxLength="20" CssClass="wizzard_textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtPosition"  runat="server" ErrorMessage="Required Position or Title" Text="*" ForeColor="Red" />
                          </td>
                        </tr>
                         <tr>
                          <td align="right" style="font-weight: normal">
                            <asp:Label ID="Label6" runat="server" Text="City:"></asp:Label>
                           </td>
                          <td>
                             <asp:TextBox ID="txtCity" runat="server" MaxLength="25" CssClass="wizzard_textbox"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtCity"  runat="server" ErrorMessage="Required City" Text="*" ForeColor="Red" />
                          </td>
                        </tr>
                         <tr>
                          <td align="right" style="font-weight: normal">
                            <asp:Label ID="Label7" runat="server" Text="State:"></asp:Label>
                          </td>
                          <td>
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="wizzard_textbox" 
                                  Width="115px">
                                  <asp:ListItem>GA</asp:ListItem>
                                  <asp:ListItem>KY</asp:ListItem>
                                  <asp:ListItem>NC</asp:ListItem>
                                  <asp:ListItem>SC</asp:ListItem>
                                  <asp:ListItem>TN</asp:ListItem>
                                  <asp:ListItem>VA</asp:ListItem>
                              </asp:DropDownList>
                          </td>
                        </tr>
                        </table>
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </asp:WizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            <ContentTemplate>
                                <table border="0" style="font-weight: bold; font-size: 100%">
                                    <tr>
                                        <td align="center" class="createUser_title">
                                            <p>Complete</p>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                           <p>Your account has been successfully created.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                PostBackUrl="#" Text="Continue" ValidationGroup="CreateUserWizard1" 
                                                CssClass="btnStep" onclick="ContinueButton_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                    <TitleTextStyle CssClass="createUser_title" />
                    <InstructionTextStyle CssClass="createUser_instructions" />
                    <StepNavigationTemplate>
                        <br />
                        <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                            Text="Previous" CssClass="btnStep" Visible="False" />
                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                            Text="Next Step" onclick="StepNextButton_Click" CssClass="btnStep" />
                    </StepNavigationTemplate>
                    <FinishNavigationTemplate>
                        <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                            CommandName="MovePrevious" Text="Previous" CssClass="btnStep" 
                            Visible="False" />
                        <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                            onclick="FinishButton_Click" Text="Finish" CssClass="btnStep" />
                    </FinishNavigationTemplate>
                    <StartNavigationTemplate>
                        <br />
                        <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                            Text="Next Step" onclick="StartNextButton_Click" CssClass="btnStep" />
                    </StartNavigationTemplate>
                    <TextBoxStyle Font-Size="Small" />
                    <LabelStyle Font-Bold="False" />
                </asp:CreateUserWizard>
                </div>

                <div id="go_right">
                   <asp:GridView 
                        ID="GridView1" 
                        runat="server" 
                        DataSourceID="odsGetUsers"
                        CssClass="tools_gridview"
                        AllowPaging="True" 
                        Width="300px" 
                        BorderWidth="0px" 
                        AutoGenerateColumns="False" 
                        EmptyDataText="No users at this time."
                        HorizontalAlign="Left" 
                        DataKeyNames="Id" PageSize="12">
                    <Columns>
                        <asp:TemplateField HeaderText="Action" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkAction" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?')" ></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtId" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Agentcode" HeaderText="Agent ID" 
                            SortExpression="Agentcode">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fullname" HeaderText="Full Name" 
                            SortExpression="Fullname" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" 
                            Visible="False" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                            SortExpression="Firstname" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="Lastname" HeaderText="Lastname" 
                            SortExpression="Lastname" Visible="False" />
                        <asp:BoundField DataField="Position" HeaderText="Position" 
                            SortExpression="Position" Visible="False" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" 
                            Visible="False" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" 
                            Visible="False" />
                        <asp:BoundField DataField="Role" HeaderText="Role" > <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Createdfrom" HeaderText="Status" Visible="False" />
                    </Columns>
                    <HeaderStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle HorizontalAlign="Left" Font-Size="Small" />
                    <RowStyle Height="19px" />
                    <AlternatingRowStyle CssClass="alternating " />
                </asp:GridView>
               </div>
           </div>

<asp:objectdatasource 
     ID="odsUserProfiles"
     runat="server" 
     InsertMethod="CreateAgentProfile" 
     SelectMethod="GetAgentProfile" 
     TypeName="smci.SqlAccessLayer.MySqlCode">
    <InsertParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
        <asp:SessionParameter Name="subAgentCode" SessionField="anum" Type="String" />
        <asp:SessionParameter Name="userName" SessionField="uname" Type="String" />
        <asp:SessionParameter Name="firstName" SessionField="fname" Type="String" />
        <asp:SessionParameter Name="lastName" SessionField="lname" Type="String" />
        <asp:SessionParameter Name="phone" SessionField="phone" Type="String" />
        <asp:SessionParameter Name="position" SessionField="position" Type="String" />
        <asp:SessionParameter Name="city" SessionField="city" Type="String" />
        <asp:SessionParameter Name="state" SessionField="state" Type="String" />
        <asp:SessionParameter Name="role" SessionField="role" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
    </SelectParameters>
</asp:objectdatasource>

<asp:ObjectDataSource 
     ID="odsGetUsers" 
     runat="server"
     SelectMethod="GetSubAgentProfile" 
     TypeName="smci.SqlAccessLayer.MySqlCode" 
     DeleteMethod="DeleteAgentProfile">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32"/>
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="odsHierarchy" 
         SelectMethod="GetSubAgencies" 
         TypeName="smci.SqlAccessLayer.MySqlCode" 
         runat="server">
         <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
        </SelectParameters>
   </asp:ObjectDataSource>

<asp:ObjectDataSource 
     ID="srcUsers" 
     TypeName="System.Web.Security.Membership"
     SelectMethod="GetAllUsers"
     DeleteMethod="DeleteUser"
     runat="server">
    <DeleteParameters>
        <asp:Parameter Name="username" Type="String" />
    </DeleteParameters>
</asp:ObjectDataSource>
        <%--<asp:TextBox ID="Question" runat="server"></asp:TextBox>--%>  

         <asp:ObjectDataSource 
                ID="OdsAllPortal" 
                runat="server" 
                SelectMethod="GetUserName" 
                TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
              <asp:SessionParameter 
                Name="ProfileNameIs" 
                SessionField="ProfileNameIs" 
                Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wizzard_footer">
        <p>For instruction on how to create a new user account click the link below.</p>
        <asp:HyperLink ID="hlnkInstruction" runat="server" NavigateUrl="~/AgencyPortal/pdf/Agency Instructions.pdf" CssClass="wizzard_footer_hyperlink" target="_blank">Instructions</asp:HyperLink>
    </div> 

</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

