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
Dim monthData(30) As String
Dim holidays(30) As String
Dim superDuper As Boolean
		
    Sub Page_Load
	    If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	    Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	    End If	
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
		If current.Text = "" Then
			current.Text = DateValue(Now)
		End If
	    If Session("EmpNo") Is DBNull.Value Then
		    dept_no = ""
	    Else If(Session("EmpNo") = 0) Then
		    dept_no = ""
		Else
			emp_no = Session("EmpNo")
			Call GetDept()
	    End If
		If emp_no = "1065" Or emp_no = "1200" Or emp_no = "1600" Or emp_no = "2030" Then
			superDuper = True
		End If		
		showYear.Text = Year(current.Text)
	End Sub
	
	Function GetDept()	
        conMISC.Open()   
		strSQL = "select emp_no, dept_no, emp_name, date_hired, allotted_leave, leave_taken, user_name, carry_over, supervisor from vacmast where emp_no = @empNo and term_date is null"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
		If rsEmp.HasRows Then
			dept_no = rsEmp("dept_no")
		End If
		conMISC.Close()
	End Function
	
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

	Function Calendar(ByVal today As Date) As String
		Dim todays_day, todays_month, todays_year, first_week_day, days_in_this_month As Integer
		Dim week_day_counter, week_day, day_counter, now_day, now_month, now_year As Integer
		
		'Calendar = today
		todays_day = Day(today)
		todays_month = Month(today)
		todays_year = Year(today)
		
		now_day = Day(Now)
		now_month = Month(Now)
		now_year = Year(Now)
		
		Call GetMonthData(today)
		
		'Use MonthName() function to get the full name of the month
		
		Dim this_month, next_month As Date
		
		this_month = DateSerial(todays_year, todays_month, 1)
		next_month = DateAdd("m", 1, this_month)
		'Calendar = next_month
		
		first_week_day = Weekday(this_month) - 1
		'Calendar = first_week_day
		days_in_this_month = DateDiff("d", this_month, next_month)
		'Calendar = days_in_this_month
		
		Dim cal_html As String
		
		'Set up the Calendar heading with month and year
		cal_html = "<table cellpadding='0px' cellspacing='0px' class='calTable'>"
		cal_html = cal_html & "<tr><td colspan='7' align='center' class='monthName'>"
		cal_html = cal_html & MonthName(todays_month) & " " & todays_year & "</td></tr>"
		
		cal_html = cal_html & "<tr>"
		
		For day_counter = 1 To 7
			If day_counter = 1 Then
				cal_html = cal_html & "<td class='dayNamesL'>" & WeekdayName(day_counter) & "</td>"
			Else
				cal_html = cal_html & "<td class='dayNames'>" & WeekdayName(day_counter) & "</td>"
			End If
		Next

		cal_html = cal_html & "</tr>"
		
		cal_html = cal_html & "<tr>"
		
		'Fill in days
		
		'Account for blank cells at the beginning
		For week_day_counter = 0 To first_week_day - 1
			If week_day_counter = 0 Then
				cal_html = cal_html & "<td class='blankCellL'>&nbsp;</td>"
			Else
				cal_html = cal_html & "<td class='blankCell'>&nbsp;</td>"
			End If
		Next
		
		week_day = first_week_day
		
		'Start filling in days
		For day_counter = 1 To days_in_this_month
			week_day = week_day Mod 7
			
			
			If week_day = 0 AND Not(day_counter = 1) Then
				cal_html = cal_html & "</tr><tr>"
			End If
			
			'Current Day
			If now_day = day_counter And now_month = todays_month And now_year = todays_year Then
				If week_day = 0 Then
					cal_html = cal_html & "<td class='todayL' align='center'>"
				Else
					cal_html = cal_html & "<td class='today' align='center'>"
				End If
				cal_html = cal_html & "<table cellpadding='0px' cellspacing='0px' class='dayTable' width='100%' height='100%'>"
				If week_day = 0 Or week_day = 6 Then
					cal_html = cal_html & "<tr><td class='todaydayNumWE'>" & day_counter & "</td></tr>"
					cal_html = cal_html & "<tr><td class='todaydayCellWE'>&nbsp;</td></tr>"
				Else
					cal_html = cal_html & "<tr><td class='todaydayNum'>" & day_counter & "</td></tr>"
					cal_html = cal_html & "<tr><td class='todaydayCell'><div class='dayText'>" & monthData(day_counter - 1) & "</div></td></tr>"			
				End If
				cal_html = cal_html & "</table>"
				cal_html = cal_html & "</td>"
			Else
				If week_day = 0 Then
					cal_html = cal_html & "<td class='otherDayL' align='center'>"
				Else
					cal_html = cal_html & "<td class='otherDay' align='center'>"
				End If
				cal_html = cal_html & "<table cellpadding='0px' cellspacing='0px' class='dayTable' width='100%' height='100%'>"
				If week_day = 0 Or week_day = 6 Then
					cal_html = cal_html & "<tr><td class='dayNumWE'>" & day_counter & "</td></tr>"
					cal_html = cal_html & "<tr><td class='dayCellWE'>&nbsp;</td></tr>"
				Else
					cal_html = cal_html & "<tr><td class='dayNum'>" & day_counter & "</td></tr>"
					If holidays(day_counter - 1) = "True" Then
						cal_html = cal_html & "<tr><td class='dayCellHol'><div class='dayText'>" & monthData(day_counter - 1) & "</div></td></tr>"
					Else
						cal_html = cal_html & "<tr><td class='dayCell'><div class='dayText'>" & monthData(day_counter - 1) & "</div></td></tr>"					
					End If
				End If
				cal_html = cal_html & "</table>"
				cal_html = cal_html & "</td>"
			End If
			
			week_day = week_day + 1
		Next
		
		'Account for blank cells at the end
		While week_day < 7 
			cal_html = cal_html & "<td class='blankCell'>&nbsp;</td>"
			week_day = week_day + 1
		End While
		
		cal_html = cal_html & "</tr>"
		cal_html = cal_html & "</table>"
		
		Calendar = cal_html
		
	End Function
	
	Function GetMonthData(ByVal tempDate As Date)
		Dim this_month, next_month As Date
		this_month = DateSerial(Year(tempDate), Month(tempDate), 1)
		next_month = DateAdd("m", 1, this_month)
		Dim sideKick as Boolean
		sideKick = IsSuper()
		
		'GET ALL OF THE ANNUAL LEAVE FOR THE MONTH
		conMISC.Open() 
		strSQL = "SELECT vr.emp_no, vr.begin_date, vr.end_date, vr.status, vr.total_days, emp.email FROM vacrequest AS vr INNER JOIN employees AS emp ON vr.emp_no = emp.emp_no WHERE (vr.begin_date < @nextMonth) AND (vr.end_date >= @thisMonth) AND (vr.approved = 'Y')"
		If Not superDuper Then
			If sideKick Then
				strSQL = strSQL & " AND (vr.dept_no = @deptNo)"
			Else
				strSQL = strSQL & " AND (vr.emp_no = @empNo)"
			End If
		End If
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@thisMonth", this_month)
        cmdSelect.Parameters.Add("@nextMonth", next_month)
		If Not superDuper Then
			If sideKick Then
				cmdSelect.Parameters.Add("@deptNo", dept_no)	
			Else
				cmdSelect.Parameters.Add("@empNo", emp_no)
			End If
		End If
        rsEmp = cmdSelect.ExecuteReader()

		If rsEmp.HasRows Then
			While rsEmp.Read()
				Dim nextDate as Date
				Dim tempDay as Integer
				nextDate = rsEmp("begin_date")
				While nextDate <= rsEmp("end_date")
					If Month(nextDate) = Month(tempDate) Then
						tempDay = Day(nextDate) - 1
						If monthData(tempDay) = "" Then
							If rsEmp("status") = "S" Then
								monthData(tempDay) = "# " & rsEmp("email")	
							Else
								monthData(tempDay) = rsEmp("email")
							End If
						Else
							If rsEmp("status") = "S" Then
								monthData(tempDay) = monthData(tempDay) & "<BR># " & rsEmp("email")
							Else
								monthData(tempDay) = monthData(tempDay) & "<BR>" & rsEmp("email")
							End If							
						End If
					End If
					nextDate = DateAdd("d", 1, nextDate)
				End While
			End While
		End If
		conMISC.Close()
		
		'GET ALL OF THE ANNUAL LEAVE HALF DAYS FOR THE MONTH
		conMISC.Open() 
		strSQL = "SELECT vr.emp_no, vr.begin_date, vr.end_date, vr.status, vr.total_days, emp.email FROM vacrequest AS vr INNER JOIN employees AS emp ON vr.emp_no = emp.emp_no WHERE (vr.begin_date < @nextMonth) AND (vr.begin_date >= @thisMonth) AND (vr.end_date IS NULL) AND (vr.approved = 'Y')"
		If Not superDuper Then
			If sideKick Then
				strSQL = strSQL & " AND (vr.dept_no = @deptNo)"
			Else
				strSQL = strSQL & " AND (vr.emp_no = @empNo)"
			End If
		End If		
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@thisMonth", this_month)
        cmdSelect.Parameters.Add("@nextMonth", next_month)
		If Not superDuper Then
			If sideKick Then
				cmdSelect.Parameters.Add("@deptNo", dept_no)	
			Else
				cmdSelect.Parameters.Add("@empNo", emp_no)
			End If
		End If
        rsEmp = cmdSelect.ExecuteReader()

		If rsEmp.HasRows Then
			While rsEmp.Read()
				Dim nextDate as Date
				Dim tempDay as Integer
				nextDate = rsEmp("begin_date")
				tempDay = Day(nextDate) - 1
				If rsEmp("total_days") < 1 Then
					If monthData(tempDay) = "" Then
						If rsEmp("status") = "S" Then
							monthData(tempDay) = "#&#189; " & rsEmp("email")
						Else
							monthData(tempDay) = "&#189; " & rsEmp("email")
						End If
					Else
						If rsEmp("status") = "S" Then
							monthData(tempDay) = monthData(tempDay) & "<BR>#&#189; " & rsEmp("email")
						Else
							monthData(tempDay) = monthData(tempDay) & "<BR>&#189; " & rsEmp("email")
						End If							
					End If
				Else
					If monthData(tempDay) = "" Then
						If rsEmp("status") = "S" Then
							monthData(tempDay) = "# " & rsEmp("email")
						Else
							monthData(tempDay) = rsEmp("email")
						End If
					Else
						If rsEmp("status") = "S" Then
							monthData(tempDay) = monthData(tempDay) & "<BR># " & rsEmp("email")
						Else
							monthData(tempDay) = monthData(tempDay) & "<BR>" & rsEmp("email")
						End If							
					End If			
				End If
			End While
		End If
		conMISC.Close()
		
		'GET ALL OF THE HOLIDAYS AND REPLACE EXISTING DATA
        conMISC.Open()   
		strSQL = "SELECT hol_date, hol_name FROM vacholiday WHERE hol_date >= @thisMonth AND hol_date < @nextMonth"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@thisMonth", this_month)
        cmdSelect.Parameters.Add("@nextMonth", next_month)
        rsEmp = cmdSelect.ExecuteReader()
		If rsEmp.HasRows Then
			While rsEmp.Read()
				monthData(Day(rsEmp("hol_date")) - 1) = rsEmp("hol_name")
				holidays(Day(rsEmp("hol_date")) - 1) = "True"
			End While
		End If
		conMISC.Close()
	End Function
	
	Sub Jan_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 1, 1)
	End Sub
	
	Sub Feb_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 2, 1)	
	End Sub
	
	Sub Mar_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 3, 1)	
	End Sub

	Sub Apr_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 4, 1)	
	End Sub

	Sub May_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 5, 1)	
	End Sub

	Sub Jun_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 6, 1)	
	End Sub

	Sub Jul_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 7, 1)	
	End Sub

	Sub Aug_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 8, 1)	
	End Sub

	Sub Sep_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 9, 1)	
	End Sub

	Sub Oct_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 10, 1)	
	End Sub

	Sub Nov_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 11, 1)	
	End Sub

	Sub Dec_Click(sender As Object, e As EventArgs)
		current.Text = DateSerial(Year(current.Text), 12, 1)	
	End Sub
	
	Sub Up_Year_Click(sender As Object, e As EventArgs)
		current.Text = DateAdd("yyyy", 1, DateValue(current.Text))
		showYear.Text = Year(current.Text)
	End Sub
	
	Sub Down_Year_Click(sender As Object, e As EventArgs)
		current.Text = DateAdd("yyyy", -1, DateValue(current.Text))	
		showYear.Text = Year(current.Text)
	End Sub
	
