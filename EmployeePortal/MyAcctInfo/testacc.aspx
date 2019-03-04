<%@ Page Title="" Language="VB" MasterPageFile="~/Shared/ElectronicFormView.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="testacc.aspx.vb" Inherits="emptools_MyAcctInfo_Search" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Web.UI.ExtenderControl" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <style type="text/css">
        #ActionDate1
        {
            width: 80px;
        }
        
         #accordion  {
            
            Height:75%;
            border:0px solid black;
            }
            
        .dcell img {
            height:60px;
            }
            
        .modalBackground {
          background-color:Black;
          filter:alpha(opacity-90);
          opacity:0.8;
          }
          
          .modalPopup {
              background-color: #FFFFFF;
              border-width: 3px;
              border-style: solid;
              border-color: Black;
              padding:20px;  
              width:400px;
              height:300px;
              font-size:10px;  
              }
                          
           .buttonBar ul li {
               list-style:none;
               float:left;
               margin-right:5px;
               }   
        
    </style>

    <script src="../../js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <link href="../../CSS/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" />

    <script runat="server">
        <System.Web.Script.Services.ScriptMethod(), _
        System.Web.Services.WebMethod()> _
        Public Shared Function GetSuggestions(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        
            Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
            Dim con As SqlConnection = New SqlConnection(MyConnection)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "select cust_no, insured_name, mail_city, actual_location, loc_state, FileLocation.FullName, cust_status from acctinfo INNER JOIN FileLocation ON acctinfo.file_location = FileLocation.file_location where cust_no LIKE @SearchText + '%' OR insured_name LIKE @SearchText + '%' OR mail_city LIKE @SearchText + '%' OR actual_location LIKE @SearchText + '%' ORDER BY insured_name, mail_city"
            cmd.Parameters.AddWithValue("@SearchText", prefixText)
            cmd.CommandType = CommandType.Text
             
            con.Open()
            Dim customers As List(Of String) = New List(Of String)
            Dim MyList As List(Of String) = New List(Of String)
        
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                customers.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(reader("cust_no").ToString() + " - " + reader("insured_name").ToString.Trim() + " - " + reader("mail_city").ToString.Trim() + " - " + reader("actual_location").ToString.Trim() + " - " + reader("loc_state").ToString.Trim() + " - " + reader("FullName").ToString.Trim() + " - " + reader("cust_status").ToString.Trim(), reader("cust_no").ToString()))
                       
            End While
            con.Close()
       
            Return customers
                        
        End Function
               
    </script>

    <script type="text/javascript">
        function ace1_itemSelected(sender, e) {
            var ace1Value = $get('<%= ace1Value.ClientID %>');
            ace1Value.value = e.get_value();
        }

        function pageLoad() { $(".mydate").datepicker();
        }

        function showing(e, args) {
            $.each(e._completionListElement.childNodes, function (key, value) {
                value.innerHTML = value.innerHTML.toString('Insured Name:', '<b>Insured Name:</b>');
                value.innerHTML = value.innerHTML.toString('Mail City:', '<b>Mail City:</b>');
                value.innerHTML = value.innerHTML.toString('Location:', '<b>Location:</b>');
                // value.innerHTML = value.innerHTML.replace('Insured Name:', '<b>Insured Name:</b>');
                // value.innerHTML = value.innerHTML.replace('Mail City:', '<b>Mail City:</b>');
                // value.innerHTML = value.innerHTML.replace('Location:', '<b>Location:</b>');
            });
        }

        $(document).ready(function () {

            $('#accordion').accordion();

            $('button').button();
        });

        function dialog() {
            $('#dialog').dialog({ autoOpen: true, minWidth: 975, hide: true });
        };

</script>

<%--
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    <div id="Note"><h4><b>Note:  </b>Customer Number - Insured - Mail City - Location - State - File Location - Status</h4></div>

    <br />
    <label>Type Here:</label>
    <asp:TextBox 
         ID="txtSearchBox" 
         runat="server" 
         Width="77%" 
         Font-Size="Small" />
        <asp:AutoCompleteExtender 
         ID="ace1" 
         TargetControlID="txtSearchBox"
         ServiceMethod="GetSuggestions"
         MinimumPrefixLength="1"
         DelimiterCharacters=""
         OnClientItemSelected="ace1_itemSelected"
         FirstRowSelected="true"
         runat="server" 
         CompletionListCssClass="auto-complete1" 
         CompletionSetCount="1000000000"
         EnableCaching="False" 
         CompletionInterval="3" 
         CompletionListHighlightedItemCssClass="auto-complete3" 
         CompletionListItemCssClass="auto-complete2"
         OnClientShowing="showing"
         ShowOnlyCurrentWordInCompletionListItem="True" />
        <asp:HiddenField 
         ID="ace1Value" 
         runat="server"
         />
    <asp:Button 
         ID="btnSearch" 
         runat="server" 
         Text="Search" 
         CausesValidation="false"
         Width="65px" />
    <asp:Button 
         ID="btnClear" 
         runat="server" 
         Text="Clear" 
         CausesValidation="false"
         Width="65px" />
    <br /><br /><br />
    
