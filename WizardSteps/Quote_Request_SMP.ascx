<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Quote_Request_SMP.ascx.vb" Inherits="WizardSteps_Quote_Request_SMP" %>

<script type="text/javascript">
    function showInsert1() {
        var divInsert1 = document.getElementById('divInsert1');
        divInsert1.style.display = 'block';
    }
    function hideInsert1() {
        var divInsert1 = document.getElementById('divInsert1');
        divInsert1.style.display = 'none';
    }
    function showInsert2() {
        var divInsert2 = document.getElementById('divInsert2');
        divInsert2.style.display = 'block';
    }
    function hideInsert2() {
        var divInsert2 = document.getElementById('divInsert2');
        divInsert2.style.display = 'none';
    }
    function showInsert3() {
        var divInsert3 = document.getElementById('divInsert3');
        divInsert3.style.display = 'block';
    }
    function hideInsert3() {
        var divInsert3 = document.getElementById('divInsert3');
        divInsert3.style.display = 'none';
    }
    function showEdit() {
        var divEdit = document.getElementById('divEdit');
        divEdit.style.display = 'block';
    }
</script>
<style type="text/css">
    label, p, ul
    {
        margin: 0px;
        padding: 0px;
    }
    .MyStyle
    {
        width: 650px;
    }
    #table1
    {
        float: left;
        margin-right: 80px;
    }
    #table2
    {
        float: left;
    }
    .column_epl
    {
        width: 454px;
    }
    .build_gridview 
    {
     font-family:Tahoma;
     font-size:9px; 
    }
    .style1
    {
        width: 100%;
    }
