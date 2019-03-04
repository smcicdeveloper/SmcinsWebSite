<%@ Page Title="" Language="VB" MasterPageFile="~/Shared/ElectronicFormView.master" AutoEventWireup="false" CodeFile="MyFiles.aspx.vb" Inherits="Webpages_MyFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script type="text/javascript">

    function showUpdate() {
        var divUpdate = document.getElementById('divUpdate');
        divUpdate.style.display = 'block';

    }

    function hideUpdate() {
        var divUpdate = document.getElementById('divUpdate');
        divUpdate.style.display = 'none';

    }

</script>
<script runat="server">
    

</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">  
  <ContentTemplate>
    <br /><br />
    <div id="employee">

    <asp:RadioButtonList 
         ID="RadioButtonList1" 
         runat="server" 
         DataSourceID="srcEmployeeByDepartment" 
         DataTextField="FullName" 
         DataValueField="file_location" 
         RepeatColumns="2" 
         AutoPostBack="True">
    </asp:RadioButtonList>

</div>

  <div id="see-grd">
    <asp:GridView 
         ID="grdStatus" 
         runat="server" 
         AutoGenerateColumns="False" 
         DataKeyNames="cust_no" 
         DataSourceID="srcGetMyFiles" 
         EmptyDataText="No Records At This Time" 
         Width="600px" 
         AllowPaging="True" Font-Size="12px">
        <Columns>
            <asp:CommandField ShowEditButton="True" HeaderText="Action" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="Customer Number">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Enabled="false" Text='<%# Eval("cust_no") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cust_no") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderText="The Insured">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Enabled="false" Text='<%# Eval("insured_name") %>'></asp:Label>
                    <%--<asp:TextBox ID="TextBox2" runat="server" Visible="true" Enabled="false" Text='<%# Eval("insured_name") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("insured_name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="My Status">
                <EditItemTemplate>
               <asp:DropDownList ID="ddlStatus" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("cust_status") %>'>
                <%--<asp:ListItem Text="(None)" Value=""></asp:ListItem>--%>
                <asp:ListItem Text="ACTIVE" Value="ACTIVE"></asp:ListItem>
                <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>
                <asp:ListItem Text="EXPIRED" Value="EXPIRED"></asp:ListItem>
                </asp:DropDownList>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("cust_status") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="File Location">
                <EditItemTemplate>
                <asp:DropDownList 
                     ID="ddlCheckOut" 
                     runat="server" 
                     DataSourceID="srcEmployeeData" 
                     AppendDataBoundItems="True" 
                     DataTextField="FullName"
                     DataValueField="file_location"
                     SelectedValue='<%# Bind("file_location") %>'>                           
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
        <PagerSettings Mode="NumericFirstLast" />
        <SelectedRowStyle CssClass="selectedRow" />
    </asp:GridView>
    <br />  
    </div>
        </ContentTemplate>
   </asp:UpdatePanel>


    <asp:ObjectDataSource 
         ID="srcEmployeeByDepartment" 
         runat="server"
         TypeName="_GetRecord"
         SelectMethod="GetEmployeeByDepartment">
    </asp:ObjectDataSource>

      <asp:ObjectDataSource 
         ID="srcEmployeeData" 
         runat="server"
         TypeName="_GetRecord"
         SelectMethod="GetEmployeeByAvailable">
    </asp:ObjectDataSource>

        <asp:ObjectDataSource 
         ID="srcGetMyFiles" 
         TypeName="_GetRecord"
         runat="server"
         SelectMethod="GetFileLocation" 
         UpdateMethod="UpdateRecord3">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList1" Name="FileLocation" PropertyName="SelectedValue" DefaultValue="2660" />
        </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cust_no" />
                <asp:Parameter Name="cust_status" />
                <asp:Parameter Name="file_location" />
            </UpdateParameters>
    </asp:ObjectDataSource>

        <asp:ObjectDataSource 
         ID="srcGetRecord"
         TypeName="_GetRecord" 
         SelectMethod="GetFile"        
         runat="server"
         UpdateMethod="UpdateRecord2">
        <SelectParameters>
            <asp:ControlParameter Name="CustNum" ControlID="grdStatus" />
        </SelectParameters>
    </asp:ObjectDataSource>



</asp:Content>

