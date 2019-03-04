<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Edit_Quote_Request_SMP.ascx.vb"
    Inherits="WizardSteps_Edit_Quote_Request_SMP" %>
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
        font-family: Tahoma;
        font-size: 9px;
    }
    </style>
<asp:FormView ID="FormView1" runat="server" DataSourceID="odsGeneralInfo">
    <EditItemTemplate>
        <div class="quote_box1">
            Reqnum:
            <asp:TextBox ID="ReqnumTextBox" runat="server" Text='<%# Bind("Reqnum") %>' />
            <br />
            Agency:
            <asp:TextBox ID="AgencyTextBox" runat="server" Text='<%# Bind("Agency") %>' />
            <br />
            Agentnum:
            <asp:TextBox ID="AgentnumTextBox" runat="server" Text='<%# Bind("Agentnum") %>' />
            <br />
            Agentname:
            <asp:TextBox ID="AgentnameTextBox" runat="server" Text='<%# Bind("Agentname") %>' />
            <br />
            Agentemail1:
            <asp:TextBox ID="Agentemail1TextBox" runat="server" Text='<%# Bind("Agentemail1") %>' />
            <br />
            Agentemail2:
            <asp:TextBox ID="Agentemail2TextBox" runat="server" Text='<%# Bind("Agentemail2") %>' />
            <br />
            Churchname:
            <asp:TextBox ID="ChurchnameTextBox" runat="server" Text='<%# Bind("Churchname") %>' />
            <br />
            Mailingaddress:
            <asp:TextBox ID="MailingaddressTextBox" runat="server" Text='<%# Bind("Mailingaddress") %>' />
            <br />
            Mailingcity:
            <asp:TextBox ID="MailingcityTextBox" runat="server" Text='<%# Bind("Mailingcity") %>' />
            <br />
            Mailingstate:
            <asp:TextBox ID="MailingstateTextBox" runat="server" Text='<%# Bind("Mailingstate") %>' />
            <br />
            Mailingzip:
            <asp:TextBox ID="MailingzipTextBox" runat="server" Text='<%# Bind("Mailingzip") %>' />
            <br />
            Churchurl:
            <asp:TextBox ID="ChurchurlTextBox" runat="server" Text='<%# Bind("Churchurl") %>' />
            <br />
            Currentcarrier:
            <asp:TextBox ID="CurrentcarrierTextBox" runat="server" Text='<%# Bind("Currentcarrier") %>' />
            <br />
            Exdate:
            <asp:TextBox ID="ExdateTextBox" runat="server" Text='<%# Bind("Exdate") %>' />
            <br />
            Currsmpprem:
            <asp:TextBox ID="CurrsmppremTextBox" runat="server" Text='<%# Bind("Currsmpprem") %>' />
            <br />
            Prior3:
            <asp:TextBox ID="Prior3TextBox" runat="server" Text='<%# Bind("Prior3") %>' />
            <br />
            Priorexplain:
            <asp:TextBox ID="PriorexplainTextBox" runat="server" Text='<%# Bind("Priorexplain") %>' />
            <br />
            Contact:
            <asp:TextBox ID="ContactTextBox" runat="server" Text='<%# Bind("Contact") %>' />
            <br />
            Phone1:
            <asp:TextBox ID="Phone1TextBox" runat="server" Text='<%# Bind("Phone1") %>' />
            <br />
            Phone2:
            <asp:TextBox ID="Phone2TextBox" runat="server" Text='<%# Bind("Phone2") %>' />
            <br />
            Mortlosspayee:
            <asp:TextBox ID="MortlosspayeeTextBox" runat="server" Text='<%# Bind("Mortlosspayee") %>' />
            <br />
            Incorp:
            <asp:TextBox ID="IncorpTextBox" runat="server" Text='<%# Bind("Incorp") %>' />
            <br />
            Quotetype:
            <asp:TextBox ID="QuotetypeTextBox" runat="server" Text='<%# Bind("Quotetype") %>' />
            <br />
            Applevel:
            <asp:TextBox ID="ApplevelTextBox" runat="server" Text='<%# Bind("Applevel") %>' />
            <br />
            Status:
            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
            <br />
            Submittdate:
            <asp:TextBox ID="SubmittdateTextBox" runat="server" Text='<%# Bind("Submittdate") %>' />
            <br />
            Assignedto:
            <asp:TextBox ID="AssignedtoTextBox" runat="server" Text='<%# Bind("Assignedto") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </div>
    </EditItemTemplate>
    <ItemTemplate>
        <h3>
            Quote Request Form</h3>
        <div class="quote_box1">
            <ul>
                <li>
                    <label>
                        Agency</label>
                </li>
                <li>
                    <asp:TextBox ID="txtAgency" runat="server" ReadOnly="true" Width="348px" Text='<%# Bind("Agency") %>' />
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Agency Number</label>
                    <asp:TextBox ID="txtAgentNum" runat="server" ReadOnly="true" Text='<%# Bind("Agentnum") %>'></asp:TextBox>
                    <label>
                        Agent</label>
                    <asp:TextBox ID="txtAgentName" runat="server" ReadOnly="true" Text='<%# Bind("Agentname") %>' />
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("QuoteType") %>' />
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Agent Email 1</label></li>
                <li>
                    <asp:TextBox ID="txtAgentEmail" runat="server" ReadOnly="true" Width="305px" MaxLength="75"
                        Text='<%# Bind("Agentemail1") %>' />
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Agent Email 2</label></li>
                <li>
                    <asp:TextBox ID="txtAgentEmail2" runat="server" ReadOnly="true" Width="305px" MaxLength="75"
                        Text='<%# Bind("Agentemail2") %>' /></li>
            </ul>
            <ul>
                <li>
                    <label>
                        Church Name:</label>
                </li>
                <li>
                    <asp:TextBox ID="txtChName" runat="server" ReadOnly="true" Width="304px" MaxLength="180"
                        Text='<%# Bind("Churchname") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Mailing Address</label>
                </li>
                <li>
                    <asp:TextBox ID="txtMailAddr" runat="server" ReadOnly="true" Width="200px" MaxLength="40"
                        Text='<%# Bind("Mailingaddress") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Mailing City</label>
                    <asp:TextBox ID="txtMailCity" runat="server" ReadOnly="true" MaxLength="25" Text='<%# Bind("Mailingcity") %>'></asp:TextBox>
                </li>
                <li>
                    <label>
                        State</label>
                    <asp:DropDownList ID="ddlState" runat="server" Enabled="false" Width="60px" SelectedValue='<%# Bind("Mailingstate") %>'>
                        <asp:ListItem>GA</asp:ListItem>
                        <asp:ListItem>NC</asp:ListItem>
                        <asp:ListItem>SC</asp:ListItem>
                        <asp:ListItem>TN</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>
                        Zip Code</label>
                    <asp:TextBox ID="txtMailZip" runat="server" ReadOnly="true" MaxLength="5" Width="116px"
                        Text='<%# Bind("Mailingzip") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Church Website</label>
                </li>
                <li>
                    <asp:TextBox ID="txtWebAddr" runat="server" ReadOnly="true" MaxLength="50" Width="194px"
                        Text='<%# Bind("Churchurl") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Current Carrier:</label>
                    <asp:TextBox ID="txtCarrier" runat="server" ReadOnly="true" MaxLength="50" Width="180px"
                        Text='<%# Bind("Currentcarrier") %>'></asp:TextBox>
                </li>
                <li>
                    <label>
                        Ex. Date:</label>
                    <asp:TextBox ID="txtExDate" runat="server" ReadOnly="true" MaxLength="10" Text='<%# Bind("Exdate", "{0:d}") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li></li>
                <li>
                    <label>
                        Current SMP Premium</label>
                    <asp:TextBox ID="txtPrem" runat="server" ReadOnly="true" MaxLength="10" Text='<%# Bind("Currsmpprem") %>'></asp:TextBox>
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
                    <asp:RadioButtonList ID="rbPrevPolicyList" runat="server" Enabled="false" RepeatDirection="Horizontal"
                        Text='<%# Bind("Prior3") %>'>
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
                    <asp:TextBox ID="txtComments1" runat="server" ReadOnly="true" Height="60px" TextMode="MultiLine"
                        Width="450px" Text='<%# Bind("Priorexplain") %>'></asp:TextBox></li>
            </ul>
            <ul>
                <li>
                    <label>
                        Contact Person</label>
                    <asp:TextBox ID="txtChContact" runat="server" ReadOnly="true" MaxLength="40" Width="180px"
                        Text='<%# Bind("Contact") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Phone 1</label>
                    <asp:TextBox ID="txtPhone1" runat="server" ReadOnly="true" MaxLength="12" Text='<%# Bind("Phone1") %>'></asp:TextBox>
                </li>
                <li>
                    <label>
                        Phone 2</label>
                    <asp:TextBox ID="txtPhone2" runat="server" ReadOnly="true" MaxLength="12" Text='<%# Bind("Phone2") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Mortgagee/Loss Payee</label>
                    <asp:TextBox ID="txtMortgLP" runat="server" ReadOnly="true" Width="275px" MaxLength="50"
                        Text='<%# Bind("Mortlosspayee") %>'></asp:TextBox>
                </li>
            </ul>
            <ul>
                <li>
                    <label>
                        Is this church incorporated?</label>
                    <asp:RadioButtonList ID="rbIncList" Enabled="false" runat="server" Text='<%# Bind("Incorp") %>'
                        RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem Selected="True">No</asp:ListItem>
                    </asp:RadioButtonList>
                </li>
            </ul>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </div>
    </ItemTemplate>