</style>
<div id="master_quote_box">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" CssClass="wizard">

        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                Text="Previous" Visible="False" />
            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish"
                OnClick="FinishButton_Click" />
        </FinishNavigationTemplate>

        <NavigationStyle HorizontalAlign="Left" VerticalAlign="Bottom" />

        <SideBarStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />

        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" Visible="False" />
            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" OnClick="StepNextButton_Click" />
        </StepNavigationTemplate>

        <WizardSteps>
            <%--STEP 16--%>
            <%--STEP 17--%>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="General Information" StepType="Step">
                <%-- STEP 1--%>

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
                <%--END STEP 1    --%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Property/Crime Section - A" StepType="Step">
                <%-- STEP 2--%>
                         <table>
                            <tr>
                            <td><b><asp:Label ID="lblRequest" runat="server" Text="Request Number:" /></b></td>
                            <td><asp:Literal ID="ltRequest" runat="server" Text='<%# Bind("RequestNumber") %>' /></td>
                            <td><asp:HiddenField ID="HiddenField2" runat="server" />
                            </td>
                            </tr>
                         </table>
                <div class="quote_box1">
                            <h3>Property/Crime</h3>
                            <br />

                            <ul>
                                <li>
                                    <label>
                                        Deductible</label></li>
                                <li>
                                    <asp:DropDownList ID="ddDeduct" runat="server">
                                        <asp:ListItem Value="500">500</asp:ListItem>
                                        <asp:ListItem Value="1000">1000</asp:ListItem>
                                        <asp:ListItem Value="2500">2500</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label>
                                        Form</label></li>
                                <li>
                                    <asp:DropDownList ID="ddForm" runat="server">
                                        <asp:ListItem Value="Basic">Basic</asp:ListItem>
                                        <asp:ListItem Value="Broad">Broad</asp:ListItem>
                                        <asp:ListItem Value="Special" Selected="True">Special</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <asp:RadioButtonList ID="rbCostValueList" RepeatDirection="Horizontal" runat="server">
                                      <asp:ListItem Value="Replacement Cost">RC</asp:ListItem>
                                      <asp:ListItem Value="Actual Cash Value" Selected="True">ACV</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Blanket Coverage?</label></li>
                                <li>
                                    <asp:RadioButtonList ID="rbBlanketCostList" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Earthquake?</label></li>
                                <li>
                                    <asp:RadioButtonList ID="rbEqList" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                </div>

                
                    <asp:ObjectDataSource 
                         ID="odsAddSmp"
                         InsertMethod="InsertSmpApplication"
                         TypeName="smci.SqlAccessLayer.MySqlCode" 
                         runat="server">
                        <InsertParameters>
                            <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                            <asp:ControlParameter ControlID="ddDeduct" Name="Deductible" PropertyName="SelectedValue" Type="Decimal" />
                            <asp:ControlParameter ControlID="ddForm" Name="FormType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="rbCostValueList" Name="RcAcv" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="rbBlanketCostList" Name="BlanketCoverage" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter Name="Earthquake" Type="String" ControlID="rbEqList" PropertyName="SelectedValue" />
                            <asp:Parameter DefaultValue="0" Name="MoneySecurity" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="EmployeeDishonesty" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="Forgery" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="OrdinaceLaw" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="ExtraExp" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="WaterSewer" Type="Decimal" />
                            <asp:Parameter DefaultValue="Blank" Name="PropertyComments" Type="String" />
                            <asp:Parameter DefaultValue="0" Name="GeneralLiability" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="PreOccurance" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="MedPay" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="PastoralCoun" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="SexualMiscon" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="DirectorsOfficers" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="HiredNonOwnAuto" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="EmployeeBenefits" />
                            <asp:Parameter DefaultValue="0" Name="EmployeePratice" Type="Decimal" />
                            <asp:Parameter DefaultValue="Blank" Name="MiscLegalDefense" Type="String" />
                            <asp:Parameter DefaultValue="Blank" Name="ViolentActs" Type="String" />
                            <asp:Parameter DefaultValue="0" Name="TeacherProfessional" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="CorporalPunishment" Type="Decimal" />
                            <asp:Parameter DefaultValue="0" Name="LostWages" Type="Decimal" />
                            <asp:Parameter DefaultValue="No" Name="PropOwned" />
                            <asp:Parameter DefaultValue="No" Name="WhoIsOwner" />
                            <asp:Parameter DefaultValue="No" Name="Daycare" />
                            <asp:Parameter DefaultValue="No" Name="NumOfChild" />
                            <asp:Parameter DefaultValue="No" Name="BgChecks" />
                            <asp:Parameter DefaultValue="No" Name="Playground" />
                            <asp:Parameter DefaultValue="No" Name="PlayFenced" />
                            <asp:Parameter DefaultValue="No" Name="Cemetery" />
                            <asp:Parameter DefaultValue="No" Name="CemFenced" />
                            <asp:Parameter DefaultValue="No" Name="MainProperty" />
                            <asp:Parameter DefaultValue="Blank" Name="CemeteryAddress" />
                            <asp:Parameter DefaultValue="No" Name="Ballfield" />
                            <asp:Parameter DefaultValue="No" Name="Ballfenced" />
                            <asp:Parameter DefaultValue="No" Name="LocChurProp" />
                            <asp:Parameter DefaultValue="Blank" Name="ExpChurchComments" />
                            <asp:Parameter DefaultValue="0" Name="AverageAtten" />
                            <asp:Parameter DefaultValue="No" Name="FiveYearLoss" />
                            <asp:Parameter DefaultValue="01/01/2013" Name="Date1" />
                            <asp:Parameter DefaultValue="Blank" Name="Description1" />
                            <asp:Parameter DefaultValue="0" Name="Amount1" />
                            <asp:Parameter DefaultValue="01/01/2013" Name="Date2" />
                            <asp:Parameter DefaultValue="Blank" Name="Description2" />
                            <asp:Parameter DefaultValue="0" Name="Amount2" />
                            <asp:Parameter DefaultValue="01/01/2013" Name="Date3" />
                            <asp:Parameter DefaultValue="Blank" Name="Description3" />
                            <asp:Parameter DefaultValue="0" Name="Amount3" />
                            <asp:Parameter DefaultValue="01/01/2013" Name="Date4" />
                            <asp:Parameter DefaultValue="Blank" Name="Description4" />
                            <asp:Parameter DefaultValue="0" Name="Amount4" />
                            <asp:Parameter DefaultValue="01/01/2013" Name="Date5" />
                            <asp:Parameter DefaultValue="Blank" Name="Description5" />
                            <asp:Parameter DefaultValue="0" Name="Amount5" />
                            <asp:Parameter DefaultValue="No" Name="OweVehicle" />
                            <asp:Parameter DefaultValue="No" Name="WorkComp" />
                            <asp:Parameter DefaultValue="No" Name="Umbrella" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                <%--  END STEP 2   --%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Building Location" StepType="Step">
                <%--   STEP 3--%>
                <h3>
                    Physical Location of the Building</h3>
                <div class="quote_box1">
                    <div id="divDisplay1">
                        <asp:GridView 
                             ID="grdLocation" 
                             runat="server" 
                             EmptyDataText="No Data At This Time."
                             AutoGenerateColumns="False" 
                             DataSourceID="odsLocation" 
                             DataKeyNames="Locnum"
                             Font-Names="Tahoma" 
                             Font-Size="Small" 
                             Width="765px" 
                             BorderStyle="None">
                            <Columns>
                                <asp:BoundField DataField="Locnum" HeaderText="Location Number" Visible="False">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Agentnum" HeaderText="Agent Number" Visible="False" />
                                <asp:TemplateField HeaderText="Location Address">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="75" Text='<%# Bind("Locaddress") %>'
                                            Width="100px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="txtAddress" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing address." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Locaddress") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location City">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCity" runat="server" MaxLength="25" Text='<%# Bind("Loccity") %>'
                                            Width="100px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCity" ControlToValidate="txtCity" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing city." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Loccity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location State">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("Locstate") %>'>
                                            <asp:ListItem>GA</asp:ListItem>
                                            <asp:ListItem>NC</asp:ListItem>
                                            <asp:ListItem>SC</asp:ListItem>
                                            <asp:ListItem>TN</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Locstate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location Zip">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtZip" runat="server" MaxLength="5" Text='<%# Bind("Loczip") %>'
                                            Width="60px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvZip" ControlToValidate="txtZip" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing zip code." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Loczip") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location County">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCounty" runat="server" MaxLength="25" Text='<%# Bind("Loccounty") %>'
                                            Width="90px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCounty" ControlToValidate="txtCounty" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing county." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Loccounty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Status" HeaderText="Status" Visible="False" />
                                <asp:TemplateField HeaderText="Today" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Todaydate", "{0:d}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Todaydate", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="Action" ShowEditButton="True">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:CommandField>
                                <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                            OnClientClick="return confirm('Are you sure?')" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <a href="JavaScript:showInsert1();">+ Add Location</a>
                    </div>
                    <div id="divInsert1">
                        <asp:DetailsView 
                             ID="dtlInsertLocation" 
                             AutoGenerateInsertButton="true" 
                             AutoGenerateRows="false"
                             DefaultMode="Insert" 
                             runat="server" 
                             DataSourceID="odsLocation" 
                             BorderStyle="None">
                            <Fields>
                                <asp:TemplateField HeaderText="Address" SortExpression="Locaddress">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocationAddress") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocationAddress") %>' MaxLength="75"
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="TextBox1" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing address." Enabled="false" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LocationAddress") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City" SortExpression="Loccity">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LocationCity") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LocationCity") %>' MaxLength="25"
                                            Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCity" ControlToValidate="TextBox2" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing city." Enabled="false" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("LocationCity") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State" SortExpression="Locstate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("LocationState") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("LocationState") %>'>
                                            <asp:ListItem>GA</asp:ListItem>
                                            <asp:ListItem>NC</asp:ListItem>
                                            <asp:ListItem>SC</asp:ListItem>
                                            <asp:ListItem>TN</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LocationState") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zip" SortExpression="Loczip">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("LocationZip") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("LocationZip") %>' MaxLength="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvZip" ControlToValidate="TextBox4" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing zip code." Enabled="false" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("LocationZip") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="County" SortExpression="Loccounty">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LocationCounty") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LocationCounty") %>' Width="180px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCounty" ControlToValidate="TextBox5" runat="server"
                                            Text="*" ForeColor="Red" ErrorMessage="Missing county." Enabled="false" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("LocationCounty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        <br />
                    </div>
                </div>
                <asp:ObjectDataSource 
                     ID="odsLocation" 
                     runat="server" 
                     SelectMethod="GetLocation"
                     InsertMethod="InsertLocation" 
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     DeleteMethod="DeleteLocation"
                     UpdateMethod="UpdateLocation">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:SessionParameter Name="ddate" SessionField="ddate" Type="DateTime" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Locnum" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                        <asp:Parameter Name="LocationAddress" Type="String" />
                        <asp:Parameter Name="LocationCity" Type="String" />
                        <asp:Parameter Name="LocationState" Type="String" />
                        <asp:Parameter Name="LocationZip" Type="String" />
                        <asp:Parameter Name="LocationCounty" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LocNum" Type="String" />
                        <asp:Parameter Name="LocAddress" Type="String" />
                        <asp:Parameter Name="LocCity" Type="String" />
                        <asp:Parameter Name="LocState" Type="String" />
                        <asp:Parameter Name="LocZip" Type="String" />
                        <asp:Parameter Name="LocCounty" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ValidationSummary ID="vs14" runat="server" ShowMessageBox="True" ShowSummary="False"
                    Enabled="false" />
                <%-- END STEP 3  --%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep4" runat="server" Title="Building Information">
                <%--STEP 4--%>
                <h3>
                    Building Information</h3>
                <div class="quote_box2">
                    <div id="divDisplay2">
                       <asp:DataList 
                             ID="dlstBuild" 
                             runat="server" 
                             DataSourceID="odsAllBuilding" 
                             Width="775px" 
                             BorderStyle="None" 
                             DataKeyField="Buildnumber">
                              <ItemTemplate>
                               <table>
                                        <tr>
                                          <td><b><asp:Label ID="lblBuildOcc" runat="server" Text="Building Occupancy" /></b></td>
                                          <td><asp:Label ID="Label9" runat="server" Text='<%# Bind("BuildOccupancy") %>'></asp:Label></td>
                                          <td><b><asp:Label ID="lblConValue" runat="server" Text="Contents Value" /></b></td>
                                          <td> <asp:Label ID="Label3" runat="server" Text='<%# Bind("Contentvalue", "{0:C}") %>'></asp:Label></td>
                                          <td><b><asp:Label ID="bldValue" runat="server" Text="Building Value" /></b></td>
                                          <td><asp:Label ID="Label2" runat="server" Text='<%# Bind("Buildvalue", "{0:C}") %>'></asp:Label></td>
                                        </tr>
                                    <tr>
                                        <td><b><asp:Label ID="lblBuildLoc" runat="server" Text="Building Location" /></b></td>
                                        <td><asp:Label ID="Label8" runat="server" Text='<%# Bind("Unit") %>'></asp:Label></td>
                                        <td><b><asp:Label ID="lblExtCon" runat="server" Text="Exterior Construction" /></b></td>
                                        <td><asp:Label ID="Label7" runat="server" Text='<%# Bind("Extconstr") %>'></asp:Label></td>
                                        <td><b><asp:Label ID="lblProtClass" runat="server" Text="Protection Class" /></b></td>
                                        <td><asp:Label ID="Label5" runat="server" Text='<%# Bind("Fireclass") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                       <td><b><asp:Label ID="lblFireDist" runat="server" Text="Fire District" /></b></td>
                                        <td><asp:Label ID="Label4" runat="server" Text='<%# Bind("Firedistrict") %>'></asp:Label></td>
                                        <td><b><asp:Label ID="lblfloorConstr" runat="server" Text="Floor Construction" /></b></td>
                                        <td> <asp:Label ID="Label6" runat="server" Text='<%# Bind("Intconstr") %>'></asp:Label></td>
                                        <td><b><asp:Label ID="lblSqFeet" runat="server" Text="Sq. Feet" /></b></td>
                                        <td><asp:Label ID="Label10" runat="server" Text='<%# Bind("Sqfeet") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <asp:LinkButton ID="lnkEdit" CommandName="Edit" Text="Edit" runat="server"  />
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkDelete" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?')" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                              </ItemTemplate>
                            <EditItemTemplate>
                                <table>
                                    <tr>
                                      <td><b><asp:Label ID="lblBuildOcc" runat="server" Text="Building Occupancy" /></b></td>
                                    <td>
                                    <asp:DropDownList 
                                            ID="ddlOccupancy" 
                                            runat="server" 
                                            DataSourceID="odsBuildings" 
                                            DataTextField="A1KKTX"
                                            DataValueField="A1KKTX" 
                                            SelectedValue='<%# Bind("BuildOccupancy") %>'>
                                    </asp:DropDownList>
                                     </td>
                                        <td><b><asp:Label ID="lblConValue" runat="server" Text="Contents Value" /></b></td>
                                        <td><asp:TextBox ID="txtConValue" runat="server" Width="70px" MaxLength="10" Text='<%# Bind("Contentvalue") %>' /></td>
                                       <td><b><asp:Label ID="bldValue" runat="server" Text="Building Value" /></b></td>
                                        <td>
                                        <asp:TextBox ID="txtBuildValue" runat="server" Width="70px" MaxLength="10" Text='<%# Bind("Buildvalue") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b><asp:Label ID="lblBuildLoc" runat="server" Text="Building Location" /></b></td>
                                        <td>
                                         <asp:DropDownList 
                                             ID="ddlLocation" 
                                             runat="server" 
                                             DataSourceID="odsChooseLocation"
                                             DataTextField="Unit" 
                                             DataValueField="Locnum" 
                                             SelectedValue='<%# Bind("LocNum") %>'>
                                        </asp:DropDownList>
                                        </td>
                                        <td><b><asp:Label ID="lblExtCon" runat="server" Text="Exterior Construction" /></b></td>
                                        <td>
                                         <asp:DropDownList ID="ddlExterior" runat="server" SelectedValue='<%# Bind("ExtConstr") %>'>
                                            <asp:ListItem>Frame</asp:ListItem>
                                            <asp:ListItem>Joisted Masonry</asp:ListItem>
                                            <asp:ListItem>Non-Combustible</asp:ListItem>
                                            <asp:ListItem>Modified Fire - Resistive</asp:ListItem>
                                            <asp:ListItem>Fire Resistive</asp:ListItem>
                                        </asp:DropDownList>
                                        </td>
                                        <td><b><asp:Label ID="lblProtClass" runat="server" Text="Protection Class" /></b></td>
                                        <td>
                                         <asp:DropDownList ID="ddlFireClass" runat="server" SelectedValue='<%# Bind("Fireclass") %>'>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                        </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                       <td><b><asp:Label ID="lblFireDist" runat="server" Text="Fire District" /></b></td>
                                        <td>
                                        <asp:TextBox ID="txtFireDistrict" runat="server" MaxLength="30" Text='<%# Bind("Firedistrict") %>' />
                                        </td>
                                        <td><b><asp:Label ID="lblfloorConstr" runat="server" Text="Floor Construction" /></b></td>
                                        <td>
                                         <asp:DropDownList ID="ddlInterior" runat="server" SelectedValue='<%# Bind("IntConstr") %>'>
                                            <asp:ListItem>Frame</asp:ListItem>
                                            <asp:ListItem>Concrete</asp:ListItem>
                                        </asp:DropDownList>
                                        </td>
                                        <td><b><asp:Label ID="lblSqFeet" runat="server" Text="Sq. Feet" /></b></td>
                                        <td><asp:TextBox ID="txtSqFeet" runat="server" Width="60px" MaxLength="7" Text='<%# Bind("Sqfeet") %>' /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <asp:LinkButton ID="lnkUpdate" CommandName="Update" Text="Update" runat="server" />
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkCancel" CommandName="Cancel" Text="Cancel" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                        </asp:DataList>
                        <br />
                        <a href="JavaScript:showInsert2();">+ Add Building</a>
                    </div>
                    <div id="divInsert2">
                     <asp:Panel ID="layer1" runat="server">
                        <asp:DetailsView 
                             ID="dtlInsertBuilding" 
                             runat="server" 
                             AutoGenerateInsertButton="True"
                             AutoGenerateRows="False" 
                             DataSourceID="odsAllBuilding" 
                             DefaultMode="Insert" 
                             BorderStyle="None">
                            <Fields>
                                <asp:TemplateField HeaderText="Building Occupancy" SortExpression="Buildoccupy">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Buildoccupy") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList 
                                             ID="ddlOccupancy" 
                                             runat="server" 
                                             DataSourceID="odsBuildings" 
                                             DataTextField="A1KKTX"
                                             DataValueField="A1KKTX" 
                                             SelectedValue='<%# Bind("BuildOccupancy") %>' />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BuildOccupancy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Building Location" SortExpression="Locnum">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Locnum") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList 
                                             ID="ddlLocation" 
                                             runat="server" 
                                             DataSourceID="odsChooseLocation"
                                             DataTextField="Unit" 
                                             DataValueField="Locnum" 
                                             SelectedValue='<%# Bind("LocNumber") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Locnum") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Building Value" SortExpression="Buildvalue">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Buildvalue") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" Text='<%# Bind("Buildvalue") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Buildvalue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contents Value" SortExpression="Contentvalue">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ConValue") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" Text='<%# Bind("ConValue") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ConValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exterior Construction" SortExpression="Extconstr">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ExtConstr") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlExterior" runat="server" SelectedValue='<%# Bind("ExtConstr") %>'>
                                            <asp:ListItem>Frame</asp:ListItem>
                                            <asp:ListItem>Joisted Masonry</asp:ListItem>
                                            <asp:ListItem>Non-Combustible</asp:ListItem>
                                            <asp:ListItem>Modified Fire - Resistive</asp:ListItem>
                                            <asp:ListItem>Fire Resistive</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExtConstr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Floor Construction" SortExpression="Intconstr">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("IntConstr") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlInterior" runat="server" SelectedValue='<%# Bind("IntConstr") %>'>
                                            <asp:ListItem>Frame</asp:ListItem>
                                            <asp:ListItem>Concrete</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Intconstr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sq. Feet" SortExpression="Sqfeet">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Sqfeet") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" MaxLength="7" Text='<%# Bind("Sqfeet") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Sqfeet") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Protection Class" SortExpression="Fireclass">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("FireClass") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlFireClass" runat="server" SelectedValue='<%# Bind("FireClass") %>'>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("FireClass") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fire District" SortExpression="Firedistrict">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("FireDist") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" MaxLength="30" 
                                            Text='<%# Bind("FireDist") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("FireDist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                      </asp:Panel>
                    </div>
                </div>
                <asp:ObjectDataSource 
                     ID="odsBuildings" 
                     runat="server" 
                     SelectMethod="BuildingOccupancy"
                     TypeName="smci.DataAccessLayer.MySqlIdb2Code">
               </asp:ObjectDataSource>

                <asp:ObjectDataSource 
                     ID="odsChooseLocation" 
                     SelectMethod="ChooseLocation" 
                     TypeName="smci.SqlAccessLayer.MySqlCode"
                     runat="server">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:SessionParameter Name="ddate" SessionField="ddate" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <asp:ObjectDataSource 
                     ID="odsAllBuilding" 
                     runat="server" 
                     TypeName="smci.SqlAccessLayer.MySqlCode"
                     InsertMethod="InsertBuilding" 
                     SelectMethod="GetBuilding" 
                     DeleteMethod="DeleteBuilding"
                     UpdateMethod="UpdateBuilding">
                    <DeleteParameters>
                        <asp:Parameter Name="Buildnumber" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                        <asp:Parameter Name="LocNumber" Type="String" />
                        <asp:Parameter Name="BuildOccupancy" Type="String" />
                        <asp:Parameter Name="BuildValue" Type="String" />
                        <asp:Parameter Name="ConValue" Type="String" />
                        <asp:Parameter Name="ExtConstr" Type="String" />
                        <asp:Parameter Name="IntConstr" Type="String" />
                        <asp:Parameter Name="SqFeet" Type="String" />
                        <asp:Parameter Name="FireClass" Type="String" />
                        <asp:Parameter Name="FireDist" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:SessionParameter Name="ddate" SessionField="ddate" Type="DateTime" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Buildnumber" Type="Int32" />
                        <asp:Parameter Name="BuildOccupancy" Type="String" />
                        <asp:Parameter Name="Locnum" Type="String" />
                        <asp:Parameter Name="Buildvalue" Type="String" />
                        <asp:Parameter Name="Contentvalue" Type="String" />
                        <asp:Parameter Name="ExtConstr" Type="String" />
                        <asp:Parameter Name="IntConstr" Type="String" />
                        <asp:Parameter Name="Sqfeet" Type="String" />
                        <asp:Parameter Name="Fireclass" Type="String" />
                        <asp:Parameter Name="Firedistrict" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>

                <asp:ObjectDataSource 
                     ID="odsSpecificBuilding" 
                     runat="server" 
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     SelectMethod="GetSpecificBuilding" 
                     UpdateMethod="UpdateBuilding">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />
                        <asp:SessionParameter Name="ddate" SessionField="ddate" Type="DateTime" />
                        <asp:SessionParameter DefaultValue="-1" Name="Buildnumber" 
                            SessionField="Buildnumber" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Buildnumber" Type="Int32" />
                        <asp:Parameter Name="BuildOccupancy" Type="String" />
                        <asp:Parameter Name="Locnum" Type="String" />
                        <asp:Parameter Name="Buildvalue" Type="String" />
                        <asp:Parameter Name="Contentvalue" Type="String" />
                        <asp:Parameter Name="ExtConstr" Type="String" />
                        <asp:Parameter Name="IntConstr" Type="String" />
                        <asp:Parameter Name="Sqfeet" Type="String" />
                        <asp:Parameter Name="Fireclass" Type="String" />
                        <asp:Parameter Name="Firedistrict" Type="String" />
                    </UpdateParameters>
               </asp:ObjectDataSource>

                <%--END STEP 4 --%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep5" runat="server" Title="Property/Crime Section - B">
                <%--STEP 5--%>
                        <h3>
                            Property/Crime Sections</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Money and Securities</label>
                                    <asp:TextBox ID="txtMoney" runat="server" MaxLength="15"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvMoney" runat="server" ControlToValidate="txtMoney"
                                        Text="*" ErrorMessage="Missing money and securities" ForeColor="Red" /></li>
                                <li>
                                    <label>
                                        Employee Dishonesty</label>
                                    <asp:TextBox ID="txtEmpDis" runat="server" MaxLength="15"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvEmpDis" runat="server" ControlToValidate="txtEmpDis"
                                        Text="*" ErrorMessage="Missing employee dishonesty" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Forgery</label>
                                    <asp:DropDownList ID="ddForgery" runat="server" Width="110px">
                                        <asp:ListItem Value="5000">5000</asp:ListItem>
                                        <asp:ListItem Value="10000">10000</asp:ListItem>
                                        <asp:ListItem Value="15000">15000</asp:ListItem>
                                        <asp:ListItem Value="20000">20000</asp:ListItem>
                                        <asp:ListItem Value="25000">25000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label>
                                        <i>(Applicable only for Special Form policies)</i></label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Ordinance and Law</label>
                                    <asp:DropDownList ID="ddOrdLaw" runat="server" Width="110px">
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="100000">100000</asp:ListItem>
                                        <asp:ListItem Value="150000">150000</asp:ListItem>
                                        <asp:ListItem Value="200000">200000</asp:ListItem>
                                        <asp:ListItem Value="250000">250000</asp:ListItem>
                                        <asp:ListItem Value="300000">300000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Extra Expense</label>
                                    <asp:TextBox ID="txtExtraExp" runat="server" MaxLength="15"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvExtraExpense" runat="server" ControlToValidate="txtExtraExp"
                                        Text="*" ErrorMessage="Missing Extra Expense." ForeColor="Red" /></li>
                                <li>
                                    <label>
                                        <i>(Enter a value between 10,000 and 100,000 in increments of 1,000)</i></label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Water/Sewer Backup</label>
                                    <asp:TextBox ID="txtWater" runat="server" MaxLength="15"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvWater" runat="server" ControlToValidate="txtWater"
                                        Text="*" ErrorMessage="Missing Water/Sewer backup." ForeColor="Red" /></li>
                                <li>
                                    <label>
                                        <i>(Enter a value between 10,000 and 100,000 in increments of 5,000)</i></label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Property Comments
                                        <br />
                                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="89px" Width="304px"></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <asp:ObjectDataSource 
                         ID="odsUpdateSmpApp1"
                         TypeName="smci.SqlAccessLayer.MySqlCode" 
                         runat="server" 
                         UpdateMethod="UpdateSmpApplication1">
                            <UpdateParameters>
                            <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtMoney" Name="MoneySecurity" PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtEmpDis" Name="EmployeeDishonesty" PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddForgery" Name="Forgery" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddOrdLaw" Name="OrdinaceLaw" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtExtraExp" Name="ExtraExp" PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtWater" Name="WaterSewer" PropertyName="Text" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtComments" Name="PropertyComments" PropertyName="Text" Type="String" />
                            </UpdateParameters>
                    </asp:ObjectDataSource>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
                <%--END STEP 5--%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep6" runat="server" Title="Liability Section">
                <%--STEP 6--%>              
                        <h3>
                            Liability</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        General Liability</label>
                                    <asp:DropDownList ID="ddGLocc" runat="server" Width="90px">
                                        <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                        <asp:ListItem Value="500,000">500,000</asp:ListItem>
                                        <asp:ListItem Value="1,000,000" Selected="True">1,000,000</asp:ListItem>
                                        <asp:ListItem Value="2,000,000">2,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label>
                                        per occurance/</label>
                                    <asp:DropDownList ID="ddGLagg" runat="server" Width="90px">
                                        <asp:ListItem Value="2,000,000" Selected="True">2,000,000</asp:ListItem>
                                        <asp:ListItem Value="3,000,000">3,000,000</asp:ListItem>
                                        <asp:ListItem Value="4,000,000">4,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                    <label>
                                        aggregate</label>
                                </li>
                                <li>
                                    <label>
                                        Med Pay</label>
                                    <asp:DropDownList ID="ddMedPay" runat="server">
                                        <asp:ListItem Value="1,000">1,000</asp:ListItem>
                                        <asp:ListItem Value="2,000">2,000</asp:ListItem>
                                        <asp:ListItem Value="2,500">2,500</asp:ListItem>
                                        <asp:ListItem Value="3,000">3,000</asp:ListItem>
                                        <asp:ListItem Value="5,000" Selected="True">5,000</asp:ListItem>
                                        <asp:ListItem Value="10,000">10,000</asp:ListItem>
                                        <asp:ListItem Value="15,000">15,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <table border="0">
                                <tr>
                                    <td>
                                        <label>
                                            Pastoral Counseling</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddPCliab" runat="server" Width="90px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                            <asp:ListItem Value="150,000">150,000</asp:ListItem>
                                            <asp:ListItem Value="200,000">200,000</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500,000">500,000</asp:ListItem>
                                            <asp:ListItem Value="750,000">750,000</asp:ListItem>
                                            <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Sexual Misconduct</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddSMMliab" runat="server" Width="90px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="50,000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500,000">500,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Directors & Officers</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddDOliab" runat="server" Width="90px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500,000">500,000</asp:ListItem>
                                            <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Hired/Non-Owned Auto</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddAutoliab" runat="server" Width="90px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500,000">500,000</asp:ListItem>
                                            <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Employee Benefits</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddEBLliab" runat="server" Width="90px" AutoPostBack="true">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="25,000">25,000</asp:ListItem>
                                            <asp:ListItem Value="50,000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Employment Pratices</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddEPLliab" runat="server" Width="90px" AutoPostBack="true">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="25,000">25,000</asp:ListItem>
                                            <asp:ListItem Value="50,000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                           
                            <table border="0">
                                <tr>
                                    <td>
                                        <label>
                                            Misc Legal Defense</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddLegalliab" runat="server" Width="115px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="5,000/15,000">5,000/15,000</asp:ListItem>
                                            <asp:ListItem Value="10,000/30,000">10,000/30,000</asp:ListItem>
                                            <asp:ListItem Value="15,000/45,000">15,000/45,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Violent Acts</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddViolentActs" runat="server" Width="115px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="50k/50k/50k">50k/50k/50k</asp:ListItem>
                                            <asp:ListItem Value="50k/100k/100k">50k/100k/100k</asp:ListItem>
                                            <asp:ListItem Value="50k/300k/300k">50k/300k/300k</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Teachers Professional</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddTeachLiab" runat="server" Width="90px" AutoPostBack="True">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="50,000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300,000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500,000">500,000</asp:ListItem>
                                            <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Corporal Punishment</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddCorpPunish" runat="server" Width="90px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="25,000">25,000</asp:ListItem>
                                            <asp:ListItem Value="50,000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100,000">100,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Lost Wages</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddLostWages" runat="server" Width="90px">
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="1,000">1,000</asp:ListItem>
                                            <asp:ListItem Value="2,000">2,000</asp:ListItem>
                                            <asp:ListItem Value="3,000">3,000</asp:ListItem>
                                            <asp:ListItem Value="4,000">4,000</asp:ListItem>
                                            <asp:ListItem Value="5,000">5,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                       <asp:ObjectDataSource 
                         ID="odsUpdateSmpApp2"
                         TypeName="smci.SqlAccessLayer.MySqlCode" 
                         runat="server" 
                         UpdateMethod="UpdateSmpApplication2">
                            <UpdateParameters>
                            <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />                           
                                <asp:ControlParameter ControlID="ddGLocc" Name="GeneralLiability" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddGLagg" Name="PreOccurance" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddMedPay" Name="MedPay" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddPCliab" Name="PastoralCoun" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddSMMliab" Name="SexualMiscon" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddDOliab" Name="DirectorsOfficers" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddAutoliab" Name="HiredNonOwnAuto" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddEBLliab" Name="EmployeeBenefits" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddEPLliab" Name="EmployeePratice" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddLegalliab" Name="MiscLegalDefense" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="ddViolentActs" Name="ViolentActs" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="ddTeachLiab" Name="TeacherProfessional" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddCorpPunish" Name="CorporalPunishment" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="ddLostWages" Name="LostWages" PropertyName="SelectedValue" Type="Decimal" />
