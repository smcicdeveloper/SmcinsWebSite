<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
Dim conMISC as SqlConnection
Dim strSQL as String
Dim cmdSelect as SqlCommand
Dim cmdUpdate as SqlCommand
Dim cmdInsert as SqlCommand
Dim rsEmp as SqlDataReader
Dim dadData as SqlDataAdapter
Dim dtbData as DataTable
Dim dstData as DataSet

Dim emp_no as String
Dim dept_no as String
Dim usr_no as String
Dim user_name as String
Dim full_name as String
Dim supervisor as String
Dim weekEnd as String
Dim start as Boolean
Dim weeks as New ArrayList()
Dim date_hired as String
		
    Sub Page_Load
	    If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	    Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	    End If
		usr_no = Session("usrNo")
		emp_no = Session("EmpNo")	
		'emp_no = "9999"
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
		call PopulateMainInfo()
		msgLbl.Text = ""
		call GetWeeks()
		If hiddenDay.Text = "" Then
			hiddenDay.Text = weeks.Count - 1
		End If
		call GetWeekData(weeks(CInt(hiddenDay.Text)))
	End Sub
	
	Function PopulateMainInfo()	
        conMISC.Open()   
		strSQL = "SELECT emp_no, dept_no, date_hired, user_name, supervisor FROM vacmast WHERE emp_no = @empNo AND term_date is null"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", usr_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
        
		'UPDATE VARIABLES
		If rsEmp.HasRows Then
			dept_no = rsEmp("dept_no")
			user_name = rsEmp("dept_no")
			supervisor = rsEmp("supervisor")
			date_hired = rsEmp("date_hired")
        else
            'Response.Redirect("agents/denied.asp")
        End If		
        conMISC.Close()

		conMISC.Open()		
		strSQL = "SELECT first_name, last_name FROM employees WHERE emp_no = @empNo"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", usr_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
        
		'UPDATE VARIABLES
		If rsEmp.HasRows Then
			full_name = rsEmp("first_name")
			full_name = full_name & " "
			full_name = full_name & rsEmp("last_name")
		else
            'Response.Redirect("agents/denied.asp")
        End If		
        conMISC.Close()	

		'UPDATE TEXTBOXES WITH VALUES
        lblEmpName.Text = full_name
		lblEmpNo.Text = usr_no
	End Function
	
	Function GetWeeks() 
        conMISC.Open()   
        strSQL = "SELECT * FROM vachistory WHERE emp_no = @empNo AND weekend_date >= '01/01/2018' ORDER BY weekend_date ASC"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", usr_no)
        rsEmp = cmdSelect.ExecuteReader()
		If rsEmp.HasRows Then
			While rsEmp.Read()
				weeks.Add(rsEmp("weekend_date"))
			End While
		End If
        conMISC.Close()
		If weeks.Count = 0 Then
			Response.Write("There are no weeks to display")
			Response.End
		End If
	End Function
	
	Function ShowPages() 
		pages.Text = "Record " & CInt(hiddenDay.Text) + 1 & " of " & weeks.Count
	End Function
	
	Function ShowTotalWeeks()
		bottomLbl.Text = "Hello"
		Dim currentYear as Integer
		currentYear = Year(Now)
		Dim startDate as DateTime
		Dim lastEnd as DateTime
		startDate = DateSerial(currentYear, "01", "01")
		If WeekDay(startDate) = 7 Then
			startDate = DateAdd("d", 6, startDate)
		Else
			startDate = DateAdd("d", 6 - WeekDay(startDate), startDate)	
		End If
		lastEnd = DateValue(Now)
		If WeekDay(lastEnd) = 7 Then
			lastEnd = DateAdd("d", -1, lastEnd)
		Else 
			lastEnd = DateAdd("d", -(1 + WeekDay(lastEnd)), lastEnd)
		End If
		Dim j as Integer
		Dim k as Integer
		j = 0
		k = 0
		While lastEnd >= startDate
			If weeks.Contains(startDate) Then
				k = k + 1
			End If
			startDate = DateAdd("d", 7, startDate)
			j = j + 1
		End While
	
		'Check if they were hired this year and total weeks will only be counted after they were hired.
		If Year(date_hired) = currentYear Then
			startDate = date_hired
			If WeekDay(startDate) = 7 Then
				startDate = DateAdd("d", 6, startDate)
			Else
				startDate = DateAdd("d", 6 - WeekDay(startDate), startDate)	
			End If
			j = 0
			k = 0			
			While lastEnd >= startDate
				If weeks.Contains(startDate) Then
					k = k + 1
				End If
				startDate = DateAdd("d", 7, startDate)
				j = j + 1
			End While			
		End If
		
		bottomLbl.Text = "You have reported <b>" & k & "</b> of <b>" & j & "</b> weeks this year."
		If k < j Then
			bottomLbl.Text = bottomLbl.Text & "<font color='RED'><BR><BR><b>You have " & j - k & " unreported week(s)!</b></font>"
		Else
			bottomLbl.Text = bottomLbl.Text & "<BR><BR>Your records are up to date!"
		End If
	End Function
	
	Function GetWeekData(subWeek as String)
		Dim dayNum as Integer
		dayNum = Weekday(subWeek)
		dayNum = 6 - dayNum
		weekEnd = DateAdd("d", dayNum, subWeek)
		lblWeekEnding.Text = weekEnd
		call PopulateTable()
		call ShowPages()
		call ShowTotalWeeks()
	End Function
	
	Function PopulateTable()
        conMISC.Open()   
		strSQL = "SELECT * FROM vachistory WHERE emp_no = @empNo AND weekend_date = @weekendDate"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", usr_no)
        cmdSelect.Parameters.Add("@weekendDate", weekEnd)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
	
		'FILL IN THE FIELDS
		If rsEmp.HasRows Then
			Call PopDates()
			If rsEmp("approved") = "Y" Then
				msgLbl.Text = "This record has been approved by a supervisor."
				msgLbl.ForeColor = System.Drawing.Color.FromName("BLACK")
			Else
				msgLbl.Text = "This record has not yet been approved."
				msgLbl.ForeColor = System.Drawing.Color.FromName("RED")			
			End If
			Dim iStat as String
			iStat = rsEmp("monday_status")
				status1.Text = iStat
				'status1.Items.Clear()
				'status1.Items.Add(iStat)
				'status1.selectedValue = iStat
			iStat = rsEmp("tuesday_status")
				status2.Text = iStat
				'status2.Items.Clear()
				'status2.Items.Add(iStat)
				'status2.selectedValue = iStat
			iStat = rsEmp("wednesday_status")
				status3.Text = iStat
				'status3.Items.Clear()
				'status3.Items.Add(iStat)
				'status3.selectedValue = iStat
			iStat = rsEmp("thursday_status")
				status4.Text = iStat
				'status4.Items.Clear()
				'status4.Items.Add(iStat)
				'status4.selectedValue = iStat
			iStat = rsEmp("friday_status")
				status5.Text = iStat
				'status5.Items.Clear()
				'status5.Items.Add(iStat)
				'status5.selectedValue = iStat
        else
			'Error handling here
        End If		
		
		'ADD THE HOLIDAYS TO THE DROP DOWN LISTS
        conMISC.Close()
        conMISC.Open()   
		strSQL = "SELECT hol_date FROM vacholiday WHERE hol_date = @holDate1 OR hol_date = @holDate2 OR hol_date = @holDate3 OR hol_date = @holDate4 OR hol_date = @holDate5"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@holDate1", date1.Text)
        cmdSelect.Parameters.Add("@holDate2", date2.Text)
        cmdSelect.Parameters.Add("@holDate3", date3.Text)
        cmdSelect.Parameters.Add("@holDate4", date4.Text)
        cmdSelect.Parameters.Add("@holDate5", date5.Text)
        rsEmp = cmdSelect.ExecuteReader()
		'FILL IN THE FIELDS
		If rsEmp.HasRows Then
			While rsEmp.Read()
				If rsEmp("hol_date") = date1.Text Then
					'status1.Items.Clear()
					'status1.Items.Add("H")
					status1.Text = "H"
				Else If rsEmp("hol_date") = date2.Text Then
					'status2.Items.Clear()
					'status2.Items.Add("H")
					status2.Text = "H"
				Else If rsEmp("hol_date") = date3.Text Then
					'status3.Items.Clear()
					'status3.Items.Add("H")
					status3.Text = "H"
				Else If rsEmp("hol_date") = date4.Text Then
					'status4.Items.Clear()
					'status4.Items.Add("H")
					status4.Text = "H"
				Else If rsEmp("hol_date") = date5.Text Then
					'status5.Items.Clear()
					'status5.Items.Add("H")
					status5.Text = "H"
				End If
			End While
        End If
        conMISC.Close()
	End Function
	
	Function PopDates() 
		date1.Text = DateAdd("d", -4, weekEnd)
		date2.Text = DateAdd("d", -3, weekEnd)
		date3.Text = DateAdd("d", -2, weekEnd)
		date4.Text = DateAdd("d", -1, weekEnd)
		date5.Text = weekEnd
	End Function

	Sub First_Click(sender As Object, e As EventArgs)
		hiddenDay.Text = "0"
		call GetWeekData(weeks(CInt(hiddenDay.Text)))
	End Sub
	
	Sub Prev_Click(sender As Object, e As EventArgs)
		If CInt(hiddenDay.Text) > 0 Then 
			hiddenDay.Text = CInt(hiddenDay.Text) - 1
		End If
		call GetWeekData(weeks(CInt(hiddenDay.Text)))
	End Sub
	
	Sub Next_Click(sender As Object, e As EventArgs)
		If CInt(hiddenDay.Text) < (weeks.Count - 1) Then 
			hiddenDay.Text = CInt(hiddenDay.Text) + 1
		End If
		call GetWeekData(weeks(CInt(hiddenDay.Text)))		
	End Sub
	
	Sub Last_Click(sender As Object, e As EventArgs)
		hiddenDay.Text = weeks.Count - 1
		call GetWeekData(weeks(CInt(hiddenDay.Text)))
	End Sub
	
