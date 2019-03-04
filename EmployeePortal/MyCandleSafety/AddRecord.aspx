<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddRecord.aspx.vb" MaintainScrollPositionOnPostback="true" Inherits="EmployeePortal_MyCandleSafety_AddRecord" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
        <script type="text/javascript">
            function valComments_ClientValidate(source, args) {
                if (args.Value.length < 4)
                    args.IsValid = false;
                else
                    args.IsValid = true;

            }

            function valName_ClientValidate(source, args) {
                if (args.Value.length > 1)
                    args.IsValid = true;
                else
                    args.IsValid = false;
            }
        </script>
    <style type="text/css">
        /*reset*/
        
        *{
          padding:0;
          margin:0;
         }
        
        
        #wrapper {
            width:85%;
            height:100%;
            margin-left:auto;
            margin-right:auto;
            padding: 0 3%;
            /*border-right:1px solid #ccc;
            border-left:1px solid #ccc;*/
            }
        
        #header {
            float:left;
            background-color:white;
            margin:10px 0 0 0;
            width:100%;
            height:100px;
            }
            
        #main_content {
            float:left;
            background-color:White;
            margin: 10px 5px 10px 0px;
            width: 60%;
            height: 975px;
            }    
            
         #sidebar {
            float:right;
            margin:10px 5px 5px 6px;
            background-color:White;
            width:38%;
            height:975px;
            }
            
         #search, #message {
             margin:10px 0 50px 20px;
             list-style:none;
             } 
                             
         #footer {
            clear:both;
            float:left;
            width:100%;
            height:100px;
         }      
            
        body {
            background-color:#f9f9f9; 
            font-family:Verdana,Geneva,sans-serif;
           }
             
        fieldset {
            background-color:White; 
            }
            
        Ul li {
            font-size:11px;
        }
        
        h5 {
            padding:20px;
            }
            
        p {
            padding:15px 0 0 20px;
            font-size:12px;
            /*color:#0845a8;*/
          }  
          
        hr {
           border:.5px dotted #0845a8;
           width:96%; 
          }   
           
        .search_box {
            padding:5px;
            font-size:12px;
            border:.5px solid #e8e9ea;
            color:#505151;
            }   
                
        .radio {
            margin:20px; 
            white-space:nowrap;
            }
        
        .radio li {
            list-style:none;
            margin:10px;
            padding-bottom:10px;
            color:#505151;
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
         
         .no_match {
             padding:5px;
             margin-top:20px;
             margin-bottom:20px;
             list-style:none;
             font-size:11px;
             color:red;
             }
             
        .gridview {
            font-size:11px;
            margin:20px; 
            }
            
        .gridview td, gridview th {
            padding:8px;
            }
            
        .grHeader {
            text-align:left;  
            width:150px;         
            }  
            
        .row td {
            border-bottom:1px dotted #ddd;
            width:150px;
            text-align:left;
            }  
            
        .tabs {
            position:relative;
            top:1px;
            left:10px;
            }  
        
        .tab {
            background-color:#eeeeee;
            margin-right:15px;
            padding:5px 0px 5px 0px;
            width:96%;
            } 
        
        .selectedTab {
            background-color:White;
            } 
        
        .tabContents {
            border:solid 1px #eeeeee;
            padding:40px;
            background-color:White;
            width:70%;
            }   
        
        .chart {
           margin:6% 0 0 10%;
           }             
         
        .textbox {
            font-size:11px;
            border:0 solid White;
            color:#505151;
            } 
                          
        .button {
            font-size:11px; 
            background-color:#75a6f4; 
            color:White; 
            border-collapse:collapse; 
            border: .5px black;            
            padding:4px 8px; 
            text-decoration:none;          
            }
        
        /*.radioButton { display:none;}*/
        
    </style>

    </head>
    <body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

   
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

 <div id="wrapper">

    <div id="header">
      <h1>Candle Safety Manager</h1>
    </div><!-- End header -->

    <div id="main_content">

     <h5 class="account">Candle Use</h5>
        <p><b><i>Our church uses:</i></b></p>
        <ul class="radio">   
            <li>              
            <asp:RadioButtonList ID="rblCandleUse" CssClass="radios" runat="server" CellPadding="2" CellSpacing="10">                                    
                <asp:ListItem Text="Open Flame Candles" Value="Open Flame Candles" Selected="True" />
                <asp:ListItem Text="No Candles" Value="No Candles" />  
                <asp:ListItem Text="Non Flame Candles" Value="Non Flame Candles" />
            </asp:RadioButtonList>
            </li>
            <li>
            </li>
        </ul>
     <hr style="color:#e8e9ea;" />

       <h5 class="account">Add Designated Candle Person</h5>
        <asp:FormView 
             ID="frmPerson" 
             runat="server" 
             DataSourceID="srcAddPerson" 
             DefaultMode="Insert">
            <InsertItemTemplate>
                <ul id="search">
                 <li>
                     <label>Enter Full Name:</label>
                     <asp:TextBox ID="txtFullName" runat="server" CssClass="search_box" />                         
                      <asp:LinkButton 
                           ID="lnkAddRecord" 
                           CommandName="Insert" 
                           Text="Add Record" 
                           runat="server" 
                           CssClass="button" 
                           CausesValidation="True" 
                           onclick="lnkAddRecord_Click" />
                        <asp:RequiredFieldValidator 
                           ID="rfvFullName2" 
                           runat="server" 
                           ErrorMessage="Missing Full Name" 
                           Text="*" 
                           ForeColor="Red" 
                           ControlToValidate="txtFullName"  />
                           
                     </li>
                     <li>
                     </li>
                    </ul>
                <ul id="message">
                 <li>
                     <asp:Label ID="lblLimit" runat="server" ForeColor="Red" />
                 </li>
                </ul>
            </InsertItemTemplate>
        </asp:FormView>

    <hr />


    <br />
    <br />
       
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
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" 
                            OnClientClick="return confirm('Are you sure?')" OnClick="LinkButton1_Click" />
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
                <asp:BoundField DataField="custnum" HeaderText="Customer Number" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="fullname" HeaderText="Full Name" >
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
                    <ItemStyle HorizontalAlign="Left" />
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
                <asp:BoundField DataField="entryrecipient" HeaderText="EntryRecipient" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>

<HeaderStyle CssClass="grHeader"></HeaderStyle>

<RowStyle CssClass="row"></RowStyle>
        </asp:GridView> 
              <br />
              <br />
             
 
      </div><!-- End main content -->


    <div id="sidebar">   
     
        <h5 class="account">Account Lookup</h5>
            <ul  id="search">
                <li>
                    <label>Customer Number:</label>
                    <asp:TextBox ID="txtCustomerNum" runat="server" MaxLength="5" AutoCompleteType="Disabled" CssClass="search_box" />           
                    <asp:LinkButton ID="btnLookUp" runat="server" Text="Look Up" CssClass="button" CausesValidation="false" />
                </li>
                <li>
                    <asp:DetailsView 
                        ID="dtlMatch" 
                        EmptyDataText="<b>No Matching Record!</b>" 
                        runat="server" 
                        BorderColor="White" 
                        BorderStyle="None" >
                    </asp:DetailsView>
                <asp:CustomValidator ID="valComments" runat="server" ForeColor="White" ControlToValidate="txtCustomerNum" Text="*" ErrorMessage="Customer number must be 4 or 5 digits in length" OnServerValidate="valComments_ServerValidate" ClientValidationFunction="valComments_ClientValidate" />
                <asp:RequiredFieldValidator ID="rfvCustomerNum" runat="server" ForeColor="White" ErrorMessage="Missing customer number." Text="*" ControlToValidate="txtCustomerNum" />
                <asp:RegularExpressionValidator ID="revCustomerNum" runat="server" ForeColor="White" ErrorMessage="Numeric values only for customer number." Text="*" ValidationExpression="^\d+$" ControlToValidate="txtCustomerNum" />               
                </li>
                <li>
                </li>  
            </ul>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
          
           <hr />

    <asp:FormView 
    ID="frmAddress" 
    runat="server" >
        <EmptyDataTemplate>
                
                <ul class="no_match">
                    <li>
                        <p>No match found. Please check your entry and try again.</p>
                    </li>
                </ul>                        
              
        </EmptyDataTemplate>
    <ItemTemplate>
    <h5>Address</h5>
        <ul class="address">
            <li>
                <asp:Label ID="lblCustNum" runat="server" Text="" Visible="false" />
            </li>
            <li>
            <label>Church:</label>
            <asp:TextBox ID="txtChurch" Text='<%# Eval("insured_name") %>' runat="server" ReadOnly="true" Width="200px" CssClass="textbox" />
            </li>
            <li>
            <label>Mailing Address:</label>
            <asp:TextBox ID="txtAddress" Text='<%# Eval("mail_addr") %>' runat="server" Width="180px" ReadOnly="true" CssClass="textbox" />
            </li>
            <li>
            <label>Mailing City:</label>
            <asp:TextBox ID="txtCity" Text='<%# Eval("mail_city") %>' runat="server" ReadOnly="true" CssClass="textbox" />
            </li>    
            <li>
            <label>Mailing State:</label>
            <asp:TextBox ID="txtState" Text='<%# Eval("mail_state") %>' runat="server" ReadOnly="true" CssClass="textbox" />
            </li>  
            <li>
            <label>Mailing Zip:</label>
            <asp:TextBox ID="txtZip" Text='<%# Eval("mail_zip") %>' runat="server" ReadOnly="true" CssClass="textbox" />
            </li> 
            <li>
            <label>Actual Location:</label>
            <asp:TextBox ID="txtLocation" Text='<%# Eval("actual_location") %>' Visible="true" runat="server" ReadOnly="true" CssClass="textbox" />                        
            </li>         
            </ul>
            </ItemTemplate>
        </asp:FormView>

        <hr />

        <div class="chart">

            <asp:Menu 
                 ID="Menu1" 
                 runat="server" 
                 Orientation="Horizontal" 
                 StaticMenuItemStyle-CssClass="tab" 
                 StaticSelectedStyle-CssClass="selectedTab" 
                 CssClass="tabs" 
                 OnMenuItemClick="Menu1_MenuItemClick">
                <Items>
                    <asp:MenuItem Selected="True" Text="This Year's Totals" Value="0" />                   
                    <asp:MenuItem Text="Comparisons" Value="1" />
                    <asp:MenuItem Text="Statics" Value="2" />
                    <asp:MenuItem Text="Total Calendars" Value="3" />
                </Items>
                    <StaticMenuItemStyle CssClass="tab"></StaticMenuItemStyle>
                <StaticMenuStyle BackColor="#EEEEEE" 
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                <StaticSelectedStyle CssClass="selectedTab" BackColor="White" BorderColor="Silver" 
                    BorderStyle="Solid" BorderWidth="1px"></StaticSelectedStyle>

            </asp:Menu>

        <div class="tabContents">
            <asp:MultiView 
                 ID="MultiView1" 
                 runat="server" 
                 ActiveViewIndex="0">
                  <asp:View ID="View1" runat="server">
                    <p>Total number of candle uses for 2018.</p>
                    <asp:Chart ID="chtCandleTotals" runat="server" DataSourceID="srcGetChartData" 
                            BackSecondaryColor="249, 249, 249">
                        <series>
                            <asp:Series Name="CandleUseSeries" ChartType="Pie" XValueMember="candleuse" 
                                YValueMembers="Total" IsValueShownAsLabel="true" 
                                Legend="Legend1">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="CandleUseChartArea">
                                <Area3DStyle Enable3D="True" Inclination="20" WallWidth="10" />
                            </asp:ChartArea>
                        </chartareas>
                        <Legends>
                            <asp:Legend Alignment="Center" DockedToChartArea="CandleUseChartArea" 
                                Docking="Top" Font="Microsoft Sans Serif, 9pt" IsDockedInsideChartArea="False" 
                                IsTextAutoFit="False" MaximumAutoSize="100" Name="Legend1" 
                                TitleFont="Microsoft Sans Serif, 9pt, style=Bold">
                            </asp:Legend>
                        </Legends>
                    </asp:Chart>
                  </asp:View>
                  <asp:View ID="View2" runat="server">
                      <asp:Chart ID="chtComparison" runat="server" DataSourceID="odsGetComparison">
                          <Series>
                              <asp:Series Name="ComparisonSeries" Legend="Legend1" XValueMember="candleuse" 
                                  YValueMembers="Total" ChartType="Range"  IsValueShownAsLabel="true" 
                                  YValuesPerPoint="2">
                              </asp:Series>
                          </Series>
                          <ChartAreas>
                              <asp:ChartArea Name="ComparisonChartArea">
                              </asp:ChartArea>
                          </ChartAreas>
                          <Legends>
                              <asp:Legend Alignment="Center" DockedToChartArea="ComparisonChartArea" 
                                  Docking="Top" IsDockedInsideChartArea="False" Name="Legend1">
                              </asp:Legend>
                          </Legends>
                      </asp:Chart>
                  </asp:View>
                  <asp:View ID="View3" runat="server">
                      <asp:Chart ID="chtStatics" runat="server" DataSourceID="odsGetStatics" 
                          Palette="EarthTones">
                          <Series>
                              <asp:Series Name="StaticsSeries" Legend="Legend1" 
                                  YValuesPerPoint="4" XValueMember="entryRecipient" YValueMembers="Total" IsValueShownAsLabel="true">
                              </asp:Series>
                          </Series>
                          <ChartAreas>
                              <asp:ChartArea Name="StaticsChartArea">
                              </asp:ChartArea>
                          </ChartAreas>
                          <Legends>
                              <asp:Legend Alignment="Center" DockedToChartArea="StaticsChartArea" 
                                  Docking="Top" IsDockedInsideChartArea="False" Name="Legend1">
                              </asp:Legend>
                          </Legends>
                      </asp:Chart>
                  </asp:View>
                  <asp:View ID="View4" runat="server">
                  <p>Order this many calendars for 2018.</p>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="odsCalendarCount" 
                             Palette="SeaGreen">
                          <Series>
                              <asp:Series Name="CalendarSeries" Legend="Legend1" 
                                  YValuesPerPoint="4" XValueMember="Total" YValueMembers="Total" 
                                  IsValueShownAsLabel="true" ChartType="StackedColumn">
                              </asp:Series>
                          </Series>
                          <ChartAreas>
                              <asp:ChartArea Name="CalendarChartArea">
                              </asp:ChartArea>
                          </ChartAreas>
                          <Legends>
                              <asp:Legend Alignment="Center" DockedToChartArea="CalendarChartArea" 
                                  Docking="Top" IsDockedInsideChartArea="False" Name="Legend1" 
                                  BorderDashStyle="Dash">
                              </asp:Legend>
                          </Legends>
                      </asp:Chart>
                  </asp:View>
            </asp:MultiView>
        </div>



        
        </div>

     </div><!-- End sidebar  -->

     <div id="footer">
       
     </div>

    </div><!-- End wrapper -->

 </ContentTemplate>
        </asp:UpdatePanel>
 
 

    <asp:ObjectDataSource 
            ID="srcGetRecord"
            runat="server"
            SelectMethod="CandleSafetyAppMailingAddress" 
            TypeName="_GetRecord">         
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCustomerNum" Name="custnum" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

        <asp:ObjectDataSource 
            ID="srcGetDesignate"
            runat="server"
            SelectMethod="CandleSafetyDesignate" 
            TypeName="_GetRecord" 
            DeleteMethod="DeleteDesignatedPerson">         
            <DeleteParameters>
                <asp:ControlParameter ControlID="grvDesignate" Name="designateid" PropertyName="SelectedValue" />
            </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCustomerNum" Name="custnum" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

      <asp:ObjectDataSource 
         ID="srcAddPerson" 
         runat="server"
         InsertMethod="AddDesignatedPerson"
         TypeName="_AddRecord">
      <InsertParameters>
        <asp:SessionParameter Name="custnum" SessionField="custnum" />
        <asp:SessionParameter Name="candleuse" SessionField="candleuse" />
        <asp:SessionParameter Name="fullname" SessionField="fullname" />
        <asp:SessionParameter Name="entry" SessionField="entry" />
    </InsertParameters>
    </asp:ObjectDataSource>


    <asp:ObjectDataSource 
         ID="odsAddRecord" 
         runat="server"
         InsertMethod="AddCandleSafetyRecord"
         TypeName="_AddRecord">
      <InsertParameters>
        <asp:SessionParameter Name="custnum" SessionField="custnum" />
        <asp:SessionParameter Name="church" SessionField="church" />
        <asp:SessionParameter Name="location" SessionField="location" />
        <asp:SessionParameter Name="mailcontact" SessionField="mailingcontact" />
        <asp:SessionParameter Name="mailaddress" SessionField="mailaddress" />
        <asp:SessionParameter Name="mailcity" SessionField="mailcity" />
        <asp:SessionParameter Name="mailstate" SessionField="mailstate" />
        <asp:SessionParameter Name="mailzip" SessionField="mailzip" />
        <asp:SessionParameter Name="candleuse" SessionField="candleuse" />
        <asp:SessionParameter Name="fullname" SessionField="fullname" />
    </InsertParameters>
    </asp:ObjectDataSource>


    <asp:SqlDataSource 
        ID="sdsGetChartData" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:SMCI %>" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="CountCandleUse" 
        SelectCommandType="StoredProcedure">
     </asp:SqlDataSource>

     <asp:ObjectDataSource 
        ID="srcGetChartData"
        runat="server"
        SelectMethod="CountCandleUse"             
        TypeName="_GetRecord">         
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
        ID="odsGetComparison" 
        runat="server"
        SelectMethod="ComparisonNumbers"
        TypeName="_GetRecord">
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
        ID="odsGetStatics" 
        runat="server"
        SelectMethod="CandleStatics"
        TypeName="_GetRecord">
    </asp:ObjectDataSource>

    <asp:ObjectDataSource 
        ID="odsCalendarCount" 
        runat="server"
        SelectMethod="CalendarCount"
        TypeName="_GetRecord">
    </asp:ObjectDataSource>

    </form>
</body>
</html>