<%--                                <asp:Parameter DefaultValue="No" Name="PropOwned" />
                                <asp:Parameter DefaultValue="No" Name="WhoIsOwner" />
                                <asp:Parameter DefaultValue="No" Name="Daycare" />
                                <asp:Parameter DefaultValue="No" Name="NumOfChild" />
                                <asp:Parameter DefaultValue="No" Name="BgChecks" />
                                <asp:Parameter DefaultValue="No" Name="Playground" />
                                <asp:Parameter DefaultValue="No" Name="PlayFenced" />
                                <asp:Parameter DefaultValue="No" Name="Cemetery" />
                                <asp:Parameter DefaultValue="No" Name="CemFenced" />
                                <asp:Parameter DefaultValue="No" Name="MainProperty" />
                                <asp:Parameter DefaultValue="Blank" Name="CemeteryAddress" />
                                <asp:Parameter DefaultValue="No" Name="Ballfield" />
                                <asp:Parameter DefaultValue="No" Name="Ballfenced" />
                                <asp:Parameter DefaultValue="No" Name="LocChurProp" />
                                <asp:Parameter DefaultValue="Blank" Name="ExpChurchComments" />
                                <asp:Parameter DefaultValue="0" Name="AverageAtten" />
                                <asp:Parameter DefaultValue="No" Name="FiveYearLoss" />
                                <asp:Parameter DefaultValue="01/01/2013" Name="Date1" />
                                <asp:Parameter DefaultValue="Blank" Name="Description1" />
                                <asp:Parameter DefaultValue="0" Name="Amount1" />
                                <asp:Parameter DefaultValue="01/01/2013" Name="Date2" />
                                <asp:Parameter DefaultValue="Blank" Name="Description2" />
                                <asp:Parameter DefaultValue="0" Name="Amount2" />
                                <asp:Parameter DefaultValue="01/01/2013" Name="Date3" />
                                <asp:Parameter DefaultValue="Blank" Name="Description3" />
                                <asp:Parameter DefaultValue="0" Name="Amount3" />
                                <asp:Parameter DefaultValue="01/01/2013" Name="Date4" />
                                <asp:Parameter DefaultValue="Blank" Name="Description4" />
                                <asp:Parameter DefaultValue="0" Name="Amount4" />
                                <asp:Parameter DefaultValue="01/01/2013" Name="Date5" />
                                <asp:Parameter DefaultValue="Blank" Name="Description5" />
                                <asp:Parameter DefaultValue="0" Name="Amount5" />
                                <asp:Parameter DefaultValue="No" Name="OweVehicle" />
                                <asp:Parameter DefaultValue="No" Name="WorkComp" />
                                <asp:Parameter DefaultValue="No" Name="Umbrella" />--%>
                            </UpdateParameters>
                    </asp:ObjectDataSource>
                <%--END STEP 6--%>
                <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep7" runat="server" Title="Underwriting Section">
                <%--STEP 7--%>
                        <h3>Underwriting</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Are the scheduled properties owned by the congregation?</label>
                                    <asp:RadioButtonList ID="rbPropertiesList" runat="server" 
                                        RepeatDirection="Horizontal" AutoPostBack="True">
                                        <asp:ListItem Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If not, who is the owner?</label>
                                    <asp:TextBox ID="txtPropOwner" runat="server" Width="351px" MaxLength="50"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvPropOwner" runat="server" ControlToValidate="txtPropOwner"
                                        Text="*" ErrorMessage="Missing owner of congregation" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Does the church have a daycare or kindergarten?</label>
                                    <asp:RadioButtonList ID="rbActiveSchool" runat="server" 
                                        RepeatDirection="Horizontal" AutoPostBack="True">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>
                                    <label>
                                        Number of children</label>
                                    <asp:TextBox ID="txtSchoolKids" runat="server" Width="54px" MaxLength="3"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvSchoolKids" runat="server" ControlToValidate="txtSchoolKids"
                                        Text="*" ErrorMessage="Please enter number of children." ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If yes, are background checks performed an all employees/volunteers who work with
                                        children?</label>
                                    <asp:RadioButtonList ID="rbBckChecks" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Playground?</label>
                                    <asp:RadioButtonList ID="rbPlayground" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>
                                    <label>
                                        Fenced?</label>
                                    <asp:RadioButtonList ID="rbPlayFenced" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Cemetery?</label>
                                    <asp:RadioButtonList ID="rbCemetery" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>
                                    <label>
                                        Fenced?</label>
                                    <asp:RadioButtonList ID="rbCemFence" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Is the cemetery located on main church property?</label>
                                    <asp:RadioButtonList ID="rbCemeteryLoc" runat="server" 
                                        RepeatDirection="Horizontal" AutoPostBack="True">
                                        <asp:ListItem Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If no, please supply the cemetery's address</label>
                                    <asp:TextBox ID="txtCemeteryAddress" runat="server" MaxLength="120" Width="210px"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvCemeteryAddress" runat="server" ControlToValidate="txtCemeteryAddress"
                                        Text="*" ErrorMessage="Missing address" ForeColor="Red" /></li>
                            </ul>
                            <ul>
                                <li>
                                    <label style="color: Red;">
                                        **If cemetery is at a different address, please list the address in the comments
                                        section.</label>
                                </li>
                            </ul>
                            <ul>
                                <li>--></li>
                                <li>
                                    <label>
                                        Ballfield?</label>
                                    <asp:RadioButtonList ID="rbBallfield" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>--></li>
                                <li>
                                    <label>
                                        Fenced?</label>
                                    <asp:RadioButtonList ID="rbBallFenced" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>--></li>
                                <li>
                                    <label>
                                        Located on church property?</label>
                                    <asp:RadioButtonList ID="rbBallLoc" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Comments or describe any other church-sponsored activities
                                        <br />
                                        <asp:TextBox ID="txtOthAct" runat="server" Width="590px" Height="97px" TextMode="MultiLine"></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Average Attendance</label>
                                    <asp:TextBox ID="txtAvgAtt" runat="server" Width="67px" MaxLength="4"></asp:TextBox>
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
                                    <asp:RadioButtonList ID="rbUnderLoss" runat="server" 
                                        RepeatDirection="Horizontal" AutoPostBack="True">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <%--<asp:Panel ID="Panel1" runat="server">--%>
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
                                            <asp:TextBox ID="txtLossDate7a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDate7a" runat="server" ControlToValidate="txtLossDate7a"
                                                Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDescr7a" runat="server" ControlToValidate="txtLossDescr7a"
                                                Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossAmt7a" runat="server" ControlToValidate="txtLossAmt7a"
                                                Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7b" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7b" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7b" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7c" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7c" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7c" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7d" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7d" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7d" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7e" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7e" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7e" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
  <%--                          </asp:Panel>--%>
                        </div>
                        <h3>
                            Church Automobiles</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Church-owned Vehicle(s)?</label>
                                    <asp:RadioButtonList ID="rbOwnVeh" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Worker's Compensation?</label></li>
                                <asp:RadioButtonList ID="rbWc" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem Selected="True">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Umbrella?</label>
                                    <asp:RadioButtonList ID="rbUmbrella" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                        </div>

                        <asp:ObjectDataSource 
                         ID="odsUpdateSmpApp3"
                         TypeName="smci.SqlAccessLayer.MySqlCode" 
                         runat="server" 
                         UpdateMethod="UpdateSmpApplication3">
                            <UpdateParameters>
                            <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />                           
                                <asp:ControlParameter ControlID="rbPropertiesList" DefaultValue="No" 
                                    Name="PropOwned" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtPropOwner" DefaultValue="No" 
                                    Name="WhoIsOwner" PropertyName="Text" />
                                <asp:ControlParameter ControlID="rbActiveSchool" DefaultValue="No" 
                                    Name="Daycare" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtSchoolKids" DefaultValue="No" 
                                    Name="NumOfChild" PropertyName="Text" />
                                <asp:ControlParameter DefaultValue="No" Name="BgChecks" ControlID="rbBckChecks" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbPlayground" DefaultValue="No" 
                                    Name="Playground" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbPlayFenced" DefaultValue="No" 
                                    Name="PlayFenced" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbCemetery" DefaultValue="No" Name="Cemetery" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbCemFence" DefaultValue="No" Name="CemFenced" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbCemeteryLoc" DefaultValue="No" 
                                    Name="MainProperty" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtCemeteryAddress" DefaultValue="Blank" 
                                    Name="CemeteryAddress" PropertyName="Text" />
                                <asp:ControlParameter ControlID="rbBallfield" DefaultValue="No" 
                                    Name="Ballfield" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbBallFenced" DefaultValue="No" 
                                    Name="Ballfenced" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbBallLoc" DefaultValue="No" 
                                    Name="LocChurProp" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtOthAct" DefaultValue="Blank" 
                                    Name="ExpChurchComments" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtAvgAtt" DefaultValue="0" 
                                    Name="AverageAtten" PropertyName="Text" />
                                <asp:ControlParameter ControlID="rbUnderLoss" DefaultValue="No" 
                                    Name="FiveYearLoss" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtLossDate7a" DefaultValue="01/01/2013" 
                                    Name="Date1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDescr7a" DefaultValue="Blank" 
                                    Name="Description1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossAmt7a" DefaultValue="0" Name="Amount1" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDate7b" DefaultValue="01/01/2013" 
                                    Name="Date2" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDescr7b" DefaultValue="Blank" 
                                    Name="Description2" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossAmt7b" DefaultValue="0" Name="Amount2" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDate7c" DefaultValue="01/01/2013" 
                                    Name="Date3" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDescr7c" DefaultValue="Blank" 
                                    Name="Description3" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossAmt7c" DefaultValue="0" Name="Amount3" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDate7d" DefaultValue="01/01/2013" 
                                    Name="Date4" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDescr7d" DefaultValue="Blank" 
                                    Name="Description4" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossAmt7d" DefaultValue="0" Name="Amount4" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDate7e" DefaultValue="01/01/2013" 
                                    Name="Date5" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossDescr7e" DefaultValue="Blank" 
                                    Name="Description5" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtLossAmt7e" DefaultValue="0" Name="Amount5" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="rbOwnVeh" DefaultValue="No" Name="OweVehicle" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbWc" DefaultValue="No" Name="WorkComp" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="rbUmbrella" DefaultValue="No" Name="Umbrella" 
                                    PropertyName="SelectedValue" />
                            </UpdateParameters>
                    </asp:ObjectDataSource>


                <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
                <%-- END STEP 7--%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep8" runat="server" Title="Pastoral Counseling Liability">
                <%--STEP 8--%>
                        <h3>
                            Supplemental Application for Pastoral Counseling Liability Coverage</h3>
                        <div class="quote_box1">

                            <asp:Panel ID="Panel2" runat="server">
                                <ul>
                                    <li>
                                        <label>
                                            How many employees and/or members are involved in counseling?</label>
                                        <asp:TextBox ID="txtNumEmp" runat="server" MaxLength="4" Width="34px"></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField3" runat="server" />
                                    </li>
                                    <li>
                                        <asp:RequiredFieldValidator ID="rfvNumEmp" runat="server" ControlToValidate="txtNumEmp"
                                            Text="*" ErrorMessage="Missing number of employees" ForeColor="Red" />
                                        <asp:CompareValidator ID="cmpNumEmp" runat="server" ControlToValidate="txtNumEmp"
                                            Type="Double" Operator="GreaterThan" ErrorMessage="Value must be greater than zero"
                                            ForeColor="Red" />
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <label>
                                            Please describe education or training requirements for those involved in counseling:
                                            <br />
                                            <asp:TextBox ID="txtTraining" runat="server" MaxLength="400" Width="464px" Height="60px"
                                                TextMode="MultiLine"></asp:TextBox>
                                        </label>
                                    </li>
                                    <li>
                                        <asp:RequiredFieldValidator ID="rfvTraining" runat="server" ControlToValidate="txtTraining"
                                            Text="*" ErrorMessage="Missing training requirements" ForeColor="Red" />
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <label>
                                            Is counseling provided for a fee?
                                            <br />
                                            <asp:RadioButtonList ID="rbCounFee" runat="server" 
                                            RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </label>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <label>
                                            Are windows installed or doors left open in those rooms where counseling sessions
                                            are conducted?
                                            <br />
                                            <asp:RadioButtonList ID="rbCounRooms" runat="server" 
                                            RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </label>
                                    </li>
                                </ul>
                            </asp:Panel>
                            <ul>
                                <li>
                                    <label>
                                        Have there been any losses or allegations in the past?
                                        <br />
                                        <asp:RadioButtonList ID="rbAllegations" runat="server" 
                                        RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If question 5 answered "Yes", please explain:
                                        <br />
                                        <asp:TextBox ID="txtExplain" runat="server" MaxLength="8000" Width="607px" Height="133px"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </label>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvExplain" ControlToValidate="txtExplain" runat="server"
                                        Text="*" ErrorMessage="Missing explanation." ForeColor="Red" /></li>
                            </ul>
                        </div>
                <asp:ValidationSummary ID="ValidationSummary5" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />

                <asp:ObjectDataSource 
                     ID="odsInsertPastoral" 
                     runat="server" 
                     InsertMethod="InsertPastoralInfo"
                     TypeName="smci.SqlAccessLayer.MySqlCode"> 
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" ControlID="HiddenField2" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter Name="NumOfMembers" ControlID="txtNumEmp" PropertyName="Text" Type="String" />
                        <asp:ControlParameter Name="ExpCounseling" ControlID="txtTraining" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter Name="CounselingFee" ControlID="rbCounFee" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter Name="CounselingRooms" ControlID="rbCounRooms" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter Name="Allegations" ControlID="rbAllegations" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter Name="ExpAllegations" ControlID="txtExplain" PropertyName="Text" Type="String" />
                    </InsertParameters>
               </asp:ObjectDataSource>


                <%--END STEP 8--%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep9" runat="server" Title="Sexual Misconduct Liability">
                <%--STEP 9--%>
                        <h3>
                            Supplemental Application for Sexual Misconduct & Molestation Liability Coverage</h3>
                        <div class="quote_box1">
                            <table border="0" width="800px">
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Does the church have a formal sexual misconduct policy in place?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbMisconduct" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Are references required and background checks performed for all potential employees
                                            and volunteers?</label>
                                    </td>
                                    <td>
                                       <asp:RadioButtonList ID="rbReference" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Has a background check been obtained on all current employees?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbBckGrdCheck" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Is there at least a six month waiting period before any new volunteers can work
                                            with children?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbWait" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Are two adults required whenever children are being supervised?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbSupervised" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Are windows installed and/or doors left open in nurseries and those rooms where
                                            other youth activities take place?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbOtherAct" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Have any charges of sexual misconduct or sexual molestation ever been brought against
                                            any employees or volunteers?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbCharges" runat="server" RepeatDirection="Horizontal" 
                                            AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <ul>
                                <li>
                                    <label>
                                        If question 7 answered "Yes", please explain:
                                        <br />
                                        <asp:TextBox ID="txtExplainCharges" runat="server" MaxLength="8000" Width="574px"
                                            Height="133px" TextMode="MultiLine"></asp:TextBox>
                                    </label>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvExplainCharges" ControlToValidate="txtExplainCharges"
                                        runat="server" Text="*" ErrorMessage="Missing explanation" ForeColor="Red" />
                                </li>
                            </ul>
                        </div>

                <asp:ObjectDataSource 
                     ID="odsSexMiscon"
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     runat="server" 
                     InsertMethod="InsertSexMisconduct">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" ControlID="HiddenField2" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="rbMisconduct" Name="Miscon" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbReference" Name="Perfom" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbBckGrdCheck" Name="Allbg" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbWait" Name="Sixmonth" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbSupervised" Name="ReqAdult" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbOtherAct" Name="Installedwin" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbCharges" Name="Misconchar" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtExplainCharges" Name="Expmiscon" PropertyName="Text" Type="String" />
                    </InsertParameters>
               </asp:ObjectDataSource>

                <%--END STEP 9--%>
                <asp:ValidationSummary ID="ValidationSummary6" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep10" runat="server" Title="Directors, Officers &amp; Trustees Liability">
                <%--STEP 10--%>
                        <h3>
                            Supplemental Application for Directors, Officers & Trustees Liability Coverage</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        How are directors established?</label>
                                    <asp:TextBox ID="txtDirEst" runat="server" Width="282px" MaxLength="60"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvDirEst" runat="server" ControlToValidate="txtDirEst"
                                        Text="*" ErrorMessage="Missing directors established." ForeColor="Red" />
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        How often are directors rotated?</label>
                                    <asp:TextBox ID="txtRotated" runat="server" Width="266px" MaxLength="40"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvRotated" runat="server" ControlToValidate="txtRotated"
                                        Text="*" ErrorMessage="Missing directors rotated." ForeColor="Red" />
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Have there been any losses in the past?</label>
                                    <asp:RadioButtonList ID="rbLostCoverage" runat="server" 
                                        RepeatDirection="Horizontal" AutoPostBack="True">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If question 3 answered "Yes", please explain:
                                        <br />
                                        <asp:TextBox ID="txtExplainLosses" runat="server" Width="578px" MaxLength="8000"
                                            Height="133px" TextMode="MultiLine"></asp:TextBox>
                                    </label>
                                </li>
                                <li>
                                    <asp:RequiredFieldValidator ID="rfvExpLoss" runat="server" ControlToValidate="txtExplainLosses"
                                        Text="*" ErrorMessage="Missing explanation." ForeColor="Red" />
                                </li>
                            </ul>
                        </div>
                <%--END STEP 10--%>
                <asp:ObjectDataSource 
                     ID="odsSupCoverage" 
                     runat="server" 
                     InsertMethod="InsertSupplementCoverage" 
                     SelectMethod="GetSpecificBuilding" 
                     TypeName="smci.SqlAccessLayer.MySqlCode">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" ControlID="HiddenField2" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="txtDirEst" Name="EstDirect" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtRotated" Name="RotateDirect" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbLostCoverage" Name="PastLosses" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtExplainLosses" Name="ExpLosses" 
                            PropertyName="Text" Type="String" />
                    </InsertParameters>
               </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary7" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep16" runat="server" Title="Employment Pratices Liability">
                <%--STEP 16--%>

                        <h3>
                            Employment Practices Liability Supplemental Application</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td class="column_epl">
                                        <p>
                                            Total number of employees (include part-time and full-time)?</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalEmployees" runat="server" MaxLength="3" Width="27px"></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField4" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvTotalEmployees" runat="server" ControlToValidate="txtTotalEmployees"
                                            Text="*" ErrorMessage="Need number of employees" ForeColor="Red" />
                                        <asp:CompareValidator ID="cmpTotalEmp" runat="server" ControlToValidate="txtTotalEmployees"
                                            Type="Double" Operator="GreaterThan" ErrorMessage="Value must be greater than zero"
                                            ForeColor="Red" ValueToCompare="0" />
                                    </td>
                                    <td class="style3">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Do you have an employee handbook or printed policy statements on sexual harassment
                                            and anti-discrimination?</p>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbEmployee" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Are the policy statements and/or handbook distributed to all employees at time of
                                            hire?</p>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbTimeOfHire" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Do you obtain written acknowledgement from each employee at the time of hire, and
                                            when updates are made, that they have received and read the statements and/or handbook?</p>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbWrittenState" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Do you use a formal, standardized application for employeement that has been reviewed
                                            by a qualified attorney?</p>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbFormApp" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Are all employees given an annual performance review?</p>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbAnnualReview" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Do you maintain written records of all performance reviews and diciplinary actions?</p>
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbMainRec" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                            <table border="0">
                                <tr>
                                    <td class="column_epl">
                                        Are any drugs test given and, if so, under what circumstances?
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbDrugTest" runat="server" 
                                            RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                     <td>
                                        Please provide details if &quot;yes&quot;.
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>                                  
                                    <td colspan="2">
                                        <asp:TextBox ID="txtDrugs" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvDrugs" runat="server" Text="*" ControlToValidate="txtDrugs" ErrorMessage="Must answer if yes" ForeColor="Red" />
                                        <br />
                                        <br />
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        How many employees have been terminated in the last 5 years?
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtNumTerm" runat="server" MaxLength="2" Width="45px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNumTerm" runat="server" ControlToValidate="txtNumTerm"
                                            Text="*" ErrorMessage="Need number of terminated employees" ForeColor="Red" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Have there been an employees practices claims in the past?
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbPraticeClaims" runat="server" 
                                            RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Please provide details if &quot;yes&quot;.
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtExtra" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvExtra" runat="server" ControlToValidate="txtExtra"
                                            Text="*" ErrorMessage="If yes please explain." ForeColor="Red" />
                                        <br />
                                        <br />
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Are you aware of any circumstance that might give rise to a claim?
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbRiseClaim" runat="server" 
                                            RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Please provide details if &quot;yes&quot;.
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtClaim" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvClaim" runat="server" ControlToValidate="txtClaim"
                                            Text="*" ErrorMessage="If yes please explain." ForeColor="Red" />
                                        <br />
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Was prior coverage ever cancelled or non-renewed?
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="rbPriorCoverage" runat="server" 
                                            RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Please provide details if &quot;yes&quot;.
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtCancelled" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rfvCancelled" runat="server" ControlToValidate="txtCancelled"
                                            Text="*" ErrorMessage="If yes please explain." ForeColor="Red" />
                                    </td>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>

                <asp:ObjectDataSource 
                     ID="odsEmployeePractice" 
                     runat="server" 
                     InsertMethod="InsertEmployeePratice" 
                     TypeName="smci.SqlAccessLayer.MySqlCode">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" ControlID="HiddenField2" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="txtTotalEmployees" Name="NumOfEmp" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbEmployee" Name="EmpHandbook" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbTimeOfHire" Name="DistribToAll" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbWrittenState" Name="WrittenStatement" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbFormApp" Name="FormalApp" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbAnnualReview" Name="AnnualReview" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbMainRec" Name="MaintainRecords" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbDrugTest" Name="DrugTest" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtNumTerm" Name="NumTerminated" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbPraticeClaims" Name="PraticeClaims" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtExtra" Name="ExpPraticesClaims" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbRiseClaim" Name="RiseToClaim" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtClaim" Name="ExpRiseToClaim" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbPriorCoverage" Name="PriorCoverage" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtCancelled" Name="ExpPriorCoverage" 
                            PropertyName="Text" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary13" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
                <%--END STEP--%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep17" runat="server" Title="Teachers Professional Liability">
                <%--STEP 17--%>
                        <h3>
                            Teachers Professional Liability And Corporal Punishment Supplement</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td>
                                        <h3>
                                            Grades taught:</h3>
                                    </td>
                                    <td>
                                        <label>
                                            Grades:</label>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="lstGrades1" runat="server" Rows="1" Width="87px" 
                                            SelectionMode="Multiple">
                                            <asp:ListItem Selected="True">K3</asp:ListItem>
                                            <asp:ListItem>K4</asp:ListItem>
                                            <asp:ListItem>K5</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                        </asp:ListBox>
                                    </td>
                                    <td>
                                        <label>
                                            through:</label>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="lstGrades2" runat="server" Rows="1" Width="87px" SelectionMode="Multiple">
                                            <asp:ListItem Selected="True">K3</asp:ListItem>
                                            <asp:ListItem>K4</asp:ListItem>
                                            <asp:ListItem>K5</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                        </asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                            <hr />
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            Maxium enrollment or capacity in school:</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCapacity" MaxLength="4" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvCapacity" ControlToValidate="txtCapacity" runat="server" Text="*" ErrorMessage="Missing the value capacity" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Average number enrolled each year</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEnrolled" MaxLength="4" runat="server" />
                                         <asp:RequiredFieldValidator ID="rfvEnrolled" ControlToValidate="txtEnrolled" runat="server" Text="*" ErrorMessage="Missing number enrolled" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Date school started:</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSchoolStarted" runat="server" MaxLength="10" />
                                        <asp:RegularExpressionValidator ID="revSchool" ControlToValidate="txtSchoolStarted"
                                            runat="server" Text="*" ForeColor="Red" ErrorMessage="Date formate should be mm/dd/yyyy"
                                            ValidationExpression="^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <hr />
                            <h4>
                                List number of staff members by categories as follows:</h4>
                            <br />
                            <table border="0" cellpadding="0" cellspacing="0" width="650">
                                <tr>
                                    <td>
                                        <label>
                                            Professional</label>
                                    </td>
                                    <td>
                                        <label>
                                            Full-time</label>
                                    </td>
                                    <td>
                                        <label>
                                            Part-time</label>
                                    </td>
                                    <td>
                                        <label>
                                            Volunteer</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style5">
                                        <label>
                                            Teachers with degrees</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull1" runat="server" MaxLength="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                                            ErrorMessage="Teachers with degrees?" ForeColor="Red" ControlToValidate="txtFull1"
                                            ValidationGroup="WithDegrees" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart1" runat="server" MaxLength="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                                            ErrorMessage="Teachers with degrees?" ForeColor="Red" ControlToValidate="txtPart1"
                                            ValidationGroup="WithDegrees" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer1" runat="server" MaxLength="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*"
                                            ErrorMessage="Teachers with degrees?" ForeColor="Red" ControlToValidate="txtVolunteer1"
                                            ValidationGroup="WithDegrees" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Teachers without degrees</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull2" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart2" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer2" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Teachers Aides</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull3" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart3" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer3" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Counselors</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull4" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart4" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer4" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Nurses</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull5" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart5" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer5" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Other Administrative Staff</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull6" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart6" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer6" runat="server" MaxLength="4"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <hr />
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            Is there a formal written procedure for evaluating a teacher's performance?</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbTeacherPerform" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            What criteria is used to evaluate the teacher (observation, test scores, etc.)</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCriteria" runat="server" Height="60px" TextMode="MultiLine" Width="265px"
                                            MaxLength="125" />
                                        <asp:RequiredFieldValidator ID="rfvCriteria" ControlToValidate="txtCriteria" runat="server" Text="*" ErrorMessage="Missing criteria value" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Are standardized learning skills tests administered to evalute your students</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbEvalute" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Are the test results shared with parents?</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbResults" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            If a child underperforms in an area, are parents involved in the action plan to
                                            improve the childs performance?</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbImprovePerform" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <hr />
                            <h4>
                                Does the school have written policies and/or procedures regarding students in the
                                following areas:</h4>
                            <div id="table1">
                                <table border="0">
                                    <tr>
                                        <td class="style6">
                                            <label>
                                                Suspension</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbSuspen" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <label>
                                                Dismissal</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbDismiss" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <label>
                                                Sexual Harassment</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbSexHarass" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <label>
                                                Student Aggression</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbStudentAggres" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="table2">
                                <table border="0">
                                    <tr>
                                        <td class="style7">
                                            <label>
                                                Promotion</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbPromotion" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            <label>
                                                Acceptance</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbAccept" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            <label>
                                                Drug Testing</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbDrugTesting" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            <label>
                                                Weapons</label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbWeapons" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="clear: both;">
                            </div>
                            <br />
                            <hr />
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            Does the school have a written policy that prohibits corporal punishment?</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbWrittenPolicy" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Are parents informed of all rules, policies, and procedures prior to enrollment?</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbPriorEnroll" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Have there been any liability claims against the school or staff in the past?</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbAgainSchool" runat="server" 
                                            RepeatDirection="Horizontal" AutoPostBack="True">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            If yes, please describe claim and ammount paid</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtExpAmountPaid" runat="server" Height="49px" MaxLength="150" TextMode="MultiLine"
                                            Width="268px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvExpAmountPaid" ControlToValidate="txtExpAmountPaid" runat="server" Text="*" ErrorMessage="Missing amount paid" ForeColor="Red" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                <asp:ObjectDataSource 
                     ID="odsTeachersLiability" 
                     TypeName="smci.SqlAccessLayer.MySqlCode"
                     runat="server" 
                     InsertMethod="InsertTeacherLiability">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" ControlID="HiddenField2" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="lstGrades1" Name="GradesStart" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="lstGrades2" Name="GradesEnd" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtCapacity" Name="MaxEnrollment" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtEnrolled" Name="AveNumEnrolled" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtSchoolStarted" Name="DateEstablished" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtFull1" Name="WithDegreeFull" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPart1" Name="WithDegreePart" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtVolunteer1" Name="WithDegreeVol" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFull2" Name="WithoutDegreeFull" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPart2" Name="WithoutDegreePart" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtVolunteer2" Name="WithoutDegreeVol" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFull3" Name="TeacherAidFull" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPart3" Name="TeacherAidPart" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtVolunteer3" Name="TeacherAidVol" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFull4" Name="CounselorsFull" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPart4" Name="CounselorsPart" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtVolunteer4" Name="CounselorsVol" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFull5" Name="NursesFull" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPart5" Name="NursesPart" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtVolunteer5" Name="NursesVol" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFull6" Name="OtherAdminFull" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtPart6" Name="OtherAdminPart" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtVolunteer6" Name="OtherAdminVol" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="rbTeacherPerform" Name="TeachersPerform" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtCriteria" Name="ExpCriteria" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbEvalute" Name="EvaluteStudents" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbResults" Name="ResultsShared" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbImprovePerform" Name="ImprovePerform" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbSuspen" Name="Suspension" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbDismiss" Name="Dismissal" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbSexHarass" Name="SexHarass" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbStudentAggres" Name="StudentAggres" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbPromotion" Name="Promotion" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbAccept" Name="Acceptance" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbDrugTesting" Name="DrugTesting" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbWeapons" Name="Weapons" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbWrittenPolicy" Name="WrittenPolicy" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbPriorEnroll" Name="PriorEnrollment" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbAgainSchool" Name="AgainstSchool" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtExpAmountPaid" Name="ExpClaim" 
                            PropertyName="Text" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary12" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
                <%--END STEP 17--%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep11" runat="server" Title="Business Auto">
                <%--STEP 11--%>

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
                                    <asp:RadioButtonList ID="rbBaLoss" runat="server" RepeatDirection="Horizontal">
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
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
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

                <asp:ValidationSummary ID="ValidationSummary8" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep12" runat="server" Title="Vehicle Information">
                <%--STEP 12--%>

