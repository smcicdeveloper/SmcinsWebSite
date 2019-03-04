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
Dim usr_no as String
Dim dept_no as String
Dim dept_no_own as String
Dim user_name as String
Dim exempt as String
Dim emp_name as String
Dim full_name as String
Dim superDuper As Boolean

    Sub Page_Load
	    If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	    Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	    End If
		emp_no = Session("EmpNo")	
		'emp_no = "9999"
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
		superDuper = False
        If emp_no = "1065" Or emp_no = "1200" Then
            superDuper = True
        End If
		Call GetDept()
		If Not IsPostBack Then
			Call BindMainGrid()
		End If
		
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
	
	Function BindMainGrid()
		Dim sideKick As Boolean
		sideKick = IsSuper()
        conMISC.Open()
        If superDuper Then
            If emp_no = 1065 Then
                strSQL = "SELECT vr.*, emp.first_name, emp.last_name FROM vacrequest AS vr INNER JOIN employees AS emp ON vr.emp_no = emp.emp_no WHERE (vr.approved = 'N') AND (vr.emp_no != @empNo) AND ((emp.emp_no = '1600') OR (emp.emp_no = '2070') OR (emp.emp_no = '2505') OR (emp.emp_no = '1090') OR (emp.emp_no = '1200')) ORDER BY vr.begin_date ASC"
            Else
                strSQL = "SELECT vr.*, emp.first_name, emp.last_name FROM vacrequest AS vr INNER JOIN employees AS emp ON vr.emp_no = emp.emp_no WHERE (vr.approved = 'N') AND (vr.emp_no != @empNo) AND ((emp.emp_no = '2030') OR (emp.emp_no = '3050') OR (emp.emp_no = '3570') OR (emp.emp_no = '4120')) ORDER BY vr.begin_date ASC"
            End If
            dadData = New SqlDataAdapter(strSQL, conMISC)
        ElseIf sideKick Then
            strSQL = "SELECT vr.*, emp.first_name, emp.last_name FROM vacrequest AS vr INNER JOIN employees AS emp ON vr.emp_no = emp.emp_no WHERE (vr.dept_no = @deptNo) AND (vr.approved = 'N') AND (vr.emp_no != @empNo) ORDER BY vr.begin_date ASC"
            dadData = New SqlDataAdapter(strSQL, conMISC)
            dadData.SelectCommand.Parameters.Add("@deptNo", dept_no)
        End If
            dadData.SelectCommand.Parameters.Add("@empNo", emp_no)
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
	
    Sub ItemsGrid_Command(sender As Object, e As DataGridCommandEventArgs)
        Select (CType(e.CommandSource, Button)).CommandName
            Case "Approve"
               Approve(e)

            Case "Disapprove"
				Disapprove(e)
				
            Case Else
               ' Do nothing.
        End Select
    End Sub
	
	Sub Approve(e As DataGridCommandEventArgs)
		'GET THE IMPORTANT VALUE FROM THE GRID
		 Dim empBox As TextBox = CType(e.Item.Cells(0).Controls(1), TextBox)
		 Dim empValue As String = empBox.Text
		 Dim nameBox As TextBox = CType(e.Item.Cells(1).Controls(1), TextBox)
		 Dim nameValue As String = nameBox.Text
		 Dim beginBox As TextBox = CType(e.Item.Cells(2).Controls(1), TextBox)
		 Dim beginValue As String = beginBox.Text
		 Dim endBox As TextBox = CType(e.Item.Cells(3).Controls(1), TextBox)
		 Dim endValue As String = endBox.Text
		 Dim daysBox As TextBox = CType(e.Item.Cells(4).Controls(1), TextBox)
		 Dim daysValue As String = daysBox.Text
		 Dim statusBox As TextBox = CType(e.Item.Cells(6).Controls(1), TextBox)
		 Dim statusValue As String = statusBox.Text
		 
		 'UPDATE THE APPROVED STATUS IN THE DATABASE
		conMISC.Open()	
		strSQL = "UPDATE vacrequest SET approved = @approved "
		strSQL = strSQL & "WHERE emp_no = @empNo AND begin_date = @beginDate"
		cmdUpdate = New SqlCommand(strSQL, conMISC)
		cmdUpdate.Parameters.Add("@approved", "Y")
		cmdUpdate.Parameters.Add("@empNo", empValue)
		cmdUpdate.Parameters.Add("@beginDate", beginValue)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()		
		
		'E-MAIL THE PERSON TELLING THEM THEIR REQUEST HAS BEEN APPROVED
			Dim EMailBody, EmailFrom, EmailTo, FirstName as String			
			
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
			
			conMISC.Open()
			strSQL = "SELECT email, first_name FROM employees WHERE emp_no = @empNo" 
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", empValue)
			rsEmp = cmdSelect.ExecuteReader()
			rsEmp.Read()
			If rsEmp.HasRows Then
				EmailTo = rsEmp("email")
				EmailTo = EmailTo & "@smcins.com"
				FirstName = rsEmp("first_name")
			End If
			conMISC.Close()
        	
		  EmailBody = FirstName & ", " & vbCrLf & vbCrLf
		  EMailBody = EmailBody & "The following annual leave request has been approved:" & vbCrLf & vbCrLf
		  EMailBody = EMailBody & "Begin Date: " & beginValue & vbCrLf
		  If Not(endValue = "") Then
			EMailBody = EMailBody & "End Date: " & endValue & vbCrLf
		  End If
		  EMailBody = EMailBody & "Total Days: " & daysValue & vbCrLf
		  If statusValue = "B" Then
			EMailBody = EMailBody & "Business Related" & vbCrLf
		  End If
		  
		  try
			  Dim message As New MailMessage()
			  message.To = EmailTo
			  message.From = EmailFrom
			  message.Subject = "** Annual Leave Approved **"
			  message.Body = EMailBody
			  message.Headers.Add("Disposition-Notification-To", EmailFrom)
			  SmtpMail.SmtpServer = "10.0.0.1"
			  SmtpMail.Send(message)
		  catch
			'Response.Write("Email Not Sent")
		  end try		
		'UPDATE THE GRID
		Call BindMainGrid()
    End Sub

	Sub Disapprove(e As DataGridCommandEventArgs)
		'GET THE IMPORTANT VALUE FROM THE GRID
		 Dim empBox As TextBox = CType(e.Item.Cells(0).Controls(1), TextBox)
		 Dim empValue As String = empBox.Text
		 Dim nameBox As TextBox = CType(e.Item.Cells(1).Controls(1), TextBox)
		 Dim nameValue As String = nameBox.Text
		 Dim beginBox As TextBox = CType(e.Item.Cells(2).Controls(1), TextBox)
		 Dim beginValue As String = beginBox.Text
		 Dim endBox As TextBox = CType(e.Item.Cells(3).Controls(1), TextBox)
		 Dim endValue As String = endBox.Text
		 Dim daysBox As TextBox = CType(e.Item.Cells(4).Controls(1), TextBox)
		 Dim daysValue As String = daysBox.Text
		 Dim statusBox As TextBox = CType(e.Item.Cells(6).Controls(1), TextBox)
		 Dim statusValue As String = statusBox.Text
		 
		 'DELETE THE ENTRY FROM THE TABLE
		conMISC.Open()	
		strSQL = "DELETE FROM vacrequest "
		strSQL = strSQL & "WHERE emp_no = @empNo AND begin_date = @beginDate"
		cmdUpdate = New SqlCommand(strSQL, conMISC)
		cmdUpdate.Parameters.Add("@empNo", empValue)
		cmdUpdate.Parameters.Add("@beginDate", beginValue)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()		
		 
		'E-MAIL THE PERSON TELLING THEM THEIR REQUEST HAS BEEN DENIED
			Dim EMailBody, EmailFrom, EmailTo, FirstName as String			
			
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
			
			conMISC.Open()
			strSQL = "SELECT email, first_name FROM employees WHERE emp_no = @empNo" 
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", empValue)
			rsEmp = cmdSelect.ExecuteReader()
			rsEmp.Read()
			If rsEmp.HasRows Then
				EmailTo = rsEmp("email")
				EmailTo = EmailTo & "@smcins.com"
				FirstName = rsEmp("first_name")
			End If
			conMISC.Close()
        	
		  EmailBody = FirstName & ", " & vbCrLf & vbCrLf
		  EMailBody = EmailBody & "The following annual leave request has been denied:" & vbCrLf & vbCrLf
		  EMailBody = EMailBody & "Begin Date: " & beginValue & vbCrLf
		  If Not(endValue = "") Then
			EMailBody = EMailBody & "End Date: " & endValue & vbCrLf
		  End If
		  EMailBody = EMailBody & "Total Days: " & daysValue & vbCrLf
		  If statusValue = "B" Then
			EMailBody = EMailBody & "Business Related" & vbCrLf
		  End If
		  
		  try
			  Dim message As New MailMessage()
			  message.To = EmailTo
			  message.From = EmailFrom
			  message.Subject = "** Annual Leave Denied **"
			  message.Body = EMailBody
			  message.Headers.Add("Disposition-Notification-To", EmailFrom)
            SmtpMail.SmtpServer = "10.0.0.1"
			  SmtpMail.Send(message)
		  catch
			'Response.Write("Email Not Sent")
		  end try	
		'UPDATE THE GRID
		 Call BindMainGrid()
    End Sub
	
	Sub dg_ItemCreated(sender As Object, e As DataGridItemEventArgs)
		 If e.Item.ItemType = ListItemType.Item OR _
			e.Item.ItemType = ListItemType.AlternatingItem Then
			  
			  'Get the button.  The Button can be found in the 0th Cell (since it
			  'is in the first DataGrid column), and it's the 0th control
			  Dim myButton As Button = CType(e.Item.Cells(7).Controls(0), Button)
			  myButton.CssClass = "buttonStyle"
			  myButton = CType(e.Item.Cells(8).Controls(0), Button)
			  myButton.CssClass = "buttonStyle"
		 End If
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
			dept_no_own = rsEmp("dept_no")
		End If
		conMISC.Close()
	End Function	
	
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

