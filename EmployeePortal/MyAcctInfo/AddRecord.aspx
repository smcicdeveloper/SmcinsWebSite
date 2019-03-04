<%@ Page Title="Add" Language="VB" MasterPageFile="~/Shared/ElectronicFormView.master" MaintainScrollPositionOnPostback="true"  AutoEventWireup="false" CodeFile="AddRecord.aspx.vb" Inherits="Webpages_AddRecord" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <link href="../../CSS/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>

    <style type="text/css">
        #ActionDate1  {
            width: 80px;
        }
        
        h4 {
            margin-bottom:15px; 
            font-weight:bold; text-decoration:underline;
        }
    </style>

<script type="text/javascript">
    function pageLoad() { $(".mydate").datepicker();
    }

    $(document).on("click", "[id*=LinkButton1]", function () {

        $("#dialog").dialog({
            title: "View Details",
            width: 680,
            buttons: {

                Ok: function () {
                    $(this).dialog('close');
                }

            },
            modal: true
        });
        return false;
    });


    function showUpdate() {
        var divUpdate = document.getElementById('divUpdate');
        divUpdate.style.display = 'block';

    }

    function hideUpdate() {
        var divUpdate = document.getElementById('divUpdate');
        divUpdate.style.display = 'none';

    }

</script>

