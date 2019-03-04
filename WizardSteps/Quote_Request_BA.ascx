<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Quote_Request_BA.ascx.vb" Inherits="WizardSteps_Quote_Request_BA" %>

<script type="text/javascript">
    function showInsert3() {
        var divInsert = document.getElementById('divInsert3');
        divInsert3.style.display = 'block';
    }
    function hideInsert3() {
        var divInsert = document.getElementById('divInsert3');
        divInsert3.style.display = 'none';
    }
    function hideInsert() {
        var divInsert = document.getElementById('divInsert');
        divInsert.style.display = 'none';
    }
</script>

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
                            <asp:WizardStep runat="server" StepType="Step" title="General Information">
 
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
                                <asp:RadioButtonList ID="rbPrevPolicyList" runat="server" RepeatDirection="Horizontal" Text='<%# Bind("Prior3Years") %>' onselectedindexchanged="rbPrevPolicyList_SelectedIndexChanged">
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
        <asp:WizardStep runat="server" StepType="Step" title="Business Auto">

                           <h3>
                            Church Owned Vehicle(s)</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Current Carrier</label>
                                    <asp:TextBox ID="txtCurrCarrier" runat="server" Width="287px" MaxLength="40"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvCurrCarrier" runat="server" ControlToValidate="txtCurrCarrier"
                                        Text="*" ErrorMessage="Missing current carrier" ForeColor="Red" />
                                </li>
                                <li>
                                    <asp:CheckBox ID="chbNoCarrier" runat="server" AutoPostBack="true" Text="No Current Carrier"
                                        OnCheckedChanged="chbNoCarrier_CheckedChanged" />
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Current Premium</label>
                                    <asp:TextBox ID="txtCurrPrem" runat="server" MaxLength="10" Width="90px"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvCurrPrem" runat="server" ControlToValidate="txtCurrPrem"
                                        Text="*" ErrorMessage="Missing current premium" ForeColor="Red" />
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Liability Limit</label>
                                    <asp:DropDownList ID="ddLiab" runat="server" Width="90px">
                                        <asp:ListItem Value="100000" Selected="True">100,000</asp:ListItem>
                                        <asp:ListItem Value="300000">300,000</asp:ListItem>
                                        <asp:ListItem Value="500000">500,000</asp:ListItem>
                                        <asp:ListItem Value="1000000">1,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Is Hired Physical Damage Coverage Desired?</label>
                                    <asp:RadioButtonList ID="rbDamageCover" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <p>
                                        <i>(If yes, Hired and Non-owned Liability coverage will automatically be added to the
                                            policy.)</i></p>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Any drivers under 25 or over 65?</label>
                                    <asp:RadioButtonList ID="rbAgeChk" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Comments
                                        <br />
                                        <asp:TextBox ID="txtExpComments" runat="server" Width="446px" Height="123px" TextMode="MultiLine"></asp:TextBox>
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
                                    <asp:RadioButtonList ID="rbBaLoss" runat="server" RepeatDirection="Horizontal" 
                                        AutoPostBack="True">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <asp:Panel ID="Panel3" runat="server">
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
                                            <asp:TextBox ID="txtLossDate11a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDate11a" runat="server" ControlToValidate="txtLossDate11a"
                                                Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDescr11a" runat="server" ControlToValidate="txtLossDescr11a"
                                                Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossAmt11a" runat="server" ControlToValidate="txtLossAmt11a"
                                                Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11b" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11b" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11b" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11c" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11c" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11c" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11d" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11d" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11d" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11e" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11e" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11e" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
 
                <%--END STEP 11--%>
                <asp:ObjectDataSource 
                     ID="odsAddBa" 
                     runat="server" 
                     InsertMethod="InsertBaApplication" 
                     TypeName="smci.SqlAccessLayer.MySqlCode">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField5" PropertyName="Value" />
                        <asp:ControlParameter ControlID="txtCurrCarrier" Name="CurrentCarrier" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCurrPrem" Name="CurrentPrem" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddLiab" Name="LiabilityLimit" PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="rbDamageCover" Name="PhysicalDamage" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbAgeChk" Name="DriversAge" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtExpComments" Name="ExpComments" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbBaLoss" Name="PastLosses" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtLossDate11a" Name="PastLossDate1" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr11a" Name="PastLossDescr1" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt11a" Name="PastLossAmount1" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate11b" Name="PastLossDate2" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr11b" Name="PastLossDescr2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt11b" Name="PastLossAmount2" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate11c" Name="PastLossDate3" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr11c" Name="PastLossDescr3" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt11c" Name="PastLossAmount3" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate11d" Name="PastLossDate4" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr11d" Name="PastLossDescr4" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt11d" Name="PastLossAmount4" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate11e" Name="PastLossDate5" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr11e" Name="PastLossDescr5" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt11e" Name="PastLossAmount5" PropertyName="Text" Type="Decimal" />
                    </InsertParameters>
               </asp:ObjectDataSource>


     <asp:ValidationSummary ID="ValidationSummary8" runat="server" ShowMessageBox="True" ShowSummary="False" />

        </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Step" Title="Vehicle Information">
                  <div class="quote_box2">
                            <h3>
                                Church Owned Vehicle</h3>
                            <div id="divDisplay3">
                                <asp:DataList 
                                     ID="dlstVehicle" 
                                     runat="server" 
                                     DataSourceID="odsChurchVehicle" 
                                     BorderStyle="None" 
                                     DataKeyField="Vehicleid" Width="775px">
                                    <ItemTemplate>
                                    <table>
                                       <tr>
                                          <td><b><asp:Label ID="Label16" runat="server" Text="Year" /></b></td>
                                          <td><asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' /></td>
                                          <td><b><asp:Label ID="Label17" runat="server" Text="Make" /></b></td>
                                          <td><asp:Label ID="MakeLabel" runat="server" Text='<%# Eval("Make") %>' /></td>
                                          <td><b><asp:Label ID="Label18" runat="server" Text="Model" /></b></td>
                                          <td><asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' /></td>
                                       </tr>
                                       <tr>
                                          <td><b><asp:Label ID="Label20" runat="server" Text="Number Of Passenagers" /></b></td>
                                          <td><asp:Label ID="NumofpassenLabel" runat="server" Text='<%# Eval("Numofpassen") %>' /></td>
                                          <td><b><asp:Label ID="Label21" runat="server" Text="Cost New"/></b></td>
                                          <td><asp:Label ID="CostnewLabel" runat="server" Text='<%# Eval("Costnew", "{0:C}") %>' /></td>
                                          <td><b><asp:Label ID="Label22" runat="server" Text="County" /></b></td>
                                          <td><asp:Label ID="CountyLabel" runat="server" Text='<%# Eval("County") %>' /></td>
                                       </tr>
                                        <tr>
                                          <td><b><asp:Label ID="Label23" runat="server" Text="Radius Of Operation:" /></b></td>
                                          <td><asp:Label ID="RadiusofoperationLabel" runat="server" Text='<%# Eval("Radiusofoperation") %>' /></td>
                                          <td><b><asp:Label ID="Label24" runat="server" Text="Liability Only" /></b></td>
                                          <td><asp:Label ID="LiabilityLabel" runat="server" Text='<%# Eval("Liability") %>' /></td>
                                          <td><b><asp:Label ID="Label25" runat="server" Text="Comp Deduct" /></b></td>
                                          <td><asp:Label ID="CompdeductLabel" runat="server" Text='<%# Eval("Compdeduct", "{0:C}") %>' /></td>
                                       </tr>
                                       <tr>
                                          <td><b><asp:Label ID="Label26" runat="server" Text="Collision" /></b></td>
                                          <td><asp:Label ID="CollisionLabel" runat="server" Text='<%# Eval("Collision", "{0:C}") %>' /></td>
                                          <td><b><asp:Label ID="Label27" runat="server" Text="Rental" /></b></td>
                                          <td><asp:Label ID="RentalLabel" runat="server" Text='<%# Eval("Rental", "{0:C}") %>' /></td>
                                          <td><b><asp:Label ID="Label28" runat="server" Text="Towing" /></b></td>
                                          <td><asp:Label ID="TowingLabel" runat="server" Text='<%# Eval("Towing", "{0:C}") %>' /></td>
                                       </tr>
                                       <tr>
                                          <td><b><asp:Label ID="Label19" runat="server" Text="VIN" /></b></td>
                                          <td><asp:Label ID="VINLabel" runat="server" Text='<%# Eval("VIN") %>' /></td>
                                       </tr>
                                       <tr>
                                        <td colspan="6">
                                            <asp:LinkButton ID="lnkEdit" CommandName="Edit" Text="Edit" runat="server"  />
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkDelete" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?')" runat="server" />
                                        </td>
                                    </tr>
                                    </table>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                      <table>
                                        <tr>
                                          <td><b><asp:Label ID="Label16" runat="server" Text="Year" /></b></td>
                                          <td><asp:TextBox ID="txtYear" runat="server" Width="80px" MaxLength="4" Text='<%# Bind("Year") %>'></asp:TextBox></td>
                                          <td><b><asp:Label ID="Label17" runat="server" Text="Make" /></b></td>
                                          <td><asp:TextBox ID="txtMake" runat="server" MaxLength="20" Text='<%# Bind("Make") %>'></asp:TextBox></td>
                                          <td><b><asp:Label ID="Label18" runat="server" Text="Model" /></b></td>
                                          <td><asp:TextBox ID="txtModel" runat="server" MaxLength="20" Text='<%# Bind("Model") %>'></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                          <td><b><asp:Label ID="Label20" runat="server" Text="Number Of Passenagers" /></b></td>
                                          <td><asp:TextBox ID="txtNumOfPass" runat="server" Width="80px" MaxLength="3" Text='<%# Bind("Numofpassen") %>'></asp:TextBox></td>
                                          <td><b><asp:Label ID="Label21" runat="server" Text="Cost New"/></b></td>
                                          <td><asp:TextBox ID="txtCost" runat="server" MaxLength="7" Text='<%# Bind("Costnew") %>'></asp:TextBox></td>
                                          <td><b><asp:Label ID="Label22" runat="server" Text="County" /></b></td>
                                          <td><asp:TextBox ID="txtCounty" runat="server" MaxLength="25" Text='<%# Bind("County") %>'></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                          <td><b><asp:Label ID="Label23" runat="server" Text="Radius Of Operation:" /></b></td>
                                          <td>
                                             <asp:DropDownList id="ddlRadius" runat="server" Width="118px" SelectedValue='<%# Bind("Radiusofoperation") %>'>
                                                    <asp:ListItem Value="50 or less" Selected="True">50 or less</asp:ListItem>
                                                    <asp:ListItem Value="51 to 200">51 to 200</asp:ListItem>
                                                    <asp:ListItem Value="Greater than 200">Greater than 200</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                          <td><b><asp:Label ID="Label24" runat="server" Text="Liability Only" /></b></td>
                                          <td>
                                             <asp:DropDownList ID="ddlLiability" runat="server" SelectedValue='<%# Bind("Liability") %>'>
                                                    <asp:ListItem Value="Yes" Selected="True">Yes</asp:ListItem>
                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td><b><asp:Label ID="Label25" runat="server" Text="Comp Deduct" /></b></td>
                                          <td>
                                              <asp:DropDownList ID="ddlComp" runat="server" SelectedValue='<%# Bind("Compdeduct") %>'>
                                                  <asp:ListItem Value="0.0000">Declined</asp:ListItem>
                                                  <asp:ListItem Value="250.0000">250</asp:ListItem>
                                                  <asp:ListItem Value="500.0000">500</asp:ListItem>
                                                  <asp:ListItem Value="1000.0000">1000</asp:ListItem>
                                              </asp:DropDownList>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td><b><asp:Label ID="Label26" runat="server" Text="Collision" /></b></td>
                                          <td>
                                               <asp:DropDownList ID="ddlCollision" runat="server" SelectedValue='<%# Bind("Collision") %>'>
                                                    <asp:ListItem Value="250.0000">250</asp:ListItem>
                                                    <asp:ListItem Value="500.0000">500</asp:ListItem>
                                                    <asp:ListItem Value="1000.0000">1000</asp:ListItem>
                                                    <asp:ListItem Value="0.0000" Selected="True">Declined</asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td><b><asp:Label ID="Label27" runat="server" Text="Rental" /></b></td>
                                          <td>
                                               <asp:DropDownList ID="ddlRental" runat="server" SelectedValue='<%# Bind("Rental") %>'>
                                                    <asp:ListItem Value="0.0000" Selected="True">Declined</asp:ListItem>
                                                    <asp:ListItem Value="15.0000">15</asp:ListItem>
                                                    <asp:ListItem Value="30.0000">30</asp:ListItem>
                                                    <asp:ListItem Value="45.0000">45</asp:ListItem>
                                                </asp:DropDownList>                                        
                                          </td>
                                          <td><b><asp:Label ID="Label28" runat="server" Text="Towing" /></b></td>
                                          <td>
                                            <asp:DropDownList ID="ddlTowing" runat="server" SelectedValue='<%# Bind("Towing") %>'>
                                                <asp:ListItem Value="0.0000" Selected="True">Declined</asp:ListItem>
                                                <asp:ListItem Value="50.0000">50</asp:ListItem>
                                                <asp:ListItem Value="75.0000">75</asp:ListItem>
                                                <asp:ListItem Value="100.0000">100</asp:ListItem>
                                            </asp:DropDownList>                                        
                                          </td>

                                        </tr>
                                        <tr>
                                          <td><b><asp:Label ID="Label19" runat="server" Text="VIN" /></b></td>
                                          <td><asp:TextBox ID="txtVin" runat="server" MaxLength="17" Text='<%# Bind("VIN") %>'></asp:TextBox></td>
                                        </tr>
                                      </table>
                                      <br />
                                    <table>
                                       <tr>
                                        <td>
                                            <asp:LinkButton ID="lnkUpdate" CommandName="Update" Text="Update" runat="server" />
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkCancel" CommandName="Cancel" Text="Cancel" runat="server" />
                                        </td>
                                    </tr>
                                    </table>
                                    </EditItemTemplate>

                                </asp:DataList>
                                <asp:HiddenField ID="HiddenField5" runat="server" />
                                <br />
                                <label>
                                    **Full coverage required if you desire Rental Reimburement and/or Towing and Labor.</label>
                                <br /><br />
                                <a href="JavaScript:showInsert3();">+ Add Church Vehicle</a>
                            </div>
                          
                            <div id="divInsert3">
                                <h3>
                                    Enter Vehicle Information</h3>
                                <asp:DetailsView 
                                     ID="dtlVehicle" 
                                     runat="server" 
                                     DefaultMode="Insert" 
                                     AutoGenerateRows="False" 
                                     BorderStyle="None" 
                                     DataSourceID="odsChurchVehicle" AutoGenerateInsertButton="True">
                                    <Fields>
                                        <asp:TemplateField HeaderText="Year" SortExpression="Year">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VehicleYear") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Width="80px" MaxLength="4" Text='<%# Bind("VehicleYear") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("VehicleYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Make" SortExpression="Make">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Make") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Text='<%# Bind("Make") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Make") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Model" SortExpression="Model">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" MaxLength="20" Text='<%# Bind("Model") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="VIN Number" SortExpression="VIN">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VIN") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" MaxLength="17" Text='<%# Bind("VIN") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("VIN") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of Passenagers" 
                                            SortExpression="Numofpassen">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NumOfPassengers") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Width="80px" MaxLength="3" Text='<%# Bind("NumOfPassengers") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("NumOfPassengers") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Original Cost New" SortExpression="Costnew">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Costnew") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" MaxLength="7" Text='<%# Bind("CostNew") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Costnew") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="County" SortExpression="County">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("County") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" MaxLength="25" Text='<%# Bind("County") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("County") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Radius Of Operation" SortExpression="Radiusofoperation">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Radiusofoperation") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList id="ddlRadius" runat="server" Width="118px" SelectedValue='<%# Bind("RadiusOfOperation") %>'>
                                                    <asp:ListItem Value="50 or less" Selected="True">50 or less</asp:ListItem>
                                                    <asp:ListItem Value="51 to 200">51 to 200</asp:ListItem>
                                                    <asp:ListItem Value="Greater than 200">Greater than 200</asp:ListItem>
                                                </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Radiusofoperation") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Liability Only" SortExpression="Liability">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Liability") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="ddlLiability" runat="server" SelectedValue='<%# Bind("LiabilityOnly") %>'>
                                                    <asp:ListItem Value="Yes" Selected="True">Yes</asp:ListItem>
                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Liability") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Comprehensive Deductible" 
                                            SortExpression="Compdeduct">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Compdeduct") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="ddlComp" runat="server" SelectedValue='<%# Bind("Compdeduct") %>'>
                                                        <asp:ListItem Value="250">250</asp:ListItem>
                                                        <asp:ListItem Value="500">500</asp:ListItem>
                                                        <asp:ListItem Value="1000">1,000</asp:ListItem>
                                                        <asp:ListItem Value="0" Selected="True">Declined</asp:ListItem>
                                                    </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Compdeduct") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Collision Deductible" SortExpression="Collision">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Collision") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="ddlCollision" runat="server" SelectedValue='<%# Bind("CollisionDeduct") %>'>
                                                    <asp:ListItem Value="250">250</asp:ListItem>
                                                    <asp:ListItem Value="500">500</asp:ListItem>
                                                    <asp:ListItem Value="1000">1000</asp:ListItem>
                                                    <asp:ListItem Value="0" Selected="True">Declined</asp:ListItem>
                                                </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Collision") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rental Reimbursement" SortExpression="Rental">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Rental") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                               <asp:DropDownList ID="ddlRental" runat="server" SelectedValue='<%# Bind("RentalReimbur") %>'>
                                                    <asp:ListItem Value="0" Selected="True">Declined</asp:ListItem>
                                                    <asp:ListItem Value="15">15</asp:ListItem>
                                                    <asp:ListItem Value="30">30</asp:ListItem>
                                                    <asp:ListItem Value="45">45</asp:ListItem>
                                                </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Rental") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Towing/Labor" SortExpression="Towing">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Towing") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                   <asp:DropDownList ID="ddlTowing" runat="server" SelectedValue='<%# Bind("TowingLabor") %>'>
                                                        <asp:ListItem Value="0" Selected="True">Declined</asp:ListItem>
                                                        <asp:ListItem Value="50">50</asp:ListItem>
                                                        <asp:ListItem Value="75">75</asp:ListItem>
                                                        <asp:ListItem Value="100">100</asp:ListItem>
                                                    </asp:DropDownList>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("Towing") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                            </div>
                        </div>

                <asp:ObjectDataSource 
                     ID="odsChurchVehicle" 
                     runat="server" 
                     InsertMethod="InsertChurchVehicle" 
                     SelectMethod="GetChurchVehicle" 
                     DeleteMethod="DeleteVehicle"
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     UpdateMethod="UpdateVehicle" >
                    <DeleteParameters>
                        <asp:Parameter Name="VehicleId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField5" PropertyName="Value" />
                        <asp:Parameter Name="VehicleYear" Type="Int32" />
                        <asp:Parameter Name="Make" Type="String" />
                        <asp:Parameter Name="Model" Type="String" />
                        <asp:Parameter Name="VIN" Type="String" />
                        <asp:Parameter Name="NumOfPassengers" Type="Int32" />
                        <asp:Parameter Name="CostNew" Type="Decimal" />
                        <asp:Parameter Name="County" Type="String" />
                        <asp:Parameter Name="RadiusOfOperation" Type="String" />
                        <asp:Parameter Name="LiabilityOnly" Type="String" />
                        <asp:Parameter Name="CompDeduct" Type="Decimal" />
                        <asp:Parameter Name="CollisionDeduct" Type="Decimal" />
                        <asp:Parameter Name="RentalReimbur" Type="Decimal" />
                        <asp:Parameter Name="TowingLabor" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ddate" SessionField="ddate" Type="DateTime" />
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField5" PropertyName="Value" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Vehicleid" Type="Int32" />
                        <asp:Parameter Name="Year" Type="Int32" />
                        <asp:Parameter Name="Make" Type="String" />
                        <asp:Parameter Name="Model" Type="String" />
                        <asp:Parameter Name="VIN" Type="String" />
                        <asp:Parameter Name="Numofpassen" Type="Int32" />
                        <asp:Parameter Name="Costnew" Type="Decimal" />
                        <asp:Parameter Name="County" Type="String" />
                        <asp:Parameter Name="Radiusofoperation" Type="String" />
                        <asp:Parameter Name="Liability" Type="String" />
                        <asp:Parameter Name="Compdeduct" Type="Decimal" />
                        <asp:Parameter Name="Collision" Type="Decimal" />
                        <asp:Parameter Name="Rental" Type="Decimal" />
                        <asp:Parameter Name="Towing" Type="Decimal" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Log">
                </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>


    </div>