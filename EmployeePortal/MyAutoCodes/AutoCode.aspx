<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AutoCode.aspx.vb" Inherits="EmployeePortal_MyAutoCodes_AutoCode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/ZipStyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
    
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div class="wrapperDiv">
<div class="headerDiv">
    <h3 class="title">Code LookUp</h3>
</div>

<div class="contentDiv">   
     <div class="gridWrapper">
        <div class="searchBar">
        <table>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Search by Zip Code : "></asp:Label></td>                          
                <td><asp:TextBox ID="txtSearch" runat="server"  class="form-control" 
                        style="margin-top: 5px;" Width="150px" MaxLength="5"></asp:TextBox></td>                          
                <td><asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary"/></td>                        
            </tr>
        </table>
        </div>

<div class="gridContainer">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<contenttemplate>
 
     <asp:GridView 
          ID="grdList" 
          runat="server" 
          AutoGenerateColumns="False" 
          EmptyDataText="No Record Found" 
          class="table table-striped table-bordered table-condensed"
          AllowPaging="True" 
          DataSourceID="odsAutoList" 
          DataKeyNames="CodeId" >
         <Columns>
             <asp:BoundField DataField="CodeId" HeaderText="CodeId" SortExpression="CodeId" 
                 Visible="False" />
             <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" 
                 SortExpression="ZipCode" />
             <asp:BoundField DataField="Territory" HeaderText="Territory" SortExpression="Territory" />
             <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
             <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"/>
             <asp:BoundField DataField="TerritoryCode" HeaderText="Territory Code" 
                 SortExpression="TerritoryCode"/>
         </Columns>
     </asp:GridView>          
</contenttemplate>
<Triggers>                                             
    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
</Triggers>
</asp:UpdatePanel>  
</div>
  <asp:ObjectDataSource 
       ID="odsAutoList" 
       runat="server" 
       SelectMethod="GetAllAutoCodes" 
       TypeName="GetAutoCodes">
      <SelectParameters>
          <asp:ControlParameter ControlID="txtSearch" Name="zip" PropertyName="Text" ConvertEmptyStringToNull="false" />
      </SelectParameters>
         </asp:ObjectDataSource>

     </div>          
</div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none ;">
<div class="modal-dialog"><div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h4 class="modal-title" id="myModalLabel">Code LookUp</h4></div>
<div class="modal-body">
<div style="float:left; display: inline; padding-right: 80px; ">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>

</ContentTemplate>
<Triggers>
    <%--<asp:AsyncPostBackTrigger ControlID="Gridview1" EventName="RowCommand" />--%>
</Triggers>
    </asp:UpdatePanel>
</div>

<div style="display: inline-block;">
<br />
<input id="btnShowCam" type="submit" value="AddPhoto" />
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal" id="btnClose" >Close</button>
<asp:Button ID="btnSave" runat="server" Text="Save change" CssClass="btn btn-primary"/>
</div>
</div>
</div>
</div>
</form>
</body>
</html>