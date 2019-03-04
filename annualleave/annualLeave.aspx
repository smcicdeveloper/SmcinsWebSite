<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
Dim conMISC as SqlConnection
Dim strSQL as String
Dim cmdSelect as SqlCommand
Dim rsEmp as SqlDataReader
Dim dadData as SqlDataAdapter
Dim dtbData as DataTable
Dim dstData as DataSet

Dim emp_no as String
Dim dept_no as String
Dim user_name as String
Dim exempt as String
Dim emp_name as String
Dim full_name as String
Dim date_hired as String
Dim allotted_leave as String
Dim leave_taken as String
Dim carry_over as String
Dim supervisor as String
Dim leave_remain as String
Dim total_remain as String
		
    Sub Page_Load
	    If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	    Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	    End If
        emp_no = Session("EmpNo")
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
		If IsSuper() = "True" Then
			response.redirect("annualLeaveSuper.aspx")
		End If
		lblName.Text = "Welcome, " & Session("EmpName") & "!"
		'emp_no = "9999"
        call PopulateMainInfo()
		call BindMainGrid()		
	End Sub
	
	Function IsSuper()
        conMISC.Open()   
		strSQL = "SELECT emp_no, dept_no, supervisor FROM vacmast WHERE emp_no = @empNo AND supervisor = @super"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        cmdSelect.Parameters.Add("@super", "Y")
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
		If rsEmp.HasRows then	
			IsSuper = "True"
		Else
			IsSuper = "False"
		End If
		conMISC.Close()
	End Function
	
	Function PopulateMainInfo()	
        conMISC.Open()   
		strSQL = "select emp_no, dept_no, emp_name, date_hired, allotted_leave, leave_taken, user_name, carry_over, supervisor from vacmast where emp_no = @empNo and term_date is null"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
        
		'UPDATE VARIABLES
		If rsEmp.HasRows then
			dept_no = rsEmp("dept_no")
			user_name = rsEmp("dept_no")
			emp_name = rsEmp("emp_name")
			date_hired = rsEmp("date_hired")
			allotted_leave = CDbl(rsEmp("allotted_leave"))
			leave_taken = CDbl(rsEmp("leave_taken"))
			carry_over = CDbl(rsEmp("carry_over"))
			supervisor = rsEmp("supervisor")
			leave_remain = CDbl(allotted_leave) - CDbl(leave_taken)
			total_remain = CDbl(leave_remain) + CDbl(carry_over)
        else
            'Response.Redirect("agents/denied.asp")
        end if		
        conMISC.Close()

		conMISC.Open()		
		strSQL = "select first_name, last_name from employees where emp_no = @empNo"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
        
		'UPDATE VARIABLES
		If rsEmp.HasRows then
			full_name = rsEmp("first_name")
			full_name = full_name & " "
			full_name = full_name & rsEmp("last_name")
		else
            'Response.Redirect("agents/denied.asp")
        end if		
        conMISC.Close()	

		'UPDATE TEXTBOXES WITH VALUES
		dataEmp.Text = emp_no
		dataDept.Text = dept_no
		dataEmpName.Text = full_name
		dataDateHired.Text = date_hired
		dataAL.Text = allotted_leave
		dataCO.Text = carry_over
		dataTaken.Text = leave_taken
		dataRemain.Text = leave_remain
		dataTotal.Text = total_remain
	End Function
	
	Function BindMainGrid() 
        conMISC.Open()
        strSql = "Select begin_date, end_date, total_days FROM vacdet WHERE emp_no = @empNo and begin_date > @thisYear ORDER BY begin_date ASC"
		dadData = New SqlDataAdapter(strSQL, conMISC)
		dadData.SelectCommand.Parameters.Add("@empNo", emp_no)
        dadData.SelectCommand.Parameters.Add("@thisYear", "1/1/2018")
		dstData = New DataSet
		dtbData = New DataTable
		dadData.Fill(dtbData)
		mainGrid.DataSource = dtbData
		mainGrid.DataBind()
		conMISC.Close()	
		
	End Function
	
	Function CheckDate(dataItem as Object, fieldName as String)
		if dataItem(fieldName) is DBNull.Value
			CheckDate = ""
		else
			CheckDate = dataItem(fieldName).ToShortDateString
		end if
	End Function
	
	
</script>
<HTML>
<HEAD>
<body>
<TITLE>Southern Mutual Church Insurance Company - Annual Leave</TITLE>

<STYLE type=text/css media="all">
#toppara{
  clear: both;
  width: 80%;
  height: 80px;
  padding: 0px 0px 0px 40px;
  margin: 0px 0px 20px 0px;
}

p.txt1{
  font-family: Verdana,Helvetica,sans-serif;
  margin: 0px 0px 0px 0px;
  font-size: 13px;
  line-height: 15px;
  color: #6a1462;
}

p.txt2 {
  font-family: Verdana,Arial,Helvetica,sans-serif;
  margin: 20px 0px 0px 0px;
  font-size: 12px;
  font-weight: bold;
  color: #2A3FAA;
}

#linklist{
  vertical-align: middle;
  float: left;
  width: 60%;
  margin: 0px 0px 0px 20px;
  color: #2A3FAA;
}