</script>
<HTML>
<HEAD>
<BODY>
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

#legendBox {
width: 160px;
height: 158px;
float: left;
margin: 0px 20px 0px 10px;
border: 2px inset gray;
padding: 0px 0px 0px 6px;
}

span.legend {
font-size: 9px;
line-height:22px;
font-family: Verdana;
}

#mainBox {
width: 280px;
height: 158px;
margin: 0px 0px 0px 0px;
float: left;
padding:1px 0px 1px 2px;
border: 2px inset Gray;
align: center;
line-height: 3px;
}

#mainButtons {
width: 110px;
height: 60px;
margin: 0px 0px 0px 10px;
float: left;
}

#inputDate{
float: right;
margin: 0px 4px 0px 0px;
padding: 1px 0px 10px 0px;
}

p {
line-height: 4px;
margin: 0px 0px 6px 0px;
padding: 0px 0px 0px 0px;
}

#msg {
clear:both;
font-size: 12px;
font-weight: bold;
}

.mainTextBox {
text-align: center;
}

#pageBar {
text-align: center;
width: 100%;
}

#calLink {
top:2px;
left:4px;
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
			<center><font size="3"><b>Annual Leave - Browse Weeks</b></font></center><br><br>
			<font size="2"><center>Emp. Name: <u><asp:Label id="lblEmpName" runat="server"></asp:Label></u>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Emp. No.: <u><asp:Label id="lblEmpNo" runat="server"></asp:Label></u>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Week Ending: <u><asp:Label id="lblWeekEnding" runat="server"></asp:Label></u></center></font>
			<form id="ALMain" runat="server">
				<br>
				<div id="legendBox">
					<span class="legend">P = Present</span><br>
					<span class="legend">AL = Annual Leave</span><br>
					<span class="legend">&#189;A = &#189; Day Annual Leave</span><br>
					<span class="legend">S = Sick</span><br>
					<span class="legend">&#189;S = &#189; Day Sick Leave</span><br>
					<span class="legend">H = Holiday</span><br>
					<span class="legend">O = Other</span><br>
				</div>
				<div id="mainBox">
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Day</asp:TextBox>
					<asp:TextBox width="88px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Date</asp:TextBox>
					<asp:TextBox width="88px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Status</asp:TextBox>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Monday</asp:TextBox>
					<asp:TextBox width="88px" id="date1" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:TextBox width="90px" id="status1" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Tuesday</asp:TextBox>
					<asp:TextBox width="88px" id="date2" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:TextBox width="90px" id="status2" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Wednesday</asp:TextBox>
					<asp:TextBox width="88px" id="date3" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:TextBox width="90px" id="status3" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Thursday</asp:TextBox>
					<asp:TextBox width="88px" id="date4" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:TextBox width="90px" id="status4" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Friday</asp:TextBox>
					<asp:TextBox width="88px" id="date5" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:TextBox width="90px" id="status5" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>					
				</div>
				<div id="mainButtons">
					<INPUT type="BUTTON" onClick="window.location.href='annualLeaveSuper.aspx'" style="width:100px;height:35px; margin:0px 0px 4px 0px;" value="Back">
				</div>
			<div id="msg">
				<br><br>
				<center><asp:Label id="msgLbl" runat="server" ForeColor="Red"></asp:Label></center>
				<BR>
			</div>
			<div id="pageBar">
					<asp:Button id="first" onclick="First_Click" runat="server" Width="60px" height="25px" Text="<< First"></asp:Button>
					&nbsp;<asp:Button id="prev" onclick="Prev_Click" runat="server" Width="60px" height="25px" Text="< Prev"></asp:Button>
					&nbsp;<asp:TextBox id="pages" runat="server" width="170px" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:TextBox id="hiddenDay" runat="server" Visible="False"></asp:TextBox>
					&nbsp;<asp:Button id="next" onclick="Next_Click" runat="server" Width="60px" height="25px" Text="Next >"></asp:Button>&nbsp;
					<asp:Button id="last" onclick="Last_Click" runat="server" Width="60px" height="25px" Text="Last >>"></asp:Button>
					<BR>			
			</div>
			<BR>
			<div id="bottomText">
				<center><asp:Label id="bottomLbl" runat="server"></asp:Label></center>
			</div>
			</form>
		</div>
	</div>
</div>
</BODY>
</HEAD>