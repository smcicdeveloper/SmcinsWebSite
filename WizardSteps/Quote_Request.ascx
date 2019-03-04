<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Quote_Request.ascx.vb" Inherits="WizardSteps_Quote_Request" %>

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
        <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
            CommandName="MovePrevious" Text="Previous" Visible="False" />
        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
            Text="Next" onclick="StepNextButton_Click" />
    </StepNavigationTemplate>
    <WizardSteps>

<%--STEP 16--%>

     <%--STEP 17--%>   
    <asp:WizardStep ID="WizardStep1" runat="server" Title="General Information" 
            StepType="Step">
     <%-- STEP 1--%>
   <asp:FormView 
    ID="FormView1" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>  
<h3>Quote Request Form</h3>
 <div class="quote_box">        
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
        <asp:TextBox ID="txtMailState" runat="server" MaxLength="2" Width="29px"></asp:TextBox>
      </li>
       <li><asp:RequiredFieldValidator ID="rfvMailState" runat="server" ControlToValidate="txtMailState" Text="*" ErrorMessage="Missing State"  ForeColor="Red" /></li>
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
    <li><asp:RadioButton ID="rbPreviousPolicyYes" runat="server" AutoPostBack="true" Text="Yes" GroupName="PrePolicy" OnCheckedChanged="rbPreviousPolicyYes_CheckedChanged" /></li>
    <li><asp:RadioButton ID="rbPreviousPolicyNo" runat="server" AutoPostBack="true" Text="No" Checked="true" GroupName="PrePolicy" /></li>
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
       <asp:RadioButton ID="rbIncYes" runat="server" GroupName="rbgInc" Text="Yes" />
       <asp:RadioButton ID="rbIncNo" runat="server" GroupName="rbgInc" Checked="true" Text="No" />
     </li>
    </ul>
  </div>
  </InsertItemTemplate>  
  </asp:FormView>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <%--END STEP 1    --%>        
</asp:WizardStep>
<asp:WizardStep ID="WizardStep2" runat="server" Title="Property/Crime Section - A" 
            StepType="Step">
 <%-- STEP 2--%>
<asp:FormView 
    ID="FormView2" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Property/Crime</h3>
        <div class="quote_box">
        <ul>
          <li><label>Deductible</label></li>
          <li>
          <asp:DropDownList id="ddDeduct" runat="server">
            <asp:ListItem Value="500">500</asp:ListItem>
            <asp:ListItem Value="1000">1000</asp:ListItem>
            <asp:ListItem Value="2500">2500</asp:ListItem>
          </asp:DropDownList>
          </li>
          <li><label>Form</label></li>
          <li>
             <asp:DropDownList id="ddForm" runat="server">
                <asp:ListItem Value="Basic">Basic</asp:ListItem>
                <asp:ListItem Value="Broad">Broad</asp:ListItem>
                <asp:ListItem Value="Special" Selected="True">Special</asp:ListItem>
            </asp:DropDownList>
          </li>
        </ul>
        <ul>
          <li>
            <asp:RadioButton id="rbRC" runat="server" GroupName="rbRCACV" Checked="True" Text="RC"></asp:RadioButton>
          </li>
          <li>
             <asp:RadioButton id="rbACV" runat="server" GroupName="rbRCACV" Text="ACV"></asp:RadioButton>
          </li>
        </ul>
        <ul>
          <li><label>Blanket Coverage?</label></li>
          <li>
            <asp:RadioButton id="rbBlanketYes" runat="server" GroupName="rbBlanket" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbBlanketNo" runat="server" GroupName="rbBlanket" Text="No"></asp:RadioButton>
          </li>
          </ul>
          <ul>
          <li><label>Earthquake?</label></li>
          <li>
            <asp:RadioButton id="rbEQYes" runat="server" GroupName="rbEQ" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbEQNo" runat="server" GroupName="rbEQ" Text="No"></asp:RadioButton>
          </li>
        </ul>
      </div>
  </InsertItemTemplate>  
  </asp:FormView>
   <%--  END STEP 2   --%>                                                 
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep3" runat="server" Title="Building Location" StepType="Step">
   <%--   STEP 3--%>
    <asp:FormView 
    ID="FormView3" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
      <h3>Physical Location of the Building</h3>
        <div class="quote_box">
        
        <div id="divDisplay">

        <asp:GridView 
                ID="grdLocation" 
                runat="server" 
                EmptyDataText="No Data At This Time.">
        </asp:GridView>
        <br />
            <asp:DataList 
                 ID="dlstLocation" 
                 runat="server">
            </asp:DataList>
        <a href="JavaScript:showInsert();">+ Add Location</a>
        </div>

        <div id="divInsert">
        <h3>Adding Location</h3>
                   <table>
           <tr>
               <td>
               <label>Address</label>
                 </td>
               <td>
                   <asp:TextBox ID="txtAddress" runat="server" MaxLength="75" Width="270px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="txtAddress" runat="server" Text="*" ForeColor="Red" ErrorMessage="Missing address." />
                  </td>
           </tr>
           <tr>
               <td>
               <label>City</label>
                  </td>
               <td>
                   <asp:TextBox ID="txtCity" runat="server" MaxLength="25"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvCity" ControlToValidate="txtCity" runat="server" Text="*" ForeColor="Red" ErrorMessage="Missing city." />
                  </td>
           </tr>
           <tr>
               <td>
               <label>State</label>
                  </td>
               <td>
                   <asp:DropDownList ID="ddlState" runat="server">
                       <asp:ListItem>GA</asp:ListItem>
                       <asp:ListItem>NC</asp:ListItem>
                       <asp:ListItem>SC</asp:ListItem>
                       <asp:ListItem>TN</asp:ListItem>
                   </asp:DropDownList>
                  </td>
           </tr>
           <tr>
               <td>
                 <label>zip</label>
                  </td>
               <td>
                   <asp:TextBox ID="txtZip" runat="server" MaxLength="5"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvZip" ControlToValidate="txtZip" runat="server" Text="*" ForeColor="Red" ErrorMessage="Missing zip code." />
                   <asp:RegularExpressionValidator ID="revZip" ControlToValidate="txtZip" 
                       runat="server" Text="*" ForeColor="Red"  ErrorMessage="Wrong zip code format." 
                       ValidationExpression="\d{5}(-\d{4})?" />
                  </td>
           </tr>
           <tr>
               <td>
                 <label>County</label>
                  </td>
               <td>
                   <asp:TextBox ID="txtCounty" runat="server" MaxLength="25"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvCounty" ControlToValidate="txtCounty" runat="server" Text="*" ForeColor="Red" ErrorMessage="Missing county." />
                  </td>
           </tr>
       </table>
        <ul>
          <li><asp:LinkButton ID="lnkSubmit" runat="server" Text=" Submit" OnClick="lnkSubmit_Click" /></li>
          <li>|</li>
          <li><a href="JavaScript:hideInsert();">Close</a></li>
        </ul>
            
        </div>
        </div>
  </InsertItemTemplate>  
  </asp:FormView>
        <asp:ValidationSummary ID="ValidationSummary14" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
    <%-- END STEP 3  --%>     
            
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep4" runat="server" Title="Building Information">
    <%--STEP 4--%>
    <asp:FormView 
    ID="FormView4" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
       <h3>Building Information</h3>
        <div class="quote_box">
        
            <div id="divDisplay">
            <asp:GridView 
                 ID="grdBuilding" 
                 runat="server" 
                 EmptyDataText="No Data At This Time.">
            </asp:GridView>
            <a href="JavaScript:showInsert();">Add Building</a>
            </div>

            <div id="divInsert">
            <h3>Adding Building</h3>
                <asp:DetailsView 
                     ID="dtlBuilding" 
                     runat="server" 
                     Height="50px" 
                     Width="125px" 
                     DefaultMode="Insert">
                </asp:DetailsView>
                <a href="JavaScript:hideInsert();">Close</a>
            </div>
        </div>
  </InsertItemTemplate>  
  </asp:FormView>
    <%--END STEP 4 --%>               

    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep5" runat="server" Title="Property/Crime Section - B">
    <%--STEP 5--%>

    <asp:FormView 
    ID="FormView5" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Property/Crime Sections</h3>
        <div class="quote_box">
        <ul>
          <li>
           <label>Money and Securities</label>
           <asp:TextBox ID="txtMoney" runat="server" MaxLength="15"></asp:TextBox>
          </li>
          <li><asp:RequiredFieldValidator ID="rfvMoney" runat="server" ControlToValidate="txtMoney" Text="*" ErrorMessage="Missing money and securities" ForeColor="Red" /></li>
          <li>
           <label>Employee Dishonesty</label>
              <asp:TextBox ID="txtEmpDis" runat="server" MaxLength="15"></asp:TextBox>
           </li>
           <li><asp:RequiredFieldValidator ID="rfvEmpDis" runat="server" ControlToValidate="txtEmpDis" Text="*" ErrorMessage="Missing employee dishonesty" ForeColor="Red" /></li>
        </ul>
        <ul>
          <li>
            <label>Forgery</label>
              <asp:DropDownList id="ddForgery" runat="server" Width="110px">
                <asp:ListItem Value="5000">5000</asp:ListItem>
                <asp:ListItem Value="10000">10000</asp:ListItem>
                <asp:ListItem Value="15000">15000</asp:ListItem>
                <asp:ListItem Value="20000">20000</asp:ListItem>
                <asp:ListItem Value="25000">25000</asp:ListItem>
            </asp:DropDownList>
          </li>
          <li>
             <label><i>(Applicable only for Special Form policies)</i></label>
          </li>
        </ul>
        <ul>
           <li>
             <label>Ordinance and Law</label>
             <asp:DropDownList id="ddOrdLaw" runat="server" Width="110px">
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
             <label>Extra Expense</label>
               <asp:TextBox ID="txtExtraExp" runat="server" MaxLength="15"></asp:TextBox>
           </li>
           <li><asp:RequiredFieldValidator ID="rfvExtraExpense" runat="server" ControlToValidate="txtExtraExp" Text="*" ErrorMessage="Missing Extra Expense." ForeColor="Red" /></li>
            <li>
              <label><i>(Enter a value between 10,000 and 100,000 in increments of 1,000)</i></label>
            </li>
        </ul>
        <ul>
         <li>
           <label>Water/Sewer Backup</label>
             <asp:TextBox ID="txtWater" runat="server" MaxLength="15"></asp:TextBox>
         </li>
         <li><asp:RequiredFieldValidator ID="rfvWater" runat="server" ControlToValidate="txtWater" Text="*" ErrorMessage="Missing Water/Sewer backup." ForeColor="Red" /></li>
         <li>
           <label><i>(Enter a value between 10,000 and 100,000 in increments of 5,000)</i></label>
         </li>
        </ul>
        <ul>
          <li>
           <label>
             Property Comments
             <br />
               <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                  Height="89px" Width="304px"></asp:TextBox>
           </label>
          </li>
        </ul>
        </div>
  </InsertItemTemplate>  
  </asp:FormView>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />               
    <%--END STEP 5--%>
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep6" runat="server" Title="Liability Section">
    <%--STEP 6--%>

      <asp:FormView 
    ID="FormView6" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Liability</h3>
    <div class="quote_box">
    <ul>
     <li>
       <label>General Liability</label>
       <asp:DropDownList id="ddGLocc" runat="server" Width="90px">
            <asp:ListItem Value="300,000">300,000</asp:ListItem>
            <asp:ListItem Value="500,000">500,000</asp:ListItem>
            <asp:ListItem Value="1,000,000" Selected="True">1,000,000</asp:ListItem>
            <asp:ListItem Value="2,000,000">2,000,000</asp:ListItem>
        </asp:DropDownList>
     </li>
     <li>
        <label>per occurance/</label>
        <asp:DropDownList id="ddGLagg" runat="server" Width="90px">
            <asp:ListItem Value="2,000,000" Selected="True">2,000,000</asp:ListItem>
            <asp:ListItem Value="3,000,000">3,000,000</asp:ListItem>
            <asp:ListItem Value="4,000,000">4,000,000</asp:ListItem>
        </asp:DropDownList>
        <label>aggregate</label>
     </li>
     <li>
       <label>Med Pay</label>
       <asp:DropDownList id="ddMedPay" runat="server">
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
                  <label>Pastoral Counseling</label>
                  </td>
                  <td>
                   <asp:DropDownList id="ddPCliab" runat="server" Width="90px">
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
                <label>Sexual Misconduct</label>
                </td>
                <td>
                   <asp:DropDownList id="ddSMMliab" runat="server" Width="90px">
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
                 <label>Directors & Officers</label>
                 </td>
                 <td>
                   <asp:DropDownList id="ddDOliab" runat="server" Width="90px">
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="100,000">100,000</asp:ListItem>
                        <asp:ListItem Value="300,000">300,000</asp:ListItem>
                        <asp:ListItem Value="500,000">500,000</asp:ListItem>
                        <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
               <label>Hired/Non-Owned Auto</label>
               </td>
               <td>
                <asp:DropDownList id="ddAutoliab" runat="server" Width="90px">
                    <asp:ListItem Value="0">0</asp:ListItem>
                    <asp:ListItem Value="300,000">300,000</asp:ListItem>
                    <asp:ListItem Value="500,000">500,000</asp:ListItem>
                    <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Employee Benefits</label>
                </td>
                <td>
                    <asp:DropDownList id="ddEBLliab" runat="server" Width="90px" AutoPostBack="true">
                    <asp:ListItem Value="0">0</asp:ListItem>
                    <asp:ListItem Value="25,000">25,000</asp:ListItem>
                    <asp:ListItem Value="50,000">50,000</asp:ListItem>
                    <asp:ListItem Value="100,000">100,000</asp:ListItem>
                    <asp:ListItem Value="300,000">300,000</asp:ListItem>
                </asp:DropDownList>
                </td>
                  <td>
                   <label>Employment Pratices</label>
                  </td>
                  <td>
                      <asp:DropDownList id="ddEPLliab" runat="server" Width="90px" AutoPostBack="true">
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="25,000">25,000</asp:ListItem>
                        <asp:ListItem Value="50,000">50,000</asp:ListItem>
                        <asp:ListItem Value="100,000">100,000</asp:ListItem>
                        <asp:ListItem Value="300,000">300,000</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
