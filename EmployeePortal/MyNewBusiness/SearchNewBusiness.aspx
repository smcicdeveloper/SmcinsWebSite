<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="SearchNewBusiness.aspx.vb" Inherits="EmployeePortal_MyNewBusiness_SearchNewBusiness" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/jscript">

        function pageLoad() {
            $(".mydate").datepicker();
        }
    
    </script>

    <style type="text/css">
        #ActionDate1
        {
            width: 80px;
        }
    </style>

    <link href="../../CSS/Site.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
    <script src="../../js/js-dialog-widget.js" type="text/javascript"></script>
    <link href="../../CSS/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
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
              padding:10px;  
              width:745px;
              height:605px;
              font-size:10px;  
              }
              
          .modalPopup fieldset {
              width:715px;
              } 
              
           .buttonBar ul li {list-style:none;float:left;margin-right:5px;}      
            
    </style>    
        
        
        <script type="text/javascript">
            function dialog() {
                $("#dialog").dialog({ autoOpen: true, minWidth: 975, hide: true });
            };
        </script>

</head>
<body>
    <form id="form1" runat="server" enableviewstate="True">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release" CombineScripts="false" EnablePartialRendering="False">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div class="page">
        <div class="main">
        <fieldset>
        <legend>Search Information</legend>
        <table class="main-table">
                <tr>
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />
                        <br />
                        <asp:TextBox ID="txtQuoteDate" runat="server" Width="85px" Text='<%# Eval("QuoteDate") %>' MaxLength="10" />
                        <%--<asp:MaskedEditExtender ID="me1" TargetControlID="txtQuoteDate" Mask="99/99/9999" MaskType="Date" runat="server" />--%>
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchName" runat="server" Width="250px" 
                            Text='<%# Eval("Church") %>' MaxLength="50" />
                    </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <%--<asp:TextBox ID="txtAgent" runat="server" Width="50px" Text='<%# Eval("Agent") %>' MaxLength="7" />--%>
                       <asp:DropDownList 
                            ID="ddlAgency" 
                            runat="server" 
                            AppendDataBoundItems="True" 
                            DataSourceID="srcAgency" 
                            DataTextField="agency_name" 
                            DataValueField="agency_number" 
                            CssClass="add-agent" Width="280px" >
                           <asp:ListItem Text="" Value="" />
                           </asp:DropDownList>
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDate" runat="server" Width="85px" Text='<%# Eval("CurrDate") %>' MaxLength="10" />
                        <%--<asp:MaskedEditExtender ID="me2" TargetControlID="txtEffDate" Mask="99/99/9999" MaskType="Date" runat="server" />--%>
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocation" runat="server" Width="175px" Text='<%# Eval("Location") %>' MaxLength="25" />
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                        <%--<asp:TextBox ID="txtLossControl" runat="server" Width="50px" Text='<%# Eval("LossControl") %>' />--%>
                       <asp:DropDownList 
                            ID="ddlLossControlSearch" 
                            runat="server" 
                            DataSourceID="srcGetEmployee"                    
                            AppendDataBoundItems="True" 
                            DataTextField="FullName" 
                            DataValueField="file_location" >                             
                        <asp:ListItem Text="" Value=""></asp:ListItem>  
                        <asp:ListItem Text="JIM BLOOM" Value="3520"></asp:ListItem>  
                        <asp:ListItem Text="TERRY DAVIS" Value="9520"></asp:ListItem>
                        <asp:ListItem Text="JIM ELLIS" Value="3060"></asp:ListItem>  
                        <asp:ListItem Text="STEPHEN FLOYD" Value="6595"></asp:ListItem> 
                        <asp:ListItem Text="JIM FRANCIS" Value="7560"></asp:ListItem> 
                        <asp:ListItem Text="MATT HOLLIFIELD" Value="8520"></asp:ListItem> 
                        <asp:ListItem Text="DAVID NUNN" Value="6596"></asp:ListItem>                                                     
                        <asp:ListItem Text="BILL SMITH" Value="6580"></asp:ListItem>                                                
                      </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                       <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                     <asp:TextBox ID="txtCurrentCarrier" runat="server" Width="230px" 
                            Text='<%# Eval("Carrier") %>' MaxLength="15" />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNo" runat="server" Width="100px" Text='<%# Eval("RequestNo") %>' MaxLength="5" />
                    </td>
                    <td>
                        <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                       <%-- <asp:TextBox ID="txtUnderwriter" runat="server" Width="50px" Text='<%# Eval("UW") %>' />--%>
                     <asp:DropDownList 
                          ID="ddlUnderwriterSearch" 
                          runat="server" 
                          DataSourceID="srcEmployeeData" 
                          AppendDataBoundItems="True" 
                          DataTextField="FullName" 
                          DataValueField="file_location">  
                        <asp:ListItem Text="" Value=""></asp:ListItem>                                            
                        </asp:DropDownList>
                     </td>
                </tr>

            </table>
            </fieldset>

            <div id="divDisplay">
                <asp:GridView 
                 ID="grdRecords" 
                 runat="server" 
                 AutoGenerateColumns="False" 
                 EmptyDataText="No match found." 
                 HorizontalAlign="Left" 
                 Width="750px"  
                 DataKeyNames="NewbusId" 
                 OnSelectedIndexChanged="grdRecords_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:TemplateField ShowHeader="False">
                    </asp:TemplateField>
                    <asp:BoundField DataField="QuoteDate" HeaderText="Date Quoted" NullDisplayText="Null" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Church" HeaderText="Customer Name" NullDisplayText="Null" >
                    <HeaderStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Location" HeaderText="City" NullDisplayText="Null" >
                    <HeaderStyle HorizontalAlign="Left" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="State" NullDisplayText="Null" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FullName" HeaderText="Underwriter" 
                        NullDisplayText="Null" >
                    <HeaderStyle HorizontalAlign="Left" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NewbusId" HeaderText="Id" ShowHeader="False" 
                        Visible="False" ReadOnly="True" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            </div>

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

            <fieldset>
               <ul>
                 <li>
                 <asp:Button 
                   ID="btnSearch" 
                   OnClick="btnSearch_Click"                                     
                   runat="server" 
                   CausesValidation="false" 
                   Text="Search" />
                  </li>
                  <li>
                      <asp:Button 
                         ID="btnInsert" 
                         runat="server" 
                         CausesValidation="false"
                         Text="Add New" />
                  </li>
                  <li>
                <asp:Button 
                    ID="btnClear" 
                    runat="server"
                    CausesValidation="false"
                    OnClick="btnClear_Click"                    
                    Text="Clear" />
                  </li>
                </ul>
            </fieldset>            
            <br />
             
               <asp:ObjectDataSource 
                 ID="srcNewBusiness" 
                 TypeName="_GetRecord"
                 runat="server" 
                 SelectMethod="SelectNewBusiness">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtQuoteDate" Name="QuoteDate" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="txtEffDate" Name="CurrentDate" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="ddlAgency" Name="Agent" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="txtChurchName" Name="ChurchName" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="txtLocation" Name="Location" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="txtCurrentCarrier" Name="MyCarrier" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="ddlLossControlSearch" Name="LossControl" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="ddlUnderwriterSearch" Name="Underwriter" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:ControlParameter ControlID="txtReqNo" Name="RequestNo" PropertyName="Text" Type="String" ConvertEmptyStringToNull="true" />
                </SelectParameters>
            </asp:ObjectDataSource>
          </div>
 </div>


