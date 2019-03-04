<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewBusiness.aspx.vb" Inherits="EmployeePortal_MyNewBusiness_NewBusiness" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../CSS/Site.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <script src="../../js/js-dialog-widget.js" type="text/javascript"></script>
    <link href="../../CSS/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        $(document).ready(function () {
            $('#dialog').dialog({
                autoOpen: true,
                modal: true,
                draggable: false
                
            });

            $('#btnSearch').button().click(function () {
                $('#dialog').dialog("open");
            })

        });
 
    </script>

</head>
<body>

    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">  
  <ContentTemplate>

            <%--<div id="divDisplay">--%>
        <div id="dialog" class="ui-dialog">
            <asp:GridView 
                 ID="grdRecords" 
                 DataSourceID="" 
                 runat="server" 
                 AutoGenerateColumns="False" 
                 EmptyDataText="No match found." 
                 HorizontalAlign="Left" Width="650px">
                <Columns>
                    <asp:BoundField DataField="QuoteDate" HeaderText="Date Quoted" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Church" HeaderText="Customer Name" >
                    <HeaderStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Location" HeaderText="City" >
                    <HeaderStyle HorizontalAlign="Left" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="State" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            </div>
        <%--</div>--%>
    <div class="page">
        <div class="main">
        <div>
        <fieldset>
        <legend>General Information</legend>
        <table class="main-table">
                <tr>
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />
                        <br />
                        <asp:TextBox ID="txtQuoteDate" runat="server" Width="85px" Text='<%# Eval("QuoteDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchName" runat="server" Width="250px" Text='<%# Eval("Church") %>' />
                    </td>
                    <td>
                      </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <asp:TextBox ID="txtAgent" runat="server" Width="50px" Text='<%# Eval("Agent") %>' />
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDate" runat="server" Width="85px" Text='<%# Eval("CurrDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocation" runat="server" Width="175px" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server" Width="50px" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                        <asp:TextBox ID="txtLossControl" runat="server" Width="50px" Text='<%# Eval("LossControl") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremium" runat="server" Text='<%# Eval("CurrPrem") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrier" runat="server" Width="250px" Text='<%# Eval("Carrier") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNo" runat="server" Width="100px" Text='<%# Eval("RequestNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                        <asp:TextBox ID="txtUnderwriter" runat="server" Width="50px" Text='<%# Eval("UW") %>' />
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspection" runat="server" Text='<%# Eval("InspAppt") %>' />
                    </td>
                    <td>
                       </td>
                    <td>
                       </td>
                    <td>
                       </td>
                </tr>
            </table>
            </fieldset>

            <fieldset>
             <legend>Quoted</legend>
               <table class="main-table">
        <tr>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>'   
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' 
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' 
                    GroupName="quoted" />
              </td>
            <td>
                <asp:RadioButton ID="RadioButton4" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>'
                GroupName="quoted" />
               </td>
            <td>
               <asp:Label ID="lblDeclinedDate" runat="server" Text="Declined Date" />
                <br />
                <asp:TextBox ID="txtDeclinedDate" runat="server" Text='<%# Eval("DeclineDate") %>' />
               </td>
            <td>                
               </td>
        </tr>
        </table>
        <br />
        <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkNotWritten" runat="server" Text="Not Written" Checked='<%# Eval("NotWritten") %>' />
            </td>
            <td>
                <asp:Label ID="lblReason" runat="server" Text="Reason" />                
            </td>
            <td>
                <asp:TextBox ID="txtReason" runat="server" Width="350px" Text='<%# Eval("Reason") %>' />
            </td>
        </tr>
    </table>
            </fieldset>             
            <fieldset>
            <legend>Written</legend>

                <table class="main-table">
                    <tr>
                        <td>
                            <asp:Label ID="lblEffDate" runat="server" Text="Effective Date" />
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("DateWritten") %>' />
                          </td>
                        <td>
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="written" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                        <asp:RadioButton ID="RadioButton6" runat="server" Text="Umbrella" GroupName="written" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>

                <asp:RadioButton ID="RadioButton7" runat="server" Text="Bus. Auto" GroupName="written" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                <asp:RadioButton ID="RadioButton8" runat="server" GroupName="written" Text="W. Comp" Checked='<%# Eval("WcWritten") %>'  />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("CustNo") %>' />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("SmpPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("UmbPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("BaPrem") %>' />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("WcPrem") %>' />
                          </td>
                    </tr>
                </table>
                <table class="main-table">
                  <tr>
                   <td>
                     <asp:CheckBox ID="CheckBox1" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Seacoast Exposure" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("SeacoastExp") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label2" runat="server" Text="IRPM Factor" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("IrpmFactor") %>' />
                   </td>
                   <td></td>
                  </tr>
                </table>
        </fieldset>
                    <button id="show" onclick="btnSearch_Click" runat="server">Show Dialog</button>
                   
                    <asp:Button 
                   ID="btnSearch" 
                   OnClick="btnSearch_Click"                                     
                   runat="server" 
                   Text="Search" />
       
        </div>
            <asp:DataList 
                 ID="DataList1" 
                 runat="server" 
                 DataSourceID="">
        <EditItemTemplate>
                <fieldset>
        <legend>General Information</legend>
            <table class="main-table">
                <tr>
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />
                        <br />
                        <asp:TextBox ID="txtQuoteDate" runat="server" Width="85px" Text='<%# Eval("QuoteDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchName" runat="server" Width="250px" Text='<%# Eval("Church") %>' />
                    </td>
                    <td>
                      </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <asp:TextBox ID="txtAgent" runat="server" Width="50px" Text='<%# Eval("Agent") %>' />
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDate" runat="server" Width="85px" Text='<%# Eval("CurrDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocation" runat="server" Width="175px" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server" Width="50px" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                        <asp:TextBox ID="txtLossControl" runat="server" Width="50px" Text='<%# Eval("LossControl") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremium" runat="server" Text='<%# Eval("CurrPrem") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrier" runat="server" Width="250px" Text='<%# Eval("Carrier") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNo" runat="server" Width="100px" Text='<%# Eval("RequestNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                        <asp:TextBox ID="txtUnderwriter" runat="server" Width="50px" Text='<%# Eval("UW") %>' />
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspection" runat="server" Text='<%# Eval("InspAppt") %>' />
                    </td>
                    <td>
                       </td>
                    <td>
                       </td>
                    <td>
                       </td>
                </tr>
            </table>
            </fieldset>
            <fieldset>
             <legend>Quoted</legend>
               <table class="main-table">
        <tr>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>'   
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' 
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' 
                    GroupName="quoted" />
              </td>
            <td>
                <asp:RadioButton ID="RadioButton4" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>'
                GroupName="quoted" />
               </td>
            <td>
               <asp:Label ID="lblDeclinedDate" runat="server" Text="Declined Date" />
                <br />
                <asp:TextBox ID="txtDeclinedDate" runat="server" Text='<%# Eval("DeclineDate") %>' />
               </td>
            <td>                
               </td>
        </tr>
        </table>
        <br />
        <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkNotWritten" runat="server" Text="Not Written" Checked='<%# Eval("NotWritten") %>' />
            </td>
            <td>
                <asp:Label ID="lblReason" runat="server" Text="Reason" />                
            </td>
            <td>
                <asp:TextBox ID="txtReason" runat="server" Width="350px" Text='<%# Eval("Reason") %>' />
            </td>
        </tr>
    </table>
            </fieldset>             
            <fieldset>
            <legend>Written</legend>

                <table class="main-table">
                    <tr>
                        <td>
                            <asp:Label ID="lblEffDate" runat="server" Text="Effective Date" />
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("DateWritten") %>' />
                          </td>
                        <td>
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="written" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                        <asp:RadioButton ID="RadioButton6" runat="server" Text="Umbrella" GroupName="written" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>

                <asp:RadioButton ID="RadioButton7" runat="server" Text="Bus. Auto" GroupName="written" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                <asp:RadioButton ID="RadioButton8" runat="server" GroupName="written" Text="W. Comp" Checked='<%# Eval("WcWritten") %>'  />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("CustNo") %>' />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("SmpPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("UmbPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("BaPrem") %>' />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("WcPrem") %>' />
                          </td>
                    </tr>
                </table>
                <table class="main-table">
                  <tr>
                   <td>
                     <asp:CheckBox ID="CheckBox1" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Seacoast Exposure" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("SeacoastExp") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label2" runat="server" Text="IRPM Factor" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("IrpmFactor") %>' />
                   </td>
                   <td></td>
                  </tr>
                </table>
            </fieldset>  
        </EditItemTemplate>
          <ItemTemplate>
        <fieldset>
        <legend>General Information</legend>
            <table class="main-table">
                <tr>
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />
                        <br />
                        <asp:TextBox ID="txtQuoteDate" runat="server" Width="85px" Text='<%# Eval("QuoteDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchName" runat="server" Width="250px" Text='<%# Eval("Church") %>' />
                    </td>
                    <td>
                      </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <asp:TextBox ID="txtAgent" runat="server" Width="50px" Text='<%# Eval("Agent") %>' />
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDate" runat="server" Width="85px" Text='<%# Eval("CurrDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocation" runat="server" Width="175px" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server" Width="50px" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                        <asp:TextBox ID="txtLossControl" runat="server" Width="50px" Text='<%# Eval("LossControl") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremium" runat="server" Text='<%# Eval("CurrPrem") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrier" runat="server" Width="250px" Text='<%# Eval("Carrier") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNo" runat="server" Width="100px" Text='<%# Eval("RequestNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                        <asp:TextBox ID="txtUnderwriter" runat="server" Width="50px" Text='<%# Eval("UW") %>' />
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspection" runat="server" Text='<%# Eval("InspAppt") %>' />
                    </td>
                    <td>
                       </td>
                    <td>
                       </td>
                    <td>
                       </td>
                </tr>
            </table>
            </fieldset>
            <fieldset>
             <legend>Quoted</legend>
               <table class="main-table">
        <tr>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>'   
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' 
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' 
                    GroupName="quoted" />
              </td>
            <td>
                <asp:RadioButton ID="RadioButton4" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>'
                GroupName="quoted" />
               </td>
            <td>
               <asp:Label ID="lblDeclinedDate" runat="server" Text="Declined Date" />
                <br />
                <asp:TextBox ID="txtDeclinedDate" runat="server" Text='<%# Eval("DeclineDate") %>' />
               </td>
            <td>                
               </td>
        </tr>
        </table>
        <br />
        <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkNotWritten" runat="server" Text="Not Written" Checked='<%# Eval("NotWritten") %>' />
            </td>
            <td>
                <asp:Label ID="lblReason" runat="server" Text="Reason" />                
            </td>
            <td>
                <asp:TextBox ID="txtReason" runat="server" Width="350px" Text='<%# Eval("Reason") %>' />
            </td>
        </tr>
    </table>
            </fieldset>             
            <fieldset>
            <legend>Written</legend>

                <table class="main-table">
                    <tr>
                        <td>
                            <asp:Label ID="lblEffDate" runat="server" Text="Effective Date" />
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("DateWritten") %>' />
                          </td>
                        <td>
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="written" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                        <asp:RadioButton ID="RadioButton6" runat="server" Text="Umbrella" GroupName="written" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>

                <asp:RadioButton ID="RadioButton7" runat="server" Text="Bus. Auto" GroupName="written" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                <asp:RadioButton ID="RadioButton8" runat="server" GroupName="written" Text="W. Comp" Checked='<%# Eval("WcWritten") %>'  />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("CustNo") %>' />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("SmpPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("UmbPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("BaPrem") %>' />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("WcPrem") %>' />
                          </td>
                    </tr>
                </table>
                <table class="main-table">
                  <tr>
                   <td>
                     <asp:CheckBox ID="CheckBox1" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Seacoast Exposure" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("SeacoastExp") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label2" runat="server" Text="IRPM Factor" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("IrpmFactor") %>' />
                   </td>
                   <td></td>
                  </tr>
                </table>
            </fieldset>      
            <br />  
               </ItemTemplate>
        <SelectedItemTemplate>
                <fieldset>
        <legend>General Information</legend>
            <table class="main-table">
                <tr>
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />
                        <br />
                        <asp:TextBox ID="txtQuoteDate" runat="server" Width="85px" Text='<%# Eval("QuoteDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchName" runat="server" Width="250px" Text='<%# Eval("Church") %>' />
                    </td>
                    <td>
                      </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <asp:TextBox ID="txtAgent" runat="server" Width="50px" Text='<%# Eval("Agent") %>' />
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDate" runat="server" Width="85px" Text='<%# Eval("CurrDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocation" runat="server" Width="175px" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server" Width="50px" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                        <asp:TextBox ID="txtLossControl" runat="server" Width="50px" Text='<%# Eval("LossControl") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremium" runat="server" Text='<%# Eval("CurrPrem") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrier" runat="server" Width="250px" Text='<%# Eval("Carrier") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNo" runat="server" Width="100px" Text='<%# Eval("RequestNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                        <asp:TextBox ID="txtUnderwriter" runat="server" Width="50px" Text='<%# Eval("UW") %>' />
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspection" runat="server" Text='<%# Eval("InspAppt") %>' />
                    </td>
                    <td>
                       </td>
                    <td>
                       </td>
                    <td>
                       </td>
                </tr>
            </table>
            </fieldset>
            <fieldset>
             <legend>Quoted</legend>
               <table class="main-table">
        <tr>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>'   
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' 
                    GroupName="quoted" />
               </td>
            <td>
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' 
                    GroupName="quoted" />
              </td>
            <td>
                <asp:RadioButton ID="RadioButton4" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>'
                GroupName="quoted" />
               </td>
            <td>
               <asp:Label ID="lblDeclinedDate" runat="server" Text="Declined Date" />
                <br />
                <asp:TextBox ID="txtDeclinedDate" runat="server" Text='<%# Eval("DeclineDate") %>' />
               </td>
            <td>                
               </td>
        </tr>
        </table>
        <br />
        <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkNotWritten" runat="server" Text="Not Written" Checked='<%# Eval("NotWritten") %>' />
            </td>
            <td>
                <asp:Label ID="lblReason" runat="server" Text="Reason" />                
            </td>
            <td>
                <asp:TextBox ID="txtReason" runat="server" Width="350px" Text='<%# Eval("Reason") %>' />
            </td>
        </tr>
    </table>
            </fieldset>             
            <fieldset>
            <legend>Written</legend>

                <table class="main-table">
                    <tr>
                        <td>
                            <asp:Label ID="lblEffDate" runat="server" Text="Effective Date" />
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("DateWritten") %>' />
                          </td>
                        <td>
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="written" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                        <asp:RadioButton ID="RadioButton6" runat="server" Text="Umbrella" GroupName="written" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>

                <asp:RadioButton ID="RadioButton7" runat="server" Text="Bus. Auto" GroupName="written" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                <asp:RadioButton ID="RadioButton8" runat="server" GroupName="written" Text="W. Comp" Checked='<%# Eval("WcWritten") %>'  />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("CustNo") %>' />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("SmpPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("UmbPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("BaPrem") %>' />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("WcPrem") %>' />
                          </td>
                    </tr>
                </table>
                <table class="main-table">
                  <tr>
                   <td>
                     <asp:CheckBox ID="CheckBox1" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Seacoast Exposure" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("SeacoastExp") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label2" runat="server" Text="IRPM Factor" />
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("IrpmFactor") %>' />
                   </td>
                   <td></td>
                  </tr>
                </table>
            </fieldset>  
        </SelectedItemTemplate>
  </asp:DataList>

<%--       <ul>
            <li><button id="show1" class="online-quotes" /></li>
          </ul>  --%>


            <asp:ObjectDataSource 
                 ID="srcNewBusiness" 
                 TypeName="_GetRecord"
                 runat="server" 
                 SelectMethod="GetNewBusiness">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAgent" Name="Agent" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:ObjectDataSource>

                        <asp:SqlDataSource ID="srcSearch" runat="server" 
                ConnectionString="Data Source=SQL01;Initial Catalog=Misc;Integrated Security=True" 
                ProviderName="System.Data.SqlClient"                
                SelectCommand="SELECT quote_date, church, location, state FROM newbus WHERE (agent LIKE '%' + @agent + '%') OR (location LIKE '%' + @location + '%') OR (church LIKE '%' + @church + '%') OR (carrier LIKE '%' + @carrier + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAgent" Name="agent" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtLocation" Name="location" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtChurchName" Name="church" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtCurrentCarrier" Name="carrier" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


      </div>
   </div>

                </ContentTemplate>
   </asp:UpdatePanel>
    </form>
</body>
</html>
