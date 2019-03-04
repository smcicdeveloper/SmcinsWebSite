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
Dim reqEmp_no As String
Dim req_no as String
Dim dept_no as String
Dim supervisor as String
Dim full_name as String
Dim chris As Boolean
		
    	Sub Page_Load
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
	   	 If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	   	 Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	   	 End If
       	 emp_no = Session("EmpNo")
        	'GetUserInfo()
		chris = False
		If emp_no = "2030" Then
			chris = True
		End If
		req_no = Request.QueryString("req_no")
		If Not IsPostBack Then
			GetRequestInfo()
		End If
		req_status2.Visible = False
		request_emp.Visible = False
		reqEmp_no = request_emp.Text
		update.Visible = False
		If chris Then
			GoChris()
		End If
  	End Sub

	Function GoChris() 
		assigned_to.ReadOnly = False
		req_notes.ReadOnly = False
		ec_date.ReadOnly = False
		date_completed.ReadOnly = False
		req_status.Visible = False
		req_status2.Visible = True
		update.Visible = True
		assigned_to.BorderWidth = new Unit("1px")
		assigned_to.BorderColor = System.Drawing.ColorTranslator.FromHtml("#CCDDFF")
		ec_date.BorderWidth = new Unit("1px")
		date_completed.BorderColor = System.Drawing.ColorTranslator.FromHtml("#CCDDFF")
		date_completed.BorderWidth = new Unit("1px")
		ec_date.BorderColor = System.Drawing.ColorTranslator.FromHtml("#CCDDFF")
	End Function

	Function GetRequestInfo()
	  conMISC.Open()		
	  strSQL = "select * from chgrequest where req_no = @reqNo"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@reqNo", req_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
     
		'UPDATE VARIABLES
		If rsEmp.HasRows then
			Try
				hard_soft.Text = CheckAbb(rsEmp("hard_soft"))
			Catch
			End Try
			Try
				soft_system.Text = rsEmp("soft_system")
			Catch
			End Try
			Try
				req_descr.Text = rsEmp("req_descr")
			Catch
			End Try
			Try
				req_level.Text = CheckAbb(rsEmp("req_level"))
			Catch
			End Try
			Try	
				date_needed.Text = rsEmp("date_needed") & " (" & DateDiff("d", DateValue(Now), rsEmp("date_needed")) & " days left)"
			Catch
			End Try
			Try
				req_status.Text = CheckAbb(rsEmp("req_status"))
				req_status2.SelectedValue = rsEmp("req_status")
			Catch
			End Try
			Try
				rept_date.Text = rsEmp("rept_date")
			Catch
			End Try
			Try
				assigned_to.Text = rsEmp("assigned_to")
			Catch
			End Try
			Try
				req_notes.Text = rsEmp("req_notes")
			Catch
			End Try
			Try
				If rsEmp("ec_date") = "1/1/1900" Then
					ec_date.Text = ""
				Else
					ec_date.Text = rsEmp("ec_date")
				End If
			Catch
			End Try
			Try
				If rsEmp("date_completed") = "1/1/1900" Then
					date_completed.Text = ""
				Else
					date_completed.Text = rsEmp("date_completed")
				End If
			Catch
			End Try
		else
           		'Response.Redirect("agents/denied.asp")
        end if		
		reqEmp_no = rsEmp("emp_no")	
		request_emp.Text = reqEmp_no
        conMISC.Close()

	  conMISC.Open()		
	  strSQL = "select first_name, last_name from employees where emp_no = @empNo"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", reqEmp_no)
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
		fullname.Text = full_name
	End Function

	Function CheckAbb(dataItem as Object, fieldName as String)
		Dim temp as string
		temp = dataItem(fieldName)
		If temp Is DBNull.Value Then
			CheckAbb = ""
		Else
			If temp = "H" Then
				CheckAbb = "Hardware"
				Exit Function
			Else If temp = "S" Then
				CheckAbb = "Software"
				Exit Function
			Else If temp = "N" Then
				CheckAbb = "Not Sure"
				Exit Function
			Else If temp = "C" Then
				CheckAbb = "Critical"
				Exit Function
			Else If temp = "I" Then
				CheckAbb = "Immediate"
				Exit Function
			Else If temp = "M" Then
				CheckAbb = "Moderate"
				Exit Function
			Else If temp = "L" Then
				CheckAbb = "Low"
				Exit Function
			Else If temp = "R" Then
				CheckAbb = "Reported"
				Exit Function
			Else If temp = "V" Then
				CheckAbb = "Reviewed"
				Exit Function
			Else If temp = "A" Then
				CheckAbb = "Assigned"
				Exit Function
			Else If temp = "P" Then
				CheckAbb = "In Progress"
				Exit Function
			Else If temp = "O" Then
				CheckAbb = "Completed"
				Exit Function
			End If
		End If
	End Function

	Function CheckAbb(temp as String)
		If temp Is DBNull.Value Then
			CheckAbb = ""
		Else
			If temp = "H" Then
				CheckAbb = "Hardware"
				Exit Function
			Else If temp = "S" Then
				CheckAbb = "Software"
				Exit Function
			Else If temp = "N" Then
				CheckAbb = "Not Sure"
				Exit Function
			Else If temp = "C" Then
				CheckAbb = "Critical"
				Exit Function
			Else If temp = "I" Then
				CheckAbb = "Immediate"
				Exit Function
			Else If temp = "M" Then
				CheckAbb = "Moderate"
				Exit Function
			Else If temp = "L" Then
				CheckAbb = "Low"
				Exit Function
			Else If temp = "R" Then
				CheckAbb = "Reported"
				Exit Function
			Else If temp = "V" Then
				CheckAbb = "Reviewed"
				Exit Function
			Else If temp = "A" Then
				CheckAbb = "Assigned"
				Exit Function
			Else If temp = "P" Then
				CheckAbb = "In Progress"
				Exit Function
			Else If temp = "O" Then
				CheckAbb = "Completed"
				Exit Function
			End If
		End If
	End Function

	Function GetUserInfo()	
	  conMISC.Open()		
	  strSQL = "select dept_no, supervisor, first_name, last_name from employees where emp_no = @empNo"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
     
		'UPDATE VARIABLES
		If rsEmp.HasRows then
			full_name = rsEmp("first_name")
			full_name = full_name & " "
			full_name = full_name & rsEmp("last_name")
			dept_no = rsEmp("dept_no")
			supervisor = rsEmp("supervisor")
		else
           		'Response.Redirect("agents/denied.asp")
        	end if		
        conMISC.Close()	
	End Function

	Function CheckDate(dataItem as Object, fieldName as String)
		if dataItem(fieldName) is DBNull.Value
			CheckDate = ""
		else
			CheckDate = dataItem(fieldName).ToShortDateString
		end if
	End Function

	Sub Update_Click(sender As Object, e As EventArgs)
		Dim err As Boolean
		err = 0
		If Not ec_date.Text = "" Then
			If Not CheckDate(ec_date.Text) Is "BAD" Then
				ec_date.Text = FormatDateTime(ec_date.Text, 2)
			Else
				err = 1
			End If
		End If
		If Not date_completed.Text = "" Then
			If Not CheckDate(date_completed.Text) Is "BAD" Then
				date_completed.Text = FormatDateTime(date_completed.Text, 2)
			Else
				err = 1
			End If
		End If
		If err Then
			JOut("Date is not in the correct format.")
		Else
			assigned_to.Text = Trim(assigned_to.Text)
			req_notes.Text = Trim(req_notes.Text)
		 	'UPDATE THE DATABASE RECORD
			conMISC.Open()	
			strSQL = "UPDATE chgrequest SET req_status = @reqStatus, assigned_to = @assignedTo, req_notes = @reqNotes, ec_date = @ecDate, date_completed = @dateCompleted "
			strSQL = strSQL & "WHERE req_no = @reqNo"
			cmdUpdate = New SqlCommand(strSQL, conMISC)
			cmdUpdate.Parameters.Add("@reqStatus", req_status2.SelectedItem.Value)
			cmdUpdate.Parameters.Add("@assignedTo", assigned_to.Text)
			cmdUpdate.Parameters.Add("@reqNotes", req_notes.Text)
			cmdUpdate.Parameters.Add("@ecDate", ec_date.Text)
			cmdUpdate.Parameters.Add("@dateCompleted", date_completed.Text)
			cmdUpdate.Parameters.Add("@reqNo", req_no)
			cmdUpdate.ExecuteNonQuery()
			conMISC.Close()
			
			'IF THE STATUS IS UPDATED TO COMPLETED, E-MAIL THE USER TO NOTIFY THEM THAT THEIR SUPPORT TICKET IS CLOSED.
			If req_status2.SelectedItem.Value Is "O" And Not reqEmp_no Is emp_no Then
				Dim EMailBody, EmailFrom, EmailTo, FirstName, FirstNameFrom as String						
				conMISC.Open()
				strSQL = "SELECT first_name, email FROM employees WHERE emp_no = @empNo"
				cmdSelect = New SqlCommand(strSQL, conMISC)				
				cmdSelect.Parameters.Add("@empNo", reqEmp_no)
				rsEmp = cmdSelect.ExecuteReader()
				rsEmp.Read()
				If rsEmp.HasRows Then
					EmailTo = rsEmp("email")
					EmailTo = EmailTo & "@smcins.com"
					FirstName = rsEmp("first_name")
				End If
				conMISC.Close()

				conMISC.Open()
				strSQL = "SELECT first_name, email FROM employees WHERE emp_no = @empNo" 
				cmdSelect = New SqlCommand(strSQL, conMISC)
				cmdSelect.Parameters.Add("@empNo", emp_no)
				rsEmp = cmdSelect.ExecuteReader()
				rsEmp.Read()
				If rsEmp.HasRows Then
					EmailFrom = rsEmp("email")
					EmailFrom = EmailFrom & "@smcins.com"
					FirstNameFrom = rsEmp("first_name")
				End If
				conMISC.Close()
				
				  EMailBody = FirstName & ", " & vbCrLf
				  EMailBody = EMailBody & "The following support request has been completed:" & vbCrLf
				  EMailBody = EMailBody & "Date Requested: " & rept_date.Text & vbCrLf
				  EMailBody = EMailBody & "Description: " & req_descr.Text & vbCrLf
				  EMailBody = EMailBody & "Notes: " & req_notes.Text & vbCrLf & vbCrLf
				  EMailBody = EMailBody & "Thank you, " & vbCrLf
				  EMailBody = EMailBody & FirstNameFrom & vbCrLf
			  
		  
			  try
				  Dim message As New MailMessage()
				  message.To = EmailTo
				  message.From = EmailFrom
				  message.Subject = "** Completed Support Request **"
				  message.Body = EMailBody
				  'message.Headers.Add("Disposition-Notification-To", EmailFrom)
                    SmtpMail.SmtpServer = "10.0.0.1"
				  SmtpMail.Send(message)
			  catch
				'Response.Write("Email Not Sent")
			  end try				
			End If
			
		End If
	End Sub

	Function CheckDate(subWeek as String)
		Try
			FormatDateTime(subWeek, 2)
		Catch
			JOut("Date is not formatted correctly.\n(mm/dd/yyyy)")
			CheckDate = "BAD"
			Exit Function
		End Try
	End Function

	Function JOut(msg As String)
		Dim errScript As string
		errScript = "<script language=javascript>" & "window.alert ('"& msg & "');" & "<" & "/script>"
		RegisterStartupScript("Error", errScript)
	End Function

	Sub Back_Click(sender As Object, e As EventArgs)
		Response.redirect("support.aspx")
	End Sub
	