<%--    <ul>
     <li>
       <label>Number of Full-time Empl.</label>
       <asp:TextBox id="txtFTEmp" runat="server" AutoPostBack="true" MaxLength="4" Width="50px" OnTextChanged="txtFTEmp_TextChanged"></asp:TextBox>
     </li>
     <li><asp:RequiredFieldValidator ID="rfvFTEmp" runat="server" ControlToValidate="txtFTEmp" Text="*" ErrorMessage="If employee benefits or pratices answered must give number of employees" ForeColor="Red" /></li>
     <li>
       <label>Number of Part-time Empl.</label>
       <asp:TextBox id="txtPTEmp" runat="server" AutoPostBack="true" MaxLength="4" Width="50px" OnTextChanged="txtPTEmp_TextChanged"></asp:TextBox>
     </li>
     <li><asp:RequiredFieldValidator ID="rfvPTEmp" runat="server" ControlToValidate="txtPTEmp" Text="*" ErrorMessage="If employee benefits or pratices answered must give number of employees" ForeColor="Red" /></li>
    </ul>--%>

    <table border="0">
            <tr>
                <td><label>Misc Legal Defense</label></td>
                <td>
                  <asp:DropDownList id="ddLegalliab" runat="server" Width="115px">
                    <asp:ListItem Value="0">0</asp:ListItem>
                    <asp:ListItem Value="5,000/15,000">5,000/15,000</asp:ListItem>
                    <asp:ListItem Value="10,000/30,000">10,000/30,000</asp:ListItem>
                    <asp:ListItem Value="15,000/45,000">15,000/45,000</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td><label>Violent Acts</label></td>
                <td>
                  <asp:DropDownList id="ddViolentActs" runat="server" Width="115px">
                    <asp:ListItem Value="0">0</asp:ListItem>
		            <asp:ListItem Value="50k/50k/50k">50k/50k/50k</asp:ListItem>
                    <asp:ListItem Value="50k/100k/100k">50k/100k/100k</asp:ListItem>
                    <asp:ListItem Value="50k/300k/300k">50k/300k/300k</asp:ListItem>
	            </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td> <label>Teachers Professional</label></td>
                <td>
                    <asp:DropDownList id="ddTeachLiab" runat="server" Width="90px" AutoPostBack="True">
			            <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="50,000">50,000</asp:ListItem>
                        <asp:ListItem Value="100,000">100,000</asp:ListItem>
                        <asp:ListItem Value="300,000">300,000</asp:ListItem>
                        <asp:ListItem Value="500,000">500,000</asp:ListItem>
	                    <asp:ListItem Value="1,000,000">1,000,000</asp:ListItem>
                    </asp:DropDownList>
                </td>
