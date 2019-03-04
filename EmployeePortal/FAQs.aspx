<%@ Page Title="" Language="VB" MasterPageFile="~/smcins_employee_portal.master" AutoEventWireup="false" CodeFile="FAQs.aspx.vb" Inherits="EmployeePortal_FAQs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
.box {
    padding:12px;}
</style>


<div class="box">
<h3>Frequently Asked Questions</h3>
<asp:TreeView 
     ID="TreeView1" 
     runat="server" 
     ExpandDepth="0" 
     NodeWrap="True" 
     Font-Size="13px">
    <LeafNodeStyle Font-Bold="False" ForeColor="#666666" />
    <Nodes>
<%--        <asp:TreeNode Text="" 
             Value="New Node">
            <asp:TreeNode Text="" 
            Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
--%>        
<%--        <asp:TreeNode Text="What is SMCI's stance with regard to properly licensed church members bringing their firearm on church premises?" 
             Value="New Node">
            <asp:TreeNode Text="The final decision on allowing firearms on the premises rests with state law and the church leadership. However, if the church leadership 
            decides to allow certain members to carry a concealed firearm, the church should be sure the person has a valid license/permit, along with firearms/security/safety 
            training that goes well beyond what most states require to obtain a license/permit. If your church does not have the luxury of having law enforcement or security 
            personnel attending, you may wish to ask those members seeking permission to carry a concealed firearm on church premises to provide proof of additional training. 
            Please note that just because someone has a license/permit doesn’t mean they should be allowed to carry a firearm on church premises, as some people are not suited 
            to handle this responsibility." 
            Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="If a member of the security team injures an innocent bystander while trying to protect others from harm, will the church’s liability coverage protect 
        both the church and the member of the security team acting on the church’s behalf?" 
             Value="New Node">
            <asp:TreeNode Text="In this type of situation, the policy would provide protection for both the church and the security team member. Please keep in mind that all 
            situations aren't necessarily cut and dry with regard to coverage. You really never know if, or what, coverage will be triggered until you see the complaint(s) in a lawsuit." 
            Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
--%>        <asp:TreeNode Text="What methods of payment can we use to pay for our church insurance?" 
            Value="New Node">
            <asp:TreeNode Text="We accept payment by Check or Money Order sent to our home office. You can also pay online with your checking account by clicking on the Online Payment option in the upper-right corner of our website." 
                Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What type of pay plans do you offer?" 
             Value="New Node">
            <asp:TreeNode Text="SMC offers Annual, Semi-Annual, and Quarterly payments. There is a service charge when paying other than annually." 
            Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What do the policy number abbreviations mean on my invoice?" 
        Value="New Node">
            <asp:TreeNode Text="SMP-Special Multi Peril, WC-Workers Compensation, BA-Business Auto, STD-Standard Fire Policy, UM-Umbrella" 
            Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Do I need to write a separate check for each policy?" Value="New Node">
            <asp:TreeNode Text="No, one check can include paying for several policies, but please include the invoice for each policy so the money can be applied correctly." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What is Earned Premium?" Value="New Node">
            <asp:TreeNode Text="The premium charged from the initial date the policy begins until the date the policy is cancelled." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What type of protection is recommended for HVAC units?" Value="New Node">
            <asp:TreeNode Text="Either a monitored alarm with a local siren or an approved cage is the recommended protection.  An approved cage provides protection 
            on all sides, as well the top of the unit.  If a copper theft loss  occurs while the unit is hooked up to a monitored alarm or properly caged, the company 
            will waive the deductible." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What is the proper type cage approved by SMCI for securing outside AC units to help prevent copper theft?" Value="New Node">
            <asp:TreeNode Text="There are several different type caging systems that are considered as an approved cage by SMCI." Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="For more information please call 1-800-922-5332 to speak with a representative from Loss Control for the appropriate types of cages." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
<%--        <asp:TreeNode Text="Can the outside AC units be connected to the church's existing burglar alarm system?" Value="New Node">
            <asp:TreeNode Text="Yes, the units can be connected to the existing alarm system.  It should be a monitored type burglar alarm with a horn or siren that would sound off once the alarm is tripped.  Contact your alarm company about having units connected to your system." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