</script>
<HTML>
<HEAD>
<BODY>
<TITLE>Southern Mutual Church Insurance Company - Support</TITLE>
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
  margin: 2px 0px 0px 20px;
  font-size: 12px;
  font-weight: bold;
  color: #2A3FAA;	
}

p {
line-height: 4px;
margin: 0px 0px 6px 0px;
padding: 0px 0px 0px 0px;
}

#mainBox {
width: 500px;
height: 260px;
margin: 0px 0px 0px 30px;
float: left;
overflow: scroll;
}

.boxup {
  font-family: Verdana,Arial,Helvetica,sans-serif;
  margin: 2px 0px 0px 0px;
  font-size: 12px;
  font-weight: bold;
  color: #2A3FAA;	
  position:relative;
}

.boxup1 {
margin: 0px 0px 0px 0px;
position:absolute;
left:20px;
top:0px;
}

.boxup2 {
margin: 0px 0px 0px 0px;
padding: 0px 0px 0px 136px;
}
</STYLE>
<div id="scmidout2">
	<div id="scmid">
		<div class="scrollmid">
			<center><font size="3"><b>Support Request</b></font></center><br>
			<form id="Main" runat="server">
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Submitted By:</asp:TextBox>
					<asp:TextBox id="fullname" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Report Date:</asp:TextBox>
					<asp:TextBox id="rept_date" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Date Needed:</asp:TextBox>
					<asp:TextBox id="date_needed" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Type:</asp:TextBox>
					<asp:TextBox id="hard_soft" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Software:</asp:TextBox>
					<asp:TextBox id="soft_system" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>				
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Priority:</asp:TextBox>
					<asp:TextBox id="req_level" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<div class="boxup">
						<div class="boxup1">
							<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Description:</asp:TextBox>
						</div>
						<div class="boxup2">
							<asp:TextBox id="req_descr"  width="300px" TextMode="MultiLine" Rows="3" readonly="True" background="#FFFFFF" borderwidth="1px" bordercolor="#CCDDFF" runat="server"></asp:TextBox>
						</div>
				</div>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Status:</asp:TextBox>
					<asp:TextBox id="req_status" width="300px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
					<asp:DropDownList id="req_status2" width="140px" runat="server">
						<asp:ListItem value="R">Reported</asp:ListItem>
						<asp:ListItem value="V">Reviewed</asp:ListItem>
						<asp:ListItem value="A">Assigned</asp:ListItem>
						<asp:ListItem value="P">In Progress</asp:ListItem>
						<asp:ListItem value="O">Completed</asp:ListItem>
					</asp:DropDownList>	
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Assigned To:</asp:TextBox>
					<asp:TextBox id="assigned_to" width="140px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<div class="boxup">
					<div class="boxup1">
						<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Notes:</asp:TextBox>
					</div>
					<div class="boxup2">	
						<asp:TextBox id="req_notes" width="300px" TextMode="MultiLine" Rows="3" readonly="True" background="#FFFFFF" borderwidth="1px" bordercolor="#CCDDFF" runat="server"></asp:TextBox><br>
					</div>	
				</div>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Est. Completion:</asp:TextBox>
					<asp:TextBox id="ec_date" width="140px" readonly="True" background="#FFFFFF" borderwidth="0px" runat="server"></asp:TextBox>
				</p>
				<p class="txt2">
					<asp:TextBox readonly="True" width="110px" style="font-size: 13px;font-weight: bold;color: #2A3FAA;" background="#FFFFFF" borderwidth="0px" runat="server">Date Completed:</asp:TextBox>
					<asp:TextBox id="date_completed" width="140px" readonly="True" background="#FFFFFF" borderwidth="0px"  runat="server"></asp:TextBox>
				</p>
				<center><asp:Button id="back" style="width: 100px;height:35px;" onclick="Back_Click" runat="server" Width="100px" height="35px" Text="Back"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button id="update" style="width: 100px;height:35px;" onclick="Update_Click" runat="server" Width="100px" height="35px" Text="Update"></asp:Button></center>
				<asp:Label runat="server" id="request_emp"></asp:Label>
			</form>	
			
		</div>
	</div>
</div>
</BODY>
</HEAD>