<%--                <td><label>No. Teachers</label></td>
                <td>
                <asp:TextBox id="txtNumTeachers" runat="server" AutoPostBack="true" Width="50px" MaxLength="4" OnTextChanged="txtNumTeachers_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNumTeachers" runat="server" ControlToValidate="txtNumTeachers" Text="*" ErrorMessage="Missing Number of Teachers" ForeColor="Red" />
                </td>--%>             
            </tr>
            <tr>
                <td><label>Corporal Punishment</label></td>
                <td>
                    <asp:DropDownList id="ddCorpPunish" runat="server" Width="90px">
			        <asp:ListItem Value="0">0</asp:ListItem>
                    <asp:ListItem Value="25,000">25,000</asp:ListItem>
                    <asp:ListItem Value="50,000">50,000</asp:ListItem>
                    <asp:ListItem Value="100,000">100,000</asp:ListItem>
		        </asp:DropDownList>
                </td>
                <td><label>Lost Wages</label></td>
                <td>
                 <asp:DropDownList id="ddLostWages" runat="server" Width="90px">
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
    </InsertItemTemplate>  
  </asp:FormView>
                    
     <%--END STEP 6--%>
     <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep7" runat="server" Title="Underwriting Section">

    <%--STEP 7--%>
    <asp:FormView 
    ID="FormView7" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Underwriting</h3>
   <div class="quote_box">
        <ul>
           <li>
             <label>Are the scheduled properties owned by the congregation?</label>
              <asp:RadioButton id="rbPropYes" runat="server" GroupName="rbg01" Checked="true" AutoPostBack="true" Text="Yes" OnCheckedChanged="rbPropYes_CheckedChanged"></asp:RadioButton>
              <asp:RadioButton id="rbPropNo" runat="server" GroupName="rbg01" AutoPostBack="true" Text="No" OnCheckedChanged="rbPropNo_CheckedChanged"></asp:RadioButton>
           </li> 
        </ul>
        <ul>
          <li><label>If not, who is the owner?</label>
          <asp:TextBox id="txtPropOwner" runat="server" Width="351px" MaxLength="50"></asp:TextBox>
          </li>
          <li><asp:RequiredFieldValidator ID="rfvPropOwner" runat="server" ControlToValidate="txtPropOwner" Text="*" ErrorMessage="Missing owner of congregation" ForeColor="Red" /></li>
        </ul>
        <ul>
         <li>
          <label>Does the church have a daycare or kindergarten?</label>
          <asp:RadioButton id="rbSchoolYes" runat="server" GroupName="rbgSchool" AutoPostBack="true" Text="Yes" OnCheckedChanged="rbSchoolYes_CheckedChanged"></asp:RadioButton>
          <asp:RadioButton id="rbSchoolNo" runat="server" GroupName="rbgSchool" AutoPostBack="true"  Checked="true" Text="No" OnCheckedChanged="rbSchoolNo_CheckedChanged"></asp:RadioButton>
          </li>
          <li>
           <label>Number of children</label>
           <asp:TextBox id="txtSchoolKids" runat="server" Width="54px" MaxLength="3"></asp:TextBox>
          </li>
          <li><asp:RequiredFieldValidator ID="rfvSchoolKids" runat="server" ControlToValidate="txtSchoolKids" Text="*" ErrorMessage="Please enter number of children." ForeColor="Red" /></li>
        </ul>
        <ul>
         <li>
           <label>If yes, are background checks performed an all employees/volunteers who work with children?</label>
            <asp:RadioButton id="rbBkgrdYes" runat="server" GroupName="rbg03" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbBkgrdNo" runat="server" GroupName="rbg03" Checked="true" Text="No"></asp:RadioButton>
         </li>
        </ul>
        <ul>
         <li>
            <label>Playground?</label>
            <asp:RadioButton id="rbPlayYes" runat="server" GroupName="rbg05" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbPlayNo" runat="server" GroupName="rbg05" Checked="true" Text="No"></asp:RadioButton>
         </li>
         <li>
          <label>Fenced?</label>
            <asp:RadioButton id="rbPlayFenY" runat="server" GroupName="rbgPlay" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbPlayFenN" runat="server" GroupName="rbgPlay" Checked="true" Text="No"></asp:RadioButton>
         </li>
        </ul>
        <ul>
         <li>
          <label>Cemetery?</label>
            <asp:RadioButton id="rbCemeteryYes" runat="server" GroupName="rbCemetery" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbCemeteryNo" runat="server" GroupName="rbCemetery" Checked="true" Text="No"></asp:RadioButton>
         </li>
         <li>
          <label>Fenced?</label>
              <asp:RadioButton id="rbCemFenY" runat="server" GroupName="rbgCem" Text="Yes"></asp:RadioButton>
              <asp:RadioButton id="rbCemFenN" runat="server" GroupName="rbgCem" Checked="true" Text="No"></asp:RadioButton>
         </li>
         </ul>
         <ul>
         <li>
          <label>Is the cemetery located on main church property?</label>
            <asp:RadioButton id="rbCemLocY" runat="server" AutoPostBack="true" GroupName="rbgCemLoc" Text="Yes" Checked="true" OnCheckedChanged="rbCemLocY_CheckedChanged"></asp:RadioButton>
            <asp:RadioButton id="rbCemLocN" runat="server" AutoPostBack="true" GroupName="rbgCemLoc" Text="No" OnCheckedChanged="rbCemLocN_CheckedChanged"></asp:RadioButton>
         </li>
         </ul>
         <ul>
         <li>
           <label>If no, please supply the cemetery's address</label>
             <asp:TextBox ID="txtCemeteryAddress" runat="server" MaxLength="120" Width="210px"></asp:TextBox>
         </li>
         <li><asp:RequiredFieldValidator ID="rfvCemeteryAddress" runat="server" ControlToValidate="txtCemeteryAddress" Text="*" ErrorMessage="Missing address" ForeColor="Red" /></li>
        </ul>
            <ul>
          <li>
           <label style="color:Red;">**If cemetery is at a different address, please list the address in the comments section.</label>
          </li>
         </ul>
         <ul>
         <li>--></li>
          <li>
            <label>Ballfield?</label>
            <asp:RadioButton id="rbBallfldYes" runat="server" GroupName="rbg06" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbBallfldNo" runat="server" GroupName="rbg06" Checked="true" Text="No"></asp:RadioButton>
           </li>
           <li>--></li>
           <li>
            <label>Fenced?</label>
            <asp:RadioButton id="rbBallFenYes" runat="server" GroupName="rbg07" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbBallFenNo" runat="server" GroupName="rbg07" Checked="true" Text="No"></asp:RadioButton>
           </li>
            <li>--></li>
           <li>
            <label>Located on church property?</label>
                <asp:RadioButton id="rbBallLocY" runat="server" GroupName="rbgBallLoc" Text="Yes"></asp:RadioButton>
                <asp:RadioButton id="rbBallLocN" runat="server" AutoPostBack="True" Checked="true" GroupName="rbgBallLoc" Text="No"></asp:RadioButton>
           </li>
         </ul>
           <ul>
            <li>
             <label>Comments or describe any other church-sponsored activities
             <br />
             <asp:TextBox id="txtOthAct" runat="server" Width="590px" Height="97px" TextMode="MultiLine"></asp:TextBox>
             </label>
            </li>
           </ul>
           <ul>
            <li>
             <label>Average Attendance</label>
             <asp:TextBox id="txtAvgAtt" runat="server" Width="67px"></asp:TextBox>
            </li>
           </ul>
     </div>
     <h3>Five Year Loss History</h3>
     <div class="quote_box">
     <ul>
      <li>
          <label>Was there any losses in the past five years?</label>
          <asp:RadioButton ID="rbLoss7Yes" GroupName="5YearLoss" Text="Yes" AutoPostBack="true" runat="server" OnCheckedChanged="rbLoss7Yes_CheckedChanged" />
          <asp:RadioButton ID="rbLoss7No" GroupName="5YearLoss" Text="No" AutoPostBack="true" Checked="true" OnCheckedChanged="rbLoss7No_CheckedChanged" runat="server" />
      </li>
     </ul>

    <asp:Panel ID="Panel1" runat="server">             
        <table border="0">
            <tr>
                <td><label>Date</label></td>
                <td><label>Description</label></td>
                <td><label>Amount</label></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox id="txtLossDate7a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDate7a" runat="server" ControlToValidate="txtLossDate7a" Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox id="txtLossDescr7a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDescr7a" runat="server" ControlToValidate="txtLossDescr7a" Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                </td>
                <td>
                  <asp:TextBox id="txtLossAmt7a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvLossAmt7a" runat="server" ControlToValidate="txtLossAmt7a" Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
               </td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate7b" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr7b" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt7b" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate7c" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr7c" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt7c" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate7d" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr7d" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt7d" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate7e" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr7e" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt7e" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
        </table>
   </asp:Panel>
     </div>
     <h3>Church Automobiles</h3>
     <div class="quote_box">

        <ul>
         <li><label>Church-owned Vehicle(s)?</label>
            <asp:RadioButton id="rbChVehYes" runat="server" GroupName="rbg08" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbChVehNo" runat="server" GroupName="rbg08" Checked="true" Text="No"></asp:RadioButton>
        </li>
        </ul>
        <ul>
         <li><label>Worker's Compensation?</label></li>
            <asp:RadioButton id="rbWCYes" runat="server" GroupName="rbg10" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbWCNo" runat="server" GroupName="rbg10" Checked="true" Text="No"></asp:RadioButton>
        </ul>
        <ul>
         <li>
           <label>Umbrella?</label>
            <asp:RadioButton id="rbUmbYes" runat="server" GroupName="rbg11" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rbUmbNo" runat="server" GroupName="rbg11" Checked="true" Text="No"></asp:RadioButton>
         </li>
        </ul>
    </div>
      </InsertItemTemplate>  
  </asp:FormView>

          <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowMessageBox="True" ShowSummary="False" />             
   <%-- END STEP 7--%>

    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep8" runat="server" Title="Pastoral Counseling Liability">
    <%--STEP 8--%>

    <asp:FormView 
    ID="FormView8" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Supplemental Application for Pastoral Counseling Liability Coverage</h3>
    <div class="quote_box">
