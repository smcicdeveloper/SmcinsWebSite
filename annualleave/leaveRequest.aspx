<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Web.Mail" %>
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
Dim user_name as String
Dim full_name as String
Dim supervisor as String
Dim holidays as New ArrayList()
Dim holidayNames as New ArrayList()
Dim superDuper As Boolean
		
    Sub Page_Load
	    If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	    Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	    End If
		emp_no = Session("EmpNo")	
		'emp_no = "9999"
		superDuper = False
        If emp_no = "1065" Then
            superDuper = True
        End If
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
		call PopulateMainInfo()
		msgLblBegin.Visible = False
		msgBegin.Visible = False
		msgLblEnd.Visible = False
		msgEnd.Visible = False
		msgLblDays.Visible = False
		msgDays.Visible = False
		submitButton.Visible = False
		msgLblBus.Visible = False
		call GetHolidays()
	End Sub
	
	Function GetHolidays()
        conMISC.Open()   
		strSQL = "SELECT * FROM vacholiday"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        rsEmp = cmdSelect.ExecuteReader()
		If rsEmp.HasRows Then
			While rsEmp.Read()
				holidays.Add(rsEmp("hol_date"))
				holidayNames.Add(rsEmp("hol_name"))
			End While
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
	
	Function PopulateMainInfo()	
        conMISC.Open()   
		strSQL = "select emp_no, dept_no, user_name, supervisor from vacmast where emp_no = @empNo and term_date is null"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
        
		'UPDATE VARIABLES
		If rsEmp.HasRows then
			dept_no = rsEmp("dept_no")
			user_name = rsEmp("dept_no")
			supervisor = rsEmp("supervisor")
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
        lblEmpName.Text = full_name
		lblEmpNo.Text = emp_no
	End Function
	
	Function GetWeekData(subWeek as String, type as Integer)
		Try
			FormatDateTime(subWeek, 2)
		Catch
				Dim errScript As string
				If type = 1 Then
					errScript = "<script language=javascript>" & "window.alert ('BBegin date is not formatted correctly.\n(mm/dd/yyyy)');" & "<" & "/script>"
				Else
					errScript = "<script language=javascript>" & "window.alert ('EEnd date is not formatted correctly.\n(mm/dd/yyyy)');" & "<" & "/script>"				
				End If
				RegisterStartupScript("Error", errScript)
				GetWeekData = "BAD"
				Exit Function
		End Try
		
		If Weekday(subWeek) = "1" then
			Dim errScript As string
			If type = 1 Then
				errScript = "<script language=javascript>" & "window.alert ('The Begin date is a Sunday.\nPlease enter a weekday date.');" & "<" & "/script>"
			Else
				errScript = "<script language=javascript>" & "window.alert ('The End date is a Sunday.\nPlease enter a weekday date.');" & "<" & "/script>"
			End If
			RegisterStartupScript("Error", errScript)
			GetWeekData = "BAD"
			Exit Function					
		End If
		If Weekday(subWeek) = "7" then
			Dim errScript As string
			If type = 1 Then
				errScript = "<script language=javascript>" & "window.alert ('The Begin date is a Saturday.\nPlease enter a weekday date.');" & "<" & "/script>"
			Else
				errScript = "<script language=javascript>" & "window.alert ('The End date is a Saturday.\nPlease enter a weekday date.');" & "<" & "/script>"
			End If
			RegisterStartupScript("Error", errScript)
			GetWeekData = "BAD"
			Exit Function					
		End If
	End Function
	
	Sub Accept_Click(sender As Object, e As EventArgs)
		Dim errScript As string
		Dim totalDays As Double
		Dim isHol As Boolean
		isHol = False
		endMsg.Visible = False
		Try
			If Not GetWeekData(beginDateTB.Text, 1) Is "BAD" Then
				beginDateTB.Text = FormatDateTime(beginDateTB.Text, 2)
				If halfDayCheck.Checked Then
					Dim j As Integer
					j = 0
					While j < holidays.Count
						If DateValue(beginDateTB.Text) = DateValue(holidays(j)) Then
							isHol = True
							Exit While
						End If
						j = j + 1
					End While
					If isHol Then
						errScript = "<script language=javascript>" & "window.alert ('" & beginDateTB.Text & " is " & holidayNames(j) & "');" & "<" & "/script>"
						RegisterStartupScript("Error", errScript)					
					Else
						totalDays = 0.5
						msgLblBegin.Text = "Begin Date:"
						msgBegin.Text = beginDateTB.Text
						br1.Visible = True
						br2.Visible = False
						msgLblBegin.Visible = True
						msgBegin.Visible = True
						msgLblDays.Visible = True
						msgDays.Visible = True
						msgLblEnd.Visible = False
						msgEnd.Visible = False
						msgEnd.Text = ""
						msgLblDays.Text = "Total Days:"
						msgDays.Text = totalDays
						If busCheck.Checked Then
							msgLblBus.Visible = True
							msgLblBus.Text = "Business Related"
						Else
							msgLblBus.Visible = False
							msgLblBus.Text = ""
						End If
						submitButton.Visible = True
					End If
				Else
					If Not GetWeekData(endDateTB.Text, 2) Is "BAD" Then
						endDateTB.Text = FormatDateTime(endDateTB.Text, 2)
						If DateValue(beginDateTB.Text) > DateValue(endDateTB.Text) Then
							errScript = "<script language=javascript>" & "window.alert ('The Begin date cannot be after the End date.');" & "<" & "/script>"
							RegisterStartupScript("Error", errScript)					
						Else
							totalDays = CalculateDays(beginDateTB.Text, endDateTB.Text)
							msgLblBegin.Text = "Begin Date:"
							msgBegin.Text = beginDateTB.Text
							br1.Visible = True
							br2.Visible = True
							msgLblBegin.Visible = True
							msgBegin.Visible = True
							msgLblDays.Visible = True
							msgDays.Visible = True
							msgLblEnd.Visible = True
							msgEnd.Visible = True
							msgLblEnd.Text = "End Date:"
							msgEnd.Text = endDateTB.Text
							msgLblDays.Text = "Total Days:"
							msgDays.Text = totalDays
							If busCheck.Checked Then
								msgLblBus.Visible = True
								msgLblBus.Text = "Business Related"
							Else
								msgLblBus.Visible = False
								msgLblBus.Text = ""
							End If
							submitButton.Visible = True
						End If
					End If			
				End If
			End If
		Catch
			errScript = "<script language=javascript>" & "window.alert ('Date is not the current year\nor is not formatted correctly.\n(mm/dd/yyyy)');" & "<" & "/script>"
			RegisterStartupScript("Error", errScript)
		End Try
	End Sub
	
	Sub halfDayCheck_Changed(sender As Object, e As EventArgs)
		endMsg.Visible = False
		Dim errScript As string
		If halfDayCheck.Checked Then
			endDateTB.Text = ""
			endDateTB.BackColor = System.Drawing.Color.FromName("#e0e0e0")	
			endDateTB.Enabled = False
		Else
			endDateTB.Text = ""
			endDateTB.BackColor = System.Drawing.Color.FromName("WHITE")
			endDateTB.Enabled = True		
		End If
	End Sub
	
	Function CalculateDays(beginDate As String, endDate As String)
		Dim tempDays As Integer 
		Dim totalDays As Integer
		Dim i As Integer
		Dim isIn as Boolean
		Dim k As Integer
		tempDays = DateDiff("d", beginDate, endDate)
		totalDays = 0
		i = 0
		isIn = False
		While i <= tempDays
			If Not(WeekDay(DateAdd("d", i, beginDate)) = 1) Then
				If Not(WeekDay(DateAdd("d", i, beginDate)) = 7) Then
						k = 0
						While k < holidays.Count
							If DateAdd("d", i, beginDate) = DateValue(holidays(k)) Then
								isIn = True
							End If
							k = k + 1
						End While
						If Not isIn Then
						    totalDays = totalDays + 1
						End If
				Else
				End If
			Else
			End If
			isIn = False
			i = i + 1
		End While
		CalculateDays = totalDays
	End Function

	Sub Submit_Click(sender As Object, e As EventArgs)
			Dim sideKick as Boolean
			sideKick = IsSuper()
			conMISC.Open()
			strSQL = "INSERT into vacrequest (emp_no, dept_no, begin_date, end_date, total_days, approved, status) VALUES"
		    strSQL = strSQL & " (@empNo, @deptNo, @beginDate, @endDate, @totalDays, @approved, @status)"
			cmdInsert = New SqlCommand(strSQL, conMISC)
		    cmdInsert.Parameters.Add("@empNo", emp_no)
		    cmdInsert.Parameters.Add("@deptNo", dept_no)
		    cmdInsert.Parameters.Add("@beginDate", msgBegin.Text)
			If msgEnd.Text = "" Then
				cmdInsert.Parameters.Add("@endDate", DBNull.Value)
			Else
				cmdInsert.Parameters.Add("@endDate", msgEnd.Text)
			End If
		    cmdInsert.Parameters.Add("@totalDays", CDec(msgDays.Text))
		    If superDuper Then
				cmdInsert.Parameters.Add("@approved", "Y")
			Else
				cmdInsert.Parameters.Add("@approved", "N")
			End If
			If msgLblBus.Text = "Business Related" Then
				cmdInsert.Parameters.Add("@status", "B")
			Else
				cmdInsert.Parameters.Add("@status", "A")
			End If
	        cmdInsert.ExecuteNonQuery()						 
		    conMISC.Close()	
			
			submitButton.Visible = False
			endMsg.Visible = True
			endMsg.Text = "<BR><BR>Annual Leave Request has been submitted."
		    
			If Not SuperDuper Then
				Dim EMailBody, EmailFrom, EmailTo, FirstName as String			
				
				conMISC.Open()
            If emp_no = "1090" Or emp_no = "1200" Or emp_no = "1520" Or emp_no = "2070" Or emp_no = "2505" Then
                strSQL = "SELECT first_name, email FROM employees WHERE emp_no = @empNo"
                cmdSelect = New SqlCommand(strSQL, conMISC)
                cmdSelect.Parameters.Add("@empNo", 1065)
            ElseIf emp_no = "2030" Or emp_no = "3050" Or emp_no = "3550" Or emp_no = "4120" Then
                strSQL = "SELECT first_name, email FROM employees WHERE emp_no = @empNo"
                cmdSelect = New SqlCommand(strSQL, conMISC)
                cmdSelect.Parameters.Add("@empNo", 1200)
            Else
                strSQL = "SELECT first_name, email FROM employees WHERE dept_no = @deptNo AND supervisor = @super"
                cmdSelect = New SqlCommand(strSQL, conMISC)
                cmdSelect.Parameters.Add("@deptNo", dept_no)
                cmdSelect.Parameters.Add("@super", "Y")
            End If
				rsEmp = cmdSelect.ExecuteReader()
				rsEmp.Read()
				If rsEmp.HasRows Then
					EmailTo = rsEmp("email")
					EmailTo = EmailTo & "@smcins.com"
					FirstName = rsEmp("first_name")
				End If
				conMISC.Close()
				
				conMISC.Open()
				strSQL = "SELECT email FROM employees WHERE emp_no = @empNo" 
				cmdSelect = New SqlCommand(strSQL, conMISC)
				cmdSelect.Parameters.Add("@empNo", emp_no)
				rsEmp = cmdSelect.ExecuteReader()
				rsEmp.Read()
				If rsEmp.HasRows Then
					EmailFrom = rsEmp("email")
					EmailFrom = EmailFrom & "@smcins.com"
				End If
				conMISC.Close()
				
			  EmailBody = FirstName & ", " & vbCrLf & vbCrLf
			  EMailBody = EmailBody & full_name & " has requested annual leave on the following day(s): " & vbCrLf & vbCrLf
			  EMailBody = EMailBody & "Begin Date: " & msgBegin.Text & vbCrLf
			  If Not(msgEnd.Text = "") Then
				EMailBody = EMailBody & "End Date: " & msgEnd.Text & vbCrLf
			  End If
			  EMailBody = EMailBody & "Total Days: " & CDec(msgDays.Text) & vbCrLf
			  If msgLblBus.Text = "Business Related" Then
				EMailBody = EMailBody & "Business Related" & vbCrLf
			  End If
			  
			  try
				  Dim message As New MailMessage()
				  message.To = EmailTo
				  message.From = EmailFrom
				  message.Subject = "** Annual Leave Requested **"
				  message.Body = EMailBody
				  'message.Headers.Add("Disposition-Notification-To", EmailFrom)
				  SmtpMail.SmtpServer = "10.0.0.1"
				  SmtpMail.Send(message)
			  catch
				'Response.Write("Email Not Sent")
			  end try
			End If
	End Sub
	