<%--          <div id="dialog" class="ui-dialog">
          </div>--%>
   
<%--     <div id="dialog" class="ui-dialog">--%>
     <%--<div id="divDisplay">--%>
    <asp:Panel 
         ID="Panel1" 
         runat="server" 
         CssClass="modalPopup" 
         style="Display:none;">
       
    <div class="cancel-app"><asp:Button ID="OK" runat="server" Text="X" CausesValidation="false" /></div>
    <br />
        <asp:FormView 
             ID="frmSearch" 
             runat="server" 
             DataSourceID="srcGetRecord" 
             DataKeyNames="NewbusId" 
             DefaultMode="Edit">
             <ItemTemplate>
              <fieldset>
                <legend>Modify Information</legend>
            <table class="main-table">
                <tr>
                   
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />                       
                        <br />                    
                        <asp:TextBox ID="txtQuoteDate" runat="server" Width="85px" Font-Size="10px" Text='<%# Eval("QuoteDate") %>' ReadOnly="True" />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchName" runat="server" Width="300px" Font-Size="10px" Text='<%# Eval("Church") %>' />
                    </td>
                    <td>
                      </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <asp:TextBox ID="txtAgent" runat="server" Width="50px" Font-Size="10px" Text='<%# Eval("Agent") %>' />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDate" runat="server" Width="85px" Font-Size="10px" Text='<%# Eval("CurrDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocation" runat="server" Width="175px" Font-Size="10px" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtState" runat="server" Width="50px" Font-Size="10px" Text='<%# Eval("State") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                        <asp:TextBox ID="txtLossControl" runat="server" Width="50px" Font-Size="10px" Text='<%# Eval("FullName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremium" runat="server" Font-Size="10px" Text='<%# Eval("CurrPrem") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrier" runat="server" Font-Size="10px" Width="250px" Text='<%# Eval("Carrier") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNo" runat="server" Width="100px" Font-Size="10px" Text='<%# Eval("RequestNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                        <asp:TextBox ID="txtUnderwriter" runat="server" Width="50px" Font-Size="10px" Text='<%# Eval("UW") %>' />
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspection" runat="server" Font-Size="10px" Text='<%# Eval("InspAppt") %>' />
                    </td>
                    
                </tr>
            </table>
            <table class="main-table">
            <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="IRPM Factor" />
            <br />
                <asp:TextBox ID="txtIrpmFactor" runat="server" Font-Size="10px" Text='<%# Eval("IrpmFactor") %>' />
            </td>
            </tr>
            </table>

            </fieldset>
            <fieldset>
             <legend>Quoted</legend>
               <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkSmpQuote1" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>' />
               </td>
            <td>
                <asp:CheckBox ID="chkUmbQuote1" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' />
               </td>
            <td>
                <asp:CheckBox ID="chkBaQuote1" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' />
              </td>
            <td>
                <asp:CheckBox ID="chkWcQuote1" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>' />
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
                <asp:TextBox ID="txtReason" runat="server" Width="350px" Font-Size="10px" Text='<%# Eval("Reason") %>' />
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
                            <asp:TextBox ID="txtDateWritten" runat="server" Font-Size="10px" Text='<%# Eval("DateWritten") %>' />
                          </td>
                        <td>
                            <asp:CheckBox ID="chkSmpWritten1" runat="server" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                            <asp:CheckBox ID="chkUmbWritten1" runat="server" Text="Umbrella" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>
                            <asp:CheckBox ID="chkBaWritten1" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                            <asp:CheckBox ID="chkWcWritten1" runat="server" Text="W. Comp" Checked='<%# Eval("WcWritten") %>' />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="txtCustNo" runat="server" Font-Size="10px" Text='<%# Eval("CustNo") %>' />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="txtSmpPrem" runat="server" Font-Size="10px" Text='<%# Eval("SmpPrem", "{0:c2}") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="txtUmbPrem" runat="server" Font-Size="10px" Text='<%# Eval("UmbPrem") %>' />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="txtBaPrem" runat="server" Font-Size="10px" Text='<%# Eval("BaPrem") %>' />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="txtWcPrem" runat="server" Font-Size="10px" Text='<%# Eval("WcPrem") %>' />
                          </td>
                    </tr>
                </table>
                <table class="main-table">
                  <tr>
                   <td>
                     <asp:CheckBox ID="chkSeacoast" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Seacoast Exposure" />
                   </td>
                   <td>
                       <asp:TextBox ID="txtSeacoastExp" runat="server" Font-Size="10px" Text='<%# Eval("SeacoastExp") %>' />
                   </td>
                   <td></td>
                  </tr>
                </table>
            </fieldset>
                 <asp:LinkButton 
                      ID="lnkEdit" 
                      runat="server" 
                      Text="Edit Record" 
                      CausesValidation="false" 
                      CommandName="Edit" />
             </ItemTemplate>
                <EditItemTemplate>
                  <fieldset>
                <legend>Modify Information</legend>
            <table class="main-table">
                <tr>
                   
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />                       
                        <br />                    
                        <asp:TextBox ID="txtQuoteDateEdit" runat="server" Width="65px" Font-Size="10px" Text='<%# Eval("QuoteDate") %>' MaxLength="10" ReadOnly="True" />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchNameEdit" runat="server" Font-Size="10px" Width="215px" Text='<%# Eval("Church") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocationEdit" runat="server" Font-Size="10px" Width="120px" Text='<%# Eval("Location") %>' />
                    </td>
                    <td>
                      <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddlStateEdit" runat="server" Font-Size="10px" AppendDataBoundItems="True" SelectedValue='<%# Eval("State") %>'>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="GA" Value="GA"></asp:ListItem> 
                        <asp:ListItem Text="KY" Value="KY"></asp:ListItem> 
                        <asp:ListItem Text="NC" Value="NC"></asp:ListItem>  
                        <asp:ListItem Text="SC" Value="SC"></asp:ListItem>  
                        <asp:ListItem Text="TN" Value="TN"></asp:ListItem>                        
                        <asp:ListItem Text="VA" Value="VA"></asp:ListItem> 
                        </asp:DropDownList>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDateEdit" runat="server" Font-Size="10px" Width="65px" CssClass="mydate" Text='<%# Eval("CurrDate") %>' MaxLength="10" />
                    </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                       <asp:DropDownList 
                            ID="ddlAgencyEdit" 
                            runat="server" 
                            DataSourceID="srcAgency" 
                            Font-Size="10px" 
                            DataTextField="agency_name" 
                            DataValueField="agency_number" 
                            CssClass="add-agent" 
                            SelectedValue='<%# Bind("Agent") %>'>
                           <asp:ListItem Text="" Value="0009999" />
                        </asp:DropDownList>
                    </td>
                    <td>
                     <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />
                      <asp:DropDownList 
                           ID="ddlUnderwriterEdit" 
                           runat="server" 
                           DataSourceID="srcEmployeeData" 
                           Font-Size="10px" 
                           AppendDataBoundItems="True" 
                           DataTextField="FullName" 
                           DataValueField="file_location" 
                           SelectedValue='<%# Bind("UW") %>'>  
                      <asp:ListItem Text="" Value=""></asp:ListItem>                         
                     </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />
                    <asp:DropDownList 
                         ID="ddlLossControlEdit" 
                         runat="server" 
                         DataSourceID="srcGetEmployee" 
                         Font-Size="10px" 
                         AppendDataBoundItems="True" 
                         DataTextField="FullName" 
                         DataValueField="file_location" 
                         SelectedValue='<%# Bind("LossControl") %>' >  
                      <asp:ListItem Text="" Value=""></asp:ListItem>  
                        <asp:ListItem Text="JIM BLOOM" Value="3520"></asp:ListItem>  
                        <asp:ListItem Text="TERRY DAVIS" Value="9520"></asp:ListItem>
                        <asp:ListItem Text="JIM ELLIS" Value="3060"></asp:ListItem>  
                        <asp:ListItem Text="STEPHEN FLOYD" Value="6595"></asp:ListItem> 
                        <asp:ListItem Text="JIM FRANCIS" Value="7560"></asp:ListItem> 
                        <asp:ListItem Text="MATT HOLLIFIELD" Value="8520"></asp:ListItem> 
                        <asp:ListItem Text="DAVID NUNN" Value="6596"></asp:ListItem>                                                     
                        <asp:ListItem Text="BILL SMITH" Value="6580"></asp:ListItem>                
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremiumEdit" runat="server" Font-Size="10px" Text='<%# Eval("CurrPrem") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrierEdit" runat="server" Font-Size="10px" Width="215px" Text='<%# Eval("Carrier") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                        <br />
                        <asp:TextBox ID="txtReqNoEdit" runat="server" Font-Size="10px" Width="120px" Text='<%# Eval("RequestNo") %>' />
                    </td>
                    <td>
                      <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspectionEdit" runat="server" CssClass="mydate" Text='<%# Eval("InspAppt") %>' Font-Size="10px" Width="65px" MaxLength="10" />
                     </td>
                </tr>
                <tr>
                    <td>
                    <asp:Label ID="Label3" runat="server" Text="IRPM Factor" />
                        <br />
                    <asp:TextBox ID="txtIrpmFactorEdit" runat="server" Font-Size="10px" Text='<%# Eval("IrpmFactor") %>' />
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
                <asp:CheckBox ID="chkSmpQuoteEdit" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>' />
               </td>
            <td>
                <asp:CheckBox ID="chkUmbQuoteEdit" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' />
               </td>
            <td>
                <asp:CheckBox ID="chkBaQuoteEdit" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' />
              </td>
            <td>
                <asp:CheckBox ID="chkWcQuoteEdit" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>' />
               </td>
            <td>
               <asp:Label ID="lblDeclinedDate" runat="server" Text="Declined Date" />
                <br />
                <asp:TextBox ID="txtDeclinedDateEdit" runat="server" CssClass="mydate" Text='<%# Eval("DeclineDate") %>' Font-Size="10px" Width="65px" MaxLength="10" />
               </td>
            <td>                
               </td>
        </tr>
        </table>
        <br />
        <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkNotWrittenEdit" runat="server" Text="Not Written" Checked='<%# Eval("NotWritten") %>' />
            </td>
            <td>
                <asp:Label ID="lblReason" runat="server" Text="Reason" />                
            </td>
            <td>
                <asp:TextBox ID="txtReasonEdit" runat="server" Font-Size="10px" Width="350px" Text='<%# Eval("Reason") %>' />
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
                            <asp:TextBox ID="txtDateWrittenEdit" runat="server" CssClass="mydate" Text='<%# Eval("DateWritten") %>' Font-Size="10px" Width="65px" MaxLength="10" />
                          </td>
                        <td>
                            <asp:CheckBox ID="chkSmpWrittenEdit" runat="server" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                            <asp:CheckBox ID="chkUmbWrittenEdit" runat="server" Text="Umbrella" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>
                            <asp:CheckBox ID="chkBaWrittenEdit" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                            <asp:CheckBox ID="chkWcWrittenEdit" runat="server" Text="W. Comp" Checked='<%# Eval("WcWritten") %>' />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="txtCustNoEdit" runat="server" Text='<%# Eval("CustNo") %>' Font-Size="10px" />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="txtSmpPremEdit" runat="server" Text='<%# Eval("SmpPrem") %>' Font-Size="10px" />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="txtUmbPremEdit" runat="server" Text='<%# Eval("UmbPrem") %>' Font-Size="10px" />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="txtBaPremEdit" runat="server" Text='<%# Eval("BaPrem") %>' Font-Size="10px" />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="txtWcPremEdit" runat="server" Text='<%# Eval("WcPrem") %>' Font-Size="10px" />
                        </tr>
                  <tr>
                   <td>
                     <asp:CheckBox ID="chkSeacoastEdit" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Seacoast Exposure" />
                       <br />
                       <asp:TextBox ID="txtSeacoastExpEdit" runat="server" Text='<%# Eval("SeacoastExp") %>' Font-Size="10px" />
                   </td>
                   <td>                      
                   </td>
                   <td></td>
                   <td></td>
                  </tr>                    
                </table>

            </fieldset> 
            <fieldset class="buttonBar" style="height:20%;"> 
            <ul>
               <li>
                <asp:Button 
                    ID="btnSave" 
                    runat="server" 
                    CommandName="Update"                          
                    CausesValidation="false" 
                    Text="Save" />
              </li> 
                <li>
            <asp:Button 
                    ID="btnDelete" 
                    runat="server" 
                    CommandName="Delete"
                    OnClientClick="return confirm('Are you sure?');"
                    Text="Delete" />               
                </li>   
            </ul>   
               </fieldset>  
             </EditItemTemplate>
        </asp:FormView>     
      </asp:Panel>
      
        <asp:ModalPopupExtender 
             ID="mpe2" 
             runat="server" 
             CancelControlID="btnOk" 
             TargetControlID="btnInsert" 
             BackgroundCssClass="modalBackground" 
             Drag="True" 
             PopupControlID="Panel2" 
             PopupDragHandleControlID="Panel2">
        </asp:ModalPopupExtender>


        <asp:Panel 
             ID="Panel2" 
             CssClass="modalPopup" 
             runat="server" 
             style="display:none;">

            <div class="cancel-app"><asp:Button ID="btnOk" runat="server" Text="X" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnOk_Click"  /></div>
            <br />
            <asp:FormView 
                 ID="frmNew" 
                 runat="server" 
                 DataSourceID="srcAddRecord" 
                 DefaultMode="Insert">                
                 <InsertItemTemplate>
                  <fieldset>
                   <legend>General Information</legend>
                     <table class="main-table">
                <tr>
                    
                    <td>
                        <asp:Label ID="lblQuoteDate" runat="server" Text="Quote Date" />                       
                        <br />                    
                        <asp:TextBox ID="txtQuoteDateInsert" runat="server" CssClass="mydate" Font-Size="10px" Width="65px" Text='<%# Eval("QuoteDate") %>' MaxLength="10" />
                    </td>
                    <td>
                        <asp:Label ID="lblChurchName" runat="server" Text="Church Name" />
                        <br />
                        <asp:TextBox ID="txtChurchNameInsert" runat="server" Width="215px" Font-Size="10px" Text='<%# Eval("Church") %>' MaxLength="65" />                         
                    </td>
                    <td>
                      </td>
                    <td>
                       <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLocationInsert" runat="server" Width="120px" Font-Size="10px" Text='<%# Eval("Location") %>' MaxLength="50" />
                    </td>
                    <td>
                     <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <br />                       
                        <asp:DropDownList ID="ddlStateInsert" AppendDataBoundItems="true" runat="server" Font-Size="10px" CssClass="mail-state" SelectedValue='<%# Eval("State") %>'>
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                            <asp:ListItem Text="GA" Value="GA" Enabled="true"></asp:ListItem>
                            <asp:ListItem Text="KY" Value="KY" Enabled="true"></asp:ListItem>
                            <asp:ListItem Text="NC" Value="NC" Enabled="true"></asp:ListItem>
                            <asp:ListItem Text="SC" Value="SC" Enabled="true"></asp:ListItem>
                            <asp:ListItem Text="TN" Value="TN" Enabled="true"></asp:ListItem>
                            <asp:ListItem Text="VA" Value="VA" Enabled="true"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrent" runat="server" Text="Current Eff Date" />
                        <br />
                        <asp:TextBox ID="txtEffDateInsert" runat="server" CssClass="mydate" Font-Size="10px" Width="65px" Text='<%# Eval("CurrDate") %>' MaxLength="10" />
                    </td>
                    <td>
                       <asp:Label ID="lblAgent" runat="server" Text="Agent" />
                        <br />
                        <asp:DropDownList 
                             ID="ddlAgencyInsert" 
                             runat="server" 
                             DataSourceID="srcAgency" 
                             Font-Size="10px" 
                             DataTextField="agency_name" 
                             DataValueField="agency_number" 
                             AppendDataBoundItems="True" 
                             CssClass="add-agent" 
                             SelectedValue='<%# Bind("Agent") %>'>
                           <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>

                    </td>
                    <td>
                      <asp:Label ID="lblUnderwriter" runat="server" Text="Underwriter" />
                        <br />                     
                      <asp:DropDownList 
                           ID="ddlUnderwriterInsert" 
                           runat="server" 
                           DataSourceID="srcEmployeeData" 
                           Font-Size="10px" 
                           AppendDataBoundItems="True" 
                           DataTextField="FullName" 
                           DataValueField="file_location" 
                           SelectedValue='<%# Bind("UW") %>'>  
                        <asp:ListItem Text="" Value=""></asp:ListItem>                         
                     </asp:DropDownList>
                    </td>
                    <td>
                     <asp:Label ID="lblLossControl" runat="server" Text="Loss Control" />
                        <br />                     
                     <asp:DropDownList 
                          ID="ddlLossControlInsert" 
                          runat="server" 
                          DataSourceID="srcGetEmployee" 
                          Font-Size="10px" 
                          AppendDataBoundItems="True" 
                          DataTextField="FullName" 
                          DataValueField="file_location" 
                          SelectedValue='<%# Bind("LossControl") %>'>  
                      <asp:ListItem Text="" Value=""></asp:ListItem>                        
                      <asp:ListItem Text="TERRY DAVIS" Value="9520"></asp:ListItem> 
                      <asp:ListItem Text="STEPHEN FLOYD" Value="6595"></asp:ListItem> 
                      <asp:ListItem Text="JIM FRANCIS" Value="7560"></asp:ListItem> 
                      <asp:ListItem Text="MATT HOLLIFIELD" Value="8520"></asp:ListItem>             
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCurrentPremium" runat="server" Text="Current Premium" />
                        <br />
                        <asp:TextBox ID="txtCurrentPremiumInsert" runat="server" Text='<%# Eval("CurrPrem") %>' Font-Size="10px" Width="65px" MaxLength="10" />
                    </td>
                    <td>
                        <asp:Label ID="lblCurrentCarrier" runat="server" Text="Current Carrier" />
                        <br />
                        <asp:TextBox ID="txtCurrentCarrierInsert" runat="server" Width="215px" Text='<%# Eval("Carrier") %>' Font-Size="10px" MaxLength="45" />
                    </td>
                    <td>

                    </td>
                    <td>
                       <asp:Label ID="lblReqNo" runat="server" Text="Req No." />
                         <br />
                        <asp:TextBox ID="txtReqNoInsert" runat="server" Width="120px" Text='<%# Eval("RequestNo") %>' Font-Size="10px" MaxLength="5" />
                     </td>
                     <td>
                       <asp:Label ID="lblInspectionAppt" runat="server" Text="Inspection Appt." />
                        <br />
                        <asp:TextBox ID="txtInspectionInsert" runat="server" CssClass="mydate" Text='<%# Eval("InspAppt") %>' Width="65px" Font-Size="10px" MaxLength="10" />                    
                     </td>
                </tr>
               <tr>
                    <td>
                    <asp:Label ID="Label3" runat="server" Text="IRPM Factor" />
                        <br />
                     <asp:TextBox ID="txtIrpmFactorInsert" runat="server" Text='<%# Eval("IrpmFactor") %>' MaxLength="5" Font-Size="10px" />
                    </td>
                    <td>

                       </td>
                    <td>
                       </td>
                    <td>
                       </td>
                </tr>
                <tr>
                    <td>
                      <asp:RequiredFieldValidator ID="rfvQuoteDate" runat="server" ControlToValidate="txtQuoteDateInsert" Display="None" ErrorMessage="Add quote date" />
                    </td>
                    <td>
                       <asp:RequiredFieldValidator ID="rfvChurch" runat="server" ControlToValidate="txtChurchNameInsert" Display="None" ErrorMessage="Add church name" />
                       </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocationInsert" Display="None" ErrorMessage="Add location" />
                       </td>
                    <td>
                       <asp:RequiredFieldValidator  ID="rfvAgent" runat="server" ControlToValidate="ddlAgencyInsert" Display="None" ErrorMessage="Add Agency" />         
                       </td>
                      <td>
                       <asp:RequiredFieldValidator  ID="rfvUnder" runat="server" ControlToValidate="ddlUnderwriterInsert" Display="None" ErrorMessage="Add Underwriter" />         
                       </td>
                    <td>
                       <asp:RequiredFieldValidator  ID="rfvPremium" runat="server" ControlToValidate="txtCurrentPremiumInsert" Display="None" ErrorMessage="Add value to current premium" />         
                   </td>
                </tr>
            </table>
            </fieldset>
            <fieldset>
             <legend>Quoted</legend>
               <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkSmpQuoteInsert" runat="server" Text="SMP" Checked='<%# Eval("SmpQuoted") %>' />
            </td>
              <td>
                <asp:CheckBox ID="chkUmbQuoteInsert" runat="server" Text="Umbrella" Checked='<%# Eval("UmbQuoted") %>' />
               </td>
            <td>
                <asp:CheckBox ID="chkBaQuoteInsert" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaQuoted") %>' />
              </td>
            <td>
                <asp:CheckBox ID="chkWcQuoteInsert" runat="server" Text="W. Comp" Checked='<%# Eval("WcQuoted") %>' />
            </td>
            <td>
               <asp:Label ID="lblDeclinedDate" runat="server" Text="Declined Date" Visible="false" />
                <br />
                <asp:TextBox ID="txtDeclinedDateInsert" runat="server" CssClass="mydate" Visible="false" Text='<%# Eval("DeclineDate") %>' Width="65px" Font-Size="10px" MaxLength="10" />
               </td>
            <td>                
               </td>
        </tr>
        </table>
        <br />
        <table class="main-table">
        <tr>
            <td>
                <asp:CheckBox ID="chkNotWrittenInsert" runat="server" Text="Not Written" Checked='<%# Eval("NotWritten") %>' Font-Size="10px" />
            </td>
            <td>
                <asp:Label ID="lblReason" runat="server" Text="Reason" />                
            </td>
            <td>
                <asp:TextBox ID="txtReasonInsert" runat="server" Width="350px" Text='<%# Eval("Reason") %>' MaxLength="75" Font-Size="10px" />
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
                            <asp:TextBox ID="txtDateWrittenInsert" runat="server" CssClass="mydate" Text='<%# Eval("DateWritten") %>' Width="65px" MaxLength="10" Font-Size="10px" />
                          </td>
                        <td>
                            <asp:CheckBox ID="chkSmpWrittenInsert" runat="server" Text="SMP" Checked='<%# Eval("SmpWritten") %>' />
                            </td>
                        <td>
                            <asp:CheckBox ID="chkUmbWrittenInsert" runat="server" Text="Umbrella" Checked='<%# Eval("UmbWritten") %>' />
                          </td>
                        <td>
                            <asp:CheckBox ID="chkBaWrittenInsert" runat="server" Text="Bus. Auto" Checked='<%# Eval("BaWritten") %>' />
                            </td>
                        <td>
                            <asp:CheckBox ID="chkWcWrittenInsert" runat="server" Text="W. Comp" Checked='<%# Eval("WcWritten") %>' />
                          </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCustomerNo" runat="server" Text="Customer No."/>
                            <br />
                            <asp:TextBox ID="txtCustNoInsert" runat="server" Text='<%# Eval("CustNo") %>' MaxLength="10" Font-Size="10px" />
                          </td>
                        <td>
                           <asp:Label ID="lblPremium1" runat="server" Text="Premium"/>
                            <br />
                            <asp:TextBox ID="txtSmpPremInsert" runat="server" Text='<%# Eval("SmpPrem") %>' MaxLength="10" Font-Size="10px" />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium2" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="txtUmbPremInsert" runat="server" Text='<%# Eval("UmbPrem") %>' MaxLength="10" Font-Size="10px" />
                          </td>
                        <td>
                          <asp:Label ID="lblPremium3" runat="server" Text="Premium"/>
                          <br />
                          <asp:TextBox ID="txtBaPremInsert" runat="server" Text='<%# Eval("BaPrem") %>' MaxLength="10" Font-Size="10px" />
                          </td>
                        <td>
                        <asp:Label ID="lblPremium4" runat="server" Text="Premium"/>
                        <br />
                        <asp:TextBox ID="txtWcPremInsert" runat="server" Text='<%# Eval("WcPrem") %>' MaxLength="10" Font-Size="10px" />
                          </td>
                    </tr>
                  <tr>
                   <td>
                     <asp:CheckBox ID="chkSeacoastInsert" runat="server" Text="Seacoast" Checked='<%# Eval("Seacoast") %>' />
                   </td>
                   <td>
                       <asp:Label ID="Label4" runat="server" Text="Seacoast Exposure" />
                       <br />
                     <asp:TextBox ID="txtSeacoastExpInsert" runat="server" Text='<%# Eval("SeacoastExp") %>' MaxLength="10" Font-Size="10px" />
                   </td>
                   <td>                      
                   </td>
                   <td></td>
                   <td></td>
                  </tr>    
                </table>

            </fieldset>
                     <asp:Button 
                          ID="btnAdd" 
                          runat="server" 
                          CommandName="Insert"                          
                          Text="Insert" />
                 </InsertItemTemplate>
            </asp:FormView>

                   <asp:ValidationSummary 
                  ID="ValidationSummary1" 
                  ShowSummary="false" 
                  ShowMessageBox="true" 
                  runat="server" />  
        </asp:Panel>

          </ContentTemplate>

     <Triggers>
       <asp:AsyncPostBackTrigger ControlID="frmNew" EventName="ItemInserting" />
       <asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating" />
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating"></asp:AsyncPostBackTrigger>
     </Triggers>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="frmSearch" EventName="ItemUpdating" />
        </Triggers>

     </asp:UpdatePanel>

