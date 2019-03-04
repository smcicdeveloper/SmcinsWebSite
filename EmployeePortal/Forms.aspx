<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_employee_portal.master" AutoEventWireup="false" CodeFile="Forms.aspx.vb" Inherits="AgencyPortal_Forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
    
.categories h2 {
    font:bold 14px Arial, Sans-Serif;
    margin:10px 0 15px 0;
    color:#333333;
}    
    
.column {
    float:left;
    width:200px;
    padding:15px 5px 0 15px;
    font-family:Verdana;
    font-size:11px;
    /*border:solid blue 1px;*/
}

.column2 {
    float:left;
    width:600px;
    padding:15px 5px 0 15px;
    font-family:Verdana;
    font-size:11px;
    /*border:solid blue 1px;*/
}

.title {
    font:bold 24px Arial, Sans-Serif;
    color:Navy;
    padding-bottom:5px;
}

.box {
    margin-top:10px;
    padding-bottom:60%;}

.forms {
    margin-left:20px;
    margin-bottom:10px;
    width:100%;
}

.form td {
    padding:7px;
}

.form a {text-decoration:underline;}

a {
    padding:10px;
    color:Navy;
    text-decoration:none;
}

a:hover {text-decoration:underline;}

</style>
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>

<div class="box">
<div class="column">
    <asp:DataList 
         ID="dlstForms" 
         DataSourceID="srcFormGroups"
         GridLines="None"
         CssClass="form"
         runat="server" 
         DataKeyField="Grouping">
        <ItemTemplate>
        <asp:LinkButton 
                ID="lnkForms" 
                Text='<%# Eval("Grouping") %>'
                CommandName="Select"
                runat="server"/>
          <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</div>

<div class="column2">
    <asp:Label ID="lblTitle" CssClass="title" runat="server" />
<hr />
    <asp:GridView 
         ID="grdForms"
         DataSourceID="srcFormCategories"
         OnRowDataBound="grdForms_RowDataBound"
         AutoGenerateColumns="False"
         CssClass="categories"
         ShowHeader="False"
         GridLines="None"
         DataKeyNames="Category"
         runat="server">
         <Columns>
         <asp:TemplateField>
         <ItemTemplate>
          <h2><%# Eval("Category")%></h2>
          <hr />
             <asp:GridView 
                  ID="grdForms" 
                  DataSourceId="srcForms"
                  runat="server" 
                  AutoGenerateColumns="False" 
                  DataKeyNames="Id" 
                  GridLines="None"
                  CssClass="forms"
                  CellPadding="3" 
                  CellSpacing="1"
                  EmptyDataText="No Forms" 
                  ForeColor="#666666">
                 <Columns>
                     <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                         ReadOnly="True" SortExpression="Id" Visible="False" />
                     <asp:BoundField DataField="Number" HeaderText="Number" 
                         SortExpression="Number" >
                     <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                     <ItemStyle Width="80px" Wrap="False" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Edition" HeaderText="Edition" 
                         SortExpression="Edition" >
                     <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                     <ItemStyle Width="80px" Wrap="False" />
                     </asp:BoundField>
                     <asp:TemplateField HeaderText="EffDate" SortExpression="EffDate">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%#Eval("EffDate", "{0:d}")%>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EffDate") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                         <ItemStyle Width="80px" Wrap="False" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="FileName" SortExpression="FileName">
                         <ItemTemplate>
                             <asp:HyperLink ID="lnkFile" Text='<%# Eval("FileName")%>' NavigateUrl='<%#Eval("Id", "FormsHandler.ashx?id={0}")%>' Target="_blank" runat="server" />
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FileName") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                         <ItemStyle Wrap="False" HorizontalAlign="Left" />
                     </asp:TemplateField>
                     <asp:BoundField DataField="Category" HeaderText="Category" 
                         SortExpression="Category" Visible="False" >
                     <HeaderStyle HorizontalAlign="Left" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Grouping" HeaderText="Grouping" 
                         SortExpression="Grouping" Visible="False" />
                 </Columns>
                 <HeaderStyle ForeColor="#333333" />
             </asp:GridView>

       <asp:SqlDataSource 
         ID="srcForms" 
         runat="server"
         ConnectionString="<%$ ConnectionStrings:SMCI %>"        
         SelectCommand="SELECT [Id], [FileName], [Number], [Edition], [EffDate], [Category], [Grouping] FROM [AllAgentForms] WHERE ([Grouping] = @Grouping AND [Category] = @category) ORDER BY [Number]" 
         ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:SessionParameter Name="Grouping" SessionField="Grouping" />
                <asp:Parameter Name="category" />
            </SelectParameters>
        </asp:SqlDataSource>

         </ItemTemplate>
         </asp:TemplateField>
         </Columns>
    </asp:GridView>

<%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
</div>
</div>
    <asp:SqlDataSource 
         ID="srcFormGroups" 
         ConnectionString="<%$ ConnectionStrings:SMCI %>"
         runat="server" 
         ProviderName="System.Data.SqlClient" 
         SelectCommand="SELECT DISTINCT Grouping FROM AllAgentForms">
    </asp:SqlDataSource>

    <asp:SqlDataSource 
         ID="srcFormCategories"
         ConnectionString="<%$ ConnectionStrings:SMCI %>" 
         runat="server" ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT DISTINCT Category FROM AllAgentForms">
   </asp:SqlDataSource>





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