</asp:FormView>

<asp:ObjectDataSource 
     ID="odsGeneralInfo" 
     TypeName="smci.SqlAccessLayer.MySqlCode"
     runat="server" 
     SelectMethod="GetGeneralInfo" 
     UpdateMethod="UpdateGeneralInfoApplication">
    <SelectParameters>
        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="RequestNumber" Type="Int32" />
        <asp:Parameter Name="Agency" Type="String" />
        <asp:Parameter Name="AgentNumber" Type="String" />
        <asp:Parameter Name="AgentName" Type="String" />
        <asp:Parameter Name="AgentEmail1" Type="String" />
        <asp:Parameter Name="AgentEmail2" Type="String" />
        <asp:Parameter Name="ChurchName" Type="String" />
        <asp:Parameter Name="MailingAddress" Type="String" />
        <asp:Parameter Name="MailingCity" Type="String" />
        <asp:Parameter Name="MailingState" Type="String" />
        <asp:Parameter Name="MailingZip" Type="String" />
        <asp:Parameter Name="ChurchUrl" Type="String" />
        <asp:Parameter Name="CurrentCarrier" Type="String" />
        <asp:Parameter Name="ExDate" Type="DateTime" />
        <asp:Parameter Name="CurrentSmpPremium" Type="Decimal" />
        <asp:Parameter Name="Prior3Years" Type="String" />
        <asp:Parameter Name="PriorExplanation" Type="String" />
        <asp:Parameter Name="ContactPerson" Type="String" />
        <asp:Parameter Name="Phone1" Type="String" />
        <asp:Parameter Name="Phone2" Type="String" />
        <asp:Parameter Name="MortLossPayee" Type="String" />
        <asp:Parameter Name="Incorporated" Type="String" />
        <asp:Parameter Name="QuoteType" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
