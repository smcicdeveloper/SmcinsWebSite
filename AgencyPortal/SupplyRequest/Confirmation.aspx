<%@ Page Title="" Language="VB" MasterPageFile="~/AgencyPortal/SupplyRequest/Request.master" AutoEventWireup="false" CodeFile="Confirmation.aspx.vb" Inherits="AgencyPortal_SupplyRequest_Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        <div id="header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/AgencyPortal/SupplyRequest/Images/smcic-logo-white.png" />  
        </div>

        <hr style="border: 1px dashed #d4d4d4;" />

        <div id="main">
            <p>
                <asp:Label ID="lblConfirm" runat="server"></asp:Label><br />
            </p>
            <br />
            <br />
            <br />
            <p>
                <asp:Button ID="btnReturn" runat="server" Text="Return to Order Page" />
            </p>        
        </div>
   
</asp:Content>

