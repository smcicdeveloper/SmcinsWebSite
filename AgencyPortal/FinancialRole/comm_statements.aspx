<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_all_portal.master" AutoEventWireup="false" CodeFile="comm_statements.aspx.vb" Inherits="AgencyPortal_FinancialRole_comm_statements" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="comm_landscape">
<fieldset>
  <ul>
    <li>
    <label>Agency: <br />
    <asp:DropDownList 
        ID="ddlSelectAgency" 
        runat="server"
        CssClass="comm_dropDownList" 
        AutoPostBack="True" 
        DataSourceID="sdsHierarchy" 
        DataTextField="SubID" 
        DataValueField="SubID" 
        Width="125px">
    </asp:DropDownList>  
    </label>
</li>
<li>
    <label>Year: <br />
    <asp:DropDownList 
        ID="ddlYear" 
        runat="server" 
        Width="75px" 
        CssClass="comm_dropDownList" 
        AutoPostBack="True">
        <asp:ListItem Text="2019" Value="119"></asp:ListItem>
        <asp:ListItem Text="2018" Value="118"></asp:ListItem>
    </asp:DropDownList>
    </label>
 </li>   
 <li>
  <label>Month: <br />
    <asp:DropDownList 
            ID="ddlMonth" 
            runat="server" 
            CssClass="comm_dropDownList" 
            Width="90px">
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
</label>
  </li>
 </ul>

 </fieldset>  

 <fieldset style="background-color:#f2f3f4;">
  <p>
   Choose the year and month for your statement.
  </p>
 </fieldset>

 <fieldset style=" text-align:right; border: 0 gray solid;">
  <ul>
   <li>
      <asp:Button ID="Button1" runat="server" Text="Get Statement"  CssClass="comm_buttons " />
   </li>
   <li>
   </li>
  </ul>
 </fieldset>



</div>

    


<asp:SqlDataSource 
        ID="sdsHierarchy" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:AllPortal%>" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT SubID FROM AgentProfiles WHERE (UserName = @UserNameIs)">
    <SelectParameters>
        <asp:SessionParameter Name="UserNameIs" SessionField="UserNameIs" Type="String" />          
    </SelectParameters>
</asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