#linklist ul {
  list-style-image: url(arrow.gif);
}

#linklist ul li {
  margin-left: 0px;
  padding-left: 10px;
}

#mainBox {
width: 290px;
height: 240px;
margin: 0px 0px 0px 100px;
float: left;
overflow: scroll;
}

#mainButtons {
width: 140px;
height: 240px;
margin: 0px 0px 0px 0px;
padding: 0px 0px 0px 20px;
float: left;
}

p {
line-height: 4px;
margin: 0px 0px 6px 0px;
padding: 0px 0px 0px 0px;
}

#calLink {
top:4px;
left:8px;
position:absolute;
}

#scmidout2 {
width:640px;
height:456px;
margin:0px 0px 0px 0px;
}

#scmid {
position:relative;
display:block;
margin:0px 0px 0px 0px;
padding:8px 8px 8px 8px;
height:440px;
width:624px;
overflow:hide;
}

</STYLE>
<div id="scmidout2">
	<div id="scmid">
		<div class="scrollmid">
			<div id="calLink">
				<a href="calendar.aspx" target="_blank"><img src="calendar.gif"></a>
			</div>		
			<center><font size="3"><b>Annual Leave</b></font></center>
			<center><asp:Label id="lblName" runat="server"></asp:Label></center><br>
			<form id="ALMain" runat="server">
				<p align="center">
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:60px;" id="lblEmp" width="60px" BackColor="#e0e0e0" ReadOnly="True">Emp. #</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:60px;" id="lblDept" width="60px" BackColor="#e0e0e0" ReadOnly="True">Dept. #</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:180px;" id="lblEmpName" width="180px" BackColor="#e0e0e0" ReadOnly="True">Employee Name</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:100px;" id="lblDateHired" width="100px" BackColor="#e0e0e0" ReadOnly="True">Date Hired</asp:TextBox>
					<br>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:60px;" id="dataEmp" width="60px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:60px;" id="dataDept" width="60px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:180px;" id="dataEmpName" width="180px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:100px;" id="dataDateHired" width="100px" ReadOnly="True"></asp:TextBox>					
				</p> 			
				<p align="center">
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:90px;" id="lblAL" width="90px" BackColor="#e0e0e0" ReadOnly="True">Annual Leave</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:74px;" id="lblCO" width="74px" BackColor="#e0e0e0" ReadOnly="True">Carry Over</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:70px;" id="lblTaken" width="70px" BackColor="#e0e0e0" ReadOnly="True">Taken</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:83px;" id="lblRemain" width="83px" BackColor="#e0e0e0" ReadOnly="True">Remaining</asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:74px;" id="lblTotal" width="74px" BackColor="#e0e0e0" ReadOnly="True">w/Carryover</asp:TextBox>
					<br>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:90px;" id="dataAL" width="90px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:74px;" id="dataCO" width="74px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:70px;" id="dataTaken" width="70px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:83px;" id="dataRemain" width="83px" ReadOnly="True"></asp:TextBox>
					<asp:TextBox runat="server" style="TEXT-ALIGN: center; width:74px;" id="dataTotal" width="74px" ReadOnly="True"></asp:TextBox>					
				</p>
				<br>
				<div id="mainBox">
					<asp:DataGrid id="mainGrid" runat="server" AutoGenerateColumns="False"
						 AllowSorting="False"
						 DataKeyField="begin_date">
						<HeaderStyle font-size="9pt" font-names="Verdana" font-bold="True" backcolor="#e0e0e0"></HeaderStyle>
						<ItemStyle font-size="8pt" font-names="Verdana"></ItemStyle>
						<AlternatingItemStyle backcolor="#d3d3d3"></AlternatingItemStyle>
						<Columns>
							<asp:TemplateColumn headertext="Begin Date">
								<ItemTemplate>
								   <asp:TextBox id="mgTB1" style="TEXT-ALIGN: center; width:80px;" width="80px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "begin_date") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>
							<asp:TemplateColumn headertext="End Date">
								<ItemTemplate>
								   <asp:TextBox id="mgTB2" style="TEXT-ALIGN: center; width:80px;" width="80px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "end_date") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>					
							<asp:TemplateColumn headertext="Total Days">
								<ItemTemplate>
								   <asp:TextBox id="mgTB3" style="TEXT-ALIGN: center; width:80px;" width="80px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CDbl(Container.DataItem("total_days")) %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
						</Columns>
					</asp:DataGrid>
				</div>
				<div id="mainButtons">
					<INPUT type="BUTTON" onClick="window.location.href='submitWeek.aspx'" style="width:120px; height:42px; margin:0px 0px 4px 0px;" value="Submit Week"><BR>
					<INPUT type="BUTTON" onClick="window.location.href='browseWeek.aspx'" style="width:120px;height:42px; margin:0px 0px 4px 0px;" value="Browse Weeks"><BR>
					<INPUT type="BUTTON" onClick="window.location.href='leaveRequest.aspx'" style="width:120px;height:42px; margin:0px 0px 4px 0px;" value="Annual Leave&#10;Request"><BR>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
