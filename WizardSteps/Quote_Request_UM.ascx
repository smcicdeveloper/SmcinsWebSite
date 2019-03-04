<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Quote_Request_UM.ascx.vb" Inherits="WizardSteps_Quote_Request_UM" %>

<style type="text/css">
    label, p, ul {
        margin:0px;
        padding:0px;
    }
   .MyStyle
    {
        width: 650px;
    }
    #table1 {
        float:left; 
        margin-right:80px;
    }
    #table2 {
        float:left;
    }
    .column_epl
    {
        width: 454px;
    }
    </style>


<div id="master_quote_box">
<asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" CssClass="wizard">
    <NavigationStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
    <SideBarStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />
    <StepNavigationTemplate>
        <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
            CommandName="MovePrevious" Text="Previous" Visible="False" />
        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
            Text="Next" onclick="StepNextButton_Click" />
    </StepNavigationTemplate>
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="General Information" StepType="Step">

 
 <h3>Quote Request Form</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>Agency</label>
                                </li>
                                <li>
                                    <asp:TextBox ID="txtAgency" runat="server" Width="348px" ReadOnly="false" Text='<%# Bind("Agency") %>' />
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Agency Number</label>
                                    <asp:TextBox ID="txtAgentNum" runat="server" ReadOnly="false" Text='<%# Bind("AgentNumber") %>'></asp:TextBox>
                                    <label>Agent</label>
                                    <asp:TextBox ID="txtAgentName" runat="server" ReadOnly="false" Text='<%# Bind("AgentName") %>' />
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("QuoteType") %>' />
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Agent Email 1</label></li>
                                <li>
                                    <asp:TextBox ID="txtAgentEmail" runat="server" Width="305px" MaxLength="75" Text='<%# Bind("AgentEmail1") %>' /></li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvAgentEmail" runat="server" ControlToValidate="txtAgentEmail"
                                        Text="*" ErrorMessage="Missing Email" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Agent Email 2</label></li>
                                <li><asp:TextBox ID="txtAgentEmail2" runat="server" Width="305px" MaxLength="75" Text='<%# Bind("AgentEmail2") %>' /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Church Name:</label>
                                </li>
                                <li>
                                    <asp:TextBox ID="txtChName" runat="server" Width="304px" MaxLength="180" Text='<%# Bind("ChurchName") %>' ></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvChurchName" runat="server" ControlToValidate="txtChName"
                                        Text="*" ErrorMessage="Missing Church Name" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Mailing Address</label>
                                </li>
                                <li>
                                    <asp:TextBox ID="txtMailAddr" runat="server" Width="200px" MaxLength="40" Text='<%# Bind("MailingAddress") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvMailAddr" runat="server" Text="*" ControlToValidate="txtMailAddr"
                                        ErrorMessage="Missing Mailing Address" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Mailing City</label>
                                    <asp:TextBox ID="txtMailCity" runat="server" MaxLength="25" Text='<%# Bind("MailingCity") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvMailCity" runat="server" ControlToValidate="txtMailCity"
                                        Text="*" ErrorMessage="Missing City" ForeColor="Red" /></li>
                                <li>
                                    <label>State</label>
                                    <asp:DropDownList ID="ddlState" runat="server" Width="60px" SelectedValue='<%# Bind("MailingState") %>'>
                                    <asp:ListItem>GA</asp:ListItem>
                                    <asp:ListItem>NC</asp:ListItem>
                                    <asp:ListItem>SC</asp:ListItem>
                                    <asp:ListItem>TN</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label>
                                        Zip Code</label>
                                    <asp:TextBox ID="txtMailZip" runat="server" MaxLength="5" Width="116px" Text='<%# Bind("MailingZip") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvMailZip" runat="server" ControlToValidate="txtMailZip"
                                        Text="*" ErrorMessage="Missing Zip" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Church Website</label>
                                </li>
                                <li>
                                    <asp:TextBox ID="txtWebAddr" runat="server" MaxLength="50" Width="194px" Text='<%# Bind("ChurchUrl") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Current Carrier:</label>
                                    <asp:TextBox ID="txtCarrier" runat="server" MaxLength="50" Width="180px" Text='<%# Bind("CurrentCarrier") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvCarrier" runat="server" ControlToValidate="txtCarrier"
                                        Text="*" ErrorMessage="Missing Current Carrier" ForeColor="Red" /></li>
                                <li>
                                    <asp:CheckBox ID="chbCarrier" runat="server" AutoPostBack="true" OnCheckedChanged="chbCarrier_CheckedChanged"
                                        Text="No Current Carrier" />
                                </li>
                                <li>
                                    <label>Ex. Date:</label>
                                    <asp:TextBox ID="txtExDate" runat="server" MaxLength="10" Text='<%# Bind("ExDate") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvExDate" runat="server" ControlToValidate="txtExDate"
                                        Text="*" ErrorMessage="Missing Ex. Date" ForeColor="Red" /></li>
                                <li>
                                    <asp:RegularExpressionValidator ID="revExDate" runat="server" ControlToValidate="txtExDate"
                                        Text="*" ErrorMessage="Date Format Should be MM/DD/YYYY" ValidationExpression="^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$"
                                        ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li></li>
                                <li>
                                    <label>
                                        Current SMP Premium</label>
                                    <asp:TextBox ID="txtPrem" runat="server" MaxLength="10" Text='<%# Bind("CurrentSmpPremium") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <p>
                                        Has any policy or coverage been declined, cancelled or non-renewed during the prior
                                        3 years?
                                    </p>
                                </li>
                                <li>
                                <asp:RadioButtonList ID="rbPrevPolicyList" runat="server" 
                                        RepeatDirection="Horizontal" Text='<%# Bind("Prior3Years") %>' 
                                        onselectedindexchanged="rbPrevPolicyList_SelectedIndexChanged">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem Selected="True">No</asp:ListItem>
                                </asp:RadioButtonList>
                              </li>
                            </ul>
                            <ul>
                                <li>
                                    <p>
                                        If yes, please provide a detailed explanation in the Property Comments on the next
                                        screen.</p>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <asp:TextBox ID="txtComments1" runat="server" Height="60px" TextMode="MultiLine"
                                        Width="450px" Text='<%# Bind("PriorExplanation") %>'></asp:TextBox></li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvPrePolicyComments" runat="server" ControlToValidate="txtComments1"
                                        Text="*" ErrorMessage="Missing Comments" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Contact Person</label>
                                    <asp:TextBox ID="txtChContact" runat="server" MaxLength="40" Width="180px" Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtChContact"
                                        Text="*" ErrorMessage="Missing Contact" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Phone 1</label>
                                    <asp:TextBox ID="txtPhone1" runat="server" MaxLength="12" Text='<%# Bind("Phone1") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvPhone1" runat="server" ControlToValidate="txtPhone1"
                                        Text="*" ErrorMessage="Missing Phone Number." ForeColor="Red" /></li>
                                <li>
                                    <asp:RegularExpressionValidator ID="revPhone1" runat="server" ControlToValidate="txtPhone1"
                                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Text="*" ErrorMessage="Phone should be in this format XXX-XXX-XXXX."
                                        ForeColor="Red" /></li>
                                <li>
                                    <label>
                                        Phone 2</label>
                                    <asp:TextBox ID="txtPhone2" runat="server" MaxLength="12" Text='<%# Bind("Phone2") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RegularExpressionValidator ID="revPhone2" runat="server" ControlToValidate="txtPhone2"
                                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Text="*" ErrorMessage="Phone should be in this format -XXX-XXX-XXXX."
                                        ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Mortgagee/Loss Payee</label>
                                    <asp:TextBox ID="txtMortgLP" runat="server" Width="275px" MaxLength="50" Text='<%# Bind("MortLossPayee") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Is this church incorporated?</label>
                                    <asp:RadioButtonList ID="rbIncList" runat="server" Text='<%# Bind("Incorporated") %>' 
                                        RepeatDirection="Horizontal">
                                     <asp:ListItem>Yes</asp:ListItem>
                                     <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                        </div>
                     <%--   <asp:LinkButton ID="lnkInsert" Text="Insert" CommandName="Insert" runat="server" />--%>

                <asp:ObjectDataSource 
                     ID="odsGeneralInfo"
                     TypeName="smci.SqlAccessLayer.MySqlCode"  
                     runat="server" 
                     SelectMethod="GetGeneralInfo"
                     InsertMethod="InsertGeneralInfo"> 
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtAgency" Name="Agency" PropertyName="Text" 
                            Type="String" />
                        <asp:SessionParameter Name="AgentNumber" SessionField="UserNameIs" Type="String" />
                        <asp:ControlParameter ControlID="txtAgentName" Name="AgentName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtAgentEmail" Name="AgentEmail1" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtAgentEmail2" Name="AgentEmail2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtChName" Name="ChurchName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtMailAddr" Name="MailingAddress" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtMailCity" Name="MailingCity" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlState" Name="MailingState" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtMailZip" Name="MailingZip" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtWebAddr" Name="ChurchUrl" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCarrier" Name="CurrentCarrier" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtExDate" Name="ExDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtPrem" Name="CurrentSmpPremium" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="rbPrevPolicyList" Name="Prior3Years" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtComments1" Name="PriorExplanation" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtChContact" Name="ContactPerson" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPhone1" Name="Phone1" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPhone2" Name="Phone2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtMortgLP" Name="MortLossPayee" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbIncList" Name="Incorporated" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="QuoteType" PropertyName="Value" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                    </SelectParameters>
               </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />

            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Umbrella">
                
                                <%--STEP 2--%>
                        <h3>
                            Umbrella Application</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Limit of Liability</label>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                 </li>
                                <li>
                                    <asp:DropDownList ID="ddLimit" runat="server">
                                        <asp:ListItem Value="1,000,000" Selected="True">1,000,000</asp:ListItem>
                                        <asp:ListItem Value="2,000,000">2,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Does the church own any automobiles?</label></li>
                                <li>
                                    <asp:RadioButtonList ID="rbOwnAuto" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Does the church have a Workers Compensation policy?</label></li>
                                <li>
                                    <asp:RadioButtonList ID="rbWcPolicy" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Current Carrier
                                        <br />
                                        <asp:TextBox ID="txtUmPriorCarrier" runat="server" Width="200px" MaxLength="40"></asp:TextBox>
                                    </label>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvUmPriorCarrier" runat="server" ControlToValidate="txtUmPriorCarrier"
                                        Text="*" ErrorMessage="Missing current carrier" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Current Premium
                                        <br />
                                        <asp:TextBox ID="txtPriorPrem" runat="server" Width="100px" MaxLength="40"></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Comments
                                        <br />
                                        <asp:TextBox ID="txtUmExpComments" runat="server" Width="485px" Height="104px" TextMode="MultiLine"></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <h3>
                            Five Year Loss History</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Was there any losses in the past five years?</label>
                                    <asp:RadioButtonList ID="rbUmLoss" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            
                                <table border="0">
                                    <tr>
                                        <td>
                                            <label>
                                                Date</label>
                                        </td>
                                        <td>
                                            <label>
                                                Description</label>
                                        </td>
                                        <td>
                                            <label>
                                                Amount</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDate15a" runat="server" ControlToValidate="txtLossDate15a"
                                                Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDescr15a" runat="server" ControlToValidate="txtLossDescr15a"
                                                Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossAmt15a" runat="server" ControlToValidate="txtLossAmt15a"
                                                Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15b" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15b" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15b" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15c" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15c" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15c" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15d" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15d" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15d" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15e" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15e" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15e" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
 
                        </div>
                <%--END STEP 15--%>

                <asp:ObjectDataSource 
                     ID="odsUmbrella" 
                     TypeName="smci.SqlAccessLayer.MySqlCode"
                     runat="server" 
                     InsertMethod="InsertUmApplication">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                        <asp:ControlParameter ControlID="ddLimit" Name="LimitOfLiability" PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="rbOwnAuto" Name="Automobiles" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbWcPolicy" Name="WorkersComp" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtUmPriorCarrier" Name="CurrentCarrier" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPriorPrem" Name="CurrentUmPrem" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtUmExpComments" Name="ExpComments" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbUmLoss" Name="PastLoss" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtLossDate15a" Name="PastLossDate1" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15a" Name="PastLossDescr1" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15a" Name="PastLossAmount1" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15b" Name="PastLossDate2" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15b" Name="PastLossDescr2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15b" Name="PastLossAmount2" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15c" Name="PastLossDate3" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15c" Name="PastLossDescr3" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15c" Name="PastLossAmount3" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15d" Name="PastLossDate4" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15d" Name="PastLossDescr4" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15d" Name="PastLossAmount4" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15e" Name="PastLossDate5" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15e" Name="PastLossDescr5" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15e" Name="PastLossAmount5" PropertyName="Text" Type="Decimal" />
                    </InsertParameters>
               </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary11" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
 
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Log">
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</div>