<%--     </div>--%>
                   <asp:ObjectDataSource 
                        ID="srcGetRecord" 
                        TypeName="_GetRecord"
                        runat="server"
                        SelectMethod="GetNewBusiness"
                        UpdateMethod="UpdateNewBusiness" 
                        DeleteMethod="DeleteNewBusiness">
                       <DeleteParameters>
                           <asp:Parameter Name="Newbusid" />
                       </DeleteParameters>
                    <SelectParameters>
                      <asp:ControlParameter ControlID="grdRecords" Name="newBusId" PropertyName="SelectedValue" />
                    </SelectParameters>
                     <UpdateParameters>
                       <asp:Parameter Name="Newbusid" />
                       <asp:Parameter Name="QuoteDate" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="CurrDate" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Church" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Location" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="State" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Agent" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="LossControl" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UW" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Carrier" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="CurrPrem" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="SmpQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UmbQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="BaQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="WcQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="NotWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Reason" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="DateWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="SmpWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UmbWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="BaWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="WcWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="SmpPrem" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="UmbPrem" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="BaPrem" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="WcPrem" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="Seacoast" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="SeacoastExp" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="IrpmFactor" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="CustNo" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="DeclineDate" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="RequestNo" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="InspAppt" ConvertEmptyStringToNull="false" />
                   </UpdateParameters>
                 </asp:ObjectDataSource>


               <asp:ObjectDataSource 
                  ID="srcAddRecord"
                  TypeName="_AddRecord"           
                  runat="server" 
                  InsertMethod="InsertNewBusiness">
                   <InsertParameters>
                       <asp:Parameter Name="QuoteDate" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="CurrDate" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Church" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Location" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="State" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Agent" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="LossControl" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UW" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Carrier" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="CurrPrem" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="SmpQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UmbQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="BaQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="WcQuoted" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="NotWritten" ConvertEmptyStringToNull="false"  />
                       <asp:Parameter Name="Reason" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="DateWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="SmpWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UmbWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="BaWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="WcWritten" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="SmpPrem" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="UmbPrem" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="BaPrem" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="WcPrem" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="Seacoast" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="SeacoastExp" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="IrpmFactor" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="CustNo" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="DeclineDate" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="RequestNo" ConvertEmptyStringToNull="false" />
                       <asp:Parameter Name="InspAppt" ConvertEmptyStringToNull="false" />
                   </InsertParameters>                 
                 </asp:ObjectDataSource>

   <asp:ObjectDataSource 
         ID="srcEmployeeData" 
         runat="server"
         TypeName="_GetRecord"
         SelectMethod="GetEmployeeFromUnderwriting">
    </asp:ObjectDataSource>

       <asp:ObjectDataSource 
         ID="srcGetEmployee" 
         runat="server"
         TypeName="_GetRecord"
         SelectMethod="GetEmployeeFromLossControl">
    </asp:ObjectDataSource>

        <asp:ObjectDataSource 
         ID="srcAgency" 
         TypeName="_GetRecord"
         runat="server" 
         SelectMethod="ShowAgencyByNumber">
   </asp:ObjectDataSource>
   


    </form>

</body>
</html>