<%--                        <script type="text/javascript">
                            function showInsert() {
                                var divInsert = document.getElementById('divInsert');
                                divInsert.style.display = 'block';
                            }
                            function hideInsert() {
                                var divInsert = document.getElementById('divInsert');
                                divInsert.style.display = 'none';
                            }
                        </script>--%>
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
                     UpdateMethod="UpdateVehicle"
                     TypeName="smci.SqlAccessLayer.MySqlCode">
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
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
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

                <%-- END STEP 12--%>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep13" runat="server" Title="Workers Compensation - A">
                <%--STEP 13--%>

                        <h3>
                            Workers Compensation application</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td>
                                        <label>
                                            Federal Employer ID Number</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFEIN" runat="server" Width="186px" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFEIN" runat="server" ControlToValidate="txtFEIN"
                                            Text="*" ErrorMessage="Missing FEIN" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Current Carrier</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPriorCarrier" runat="server" Width="287px" MaxLength="40"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPriorCarrier" runat="server" ControlToValidate="txtPriorCarrier"
                                            Text="*" ErrorMessage="Missing current carrier" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Current Premium</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWcCurrPrem" runat="server" Width="90px" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvWcCurrPrem" runat="server" ControlToValidate="txtWcCurrPrem"
                                            Text="*" ErrorMessage="Missing current premium" ForeColor="Red" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <h3>
                            Rating Information</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td class="style1">
                                        <b>
                                            <label>
                                                Codes and Classifications</label></b>
                                    </td>
                                    <td>
                                        <b>
                                            <label>
                                                Number of Employees</label></b>
                                    </td>
                                    <td>
                                        <b>
                                            <label>
                                                Estimated Annual Renumeration</label></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Church/School Professional Employees</label>
                                        <p>
                                            (Minister(include salary, housing, car/travel allowance), Secretaries, Musicians,
                                            Kindergarten, School Teachers)</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProfEmpNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProfEmpPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Church/School All Other Employees</label>
                                        <p>
                                            (Janitor, Maid, Cooks, Yard Maintenance)</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAllOthNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAllOthPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Day Care Professional Employees</label>
                                        <p>
                                            (Teachers, Nursery Workers, Aides)</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDayProNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDayProPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Day Care All Other Employees</label>
                                        <p>
                                            (Janitor, Maid, Cooks, Yard Maintenance, Drivers)</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDayOthNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDayOthPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Drivers, Chauffeurs, and their helpers</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDriverNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDriverPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Other-Specify</label>
                                        <asp:TextBox ID="txtOtherDescr" runat="server" Width="215px" MaxLength="50"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOtherNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOtherPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>

                <%--  END STEP 13--%>
                <asp:ObjectDataSource 
                     ID="odsWorkersCompA" 
                     runat="server" 
                     InsertMethod="InsertWcApplication" 
                     TypeName="smci.SqlAccessLayer.MySqlCode">
                    <InsertParameters>
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                        <asp:ControlParameter ControlID="txtFEIN" Name="FID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPriorCarrier" Name="CurrentCarrier" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtWcCurrPrem" Name="CurrentWcPremium" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtProfEmpNum" Name="CodesClassNOE1" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtProfEmpPay" Name="CodesClassEAR1" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtAllOthNum" Name="CodesClassNOE2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtAllOthPay" Name="CodesClassEAR2" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtDayProNum" Name="CodesClassNOE3" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDayProPay" Name="CodesClassEAR3" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtDayOthNum" Name="CodesClassNOE4" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDayOthPay" Name="CodesClassEAR4" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtDriverNum" Name="CodesClassNOE5" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDriverPay" Name="CodesClassEAR5" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtOtherNum" Name="CodesClassNOE6" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtOtherPay" Name="CodesClassEAR6" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtOtherDescr" Name="ExpCodesClass" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="Watercraft" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="Engaged" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="SubContractor" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="SafetyProgram" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="UnderSixteen" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="OverSixtyfive" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="Handicap" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="Travel" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="ReqPhysicals" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="Transportation" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="PriorCoverage" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="ExpComments" Type="String" DefaultValue="Blank" />
                        <asp:Parameter Name="PastLoss" Type="String" DefaultValue="No" />
                        <asp:Parameter Name="PastLossDate1" Type="DateTime" DefaultValue="01/01/2013" />
                        <asp:Parameter Name="PastLossDescr1" Type="String" DefaultValue="Blank" />
                        <asp:Parameter Name="PastLossAmount1" Type="Decimal" DefaultValue="0.00" />
                        <asp:Parameter Name="PastLossDate2" Type="DateTime" DefaultValue="01/01/2013" />
                        <asp:Parameter Name="PastLossDescr2" Type="String" DefaultValue="Blank" />
                        <asp:Parameter Name="PastLossAmount2" Type="Decimal" DefaultValue="0.00" />
                        <asp:Parameter Name="PastLossDate3" Type="DateTime" DefaultValue="01/01/2013" />
                        <asp:Parameter Name="PastLossDescr3" Type="String" DefaultValue="Blank" />
                        <asp:Parameter Name="PastLossAmount3" Type="Decimal" DefaultValue="0.00" />
                        <asp:Parameter Name="PastLossDate4" Type="DateTime" DefaultValue="01/01/2013" />
                        <asp:Parameter Name="PastLossDescr4" Type="String" DefaultValue="Blank" />
                        <asp:Parameter Name="PastLossAmount4" Type="Decimal" DefaultValue="0.00" />
                        <asp:Parameter Name="PastLossDate5" Type="DateTime" DefaultValue="01/01/2013" />
                        <asp:Parameter Name="PastLossDescr5" Type="String" DefaultValue="Blank" />
                        <asp:Parameter Name="PastLossAmount5" Type="Decimal" DefaultValue="0.00" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Name="ddate" Type="DateTime" />
                        <asp:Parameter Name="RequestNumber" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary9" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep14" runat="server" Title="Workers Compensation - B">
                <%--STEP 14--%>
                        <h3>
                            General Information</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Does applicant own, operate or lease air/watercraft?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbOperate" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Is applicant engaged in any other type of business?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbEngage" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Are sub-contractors used?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbSubContractor" runat="server" 
                                            RepeatDirection="Horizontal" Height="27px">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Is a formal safety program in operation?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbSafety" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Any employees under 16 years of age?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbUnderAge" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Any employees over 65 years of age?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbOverAge" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Any employees with physical handicaps?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbHanicap" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Do employees travel out of state?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbTravelOutState" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Are pre-employment physicals required?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbReqPhysicals" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Does applicant provide transportation for school, day care, or kindergarten?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbProvideTrans" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Any prior coverage declined/canceled/non-renewed in the last five years?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbPriorCover" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <ul>
                                <li>
                                    <label>
                                        Please explain all YES responses or place other comments below:
                                        <br />
                                        <asp:TextBox ID="txtExplYes" runat="server" Height="116px" Width="558px" MaxLength="8000"></asp:TextBox>
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
                                    <asp:RadioButtonList ID="rbWcLoss" runat="server" RepeatDirection="Horizontal" 
                                        AutoPostBack="True">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