<hr />
<asp:FormView 
     ID="FormView2" 
     runat="server" 
     DataSourceID="odsSmpApp1">
    <ItemTemplate>
            <h3>Property/Crime</h3>
        <div class="quote_box1">
            <ul>
                <li>
                    <label>
                        Deductible</label></li>
                <li>
                    <asp:DropDownList ID="ddDeduct" runat="server" Enabled="false" SelectedValue='<%# Bind("Deduct") %>'>
                        <asp:ListItem Value="500.0000">500</asp:ListItem>
                        <asp:ListItem Value="1000.0000">1000</asp:ListItem>
                        <asp:ListItem Value="2500.0000">2500</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>
                        Form</label></li>
                <li>
                    <asp:DropDownList ID="ddForm" runat="server" Enabled="false" SelectedValue='<%# Bind("Formtype") %>'>
                        <asp:ListItem Value="Basic">Basic</asp:ListItem>
                        <asp:ListItem Value="Broad">Broad</asp:ListItem>
                        <asp:ListItem Value="Special" Selected="True">Special</asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
            <ul>
                <li>
                    <asp:RadioButtonList ID="rbCostValueList" RepeatDirection="Horizontal" Enabled="false"
                        Text='<%# Bind("Rcacv") %>' runat="server">
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
                    <asp:RadioButtonList ID="rbBlanketCostList" runat="server" Enabled="false" Text='<%# Bind("Blanket") %>'
                        RepeatDirection="Horizontal">
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
                    <asp:RadioButtonList ID="rbEqList" Enabled="false" Text='<%# Bind("Earthquake") %>'
                        runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem Selected="True">No</asp:ListItem>
                    </asp:RadioButtonList>
                </li>
            </ul>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" />
                </div>
            </ItemTemplate>
            <EditItemTemplate>
            </EditItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource 
             ID="odsSmpApp1" 
             TypeName="smci.SqlAccessLayer.MySqlCode" 
             runat="server"
             SelectMethod="GetSmpApplication">
            <SelectParameters>
                <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <hr />
                <h3>Physical Location of the Building</h3>
                <div class="quote_box1">
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
                                <asp:TemplateField HeaderText="Action" ShowHeader="False" Visible="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                            OnClientClick="return confirm('Are you sure?')" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
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
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LocNum" Type="String" />
                        <asp:Parameter Name="LocAddress" Type="String" />
                        <asp:Parameter Name="LocCity" Type="String" />
                        <asp:Parameter Name="LocState" Type="String" />
                        <asp:Parameter Name="LocZip" Type="String" />
                        <asp:Parameter Name="LocCounty" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>

             <hr />
             <h3>Building Information</h3>
                <div class="quote_box2">
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
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
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
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
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
                        <asp:SessionParameter DefaultValue="-1" Name="Buildnumber" SessionField="Buildnumber" />
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
               <hr />

                <asp:FormView 
                     ID="FormView5" 
                     runat="server" 
                     DataSourceID="odsSmpApp2">
                     <ItemTemplate>
                     <h3>Property/Crime Sections</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Money and Securities</label>
                                    <asp:TextBox ID="txtMoney" runat="server" Text='<%# Bind("Moneysecurity") %>' Enabled="false" MaxLength="15"></asp:TextBox>
                                </li>
                                <li>
                                    <label>Employee Dishonesty</label>
                                    <asp:TextBox ID="txtEmpDis" runat="server" Text='<%# Bind("Empdishonesty") %>' Enabled="false" MaxLength="15"></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Forgery</label>
                                    <asp:DropDownList ID="ddForgery" runat="server" Width="110px" Enabled="false" SelectedValue='<%# Bind("Forgery") %>'>
                                        <asp:ListItem Value="5000.0000">5000</asp:ListItem>
                                        <asp:ListItem Value="10000.0000">10000</asp:ListItem>
                                        <asp:ListItem Value="15000.0000">15000</asp:ListItem>
                                        <asp:ListItem Value="20000.0000">20000</asp:ListItem>
                                        <asp:ListItem Value="25000.0000">25000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label>
                                        <i>(Applicable only for Special Form policies)</i></label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Ordinance and Law</label>
                                    <asp:DropDownList ID="ddOrdLaw" runat="server" Width="110px" Enabled="false" SelectedValue='<%# Bind("Ordlaw") %>'>
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="100000.0000">100000</asp:ListItem>
                                        <asp:ListItem Value="150000.0000">150000</asp:ListItem>
                                        <asp:ListItem Value="200000.0000">200000</asp:ListItem>
                                        <asp:ListItem Value="250000.0000">250000</asp:ListItem>
                                        <asp:ListItem Value="300000.0000">300000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Extra Expense</label>
                                    <asp:TextBox ID="txtExtraExp" runat="server" Text='<%# Bind("Extraexp") %>' Enabled="false" MaxLength="15"></asp:TextBox>
                                </li>
                                <li>
                                    <label>
                                        <i>(Enter a value between 10,000 and 100,000 in increments of 1,000)</i></label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Water/Sewer Backup</label>
                                    <asp:TextBox ID="txtWater" runat="server" MaxLength="15" Enabled="false" Text='<%# Bind("Watersewer") %>'></asp:TextBox>
                                </li>
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
                                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="89px" Width="304px" Enabled="false" Text='<%# Bind("Propcomments") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                      <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>

                    <asp:ObjectDataSource 
                         ID="odsSmpApp2" 
                         TypeName="smci.SqlAccessLayer.MySqlCode"
                         runat="server" SelectMethod="GetSmpApplication">
                        <SelectParameters>
                            <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                <%--END STEP 5--%>
                <hr />
                <%--STEP 6--%>
                <asp:FormView 
                     ID="FormView6" 
                     runat="server" 
                     DataSourceID="odsUpdateSmpApp2">
                    <ItemTemplate>
                        <h3>Liability</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>General Liability</label>
                                    <asp:DropDownList ID="ddGLocc" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Genliability") %>'>
                                        <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                        <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                        <asp:ListItem Value="1000000.0000" Selected="True">1,000,000</asp:ListItem>
                                        <asp:ListItem Value="2000000.0000">2,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label>
                                        per occurance/</label>
                                    <asp:DropDownList ID="ddGLagg" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Peroccur") %>'>
                                        <asp:ListItem Value="2000000.0000" Selected="True">2,000,000</asp:ListItem>
                                        <asp:ListItem Value="3000000.0000">3,000,000</asp:ListItem>
                                        <asp:ListItem Value="4000000.0000">4,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                    <label>
                                        aggregate</label>
                                </li>
                                <li>
                                    <label>
                                        Med Pay</label>
                                    <asp:DropDownList ID="ddMedPay" runat="server" Enabled="false" SelectedValue='<%# Bind("Medpay") %>'>
                                        <asp:ListItem Value="1000.0000">1,000</asp:ListItem>
                                        <asp:ListItem Value="2000.0000">2,000</asp:ListItem>
                                        <asp:ListItem Value="2500.0000">2,500</asp:ListItem>
                                        <asp:ListItem Value="3000.0000">3,000</asp:ListItem>
                                        <asp:ListItem Value="5000.0000" Selected="True">5,000</asp:ListItem>
                                        <asp:ListItem Value="10000.0000">10,000</asp:ListItem>
                                        <asp:ListItem Value="15000.0000">15,000</asp:ListItem>
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
                                        <asp:DropDownList ID="ddPCliab" runat="server" Enabled="false" Width="90px" SelectedValue='<%# Bind("Pastoral") %>'>
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                            <asp:ListItem Value="150000.0000">150,000</asp:ListItem>
                                            <asp:ListItem Value="200000.0000">200,000</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                            <asp:ListItem Value="750000.0000">750,000</asp:ListItem>
                                            <asp:ListItem Value="1000000.0000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Sexual Misconduct</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddSMMliab" runat="server" Enabled="false" Width="90px" SelectedValue='<%# Bind("Sexualmiscon") %>'>
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="50000.0000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Directors & Officers</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddDOliab" runat="server" Enabled="false" Width="90px" SelectedValue='<%# Bind("Directors") %>'>
                                            <asp:ListItem Value="0">0</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                            <asp:ListItem Value="1000000.0000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Hired/Non-Owned Auto</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddAutoliab" runat="server" Enabled="false" Width="90px" SelectedValue='<%# Bind("Hired") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                            <asp:ListItem Value="1000000.0000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Employee Benefits</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddEBLliab" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Empbenefits") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
                                            <asp:ListItem Value="25000.0000">25,000</asp:ListItem>
                                            <asp:ListItem Value="50000.0000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Employment Pratices</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddEPLliab" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Emppratice") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
                                            <asp:ListItem Value="25000.0000">25,000</asp:ListItem>
                                            <asp:ListItem Value="50000.0000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
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
                                        <asp:DropDownList ID="ddLegalliab" runat="server" Width="115px" Enabled="false" SelectedValue='<%# Bind("Misclegaldefense") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
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
                                        <asp:DropDownList ID="ddViolentActs" runat="server" Width="115px" Enabled="false" SelectedValue='<%# Bind("Violentacts") %>'>
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
                                        <asp:DropDownList ID="ddTeachLiab" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Teacher") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
                                            <asp:ListItem Value="50000.0000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                            <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                            <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                            <asp:ListItem Value="1000000.0000">1,000,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Corporal Punishment</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddCorpPunish" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Corppunish") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
                                            <asp:ListItem Value="25000.0000">25,000</asp:ListItem>
                                            <asp:ListItem Value="50000.0000">50,000</asp:ListItem>
                                            <asp:ListItem Value="100000.0000">100,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <label>
                                            Lost Wages</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddLostWages" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("Lostwages") %>'>
                                            <asp:ListItem Value="0.0000">0</asp:ListItem>
                                            <asp:ListItem Value="1000.0000">1,000</asp:ListItem>
                                            <asp:ListItem Value="2000.0000">2,000</asp:ListItem>
                                            <asp:ListItem Value="3000.0000">3,000</asp:ListItem>
                                            <asp:ListItem Value="4000.0000">4,000</asp:ListItem>
                                            <asp:ListItem Value="5000.0000">5,000</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--END STEP 6--%>
                <asp:ObjectDataSource 
                         ID="odsUpdateSmpApp2"
                         TypeName="smci.SqlAccessLayer.MySqlCode" 
                         runat="server" 
                         UpdateMethod="UpdateSmpApplication2" 
                         SelectMethod="GetSmpApplication">
                            <SelectParameters>
                                <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                            <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />                         
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
                            </UpdateParameters>
                    </asp:ObjectDataSource>
                    <hr />
                <%--STEP 7--%>
                <asp:FormView 
                     ID="FormView7" 
                     runat="server" 
                     DataSourceID="odsUpdateSmpApp3">
                    <ItemTemplate>
                        <h3>Underwriting</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Are the scheduled properties owned by the congregation?</label>
                                    <asp:RadioButtonList ID="rbPropertiesList" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Propowned") %>'>
                                        <asp:ListItem Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If not, who is the owner?</label>
                                    <asp:TextBox ID="txtPropOwner" runat="server" Width="351px" Enabled="false" MaxLength="50" Text='<%# Bind("Whoisowner") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Does the church have a daycare or kindergarten?</label>
                                    <asp:RadioButtonList ID="rbActiveSchool" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Daycare") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>
                                    <label>
                                        Number of children</label>
                                    <asp:TextBox ID="txtSchoolKids" runat="server" Enabled="false" Width="54px" MaxLength="3" Text='<%# Bind("Numofchild") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If yes, are background checks performed an all employees/volunteers who work with
                                        children?</label>
                                    <asp:RadioButtonList ID="rbBckChecks" runat="server" RepeatDirection="Horizontal" Enabled="false" Text='<%# Bind("Bgchecks") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Playground?</label>
                                    <asp:RadioButtonList ID="rbPlayground" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Playground") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>
                                    <label>
                                        Fenced?</label>
                                    <asp:RadioButtonList ID="rbPlayFenced" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Playfence") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Cemetery?</label>
                                    <asp:RadioButtonList ID="rbCemetery" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Cemetery") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>
                                    <label>
                                        Fenced?</label>
                                    <asp:RadioButtonList ID="rbCemFence" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Cemfenced") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Is the cemetery located on main church property?</label>
                                    <asp:RadioButtonList ID="rbCemeteryLoc" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Mainproperty") %>'>
                                        <asp:ListItem Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        If no, please supply the cemetery's address</label>
                                    <asp:TextBox ID="txtCemeteryAddress" runat="server" Enabled="false" MaxLength="120" Width="210px" Text='<%# Bind("Cemeteryaddress") %>'></asp:TextBox>
                                </li>
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
                                    <asp:RadioButtonList ID="rbBallfield" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Ballfield") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>--></li>
                                <li>
                                    <label>
                                        Fenced?</label>
                                    <asp:RadioButtonList ID="rbBallFenced" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Ballfenced") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                                <li>--></li>
                                <li>
                                    <label>
                                        Located on church property?</label>
                                    <asp:RadioButtonList ID="rbBallLoc" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Locchurchprop") %>'>
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
                                        <asp:TextBox ID="txtOthAct" runat="server" Enabled="false" Width="590px" Height="97px" TextMode="MultiLine" Text='<%# Bind("Expchurchcomments") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Average Attendance</label>
                                    <asp:TextBox ID="txtAvgAtt" runat="server" Enabled="false" Width="67px" MaxLength="4" Text='<%# Bind("Averageatten") %>'></asp:TextBox>
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
                                    <asp:RadioButtonList ID="rbUnderLoss" runat="server" RepeatDirection="Horizontal" Enabled="false" AutoPostBack="True" Text='<%# Bind("Fiveyearloss") %>'>
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
                                            <asp:TextBox ID="txtLossDate7a" runat="server" Enabled="false" MaxLength="10" Width="75px" Text='<%# Bind("Date1", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7a" runat="server" Enabled="false" Width="400px" MaxLength="60" Rows="3" Text='<%# Bind("Descr1") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7a" runat="server" Enabled="false" MaxLength="10" Width="75px" Text='<%# Bind("Amount1") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7b" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("Date2", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7b" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("Descr2") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7b" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Amount2") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7c" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("Date3", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7c" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("Descr3") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7c" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Amount3") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7d" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("Date4", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7d" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("Descr4") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7d" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Amount4") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate7e" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("Date5", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr7e" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("Descr5") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt7e" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Amount5") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                        </div>

                        <h3>Church Automobiles</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Church-owned Vehicle(s)?</label>
                                    <asp:RadioButtonList ID="rbOwnVeh" runat="server" RepeatDirection="Horizontal" Enabled="false" Text='<%# Bind("Owevehicle") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Worker's Compensation?</label></li>
                                <asp:RadioButtonList ID="rbWc" runat="server" RepeatDirection="Horizontal" Enabled="false" Text='<%# Bind("Workcomp") %>'>
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem Selected="True">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Umbrella?</label>
                                    <asp:RadioButtonList ID="rbUmbrella" runat="server" RepeatDirection="Horizontal" Enabled="false" Text='<%# Bind("Umbrella") %>'>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </li>
                            </ul>
                        </div>
                          <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                      <asp:ObjectDataSource 
                         ID="odsUpdateSmpApp3"
                         TypeName="smci.SqlAccessLayer.MySqlCode" 
                         runat="server" 
                         UpdateMethod="UpdateSmpApplication3" 
                         SelectMethod="GetSmpApplication">
                            <SelectParameters>
                                <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                            <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />                       
                                <asp:Parameter Name="PropOwned" Type="String" />
                                <asp:Parameter Name="WhoIsOwner" Type="String" />
                                <asp:Parameter Name="Daycare" Type="String" />
                                <asp:Parameter Name="NumOfChild" Type="String" />
                                <asp:Parameter Name="BgChecks" Type="String" />
                                <asp:Parameter Name="Playground" Type="String" />
                                <asp:Parameter Name="PlayFenced" Type="String" />
                                <asp:Parameter Name="Cemetery" Type="String" />
                                <asp:Parameter Name="CemFenced" Type="String" />
                                <asp:Parameter Name="MainProperty" Type="String" />
                                <asp:Parameter Name="CemeteryAddress" Type="String" />
                                <asp:Parameter Name="BallField" Type="String" />
                                <asp:Parameter Name="BallFenced" Type="String" />
                                <asp:Parameter Name="LocChurProp" Type="String" />
                                <asp:Parameter Name="ExpChurchComments" Type="String" />
                                <asp:Parameter Name="AverageAtten" Type="String" />
                                <asp:Parameter Name="FiveYearLoss" Type="String" />
                                <asp:Parameter Name="Date1" Type="DateTime" />
                                <asp:Parameter Name="Description1" Type="String" />
                                <asp:Parameter Name="Amount1" Type="Decimal" />
                                <asp:Parameter Name="Date2" Type="DateTime" />
                                <asp:Parameter Name="Description2" Type="String" />
                                <asp:Parameter Name="Amount2" Type="Decimal" />
                                <asp:Parameter Name="Date3" Type="DateTime" />
                                <asp:Parameter Name="Description3" Type="String" />
                                <asp:Parameter Name="Amount3" Type="Decimal" />
                                <asp:Parameter Name="Date4" Type="DateTime" />
                                <asp:Parameter Name="Description4" Type="String" />
                                <asp:Parameter Name="Amount4" Type="Decimal" />
                                <asp:Parameter Name="Date5" Type="DateTime" />
                                <asp:Parameter Name="Description5" Type="String" />
                                <asp:Parameter Name="Amount5" Type="Decimal" />
                                <asp:Parameter Name="OweVehicle" Type="String" />
                                <asp:Parameter Name="WorkComp" Type="String" />
                                <asp:Parameter Name="Umbrella" Type="String" />
                            </UpdateParameters>
                    </asp:ObjectDataSource>

                <hr />

                <br />
                <%--STEP 8--%>
                <asp:FormView 
                     ID="FormView8" 
                     runat="server" 
                     DataSourceID="odsPastoral">
                    <ItemTemplate>
                        <h3>Supplemental Application for Pastoral Counseling Liability Coverage</h3>
                        <div class="quote_box1">

 
                                <ul>
                                    <li>
                                        <label>How many employees and/or members are involved in counseling?</label>
                                        <asp:TextBox ID="txtNumEmp" runat="server" MaxLength="4" Width="34px" Enabled="false" Text='<%# Bind("Members") %>'></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField3" runat="server" />
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <label>
                                            Please describe education or training requirements for those involved in counseling:
                                            <br />
                                            <asp:TextBox ID="txtTraining" runat="server" MaxLength="400" Width="464px" Height="60px" TextMode="MultiLine" Text='<%# Bind("Councomments") %>' Enabled="false"></asp:TextBox>
                                        </label>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <label>
                                            Is counseling provided for a fee?
                                            <br />
                                            <asp:RadioButtonList ID="rbCounFee" runat="server" RepeatDirection="Horizontal" Text='<%# Bind("Fee") %>' Enabled="false">
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
                                            <asp:RadioButtonList ID="rbCounRooms" runat="server" RepeatDirection="Horizontal" Text='<%# Bind("Rooms") %>' Enabled="false">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem Selected="True">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </label>
                                    </li>
                                </ul>
  
                            <ul>
                                <li>
                                    <label>
                                        Have there been any losses or allegations in the past?
                                        <br />
                                        <asp:RadioButtonList ID="rbAllegations" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Allegations") %>' Enabled="false">
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
                                        <asp:TextBox ID="txtExplain" runat="server" MaxLength="8000" Width="607px" Height="133px" TextMode="MultiLine" Text='<%# Bind("Allegcomments") %>' Enabled="false"></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                      <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                  </asp:FormView>  
                 <asp:ObjectDataSource 
                     ID="odsPastoral" 
                     runat="server" 
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     SelectMethod="GetPastoralInfo">
                     <SelectParameters>
                         <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                     </SelectParameters>
               </asp:ObjectDataSource>

               <hr />

                <%--STEP 9--%>
                <asp:FormView 
                     ID="FormView9" 
                     runat="server" 
                     DataSourceID="odsSexMiscon">
                    <ItemTemplate>
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
                                        <asp:RadioButtonList ID="rbMisconduct" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Misconpolicy") %>'>
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
                                       <asp:RadioButtonList ID="rbReference" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Bgcheck") %>'>
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>Has a background check been obtained on all current employees?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbBckGrdCheck" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Allbgcheck") %>'>
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
                                        <asp:RadioButtonList ID="rbWait" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Sixmonthwait") %>'>
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
                                        <asp:RadioButtonList ID="rbSupervised" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Reqadult") %>'>
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
                                        <asp:RadioButtonList ID="rbOtherAct" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Installedwin") %>'>
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
                                        <asp:RadioButtonList ID="rbCharges" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Misconcharges") %>'>
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
                                        <asp:TextBox ID="txtExplainCharges" runat="server" MaxLength="8000" Enabled="false" Width="574px" Height="133px" TextMode="MultiLine" Text='<%# Bind("Expmisconcharges") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                              <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>
                </asp:FormView>
                <%--END STEP 9--%>
                   <asp:ObjectDataSource 
                     ID="odsSexMiscon"
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     runat="server" 
                     SelectMethod="GetSexMisconduct">
                       <SelectParameters>
                           <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                       </SelectParameters>
               </asp:ObjectDataSource>
                <hr />
 
                <%--STEP 10--%>
                <asp:FormView 
                     ID="FormView10" 
                     runat="server" 
                     DataSourceID="odsSupCoverage">
                    <ItemTemplate>
                      <h3>
                            Supplemental Application for Directors, Officers & Trustees Liability Coverage</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        How are directors established?</label>
                                    <asp:TextBox ID="txtDirEst" runat="server" Enabled="false" Width="282px" MaxLength="60" Text='<%# Bind("Estdirectors") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        How often are directors rotated?</label>
                                    <asp:TextBox ID="txtRotated" runat="server" Enabled="false" Width="266px" MaxLength="40" Text='<%# Bind("Rotatedirectors") %>'></asp:TextBox>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Have there been any losses in the past?</label>
                                    <asp:RadioButtonList ID="rbLostCoverage" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Pastlosses") %>'>
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
                                        <asp:TextBox ID="txtExplainLosses" runat="server" Enabled="false" Width="578px" MaxLength="8000" Height="133px" TextMode="MultiLine" Text='<%# Bind("Explosses") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                       <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--END STEP 10--%>
                <asp:ObjectDataSource 
                     ID="odsSupCoverage" 
                     runat="server" 
                     SelectMethod="GetSupplementalCoverage" 
                     TypeName="smci.SqlAccessLayer.MySqlCode">
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                    </SelectParameters>
               </asp:ObjectDataSource>

                <hr />
                <%--STEP 16--%>
                <asp:FormView 
                     ID="FormView16" 
                     runat="server" 
                     DataSourceID="odsEmployeePractice">
                    <ItemTemplate>
                        <h3>Employment Practices Liability Supplemental Application</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td class="column_epl">
                                        <p>
                                            Total number of employees (include part-time and full-time)?</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalEmployees" runat="server" MaxLength="3" Width="27px" Enabled="false" Text='<%# Bind("Numofemp") %>'></asp:TextBox>
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
                                        <asp:RadioButtonList ID="rbEmployee" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Emphandbook") %>'>
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
                                        <asp:RadioButtonList ID="rbTimeOfHire" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Distribtoall") %>'>
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
                                        <asp:RadioButtonList ID="rbWrittenState" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Writtenstatement") %>'>
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
                                        <asp:RadioButtonList ID="rbFormApp" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Formalapp") %>'>
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
                                        <asp:RadioButtonList ID="rbAnnualReview" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Annualreview") %>'>
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
                                        <asp:RadioButtonList ID="rbMainRec" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Maintainrecords") %>'>
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
                                        <asp:RadioButtonList ID="rbDrugTest" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Drugtest") %>'>
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
                                        <asp:TextBox ID="txtDrugs" runat="server" Enabled="false" MaxLength="75" Width="375px" Text='<%# Bind("Expdrugtest") %>'></asp:TextBox>
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
                                        <asp:TextBox ID="txtNumTerm" runat="server" Enabled="false" MaxLength="2" Width="45px" Text='<%# Bind("Numterminated") %>'></asp:TextBox>
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
                                        <asp:RadioButtonList ID="rbPraticeClaims" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Praticeclaims") %>'>
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
                                        <asp:TextBox ID="txtExtra" runat="server" Enabled="false" MaxLength="75" Width="375px" Text='<%# Bind("Exppraticesclaims") %>'></asp:TextBox>
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
                                        <asp:RadioButtonList ID="rbRiseClaim" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Risetoclaim") %>'>
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
                                        <asp:TextBox ID="txtClaim" runat="server" Enabled="false" MaxLength="75" Width="375px" Text='<%# Bind("Exprisetoclaim") %>'></asp:TextBox>
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
                                        <asp:RadioButtonList ID="rbPriorCoverage" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Priorcoverage") %>'>
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
                                        <asp:TextBox ID="txtCancelled" runat="server" Enabled="false" MaxLength="75" Width="375px" Text='<%# Bind("Exppriorcoverage") %>'></asp:TextBox>
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
                             <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>

                  <asp:ObjectDataSource 
                     ID="odsEmployeePractice" 
                     runat="server" 
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     SelectMethod="GetSmpEmployeePractices">
                      <SelectParameters>
                          <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                      </SelectParameters>
                </asp:ObjectDataSource>
                <hr />
                <%--STEP 17--%>
                <asp:FormView 
                     ID="FormView17" 
                     runat="server" 
                     DataSourceID="odsTeachersLiability">
                    <ItemTemplate>
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
                                        <asp:ListBox ID="lstGrades1" runat="server" Rows="1" Width="87px" Enabled="false" SelectionMode="Multiple" SelectedValue='<%# Bind("Gradesstart") %>'>
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
                                        <asp:ListBox ID="lstGrades2" runat="server" Rows="1" Width="87px" Enabled="false" SelectionMode="Multiple" SelectedValue='<%# Bind("Gradesend") %>'>
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
                                        <asp:TextBox ID="txtCapacity" MaxLength="4" runat="server" Enabled="false" Text='<%# Bind("Maxenrollment") %>'/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Average number enrolled each year</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEnrolled" MaxLength="4" runat="server" Enabled="false" Text='<%# Bind("Avenumenrolled") %>'/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Date school started:</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSchoolStarted" runat="server" Enabled="false" MaxLength="10" Text='<%# Bind("Dateestablished") %>'/>
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
                                        <asp:TextBox ID="txtFull1" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Withdegreefull") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart1" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Withdegreepart") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer1" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Withdegreevol") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Teachers without degrees</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull2" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Withoutdegreefull") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart2" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Withoutdegreepart") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer2" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Withoutdegreevol") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Teachers Aides</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull3" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Teacheraidfull") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart3" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Teacheraidpart") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer3" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Teacheraidvol") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Counselors</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull4" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Counselorsfull") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart4" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Counselorspart") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer4" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Counselorsvol") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Nurses</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull5" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Nursesfull") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart5" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Nursespart") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer5" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Nursesvol") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Other Administrative Staff</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFull6" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Otheradminfull") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPart6" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Otheradminpart") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVolunteer6" runat="server" MaxLength="4" Enabled="false" Text='<%# Bind("Otheradminvol") %>'></asp:TextBox>
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
                                        <asp:RadioButtonList ID="rbTeacherPerform" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Teacersperform") %>'>
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
                                        <asp:TextBox ID="txtCriteria" runat="server" Height="60px" Enabled="false" TextMode="MultiLine" Width="265px" MaxLength="125" Text='<%# Bind("Expcriteria") %>'/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Are standardized learning skills tests administered to evalute your students</p>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbEvalute" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Evalutestudents") %>'>
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
                                        <asp:RadioButtonList ID="rbResults" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Resultsshared") %>'>
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
                                        <asp:RadioButtonList ID="rbImprovePerform" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Improveperform") %>'>
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
                                            <asp:RadioButtonList ID="rbSuspen" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Suspension") %>'>
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
                                            <asp:RadioButtonList ID="rbDismiss" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Dismissal") %>'>
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
                                            <asp:RadioButtonList ID="rbSexHarass" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Sexharass") %>'>
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
                                            <asp:RadioButtonList ID="rbStudentAggres" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Studentaggress") %>'>
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
                                            <asp:RadioButtonList ID="rbPromotion" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Promotion") %>'>
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
                                            <asp:RadioButtonList ID="rbAccept" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Acceptance") %>'>
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
                                            <asp:RadioButtonList ID="rbDrugTesting" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Drugtesting") %>'>
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
                                            <asp:RadioButtonList ID="rbWeapons" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Weapons") %>'>
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
                                        <asp:RadioButtonList ID="rbWrittenPolicy" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Writtenpolicy") %>'>
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
                                        <asp:RadioButtonList ID="rbPriorEnroll" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Priorenrollment") %>'>
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
                                        <asp:RadioButtonList ID="rbAgainSchool" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Againstschool") %>'>
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
                                        <asp:TextBox ID="txtExpAmountPaid" runat="server" Enabled="false" Height="49px" MaxLength="150" TextMode="MultiLine" Width="268px" Text='<%# Bind("Expclaim") %>'></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                          <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource 
                     ID="odsTeachersLiability" 
                     TypeName="smci.SqlAccessLayer.MySqlCode"
                     runat="server" 
                     SelectMethod="GetSmpTeachersLiability">
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <hr />

                <%--STEP 11--%>
                <asp:FormView 
                     ID="FormView11" 
                     runat="server" 
                     DataSourceID="odsBa">
                    <ItemTemplate>
                      <h3>Church Owned Vehicle(s)</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Current Carrier</label>
                                    <asp:TextBox ID="txtCurrCarrier" runat="server" Width="287px" MaxLength="40" Enabled="false" Text='<%# Bind("Currentcarrier") %>'></asp:TextBox>
                                </li>
                                <li>
                                    <asp:CheckBox ID="chbNoCarrier" runat="server" Enabled="false" AutoPostBack="true" Text="No Current Carrier"/>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Current Premium</label>
                                    <asp:TextBox ID="txtCurrPrem" runat="server" MaxLength="10" Width="90px" Enabled="false" Text='<%# Bind("Currentbaprem") %>'></asp:TextBox>
                                </li>

                            </ul>
                            <ul>
                                <li>
                                    <label>Liability Limit</label>
                                    <asp:DropDownList ID="ddLiab" runat="server" Width="90px" Enabled="false" SelectedValue='<%# Bind("LiabilityLimit") %>'>
                                        <asp:ListItem Value="100000.0000" Selected="True">100,000</asp:ListItem>
                                        <asp:ListItem Value="300000.0000">300,000</asp:ListItem>
                                        <asp:ListItem Value="500000.0000">500,000</asp:ListItem>
                                        <asp:ListItem Value="1000000.0000">1,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>Is Hired Physical Damage Coverage Desired?</label>
                                    <asp:RadioButtonList ID="rbDamageCover" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Physicaldamage") %>'>
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
                                    <asp:RadioButtonList ID="rbAgeChk" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Driversage") %>'>
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
                                        <asp:TextBox ID="txtExpComments" runat="server" Enabled="false" Width="446px" Height="123px" TextMode="MultiLine" Text='<%# Bind("Expcomments") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <h3>
                            Five Year Loss History</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>Was there any losses in the past five years?</label>
                                    <asp:RadioButtonList ID="rbBaLoss" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("PastLosses") %>'>
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
                                            <asp:TextBox ID="txtLossDate11a" runat="server" Enabled="false" MaxLength="10" Width="75px" Text='<%# Bind("PastLossDate1", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11a" runat="server" Enabled="false" Width="400px" MaxLength="60" Rows="3" Text='<%# Bind("PastLossDescr1") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11a" runat="server" Enabled="false" MaxLength="10" Width="75px" Text='<%# Bind("Pastlossamount1") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11b" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate2", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11b" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr2") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11b" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Pastlossamount2") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11c" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate3", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11c" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr3") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11c" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Pastlossamount3") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11d" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate4", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11d" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr4") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11d" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Pastlossamount4") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate11e" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate5", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr11e" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr5") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt11e" runat="server" Enabled="false" Width="75px" Text='<%# Bind("Pastlossamount5") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                        </div>
                        <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--END STEP 11--%>
                 <asp:ObjectDataSource 
                     ID="odsBa" 
                     runat="server"  
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     SelectMethod="GetBaApplication">
                     <SelectParameters>
                         <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                     </SelectParameters>
               </asp:ObjectDataSource>
                <hr />

                <%--STEP 12--%>

                        <div class="quote_box1">
                                  <asp:DataList 
                                     ID="dlstVehicle" 
                                     runat="server" 
                                     DataSourceID="odsChurchVehicle" 
                                     BorderStyle="None" 
                                     DataKeyField="Vehicleid" 
                                     Width="775px">
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
                        </div>
                 <asp:ObjectDataSource 
                     ID="odsChurchVehicle" 
                     runat="server" 
                     SelectMethod="GetChurchVehicle" 
                     DeleteMethod="DeleteVehicle"
                     UpdateMethod="UpdateVehicle"
                     TypeName="smci.SqlAccessLayer.MySqlCode">
                    <DeleteParameters>
                        <asp:Parameter Name="VehicleId" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
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
                <hr />

                <%--STEP 13--%>
                <asp:FormView 
                     ID="FormView13" 
                     runat="server" 
                     DataSourceID="odsWorkersCompA">
                    <ItemTemplate>
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
                                        <asp:TextBox ID="txtFEIN" runat="server" Enabled="false" Width="186px" MaxLength="10" Text='<%# Bind("Fid") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Current Carrier</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPriorCarrier" runat="server" Enabled="false" Width="287px" MaxLength="40" Text='<%# Bind("Currentcarrier") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Current Premium</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCurrPrem" runat="server" Enabled="false" Width="90px" MaxLength="10" Text='<%# Bind("Currentwcpremium") %>'></asp:TextBox>
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
                                        <asp:TextBox ID="txtProfEmpNum" runat="server" Enabled="false" Width="95px" MaxLength="5" Text='<%# Bind("Codesclassnoe1") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProfEmpPay" runat="server" Enabled="false" Width="110px" MaxLength="10" Text='<%# Bind("Codesclassear1", "{0:c}") %>'></asp:TextBox>
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
                                        <asp:TextBox ID="txtAllOthNum" runat="server" Enabled="false" Width="95px" MaxLength="5" Text='<%# Bind("Codesclassnoe2") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAllOthPay" runat="server" Enabled="false" Width="110px" MaxLength="10" Text='<%# Bind("Codesclassear2", "{0:c}") %>'></asp:TextBox>
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
                                        <asp:TextBox ID="txtDayProNum" runat="server" Enabled="false" Width="95px" MaxLength="5" Text='<%# Bind("Codesclassnoe3") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDayProPay" runat="server" Enabled="false" Width="110px" MaxLength="10" Text='<%# Bind("Codesclassear3", "{0:c}") %>'></asp:TextBox>
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
                                        <asp:TextBox ID="txtDayOthNum" runat="server" Enabled="false" Width="95px" MaxLength="5" Text='<%# Bind("Codesclassnoe4") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDayOthPay" runat="server" Enabled="false" Width="110px" MaxLength="10" Text='<%# Bind("Codesclassear4", "{0:c}") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Drivers, Chauffeurs, and their helpers</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDriverNum" runat="server" Enabled="false" Width="95px" MaxLength="5" Text='<%# Bind("Codesclassnoe5") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDriverPay" runat="server" Enabled="false" Width="110px" MaxLength="10" Text='<%# Bind("Codesclassear5", "{0:c}") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <label>
                                            Other-Specify</label>
                                        <asp:TextBox ID="txtOtherDescr" runat="server" Enabled="false" Width="215px" MaxLength="50" Text='<%# Bind("Expcodesclass") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOtherNum" runat="server" Enabled="false" Width="95px" MaxLength="5" Text='<%# Bind("Codesclassnoe6") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOtherPay" runat="server" Enabled="false" Width="110px" MaxLength="10" Text='<%# Bind("Codesclassear6", "{0:c}") %>'></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                          <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--  END STEP 13--%>
                <asp:ObjectDataSource 
                     ID="odsWorkersCompA" 
                     runat="server" 
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     SelectMethod="GetWcApplicationDetails">
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <hr />

                <%--STEP 14--%>
                <asp:FormView 
                     ID="FormView14" 
                     runat="server" 
                     DataSourceID="odsWorkersCompB">
                    <ItemTemplate>
                        <h3>General Information</h3>
                        <div class="quote_box1">
                            <table border="0">
                                <tr>
                                    <td class="MyStyle">
                                        <label>
                                            Does applicant own, operate or lease air/watercraft?</label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbOperate" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Watercraft") %>'>
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
                                        <asp:RadioButtonList ID="rbEngage" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Engaged") %>'>
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
                                        <asp:RadioButtonList ID="rbSubContractor" runat="server" Enabled="false" RepeatDirection="Horizontal" Height="27px" Text='<%# Bind("Subcontractor") %>'>
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
                                        <asp:RadioButtonList ID="rbSafety" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Safetyprogram") %>'>
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
                                        <asp:RadioButtonList ID="rbUnderAge" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Undersixteen") %>'>
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
                                        <asp:RadioButtonList ID="rbOverAge" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Oversixtyfive") %>'>
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
                                        <asp:RadioButtonList ID="rbHanicap" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Handicap") %>'>
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
                                        <asp:RadioButtonList ID="rbTravelOutState" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Travel") %>'>
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
                                        <asp:RadioButtonList ID="rbReqPhysicals" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Reqphysicals") %>'>
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
                                        <asp:RadioButtonList ID="rbProvideTrans" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Transportation") %>'>
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
                                        <asp:RadioButtonList ID="rbPriorCover" runat="server" Enabled="false" RepeatDirection="Horizontal" Text='<%# Bind("Priorcoverage") %>'>
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
                                        <asp:TextBox ID="txtExplYes" runat="server" Enabled="false" Height="116px" Width="558px" MaxLength="8000" Text='<%# Bind("Expcomments") %>'></asp:TextBox>
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
                                    <asp:RadioButtonList ID="rbWcLoss" runat="server" Enabled="false" RepeatDirection="Horizontal" AutoPostBack="True" Text='<%# Bind("Pastloss") %>'>
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
                                            <asp:TextBox ID="txtLossDate14a" runat="server" Enabled="false" MaxLength="10" Width="75px" Text='<%# Bind("PastLossDate1", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14a" runat="server" Enabled="false" Width="400px" MaxLength="60" Rows="3" Text='<%# Bind("PastLossDescr1") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14a" runat="server" Enabled="false" MaxLength="10" Width="75px" Text='<%# Bind("PastLossAmount1", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14b" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate2", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14b" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr2") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14b" runat="server" Enabled="false" Width="75px" Text='<%# Bind("PastLossAmount2", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14c" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate3", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14c" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr3") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14c" runat="server" Enabled="false" Width="75px" Text='<%# Bind("PastLossAmount3", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14d" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate4", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14d" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr4") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14d" runat="server" Enabled="false" Width="75px" Text='<%# Bind("PastLossAmount4", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate14e" runat="server" Enabled="false" Width="75px" MaxLength="10" Text='<%# Bind("PastLossDate5", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr14e" runat="server" Enabled="false" Width="400px" MaxLength="60" Text='<%# Bind("PastLossDescr5") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt14e" runat="server" Enabled="false" Width="75px" Text='<%# Bind("PastLossAmount5", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