<%--         </ContentTemplate>
   </asp:UpdatePanel>--%>

        <asp:DataList 
         ID="dlstRecord" 
         DataSourceID="srcGetRecord"
         runat="server" 
         DataKeyField="cust_no" >
       <ItemTemplate>
        <asp:LinkButton 
            ID="lnkEdit" 
            CommandName="Edit"
            Text="Edit Mode"
            CausesValidation="false"
            runat="server"/>
        &nbsp;|&nbsp;
        <asp:LinkButton 
        ID="LinkButton2" 
        CommandName="Delete"
        Text="Delete"
        CausesValidation="false"
        OnClientClick="return confirm('Are you sure?');"
        runat="server" />
         &nbsp;|&nbsp;
        <asp:LinkButton 
            ID="lnkAddContact" 
            CommandName="Insert"
            Text="Add New Contact"
            CausesValidation="false"
            runat="server" 
            onclick="lnkAddContact_Click" />
        <br /><br />
       <table>
            <tr>
            <td>
            <label>File Checked Out By:</label></td>
            <td>
            <asp:TextBox ID="txtFullNameRead" Text='<%# Eval("FullName") %>' runat="server" 
                    BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" Width="220" />
            </td>
            </tr>
       </table>
          <table>
           <tr>
             <td>
            <label>Customer No.</label></td>
            <td>
            <asp:TextBox ID="txtCustNoRead" Text='<%# Eval("cust_no") %>' runat="server" 
                Width="50px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            <td>
            <label>Status:</label></td>
            <td>
            <asp:TextBox ID="txtCustStatusRead" Text='<%# Eval("cust_status") %>' runat="server" 
                Width="71px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            <td>
            <label>Proxy:</label>
            </td>
            <td>
            <asp:TextBox ID="txtProxyInitRead" Text='<%# Eval("proxy_init") %>' runat="server" 
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
                    <asp:TextBox ID="txtInsuredNameRead" runat="server" Text='<%# Eval("insured_name") %>' 
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
                    <asp:TextBox ID="txtContactRead" runat="server" Text='<%# Eval("contact") %>' 
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
                    <asp:TextBox ID="txtMailAddrRead" runat="server" Text='<%# Eval("mail_addr") %>' 
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
            <asp:TextBox ID="txtMailCityRead" Text='<%# Eval("mail_city") %>' runat="server" 
                    BorderStyle="Solid" ReadOnly="True" BorderColor="White" Enabled="False" />
            </td>
            <td>
            <label>State:</label></td>
            <td>
            <asp:TextBox ID="txtMailStateRead" Text='<%# Eval("mail_state") %>' runat="server" 
                Width="35px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            <td>
            <label>Zip:</label></td>
            <td>
            <asp:TextBox ID="txtMailZipRead" Text='<%# Eval("mail_zip") %>' runat="server" 
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
            <asp:TextBox ID="txtLocationRead" Text='<%# Eval("actual_location") %>' runat="server" 
                    BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" />
            </td>
            </tr>
            <tr>
            <td>
            <label>State:</label></td>
            <td>
            <asp:TextBox ID="txtStateRead" Text='<%# Eval("loc_state") %>' runat="server" 
                Width="35px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
           <tr>
              <td>
                <label>County:</label>
              </td>
              <td>
                  <asp:TextBox ID="txtCountyRead" Text='<%# Eval("county") %>' runat="server" 
                      BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" />
              </td>
            </tr>
            <tr>
            <td>
            <label>Contact Name:</label></td>
            <td>
            <asp:TextBox ID="txtContactNameRead" Text='<%# Eval("contact_name") %>' runat="server" 
                Width="275px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                    Enabled="False" />
            </td>
            </tr>
            <tr>
            <td>
            <label>Contact Number:</label></td>
            <td>
            <asp:TextBox ID="txtContactNumberRead" Text='<%# Eval("contact_number") %>' runat="server" 
                Width="120px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" />
            </td>
            </tr>
            <tr>
            <td>
            <label>Agency:</label></td>
            <td>
            <asp:TextBox ID="txtAgencyNameRead" Text='<%# Eval("agency_name") %>' runat="server" 
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
                <td><asp:TextBox ID="txtPol1DateRead" runat="server" Text='<%# Eval("pol1_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="txtPol1DescrRead" runat="server" Text='<%# Eval("pol1_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False" /></td>
                <td><asp:TextBox ID="txtAction1Read" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action1") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="txtAction1DateRead" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action1_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtPol2DateRead" runat="server" Text='<%# Eval("pol2_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="txtPol2DescrRead" runat="server" Text='<%# Eval("pol2_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="txtAction2Read" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action2") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="txtAction2DateRead" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action2_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
             <tr>
                <td><asp:TextBox ID="txtPol3DateRead" runat="server" Text='<%# Eval("pol3_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="txtPol3DescrRead" runat="server" Text='<%# Eval("pol3_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="txtAction3Read" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action3") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="txtAction3DateRead" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action3_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtPol4DateRead" runat="server" Text='<%# Eval("pol4_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="txtPol4DescrRead" runat="server" Text='<%# Eval("pol4_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="txtAction4Read" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action4") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="txtAction4DateRead" runat="server" width="80px" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action4_date") %>' ReadOnly="True" 
                        Enabled="False" /></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtPol5DateRead" runat="server" Text='<%# Eval("pol5_date") %>' 
                        width="80px" BorderStyle="Solid" BorderColor="White" ReadOnly="True" 
                        Enabled="False" /></td>
                <td><asp:TextBox ID="txtPol5DescrRead" runat="server" Text='<%# Eval("pol5_descr") %>' 
                        BorderStyle="Solid" BorderColor="White" ReadOnly="True" Enabled="False"  /></td>
                <td><asp:TextBox ID="txtAction5Read" runat="server" BorderStyle="Solid" 
                        BorderColor="White" Text='<%# Eval("action5") %>' ReadOnly="True" 
                        Enabled="False" Width="190px" /></td>
                <td><asp:TextBox ID="txtAction5DateRead" runat="server" width="80px" BorderStyle="Solid" 
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
                 <asp:TextBox ID="txtCommentsRead" runat="server" Text='<%# Eval("comments") %>' 
                     Width="400px" Height="50px" BorderStyle="Solid" BorderColor="White" 
                     ReadOnly="True" Font-Names="Calibri" TextMode="MultiLine" 
                     Enabled="False" />
             </td>
             </tr>
            </table>
            <br />
               <div id="accordion">
                    <h2><a href="#">+ All Calls</a></h2>
                    <div id="row1">
                        <asp:GridView 
                             ID="grvReadAllCalls" 
                             runat="server" 
                             AutoGenerateColumns="False" 
                             DataKeyNames="contact_id" 
                             DataSourceID="srcAllContacts"
                             TypeName="_GetRecord" 
                             EmptyDataText="There are no contacts to display.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                 </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Left" />
                         <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>

                    <h2><a href="#">+ Accounting Contacts</a></h2>
                    <div id="row2">
                         <asp:GridView 
                             ID="grvReadAccounting" 
                             runat="server" 
                             AutoGenerateColumns="False" 
                             DataKeyNames="contact_id" 
                             DataSourceID="srcAccountingContacts"
                             TypeName="_GetRecord" 
                             EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>                                     
                    </div>

                   <h2><a href="#">+ Claims Contacts</a></h2>
                        <div id="row3">
                             <asp:GridView 
                                 ID="grvReadClaims" 
                                 runat="server" 
                                 AutoGenerateColumns="False" 
                                 DataKeyNames="contact_id" 
                                 DataSourceID="srcClaimsContacts"
                                 TypeName="_GetRecord" 
                                 EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                        </div>

                <h2><a href="#">+ Loss Control Contacts</a></h2>
                     <div id="row4">
                         <asp:GridView 
                             ID="grvReadLossControl" 
                             runat="server" 
                             AutoGenerateColumns="False" 
                             DataKeyNames="contact_id" 
                             DataSourceID="srcLossControlContacts"
                             TypeName="_GetRecord" 
                             EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                              <EmptyDataRowStyle HorizontalAlign="Left" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>                                        
                    </div>

               <h2><a href="#">+ Marketing Contacts</a></h2>
                        <div id="row5">
                             <asp:GridView 
                                 ID="grvReadMarketing" 
                                 runat="server" 
                                 AutoGenerateColumns="False" 
                                 DataKeyNames="contact_id" 
                                 DataSourceID="srcMarketingContacts"
                                 TypeName="_GetRecord" 
                                 EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                     </div>

           <h2><a href="#">+ Underwriting Contacts</a></h2>
                        <div id="row6">
                             <asp:GridView 
                                 ID="grvReadUnderwriting" 
                                 runat="server" 
                                 AutoGenerateColumns="False" 
                                 DataKeyNames="contact_id" 
                                 DataSourceID="srcUnderwritingContacts"
                                 TypeName="_GetRecord" 
                                 EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>
                </div>
            <br /><br />

            </ItemTemplate>
        <EditItemTemplate>
            <asp:LinkButton 
                 ID="LinkButton4" 
                 CommandName="Update"
                 Text="Save"
                 runat="server" />
            &nbsp;|&nbsp;
            <asp:LinkButton 
                 ID="lnkCancel" 
                 CommandName="Cancel"
                 CausesValidation="false"
                 Text="Cancel"
                 runat="server" />  
                 <br /><br />
         <table>
           <tr>
            <td>
            <label>File Checked Out By:</label></td>
            <td>
                <asp:DropDownList 
                     ID="ddlCheckOutEdit" 
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
            <label>Customer No.</label></td>
            <td>
            <asp:TextBox ID="txtCustNoEdit" Text='<%# Eval("cust_no") %>' runat="server" 
                Width="50px" Enabled="False" ReadOnly="True" />          
            </td>
            <td>
            <label>Status:</label></td>
            <td>
                <asp:DropDownList ID="ddlStatusEdit" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("cust_status") %>'>
                <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                <asp:ListItem Text="ACTIVE" Value="ACTIVE"></asp:ListItem>
                <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                <asp:ListItem Text="EXPIRED" Value="EXPIRED"></asp:ListItem>
                </asp:DropDownList>
               <asp:RequiredFieldValidator ID="rvfStatus" ControlToValidate="ddlStatusEdit" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Status" />
            </td>
            <td>
            <label>Proxy:</label>
            </td>
            <td>
                <asp:DropDownList ID="ddlProxyEdit" AppendDataBoundItems="True" runat="server" 
                    SelectedValue='<%# Bind("proxy_init") %>'>
                <asp:ListItem Text="(None)" Value=""></asp:ListItem>
                <asp:ListItem Text="ALG" Value="ALG"></asp:ListItem>
                <asp:ListItem Text="CP" Value="CP"></asp:ListItem>
                <asp:ListItem Text="FTH" Value="FTH"></asp:ListItem>
                <asp:ListItem Text="LGR" Value="LGR"></asp:ListItem>
                <asp:ListItem Text="RAB" Value="RAB"></asp:ListItem>
                <asp:ListItem Text="RWB" Value="RWB"></asp:ListItem>
                <asp:ListItem Text="RES" Value="RES"></asp:ListItem>
                <asp:ListItem Text="TGE" Value="TGE"></asp:ListItem>
                <asp:ListItem Text="WLS" Value="WLS"></asp:ListItem>
                <asp:ListItem Text="WG" Value="WG"></asp:ListItem>
                </asp:DropDownList>

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
                    <asp:TextBox ID="txtInsuredEdit" runat="server" Text='<%# Bind("insured_name") %>' 
                        Width="300px" MaxLength="50"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td>
                    <label>
                    Contact:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtContactEdit" runat="server" Text='<%# Bind("contact") %>' 
                        Width="300px" MaxLength="50" />
                </td>
                </tr>
              <tr>
                <td>
                    <label>
                    Mail Address:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMailAddressEdit" runat="server" Text='<%# Bind("mail_addr") %>' 
                        Width="300px" MaxLength="75" />
                    <asp:RequiredFieldValidator ID="rfvMailAddress" ControlToValidate="txtMailAddressEdit" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Mailing Address" />
                </td>
              </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Mail City:</label>
            </td>
            <td>
                <asp:TextBox ID="txtMailCityEdit" Text='<%# Bind("mail_city") %>' runat="server" MaxLength="50" />
            </td>
            <td>
            <label>State:</label></td>
            <td>
                <asp:DropDownList ID="ddlMailStateEdit" AppendDataBoundItems="true" CssClass="mail-state" runat="server" SelectedValue='<%# Bind("mail_state") %>' >
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
            <asp:TextBox ID="txtMailZipEdit" Text='<%# Bind("mail_zip") %>' runat="server" 
                Width="75px" MaxLength="10" />

            <%--<asp:CompareValidator 
                     ID="cmpMailZip" 
                     ControlToValidate="txtMailZip" 
                     runat="server" 
                     ForeColor="Red" 
                     Text="*" 
                     ErrorMessage="Zip Code Format" 
                     Type="Integer" Operator="DataTypeCheck" />--%>

                <asp:MaskedEditExtender 
                     ID="MaskedEditExtender2" 
                     TargetControlID="txtMailZipEdit" 
                     MaskType="None"
                     Mask="99999-9999"
                     runat="server" 
                     AutoCompleteValue="99999-9999"
                     AutoComplete="True" 
                     ClearMaskOnLostFocus="False">
                </asp:MaskedEditExtender>

                <asp:RequiredFieldValidator 
                     ID="rfvMailZip" 
                     runat="server" 
                     ControlToValidate="txtMailZipEdit" 
                     ForeColor="Red" 
                     Text="*" 
                     ErrorMessage="Missing Mailing Zip Code" />

