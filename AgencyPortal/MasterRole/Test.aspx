<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_agent.master" AutoEventWireup="false" CodeFile="Test.aspx.vb" Inherits="AgencyPortal_Administrator_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<script type="text/javascript">
  
$('#dr5').DataTable( {

    "": {

      "emptyTable": "No data available in table"

    }

} );
</script>--%>

    <div>
          <br /><br />
          <div id="chart_box">
        <br />
                  <asp:DropDownList 
                     ID="ddlSelectAgency" 
                     runat="server"
                     CssClass="dropDownList" 
                     AutoPostBack="True" 
                     DataSourceID="sdsHierarchy" 
                     DataTextField="MasterID" 
                     DataValueField="MasterID" 
                     Width="125px">
                </asp:DropDownList>                 
                <br />
                 <label>Year: <br />
                 <asp:DropDownList ID="ddlYear" runat="server" Width="75px" 
                  CssClass="dropDownList" AutoPostBack="True">
                 <asp:ListItem Text="2018" Value="118"></asp:ListItem>
                 <asp:ListItem Text="2017" Value="117"></asp:ListItem>
                 </asp:DropDownList>
                 </label>
                <br />
                 <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropDownList" Width="90px">
                 <asp:ListItem Text="January" Value="01"></asp:ListItem>
                 <asp:ListItem Text="February" Value="02"></asp:ListItem>
                 <asp:ListItem Text="March" Value="03"></asp:ListItem>
                 <asp:ListItem Text="April" Value="04"></asp:ListItem>
                 <asp:ListItem Text="May" Value="05"></asp:ListItem>
                 <asp:ListItem Text="June" Value="06"></asp:ListItem>
                 <asp:ListItem Text="July" Value="07"></asp:ListItem>
                 <asp:ListItem Text="August" Value="08"></asp:ListItem>
                 <asp:ListItem Text="September" Value="09"></asp:ListItem>
                 <asp:ListItem Text="October" Value="10"></asp:ListItem>
                 <asp:ListItem Text="November" Value="11"></asp:ListItem>
                 <asp:ListItem Text="December" Value="12"></asp:ListItem>
                 </asp:DropDownList>

                 <br />
                 <br />

              <asp:GridView ID="GridView1" runat="server">
              </asp:GridView>

                 <br />
              <asp:Button ID="Button1" runat="server" Text="Click Me" />

        </div>
    </div>

    <asp:SqlDataSource 
            ID="sdsHierarchy" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:AllPortal%>" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT MasterID FROM AgencyOriginationTable WHERE (MasterKeyID = @UserNameIs)">
        <SelectParameters>
            <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" 
                DefaultValue="0002012" />
        </SelectParameters>
    </asp:SqlDataSource>

<%--          <asp:ObjectDataSource 
            ID="odsProdSummary" 
            runat="server" 
            SelectMethod="MyProductionSummary" 
            TypeName="smci.SqlAccessLayer.MySqlCode">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="UserNameIs" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
         </asp:ObjectDataSource>--%>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

