<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_portal.master" AutoEventWireup="false" CodeFile="update_profile.aspx.vb" Inherits="PolicyholderPortal_update_profile" %>


<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <h3>Policyholder Information</h3>
        <hr />
            <asp:DetailsView 
                 ID="dltAddress" 
                 runat="server" 
                 Height="50px" 
                 Width="228px" 
                 AutoGenerateRows="False" 
                 DataSourceID="odsIseries" BorderStyle="None" BorderWidth="0px">
                <Fields>
                    <asp:BoundField DataField="ADD0LINE01" HeaderText="Insured:" >
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ADD0LINE03" HeaderText="Address:" >
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ADD0LINE04" HeaderText="City/State:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZIP0POST" HeaderText="Zip:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                </Fields>
                <HeaderStyle Font-Bold="True" Font-Size="11px" />
            </asp:DetailsView>
            <br />
            <h3>Mailing Address</h3>
            <hr />
            <asp:DetailsView 
                 ID="dltMailingAddress" 
                 runat="server" 
                 Height="50px" 
                 Width="228px"
                 AutoGenerateRows="False" 
                 DataSourceID="odsIseries" BorderStyle="None" BorderWidth="0px">
                <Fields>
                    <asp:BoundField DataField="ADD0LINE03" HeaderText="Address:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ADD0LINE04" HeaderText="City/State:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZIP0POST" HeaderText="Zip">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                </Fields>
            </asp:DetailsView>
            <br />
            <h3>Contact Representative</h3>
            <hr />
            <asp:DetailsView 
                 ID="DetailsView1" 
                 runat="server" 
                 Height="50px" 
                 Width="228px"
                 AutoGenerateRows="False" 
                 DataSourceID="OdsAllPortal" 
                 BorderStyle="None" 
                 BorderWidth="0px">
                <Fields>
                    <asp:BoundField DataField="FullName" HeaderText="Contact Name:">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" Width="85px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="phone" HeaderText="Phone">
                    <HeaderStyle Font-Bold="True" Font-Size="11px" />
                    <ItemStyle Font-Size="11px" />
                    </asp:BoundField>
                </Fields>
            </asp:DetailsView>


         <asp:ObjectDataSource 
            ID="odsIseries" 
            runat="server" 
            EnableCaching="true"
            CacheDuration="Infinite"
            SelectMethod="TestCustomerInfo" 
            TypeName="smci.DataAccessLayer.MySqlIdb2Code">
        <SelectParameters>
          <asp:SessionParameter 
            Name="UserNameIs" 
            SessionField="UserNameIs" />
        </SelectParameters>
        </asp:ObjectDataSource>
        </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
<h3>Update Profile</h3>
<div id="update_profile">
<fieldset>
    <asp:DataList 
         ID="dlstProfile" 
         runat="server" 
         DataSourceID="odcProfile" 
         DataKeyField="Username">
        <ItemTemplate>
            <label>First Name:<br />
            <asp:TextBox 
                ID="txtViewFirst" 
                Text='<%# Eval("Firstname") %>' 
                runat="server" 
                BorderStyle="None" 
                ReadOnly="True" />
            </label>
            <br /><br />
            <label>Last Name:<br />
            <asp:TextBox 
                 ID="txtViewLast" 
                 Text='<%# Eval("Lastname") %>'
                 runat="server" 
                 ReadOnly="True"
                 BorderStyle="None" />
           </label>
            <br /><br />
            <label>Phone Number:<br />
            <asp:TextBox 
                 ID="txtViewPhone" 
                 Text='<%# Eval("Phone") %>'
                 runat="server" 
                 ReadOnly="True"
                 BorderStyle="None" />
            </label>
            <br /><br />
            <asp:LinkButton 
                 ID="lnkEdit" 
                 CommandName="Edit"
                 Text="Edit"
                 runat="server" />
                 &nbsp;|&nbsp;
            <asp:HyperLink 
                 ID="hlnk" 
                 Text="Back to My Account" 
                 NavigateUrl="~/PolicyholderPortal/policyholder_tools.aspx" 
                 runat="server" />
        </ItemTemplate>
            <EditItemTemplate>
                <label>First Name:<br />
                <asp:TextBox 
                     ID="txtFirst" 
                     Text='<%# Eval("Firstname") %>'
                     MaxLength="15"
                     runat="server" />
                    <asp:RequiredFieldValidator 
                         ID="rfvFirst" 
                         runat="server" 
                         ControlToValidate="txtFirst"
                         Text="*"
                         ErrorMessage="Missing first name." 
                         ForeColor="Red" />
                 </label>
                <br /><br />
                <label>Last Name:<br />
                    <asp:TextBox 
                         ID="txtLast" 
                         Text='<%# Eval("Lastname") %>'
                         MaxLength="25"
                         runat="server" />
                    <asp:RequiredFieldValidator 
                         ID="rfvLast" 
                         runat="server" 
                         ControlToValidate="txtLast"
                         Text="*"
                         ErrorMessage="Missing last name." 
                         ForeColor="Red" />
                 </label>
                <br /><br />
                <label>Phone Number:<br />
                    <asp:TextBox 
                         ID="txtPhone"
                         Text='<%# Eval("Phone") %>' 
                         MaxLength="12"
                         runat="server" />
                <asp:RequiredFieldValidator 
                         ID="rvfPhone" 
                         runat="server" 
                         ControlToValidate="txtPhone"
                         Text="*"
                         ErrorMessage="Missing phone number." 
                         ForeColor="Red" />
                    <asp:RegularExpressionValidator 
                         ID="revPhone" 
                         runat="server" 
                         ControlToValidate="txtPhone"
                         Text="*"
                         ErrorMessage="Format should be XXX-XXX-XXXX"
                         ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                         ForeColor="Red" />
                </label>
                <br /><br />
                    <asp:LinkButton 
                         ID="lnkUpdate" 
                         CommandName="Update"
                         Text="Update" 
                         runat="server" />
                         &nbsp;|&nbsp;
                    <asp:LinkButton 
                         ID="lnkCancel" 
                         CommandName="Cancel"
                         Text="Cancel"
                         runat="server" />
                <asp:ValidationSummary 
                         ID="ValidationSummary1" 
                         runat="server" 
                         ShowMessageBox="True" 
                         ShowSummary="False" />
        </EditItemTemplate>
    </asp:DataList>

    <br /><br />
    
</fieldset>
</div>
    <asp:ObjectDataSource 
        ID="OdsAllPortal" 
        runat="server" 
        SelectMethod="GetUserProfile" 
        TypeName="smci.SqlAccessLayer.MySqlCode">
    <SelectParameters>
      <asp:SessionParameter 
        Name="UserNameIs" 
        SessionField="UserNameIs" 
        Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

    <asp:ObjectDataSource 
        ID="odcProfile" 
        runat="server" 
        SelectMethod="ViewUserProfile" 
        TypeName="smci.SqlAccessLayer.MySqlCode" UpdateMethod="UpdateProfile">
    <SelectParameters>
      <asp:SessionParameter 
        Name="UserNameIs" 
        SessionField="UserNameIs" 
        Type="String" />
    </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserNameIs" />
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="Phone" />
        </UpdateParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>