<%--                <asp:MaskedEditExtender 
                     ID="MaskedEditExtender3" 
                     TargetControlID="txtMailZipEdit" 
                     MaskType="Number"
                     Mask="99999-0000"
                     runat="server" 
                     AutoCompleteValue="99999-0000"
                     AutoComplete="True" 
                     ClearMaskOnLostFocus="False">
                </asp:MaskedEditExtender>

                <asp:RequiredFieldValidator 
                     ID="RequiredFieldValidator2" 
                     runat="server" 
                     ControlToValidate="txtMailZipEdit" 
                     ForeColor="Red" 
                     Text="*" 
                     ErrorMessage="Missing Mailing Zip Code" />--%>
            </td>
            </tr>
            </table>
            <table>
            <tr>
            <td>
            <label>Actual Location:</label>
            </td>
            <td>
            <asp:TextBox ID="txtLocationEdit" Text='<%# Bind("actual_location") %>' runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocationEdit" ForeColor="Red" Text="*" ErrorMessage="Missing Location" />
            </td>
            </tr>
            <tr>
            <td>
            <label>State:</label></td>
            <td>
            <asp:DropDownList ID="ddlStateEdit" AppendDataBoundItems="true" CssClass="mail-state" runat="server" Width="80" SelectedValue='<%# Bind("loc_state") %>' >
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlStateEdit" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing State" />
            </td>
            </tr>
            <tr>
              <td>
                <label>County:</label>
              </td>
              <td>
                  <asp:TextBox ID="txtCountyEdit" runat="server" Text='<%# Bind("county") %>' 
                      MaxLength="25" />