--%>        <asp:TreeNode Text="Is there a credit given by SMCI if a church has a monitored burglar or fire alarm system installed?" Value="New Node">
            <asp:TreeNode Text="Yes, there is a 3% credit given towards your premium for each." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What is the purpose of doing an updated interior renewal inspection every three years?" Value="New Node">
            <asp:TreeNode Text="SMCI writes a three year policy and several months ahead of your renewal date the Loss Control Department performs an on site renewal inspection.  The purpose is to:" Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="- To make sure property is insured to value." Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="- To confirm property is being maintained." Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="- To check for hazards and safety issues." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="I would like to get a quote for my church. How do I get the process started?" Value="New Node">
            <asp:TreeNode Text="Go to the 'Agents' tab on the home page of the website. Click on your state and your area to contact the agent serving you." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Our church has a van/bus that needs insurance. Does SMCI insure vans only?" Value="New Node">
            <asp:TreeNode Text="We do insure church-owned vehicles, but require the church property to be insured with us in order to cover the vehicle(s)." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What type of coverage is available for our church's missions trips?" Value="New Node">
            <asp:TreeNode Text="We have partnered with IMG to provide coverage for individuals going on short term foreign missions trips. The 'Resources' tab on the home page of our website has information for this coverage." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Our church uses '1099 Contract Workers' to take care of landscaping/custodial services. How are these workers covered?" Value="New Node">
            <asp:TreeNode Text="It’s a good idea to require all contract workers to carry their own Workers’ Compensation Insurance. If they don’t carry their 
            own coverage and they are injured while working for the church, coverage under the church’s policy may be triggered." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What type of risk management services does SMCI provide?" Value="New Node">
            <asp:TreeNode Text="SMCI provides on-site risk management training in several areas, including child protection, 15-passenger van safety, and church security. Contact your agent for more information." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="When is a church or association required to carry a Workers’ Compensation (WC) policy?" Value="New Node">
            <asp:TreeNode Text="The requirements differ from state to state and some states will levy fines for non-compliance. The requirements for each state are 
            shown below and please remember that there is no distinction between part-time and full-time employees in determining the number of employees." Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="KY - 1 or more employees" Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="GA - 3 or more employees" Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="NC - 3 or more employees" Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="SC - 4 or more employees" Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="TN - 5 or more employees" Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What should be reported as payroll on your Workers’ Compensation Audit?" Value="New Node">
            <asp:TreeNode Text="When it’s time for your Workers’ Compensation Audit, you should report normal wages, overtime wages, housing allowances, and the fair rental 
            value of lodging provided to an employee. Certain payment items should not be reported as payroll, including the use of a church vehicle, educational assistance, 
            relocation expenses, and employer contributions to retirement plans and cafeteria plans, to name a few." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Why does my premium change once an audit is performed?" Value="New Node">
            <asp:TreeNode Text="There are two things that will affect your premium.  The first is a change in payroll over the course of the year.  Since we estimate the payroll at the beginning of the policy term, we must confirm the actual payroll at the end of the policy term.  That is the purpose of the audit.  We compare your beginning payroll amounts with the ending payroll amounts and adjust the premium accordingly. A change in rates can also cause the premium adjustment at audit. WC rates are developed by the National Council on Compensation Insurance (NCCI) and most states require companies to adopt these rates.  Typically, there are about 45 days between the processing of the renewal and the actual effective date of the policy.  When a rate change is approved during that period, with an effective date prior to the renewal, the actual increase or decrease will not be reflected until the audit is processed at the end of the term." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="How do we add a driver for our vehicles?" Value="New Node">
            <asp:TreeNode Text="Please provide your agent with the driver information (name, date of birth and driver’s license number) and they will forward to the company.  If Southern Mutual Church Insurance is your agent, you can send us the information via fax (803-776-4260) or by email.  If calling is your preference, we can be reached at 800-922-5332.  Please be sure you include your church name and policy number on any faxes or emails." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="How many church members can be listed as drivers?" Value="New Node">
            <asp:TreeNode Text="Southern Mutual Church Insurance (SMCI) will order motor vehicle reports (MVR) for up to eight drivers per vehicle.  Additional drivers may be added, but they must furnish a motor vehicle report to SMCI." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="What are age requirements for drivers?" Value="New Node">
            <asp:TreeNode Text="Drivers should be between the ages of 25 and 70. However, drivers from 22 to 24 years of age are eligible as long as they are on staff. Drivers 
            71 to 75 are eligible with a physician’s statement indicating no impairment to driving." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Will the church’s automobile policy cover a rented vehicle for liability and physical damage?" Value="New Node">
            <asp:TreeNode Text="Hired Auto Liability and Hired Auto Physical Damage are two separate coverage options, so you should consult your policy to determine the coverage provided. If Hired Auto Liability is on the policy, we will respond to a covered loss on an excess basis.  Physical damage coverage for covered losses is handled on a primary basis." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="How may we report a claim?" Value="New Node">
            <asp:TreeNode Text="In South Carolina, please call us at 800-922-5332 and we will take your claim." Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="In all other states, please contact your agent. The agent will secure all necessary information and send it to our office." Value="New Node"></asp:TreeNode>
            <asp:TreeNode Text="For a more detailed explanation on how to report a claim, click on 'Report a Claim' at the top of this page." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="How do we get a history of past claims?" Value="New Node">
            <asp:TreeNode Text="A request for loss history must be submitted on church letterhead with the policy number referenced. An official of the church must sign the request. The request may be faxed to 803-776-4260 or e-mailed to claims@smcins.com." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="How do we report an emergency claim after your office is closed?" Value="New Node">
            <asp:TreeNode Text="To report an emergency claim after hours, please call 800-922-5332 and follow the instructions. If you still need to report the claim after listening to the choices, please choose the correct menu option as instructed and you will be sent to the SMCI Emergency Call Center." Value="New Node"></asp:TreeNode>
        </asp:TreeNode>
    </Nodes>
    <RootNodeStyle Font-Bold="True" Font-Overline="False" ForeColor="#6666FF" 
        VerticalPadding="10px" />
</asp:TreeView>
 <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" 
        ShowStartingNode="False" />
</div>        
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

