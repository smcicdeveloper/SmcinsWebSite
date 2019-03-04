<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestSummary.aspx.vb" Inherits="TestSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<%-- <asp:RadioButtonList 
            ID="rblAgencyList" 
            runat="server" 
            DataSourceID="sdsHierarchy" 
            DataTextField="MasterID" 
            DataValueField="MasterID" 
            AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0002329">All</asp:ListItem>
         </asp:RadioButtonList>--%>

<label>Select Agency:</label>
    <asp:DropDownList 
         ID="DropDownList1" 
         runat="server" 
         AutoPostBack="True" 
         DataSourceID="sdsHierarchy" 
         DataTextField="MasterID" 
         DataValueField="MasterID">
    </asp:DropDownList>
    
          <br />
  
            <asp:DetailsView 
                ID="DetailsView1" 
                runat="server" 
                SkinID="Summary" 
                DataSourceID="odsProdSummary" 
                EmptyDataText="No data avaiable for this agency at this time." >
            <Fields>
                <asp:BoundField DataField="Agent" HeaderText="AGENCY NUMBER:">
                   <HeaderStyle Font-Bold="True" ForeColor="#0000CC" />
                   <ItemStyle Font-Bold="True" ForeColor="#0000CC" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="MTD PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mtdprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="YTD PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Ytdprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="EARNED PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Earnprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="INFORCE PREMIUM:">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Inforceprem", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="LOSSES PAID YTD:">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Paidytd", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="CURRENT LOSS RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="PRIOR YEAR LOSS RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Priorresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="LAE PAID YTD:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Laepaidytd", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="CURRENT LAE RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Laecurrresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="PRIOR YEAR LAE RESERVES:">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Laepriorresv", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="TOTAL INCURRED LOSSES:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Totalincurred", "{0:c}") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="LOSS RATIO:">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:Label></ItemTemplate><EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:TextBox></EditItemTemplate><InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Lossratio") %>'></asp:TextBox></InsertItemTemplate></asp:TemplateField></Fields><HeaderStyle Width="180px" />
        </asp:DetailsView>

        <br />
            <asp:Button ID="Button1" runat="server" Text="Print" 
        onclientclick="PrintPage()" />
        <br />
        <asp:Button ID="Button2" runat="server" Text="See Message" 
        onclientclick="Warning()" />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Confirm" 
        onclientclick="Confirm()" />
        <br />
        <asp:Button ID="Button4" runat="server" Text="Open New Window" 
        onclientclick="newWindow()" />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Refresh" 
        onclientclick="javascript:window.location.reload();" />
        <br />
        <asp:Button ID="Button6" runat="server" Text="Available Screen Size" 
        onclientclick="availScreen()" />
        <br />
        <asp:Button ID="Button7" runat="server" Text="Screen Size" 
        onclientclick="screenSize()" />

           <asp:ObjectDataSource 
            ID="odsProdSummary" 
            runat="server" 
            SelectMethod="MyProductionSummary" 
            TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="UserNameIs" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            </asp:ObjectDataSource>


            <asp:SqlDataSource 
                 ID="sdsHierarchy" 
                 runat="server" 
                 ConnectionString="Data Source=172.16.1.11;Initial Catalog=testnetdb;Integrated Security=True" 
                 ProviderName="System.Data.SqlClient" 
                 SelectCommand="SELECT MasterID FROM AgencyOriginationTable WHERE (MasterKeyID = '0002329')">
            </asp:SqlDataSource>

    </form>
<script type="text/javascript">
 function PrintPage() {
     window.print();
 }

 function Warning() {
     window.alert('Warning');
 }

// var isConfirmed = new object();
// isConfirmed.Yes = window.confirm('Are you sure?');
// isConfirmed.Answer = function () {
//     if (isConfirmed) {
//         window.alert('Ok');
//     }
// }

 function Confirm() {
     var isConfirmed = window.confirm('Are you sure?');
     if (isConfirmed) {
         window.alert('Ok');
     }
 }

 function availScreen() {
     var isConfirmed = window.confirm('Are you sure?');
     var mysize = ('width: ' + screen.availWidth + ' height: ' + screen.availHeight);
     if (isConfirmed) {
         window.alert(mysize);
     }
 }

 function screenSize() {
     var isConfirmed = window.confirm('Are you sure?');
     var mysize = ('width: ' + screen.width + ' height: ' + screen.height);
     if (isConfirmed) {
         window.alert(mysize);
     }
 }

 function newWindow() {
     var newWin = window.open("Claims/claims_info.aspx", "newwin", "width=400, height=500", false);
     newWin.focus();
     
 }
</script>

</body>
</html>