</script>
<HTML>
<HEAD>
<BODY>
<TITLE>Southern Mutual Church Insurance Company - Annual Leave</TITLE>
<STYLE type=text/css media="all">
.calTable {
padding: 0px;
margin: 0px;
background-color: #e0e0e0;
width: 610px;
table-layout:fixed;
}

.dayNames {
padding: 0px;
margin: 0px;
border-left: 0px solid gray;
border-top: 1px outset gray;
border-right: 1px outset gray;
border-bottom: 1px outset gray;
text-align: center;
width: 14%;
}

.dayNamesL {
padding: 0px;
margin: 0px;
border-left: 1px solid gray;
border-top: 1px outset gray;
border-right: 1px outset gray;
border-bottom: 1px outset gray;
text-align: center;
width: 14%;
}

.today {
padding: 0px;
margin: 0px;
}

.otherDay {
padding: 0px;
margin: 0px;
}

.dayTable {
padding: 0px;
margin: 0px;
border:0px 0px 0px 0px;
table-layout: fixed;
}

.dayNum, .dayNumWE, .todaydayNum, .todaydayNumWE {
padding: 0px;
margin: 0px;
border-left:0px solid white;
border-top: 0px;
border-right: 0px;
text-align: center;
font-size: 9px;
font-weight: bold;
background-color: #d0d0d0;
}

