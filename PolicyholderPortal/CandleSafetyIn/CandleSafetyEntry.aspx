<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CandleSafetyEntry.aspx.vb" Inherits="PolicyholderPortal_CandleSafety_CandleSafetyEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Candle Safety Form</title>
    <script type="text/javascript">
//        function valComments_ClientValidate(source, args) {
//            if (args.Value.length < 4)
//                args.IsValid = false;
//            else
//                args.IsValid = true;

//        }

//        function valZip_ClientValidate(source, args) {
//            if (args.Value.length < 5)
//                args.IsValid = false;
//            else
//                args.IsValid = true;
//        }
    </script>

<style type="text/css">
           
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
           
body {
    background-image: url('../../CSS/Images/Advent-Wreath-for-Candle-Program-website.png');
    background-repeat:no-repeat; 
    background-position:center;
    background-color:#050503;               
}
            
body {
    font: 14px 'ColaborateLightRegular', Arial, sans-serif;
} 
            
.TransparentBox {            
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
          
fieldset {
    background-color:#f1f1f1;
    border:none;
    border-radius:2px;
    margin-bottom:12px;
    overflow:hidden;
    padding: 0 10px; 
    height:350px;
}

.finish {
    text-align:right;
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

.gridview {
    font-size:11px;
    margin:20px; 
}
            
.gridview td, gridview th {
    padding:8px;
}
                   
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

label {
    display:inline-block;
    padding:3px 6px;
    text-align:right;
    width:125px;
    vertical-align:top; 
    border:0px solid black; 
}
          
.message {
    padding:5px;
}
                                                    
#person {
    margin:1px 0 25px 10px;
    list-style:none;
    } 
          
.person_box {
    padding:5px;
    font-size:12px;
    border:.5px solid #e8e9ea;
    color:#505151;
}

.radios label {
    padding:0;
    text-align:left;
} 
                       
.submit {
    height:675px;
}
                    
ul {
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
          
ul li p {
    margin: 15px 20px;
}
                         
 </style>
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div class="TransparentBox">    
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
             Height="35%">
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
                      CommandName="Cancel" Text="Exit" CssClass="buttons" OnClientClick="javascript:window.close();" />
              </FinishNavigationTemplate>
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" StepType="Step">
            <fieldset class="submit">
             <h2 class="account">Candle Use</h2>
                <ul>
                    <li>
                      <b><i>Our church uses:</i></b>
                      <asp:RequiredFieldValidator 
                           ID="rfvCandleUse" 
                           ControlToValidate="rblCandleUse" 
                           runat="server" 
                           ForeColor="Red" 
                           ErrorMessage="Please select an option." 
                           Text="*" />
                    </li>                    
            <li style="white-space:nowrap;">
            <asp:RadioButtonList ID="rblCandleUse" CssClass="radios" runat="server">
                <asp:ListItem Text="Open Flame Candles" Value="Open Flame Candles" Selected="False" />
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
                      <%--Forgot to put the max length, just notice that on 12/15/2016--%>
                     <asp:TextBox ID="txtFullName" runat="server" CssClass="person_box" MaxLength="25" />                         
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
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2" 
                        StepType="Finish">
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
        </asp:UpdatePanel>  
         
       </div>     
    </div>
       <asp:ObjectDataSource 
             ID="srcGetRecord"
             runat="server"
             SelectMethod="CandleSafetyMailingAddress" 
             TypeName="_GetRecord">         
            <SelectParameters>
                <asp:SessionParameter Name="custnum" SessionField="UserNameIs" Type="Int32" />
                <asp:SessionParameter Name="postalcode" SessionField="postalcode" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="odsAddRecord" 
         runat="server"
         InsertMethod="AddDesignatedPerson"
         TypeName="_AddRecord">
      <InsertParameters>
        <asp:SessionParameter Name="custnum" SessionField="UserNameIs" />
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
            <asp:SessionParameter Name="custnum" SessionField="UserNameIs" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>


    </form>
</body>
</html>