<%--                  <asp:RequiredFieldValidator ID="rfvCounty" ControlToValidate="txtCountyEdit" 
                      runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing County" />--%>
              </td>
            </tr>
            <tr>
            <td>
            <label>Contact Name:</label></td>
            <td>
            <asp:TextBox ID="txtContactNameEdit" Text='<%# Bind("contact_name") %>' runat="server" 
                Width="275px" MaxLength="75" />
            </td>
            </tr>
            <tr>
            <td>
            <label>Contact Number:</label></td>
            <td>
            <asp:TextBox ID="txtContactNumberEdit" Text='<%# Bind("contact_number") %>' 
                    runat="server" Width="120px" MaxLength="15" />
                <asp:MaskedEditExtender 
                     ID="MaskedEditExtender1"
                     TargetControlID="txtContactNumberEdit" 
                     MaskType="Number"
                     Mask="999-999-9999"
                     runat="server" 
                     AutoCompleteValue="999-999-9999" 
                     AutoComplete="True" 
                     ClearMaskOnLostFocus="False">
                </asp:MaskedEditExtender>
            <label>XXX-XXX-XXXX</label>
            </td>
            </tr>
            <tr>
            <td>
            <label>Agency:</label></td>
            <td>
               <asp:DropDownList 
                       ID="ddlAgencyEdit"  
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
                  <asp:TextBox ID="txtEffDate1Edit" runat="server" CssClass="mydate" Text='<%# Bind("pol1_date") %>' 
                        width="80px" MaxLength="10" />
                    <asp:RequiredFieldValidator ID="regEffDate" ControlToValidate="txtEffDate1Edit" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Eff Date" />
                </td>
                <td>
                  <asp:TextBox ID="txtPolicyDesc1Edit" runat="server" Text='<%# Bind("pol1_descr") %>' 
                        MaxLength="24" />
                  <asp:RequiredFieldValidator ID="regPolicyDesc" ControlToValidate="txtPolicyDesc1Edit" runat="server" ForeColor="Red" Text="*" ErrorMessage="Missing Policy Description" />
                </td>
                <td>
                    <asp:DropDownList ID="ddlAction1Edit" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action1") %>'>
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
                     <td><div class="ui-widget">
                    <input id="ActionDate1Edit" name="ActionDate1" type="text" runat="server" value='<%# Bind("action1_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>

              </tr>
              <tr>
                <td><asp:TextBox ID="txtEffDate2Edit" runat="server" CssClass="mydate" Text='<%# Bind("pol2_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc2Edit" runat="server" Text='<%# Bind("pol2_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction2Edit" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action2") %>'>
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
                    <input id="ActionDate2Edit" name="ActionDate2" type="text" runat="server" value='<%# Bind("action2_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
             <tr>
                <td><asp:TextBox ID="txtEffDate3Edit" runat="server" CssClass="mydate" Text='<%# Bind("pol3_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc3Edit" runat="server" Text='<%# Bind("pol3_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction3Edit" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action3") %>'>
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
                    <input id="ActionDate3Edit" name="ActionDate3" type="text" runat="server" value='<%# Bind("action3_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtEffDate4Edit" runat="server" CssClass="mydate" Text='<%# Bind("pol4_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc4Edit" runat="server" Text='<%# Bind("pol4_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction4Edit" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action4") %>'>
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
                    <input id="ActionDate4Edit" name="ActionDate4" type="text" runat="server" value='<%# Bind("action4_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
              <tr>
                <td><asp:TextBox ID="txtEffDate5Edit" runat="server" CssClass="mydate" Text='<%# Bind("pol5_date") %>' 
                        width="80px" MaxLength="10" /></td>
                <td><asp:TextBox ID="txtPolicyDesc5Edit" runat="server" Text='<%# Bind("pol5_descr") %>'  /></td>
                <td><asp:DropDownList ID="ddlAction5Edit" AppendDataBoundItems="true" runat="server" Width="153px" SelectedValue='<%# Bind("action5") %>'>
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
                    <input id="ActionDate5Edit" name="ActionDate5" type="text" runat="server" value='<%# Bind("action5_date") %>' class="mydate" style="width:80px" maxlength="10" /></div></td>
              </tr>
            </table>
            <br />
            <table>
             <tr>
             <td><lable>Comments:</lable></td>
             </tr>
             <tr>
             <td>
                 <asp:TextBox ID="txtCommentEdit" runat="server" Text='<%# Eval("comments") %>' 
                     Width="400px" Height="50px" TextMode="MultiLine" MaxLength="1500" />
             </td>
             </tr>
            </table>  
                <div id="accordion">
                    <h2><a href="#">+ All Calls</a></h2>
                    <div id="row1">
                        <asp:GridView 
                             ID="grvEditAllCalls" 
                             runat="server" 
                             AutoGenerateColumns="False" 
                             DataKeyNames="contact_id" 
                             DataSourceID="srcAllContacts"
                             TypeName="_GetRecord" 
                             EmptyDataText="There are no contacts to display.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCustNo" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFullName" runat="server" 
                                                Text='<%# Bind("full_name") %>' Width="124px" MaxLength="30"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditChurchNumber" runat="server" 
                                                Text='<%# Bind("church_number") %>' Width="90px" MaxLength="12"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCellPhone" runat="server" 
                                                Text='<%# Bind("cell_phone") %>' Width="90px" MaxLength="12"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDepartmentId" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditNotes" runat="server" Text='<%# Bind("notes") %>' 
                                                MaxLength="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="60px" Wrap="False" />
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonEdit" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkButtonUpdate" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="lnkButtonCancel" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                 </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Left" />
                         <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>

                    <h2><a href="#">+ Accounting Contacts</a></h2>
                    <div id="row2">
                         <asp:GridView 
                             ID="grvEditAccounting" 
                             runat="server" 
                             AutoGenerateColumns="False" 
                             DataKeyNames="contact_id" 
                             DataSourceID="srcAccountingContacts"
                             TypeName="_GetRecord" 
                             EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCustNo" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFullName" runat="server" 
                                                Text='<%# Bind("full_name") %>' MaxLength="30" Width="124px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="130px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditChurchNumber" runat="server" 
                                                Text='<%# Bind("church_number") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCellPhone" runat="server" 
                                                Text='<%# Bind("cell_phone") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDepartmentId" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditNotes" runat="server" Text='<%# Bind("notes") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="65px" Wrap="False" />
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonEdit" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkButtonUpdate" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="lnkButtonCancel" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>                                     
                    </div>

                   <h2><a href="#">+ Claims Contacts</a></h2>
                        <div id="row3">
                             <asp:GridView 
                                 ID="grvEditClaims" 
                                 runat="server" 
                                 AutoGenerateColumns="False" 
                                 DataKeyNames="contact_id" 
                                 DataSourceID="srcClaimsContacts"
                                 TypeName="_GetRecord" 
                                 EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCustNo" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFullName" runat="server" 
                                                Text='<%# Bind("full_name") %>' MaxLength="30" Width="124px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditChurchNumber" runat="server" 
                                                Text='<%# Bind("church_number") %>' MaxLength="30" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCellPhone" runat="server" 
                                                Text='<%# Bind("cell_phone") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDepartmentId" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditNotes" runat="server" Text='<%# Bind("notes") %>' 
                                                MaxLength="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                               <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkButtonDelte" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="65px" Wrap="False" />
                                 </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonEdit" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkButtonUpdate" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="lnkButtonCancel" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>
                    <h2><a href="#">+ Loss Control Contacts</a></h2>
                     <div id="row4">
                         <asp:GridView 
                             ID="grvEditLossControl" 
                             runat="server" 
                             AutoGenerateColumns="False" 
                             DataKeyNames="contact_id" 
                             DataSourceID="srcLossControlContacts"
                             TypeName="_GetRecord" 
                             EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCustNo" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFullName" runat="server" 
                                                Text='<%# Bind("full_name") %>' MaxLength="30" Width="124px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditChurchNumber" runat="server" 
                                                Text='<%# Bind("church_number") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCellPhone" runat="server" 
                                                Text='<%# Bind("cell_phone") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDepartmentId" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditNotes" runat="server" Text='<%# Bind("notes") %>' 
                                                MaxLength="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                        </ItemTemplate>
                                         <HeaderStyle HorizontalAlign="Left" Width="65px" Wrap="False" />
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonEdit" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkButtonUpdate" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="lnkButtonCancel" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                              <EmptyDataRowStyle HorizontalAlign="Left" />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>                                        
                    </div>

                   <h2><a href="#">+ Marketing Contacts</a></h2>
                        <div id="row5">
                             <asp:GridView 
                                 ID="grvEditMarketing" 
                                 runat="server" 
                                 AutoGenerateColumns="False" 
                                 DataKeyNames="contact_id" 
                                 DataSourceID="srcMarketingContacts"
                                 TypeName="_GetRecord" 
                                 EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCustNo" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFullName" runat="server" 
                                                Text='<%# Bind("full_name") %>' MaxLength="30" Width="124px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditChurchNumber" runat="server" 
                                                Text='<%# Bind("church_number") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCellPhone" runat="server" 
                                                Text='<%# Bind("cell_phone") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDepartmentId" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditNotes" runat="server" Text='<%# Bind("notes") %>' 
                                                MaxLength="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                        </ItemTemplate>
                                          <HeaderStyle HorizontalAlign="Left" Width="65px" Wrap="False" />
                                     </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonEdit" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkButtonUpdate" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="lnkButtonCancel" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>
                    <h2><a href="#">+ Underwriting Contacts</a></h2>
                        <div id="row6">
                             <asp:GridView 
                                 ID="grvEditUnderwriting" 
                                 runat="server" 
                                 AutoGenerateColumns="False" 
                                 DataKeyNames="contact_id" 
                                 DataSourceID="srcUnderwritingContacts"
                                 TypeName="_GetRecord" 
                                 EmptyDataText="There are no contacts for this department.">
                                <Columns>
                                    <asp:TemplateField HeaderText="contact_id" SortExpression="contact_id" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("contact_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("contact_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="cust_no" SortExpression="cust_no" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCustNo" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Full Name" SortExpression="full_name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFullName" runat="server" 
                                                Text='<%# Bind("full_name") %>' MaxLength="30" Width="124px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Church Number" SortExpression="church_number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditChurchNumber" runat="server" 
                                                Text='<%# Bind("church_number") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cell Phone" SortExpression="cell_phone">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditCellPhone" runat="server" 
                                                Text='<%# Bind("cell_phone") %>' MaxLength="12" Width="90px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>' 
                                                MaxLength="50"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id" 
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditDepartmentId" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Notes" SortExpression="notes">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditNotes" runat="server" Text='<%# Bind("notes") %>' 
                                                MaxLength="100"></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure?');" />
                                </ItemTemplate>
                                  <HeaderStyle HorizontalAlign="Left" Width="65px" Wrap="False" />
                             </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modify" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="lnkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </div>
                </div>
            <br /><br />                
            <asp:ValidationSummary 
                  ID="ValidationSummary1" 
                  ShowSummary="false" 
                  ShowMessageBox="true" 
                  runat="server" />  
        </EditItemTemplate>
     </asp:DataList>



        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ModalPopupExtender 
                ID="mpe1" 
                runat="server" 
                TargetControlID="HiddenField1" 
                PopupControlID="Panel1"                              
                BackgroundCssClass="modalBackground" 
                OkControlID="OK" 
                Drag="True" 
                PopupDragHandleControlID="Panel1">
            </asp:ModalPopupExtender>

        <asp:Panel 
             ID="Panel1" 
             runat="server" 
             CssClass="modalPopup" 
             style="display:none;">

            <div style="position:absolute;Top:2px;left:91%;">
            <asp:Button ID="OK" runat="server" Text="X" CausesValidation="false" />
            </div>
            <br />
            <br />
            <div>
           <asp:DetailsView 
                 ID="dlvAddContact"
                 DataSourceID="srcAddContact" 
                 runat="server" 
                 DefaultMode="Insert" 
                 AutoGenerateRows="False" 
                 AutoGenerateInsertButton="True" 
                 CellPadding="4" 
                 CellSpacing="2">                
                <Fields>
                    <asp:BoundField DataField="contact_id" HeaderText="contact_id" SortExpression="contact_id" Visible="False" />
                    <asp:TemplateField HeaderText="Customer Number" SortExpression="cust_no" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("cust_no") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddCustNo" runat="server" Text='<%# Bind("custnum") %>' Width="100px"></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Full Name:" SortExpression="full_name">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("full_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddFullName" runat="server" MaxLength="30" 
                                Text='<%# Bind("fullname") %>' Width="190px" Wrap="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server" Text="*" ErrorMessage="Full name required" ControlToValidate="txtAddFullName" ForeColor="Red" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Church Number:" SortExpression="church_number">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("church_number") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("church_number") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddChurchNum" runat="server" MaxLength="12" Text='<%# Bind("churchnum") %>' Width="115px" Wrap="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regChurchNumber" runat="server" Text="*" ErrorMessage="Format Error:  XXX-XXX-XXXX" ControlToValidate="txtAddChurchNum" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cell Phone:" SortExpression="cell_phone">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("cell_phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cell_phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddCellPhone" runat="server" MaxLength="12" 
                                Text='<%# Bind("cellphone") %>' Width="115px" Wrap="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regCellPhone" runat="server" Text="*" ErrorMessage="Format Error:  XXX-XXX-XXXX" ControlToValidate="txtAddCellPhone" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email:" SortExpression="email">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddEmail" runat="server" MaxLength="50" 
                                Text='<%# Bind("email") %>' Width="190px" Wrap="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regAddMail" runat="server" Text="*" 
                                ErrorMessage="Format Error: name@domain.com" ControlToValidate="txtAddEmail" 
                                ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department:" SortExpression="department" Visible="False">
                        <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("department") %>'></asp:TextBox>                           
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("department") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="department_id" SortExpression="department_id">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("department_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("department_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                          <asp:DropDownList ID="ddlDepartment" runat="server" AppendDataBoundItems="True" SelectedValue='<%# Bind("departmentid") %>'>
                            <asp:ListItem Value="1">All Calls</asp:ListItem>
                            <asp:ListItem Value="200">Accounting</asp:ListItem>
                            <asp:ListItem Value="500">Claims</asp:ListItem>
                            <asp:ListItem Value="420">Loss Control</asp:ListItem>
                            <asp:ListItem Value="410">Marketing</asp:ListItem>
                            <asp:ListItem Value="400">Underwriting</asp:ListItem>
                          </asp:DropDownList>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Notes:" SortExpression="notes">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("notes") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("notes") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtAddNotes" runat="server" MaxLength="100" Text='<%# Bind("notes") %>' TextMode="MultiLine" Width="175px"></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
                 <asp:ValidationSummary 
                  ID="ValidationSummary1" 
                  ShowSummary="false" 
                  ShowMessageBox="true" 
                  runat="server" />  
            </div>
        </asp:Panel>
             </ContentTemplate>
          </asp:UpdatePanel>


    <br /><br />

    <asp:ObjectDataSource 
         ID="srcGetRecord"
         SelectMethod="GetSingleRecord" 
         TypeName="_GetRecord" 
         runat="server" 
         DeleteMethod="DeleteRecord"
         UpdateMethod="UpdateRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustNo" />
            <asp:Parameter Name="CustStatus" />
            <asp:Parameter Name="proxy_init" />
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

    <asp:ObjectDataSource 
         ID="srcAllContacts" 
         runat="server" 
         SelectMethod="GetContactForAllCalls" 
         DeleteMethod="DeleteContact"
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="contact_id" />
        </DeleteParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcAccountingContacts" 
         runat="server" 
         SelectMethod="GetContactForAccounting" 
         DeleteMethod="DeleteContact"
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
       </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="contact_id" />
        </DeleteParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcClaimsContacts" 
         runat="server" 
         SelectMethod="GetContactForClaims" 
         DeleteMethod="DeleteContact"
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
    </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="contact_id" />
        </DeleteParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcLossControlContacts" 
         runat="server" 
         SelectMethod="GetContactForLossControl" 
         DeleteMethod="DeleteContact"
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
    </SelectParameters>
         <DeleteParameters>
            <asp:Parameter Name="contact_id" />
        </DeleteParameters>
    </asp:ObjectDataSource>

        <asp:ObjectDataSource 
         ID="srcMarketingContacts" 
         runat="server" 
         SelectMethod="GetContactForMarketing" 
         DeleteMethod="DeleteContact"
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
    </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="contact_id" />
        </DeleteParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
         ID="srcUnderwritingContacts" 
         runat="server" 
         SelectMethod="GetContactForUnderwriting"
         DeleteMethod="DeleteContact" 
         TypeName="_GetRecord">
        <SelectParameters>
            <asp:ControlParameter ControlID="ace1Value" Name="cust_no" PropertyName="Value" />
    </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="contact_id" />
        </DeleteParameters>
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

