<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Quote_Request_WC.ascx.vb" Inherits="WizardSteps_Quote_Request_WC" %>

<script type="text/javascript">
    function showInsert() {
        var divInsert = document.getElementById('divInsert');
        divInsert.style.display = 'block';
    }
    function hideInsert() {
        var divInsert = document.getElementById('divInsert');
        divInsert.style.display = 'none';
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
        <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" Visible="False" />
        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" onclick="StepNextButton_Click" />
    </StepNavigationTemplate>

    <WizardSteps>

<%--STEP 16--%>

     <%--STEP 17--%>   
    <asp:WizardStep ID="WizardStep1" runat="server" Title="General Information" StepType="Step">
     <%-- STEP 1--%>
  
<h3>Quote Request Form</h3>
 <div class="quote_box1">        
    <ul>
      <li><label>Agency</label>
      </li>
      <li>
      <asp:TextBox ID="txtAgency" runat="server" Width="348px" ReadOnly="true" />
      </li>
     </ul> 
     <ul>
        <li>
         <label>Agency Number</label>
            <asp:TextBox ID="txtAgentNum" runat="server" ReadOnly="true"></asp:TextBox>
          <label>Agent</label>
         <asp:TextBox ID="txtAgentName" runat="server" ReadOnly="true" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
      </li>
    </ul>
    <ul>
      <li><label>Agent Email 1</label></li>
      <li><asp:TextBox ID="txtAgentEmail" runat="server" Width="305px" MaxLength="75" /></li>
      <li><asp:RequiredFieldValidator ID="rfvAgentEmail" runat="server" ControlToValidate="txtAgentEmail" Text="*" ErrorMessage="Missing Email"  ForeColor="Red" /></li>
    </ul>
    <ul>
      <li><label>Agent Email 2</label></li>
      <li><asp:TextBox ID="txtAgentEmail2" runat="server" Width="305px" MaxLength="75" /></li>     
    </ul>
    <ul>
      <li>
       <label>Church Name:</label>
      </li>
      <li>
        <asp:TextBox ID="txtChName" runat="server" Width="304px" MaxLength="180"></asp:TextBox>
      </li>
      <li><asp:RequiredFieldValidator ID="rfvChurchName" runat="server" ControlToValidate="txtChName" Text="*" ErrorMessage="Missing Church Name"  ForeColor="Red" /></li>
    </ul>
     <ul>
      <li>
        <label>Mailing Address</label> 
      </li>
      <li>
        <asp:TextBox ID="txtMailAddr" runat="server" Width="200px" MaxLength="40"></asp:TextBox>  
      </li>
      <li><asp:RequiredFieldValidator ID="rfvMailAddr" runat="server" Text="*" ControlToValidate="txtMailAddr" ErrorMessage="Missing Mailing Address"  ForeColor="Red" /></li>
    </ul>
    <ul>
      <li>
         <label>Mailing City</label>
         <asp:TextBox ID="txtMailCity" runat="server" MaxLength="25"></asp:TextBox>
      </li>
      <li><asp:RequiredFieldValidator ID="rfvMailCity" runat="server" ControlToValidate="txtMailCity" Text="*" ErrorMessage="Missing City"  ForeColor="Red" /></li>
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
       <label>Zip Code</label>
       <asp:TextBox ID="txtMailZip" runat="server" MaxLength="5" Width="116px"></asp:TextBox>
      </li>
      <li><asp:RequiredFieldValidator ID="rfvMailZip" runat="server" ControlToValidate="txtMailZip" Text="*" ErrorMessage="Missing Zip"  ForeColor="Red" /></li>
    </ul>
    <ul>
      <li>
        <label>Church Website</label>
      </li>
      <li>
        <asp:TextBox ID="txtWebAddr" runat="server" MaxLength="50" Width="194px"></asp:TextBox>
      </li>
    </ul>
    <ul>
      <li>
        <label>Current Carrier:</label>
        <asp:TextBox ID="txtCarrier" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
      </li>
      <li><asp:RequiredFieldValidator ID="rfvCarrier" runat="server" ControlToValidate="txtCarrier" Text="*" ErrorMessage="Missing Current Carrier"  ForeColor="Red" /></li>
      <li><asp:CheckBox ID="chbCarrier" runat="server" AutoPostBack="true" OnCheckedChanged="chbCarrier_CheckedChanged" Text="No Current Carrier" />
      </li>
      <li>
         <label>Ex. Date:</label>
        <asp:TextBox ID="txtExDate" runat="server" MaxLength="10"></asp:TextBox>
      </li>
      <li><asp:RequiredFieldValidator ID="rfvExDate" runat="server" ControlToValidate="txtExDate" Text="*" ErrorMessage="Missing Ex. Date"  ForeColor="Red" /></li>
      <li><asp:RegularExpressionValidator ID="revExDate" runat="server" ControlToValidate="txtExDate" Text="*" ErrorMessage="Date Format Should be MM/DD/YYYY" ValidationExpression="^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$"  ForeColor="Red" /></li>
    </ul>
    <ul>
      <li></li>
      <li>
        <label>Current SMP Premium</label>
        <asp:TextBox ID="txtPrem" runat="server" MaxLength="10"></asp:TextBox>
      </li>
    </ul>
    <ul>
    <li>
     <p>
        Has any policy or coverage been declined, cancelled or non-renewed during the prior 3 years?       
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
         <p>If yes, please provide a detailed explanation in the Property Comments on the next screen.</p>
        </li>
    </ul>
    <ul>
     <li><asp:TextBox ID="txtComments1" runat="server" Height="60px" TextMode="MultiLine" Width="450px"></asp:TextBox></li>
     <li><asp:RequiredFieldValidator ID="rfvPrePolicyComments" runat="server" ControlToValidate="txtComments1" Text="*" ErrorMessage="Missing Comments"  ForeColor="Red" /></li>
    </ul>
    <ul>
     <li>
       <label>Contact Person</label>
       <asp:TextBox ID="txtChContact" runat="server" MaxLength="40" Width="180px"></asp:TextBox>
     </li>
     <li><asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtChContact" Text="*" ErrorMessage="Missing Contact"  ForeColor="Red" /></li>
     </ul>
     <ul>
     <li>
       <label>Phone 1</label>
       <asp:TextBox ID="txtPhone1" runat="server" MaxLength="12"></asp:TextBox>
     </li>
     <li><asp:RequiredFieldValidator ID="rfvPhone1" runat="server" ControlToValidate="txtPhone1" Text="*" ErrorMessage="Missing Phone Number."  ForeColor="Red" /></li>
     <li><asp:RegularExpressionValidator ID="revPhone1" runat="server" ControlToValidate="txtPhone1" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Text="*" ErrorMessage="Phone should be in this format XXX-XXX-XXXX."  ForeColor="Red" /></li>
     <li>
       <label>Phone 2</label>
       <asp:TextBox ID="txtPhone2" runat="server" MaxLength="12"></asp:TextBox>
     </li>
     <li><asp:RegularExpressionValidator ID="revPhone2" runat="server" ControlToValidate="txtPhone2" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Text="*" ErrorMessage="Phone should be in this format -XXX-XXX-XXXX."  ForeColor="Red" /></li>
    </ul>
    <ul>
     <li>
       <label>Mortgagee/Loss Payee</label>
       <asp:TextBox ID="txtMortgLP" runat="server" Width="275px" MaxLength="50"></asp:TextBox>
      </li>
     </ul>
      <ul>
     <li>
       <label>Is this church incorporated?</label>
            <asp:RadioButtonList ID="rbIncList" runat="server" Text='<%# Bind("Incorporated") %>' RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem Selected="True">No</asp:ListItem>
            </asp:RadioButtonList>
     </li>
    </ul>
  </div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />

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

    <%--END STEP 1    --%>        
</asp:WizardStep>
    <asp:WizardStep ID="WizardStep2" runat="server" Title="Workers Compensation - A">

    <%--STEP 13--%>

                        <h3>
                            Workers Compensation application</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td>
                                        <label>
                                            Federal Employer ID Number</label>
                                            <asp:HiddenField ID="HiddenField2" runat="server" />
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
    <asp:WizardStep ID="WizardStep3" runat="server" Title="Workers Compensation - B">

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

    <asp:WizardStep ID="WizardStep4" runat="server" Title="Log">
    <%--STEP 18--%>
    <fieldset>
    <legend>Quote Request Log</legend>
    <div class="quote_box">
        <asp:GridView ID="GridView1" runat="server" 
            EmptyDataText="No Data At This Time.">
        </asp:GridView>
    </div>
    </fieldset>

    <%--END STEP 18--%>
    </asp:WizardStep>

    <asp:WizardStep ID="WizardStep5" runat="server" Title="Step 19">
    </asp:WizardStep>

</WizardSteps>
</asp:Wizard>
</div>