.dayNum {
border-bottom: 1px solid gray;
}

.dayNumWE {
border-bottom: 1px outset gray;
background-color: gray;
}

.todaydayNum {
border-bottom: 1px solid gray;
background-color: #88b4ea;
}

.todaydayNumWE {
border-bottom: 1px outset gray;
background-color: #88b4ea;
}

.dayCell, .todaydayCell, .dayCellHol {
border: 0px 0px 0px 0px;
margin: 0px;
height: 44px;
}

.dayCellHol {
background-color: #CD5555;
}

.dayText {
height: 100%;
width: 100%;
margin: 0px 0px 0px 0px;
padding: 0px 0px 0px 0px;
overflow: auto;
word-wrap: break-word;
font-size: 10px;
font-family: Arial;
}

.dayCellWE, .todaydayCellWE {
border: 0px 0px 0px 0px;
padding: 0px;
margin: 0px;
background-color: gray;
height: 44px;
}

.todaydayCell {
background-color: #98c4fa;
}

.todaydayCellWE {
background-color: #98c4fa;
}

.monthName {
border-left: 1px solid gray;
border-top: 1px solid gray;
border-right: 1px outset gray;
border-bottom: 0px outset gray;
font-weight: bold;
padding:2px;
font-size: 12px;
background-color: #d0d0d0;
}

