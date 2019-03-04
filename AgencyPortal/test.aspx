<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="AgencyPortal_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:DataList 
                ID="DataList1" 
                runat="server" DataSourceID="odsProdSummary">
                <ItemTemplate>
                    Agent:
                    <asp:Label ID="AgentLabel" runat="server" Text='<%# Eval("Agent") %>' />
                    <br />
                    Mtdprem:
                    <asp:Label ID="MtdpremLabel" runat="server" Text='<%# Eval("Mtdprem") %>' />
                    <br />
                    Ytdprem:
                    <asp:Label ID="YtdpremLabel" runat="server" Text='<%# Eval("Ytdprem") %>' />
                    <br />
                    Earnprem:
                    <asp:Label ID="EarnpremLabel" runat="server" Text='<%# Eval("Earnprem") %>' />
                    <br />
                    Inforceprem:
                    <asp:Label ID="InforcepremLabel" runat="server" 
                        Text='<%# Eval("Inforceprem") %>' />
                    <br />
                    Currresv:
                    <asp:Label ID="CurrresvLabel" runat="server" Text='<%# Eval("Currresv") %>' />
                    <br />
                    Priorresv:
                    <asp:Label ID="PriorresvLabel" runat="server" Text='<%# Eval("Priorresv") %>' />
                    <br />
                    Paidytd:
                    <asp:Label ID="PaidytdLabel" runat="server" Text='<%# Eval("Paidytd") %>' />
                    <br />
                    Laecurrresv:
                    <asp:Label ID="LaecurrresvLabel" runat="server" 
                        Text='<%# Eval("Laecurrresv") %>' />
                    <br />
                    Laepriorresv:
                    <asp:Label ID="LaepriorresvLabel" runat="server" 
                        Text='<%# Eval("Laepriorresv") %>' />
                    <br />
                    Laepaidytd:
                    <asp:Label ID="LaepaidytdLabel" runat="server" 
                        Text='<%# Eval("Laepaidytd") %>' />
                    <br />
                    <br />
                </ItemTemplate>
           </asp:DataList>
                    <asp:DetailsView 
                         ID="DetailsView1" 
                         runat="server" 
                         Height="50px" 
                         Width="125px" 
                         DataSourceID="odsProdSummary">
                    </asp:DetailsView>
           <br />
           <br />
        <asp:ObjectDataSource 
          ID="odsProdSummary" 
          runat="server" 
          SelectMethod="MyProductionSummary" 
          TypeName="smci.SqlAccessLayer.MySqlCode">
          <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" />
          </SelectParameters>
         </asp:ObjectDataSource>
         <br />
           <asp:Repeater 
             ID="rptFiles" 
             runat="server" 
             DataSourceID="odsFiles">
             <HeaderTemplate>
             <ul class="fileList">
             </HeaderTemplate>
             <ItemTemplate>
             <li>
            <asp:HyperLink 
                ID="lnkFile" 
                Text='<%#Eval("FileName")%>' 
                NavigateUrl='<%#Eval("Id", "FileHandler.ashx?id={0}")%>' 
                runat="server" />
             </li>
             </ItemTemplate>
             <FooterTemplate>
            </ul>
             </FooterTemplate>
        </asp:Repeater>


        <asp:ObjectDataSource 
             ID="odsFiles" 
             runat="server" 
             SelectMethod="GetFiles" 
             TypeName="smci.SqlAccessLayer.MySqlCode">
        </asp:ObjectDataSource>

    </div>
    </form>
</body>
</html>
