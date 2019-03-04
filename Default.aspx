<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_home.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register TagPrefix="custom" Namespace="myControls" %>


   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div id="slider_box">
	    <ul id="slider">
       <li>
        <div class="caption-right">
        Southern Mutual Church Insurance Company is pleased to announce that we are now writing business in the Commonwealth of 
        Virginia and look forward to the opportunity to serve more churches in the Southeast!
        </div>
            <asp:Image ID="Image1" runat="server" ImageUrl="CSS/Images/Virginia-10-03-18.png" /> 
        </li>
        <li>
        <div class="caption-right">
        Our mission is to build long-term relationships with our church policyholders, business partners and employees through quality insurance products, trusted 
        services and a caring business culture.
        </div>
            <asp:Image ID="Image2" runat="server" ImageUrl="CSS/Images/Church-Christmas-snow.png" />   
        </li>
       <li>
        <div class="caption-right">
        When it comes to providing a secure environment for worship, many churches are asking, "Where do we start?" SMCI has responded in the Resources Section of 
        our website by providing guidelines and resources your church should use to create your own Church Security Program. 
        </div>
            <asp:Image ID="Image3" runat="server" ImageUrl="CSS/Images/PoliceLine.png" />        
        </li>
       <li>
       <div class="caption-right">
        To learn more about the steps your church can take to protect the children and youth in your congregation, please visit the Child and Youth Protection 
        page in the Resources Section of our website.
        </div>
            <asp:Image ID="Image4" runat="server" ImageUrl="CSS/Images/Child_Protection.png" />    
       </li>
        <li>
        <div class="caption-right">
        Our mission is to build long-term relationships with our church policyholders, business partners and employees through quality insurance products, trusted 
        services and a caring business culture.
        </div>
            <asp:Image ID="Image5" runat="server" ImageUrl="CSS/Images/_2013-Stain-glass.png" />   
        </li>
<%--       <li>
        <div class="caption-right">
        Our mission is to build long-term relationships with our church policyholders, business partners and employees through quality insurance products, trusted services and a caring business culture.
        </div>
            <asp:Image ID="Image6" runat="server" ImageUrl="CSS/Images/2017-Spring-Church.png" />         
       </li> --%>
       </ul>
     </div>
     </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <custom:ClientTabs id="ClientTabs1" Runat="server">


<%--  <custom:Tab ID="Tab1" Text="Hurricane Michael" runat="server">
      <h4>What to do when a claim occurs?</h4>
      <ul>
        <li>Ensure your safety and the safety of others</li>
        <li>Report the claim immediately</li>
        <li>Protect the property from any further damage</li>
        <li>Make reasonable temporary repairs required to protect property</li>
        <li>Retain all damaged property</li>
        <li>Cooperate with the insurance company and its representatives/investigators</li>
      </ul>
      <h4>How to report a claim if your church is located outside of South Carolina:</h4>
      <ul>
       <li>Contact your agent directly and provide the following information:
        <ul>
         <li>Church name and location (city, state, zip code)</li>
         <li>Contact name and phone number(s) for person reporting the claim</li>
         <li>Date of loss</li>
         <li>Description of loss</li>
        </ul>
        </li>
      </ul>
      <h4>How to report a claim if your church is located in South Carolina:</h4>
      <ul>
       <li>By Mail: P.O. Box 9346, 201 Greenlawn Drive, Columbia SC 29290 "ATTN-Claims Dept".</li>
       <li>By E-mail:<a href="mailto:Claim@smcins.com?subject=Report a claim from website"> Claim@smcins.com</a></li>
       <li>By Phone: 1-800-922-5332</li>
       <li>By Fax: 803-776-4260</li>
      </ul>
        </custom:Tab> --%>

    <custom:Tab ID="Tab1" Text="Candle Safety" runat="server">
        <asp:DataList ID="DataList2" runat="server" DataSourceID="Tab1Src">
            <ItemTemplate>
                <h3>
                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>' />
                </h3>
                <p>
                <asp:Label ID="TEXTLabel" runat="server" Text='<%# Eval("TEXT") %>' />
                </p>
                <br />
                 <br />
            </ItemTemplate>
        </asp:DataList>
        </custom:Tab> 


    <custom:Tab ID="Tab2" Text="Church Security" runat="server">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="Tab2Src">
            <ItemTemplate>
                <h3>
                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>' />
                </h3>
                <p>
                <asp:Label ID="TEXTLabel" runat="server" Text='<%# Eval("TEXT") %>' />
                </p>
                <br />
                 <br />
            </ItemTemplate>
        </asp:DataList>
        </custom:Tab> 

