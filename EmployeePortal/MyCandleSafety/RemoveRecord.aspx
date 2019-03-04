<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RemoveRecord.aspx.vb" MaintainScrollPositionOnPostback="true" Inherits="EmployeePortal_MyCandleSafety_RemoveRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CandleID" DataSourceID="srcCandleData" CellPadding="4" CellSpacing="2" 
            Font-Size="12px">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="candleid" HeaderText="ID" Visible="False" />
            <asp:BoundField DataField="custnum" HeaderText="Customer Number" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="churchname" HeaderText="Church Name">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="actuallocation" HeaderText="Location" 
                Visible="False" />
            <asp:BoundField DataField="mailingcontact" HeaderText="Contact" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="mailingaddress" HeaderText="Address">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="mailingcity" HeaderText="City" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="mailingstate" HeaderText="State" />
            <asp:BoundField DataField="mailingzip" HeaderText="Zip" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="candleuse" HeaderText="Candle Use" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="fullname" HeaderText="Designated" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Entry Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("entrydate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("entrydate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="ipaddress" HeaderText="IP" Visible="False" />
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
    </asp:GridView>

    <asp:ObjectDataSource 
         ID="srcCandleData" 
         runat="server"
         SelectMethod="GetCandleSafetyRecords"
         TypeName="_GetRecord" DeleteMethod="DeleteCandleRecord">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="candleId" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