.blankCell, .otherDay, .today {
border-left:0px solid gray;
border-top: 0px solid gray;
border-right: 1px outset gray;
border-bottom: 1px outset gray;
margin: 0px;
padding: 0px;
}

.otherDayL, .blankCellL, .todayL {
border-left: 1px solid gray;
border-top: 0px solid gray;
border-right: 1px outset gray;
border-bottom: 1px outset gray;
margin: 0px;
padding: 0px;
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
margin: 0px 0px 0px 88px;
float: left;
overflow: scroll;
}

#mainButtons {
width: 140px;
height: 240px;
margin: 0px 0px 0px 20px;
float: left;
}

p {
line-height: 4px;
margin: 0px 0px 6px 0px;
padding: 0px 0px 0px 0px;
}

#cal {
text-align: center;
margin:0px;
padding:0px;
line-height: 10px;
}

#months {
text-align: center;
margin:4px 0px 0px 0px;
padding:0px 0px 0px 0px;
line-height: 10px;
height: 50px;
}

#monthL {
float: left;
padding: 0px 0px 0px 26px;
}

#yearShow {
float: left;
width: 60px;
margin: 12px 0px 0px 0px;
padding: 0px 0px 0px 28px;
}

#yearChange {
float: left;
width: 40px;
}
</STYLE>
<div id="scmidout2">
	<div id="scmid">
		<div class="scrollmid">
	<div id="cal">
		<% Response.Write(Calendar(current.Text)) %>
	</div>
	<div id="months">
		<form runat="server">
			<div id="monthL">
				<asp:TextBox id="current" Visible="False" runat="server"></asp:TextBox>
				<asp:Button id="jan" onClick="Jan_Click" runat="Server" Text="January" width="70px"></asp:Button>
				<asp:Button id="feb" onClick="Feb_Click" runat="Server" Text="February" width="70px"></asp:Button>
				<asp:Button id="mar" onClick="Mar_Click" runat="Server" Text="March" width="70px"></asp:Button>
				<asp:Button id="apr" onClick="Apr_Click" runat="Server" Text="April" width="70px"></asp:Button>
				<asp:Button id="may" onClick="May_Click" runat="Server" Text="May" width="70px"></asp:Button>
				<asp:Button id="jun" onClick="Jun_Click" runat="Server" Text="June" width="70px"></asp:Button>
				<BR>
				<asp:Button id="jul" onClick="Jul_Click" runat="Server" Text="July" width="70px"></asp:Button>
				<asp:Button id="aug" onClick="Aug_Click" runat="Server" Text="August" width="70px"></asp:Button>
				<asp:Button id="sep" onClick="Sep_Click" runat="Server" Text="September" width="70px"></asp:Button>
				<asp:Button id="oct" onClick="Oct_Click" runat="Server" Text="October" width="70px"></asp:Button>
				<asp:Button id="nov" onClick="Nov_Click" runat="Server" Text="November" width="70px"></asp:Button>
				<asp:Button id="dec" onClick="Dec_Click" runat="Server" Text="December" width="70px"></asp:Button>
			</div>
			<div id="yearShow">
				<asp:TextBox id="showYear" style="TEXT-ALIGN: center" runat="server" ReadOnly="True" width="50px"></asp:TextBox>
			</div>
			<div id="yearChange">
				<asp:Button id="upYear" style="font-size: 18px" runat="server" width="20px" height="24px" onClick="Up_Year_Click" Text="&uArr;"></asp:Button>
				<BR>
				<asp:Button id="downYear" style="font-size: 18px" runat="server" width="20px" height="24px" onClick="Down_Year_Click" Text="&dArr;"></asp:Button>
			</div>
		</form>
	</div>
		</div>
	</div>
</div>
</BODY>
</HEAD>