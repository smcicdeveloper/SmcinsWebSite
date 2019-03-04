<%@ Page Title="" Language="VB" MasterPageFile="~/Shared/ElectronicFormView.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="ItemLookup.aspx.vb" Inherits="Webpages_ItemLookup" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #ActionDate1
        {
            width: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="../../CSS/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>

<script runat="server">
    <System.Web.Services.WebMethod()> _
    Public Shared Function GetSuggestions(ByVal prefixText As String, ByVal count As Integer) As String()
        Dim db As New MyDatabaseDataContext()
        Dim records As List(Of acctinfo) = db.acctinfos _
                    .Where(Function(m) m.insured_name.StartsWith(prefixText)) _
                    .OrderBy(Function(m) m.insured_name) _
                    .Take(count).ToList()
        Return records _
            .Select(Function(m) AutoCompleteExtender.CreateAutoCompleteItem(m.insured_name, m.cust_no.ToString())) _
            .ToArray()
    End Function
</script>

<script type="text/javascript">
    function ace1_itemSelected(sender, e) {
        var ace1Value = $get('<%= ace1Value.ClientID %>');
        ace1Value.value = e.get_value();
    }

    function displayCalendar() {
        var datePicker = document.getElementById('datePicker');
        datePicker.style.display = 'block';
    }

    function pageLoad(){ $(".mydate").datepicker();
       }
       // $('#ActionDate1').datepicker();
      // var datePicker = document.getElementById('ActionDate1');
      // datePicker.datepicker();

//    });
</script>


   <br />
<label>Enter Item:</label>
    <asp:TextBox 
         ID="txtSearchBox" 
         runat="server" 
         Width="50%" />
    <asp:AutoCompleteExtender 
         ID="ace1"
         TargetControlID="txtSearchBox"
         ServiceMethod="GetSuggestions"
         MinimumPrefixLength="1"
         OnClientItemSelected="ace1_itemSelected"
         FirstRowSelected="true"
         runat="server" 
         CompletionListCssClass="auto-complete1" 
         CompletionSetCount="1000000000"
         EnableCaching="False" 
         CompletionInterval="3" 
         CompletionListHighlightedItemCssClass="auto-complete3" 
         CompletionListItemCssClass="auto-complete2" 
         ShowOnlyCurrentWordInCompletionListItem="True" />   
    <asp:HiddenField 
         ID="ace1Value" 
         runat="server" />
    <asp:Button 
         ID="btnSearch" 
         runat="server" 
         Text="Search" 
         Width="65px" />
    <asp:Button 
         ID="btnClear" 
         runat="server" 
         Text="Clear" 
         Width="65px" />
    <br /><br /><br />

    <asp:DataList 
         ID="dlstRecord" 
         DataSourceID="srcGetRecord"
         runat="server" DataKeyField="cust_no" >
       <ItemTemplate>
          <table>
           <tr>
             <td>
            <label>Customer No.</label></td>
            <td>
            <asp:TextBox ID="TextBox1" Text='<%# Eval("cust_no") %>' runat="server" 
                Width="50px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            <td>
            <label>Status:</label></td>
            <td>
            <asp:TextBox ID="TextBox2" Text='<%# Eval("cust_status") %>' runat="server" 
                Width="71px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            <td>
            <label>Proxy:</label>
            </td>
            <td>
            <asp:TextBox ID="TextBox3" Text='<%# Eval("proxy_init") %>' runat="server" 
                Width="50px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
        </table>
            <table>
            <tr>
                <td>
                    <label>
                    Insured:</label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("insured_name") %>' 
                        Width="310px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" />
                </td>
                </tr>
                <tr>
                <td>
                    <label>
                    Contact:</label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("contact") %>' 
                        Width="310px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False"/>
                </td>
                </tr>
              <tr>
                <td>
                    <label>
                    Mail Address:</label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("mail_addr") %>' 
                        Width="300px" BorderStyle="Solid" ReadOnly="True" BorderColor="White" 
                        Enabled="False" />
                </td>
              </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Mail City:</label>
            </td>
            <td>
            <asp:TextBox ID="TextBox7" Text='<%# Eval("mail_city") %>' runat="server" 
                    BorderStyle="Solid" ReadOnly="True" BorderColor="White" Enabled="False" />
            </td>
            <td>
            <label>State:</label></td>
            <td>
            <asp:TextBox ID="TextBox8" Text='<%# Eval("mail_state") %>' runat="server" 
                Width="35px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            <td>
            <label>Zip:</label></td>
            <td>
            <asp:TextBox ID="TextBox9" Text='<%# Eval("mail_zip") %>' runat="server" 
                Width="75px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Actual Location:</label>
            </td>
            <td>
            <asp:TextBox ID="TextBox10" Text='<%# Eval("actual_location") %>' runat="server" 
                    BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" />
            </td>
            <td>
            <label>State:</label></td>
            <td>
            <asp:TextBox ID="TextBox11" Text='<%# Eval("loc_state") %>' runat="server" 
                Width="35px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
<%--        <td>
            <label>Zip:</label></td>
            <td>
            <asp:TextBox ID="TextBox12" Text='<%# Eval("loc_zip") %>' runat="server" 
                Width="75px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>--%>
            </tr>
           <tr>
              <td>
                <label>County:</label>
              </td>
              <td>
                  <asp:TextBox ID="TextBox38" Text='<%# Eval("county") %>' runat="server" 
                      BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" />
              </td>
            </tr>
            <tr>
            <td>
            <label>File Checked Out By:</label></td>
            <td>
            <asp:TextBox ID="TextBox13" Text='<%# Eval("FullName") %>' runat="server" 
                    BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" />
            </td>
            </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Contact Name:</label></td>
            <td>
            <asp:TextBox ID="TextBox14" Text='<%# Eval("contact_name") %>' runat="server" 
                Width="275px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
            <tr>
            <td>
            <label>Contact Number:</label></td>
            <td>
            <asp:TextBox ID="TextBox15" Text='<%# Eval("contact_number") %>' runat="server" 
                Width="120px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
            <tr>
            <td>
            <label>Agency:</label></td>
            <td>
            <asp:TextBox ID="TextBox16" Text='<%# Eval("agency_name") %>' runat="server" 
                Width="375px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
            </table>
            <br />
            <table>
              <tr>
                <td><lable>Eff Date:</lable></td>
                <td><lable>Policy Description:</lable></td>
                <td><lable>Action:</lable></td>
                <td><lable>Date:</lable></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="TextBox17" runat="server" Text='<%# Eval("pol1_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="TextBox18" runat="server" Text='<%# Eval("pol1_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" /></td>
                <td><asp:TextBox ID="TextBox19" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action1") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="TextBox20" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action1_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="TextBox21" runat="server" Text='<%# Eval("pol2_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="TextBox22" runat="server" Text='<%# Eval("pol2_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="TextBox23" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action2") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="TextBox24" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action2_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
             <tr>
                <td><asp:TextBox ID="TextBox25" runat="server" Text='<%# Eval("pol3_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="TextBox26" runat="server" Text='<%# Eval("pol3_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="TextBox27" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action3") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="TextBox28" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action3_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="TextBox29" runat="server" Text='<%# Eval("pol4_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="TextBox30" runat="server" Text='<%# Eval("pol4_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="TextBox31" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action4") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="TextBox32" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action4_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="TextBox34" runat="server" Text='<%# Eval("pol5_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="TextBox35" runat="server" Text='<%# Eval("pol5_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="TextBox36" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action5") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="TextBox37" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action5_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
            </table>
            <br />
            <table>
             <tr>
             <td><lable>Comments:</lable></td>
             </tr>
             <tr>
             <td>
                 <asp:TextBox ID="TextBox33" runat="server" Text='<%# Eval("comments") %>' 
                     Width="400px" Height="50px" BorderStyle="Solid" BorderColor="White" 
                     ReadOnly="True" Font-Names="Calibri" TextMode="MultiLine" 
                     Enabled="False" />
             </td>
             </tr>
            </table>
            <br /><br />
            <asp:LinkButton 
                 ID="lnkEdit" 
                 CommandName="Edit"
                 Text="Edit"
                 runat="server"/>
                 &nbsp;|&nbsp;
           <asp:LinkButton 
                ID="LinkButton2" 
                CommandName="Delete"
                Text="Delete"
                OnClientClick="return confirm('Are you sure?');"
                runat="server" />
            </ItemTemplate>
        <EditItemTemplate>
         <table>
           <tr>
             <td>
            <label>Customer No.</label></td>
            <td>
            <asp:TextBox ID="txtCustNo" Text='<%# Eval("cust_no") %>' runat="server" 
                Width="50px" Enabled="False" ReadOnly="True" />          
            </td>
            <td>
            <label>Status:</label></td>
            <td>
                <asp:DropDownList ID="ddlStatus" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("cust_status") %>'>
                <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                <asp:ListItem Text="ACTIVE" Value="ACTIVE"></asp:ListItem>
                <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                <asp:ListItem Text="EXPIRED" Value="EXPIRED"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
            <label>Proxy:</label>
            </td>
            <td>
            <asp:TextBox ID="txtProxy" Text='<%# Bind("proxy_init") %>' runat="server" 
                Width="50px" />
            </td>
            </tr>
        </table>
            <table>
            <tr>
                <td>
                    <label>
                    Insured:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtInsured" runat="server" Text='<%# Bind("insured_name") %>' 
                        Width="300px" MaxLength="50"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td>
                    <label>
                    Contact:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtContact" runat="server" Text='<%# Bind("contact") %>' 
                        Width="300px" MaxLength="35" />
                </td>
                </tr>
              <tr>
                <td>
                    <label>
                    Mail Address:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMailAddress" runat="server" Text='<%# Bind("mail_addr") %>' 
                        Width="300px" MaxLength="75" />
                    <asp:RequiredFieldValidator ID="rfvMailAddress" ControlToValidate="txtMailAddress" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Mailing Address" />
                </td>
              </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Mail City:</label>
            </td>
            <td>
                <asp:TextBox ID="txtMailCity" Text='<%# Bind("mail_city") %>' runat="server" MaxLength="50" />
            </td>
            <td>
            <label>State:</label></td>
            <td>

                <asp:DropDownList ID="ddlMailState" AppendDataBoundItems="true" CssClass="mail-state" runat="server" SelectedValue='<%# Bind("mail_state") %>' >
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem Text="AL" Value="AL" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="AK" Value="AK" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="AZ" Value="AZ" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="AR" Value="AR" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="CA" Value="CA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="CO" Value="CO" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="CT" Value="CT" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="DE" Value="DE" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="FL" Value="FL" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="GA" Value="GA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="HI" Value="HI" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="ID" Value="ID" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="IL" Value="IL" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="IN" Value="IN" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="IA" Value="IA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="KS" Value="KS" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="KY" Value="KY" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="LA" Value="LA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="ME" Value="ME" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MD" Value="MD" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MA" Value="MA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MI" Value="MI" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MN" Value="MN" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MS" Value="MS" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MO" Value="MO" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="MT" Value="MT" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NE" Value="NE" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NV" Value="NV" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NH" Value="NH" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NJ" Value="NJ" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NM" Value="NM" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NY" Value="NY" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="NC" Value="NC" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="ND" Value="ND" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="OH" Value="OH" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="OK" Value="OK" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="OR" Value="OR" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="PA" Value="PA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="RI" Value="RI" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="SC" Value="SC" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="SD" Value="SD" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="TN" Value="TN" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="TX" Value="TX" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="UT" Value="UT" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="VT" Value="VT" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="VA" Value="VA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="WA" Value="WA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="WV" Value="WV" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="WI" Value="WI" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="WY" Value="WY" Enabled="true"></asp:ListItem>
                </asp:DropDownList>


            </td>
            <td>
            <label>Zip:</label></td>
            <td>
            <asp:TextBox ID="txtMailZip" Text='<%# Bind("mail_zip") %>' runat="server" 
                Width="75px" MaxLength="5" />
            <%--<asp:CompareValidator ID="cmpMailZip" ControlToValidate="txtMailZip" runat="server" ForeColor="Red" Text="*" ErrorMessage="Zip Code Format" Type="Integer" Operator="DataTypeCheck" />--%>
                <asp:RequiredFieldValidator ID="rfvMailZip" runat="server" ControlToValidate="txtMailZip" ForeColor="Red" Text="*" ErrorMessage="Missing Mailing Zip Code" />
            </td>
            </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Actual Location:</label>
            </td>
            <td>
            <asp:TextBox ID="txtLocation" Text='<%# Bind("actual_location") %>' runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" ForeColor="Red" Text="*" ErrorMessage="Missing Location" />
            </td>
            <td>
            <label>State:</label></td>
            <td>
            <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" CssClass="mail-state" runat="server" SelectedValue='<%# Bind("loc_state") %>' >
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem Text="AL" Value="AL" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="AK" Value="AK" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="AZ" Value="AZ" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="AR" Value="AR" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="CA" Value="CA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="CO" Value="CO" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="CT" Value="CT" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="DE" Value="DE" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="FL" Value="FL" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="GA" Value="GA" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="HI" Value="HI" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="ID" Value="ID" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="IL" Value="IL" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="IN" Value="IN" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="IA" Value="IA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="KS" Value="KS" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="KY" Value="KY" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="LA" Value="LA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="ME" Value="ME" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MD" Value="MD" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MA" Value="MA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MI" Value="MI" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MN" Value="MN" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MS" Value="MS" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MO" Value="MO" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="MT" Value="MT" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NE" Value="NE" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NV" Value="NV" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NH" Value="NH" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NJ" Value="NJ" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NM" Value="NM" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NY" Value="NY" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="NC" Value="NC" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="ND" Value="ND" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="OH" Value="OH" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="OK" Value="OK" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="OR" Value="OR" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="PA" Value="PA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="RI" Value="RI" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="SC" Value="SC" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="SD" Value="SD" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="TN" Value="TN" Enabled="true"></asp:ListItem>
                <asp:ListItem Text="TX" Value="TX" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="UT" Value="UT" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="VT" Value="VT" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="VA" Value="VA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="WA" Value="WA" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="WV" Value="WV" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="WI" Value="WI" Enabled="False"></asp:ListItem>
                <asp:ListItem Text="WY" Value="WY" Enabled="False"></asp:ListItem>
                </asp:DropDownList>



            </td>
           <%-- <td>
            <label>Zip:</label></td>
            <td>
           <asp:TextBox ID="txtZip" Text='<%# Bind("loc_zip") %>' runat="server" Width="75px" 
                    MaxLength="5" />
            <asp:CompareValidator ID="cmpZip" ControlToValidate="txtZip" runat="server" ForeColor="Red" Text="*" ErrorMessage="Zip Code Format" Type="Integer" Operator="DataTypeCheck" />
             <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZip" ForeColor="Red" Text="*" ErrorMessage="Missing Zip Code" />
            </td>--%>
            </tr>
            <tr>
              <td>
                <label>County:</label>
              </td>
              <td>
                  <asp:TextBox ID="txtCounty" runat="server" Text='<%# Bind("county") %>' 
                      MaxLength="25" />
                  <asp:RequiredFieldValidator ID="rfvCounty" ControlToValidate="txtCounty" 
                      runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing County" />
              </td>
            </tr>
            <tr>
            <td>
            <label>File Checked Out By:</label></td>
            <td>
<%--              <asp:TextBox ID="txtCheckOut" runat="server" Text='<%# Bind("file_location") %>' 
                      MaxLength="25" />--%>
                <asp:DropDownList 
                     ID="ddlCheckOut" 
                     runat="server" 
                     DataSourceID="srcEmployeeData" 
                     AppendDataBoundItems="True" 
                     DataTextField="FullName"
                     DataValueField="file_location"
                     SelectedValue='<%# Bind("file_location") %>'>                           
                </asp:DropDownList>
            </td>
            </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Contact Name:</label></td>
            <td>
            <asp:TextBox ID="txtContactName" Text='<%# Bind("contact_name") %>' runat="server" 
                Width="275px" MaxLength="75" />
            </td>
            </tr>
            <tr>
            <td>
            <label>Contact Number:</label></td>
            <td>
            <asp:TextBox ID="txtContactNumber" Text='<%# Bind("contact_number") %>' 
                    runat="server" Width="120px" MaxLength="15" />
               <asp:RegularExpressionValidator ID="regContactNumber" runat="server" Text="*" 
                    ErrorMessage="Format Error:  XXX-XXX-XXXX" ControlToValidate="txtContactNumber" 
                    ForeColor="Red" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                <asp:MaskedEditExtender 
                     ID="MaskedEditExtender1" 
                     runat="server" 
                     TargetControlID="txtContactNumber" 
                     MaskType="Number" 
                     Mask="999-999-9999">
                </asp:MaskedEditExtender>
            <label>XXX-XXX-XXXX</label>
            </td>
            </tr>
            <tr>
            <td>
            <label>Agency:</label></td>
            <td>
               <asp:DropDownList 
                       ID="ddlAgency"  
                       runat="server" 
                       DataSourceID="srcAgency"                     
                       DataTextField="agency_name" 
                       DataValueField="agency_number" 
                       CssClass="add-agent"
                       SelectedValue='<%# Bind("agency_number") %>'>
                </asp:DropDownList>
            </td>
            </tr>
            </table>
            <br />
            <table>
              <tr>
                <td><lable>Eff Date:</lable></td>
                <td><lable>Policy Description:</lable></td>
                <td><lable>Action:</lable></td>
                <td><lable for="txtActionDate1">Date:</lable></td>
              </tr>
              <tr>
                <td>
                  <asp:TextBox ID="txtEffDate1" runat="server" class="mydate" Text='<%# Bind("pol1_date") %>' 
                        width="80px" MaxLength="10" />
                    <asp:RequiredFieldValidator ID="regEffDate" ControlToValidate="txtEffDate1" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Eff Date" />
                </td>
                <td>
                  <asp:TextBox ID="txtPolicyDesc1" runat="server" Text='<%# Bind("pol1_descr") %>' 
                        MaxLength="24" />
                  <asp:RequiredFieldValidator ID="regPolicyDesc" ControlToValidate="txtPolicyDesc1" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Policy Description" />
                </td>
                <td>
                    <asp:DropDownList ID="ddlAction1" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action1") %>'>
                        <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                        <asp:ListItem Text="REWRITTEN" Value="REWRITTEN"></asp:ListItem>
                        <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                        <asp:ListItem Text="NONPAYMENT" Value="NONPAYMENT"></asp:ListItem>
                        <asp:ListItem Text="AGENCY DEPARTURE" Value="AGENCY DEPARTURE"></asp:ListItem>
                        <asp:ListItem Text="CANCELED BY INSURED" Value="CANCELED BY INSURED"></asp:ListItem>                     
                        <asp:ListItem Text="NONRENEWAL BY SMC" Value="NONRENEWAL BY SMC"></asp:ListItem>
                        <asp:ListItem Text="NONRENEWAL BY INSURED" Value="NONRENEWAL BY INSURED"></asp:ListItem>
                    </asp:DropDownList>
                </td>
<%--                <td><div class="ui-widget"><asp:TextBox ID="txtActionDate1" runat="server" Text='<%# Eval("action1_date") %>' width="80px" /></div></td>
                <td><asp:Calendar ID="calEventDate" runat="server" onselectionchanged="calEventDate_SelectionChanged"></asp:Calendar>
                </td>--%>
                     <td><div class="ui-widget">
                    <input id="ActionDate1" name="ActionDate1" type="text" runat="server" value='<%# Bind("action1_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>

              </tr>
              <tr>
                <td><asp:TextBox ID="txtEffDate2" runat="server" class="mydate" Text='<%# Bind("pol2_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc2" runat="server" Text='<%# Bind("pol2_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction2" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action2") %>'>
                        <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                        <asp:ListItem Text="GOOD" Value="GOOD"></asp:ListItem>
                        <asp:ListItem Text="REWRITTEN" Value="REWRITTEN"></asp:ListItem>
                        <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                        <asp:ListItem Text="NONPAYMENT" Value="NONPAYMENT"></asp:ListItem>
                        <asp:ListItem Text="AGENCY DEPARTURE" Value="AGENCY DEPARTURE"></asp:ListItem>
                        <asp:ListItem Text="CANCELED BY INSURED" Value="CANCELED BY INSURED"></asp:ListItem>                     
                        <asp:ListItem Text="NONRENEWAL BY SMC" Value="NONRENEWAL BY SMC"></asp:ListItem>
                        <asp:ListItem Text="NONRENEWAL BY INSURED" Value="NONRENEWAL BY INSURED"></asp:ListItem>
                    </asp:DropDownList></td>
                <td><div class="ui-widget">
                    <input id="ActionDate2" name="ActionDate2" type="text" runat="server" value='<%# Bind("action2_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
             <tr>
                <td><asp:TextBox ID="txtEffDate3" runat="server" class="mydate" Text='<%# Bind("pol3_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc3" runat="server" Text='<%# Bind("pol3_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction3" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action3") %>'>
                        <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                        <asp:ListItem Text="GOOD" Value="GOOD"></asp:ListItem>
                        <asp:ListItem Text="REWRITTEN" Value="REWRITTEN"></asp:ListItem>
                        <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                        <asp:ListItem Text="NONPAYMENT" Value="NONPAYMENT"></asp:ListItem>
                        <asp:ListItem Text="AGENCY DEPARTURE" Value="AGENCY DEPARTURE"></asp:ListItem>
                        <asp:ListItem Text="CANCELED BY INSURED" Value="CANCELED BY INSURED"></asp:ListItem>                     
                        <asp:ListItem Text="NONRENEWAL BY SMC" Value="NONRENEWAL BY SMC"></asp:ListItem>
                        <asp:ListItem Text="NONRENEWAL BY INSURED" Value="NONRENEWAL BY INSURED"></asp:ListItem>
                    </asp:DropDownList></td>
                <td><div class="ui-widget">
                    <input id="ActionDate3" name="ActionDate3" type="text" runat="server" value='<%# Bind("action3_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtEffDate4" runat="server" class="mydate" Text='<%# Bind("pol4_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc4" runat="server" Text='<%# Bind("pol4_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction4" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action4") %>'>
                        <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                        <asp:ListItem Text="GOOD" Value="GOOD"></asp:ListItem>
                        <asp:ListItem Text="REWRITTEN" Value="REWRITTEN"></asp:ListItem>
                        <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                        <asp:ListItem Text="NONPAYMENT" Value="NONPAYMENT"></asp:ListItem>
                        <asp:ListItem Text="AGENCY DEPARTURE" Value="AGENCY DEPARTURE"></asp:ListItem>
                        <asp:ListItem Text="CANCELED BY INSURED" Value="CANCELED BY INSURED"></asp:ListItem>                     
                        <asp:ListItem Text="NONRENEWAL BY SMC" Value="NONRENEWAL BY SMC"></asp:ListItem>
                        <asp:ListItem Text="NONRENEWAL BY INSURED" Value="NONRENEWAL BY INSURED"></asp:ListItem>
                    </asp:DropDownList></td>
                <td><div class="ui-widget">
                    <input id="ActionDate4" name="ActionDate4" type="text" runat="server" value='<%# Bind("action4_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtEffDate5" runat="server" class="mydate" Text='<%# Bind("pol5_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc5" runat="server" Text='<%# Bind("pol5_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction5" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action5") %>'>
                        <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                        <asp:ListItem Text="GOOD" Value="GOOD"></asp:ListItem>
                        <asp:ListItem Text="REWRITTEN" Value="REWRITTEN"></asp:ListItem>
                        <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                        <asp:ListItem Text="NONPAYMENT" Value="NONPAYMENT"></asp:ListItem>
                        <asp:ListItem Text="AGENCY DEPARTURE" Value="AGENCY DEPARTURE"></asp:ListItem>
                        <asp:ListItem Text="CANCELED BY INSURED" Value="CANCELED BY INSURED"></asp:ListItem>                     
                        <asp:ListItem Text="NONRENEWAL BY SMC" Value="NONRENEWAL BY SMC"></asp:ListItem>
                        <asp:ListItem Text="NONRENEWAL BY INSURED" Value="NONRENEWAL BY INSURED"></asp:ListItem>
                    </asp:DropDownList></td>
                <td><div class="ui-widget">
                    <input id="ActionDate5" name="ActionDate5" type="text" runat="server" value='<%# Bind("action5_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
            </table>
            <br />
            <table>
             <tr>
             <td><lable>Comments:</lable></td>
             </tr>
             <tr>
             <td>
                 <asp:TextBox ID="txtComment" runat="server" Text='<%# Eval("comments") %>' 
                     Width="400px" Height="50px" TextMode="MultiLine" MaxLength="1500" />
             </td>
             </tr>
            </table>     
            <br /><br />
            <asp:LinkButton 
                 ID="LinkButton4" 
                 CommandName="Update"
                 Text="Update"
                 runat="server" />
            &nbsp;|&nbsp;
            <asp:LinkButton 
                 ID="lnkCancel" 
                 CommandName="Cancel"
                 CausesValidation="false"
                 Text="Cancel"
                 runat="server" />  
                 
            <asp:ValidationSummary 
                  ID="ValidationSummary1" 
                  ShowSummary="false" 
                  ShowMessageBox="true" 
                  runat="server" />  
        </EditItemTemplate>
     </asp:DataList>


    <br /><br />
    <asp:ObjectDataSource 
         ID="srcGetRecord"
         SelectMethod="GetSingleRecord" 
         TypeName="_GetRecord" 
         runat="server" 
         DeleteMethod="DeleteRecord"
         UpdateMethod="UpdateRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="CustNum" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustNo" />
            <asp:Parameter Name="CustStatus" />
            <asp:Parameter Name="ProxyInit" />
            <asp:Parameter Name="InsuredName" />
            <asp:Parameter Name="Contact" />
            <asp:Parameter Name="MailAddress" />
            <asp:Parameter Name="MailCity" />
            <asp:Parameter Name="MailState" />
            <asp:Parameter Name="MailZip" />
            <asp:Parameter Name="Location" />
            <asp:Parameter Name="State" />
            <asp:Parameter Name="County" />
            <asp:Parameter Name="file_location" />
            <asp:Parameter Name="ContactName" />
            <asp:Parameter Name="ContactNumber" />            
            <asp:Parameter Name="EffDate1" />
            <asp:Parameter Name="Desc1" />
            <asp:Parameter Name="EffDate2" />
            <asp:Parameter Name="Desc2" />
            <asp:Parameter Name="EffDate3" />
            <asp:Parameter Name="Desc3" />
            <asp:Parameter Name="EffDate4" />
            <asp:Parameter Name="Desc4" />
            <asp:Parameter Name="EffDate5" />
            <asp:Parameter Name="Desc5" />
            <asp:Parameter Name="Action1" />
            <asp:Parameter Name="ActionDate1" />
            <asp:Parameter Name="Action2" />
            <asp:Parameter Name="ActionDate2" />
            <asp:Parameter Name="Action3" />
            <asp:Parameter Name="ActionDate3" />
            <asp:Parameter Name="Action4" />
            <asp:Parameter Name="ActionDate4" />
            <asp:Parameter Name="Action5" />
            <asp:Parameter Name="ActionDate5" />
            <asp:Parameter Name="Comments" />
        </UpdateParameters>
        <DeleteParameters>
                <asp:Parameter Name="cust_no" />
        </DeleteParameters>
    </asp:ObjectDataSource>


    <asp:ObjectDataSource 
         ID="srcStatusList" 
         runat="server" 
         SelectMethod="GetList" 
         TypeName="_GetStatusList">
   </asp:ObjectDataSource>


    <asp:ObjectDataSource 
         ID="srcEmployeeData" 
         runat="server"
         TypeName="_GetRecord"
         SelectMethod="GetEmployeeByAvailable">
    </asp:ObjectDataSource>

        <asp:ObjectDataSource 
         ID="srcAgency" 
         TypeName="_GetRecord"
         runat="server" 
         SelectMethod="GetAgency">
   </asp:ObjectDataSource>

    </asp:Content>





