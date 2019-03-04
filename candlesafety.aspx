<%@ Page Language="VB" AutoEventWireup="false" CodeFile="candlesafety.aspx.vb" Inherits="candlesafety" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Candle Safety Form</title>
    <script type="text/javascript">
        function valComments_ClientValidate(source, args) {
            if (args.Value.length < 10)
                args.IsValid = false;
            else
                args.IsValid = true;

        }

        function valZip_ClientValidate(source, args) {
            if (args.Value.length < 5)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    </script>

        <style type="text/css">
            body {
                background-image: url('CSS/Images/Advent-Wreath-for-Candle-Program-website.png');
                background-repeat:no-repeat; 
                background-position:center;
                background-color:#050503;
                
           }
            
           body {
            font: 14px 'ColaborateLightRegular', Arial, sans-serif;
           } 
            
          .box1 {            
	         margin-right: auto;
	         margin-left: auto;
	         height:500px;
	         background-color:rgba(0,0,0, 0.5);	         	         
          } 
          
         .box2 {
             width: 500px;
	         margin-right: auto;
	         margin-left: auto;
	         margin-top:7%;
	         padding:20px;      
          } 
          
        .address {
            margin:20px;           
            }
                     
        .address li {
            list-style:none;
            margin:10px;
            padding-bottom:10px;
            border-bottom:1px dotted #ddd;
            }   
            
        .address li label {
            padding-right:15px;
            } 
         
        .person_box {
            padding:5px;
            font-size:12px;
            border:.5px solid #e8e9ea;
            color:#505151;
            }
         
         .message {
             padding:5px;
            }
         
         #person {
             margin:1px 0 25px 10px;
             list-style:none;
             } 
                         
          fieldset {
             background-color:#f1f1f1;
             border:none;
             border-radius:2px;
             margin-bottom:12px;
             overflow:hidden;
             padding: 0 10px; 
             height:350px;
          }
          
          fieldset.start {
             background-color:#f1f1f1;
             opacity:.8em;
             border:none;
             border-radius:2px;
             margin-bottom:12px;
             overflow:hidden;
             padding: 0 10px; 
             height:50px;            
          }
          
           fieldset.step {
             background-color:#f1f1f1;
             opacity:.8em;
             border:none;
             border-radius:2px;
             margin-bottom:12px;
             overflow:hidden;
             padding: 0 8px; 
             height:50px;            
          }
          
          .submit {height:675px;}
          
          h2 {
             background-color:#dedede;
             border-bottom:1px solid #d4d4d4;
             border-top:1px solid #d4d4d4;
             border-radius:5px;
             box-shadow:3px 3px 3px #ccc;
             color:#fff;
             font-size:1.1em;
             margin:12px;
             padding:0.3em 1em;
             text-shadow:#9FBEB9 1px 1px 1px;
             text-transform:uppercase;   
          }
                   
          h2.account {
              background-color:#DA820A;
          }
                    
         ul 
          {
              background-color:#fff;
              border:1px solid #eaeaea;
              list-style:none;
              margin:12px;
              padding:12px;
              height:70%;             
          }
          
          ul li {
              margin: 0.5em 0;
          }
          
          ul li p {margin: 15px 20px;}
          
          label {
              display:inline-block;
              padding:3px 6px;
              text-align:right;
              width:125px;
              vertical-align:top; 
              border:0px solid black; 
          }
          
          .radios label {
              padding:0;
              text-align:left;
          }  
          
          .finish {
              text-align:right;
          }  
          
          .buttons {
            background-color:#DA820A;
            border:none;
            border-radius:4px;
            box-shadow:2px 2px 2px #333;
            color:#fff;
            margin:5px;
            padding:7px;
            text-shadow:1px 1px 0px #CCC; 
            text-decoration:none;
          }  
          
          .gridview {
            font-size:11px;
            margin:20px; 
            }
            
        .gridview td, gridview th {
            padding:8px;
            }
          
               
         </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="box1">
    <div class="box2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">     
                <ContentTemplate>
          <asp:Wizard 
             ID="Wizard1" 
             runat="server" 
             DisplayCancelButton="True" 
             ActiveStepIndex="0" 
             Width="410px"
             DisplaySideBar="False" 
             CancelDestinationPageUrl="~/login/login_p.aspx" 
             Height="35%">
            <StartNavigationTemplate>          
                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                    Text="Next" CssClass="buttons" onclick="StartNextButton_Click" />
            </StartNavigationTemplate>
            <StepNavigationTemplate>
              <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
                    CommandName="MovePrevious" CssClass="buttons" Text="Previous" 
                    Visible="False" />
                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                    Text="Next" CssClass="buttons" onclick="StepNextButton_Click" CausesValidation="false" />
                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancel" CssClass="buttons" 
                    PostBackUrl="~/Default.aspx" Visible="False" />
            </StepNavigationTemplate>
              <FinishNavigationTemplate>
                  <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                      CommandName="MovePrevious" Text="Previous" CssClass="buttons" />
                  <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                      onclick="FinishButton_Click" Text="Finish" CssClass="buttons" />
                  <asp:Button ID="CancelButton" runat="server" CausesValidation="False" 
                      CommandName="Cancel" Text="Exit" CssClass="buttons" />
              </FinishNavigationTemplate>
           
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" StepType="Start">
                <fieldset>
                  <h2 class="account">Account Lookup</h2>
                <ul>
                  <li>
                    <label>Customer Number:</label>
                    <asp:TextBox ID="txtCustomerNum" runat="server" MaxLength="10" AutoCompleteType="Disabled" />
                  </li>
                  <li>
                    <label>Postal Code:</label>
                    <asp:TextBox ID="txtPostalCode" runat="server" MaxLength="5" AutoCompleteType="Disabled" />
                  </li>
                    <li>
                    <asp:DetailsView 
                        ID="dtlMatch" 
                        EmptyDataText="<b>No Matching Record!</b>" 
                        runat="server" 
                        BorderColor="White" 
                        BorderStyle="None" >
                    </asp:DetailsView>
                        <asp:CustomValidator ID="valComments" runat="server" ForeColor="White" ControlToValidate="txtCustomerNum" Text="*" ErrorMessage="Customer number must be 10 digits in length" OnServerValidate="valComments_ServerValidate" ClientValidationFunction="valComments_ClientValidate" />
                        <asp:RequiredFieldValidator ID="rfvCustomerNum" runat="server" ForeColor="White" ErrorMessage="Missing customer number." Text="*" ControlToValidate="txtCustomerNum" />
                        <asp:RegularExpressionValidator ID="revCustomerNum" runat="server" ForeColor="White" ErrorMessage="Numeric values only for customer number." Text="*" ValidationExpression="^\d+$" ControlToValidate="txtCustomerNum" />
                        <asp:CustomValidator ID="valZip" runat="server" ForeColor="White" ControlToValidate="txtPostalCode" Text="*" ErrorMessage="Postal code must be 5 digits in length" OnServerValidate="valZip_ServerValidate" ClientValidationFunction="valZip_ClientValidate" />
                        <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ForeColor="White" ErrorMessage="Missing postal code." Text="*" ControlToValidate="txtPostalCode" />
                        <asp:RegularExpressionValidator ID="revPostalCode" runat="server" ForeColor="White" ErrorMessage="Numeric values only for postal code." ControlToValidate="txtPostalCode" Text="*" ValidationExpression="^\d+$" />

                    </li>
                  <li>
                     <p><b>Customer number</b> must be ten digits in length preceded by zeros. Example, 0000001234.</p>
                    </li>  
                </ul>
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </fieldset>
         </asp:WizardStep>
              <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2" StepType="Step">
                  <asp:FormView 
                    ID="frmAddress" 
                    runat="server" >
                        <EmptyDataTemplate>  
                         <fieldset>              
                                <ul>
                                    <li>
                                        <p>No match found. Please check your entry and try again.</p>
                                    </li>
                                </ul>   
                           </fieldset>                                       
                        </EmptyDataTemplate>
                    <ItemTemplate>
                    <fieldset>
                    <h2 class="account">Address</h2>
                        <ul>
                            <li>
                                <asp:Label ID="lblCustNum" runat="server" Text="" Visible="false" />
                            </li>
                            <li>
                            <label>Church:</label>
                            <asp:TextBox ID="txtChurch" Text='<%# Eval("insured_name") %>' runat="server" 
                                    ReadOnly="true" Width="180px" CssClass="textbox" BorderStyle="None" />
                            </li>
                            <li>
                            <label>Mailing Address:</label>
                            <asp:TextBox ID="txtAddress" Text='<%# Eval("mail_addr") %>' runat="server" 
                                    Width="180px" ReadOnly="true" CssClass="textbox" BorderStyle="None" />
                            </li>
                            <li>
                            <label>Mailing City:</label>
                            <asp:TextBox ID="txtCity" Text='<%# Eval("mail_city") %>' runat="server" 
                                    ReadOnly="true" CssClass="textbox" BorderStyle="None" />
                            </li>    
                            <li>
                            <label>Mailing State:</label>
                            <asp:TextBox ID="txtState" Text='<%# Eval("mail_state") %>' runat="server" 
                                    ReadOnly="true" CssClass="textbox" BorderStyle="None" />
                            </li>  
                            <li>
                            <label>Mailing Zip:</label>
                            <asp:TextBox ID="txtZip" Text='<%# Eval("mail_zip") %>' runat="server" 
                                    ReadOnly="true" CssClass="textbox" BorderStyle="None" />
                            </li> 
                            <li>
                            <label>Actual Location:</label>
                            <asp:TextBox ID="txtLocation" Text='<%# Eval("actual_location") %>' Visible="true" 
                                    runat="server" ReadOnly="true" CssClass="textbox" BorderStyle="None" />                        
                            </li>  
                            <li>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ForeColor="White" ErrorMessage="Missing street address." Text="*" ControlToValidate="txtAddress" />
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ForeColor="White" ErrorMessage="Missing city." Text="*" ControlToValidate="txtCity" />
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ForeColor="White" ErrorMessage="Missing state." Text="*" ControlToValidate="txtState" />
                            <asp:RequiredFieldValidator ID="rfvZip" runat="server" ForeColor="White" ErrorMessage="Missing zip code." Text="*" ControlToValidate="txtZip" />
                            <%--<asp:RegularExpressionValidator ID="revPostalCode" runat="server" ForeColor="White" ErrorMessage="Numeric values only for zip code." ControlToValidate="txtZip" Text="*" ValidationExpression="^\d+$" />--%>
                            <asp:CustomValidator ID="valZip" runat="server" ForeColor="White" ControlToValidate="txtZip" Text="*" ErrorMessage="Zip code must be 5 digits in length" OnServerValidate="valZip_ServerValidate" ClientValidationFunction="valZip_ClientValidate" />
                          </li>        
                            </ul>
                              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                            </fieldset>
                            </ItemTemplate>
                        </asp:FormView>

    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep3" runat="server" StepType="Step" Title="Step 3">
    <fieldset class="submit">
        <h2 class="account">Candle Use</h2>
        <ul>
            <li><b><i>Our church uses:</i></b></li>                    
            <li style="white-space:nowrap;">
            <asp:RadioButtonList ID="rblCandleUse" CssClass="radios" runat="server">
            <asp:ListItem Text="Open Flame Candles" Value="Open Flame Candles" Selected="True" />
            <asp:ListItem Text="No Candles" Value="No Candles" />                                              
            <asp:ListItem Text="Non Flame Candles" Value="Non Flame Candles" />
        </asp:RadioButtonList>
            </li>
            <li><b><i>Who will be the designated candle person?</i></b></li>
            <li></li>
          <li>
          <asp:FormView 
             ID="frmPerson" 
             runat="server" 
             DataSourceID="odsAddRecord" 
             DefaultMode="Insert">
            <InsertItemTemplate>
                <ul id="person">
                 <li>
                     <asp:TextBox ID="txtFullName" runat="server" CssClass="person_box" />                         
                      <asp:LinkButton 
                           ID="lnkAddRecord" 
                           CommandName="Insert" 
                           Text="Insert Full Name" 
                           runat="server" 
                           CssClass="buttons" 
                           CausesValidation="True" 
                           onclick="lnkAddRecord_Click" />
                        <asp:RequiredFieldValidator 
                           ID="rfvFullName" 
                           runat="server" 
                           ErrorMessage="Missing Full Name" 
                           Text="*" 
                           ForeColor="Red" 
                           Enabled="true" 
                           ControlToValidate="txtFullName"  />                           
                     </li>
                     <li>
                      <asp:Label ID="lblLimit" runat="server" Visible="true" Text="Only maximum of five can be entered."/>
                     </li>
                </ul>
                </InsertItemTemplate>
             </asp:FormView>
             </li>
                                  
                    <asp:GridView 
                     ID="grvDesignate" 
                     DataSourceID="srcGetDesignate"
                     runat="server" 
                     CssClass="gridview" 
                     AutoGenerateColumns="False" 
                     DataKeyNames="designateid" 
                     HeaderStyle-CssClass="grHeader" 
                     RowStyle-CssClass="row" 
                     AllowPaging="True" 
                     GridLines="None" >
                    <Columns>
                            <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="Delete" 
                                        OnClientClick="return confirm('Are you sure?')" OnClick="DeleteButton_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designate ID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("designateid") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("designateid") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="custnum" HeaderText="Customer Number" 
                                        Visible="False" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fullname" HeaderText="Name" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="CandleUse">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCandleUse" runat="server" Text='<%# Bind("candleuse") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("candleuse") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("entrydate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("entrydate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="entryrecipient" HeaderText="EntryRecipient" 
                                        Visible="False" >
                                    <HeaderStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                            <HeaderStyle CssClass="grHeader"></HeaderStyle>
                        <RowStyle CssClass="row"></RowStyle>
                    </asp:GridView>  
                      </ul>                 
                    </fieldset>  
                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" />                             
             </asp:WizardStep>


                <asp:WizardStep ID="Wizardfinish" runat="server" StepType="Finish" Title="Finish">
                  <fieldset>
                        <h2 class="account">Complete</h2>
                        <ul>
                        <li>
                            <p>We appreciate your participation in the Candle Safety Program! Wishing you a blessed and Merry Christmas.</p>
                        </li>
                        </ul>               
                    <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowMessageBox="True" ShowSummary="False" />
                  </fieldset>
                </asp:WizardStep>


            </WizardSteps>
        </asp:Wizard>
       </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Wizard1" EventName="NextButtonClick" />
                    <asp:AsyncPostBackTrigger ControlID="Wizard1" EventName="FinishButtonClick" />
                    <asp:AsyncPostBackTrigger ControlID="Wizard1" EventName="PreviousButtonClick" />
                    <asp:AsyncPostBackTrigger ControlID="Wizard1" EventName="CancelButtonClick" />
                </Triggers>
  </asp:UpdatePanel> 
    </div>
    </div>

       <asp:ObjectDataSource 
             ID="srcGetRecord"
             runat="server"
             SelectMethod="CandleSafetyMailingAddress" 
             TypeName="_GetRecord">         
            <SelectParameters>
                <asp:SessionParameter Name="custnum" SessionField="custnum" Type="Int32" />
                <asp:SessionParameter Name="postalcode" SessionField="postalcode" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="odsAddRecord" 
         runat="server"
         InsertMethod="AddDesignatedPerson"
         TypeName="_AddRecord">
      <InsertParameters>
        <asp:SessionParameter Name="custnum" SessionField="custnum" />
        <asp:SessionParameter Name="fullname" SessionField="fullname" />
        <asp:SessionParameter Name="candleuse" SessionField="candleuse" />
        <asp:SessionParameter Name="entry" SessionField="entry" />
    </InsertParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
            ID="srcGetDesignate"
            runat="server"
            SelectMethod="CandleSafetyDesignate" 
            TypeName="_GetRecord" 
            DeleteMethod="DeleteDesignatedPerson">         
            <DeleteParameters>
                <asp:SessionParameter Name="designateid" SessionField="designateid" />
            </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="custnum" SessionField="custnum" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>




    </form>
</body>
</html>


        