<%--                            </asp:Panel>--%>
                        </div>
                           <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--END STEP 14--%>
                  <asp:ObjectDataSource 
                     ID="odsWorkersCompB" 
                     runat="server" 
                     TypeName="smci.SqlAccessLayer.MySqlCode" 
                     SelectMethod="GetWcApplicationDetails">
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <hr />

                <%--STEP 15--%>
                <asp:FormView 
                     ID="FormView15" 
                     runat="server" 
                     DataSourceID="odsUmbrella">
                    <ItemTemplate>
                        <h3>
                            Umbrella Application</h3>
                        <div class="quote_box1">
                            <ul>
                                <li>
                                    <label>
                                        Limit of Liability</label></li>
                                <li>
                                    <asp:DropDownList ID="ddLimit" runat="server" Enabled="false" text='<%# Bind("Limitofliability") %>'>
                                        <asp:ListItem Value="1000000.0000" Selected="True">1,000,000</asp:ListItem>
                                        <asp:ListItem Value="2000000.0000">2,000,000</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Does the church own any automobiles?</label></li>
                                <li>
                                    <asp:RadioButtonList ID="rbOwnAuto" runat="server" Enabled="false" RepeatDirection="Horizontal" text='<%# Bind("Automobiles") %>'>
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
                                    <asp:RadioButtonList ID="rbWcPolicy" runat="server" Enabled="false" RepeatDirection="Horizontal" text='<%# Bind("Workerscomp") %>'>
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
                                        <asp:TextBox ID="txtUmPriorCarrier" runat="server" Enabled="false" Width="200px" MaxLength="40" text='<%# Bind("Currentcarrier") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Current Premium
                                        <br />
                                        <asp:TextBox ID="txtPriorPrem" runat="server" Enabled="false" Width="100px" MaxLength="40" text='<%# Bind("Currentumprem") %>'></asp:TextBox>
                                    </label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <label>
                                        Comments
                                        <br />
                                        <asp:TextBox ID="txtUmExpComments" runat="server" Enabled="false" Width="485px" Height="104px" TextMode="MultiLine" text='<%# Bind("Expcomments") %>'></asp:TextBox>
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
                                    <asp:RadioButtonList ID="rbUmLoss" runat="server" Enabled="false" RepeatDirection="Horizontal" text='<%# Bind("Pastloss") %>'>
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
                                            <asp:TextBox ID="txtLossDate15a" runat="server" Enabled="false" MaxLength="10" Width="75px" text='<%# Bind("Pastlossdate1", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15a" runat="server" Enabled="false" Width="400px" MaxLength="60" Rows="3" text='<%# Bind("Passlossdescr1") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15a" runat="server" Enabled="false" MaxLength="10" Width="75px" text='<%# Bind("Passlossamount1", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15b" runat="server" Enabled="false" Width="75px" MaxLength="10" text='<%# Bind("Pastlossdate2", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15b" runat="server" Enabled="false" Width="400px" MaxLength="60" text='<%# Bind("Passlossdescr2") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15b" runat="server" Enabled="false" Width="75px" text='<%# Bind("Passlossamount2", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15c" runat="server" Enabled="false" Width="75px" MaxLength="10" text='<%# Bind("Pastlossdate3", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15c" runat="server" Enabled="false" Width="400px" MaxLength="60" text='<%# Bind("Passlossdescr3") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15c" runat="server" Enabled="false" Width="75px" text='<%# Bind("Passlossamount3", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15d" runat="server" Enabled="false" Width="75px" MaxLength="10" text='<%# Bind("Pastlossdate4", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15d" runat="server" Enabled="false" Width="400px" MaxLength="60" text='<%# Bind("Passlossdescr4") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15d" runat="server" Enabled="false" Width="75px" text='<%# Bind("Passlossamount4", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtLossDate15e" runat="server" Enabled="false" Width="75px" MaxLength="10" text='<%# Bind("Pastlossdate5", "{0:d}") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossDescr15e" runat="server" Enabled="false" Width="400px" MaxLength="60" text='<%# Bind("Passlossdescr5") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLossAmt15e" runat="server" Enabled="false" Width="75px" text='<%# Bind("Passlossamount5", "{0:c}") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
 
                        </div>
                        <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--END STEP 15--%>
                <asp:ObjectDataSource 
                     ID="odsUmbrella" 
                     TypeName="smci.SqlAccessLayer.MySqlCode"
                     runat="server" 
                     SelectMethod="GetUmApplication">
                    <SelectParameters>
                        <asp:SessionParameter Name="RequestNumber" SessionField="Reqnum" Type="Int32" />
                    </SelectParameters>
               </asp:ObjectDataSource>