</script>
<HTML>
<HEAD>
<BODY>
<TITLE>Southern Mutual Church Insurance Company - Annual Leave</TITLE>
<STYLE type=text/css media="all">
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

#mainButtons {
width: 110px;
height: 110px;
margin: 0px 140px 0px 10px;
float: right;
line-height: 14px;
}

#inputDate{
float: left;
margin: 0px 4px 0px 140px;
padding: 1px 0px 10px 0px;
line-height: 20px;
font-size: 12px;
}

p {
line-height: 4px;
margin: 0px 0px 6px 0px;
padding: 0px 0px 0px 0px;
}

#msg {
clear: both;
font-size: 12px;
font-weight: bold;
margin: 0px 0px 0px 200px;
}

#endMsgDiv {
font-size: 12px;
clear: both;
font-weight: bold;
}

.mainTextBox {
text-align: center;
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
			<center><font size="3"><b>Annual Leave Request</b></font></center><br>
			<font size="2">
			<center>
			Emp. Name: <u><asp:Label id="lblEmpName" runat="server"></asp:Label></u>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Emp. No.: <u><asp:Label id="lblEmpNo" runat="server"></asp:Label></u>
			</center></font>
			<form id="ALMain" runat="server">
				<BR>
				<BR>
				<div id="inputDate">
					<asp:Label style="float: left" runat="server" width="100px">Begin Date:</asp:Label><asp:TextBox id="beginDateTB" width="100px" style="width:100px;" runat="server" BackColor="#FFFFFF"></asp:TextBox><BR><BR>	
					<asp:Label style="float: left" runat="server" width="100px">End Date:</asp:Label><asp:TextBox id="endDateTB" width="100px" style="width:100px;" runat="server" BackColor="#FFFFFF"></asp:TextBox><BR><BR>
					<asp:Label style="float: left" runat="server" width="130px">&#189; Day</asp:Label><asp:CheckBox id="halfDayCheck" OnCheckedChanged="halfDayCheck_Changed" AutoPostBack="True" runat="server"></asp:CheckBox>
					<BR><BR>
					<asp:Label style="float: left" runat="server" width="130px">Flex Holiday/Company Related: </asp:Label><asp:CheckBox id="busCheck" runat="server"></asp:CheckBox>					
				</div>
				<div id="mainButtons">
					<asp:Button onClick="Accept_Click" runat="server" style="width:100px;height:35px;" Width="100px" height="35px" Text="Accept"></asp:Button><BR><BR>
					<INPUT type="BUTTON" onClick="window.location.href='annualLeave.aspx'" style="width:100px;height:35px; margin:0px 0px 4px 0px;" value="Back">
				</div>
				<div id="endMsgDiv">
					<center><asp:Label id="endMsg" runat="server" ForeColor="Black"></asp:Label></center>
				</div>
				<div id="msg">
					<br>
					<asp:Label id="msgLblBegin" width="100px" style="float: left" runat="server" ForeColor="Black"></asp:Label><asp:Label id="msgBegin" style="width:100px;" width="100px" runat="server" ForeColor="Black"></asp:Label><asp:Label id="br1" runat="server" Text="<BR>"></asp:Label>
					<asp:Label id="msgLblEnd" width="100px" style="float: left" runat="server" ForeColor="Black"></asp:Label><asp:Label id="msgEnd" style="width:100px;" width="100px" runat="server" ForeColor="Black"></asp:Label><asp:Label id="br2" runat="server" Text="<BR>"></asp:Label>
					<asp:Label id="msgLblDays" width="100px" style="float: left" runat="server" ForeColor="Black"></asp:Label><asp:Label id="msgDays" width="100px" style="float: left" runat="server" ForeColor="Black"></asp:Label>
					<BR><asp:Label id="msgLblBus" width="140px" style="float: left" runat="server" ForeColor="Black"></asp:Label>
				</div>
				<BR><BR>
				<center><asp:Label id="msgLblNote" runat="server" Text="NOTE: You may take up to a maximum of two consecutive calendar weeks of Annual Leave, including company holidays."></asp:Label></center>
				<BR><BR>
				<center><asp:Button id="submitButton" onClick="Submit_Click" runat="server" style="width:100px;height:35px;" Width="100px" height="35px" Text="Submit"></asp:Button></center>
			</form>
		</div>
	</div>
</div>
</BODY>
</HEAD>