<%--                            <asp:Panel ID="Panel4" runat="server">--%>
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
                                            <asp:TextBox ID="txtLossDate14a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDate14a" runat="server" ControlToValidate="txtLossDate14a"
                                                Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossDescr14a" runat="server" ControlToValidate="txtLossDescr14a"
                                                Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLossAmt14a" runat="server" ControlToValidate="txtLossAmt14a"
                                                Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14b" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14b" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14b" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14c" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14c" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14c" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14d" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14d" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14d" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14e" runat="server" Width="75px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14e" runat="server" Width="400px" MaxLength="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14e" runat="server" Width="75px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
<%--                            </asp:Panel>--%>
                        </div>
                <%--END STEP 14--%>
                <asp:ObjectDataSource 
                     ID="odsWorkersCompB" 
                     runat="server"
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     UpdateMethod="UpdateWcApplication">
                    <UpdateParameters>
                        <asp:ControlParameter Name="RequestNumber" Type="Int32"  ControlID="HiddenField2" PropertyName="Value" />
                        <asp:ControlParameter ControlID="rbOperate" Name="Watercraft" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbEngage" Name="Engaged" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbSubContractor" Name="SubContractor" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbSafety" Name="SafetyProgram" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbUnderAge" Name="UnderSixteen" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbOverAge" Name="OverSixtyfive" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbHanicap" Name="Handicap" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbTravelOutState" Name="Travel" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbReqPhysicals" Name="ReqPhysicals" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbProvideTrans" Name="Transportation" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbPriorCover" Name="PriorCoverage" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtExplYes" Name="ExpComments" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbWcLoss" Name="PastLoss" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtLossDate14a" Name="PastLossDate1" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr14a" Name="PastLossDescr1" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt14a" Name="PastLossAmount1" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate14b" Name="PastLossDate2" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr14b" Name="PastLossDescr2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt14b" Name="PastLossAmount2" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate14c" Name="PastLossDate3" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr14c" Name="PastLossDescr3" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt14c" Name="PastLossAmount3" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate14d" Name="PastLossDate4" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr14d" Name="PastLossDescr4" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt14d" Name="PastLossAmount4" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate14e" Name="PastLossDate5" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr14e" Name="PastLossDescr5" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt14e" Name="PastLossAmount5" PropertyName="Text" Type="Decimal" />
                    </UpdateParameters>
                </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary10" runat="server" ShowMessageBox="True" ShowSummary="False" />

            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep15" runat="server" Title="Umbrella">
                <%--STEP 15--%>
                        <h3>
                            Umbrella Application</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Limit of Liability</label></li>
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
                                    <asp:RequiredFieldValidator ID="rfvUmPriorCarrier" runat="server" ControlToValidate="txtPriorCarrier"
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
                        <asp:ControlParameter ControlID="ddLimit" Name="LimitOfLiability" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="rbOwnAuto" Name="Automobiles" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="rbWcPolicy" Name="WorkersComp" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtUmPriorCarrier" Name="CurrentCarrier" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPriorPrem" Name="CurrentUmPrem" 
                            PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtUmExpComments" Name="ExpComments" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rbUmLoss" Name="PastLoss" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtLossDate15a" Name="PastLossDate1" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15a" Name="PastLossDescr1" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15a" Name="PastLossAmount1" 
                            PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15b" Name="PastLossDate2" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15b" Name="PastLossDescr2" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15b" Name="PastLossAmount2" 
                            PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15c" Name="PastLossDate3" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15c" Name="PastLossDescr3" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15c" Name="PastLossAmount3" 
                            PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15d" Name="PastLossDate4" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15d" Name="PastLossDescr4" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15d" Name="PastLossAmount4" 
                            PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="txtLossDate15e" Name="PastLossDate5" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtLossDescr15e" Name="PastLossDescr5" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLossAmt15e" Name="PastLossAmount5" 
                            PropertyName="Text" Type="Decimal" />
                    </InsertParameters>
               </asp:ObjectDataSource>

                <asp:ValidationSummary ID="ValidationSummary11" runat="server" ShowMessageBox="True"
                    ShowSummary="False" />
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep19" runat="server" Title="Process Application" StepType="Finish">
                <p>
                    Test</p>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep18" runat="server" Title="Log">
                <%--STEP 18--%>
                <fieldset>
                    <legend>Quote Request Log</legend>
                    <div class="quote_box1">
                        <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Data At This Time.">
                        </asp:GridView>
                    </div>
                </fieldset>
                <%--END STEP 18--%>
                </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</div>