<%--    <custom:Tab ID="Tab2" Text="Hurricane Season" runat="server">
        <asp:DataList ID="DataList2" runat="server" DataSourceID="Tab2Src">
            <ItemTemplate>
                <h3>
                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>' />
                </h3>
                <p>
                <asp:Label ID="TEXTLabel" runat="server" Text='<%# Eval("TEXT") %>' />
                </p>
                <br />
                 <br />
            </ItemTemplate>
        </asp:DataList>
        </custom:Tab> --%>

   <custom:Tab ID="Tab3" Text="Child Protection" runat="server">
        <asp:DataList ID="DataList3" runat="server" DataSourceID="Tab3Src">
            <ItemTemplate>
                <h3>
                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>' />
                </h3>
                <p>
                <asp:Label ID="TEXTLabel" runat="server" Text='<%# Eval("TEXT") %>' />
                </p>
<%--                <br />
                 <br />
--%>            </ItemTemplate>
        </asp:DataList>
   </custom:Tab> 
 
<%--        <custom:Tab ID="Tab3" Text="News Room" runat="server">
        <asp:DataList ID="DataList3" runat="server" DataSourceID="scrHighlights3">
            <ItemTemplate>
                <h3>
                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>' />
                </h3>
                <p>
                <asp:Label ID="TEXTLabel" runat="server" Text='<%# Eval("TEXT") %>' />
                </p>
                <br />
                 <br />
        
            </ItemTemplate>
        </asp:DataList>
        </custom:Tab>  --%>

        <custom:Tab ID="Tab4" Text="Financial Ratings" runat="server">
           <asp:DataList ID="DataList4" runat="server" DataSourceID="Tab4Src">
            <ItemTemplate>
                <h3>
                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>' />
                </h3>
                <p>
                <asp:Label ID="TEXTLabel" runat="server" Text='<%# Eval("TEXT") %>' />
                </p>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </custom:Tab>  
   
    </custom:ClientTabs>

     <asp:SqlDataSource 
       ID="Tab1Src" 
       runat="server" 
       ConnectionString="<%$ ConnectionStrings:SMCI %>" 
       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 1">
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 15"> PROD --%>
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 17"> DEV--%>
     </asp:SqlDataSource>
     <asp:SqlDataSource 
       ID="Tab2Src" 
       runat="server" 
       ConnectionString="<%$ ConnectionStrings:SMCI %>" 
       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 15">
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 6"> PROD --%>
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 6"> DEV --%>
    </asp:SqlDataSource>
    <asp:SqlDataSource 
       ID="Tab3Src" 
       runat="server" 
       ConnectionString="<%$ ConnectionStrings:SMCI %>" 
       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 14">
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 14"> PROD --%>
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 16"> DEV --%>
    </asp:SqlDataSource>
    <asp:SqlDataSource 
       ID="Tab4Src" 
       runat="server" 
       ConnectionString="<%$ ConnectionStrings:SMCI %>" 
       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 12">
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 12"> PROD --%>
<%--       SelectCommand="SELECT HEADER, TEXT FROM HomePageText WHERE CONTENT_ID = 14"> DEV --%>
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