<script runat="server">
       
    ''' <summary>
    ''' Add a confirmation dialog box to the Delete links
    ''' </summary>
    Protected Sub grdNew_RowCreated(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNew.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lnkDelete As LinkButton = CType(e.Row.Cells(0).Controls(0), LinkButton)
            lnkDelete.Attributes("onclick") = "return confirm('Delete Record?')"
        End If
    End Sub

</script>


<br /><br />

 <asp:HiddenField 
   ID="HiddenDate" 
   runat="server" />

<div id="add-data">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<%--    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="250">
    <ProgressTemplate>
    <div class="title" style="text-align:center; color:Blue; font-size:14pt; z-index:2; position:absolute; right:37%; top:40%;">
      <img src="../../CSS/gifs/rotation4.GIF" alt="waiting" />
      <br />
       Please wait while we process your transaction...
     </div>
    </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <br />
    <h4>General Information</h4>
    <asp:FormView 
         ID="frmNewRecord" 
         runat="server" 
         DefaultMode="Insert" 
         DataSourceID="srcAddRecord">       
        <InsertItemTemplate>
            <table>
            <tr>
                <td>
                    <label>
                    Insured:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtInsured" runat="server" Text='<%# Bind("InsuredName") %>' 
                        Width="300px" MaxLength="50" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTheInsured" ControlToValidate="txtInsured" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Insured Name." />
                </td>
                </tr>
              <tr>
                <td>
                    <label>
                    Attention:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtContact" runat="server" Text='<%# Bind("Contact") %>' 
                        Width="300px" MaxLength="35" TabIndex="2" />
                </td>
               </tr>

              <tr>
                <td>
                    <label>
                    Mail Address:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMailAddress" runat="server" Text='<%# Bind("MailAddress") %>' 
                        Width="300px" MaxLength="75" TabIndex="2" />
                    <asp:RequiredFieldValidator ID="rfvMailAddress" 
                        ControlToValidate="txtMailAddress" runat="server" ForeColor="Red" Text="*" 
                        ErrorMessage="Missing Mailing Address" Enabled="true" />
                </td>
              </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Mail City:</label>
            </td>
            <td>
            <asp:TextBox ID="txtMailCity" Text='<%# Bind("MailCity") %>' runat="server" MaxLength="25" TabIndex="3" />
                <asp:RequiredFieldValidator ID="rfvMailCity" ControlToValidate="txtMailCity" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Mailing City." />
            </td>
            <td>
            <label>State:</label></td>
            <td>

                <asp:DropDownList ID="ddlMailState" AppendDataBoundItems="true" 
                    CssClass="mail-state" runat="server" SelectedValue='<%# Bind("MailState") %>' TabIndex="4" >
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
            <asp:TextBox ID="txtMailZip" Text='<%# Bind("MailZip") %>' runat="server" 
                    Width="75px" MaxLength="10" TabIndex="5" />
            <asp:MaskedEditExtender 
                ID="MaskedEditExtender2" 
                TargetControlID="txtMailZip" 
                MaskType="None"
                Mask="99999-9999"
                runat="server" 
                AutoCompleteValue="99999-9999" 
                AutoComplete="True" 
                ClearMaskOnLostFocus="False">
            </asp:MaskedEditExtender>
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
            <asp:TextBox ID="txtLocation" Text='<%# Bind("Location") %>' 
                    runat="server" MaxLength="25" TabIndex="6" />
                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" 
                    ControlToValidate="txtLocation" ForeColor="Red" Text="*" 
                    ErrorMessage="Missing Actual Location" />
            </td>
            <td>
            <label>State:</label>
            </td>
            <td>
            <asp:DropDownList 
                    ID="ddlState" 
                    runat="server" 
                    DataSourceID="odsState" 
                    DataTextField="State" 
                    DataValueField="State" 
                    SelectedValue='<%# Bind("State") %>'
                    CssClass="mail-state"
                    AutoPostBack="True" 
                    onselectedindexchanged="ddlState_SelectedIndexChanged" 
                    TabIndex="7">
            </asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="rfvState" ControlToValidate="ddlState" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing State" />--%>
            </td>
            </tr>
            <tr>
              <td>
                <label>County:</label>
              </td>
              <td>
                 <asp:DropDownList 
                     ID="ddlCounty" 
                     runat="server" 
                     AppendDataBoundItems="false"
                     DataSourceID="odsCounty" 
                     DataTextField="County" 
                     DataValueField="County"
                     Width="120px" 
                     TabIndex="8">
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
             <td>
              <label>Church Email:</label>
             </td>
             <td>
               <asp:TextBox ID="txtChurchEmail" runat="server" Text='<%# Bind("ChurchEmail") %>' Width="160px" MaxLength="45" TabIndex="9" />
             </td>
            </tr>
             <tr>
            <td>
            <label>File Checked Out By:</label></td>
            <td>
                <asp:DropDownList 
                     ID="ddlCheckOutBy" 
                     runat="server" 
                     DataSourceID="srcEmployeeData" 
                     AppendDataBoundItems="True" 
                     DataTextField="FullName"
                     DataValueField="file_location"
                     SelectedValue='<%# Bind("file_location") %>' 
                     TabIndex="10">                           
                </asp:DropDownList>
            </td>
            </tr>
            </table>
            <table>

            <tr>
            <td>
            <label>Agency:</label></td>
            <td>
                <asp:DropDownList 
                     ID="ddlAgency" 
                     DataSourceID="srcAgency"
                     runat="server"  
                     DataTextField="agency_name" 
                     DataValueField="agency_number" 
                     SelectedValue='<%# Bind("Agency") %>' 
                     CssClass="add-agent" 
                     TabIndex="11">
                </asp:DropDownList>
            </td>
            </tr>
            </table>
            <br />
                <hr />
            <br />
            <h4>Policy Type</h4>
            <table>
              <tr>
                <td><lable>Eff Date:</lable></td>
                <td><lable>Policy Description:</lable></td>
              </tr>
              <tr>
                <td><div class="ui-widget">
                    <input id="ActionDate1" name="txtEffDate1" type="text" runat="server" value='<%# Bind("EffDate1") %>' class="mydate" style="width:80px" tabindex="12" /></div>
                </td>

                <td>
                    <asp:DropDownList ID="ddlPolicyDesc1" AppendDataBoundItems="true" 
                        runat="server" SelectedValue='<%# Bind("Desc1") %>' CssClass="add-policy" 
                        TabIndex="13">
                     <asp:ListItem Text="SMP-BASIC" Value="SMP-BASIC" Enabled="true" />
                     <asp:ListItem Text="SMP-BROAD" Value="SMP-BROAD" Enabled="true" />
                     <asp:ListItem Text="SMP-SPECIAL" Value="SMP-SPECIAL" Enabled="true" />
                     <asp:ListItem Text="STANDARD FIRE" Value="STANDARD FIRE" Enabled="true" />
                     <asp:ListItem Text="STD FIRE-BUILDERS RISK" Value="STD FIRE-BUILDERS RISK" Enabled="true" />
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="regEffDate" ControlToValidate="ActionDate1" 
                        runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Eff Date" />
                </td>
                <td>
                  <%--<asp:RequiredFieldValidator ID="regPolicyDesc" ControlToValidate="txtPolicyDesc1" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Policy Description" />--%>
                </td>
              </tr>
              <tr>
                <td><div class="ui-widget">
                  <input id="ActionDate2" name="txtEffDate2" type="text" runat="server" value='<%# Bind("EffDate2") %>' class="mydate" style="width:80px" tabindex="14" /></div>
                </td>
                <td>
                  <asp:DropDownList ID="ddlPolicyDesc2" AppendDataBoundItems="true" runat="server" 
                        SelectedValue='<%# Bind("Desc2") %>' CssClass="add-policy" TabIndex="15">
                     <asp:ListItem Text="(NONE)" Value="" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO" Value="BUSINESS AUTO" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO HNOA ONLY" Value="BUSINESS AUTO HNOA ONLY" Enabled="true" />
                     <asp:ListItem Text="BUILDERS RISK" Value="BUILDERS RISK" Enabled="true" />
                     <asp:ListItem Text="FLOOD" Value="FLOOD" Enabled="true" />
                     <asp:ListItem Text="SPECIAL ACCIDENT" Value="SPECIAL ACCIDENT" Enabled="true" />
                     <asp:ListItem Text="WORKERS COMP" Value="WORKERS COMP" Enabled="true" />
                     <asp:ListItem Text="UMBRELLA" Value="UMBRELLA" Enabled="true" />
                    </asp:DropDownList>
                
                </td>
              </tr>
             <tr>
                <td><div class="ui-widget">
                  <input id="ActionDate3" name="txtEffDate3" type="text" runat="server" value='<%# Bind("EffDate3") %>' class="mydate" style="width:80px" tabindex="16" /></div>
                </td>
                <td><asp:DropDownList ID="ddlPolicyDesc3" AppendDataBoundItems="true" 
                        runat="server" SelectedValue='<%# Bind("Desc3") %>' CssClass="add-policy" 
                        TabIndex="17">
                     <asp:ListItem Text="(NONE)" Value="" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO" Value="BUSINESS AUTO" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO HNOA ONLY" Value="BUSINESS AUTO HNOA ONLY" Enabled="true" />
                     <asp:ListItem Text="BUILDERS RISK" Value="BUILDERS RISK" Enabled="true" />
                     <asp:ListItem Text="FLOOD" Value="FLOOD" Enabled="true" />
                     <asp:ListItem Text="SPECIAL ACCIDENT" Value="SPECIAL ACCIDENT" Enabled="true" />
                     <asp:ListItem Text="WORKERS COMP" Value="WORKERS COMP" Enabled="true" />
                     <asp:ListItem Text="UMBRELLA" Value="UMBRELLA" Enabled="true" />
                    </asp:DropDownList></td>
              </tr>
              <tr>
                <td><div class="ui-widget">
                  <input id="ActionDate4" name="txtEffDate4" type="text" runat="server" value='<%# Bind("EffDate4") %>' class="mydate" style="width:80px" tabindex="18" /></div>
                </td>
                <td>
                <asp:DropDownList ID="ddlPolicyDesc4" AppendDataBoundItems="true" runat="server" 
                        SelectedValue='<%# Bind("Desc4") %>' CssClass="add-policy" TabIndex="19">
                     <asp:ListItem Text="(NONE)" Value="" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO" Value="BUSINESS AUTO" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO HNOA ONLY" Value="BUSINESS AUTO HNOA ONLY" Enabled="true" />
                     <asp:ListItem Text="BUILDERS RISK" Value="BUILDERS RISK" Enabled="true" />
                     <asp:ListItem Text="FLOOD" Value="FLOOD" Enabled="true" />
                     <asp:ListItem Text="SPECIAL ACCIDENT" Value="SPECIAL ACCIDENT" Enabled="true" />
                     <asp:ListItem Text="WORKERS COMP" Value="WORKERS COMP" Enabled="true" />
                     <asp:ListItem Text="UMBRELLA" Value="UMBRELLA" Enabled="true" />
                    </asp:DropDownList>
                </td>
              </tr>
              <tr>
                <td><div class="ui-widget">
                  <input id="ActionDate5" name="txtEffDate5" type="text" runat="server" value='<%# Bind("EffDate5") %>' class="mydate" style="width:80px" tabindex="20" /></div>
                </td>
                <td>
                <asp:DropDownList ID="ddlPolicyDesc5" AppendDataBoundItems="true" runat="server" 
                        SelectedValue='<%# Bind("Desc5") %>' CssClass="add-policy" TabIndex="21">
                     <asp:ListItem Text="(NONE)" Value="" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO" Value="BUSINESS AUTO" Enabled="true" />
                     <asp:ListItem Text="BUSINESS AUTO HNOA ONLY" Value="BUSINESS AUTO HNOA ONLY" Enabled="true" />
                     <asp:ListItem Text="BUILDERS RISK" Value="BUILDERS RISK" Enabled="true" />
                     <asp:ListItem Text="FLOOD" Value="FLOOD" Enabled="true" />
                     <asp:ListItem Text="SPECIAL ACCIDENT" Value="SPECIAL ACCIDENT" Enabled="true" />
                     <asp:ListItem Text="WORKERS COMP" Value="WORKERS COMP" Enabled="true" />
                     <asp:ListItem Text="UMBRELLA" Value="UMBRELLA" Enabled="true" />
                    </asp:DropDownList>
                </td>
              </tr>
            </table>
            <br />
<%--              <asp:LinkButton 
                 ID="lnkAddRecord" 
                 CommandName="Insert"
                 Text="Add Record"
                 runat="server" CausesValidation="false" 
                 TabIndex="28"  />  --%> 

                              
            <asp:ValidationSummary 
                  ID="ValidationSummary1" 
                  ShowSummary="false" 
                  ShowMessageBox="true" 
                  runat="server" />  
           
        </InsertItemTemplate>
      </asp:FormView>
      <br />
        <hr />
      <br />
      <h4>Contact Information</h4>
          <asp:FormView 
         ID="frmAddContacts" 
         runat="server" 
         DefaultMode="Insert" 
         DataSourceID="srcAddContact">       
          <InsertItemTemplate>
           <table>
                       <tr>
            <td>
            <label>Contact Name:</label></td>
            <td>
            <asp:TextBox ID="txtContactName" Text='<%# Bind("fullname") %>' runat="server" Width="275px" MaxLength="35" TabIndex="22" />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ForeColor="Red" ControlToValidate="txtContactName" Text="*" ErrorMessage="Missing Contact Name." />
            </td>
            </tr>
            <tr>
            <td>
            <label>Phone Number:</label></td>
            <td>
            <asp:TextBox ID="txtContactNumber" Text='<%# Bind("churchnum") %>' runat="server" Width="120px" MaxLength="12" TabIndex="23" />
                <asp:MaskedEditExtender 
                     ID="MaskedEditExtender1"                     
                     TargetControlID="txtContactNumber" 
                     MaskType="Number" 
                     Mask="999-999-9999"
                     runat="server">
                </asp:MaskedEditExtender>
            <label>XXX-XXX-XXXX</label>
            </td>
            </tr>
            <tr>
            <td>
            <label>Cell Phone:</label></td>
            <td>
            <asp:TextBox ID="txtCellPhone" Text='<%# Bind("cellphone") %>' 
                    runat="server" Width="120px" MaxLength="12" TabIndex="24" />
                <asp:MaskedEditExtender 
                     ID="MaskedEditExtender3" 
                     runat="server" 
                     TargetControlID="txtCellPhone" 
                     MaskType="Number" 
                     Mask="999-999-9999">
                </asp:MaskedEditExtender>
            <label>XXX-XXX-XXXX</label>
            </td>
            </tr>

            <tr>
             <td><label>Email:</label></td>
             <td>
               <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" 
                     Text='<%# Bind("email") %>' Width="190px" Wrap="False" TabIndex="25" />
                    <asp:RegularExpressionValidator ID="regAddMail" runat="server" Text="*" 
                        ErrorMessage="Format Error: name@domain.com" ControlToValidate="txtEmail" 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />           
             </td>           
            </tr>
            <tr>
             <td><label>Department:</label></td>
             <td>
            <asp:DropDownList ID="ddlDepartment" runat="server" AppendDataBoundItems="True" SelectedValue='<%# Bind("departmentid") %>' TabIndex="26">
                <asp:ListItem Value="1">All Calls</asp:ListItem>
                <asp:ListItem Value="200">Accounting</asp:ListItem>
                <asp:ListItem Value="500">Claims</asp:ListItem>
                <asp:ListItem Value="420">Loss Control</asp:ListItem>
                <asp:ListItem Value="410">Marketing</asp:ListItem>
                <asp:ListItem Value="400">Underwriting</asp:ListItem>
                </asp:DropDownList>           
             </td>
            </tr>
            <tr>
             <td><label>Notes:</label></td>
             <td>
                <asp:TextBox ID="txtNotes" runat="server" MaxLength="27" 
                     Text='<%# Bind("notes") %>' TextMode="MultiLine" Width="175px" 
                     TabIndex="26" />
             </td>
            </tr>
           </table>
           <br />

          </InsertItemTemplate>
          </asp:FormView>
          <br />

            <asp:LinkButton 
                 ID="lnkAddRecord" 
                 CommandName="Insert"
                 Text="Add Record"
                 runat="server" 
                 CausesValidation="True" 
                 TabIndex="28" 
                 onclick="lnkAddRecord_Click" />   
    <br /><br />
    </ContentTemplate>

    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="frmNewRecord" EventName="ItemInserting" />
    </Triggers>

  </asp:UpdatePanel>
  </div>
  
          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
      <ContentTemplate>

  <div id="see-grd">
    <asp:GridView 
         ID="grdNew" 
         runat="server" 
         AutoGenerateColumns="False" 
         DataKeyNames="cust_no" 
         DataSourceID="srcGetNewRecord" 
         EmptyDataText="No New Records At This Time"          
         Width="370px" 
         AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" SelectText="Modify" Visible="False" />
            <asp:TemplateField HeaderText="Customer Number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCustNum" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="The Insured">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("insured_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("insured_name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
        <SelectedRowStyle CssClass="selectedRow" />
    </asp:GridView>
    <br />
    </div>

    </ContentTemplate>
  </asp:UpdatePanel>


    <asp:ObjectDataSource 
         ID="srcAddRecord"
         TypeName="_AddRecord"           
         runat="server" 
         InsertMethod="AddNewRecord">
        <InsertParameters>
            <asp:Parameter Name="custnum" Type="Int32" Direction="Output" />
            <asp:Parameter Name="CustStatus" />
            <asp:Parameter Name="Proxy" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="InsuredName" />
            <asp:Parameter Name="Contact" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="MailAddress" />
            <asp:Parameter Name="MailCity" />
            <asp:Parameter Name="MailState" />
            <asp:Parameter Name="MailZip" />
            <asp:Parameter Name="Location" />
            <asp:Parameter Name="State" />
            <asp:Parameter Name="County" />
            <asp:Parameter Name="ChurchEmail" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Agency" />
            <asp:Parameter Name="file_location" />
            <asp:Parameter Name="EffDate1" />
            <asp:Parameter Name="Desc1" />
            <asp:Parameter Name="EffDate2" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Desc2" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="EffDate3" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Desc3" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="EffDate4" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Desc4" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="EffDate5" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Desc5" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action1" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action1Day" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action2" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action2Day" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action3" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action3Day" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action4" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action4Day" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action5" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Action5Day" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Comments" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="ContactName" />
            <asp:Parameter Name="ContactNumber" />
            <asp:Parameter Name="Today" />
            <asp:Parameter Name="Empnum" />
        </InsertParameters>
   </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcAgency" 
         TypeName="_GetRecord"
         runat="server" 
         SelectMethod="GetAgency">
   </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcGetNewRecord" 
         TypeName="_GetRecord"
         runat="server"
         SelectMethod="GetInsured" 
         DeleteMethod="DeleteRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenDate" Name="DateCreated" PropertyName="Value" />
            <asp:SessionParameter Name="Empnum" SessionField="UserNameIs" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcGetRecord"
         SelectMethod="GetSingleRecord" 
         TypeName="_GetRecord" 
         runat="server"
         UpdateMethod="UpdateRecord2">
        <SelectParameters>
            <asp:ControlParameter Name="cust_no" ControlID="grdNew" />
        </SelectParameters>
    </asp:ObjectDataSource>

      <asp:ObjectDataSource 
         ID="srcEmployeeData" 
         runat="server"
         TypeName="_GetRecord"
         SelectMethod="GetEmployeeByAvailable">
    </asp:ObjectDataSource>

   <asp:ObjectDataSource 
         ID="odsState" 
         runat="server" 
         SelectMethod="GetState" 
         TypeName="_GetRecord">
   </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="odsCounty" 
         runat="server" 
         SelectMethod="GetCounty" 
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:Parameter DefaultValue="KY" Name="State" />
        </SelectParameters>
        </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcAddContact" 
         runat="server" 
         TypeName="_AddRecord"
         InsertMethod="AddNewContact" 
         SelectMethod="GetContactForAllCalls">
        <InsertParameters>
            <asp:Parameter Name="custnum" />
            <asp:Parameter Name="fullname" />
            <asp:Parameter Name="churchnum" />
            <asp:Parameter Name="cellphone" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="departmentid" />
            <asp:Parameter Name="notes" />
        </InsertParameters>
     <SelectParameters>
            <asp:Parameter Name="cust_no" Type="Int32" />
    </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