<%--    <ul>
    <li>
       <label>Are there any employees or members involved in counseling?</label>
        <asp:RadioButton ID="rbCounselYes" Text="Yes" AutoPostBack="true" GroupName="Counseling" runat="server" OnCheckedChanged="rbCounselYes_CheckedChanged" />
        <asp:RadioButton ID="rbCounselNo" Text="No" AutoPostBack="true" GroupName="Counseling" Checked="true" runat="server" OnCheckedChanged="rbCounselNo_CheckedChanged" />
    </li>
    </ul>--%>
        <asp:Panel ID="Panel2" runat="server">
    <ul>
      <li>
        <label>How many employees and/or members are involved in counseling?</label>
        <asp:TextBox id="txtNumEmp" runat="server" MaxLength="4" Width="34px"></asp:TextBox>
      </li>
      <li>
          <asp:RequiredFieldValidator ID="rfvNumEmp" runat="server" ControlToValidate="txtNumEmp" Text="*" ErrorMessage="Missing number of employees" ForeColor="Red" />
          <asp:CompareValidator ID="cmpNumEmp" runat="server" ControlToValidate="txtNumEmp" Type="Double" Operator="GreaterThan" ErrorMessage="Value must be greater than zero" ForeColor="Red" />
      </li>
    </ul>
    <ul>
      <li>
        <label>Please describe education or training requirements for those involved in counseling:
        <br />
        <asp:TextBox id="txtTraining" runat="server" MaxLength="400" Width="464px" Height="60px" TextMode="MultiLine"></asp:TextBox>
        </label>
      </li>
      <li>
          <asp:RequiredFieldValidator ID="rfvTraining" runat="server" ControlToValidate="txtTraining" Text="*" ErrorMessage="Missing training requirements" ForeColor="Red" />
      </li>
    </ul>
    <ul>
      <li>
        <label>Is counseling provided for a fee?
        <br />
        <asp:RadioButton id="rb4Yes" runat="server" Text="Yes" GroupName="rb4"></asp:RadioButton>
        <asp:RadioButton id="rb4No" runat="server" Text="No" GroupName="rb4" Checked="true"></asp:RadioButton>
       </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>Are windows installed or doors left open in those rooms where counseling sessions are conducted?
        <br />
            <asp:RadioButton id="rb3Yes" runat="server" GroupName="rb3" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rb3No" runat="server" GroupName="rb3" Checked="true" Text="No"></asp:RadioButton>
       </label>
      </li>
    </ul>
   </asp:Panel>
    <ul>
      <li>
        <label>Have there been any losses or allegations in the past?
        <br />
        <asp:RadioButton id="rb5Yes" runat="server" Text="Yes" AutoPostBack="true" GroupName="rb5" OnCheckedChanged="rb5Yes_CheckedChanged"></asp:RadioButton>
        <asp:RadioButton id="rb5No" runat="server" Text="No" AutoPostBack="true" Checked="true" GroupName="rb5" OnCheckedChanged="rb5No_CheckedChanged"></asp:RadioButton>
       </label>
      </li>
    </ul>
    <ul>
      <li>
        <label>If question 5 answered "Yes", please explain:
         <br />
         <asp:TextBox id="txtExplain" runat="server" MaxLength="8000" Width="607px" Height="133px" TextMode="MultiLine"></asp:TextBox>
        </label>
      </li>
      <li><asp:RequiredFieldValidator ID="rfvExplain" ControlToValidate="txtExplain" runat="server" Text="*" ErrorMessage="Missing explanation." ForeColor="Red" /></li>
    </ul>
    </div>
      </InsertItemTemplate>  
  </asp:FormView>
         <asp:ValidationSummary ID="ValidationSummary5" runat="server" ShowMessageBox="True" ShowSummary="False" />            
    <%--END STEP 8--%>
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep9" runat="server" Title="Sexual Misconduct Liability">

    <%--STEP 9--%>
    <asp:FormView 
    ID="FormView9" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Supplemental Application for Sexual Misconduct & Molestation Liability Coverage</h3>
    <div class="quote_box">
        <table border="0" width="800px">
            <tr>
                <td class="style1"><label>Does the church have a formal sexual misconduct policy in place?</label></td>
                <td><asp:RadioButton id="misconductYes" runat="server" Text="Yes" GroupName="rb1"></asp:RadioButton>
                    <asp:RadioButton id="misconductNo" runat="server" Text="No" GroupName="rb1" Checked="true"></asp:RadioButton>
               </td>
            </tr>
            <tr>
                <td class="style1"><label>Are references required and background checks performed for all potential employees and volunteers?</label></td>
                <td>
                    <asp:RadioButton id="rb2Yes" runat="server" Text="Yes" GroupName="rb2"></asp:RadioButton>
                     <asp:RadioButton id="rb2No" runat="server" Text="No" GroupName="rb2" Checked="true"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td class="style1"><label>Has a background check been obtained on all current employees?</label></td>
                <td>
                   <asp:RadioButton id="rb3Yes" runat="server" Text="Yes" GroupName="rb3"></asp:RadioButton>
                    <asp:RadioButton id="rb3No" runat="server" Text="No" GroupName="rb3" Checked="true"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td class="style1"><label>Is there at least a six month waiting period before any new volunteers can work with children?</label></td>
                <td>
                    <asp:RadioButton id="rb4Yes" runat="server" Text="Yes" GroupName="rb4"></asp:RadioButton>
                    <asp:RadioButton id="rb4No" runat="server" Text="No" GroupName="rb4" Checked="true"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td class="style1"><label>Are two adults required whenever children are being supervised?</label></td>
                <td><asp:RadioButton id="rb5Yes" runat="server" Text="Yes" GroupName="rb5"></asp:RadioButton>
                    <asp:RadioButton id="rb5No" runat="server" Text="No" GroupName="rb5" Checked="true"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td class="style1"><label>Are windows installed and/or doors left open in nurseries and those rooms where other youth activities take place?</label></td>
                <td><asp:RadioButton id="rb6Yes" runat="server" Text="Yes" GroupName="rb6"></asp:RadioButton>
                    <asp:RadioButton id="rb6No" runat="server" Text="No" GroupName="rb6" Checked="true"></asp:RadioButton></td>
            </tr>
            <tr>
                <td class="style1"><label>Have any charges of sexual misconduct or sexual molestation ever been brought against any employees or volunteers?</label></td>
                <td>
                    <asp:RadioButton id="rb7Yes" runat="server" Text="Yes" AutoPostBack="true" GroupName="rb7" OnCheckedChanged="rb7Yes_CheckedChanged"></asp:RadioButton>
                    <asp:RadioButton id="rb7No" runat="server" Text="No" AutoPostBack="true" GroupName="rb7" OnCheckedChanged="rb7No_CheckedChanged" Checked="true"></asp:RadioButton>
                </td>
            </tr>
        </table>
        <br />
    <ul>
     <li>
       <label>If question 7 answered "Yes", please explain:
       <br />
       <asp:TextBox id="txtExplainCharges" runat="server" MaxLength="8000" Width="574px" Height="133px" TextMode="MultiLine"></asp:TextBox>
       </label>
     </li>
     <li>
         <asp:RequiredFieldValidator ID="rfvExplainCharges" ControlToValidate="txtExplainCharges" runat="server" Text="*" ErrorMessage="Missing explanation" ForeColor="Red" />
     </li>
    </ul>
    </div>
  </InsertItemTemplate>  
  </asp:FormView>
                    
    <%--END STEP 9--%>
     <asp:ValidationSummary ID="ValidationSummary6" runat="server" ShowMessageBox="True" ShowSummary="False" />  
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep10" runat="server" Title="Directors, Officers &amp; Trustees Liability">

    <%--STEP 10--%>
    <asp:FormView 
    ID="FormView10" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>  
    <h3>Supplemental Application for Directors, Officers & Trustees Liability Coverage</h3>
    <div class="quote_box">
    <ul>
     <li>
       <label>How are directors established?</label>
         <asp:TextBox ID="txtDirEst" runat="server" Width="282px" MaxLength="60"></asp:TextBox>
    </li>
    <li>
        <asp:RequiredFieldValidator ID="rfvDirEst" runat="server" ControlToValidate="txtDirEst" Text="*" ErrorMessage="Missing directors established." ForeColor="Red" />
    </li>
    </ul>
    <ul>
     <li>
       <label>How often are directors rotated?</label>
       <asp:TextBox id="txtRotated" runat="server" Width="266px" MaxLength="40"></asp:TextBox>
     </li>
     <li>
         <asp:RequiredFieldValidator ID="rfvRotated" runat="server" ControlToValidate="txtRotated" Text="*" ErrorMessage="Missing directors rotated." ForeColor="Red" />
     </li>
    </ul>
    <ul>
     <li>
       <label>Have there been any losses in the past?</label>
       <asp:RadioButton id="rb10Yes" runat="server" Text="Yes" AutoPostBack="true" GroupName="rb5" OnCheckedChanged="rb10Yes_CheckedChanged" />
       <asp:RadioButton id="rb10No" runat="server" Text="No" AutoPostBack="true" GroupName="rb5" Checked="true" OnCheckedChanged="rb10No_CheckedChanged" />
     </li>
    </ul>
    <ul>
     <li>
       <label>If question 3 answered "Yes", please explain:
       <br />
       <asp:TextBox id="txtExplainLosses" runat="server" Width="578px" MaxLength="8000" Height="133px" TextMode="MultiLine"></asp:TextBox>
       </label>
     </li>
     <li>
         <asp:RequiredFieldValidator ID="rfvExpLoss" runat="server" ControlToValidate="txtExplainLosses" Text="*" ErrorMessage="Missing explanation." ForeColor="Red" />
     </li>
    </ul>
    </div>
      </InsertItemTemplate>  
  </asp:FormView>
                    
    <%--END STEP 10--%>
    <asp:ValidationSummary ID="ValidationSummary7" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep16" runat="server" Title="Employment Pratices Liability">
    <%--STEP 16--%>
     <asp:FormView 
        ID="FormView16" 
        runat="server"
        DefaultMode="Insert">
        <InsertItemTemplate>
          <h3>Employment Practices Liability Supplemental Application</h3>
       <div class="quote_box">
             <table border="0">
                 <tr>
                     <td class="column_epl">
                       <p>Total number of employees (include part-time and full-time)?</p>
                       </td>
                     <td>
                         <asp:TextBox ID="txtTotalEmployees" runat="server" MaxLength="3" Width="27px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvTotalEmployees" runat="server" ControlToValidate="txtTotalEmployees" Text="*" ErrorMessage="Need number of employees" ForeColor="Red" />
                         <asp:CompareValidator ID="cmpTotalEmp" runat="server" ControlToValidate="txtTotalEmployees" Type="Double" Operator="GreaterThan" ErrorMessage="Value must be greater than zero" ForeColor="Red" ValueToCompare="0" />
                        </td>
                     <td class="style3">
                        </td>
                 </tr>
                 <tr>
                     <td>
                        <p>Do you have an employee handbook or printed policy statements on sexual harassment and anti-discrimination?</p>
                        </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeYes6" runat="server" 
                             GroupName="group1" Text="Yes" Width="55px" />
                        </td>
                     <td class="style3">
                                   <asp:RadioButton ID="rbEmployeeNo7" runat="server" GroupName="group1" 
                             Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                        <p>Are the policy statements and/or handbook distributed to all employees at time of hire?</p>
                        </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeYes7" runat="server" 
                             GroupName="group2" Text="Yes" Width="55px" />
                         </td>
                     <td class="style3">
                                   <asp:RadioButton ID="rbEmployeeNo8" runat="server" GroupName="group2" 
                             Text="No" Checked="True" Width="55px" />
                         </td>
                 </tr>
                 <tr>
                     <td>
                       <p>Do you obtain written acknowledgement from each employee at the time of hire, and when updates are made, 
                       that they have received and read the statements and/or handbook?</p>
                       </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeYes8" runat="server" 
                             GroupName="group3" Text="Yes" Width="55px" />
                         </td>
                     <td class="style3">
                                   <asp:RadioButton ID="rbEmployeeNo9" runat="server" GroupName="group3" 
                             Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                        <p>Do you use a formal, standardized application for employeement that has been reviewed by a qualified attorney?</p>
                        </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeYes9" runat="server" 
                             GroupName="group4" Text="Yes" Width="55px" />
                        </td>
                     <td class="style3">
                                   <asp:RadioButton ID="rbEmployeeNo10" runat="server" 
                             GroupName="group4" Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                       <p>Are all employees given an annual performance review?</p>  
                       </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeYes10" runat="server" 
                             GroupName="group5" Text="Yes" Width="55px" />
                         </td>
                     <td class="style3">
                                   <asp:RadioButton ID="rbEmployeeNo11" runat="server" 
                             GroupName="group5" Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                       <p>Do you maintain written records of all performance reviews and diciplinary actions?</p>
                        </td>
                     <td>
                         <asp:RadioButton ID="rbEmployeeYes11" runat="server" GroupName="group6" Text="Yes" Width="55px" />
                        </td>
                     <td class="style3">
                         <asp:RadioButton ID="rbEmployeeNo12" runat="server" GroupName="group6" Text="No" Checked="True" Width="55px" />
                         </td>
                 </tr>
             </table>
             <table border="0">
                 <tr>
                     <td class="column_epl">
                       
                         Are any drugs test given and, if so, under what circumstances?</td>
                     <td colspan="2">
                                   <asp:RadioButton ID="rbEmployeeYes12" runat="server" 
                             GroupName="group7" Text="Yes" Width="55px" />
                        </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeNo13" runat="server" GroupName="group7" 
                             Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td colspan="2">
                         <asp:TextBox ID="txtDrugs" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                         <br />
                         <br />
                       </td>
                     <td>
                        </td>
                     <td>
                       </td>
                 </tr>
                 <tr>
                     <td>How many employees have been terminated in the last 5 years?</td>
                     <td colspan="2">
                         <asp:TextBox ID="txtYears" runat="server" MaxLength="2" Width="45px"></asp:TextBox>
                        </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td>
                         Have there been an employees practices claims in the past?</td>
                     <td colspan="2">
                                   <asp:RadioButton ID="rbEmployeeYes13" runat="server" 
                             GroupName="group8" Text="Yes" Width="55px" />
                        </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeNo14" runat="server" GroupName="group8" 
                             Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                         Please provide details if &quot;yes&quot;.</td>
                     <td colspan="2">
                        </td>
                     <td>
                        </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:TextBox ID="txtExtra" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
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
                         Are you aware of any circumstance that might give rise to a claim?</td>
                     <td colspan="2">
                                   <asp:RadioButton ID="rbEmployeeYes14" runat="server" 
                             GroupName="group9" Text="Yes" Width="55px" />
                        </td>
                     <td>
                                   <asp:RadioButton ID="rbEmployeeNo15" runat="server" GroupName="group9" 
                             Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                         Please provide details if &quot;yes&quot;.</td>
                     <td colspan="2">
                       </td>
                     <td>
                        </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:TextBox ID="txtClaim" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                         <br />
                        </td>
                     <td colspan="2">
                        </td>
                     <td>
                        </td>
                 </tr>
                 <tr>
                     <td>
                         Was prior coverage ever cancelled or non-renewed?</td>
                     <td colspan="2">
                          <asp:RadioButton ID="rbEmployeeYes15" runat="server" GroupName="group10" Text="Yes" Width="55px" />
                        </td>
                     <td>
                           <asp:RadioButton ID="rbEmployeeNo16" runat="server" GroupName="group10" Text="No" Checked="True" Width="55px" />
                        </td>
                 </tr>
                 <tr>
                     <td>
                         Please provide details if &quot;yes&quot;.</td>
                     <td colspan="2">
                         </td>
                     <td>
                        </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:TextBox ID="txtCancelled" runat="server" MaxLength="75" Width="375px"></asp:TextBox>
                        </td>
                     <td colspan="2">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
       </div>
        </InsertItemTemplate>  
        </asp:FormView>
        <asp:ValidationSummary ID="ValidationSummary13" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
            <%--END STEP--%>
        </asp:WizardStep>

    <asp:WizardStep ID="WizardStep17" runat="server" Title="Teachers Professional Liability">
     <%--STEP 17--%>
             <asp:FormView 
                ID="FormView17" 
                runat="server"
                DefaultMode="Insert">
             <InsertItemTemplate>
             <h3>Teachers Professional Liability And Corporal Punishment Supplement</h3>
                <div class="quote_box">
                  <table border="0">
                    <tr>
                        <td>
                        <h3>Grades taught:</h3>
                        </td>
                        <td><label>Grades:</label></td>
                        <td>
                                <asp:ListBox ID="ListBox3" runat="server" Rows="1" Width="87px" SelectionMode="Multiple">
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
                        <td><label>through:</label></td>
                         <td>
                          <asp:ListBox ID="lstGrades2" runat="server" Rows="1" Width="87px" SelectionMode="Multiple">
                                <asp:ListItem>K3</asp:ListItem>
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
                           <td colspan="2">
                             <p>Maxium enrollment or capacity in school:</p></td>
                           <td>
                            <asp:TextBox ID="txtCapacity" MaxLength="4" runat="server" />
                           </td>
                       </tr>
                       <tr>
                           <td colspan="2">
                           <p>Average number enrolled each year</p></td>
                           <td>
                           <asp:TextBox ID="txtEnrolled" MaxLength="4" runat="server" />
                           </td>
                       </tr>
                       <tr>
                           <td colspan="2">
                            <p>Date school started:</p>
                            </td>
                           <td>
                               <asp:TextBox ID="txtSchoolStarted" runat="server" MaxLength="10" />
                               <asp:RegularExpressionValidator ID="revSchool" 
                                   ControlToValidate="txtSchoolStarted" runat="server" Text="*" ForeColor="Red" 
                                   ErrorMessage="Date formate should be mm/dd/yyyy" 
                                   ValidationExpression="^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$" />
                           </td>
                       </tr>
                       </table>
                       <br />
                       <hr />
                       <h4>List number of staff members by categories as follows:</h4>
                       <br />
                       <table border="0" cellpadding="0" cellspacing="0" width="650">
                       <tr>
                           <td>
                           <label>Professional</label>
                           </td>
                           <td>
                           <label>Full-time</label>
                           </td>
                           <td>
                            <label>Part-time</label>
                            </td>
                           <td>
                            <label>Volunteer</label>
                            </td>
                       </tr>
                       <tr>
                           <td class="style5">
                           <label>Teachers with degrees</label>
                           </td>
                           <td>
                               <asp:TextBox ID="txtFull1" runat="server" MaxLength="4"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                   Text="*" ErrorMessage="Teachers with degrees?" ForeColor="Red" 
                                   ControlToValidate="txtFull1" ValidationGroup="WithDegrees" />
                           </td>
                           <td>
                               <asp:TextBox ID="txtPart1" runat="server" MaxLength="4"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                   Text="*" ErrorMessage="Teachers with degrees?" ForeColor="Red" 
                                   ControlToValidate="txtPart1" ValidationGroup="WithDegrees" />
                           </td>
                           <td>
                               <asp:TextBox ID="txtVolunteer1" runat="server" MaxLength="4"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                   Text="*" ErrorMessage="Teachers with degrees?" ForeColor="Red" 
                                   ControlToValidate="txtVolunteer1" ValidationGroup="WithDegrees" />
                           </td>
                       </tr>
                       <tr>
                           <td>
                           <label>Teachers without degrees</label>
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
                           <label>Teachers Aides</label>
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
                           <label>Counselors</label>                                             
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
                            <label>Nurses</label>
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
                           <label>Other Administrative Staff</label>
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
                              <p>Is there a formal written procedure for evaluating a teacher's performance?</p>
                            
                           </td>
                           <td>                          
                               <asp:RadioButton ID="rdTeachersYes1" runat="server" GroupName="Performance" 
                                   Text="Yes" />
                                 <asp:RadioButton ID="rdTeachersNo1" runat="server" GroupName="Performance" 
                                   Text="No" Checked="True" />
                            </td>
                       </tr>
                       <tr >
                           <td>
                               <p>What criteria is used to evaluate the teacher (observation, test scores, etc.)</p> 
                            </td>
                           <td>
  
                            <asp:TextBox ID="txtCriteria" runat="server" Height="60px" TextMode="MultiLine" 
                                   Width="265px" MaxLength="125" />
                           </td>
                       </tr>
                       <tr >
                           <td>
                              <p>Are standardized learning skills tests administered to evalute your students</p>
                           </td>
                           <td>
                               <asp:RadioButton ID="rbTeachersYes3" runat="server" GroupName="Students" 
                                   Text="Yes" />
                               <asp:RadioButton ID="rbTeachersNo4" runat="server" GroupName="Students" 
                                   Text="No" Checked="True" />
                           </td>
                       </tr>
                       <tr >
                           <td>
                               <p>Are the test results shared with parents?</p>
                           </td>
                           <td>
                               <asp:RadioButton ID="rbTeachersYes4" runat="server" GroupName="Parents" 
                                   Text="Yes" />
                               <asp:RadioButton ID="rbTeachersNo5" runat="server" GroupName="Parents" 
                                   Text="No" Checked="True" />
                           </td>
                       </tr>
                       <tr >
                           <td>

                              <p>If a child underperforms in an area, are parents involved in the action plan to improve the childs performance?</p>

                            </td>
                           <td>

                               <asp:RadioButton ID="rbTeachersYes5" runat="server" GroupName="Child" 
                                   Text="Yes" />
                               <asp:RadioButton ID="rbTeachersNo6" runat="server" GroupName="Child" 
                                   Text="No" Checked="True" />
                            </td>
                       </tr>

                    </table>
                    <br />
                    <hr />
                     <h4>Does the school have written policies and/or procedures regarding students in the following areas:</h4>
                     <div id="table1">
                         <table border="0">
                             <tr>
                                 <td class="style6">
                                  <label>Suspension</label>
                                  </td>
                                 <td class="style10">
                                   <asp:RadioButton ID="rbTeachersYes6" runat="server" GroupName="Suspension" Text="Yes" Width="55px" />
                                   </td>
                                 <td>
                                   <asp:RadioButton ID="rbTeachersNo7" runat="server" GroupName="Suspension" Text="No" Checked="True" Width="55px" />
                                  </td>
                             </tr>
                             <tr>
                                 <td class="style6">
                             <label>Dismissal</label></td>
                                 <td class="style10">
                               <asp:RadioButton ID="rbTeachersYes7" runat="server" GroupName="Dismissal" 
                                   Text="Yes" Width="55px" />
                                   </td>
                                 <td>
                               <asp:RadioButton ID="rbTeachersNo8" runat="server" 
                                   GroupName="Dismissal" Text="No" Checked="True" Width="55px" />
                                    </td>
                             </tr>
                             <tr>
                                 <td class="style6">
                             <label>Sexual Harassment</label></td>
                                 <td class="style10">
                               <asp:RadioButton ID="rbTeachersYes8" runat="server" GroupName="Harassment" 
                                   Text="Yes" Width="55px" />
                                    </td>
                                 <td>
                               <asp:RadioButton ID="rbTeachersNo9" runat="server" 
                                   GroupName="Harassment" Text="No" Checked="True" Width="55px" />
                                   </td>
                             </tr>
                             <tr>
                                 <td class="style6">
                            <label>Student Aggression</label>
                                   </td>
                                 <td class="style10">
                               <asp:RadioButton ID="rbTeachersYes9" runat="server" GroupName="Aggression" 
                                   Text="Yes" Width="55px" />
                                   </td>
                                 <td>
                               <asp:RadioButton ID="rbTeachersNo10" runat="server" 
                                   GroupName="Aggression" Text="No" Checked="True" Width="55px" />
                                   </td>
                             </tr>
                         </table>
                     </div>
                     <div id="table2">
                      <table border="0">
                       <tr>

                           <td class="style7">
                            <label>Promotion</label>
                            </td>
                           <td class="style8">
                               <asp:RadioButton ID="rbTeachersYes10" runat="server" GroupName="Promotion" 
                                   Text="Yes" Width="55px" />
                            </td>
                           <td class="style9">
                               <asp:RadioButton ID="rbTeachersNo11" runat="server" GroupName="Promotion" 
                                   Text="No" Checked="True" Width="55px" />
                            </td>
                       </tr>
                       <tr>
                           <td class="style7">
                              <label>Acceptance</label></td>
                           <td class="style8">
                               <asp:RadioButton ID="rbTeachersYes11" runat="server" GroupName="Acceptance" 
                                   Text="Yes" Width="55px" />
                           </td>
                           <td class="style9">
                               <asp:RadioButton ID="rbTeachersNo12" runat="server" GroupName="Acceptance" 
                                   Text="No" Checked="True" Width="55px" />
                           </td>
                       </tr>
                       <tr>
                           <td class="style7">
                             <label>Drug Testing</label>
                               </td>
                           <td class="style8">
                               <asp:RadioButton ID="rbTeachersYes12" runat="server" GroupName="Drug" 
                                   Text="Yes" Width="55px" />
                              </td>
                           <td class="style9">
                               <asp:RadioButton ID="rbTeachersNo13" runat="server" GroupName="Drug" 
                                   Text="No" Checked="True" Width="55px" />
                              </td>
                       </tr>
                       <tr>
                           <td class="style7">
                             <label>Weapons</label>
                               </td>
                           <td class="style8">
                               <asp:RadioButton ID="rbTeachersYes13" runat="server" GroupName="Weapons" 
                                   Text="Yes" Width="55px" />
                           </td>
                           <td class="style9">
                               <asp:RadioButton ID="rbTeachersNo14" runat="server" GroupName="Weapons" 
                                   Text="No" Checked="True" Width="55px" />
                           </td>
                       </tr>
                       </table>
                   </div>
                   <div style="clear:both;"></div>
                   <br />
                   <hr />

                       <table>
                       <tr>
                           <td>
                            <p>Does the school have a written policy that prohibits corporal punishment?</p>
                            </td>
                           <td>
                            
                               <asp:RadioButton ID="rbTeachersYes14" runat="server" GroupName="Punishment" 
                                   Text="Yes" Width="55px" />
                            
                            </td>
                           <td>
                            
                               <asp:RadioButton ID="rbTeachersNo15" runat="server" GroupName="Punishment" 
                                   Text="No" Checked="True" Width="55px" />
                            
                            </td>
                           <td>
                            
                               &nbsp;</td>
                           <td>
                            
                               &nbsp;</td>
                           <td>
                            
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td>
                            <p>Are parents informed of all rules, policies, and procedures prior to enrollment?</p>
                            </td>
                           <td>
                               <asp:RadioButton ID="rbTeachersYes15" runat="server" GroupName="Enrollment" 
                                   Text="Yes" Width="55px" />
                            </td>
                           <td>
                               <asp:RadioButton ID="rbTeachersNo16" runat="server" GroupName="Enrollment" 
                                   Text="No" Checked="True" Width="55px" />
                            </td>
                           <td>
                               &nbsp;</td>
                           <td>
                               &nbsp;</td>
                           <td>
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td>
                           <p>Have three been any liability claims against the school or staff in the past?</p>
                           </td>
                           <td>
                               <asp:RadioButton ID="rbTeachersYes16" runat="server" GroupName="Liability" 
                                   Text="Yes" Width="55px" />
                           </td>
                           <td>
                               <asp:RadioButton ID="rbTeachersNo17" runat="server" GroupName="Liability" 
                                   Text="No" Checked="True" Width="55px" />
                           </td>
                           <td>
                               &nbsp;</td>
                           <td>
                               &nbsp;</td>
                           <td>
                               &nbsp;</td>
                       </tr>
                       </table>
                       <table>
                       <tr>
                           <td>
                            <p>If yes, please describe claim and ammount paid</p>
                            </td>
                           <td colspan="3">
                               <asp:TextBox ID="TextBox1" runat="server" Height="49px" MaxLength="150" 
                                   TextMode="MultiLine" Width="268px"></asp:TextBox>
                              </td>
                       </tr>
        </table>
                   </div>
             </InsertItemTemplate>  
             </asp:FormView>
        <asp:ValidationSummary ID="ValidationSummary12" runat="server" ShowMessageBox="True" ShowSummary="False" />
        <%--END STEP 17--%>
    </asp:WizardStep>

    <asp:WizardStep ID="WizardStep11" runat="server" Title="Business Auto">

    <%--STEP 11--%>
    <asp:FormView 
    ID="FormView11" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Church Owned Vehicle(s)</h3>
    <div class="quote_box">
      <ul>
        <li>
          <label>Current Carrier</label>
          <asp:TextBox id="txtCurrCarrier" runat="server" Width="287px" MaxLength="40"></asp:TextBox>
        </li>
        <li>
            <asp:RequiredFieldValidator ID="rfvCurrCarrier" runat="server" ControlToValidate="txtCurrCarrier" Text="*" ErrorMessage="Missing current carrier" ForeColor="Red" />
        </li>
        <li>
          <asp:CheckBox ID="chbNoCarrier" runat="server" AutoPostBack="true" Text="No Current Carrier" OnCheckedChanged="chbNoCarrier_CheckedChanged" />
        </li>
      </ul>
      <ul>
        <li>
          <label>Current Premium</label>
          <asp:TextBox id="txtCurrPrem" runat="server" MaxLength="10" Width="90px"></asp:TextBox>
        </li>
        <li>
            <asp:RequiredFieldValidator ID="rfvCurrPrem" runat="server" ControlToValidate="txtCurrPrem" Text="*" ErrorMessage="Missing current premium" ForeColor="Red" />
        </li>
      </ul>

      <ul>
        <li>
          <label>Liability Limit</label>
          <asp:DropDownList id="ddLiab" runat="server" Width="90px">
            <asp:ListItem Value="100000" Selected="True">100,000</asp:ListItem>
            <asp:ListItem Value="300000">300,000</asp:ListItem>
            <asp:ListItem Value="500000">500,000</asp:ListItem>
            <asp:ListItem Value="1000000">1,000,000</asp:ListItem>
        </asp:DropDownList>
        </li>
       </ul>
       <ul>
        <li>
          <label>Is Hired Physical Damage Coverage Desired?</label>
            <asp:RadioButton id="rbHiredYes" runat="server" Text="Yes" GroupName="rb1"></asp:RadioButton>
            <asp:RadioButton id="rbHiredNo" runat="server" Text="No" GroupName="rb1" Checked="true"></asp:RadioButton>
            <p><i>(If yes, Hired and Non-owned Liability coverage will automatically be added to the policy.)</i></p>
        </li>
      </ul>
      <ul>
        <li>
          <label>Any drivers under 25 or over 65?</label>
            <asp:RadioButton id="rbAgeYes" runat="server" Text="Yes" GroupName="rb2"></asp:RadioButton>
            <asp:RadioButton id="rbAgeNo" runat="server" Text="No" GroupName="rb2" Checked="true"></asp:RadioButton>
        </li>
      </ul>
      <ul>
       <li>
         <label>Comments
         <br />
         <asp:TextBox id="txtComments" runat="server" Width="446px" Height="123px" TextMode="MultiLine"></asp:TextBox>
         </label>
       </li>
      </ul>
 </div>

    <h3>Five Year Loss History</h3>
    <div class="quote_box">
         <ul>
      <li>
          <label>Was there any losses in the past five years?</label>
          <asp:RadioButton ID="rbLoss11Yes" GroupName="5YearLoss" Text="Yes" AutoPostBack="true" runat="server" OnCheckedChanged="rbLoss11Yes_CheckedChanged" />
          <asp:RadioButton ID="rbLoss11No" GroupName="5YearLoss" Text="No" AutoPostBack="true" Checked="true" OnCheckedChanged="rbLoss11No_CheckedChanged" runat="server" />
      </li>
     </ul>
    <asp:Panel ID="Panel3" runat="server">             
        <table border="0">
            <tr>
                <td><label>Date</label></td>
                <td><label>Description</label></td>
                <td><label>Amount</label></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox id="txtLossDate11a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDate11a" runat="server" ControlToValidate="txtLossDate11a" Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox id="txtLossDescr11a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDescr11a" runat="server" ControlToValidate="txtLossDescr11a" Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                </td>
                <td>
                  <asp:TextBox id="txtLossAmt11a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvLossAmt11a" runat="server" ControlToValidate="txtLossAmt11a" Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
               </td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate11b" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr11b" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt11b" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate11c" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr11c" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt11c" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate11d" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr11d" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt11d" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate11e" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr11e" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt11e" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
        </table>
   </asp:Panel>
   </div>
      </InsertItemTemplate>  
  </asp:FormView>
                    
    <%--END STEP 11--%>
    <asp:ValidationSummary ID="ValidationSummary8" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep12" runat="server" Title="Vehicle Information">

     <%--STEP 12--%>
      <asp:FormView 
    ID="FormView12" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <script type="text/javascript">
        function showInsert() {
            var divInsert = document.getElementById('divInsert');
            divInsert.style.display = 'block';
        }
        function hideInsert() {
            var divInsert = document.getElementById('divInsert');
            divInsert.style.display = 'none';
        }
    </script>

        <div class="quote_box">
        <h3>Church Owned Vehicle</h3>

            <div id="divDisplay">
            <asp:GridView ID="grdVehicle" runat="server" EmptyDataText="No Data At This Time.">
            </asp:GridView>
            <br />
             <label>**Full coverage required if you desire Rental Reimburement and/or Towing and Labor.</label>
            <br />
            <a href="JavaScript:showInsert();">Add Church Vehicle</a>
            </div>

            <div id="divInsert">
            <h3>Enter Vehicle Information</h3>
                <asp:DetailsView 
                     ID="dtlVehicle" 
                     runat="server" 
                     Height="50px" 
                     Width="125px" 
                     DefaultMode="Insert">
                </asp:DetailsView>
                <a href="JavaScript:hideInsert();">Close</a>
            </div>
        </div>
  </InsertItemTemplate>  
  </asp:FormView>
                    
   <%-- END STEP 12--%>

    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep13" runat="server" Title="Workers Compensation - A">

    <%--STEP 13--%>
    <asp:FormView 
    ID="FormView13" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Workers Compensation application</h3>
    <div class="quote_box">
    <table border="0">
            <tr>
                <td><label>Federal Employer ID Number</label></td>
                <td>
                  <asp:TextBox id="txtFEIN" runat="server" Width="186px" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFEIN" runat="server" ControlToValidate="txtFEIN" Text="*" ErrorMessage="Missing FEIN" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <label>Current Carrier</label>
                   </td>
                <td>
                  <asp:TextBox id="txtPriorCarrier" runat="server" Width="287px" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPriorCarrier" runat="server" ControlToValidate="txtPriorCarrier" Text="*" ErrorMessage="Missing current carrier" ForeColor="Red" />
                   </td>
            </tr>
            <tr>
                <td>
                   <label>Current Premium</label>
                   </td>
                <td>
                   <asp:TextBox id="txtCurrPrem" runat="server" Width="90px" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCurrPrem" runat="server" ControlToValidate="txtCurrPrem" Text="*" ErrorMessage="Missing current premium" ForeColor="Red" />
                  </td>
            </tr>
        </table>
 </div>

 <h3>Rating Information</h3>
 <div class="quote_box">
        <table border="0">
            <tr>
                <td class="style1"><b><label>Codes and Classifications</label></b></td>
                <td><b><label>Number of Employees</label></b></td>
                <td><b><label>Estimated Annual Renumeration</label></b></td>
            </tr>
            <tr>
                <td class="style1">
                   <label>Church/School Professional Employees</label>
                   <p>(Minister(include salary, housing, car/travel allowance), Secretaries, Musicians, Kindergarten, School Teachers)</p>
                </td>
                <td><asp:TextBox id="txtProfEmpNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox></td>
                <td><asp:TextBox id="txtProfEmpPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style1">
                  <label>Church/School All Other Employees</label>
                  <p>(Janitor, Maid, Cooks, Yard Maintenance)</p>
                </td>
                <td><asp:TextBox id="txtAllOthNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox></td>
                <td><asp:TextBox id="txtAllOthPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style1">
                 <label>Day Care Professional Employees</label>
                 <p>(Teachers, Nursery Workers, Aides)</p>
                </td>
                <td><asp:TextBox id="txtDayProNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox></td>
                <td><asp:TextBox id="txtDayProPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style1">
                  <label>Day Care All Other Employees</label>
                  <p>(Janitor, Maid, Cooks, Yard Maintenance, Drivers)</p>
                </td>
                <td><asp:TextBox id="txtDayOthNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox></td>
                <td><asp:TextBox id="txtDayOthPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style1">
                  <label>Drivers, Chauffeurs, and their helpers</label>
                </td>
                <td><asp:TextBox id="txtDriverNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox></td>
                <td><asp:TextBox id="txtDriverPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="style1">
                  <label>Other-Specify</label>
                  <asp:TextBox id="txtOtherDescr" runat="server" Width="215px" MaxLength="50"></asp:TextBox>

                </td>
                <td><asp:TextBox id="txtOtherNum" runat="server" Width="95px" MaxLength="5"></asp:TextBox></td>
                <td><asp:TextBox id="txtOtherPay" runat="server" Width="110px" MaxLength="10"></asp:TextBox></td>
            </tr>
        </table>
    </div>
      </InsertItemTemplate>  
  </asp:FormView>
                    
  <%--  END STEP 13--%>
  <asp:ValidationSummary ID="ValidationSummary9" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep14" runat="server" Title="Workers Compensation - B">

    <%--STEP 14--%>
       <asp:FormView 
    ID="FormView14" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>General Information</h3>
       <div class="quote_box">
       <table border="0">
               <tr>
                   <td class="MyStyle"><label>Does applicant own, operate or lease air/watercraft?</label></td>
                   <td>
                     <asp:RadioButton id="rb1Yes" runat="server" GroupName="rb1grp" Text="Yes"></asp:RadioButton>                                                          
                     <asp:RadioButton id="rb1No" runat="server" GroupName="rb1grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Is applicant engaged in any other type of business?</label></td>
                   <td>
                      <asp:RadioButton id="rb2Yes" runat="server" GroupName="rb2grp" Text="Yes"></asp:RadioButton>
                      <asp:RadioButton id="rb2No" runat="server" GroupName="rb2grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Are sub-contractors used?</label></td>
                   <td><asp:RadioButton id="rb4Yes" runat="server" GroupName="rb4grp" Text="Yes"></asp:RadioButton>
                       <asp:RadioButton id="rb4No" runat="server" GroupName="rb4grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Is a formal safety program in operation?</label></td>
                   <td>
                      <asp:RadioButton id="rb5Yes" runat="server" GroupName="rb5grp" Text="Yes"></asp:RadioButton>
                      <asp:RadioButton id="rb5No" runat="server" GroupName="rb5grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Any employees under 16 years of age?</label></td>
                   <td>
                     <asp:RadioButton id="rb6Yes" runat="server" GroupName="rb6grp" Text="Yes"></asp:RadioButton>
                     <asp:RadioButton id="rb6No" runat="server" GroupName="rb6grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Any employees over 65 years of age?</label></td>
                   <td>
                      <asp:RadioButton id="rb7Yes" runat="server" GroupName="rb7grp" Text="Yes"></asp:RadioButton>
                       <asp:RadioButton id="rb7No" runat="server" GroupName="rb7grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Any employees with physical handicaps?</label></td>
                   <td>
                      <asp:RadioButton id="rb8Yes" runat="server" GroupName="rb8grp" Text="Yes"></asp:RadioButton>
                      <asp:RadioButton id="rb8No" runat="server" GroupName="rb8grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Do employees travel out of state?</label></td>
                   <td>
                      <asp:RadioButton id="rb9Yes" runat="server" GroupName="rb9grp" Text="Yes"></asp:RadioButton>
                      <asp:RadioButton id="rb9No" runat="server" GroupName="rb9grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Are pre-employment physicals required?</label></td>
                   <td>
                      <asp:RadioButton id="rb10Yes" runat="server" GroupName="rb10grp" Text="Yes"></asp:RadioButton>
                      <asp:RadioButton id="rb10No" runat="server" GroupName="rb10grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Does applicant provide transportation for school, day care, or kindergarten?</label></td>
                   <td>
                       <asp:RadioButton id="rb11Yes" runat="server" GroupName="rb11grp" Text="Yes"></asp:RadioButton>
                        <asp:RadioButton id="rb11No" runat="server" GroupName="rb11grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
               <tr>
                   <td class="MyStyle"><label>Any prior coverage declined/canceled/non-renewed in the last five years?</label></td>
                   <td>
                      <asp:RadioButton id="rb12Yes" runat="server" GroupName="rb12grp" Text="Yes"></asp:RadioButton>
                       <asp:RadioButton id="rb12No" runat="server" GroupName="rb12grp" Text="No" Checked="true"></asp:RadioButton>
                   </td>
               </tr>
           </table>
           <br />
        <ul>
       <li><label>Please explain all YES responses or place other comments below:
       <br />
        <asp:TextBox id="txtExplYes" runat="server" Height="116px" Width="558px" MaxLength="8000"></asp:TextBox>
        </label>
        </li>
       </ul>
   </div>

   <h3>Five Year Loss History</h3>
    <div class="quote_box">
         <ul>
      <li>
          <label>Was there any losses in the past five years?</label>
          <asp:RadioButton ID="rbLoss14Yes" GroupName="5YearLoss" Text="Yes" AutoPostBack="true" runat="server" OnCheckedChanged="rbLoss14Yes_CheckedChanged" />
          <asp:RadioButton ID="rbLoss14No" GroupName="5YearLoss" Text="No" AutoPostBack="true" Checked="true" OnCheckedChanged="rbLoss14No_CheckedChanged" runat="server" />
      </li>
     </ul>
    <asp:Panel ID="Panel4" runat="server">             
        <table border="0">
            <tr>
                <td><label>Date</label></td>
                <td><label>Description</label></td>
                <td><label>Amount</label></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox id="txtLossDate14a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDate14a" runat="server" ControlToValidate="txtLossDate14a" Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox id="txtLossDescr14a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDescr14a" runat="server" ControlToValidate="txtLossDescr14a" Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                </td>
                <td>
                  <asp:TextBox id="txtLossAmt14a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvLossAmt14a" runat="server" ControlToValidate="txtLossAmt14a" Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
               </td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate14b" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr14b" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt14b" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate14c" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr14c" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt14c" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate14d" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr14d" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt14d" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate14e" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr14e" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt14e" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
        </table>
   </asp:Panel>
   </div>
  </InsertItemTemplate>  
  </asp:FormView>             
    <%--END STEP 14--%>
    <asp:ValidationSummary ID="ValidationSummary10" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep15" runat="server" Title="Umbrella">

    <%--STEP 15--%>
    <asp:FormView 
    ID="FormView15" 
    runat="server"
    DefaultMode="Insert">
 <InsertItemTemplate>
    <h3>Umbrella Application</h3>
       <div class="quote_box">
       <ul>
         <li><label>Limit of Liability</label></li>
         <li>
            <asp:DropDownList id="ddLimit" runat="server">
                <asp:ListItem Value="1,000,000" Selected="True">1,000,000</asp:ListItem>
                <asp:ListItem Value="2,000,000">2,000,000</asp:ListItem>
            </asp:DropDownList>
         </li>
       </ul>
       <ul>
        <li><label>Does the church own any automobiles?</label></li>
        <li>
            <asp:RadioButton id="rb1Yes" runat="server" GroupName="rb1grp" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rb1No" runat="server" GroupName="rb1grp" Text="No" Checked="true"></asp:RadioButton>
        </li>
       </ul>
       <ul>
        <li><label>Does the church have a Workers Compensation policy?</label></li>
        <li>
            <asp:RadioButton id="rb2Yes" runat="server" GroupName="rb2grp" Text="Yes"></asp:RadioButton>
            <asp:RadioButton id="rb2No" runat="server" GroupName="rb2grp" Text="No" Checked="true"></asp:RadioButton>
        </li>
       </ul>
       <ul>
        <li><label>Current Carrier
        <br />
         <asp:TextBox id="txtPriorCarrier" runat="server" Width="200px" MaxLength="40"></asp:TextBox>
        </label>
        </li>
        <li><asp:RequiredFieldValidator ID="rfvPriorCarrier" runat="server" ControlToValidate="txtPriorCarrier" Text="*" ErrorMessage="Missing current carrier" ForeColor="Red" /></li>
        </ul>
        <ul>
        <li>
         <label>Current Premium
         <br />
          <asp:TextBox id="txtPriorPrem" runat="server" Width="100px" MaxLength="40"></asp:TextBox>
         </label>
        </li>
       </ul>
       <ul>
        <li><label>Comments
        <br />
        <asp:TextBox id="txtComments" runat="server" Width="485px" Height="104px" TextMode="MultiLine"></asp:TextBox>
        </label>
        </li>
       </ul>
 </div>

 <h3>Five Year Loss History</h3>
    <div class="quote_box">
         <ul>
      <li>
          <label>Was there any losses in the past five years?</label>
          <asp:RadioButton ID="rbLoss15Yes" GroupName="5YearLoss" Text="Yes" AutoPostBack="true" runat="server" OnCheckedChanged="rbLoss15Yes_CheckedChanged" />
          <asp:RadioButton ID="rbLoss15No" GroupName="5YearLoss" Text="No" AutoPostBack="true" Checked="true" runat="server" OnCheckedChanged="rbLoss15No_CheckedChanged" />
      </li>
     </ul>
    <asp:Panel ID="Panel5" runat="server">             
        <table border="0">
            <tr>
                <td><label>Date</label></td>
                <td><label>Description</label></td>
                <td><label>Amount</label></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox id="txtLossDate15a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDate15a" runat="server" ControlToValidate="txtLossDate15a" Text="*" ErrorMessage="Missing loss date." ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox id="txtLossDescr15a" runat="server" Width="400px" MaxLength="60" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLossDescr15a" runat="server" ControlToValidate="txtLossDescr15a" Text="*" ErrorMessage="Missing loss description" ForeColor="Red" />
                </td>
                <td>
                  <asp:TextBox id="txtLossAmt15a" runat="server" MaxLength="10" Width="75px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvLossAmt15a" runat="server" ControlToValidate="txtLossAmt15a" Text="*" ErrorMessage="Missing amount loss" ForeColor="Red" />
               </td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate15b" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr15b" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt15b" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:TextBox id="txtLossDate15c" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr15c" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt15c" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate15d" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr15d" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt15d" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
             <tr>
                <td><asp:TextBox id="txtLossDate15e" runat="server" Width="75px" MaxLength="10"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossDescr15e" runat="server" Width="400px" MaxLength="60"></asp:TextBox></td>
                <td><asp:TextBox id="txtLossAmt15e" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
        </table>
   </asp:Panel>
   </div>
  </InsertItemTemplate>  
  </asp:FormView>

<%--END STEP 15--%>
    <asp:ValidationSummary ID="ValidationSummary11" runat="server" ShowMessageBox="True" ShowSummary="False" />              
</asp:WizardStep>

    <asp:WizardStep ID="WizardStep18" runat="server" Title="Log">
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

    <asp:WizardStep ID="WizardStep19" runat="server" Title="Step 19">
    </asp:WizardStep>

</WizardSteps>
</asp:Wizard>
</div>