#mainBox {
width: 100%;
height: 240px;
margin: 0px 0px 0px 0px;
overflow: scroll;
}

#mainButtons {
width: 600px;
height: 80px;
margin: 10px 0px 0px 0px;
clear:both;
text-align:center;
}

p {
line-height: 4px;
margin: 0px 0px 6px 0px;
padding: 0px 0px 0px 0px;
}

.buttonStyle {
width: 74px;
font-size:12px;
}

.noCol {
width: 0px;
display: none;
}

#calLink {
top:2px;
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
			<center><font size="3"><b>Administer Leave</b></font></center>
			<BR><BR>
			<form id="ALMain" runat="server">
				<div id="mainBox">
					<asp:DataGrid id="mainGrid" runat="server" AutoGenerateColumns="False"
						 AllowSorting="False"
						 DataKeyField="emp_no"
						 OnItemCommand="ItemsGrid_Command"
						 OnItemCreated="dg_ItemCreated">
						<HeaderStyle font-size="9pt" HorizontalAlign="Center" font-names="Verdana" font-bold="True" backcolor="#e0e0e0"></HeaderStyle>
						<ItemStyle font-size="8pt" font-names="Verdana"></ItemStyle>
						<AlternatingItemStyle backcolor="#d3d3d3"></AlternatingItemStyle>
						<Columns>
							<asp:TemplateColumn HeaderStyle-CssClass="noCol">
								<ItemStyle CssClass="noCol"></ItemStyle>
								<ItemTemplate>
								   <asp:TextBox Visible="False" id="mgTB1" style="TEXT-ALIGN: center" width="0px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# Container.DataItem("emp_no") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="Employee">
								<ItemTemplate>
								   <asp:TextBox id="mgTB2" style="TEXT-ALIGN: center; font-size:12px; font-family:Verdana;" width="160px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# Container.DataItem("first_name") & " " & Container.DataItem("last_name") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>					
							<asp:TemplateColumn headertext="Begin Date">
								<ItemTemplate>
								   <asp:TextBox id="mgTB3" style="TEXT-ALIGN: center" width="74px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "begin_date") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="End Date">
								<ItemTemplate>
								   <asp:TextBox id="mgTB4" style="TEXT-ALIGN: center" width="74px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "end_date") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="Days">
								<ItemTemplate>
								   <asp:TextBox id="mgTB5" style="TEXT-ALIGN: center" width="40px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CDbl(Container.DataItem("total_days")) %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
							<asp:TemplateColumn Visible="False" headertext="Approved">
								<ItemTemplate>
								   <asp:TextBox id="mgTB6" style="TEXT-ALIGN: center" width="60px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# Container.DataItem("approved") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="Status">
								<ItemTemplate>
								   <asp:TextBox id="mgTB7" style="TEXT-ALIGN: center" width="46px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# Container.DataItem("status") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
							</asp:TemplateColumn>	
							<asp:ButtonColumn ButtonType="PushButton" Text="Approve" CommandName="Approve"/>
							<asp:ButtonColumn ButtonType="PushButton" Text="Deny" CommandName="Disapprove"/>
						</Columns>
					</asp:DataGrid>					
				</div>
				<div id="mainButtons">
					<INPUT type="BUTTON" onClick="window.location.href='annualLeave.aspx'" style="width:120px;height:42px;" value="Back">
				<BR><BR>
					<INPUT type="BUTTON" onClick="window.location.href='editLeave.aspx'" style="width:200px;height:42px;" value="Edit Approved Leave">
				</div>
			</form>
		</div>
	</div>
</div>
</BODY>
</HEAD>