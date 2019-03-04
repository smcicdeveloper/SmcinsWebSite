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
Dim usr_no as String
Dim dept_no as String
Dim user_name as String
Dim full_name as String
Dim supervisor as String
Dim weekEnd as String
Dim start as Boolean
Dim rec_emp as New ArrayList()
Dim rec_end as New ArrayList()
Dim superDuper as Boolean

    Sub Page_Load
	    If Session("EmpNo") Is DBNull.Value Then
		    response.redirect("SessionEnded.asp")
	    Else If(Session("EmpNo") = 0) Then
		    response.redirect("SessionEnded.asp")
	    End If
		emp_no = Session("EmpNo")	
		'emp_no = "9999"
        conMISC = New SqlConnection("Server=172.16.1.223;UID=webusr;PWD=smcw3bu$r;database=MISC")
		Call GetDept(emp_no)
		inputDateTB.Visible = "False"
		status1.Enabled = "False"
		status2.Enabled = "False"
		status3.Enabled = "False"
		status4.Enabled = "False"
		status5.Enabled = "False"
		update.Enabled = "False"
		msgLbl.Text = ""
		If hiddenRec.Text = "" Then
			hiddenRec.Text = "0"
		End If
		superDuper = False
        If emp_no = "1065" Or emp_no = "1200" Then
            superDuper = True
        End If
		Call GetRecords()
		If IsPostBack Then
			If newWeek.Text = "Accept" Or lblEmpNo.Text = emp_no Then
				Call PopulateMainInfo(0)
				msgLbl.Text = ""
			Else
				Call PopulateMainInfo(1)
				approve.Visible = "True"
			End If
		Else
			Call PopulateMainInfo(1)
			approve.Visible = "True"
		End If
		If rec_emp.Count = 0 Then
			newWeek.Enabled = "True"
			first.Enabled = "False"
			prev.Enabled = "False"
			nextbut.Enabled = "False"
			last.Enabled = "False"
			recCount.Text = ""
			approve.Enabled = "False"
		End If
	End Sub
	
	Function ShowPages() 
		If rec_emp.Count = 0 Then
			recCount.Text = "All Records are Updated"
			approve.Enabled = "False"
		Else
			recCount.Text = "Record " & CInt(hiddenRec.Text) + 1 & " of " & rec_emp.Count
		End If
	End Function
	
	Function GetRecords()
        conMISC.Open()   
        If superDuper Then
            If emp_no = 1065 Then
                strSQL = "SELECT vh.emp_no, vh.weekend_date, emp.supervisor FROM vachistory AS vh INNER JOIN employees AS emp ON vh.emp_no = emp.emp_no WHERE (vh.approved = @approved) AND (vh.emp_no = 1600 or vh.emp_no = 2505 or vh.emp_no = 2070 OR vh.emp_no = 1090 OR vh.emp_no = 1200) ORDER BY vh.emp_no"
            Else
                strSQL = "SELECT vh.emp_no, vh.weekend_date, emp.supervisor FROM vachistory AS vh INNER JOIN employees AS emp ON vh.emp_no = emp.emp_no WHERE (vh.approved = @approved) AND (vh.emp_no = 2030 or vh.emp_no = 3050 or vh.emp_no = 3570 OR vh.emp_no = 4120) ORDER BY vh.emp_no"
            End If
            cmdSelect = New SqlCommand(strSQL, conMISC)
            cmdSelect.Parameters.Add("@approved", "N")
            cmdSelect.Parameters.Add("@super", "Y")
            'cmdSelect.Parameters.Add("@tammy", 1090)
        Else
            strSQL = "SELECT * FROM vachistory WHERE dept_no = @deptNo AND approved = @approved AND emp_no != @empNo ORDER BY emp_no ASC"
            cmdSelect = New SqlCommand(strSQL, conMISC)
            cmdSelect.Parameters.Add("@deptNo", dept_no)
            cmdSelect.Parameters.Add("@approved", "N")
            cmdSelect.Parameters.Add("@empNo", emp_no)
        End If
            rsEmp = cmdSelect.ExecuteReader()
            rec_emp.Clear()
            rec_end.Clear()
            If rsEmp.HasRows Then
                While rsEmp.Read()
                    rec_emp.Add(rsEmp("emp_no"))
                    rec_end.Add(rsEmp("weekend_date"))
                End While
            Else
                'Response.Redirect("agents/denied.asp")
            End If
            If hiddenRec.Text = "" Or hiddenRec.Text > (rec_emp.Count - 1) Then
                hiddenRec.Text = "0"
            End If
            conMISC.Close()
            Call ShowPages()
    End Function
	
	Function GetDept(empNo As Integer)	
        conMISC.Open()   
		strSQL = "select emp_no, dept_no, emp_name, date_hired, allotted_leave, leave_taken, user_name, carry_over, supervisor from vacmast where emp_no = @empNo and term_date is null"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", empNo)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
		If rsEmp.HasRows Then
			If empNo = emp_no Then
				dept_no = rsEmp("dept_no")
			End If
			GetDept = rsEmp("dept_no")
		End If
		conMISC.Close()
	End Function
	
	Function PopulateMainInfo(isRec As Integer)
		If rec_emp.Count = 0 And Not(isRec = 0) Then
			msgLbl.Text = "All Records have been approved."
		Else
			If isRec = 1 Then
				usr_no = rec_emp(CInt(hiddenRec.Text))
			Else
				usr_no = emp_no
			End If
			conMISC.Open()   
			strSQL = "select emp_no, dept_no, user_name, supervisor from vacmast where emp_no = @empNo and term_date is null"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", usr_no)
			rsEmp = cmdSelect.ExecuteReader()
			rsEmp.Read()  

			If rsEmp.HasRows then
				dept_no = rsEmp("dept_no")
				user_name = rsEmp("user_name")
				supervisor = rsEmp("supervisor")
			else
				'Response.Redirect("agents/denied.asp")
			end if		
			conMISC.Close()
			conMISC.Open()		
			strSQL = "select first_name, last_name from employees where emp_no = @empNo"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", usr_no)
			rsEmp = cmdSelect.ExecuteReader()
			rsEmp.Read()       

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
			lblEmpNo.Text = usr_no
			If isRec = 1 Then
				Call GetWeekData(rec_end(CInt(hiddenRec.Text)))
			End If
		End If
	End Function
	
	Sub NewWeek_Click(sender As Object, e As EventArgs)
		If newWeek.Text = "Accept" Then
			Try
				If SubmitGetWeekData(Trim(inputDateTB.Text)) Is "BAD" Then
					inputDateTB.Visible = "True"
					newWeek.Text = "Accept"			
				Else
					inputDateTB.Text = FormatDateTime(inputDateTB.Text, 2)
					usr_no = emp_no
					Call PopulateMainInfo(0)
					approve.Visible = "False"			
					inputDateTB.Visible = "False"
					newWeek.Text = "New Week"	
				End If
			Catch
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('Date is not the current year\nor is not formatted correctly.\n(mm/dd/yyyy)');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)
				inputDateTB.Visible = "True"
				newWeek.Text = "Accept"	
			End Try
		Else
			msgLbl.Text = ""
			inputDateTB.Visible = "True"
			newWeek.Text = "Accept"
			approve.Visible = "False"
			usr_no = emp_no
			Call PopulateMainInfo(0)
		End If
	End Sub
	
	Function CheckUserDate(ByRef UserDate As String) As String
		Dim i As Short
		'Try
		'	If Year(FormatDateTime(UserDate, 2)) < Year(Now) Then
		'		CheckUserDate = "LAST YEAR"
		'		Exit Function
		'	End If
		'Catch
		'	CheckUserDate = "BAD FORMAT"
		'End Try
		For i = 1 To Len(UserDate)
			Select Case Mid(UserDate, i, 1)
				Case "/"
					If i > 1 Then
						CheckUserDate = "OK"
						Exit Function
					End If
				Case "-"
					If i > 1 Then
						CheckUserDate = "OK"
						Exit Function
					End If
				Case Else
			End Select
		Next 
		CheckUserDate = "BAD FORMAT"
	End Function
	
	Function GetWeekData(subWeek as String)
		weekEnd = subWeek
		lblWeekEnding.Text = weekEnd
		
		call PopulateTable()
	End Function
	
	Function SubmitGetWeekData(subWeek as String)
		If CheckUserDate(subWeek) <> "OK" then
			If CheckUserDate(subWeek) = "LAST YEAR"
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('Date is not the current year\nor is not formatted correctly.\n(mm/dd/yyyy)');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)
				SubmitGetWeekData = "BAD"
				exit Function
			End If
			If CheckUserDate(subWeek) = "BAD FORMAT"
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('Date is not in the correct format.');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)
				SubmitGetWeekData = "BAD"
				exit Function				
			End If
		End If
		
		If Weekday(subWeek) = "1" then
			Dim errScript As string
			errScript = "<script language=javascript>" & "window.alert ('You have entered a date for Sunday.\nPlease enter a weekday date.');" & "<" & "/script>"
			RegisterStartupScript("Error", errScript)
			SubmitGetWeekData = "BAD"
			exit Function					
		End If
		If Weekday(subWeek) = "7" then
			Dim errScript As string
			errScript = "<script language=javascript>" & "window.alert ('You have entered a date for Saturday.\nPlease enter a weekday date.');" & "<" & "/script>"
			RegisterStartupScript("Error", errScript)
			SubmitGetWeekData = "BAD"
			exit Function					
		End If
		
		Dim dayNum as Integer
		dayNum = Weekday(subWeek)
		dayNum = 6 - dayNum
		weekEnd = DateAdd("d", dayNum, subWeek)
		lblWeekEnding.Text = weekEnd
		
		call PopulateSubmitTable()
	End Function
	
	Function PopulateSubmitTable()
        conMISC.Open()   
		strSQL = "select * from vachistory where emp_no = @empNo and weekend_date = @weekendDate"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", emp_no)
        cmdSelect.Parameters.Add("@weekendDate", weekEnd)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
	
		'FILL IN THE FIELDS
		If rsEmp.HasRows then
			If rsEmp("approved") = "Y" then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have already entered a record\nfor the week ending " & weekEnd & ".\nIt has been approved');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)
				conMISC.Close()				
				Exit Function
			Else
				Call PopDropDown()
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You already have a record for this week.\nIt is waiting approval.\n\nYou can make changes until your supervisor approves this week.');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)	
				msgLbl.Text = "This record has not been approved yet."
				Dim iStat as String
				iStat = rsEmp("monday_status")
				Try
					status1.selectedValue = iStat
				catch
					status1.selectedValue = "P"
				end try
				iStat = rsEmp("tuesday_status")
				Try
					status2.selectedValue = iStat
				catch
					status2.selectedValue = "P"
				end try
				iStat = rsEmp("wednesday_status")
				Try
					status3.selectedValue = iStat
				catch
					status3.selectedValue = "P"
				end try
				iStat = rsEmp("thursday_status")
				Try
					status4.selectedValue = iStat
				catch
					status4.selectedValue = "P"
				end try
				iStat = rsEmp("friday_status")
				Try
					status5.selectedValue = iStat
				catch
					status5.selectedValue = "P"
				end try
			End If
        else
			Call PopDropDown()
        end if			
		conMISC.Close()
		
		'ADD THE HOLIDAYS TO THE DROP DOWN LISTS
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
		if rsEmp.HasRows then
			While rsEmp.Read()
				If rsEmp("hol_date") = date1.Text then
					status1.Items.Clear()
					status1.Items.Add("H")
				Else If rsEmp("hol_date") = date2.Text then
					status2.Items.Clear()
					status2.Items.Add("H")
				Else If rsEmp("hol_date") = date3.Text then
					status3.Items.Clear()
					status3.Items.Add("H")
				Else If rsEmp("hol_date") = date4.Text then
					status4.Items.Clear()
					status4.Items.Add("H")
				Else If rsEmp("hol_date") = date5.Text then
					status5.Items.Clear()
					status5.Items.Add("H")
				End If
			End While
        End If
        conMISC.Close()
		
		'ADD THEIR ANNUAL LEAVE DAYS TO THE DROP DOWN LISTS
		conMISC.Open()   
		strSQL = "select begin_date, end_date, total_days, approved, status FROM vacrequest WHERE emp_no = @empNo"
		cmdSelect = New SqlCommand(strSQL, conMISC)
		cmdSelect.Parameters.Add("@empNo", emp_no)
		rsEmp = cmdSelect.ExecuteReader()
		Dim tempDate as DateTime
		if rsEmp.HasRows then
			While rsEmp.Read()
				If rsEmp("approved") = "Y" then
					Dim i as Integer
					i = 0
					tempDate = rsEmp("begin_date")
					While True
						If date1.Text = tempDate then
							If rsEmp("Status") = "A" then
							    If rsEmp("total_days") = .5 then
							        status1.selectedValue = "1/2A"
							    Else
								status1.selectedValue = "AL"
						            End if
							Else If rsEmp("Status") = "S" then
							    If rsEmp("total_days") = .5 then
							        status1.selectedValue = "1/2S"
							    Else
								status1.selectedValue = "S"
						            End if
							End if
						End If
						If date2.Text = tempDate then
							If rsEmp("Status") = "A" then
							    If rsEmp("total_days") = .5 then
							        status2.selectedValue = "1/2A"
							    Else
								status2.selectedValue = "AL"
						            End if
							Else If rsEmp("Status") = "S" then
							    If rsEmp("total_days") = .5 then
							        status2.selectedValue = "1/2S"
							    Else
								status2.selectedValue = "S"
						            End if
							End if
						End If
						If date3.Text = tempDate then
							If rsEmp("Status") = "A" then
							    If rsEmp("total_days") = .5 then
							        status3.selectedValue = "1/2A"
							    Else
								status3.selectedValue = "AL"
						            End if
							Else If rsEmp("Status") = "S" then
							    If rsEmp("total_days") = .5 then
							        status3.selectedValue = "1/2S"
							    Else
								status3.selectedValue = "S"
						            End if
							End if
						End If
						If date4.Text = tempDate then
							If rsEmp("Status") = "A" then
							    If rsEmp("total_days") = .5 then
							        status4.selectedValue = "1/2A"
							    Else
								status4.selectedValue = "AL"
						            End if
							Else If rsEmp("Status") = "S" then
							    If rsEmp("total_days") = .5 then
							        status4.selectedValue = "1/2S"
							    Else
								status4.selectedValue = "S"
						            End if
							End if
						End If
						If date5.Text = tempDate then
							If rsEmp("Status") = "A" then
							    If rsEmp("total_days") = .5 then
							        status5.selectedValue = "1/2A"
							    Else
								status5.selectedValue = "AL"
						            End if
							Else If rsEmp("Status") = "S" then
							    If rsEmp("total_days") = .5 then
							        status5.selectedValue = "1/2S"
							    Else
								status5.selectedValue = "S"
						            End if
							End if
						End If
						If rsEmp("end_date") Is DBNull.Value then
							Exit While
						Else If DateValue(tempDate) >= DateValue(rsEmp("end_date")) then
							Exit While
						End If
						'Response.Write("Temp Date: " & tempDate)
						'Response.Write("-End Date: " & rsEmp("end_date"))
						tempDate = DateAdd("d", 1, tempDate)
					End While				
				End If
			End While
		End If
        conMISC.Close()
	End Function
	
	Function PopulateTable()
        conMISC.Open()   
		strSQL = "select * from vachistory where emp_no = @empNo and weekend_date = @weekendDate"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", usr_no)
        cmdSelect.Parameters.Add("@weekendDate", weekEnd)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
	
		'FILL IN THE FIELDS
		If rsEmp.HasRows then
			If rsEmp("approved") = "Y" then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have already entered a record\nfor the week ending " & weekEnd & ".\nIt has been approved');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)
				conMISC.Close()				
				Exit Function
			Else
				Call PopDropDown()
				msgLbl.Text = "This record has not been approved yet."
				Dim iStat as String
				iStat = rsEmp("monday_status")
				status1.Items.Clear()
				status1.Items.Add(iStat)
				status1.selectedValue = iStat
				iStat = rsEmp("tuesday_status")
				status2.Items.Clear()
				status2.Items.Add(iStat)
				status2.selectedValue = iStat
				iStat = rsEmp("wednesday_status")
				status3.Items.Clear()
				status3.Items.Add(iStat)
				status3.selectedValue = iStat
				iStat = rsEmp("thursday_status")
				status4.Items.Clear()
				status4.Items.Add(iStat)
				status4.selectedValue = iStat
				iStat = rsEmp("friday_status")
				status5.Items.Clear()
				status5.Items.Add(iStat)
				status5.selectedValue = iStat
				inputDateTB.Visible = "False"
				status1.Enabled = "False"
				status2.Enabled = "False"
				status3.Enabled = "False"
				status4.Enabled = "False"
				status5.Enabled = "False"
				update.Enabled = "False"	
			End If
        else
			Call PopDropDown()
        end if		
		conMISC.Close()
		Call ShowPages()
	End Function
	
	Function PopDropDown() 
		date1.Text = DateAdd("d", -4, weekEnd)
		date2.Text = DateAdd("d", -3, weekEnd)
		date3.Text = DateAdd("d", -2, weekEnd)
		date4.Text = DateAdd("d", -1, weekEnd)
		date5.Text = weekEnd
		status1.Enabled = "True"
		status2.Enabled = "True"
		status3.Enabled = "True"
		status4.Enabled = "True"
		status5.Enabled = "True"
		update.Enabled = "True"
		
		status1.Items.Clear()
		status1.Items.Add(new ListItem("P", "P"))	
		status1.Items.Add(new ListItem("AL", "AL"))
		status1.Items.Add(new ListItem(chr(189)&"A", "1/2A"))
		status1.Items.Add(new ListItem("S", "S"))
		status1.Items.Add(new ListItem(chr(189)&"S", "1/2S"))
		status1.Items.Add(new ListItem("O", "O"))
		
		status2.Items.Clear()
		status2.Items.Add(new ListItem("P", "P"))	
		status2.Items.Add(new ListItem("AL", "AL"))
		status2.Items.Add(new ListItem(chr(189)&"A", "1/2A"))
		status2.Items.Add(new ListItem("S", "S"))
		status2.Items.Add(new ListItem(chr(189)&"S", "1/2S"))
		status2.Items.Add(new ListItem("O", "O"))
		
		status3.Items.Clear()
		status3.Items.Add(new ListItem("P", "P"))	
		status3.Items.Add(new ListItem("AL", "AL"))
		status3.Items.Add(new ListItem(chr(189)&"A", "1/2A"))
		status3.Items.Add(new ListItem("S", "S"))
		status3.Items.Add(new ListItem(chr(189)&"S", "1/2S"))
		status3.Items.Add(new ListItem("O", "O"))
		
		status4.Items.Clear()		
		status4.Items.Add(new ListItem("P", "P"))		
		status4.Items.Add(new ListItem("AL", "AL"))
		status4.Items.Add(new ListItem(chr(189)&"A", "1/2A"))
		status4.Items.Add(new ListItem("S", "S"))
		status4.Items.Add(new ListItem(chr(189)&"S", "1/2S"))
		status4.Items.Add(new ListItem("O", "O"))
		
		status5.Items.Clear()
		status5.Items.Add(new ListItem("P", "P"))	
		status5.Items.Add(new ListItem("AL", "AL"))
		status5.Items.Add(new ListItem(chr(189)&"A", "1/2A"))
		status5.Items.Add(new ListItem("S", "S"))
		status5.Items.Add(new ListItem(chr(189)&"S", "1/2S"))
		status5.Items.Add(new ListItem("O", "O"))
	End Function
	
	Sub Status1_SelectedChanged(sender as Object, e as EventArgs)
			inputDateTB.Visible = "False"
			status1.Enabled = "True"
			status2.Enabled = "True"
			status3.Enabled = "True"
			status4.Enabled = "True"
			status5.Enabled = "True"
			update.Enabled = "True"
		If sender.SelectedItem.Value = "AL" Or sender.SelectedItem.Value = "1/2A" then
			conMISC.Open()   
			strSQL = "select begin_date, end_date, total_days, approved, status FROM vacrequest WHERE emp_no = @empNo"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", emp_no)
			rsEmp = cmdSelect.ExecuteReader()
			Dim alok as Boolean
			Dim tempDate as DateTime
			if rsEmp.HasRows then
				While rsEmp.Read()
					tempDate = rsEmp("begin_date")
					If rsEmp("end_date") is DBNull.Value
						If date1.Text = rsEmp("begin_date") then
							If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
								alok = true
							End If
						End if
					Else
						While True
							If date1.Text = tempDate then
								If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
									alok = true
								End If
							End if
							If tempDate = rsEmp("end_date") then
								Exit While
							End If
							If (tempDate < DateValue(date1.Text) Or tempDate > DateValue(date5.Text)) Then
								Exit While
							End If
							tempDate = DateAdd("d", 1, tempDate)
						End While				
					End If
				End While
			End If
			If Not alok then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have not been approved for annual leave on " & date1.Text & ".');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)		
				sender.SelectedValue = "P"
				conMISC.Close()
			End if
		End If
	End Sub
	
	Sub Status2_SelectedChanged(sender as Object, e as EventArgs)
			inputDateTB.Visible = "False"
			status1.Enabled = "True"
			status2.Enabled = "True"
			status3.Enabled = "True"
			status4.Enabled = "True"
			status5.Enabled = "True"
			update.Enabled = "True"
		If sender.SelectedItem.Value = "AL" Or sender.SelectedItem.Value = "1/2A" then
			conMISC.Open()   
			strSQL = "select begin_date, end_date, total_days, approved, status FROM vacrequest WHERE emp_no = @empNo"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", emp_no)
			rsEmp = cmdSelect.ExecuteReader()
			Dim alok as Boolean
			Dim tempDate as DateTime
			if rsEmp.HasRows then
				While rsEmp.Read()
					tempDate = rsEmp("begin_date")
					If rsEmp("end_date") is DBNull.Value
						If date2.Text = rsEmp("begin_date") then
							If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
								alok = true
							End If
						End if
					Else
						While True
							If date2.Text = tempDate then
								If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
									alok = true
								End If
							End if
							If tempDate = rsEmp("end_date") then
								Exit While
							End If
							If (tempDate < DateValue(date1.Text) Or tempDate > DateValue(date5.Text)) Then
								Exit While
							End If
							tempDate = DateAdd("d", 1, tempDate)
						End While				
					End If
				End While
			End If
			If Not alok then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have not been approved for annual leave on " & date2.Text & ".');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)		
				sender.SelectedValue = "P"
				conMISC.Close()
			End if
		End If
	End Sub
	
	Sub Status3_SelectedChanged(sender as Object, e as EventArgs)
			inputDateTB.Visible = "False"
			status1.Enabled = "True"
			status2.Enabled = "True"
			status3.Enabled = "True"
			status4.Enabled = "True"
			status5.Enabled = "True"
			update.Enabled = "True"
		If sender.SelectedItem.Value = "AL" Or sender.SelectedItem.Value = "1/2A" then
			conMISC.Open()   
			strSQL = "select begin_date, end_date, total_days, approved, status FROM vacrequest WHERE emp_no = @empNo"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", emp_no)
			rsEmp = cmdSelect.ExecuteReader()
			Dim alok as Boolean
			Dim tempDate as DateTime
			if rsEmp.HasRows then
				While rsEmp.Read()
					tempDate = rsEmp("begin_date")
					If rsEmp("end_date") is DBNull.Value
						If date3.Text = rsEmp("begin_date") then
							If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
								alok = true
							End If
						End if
					Else
						While True
							If date3.Text = tempDate then
								If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
									alok = true
								End If
							End if
							If tempDate = rsEmp("end_date") then
								Exit While
							End If
							If (tempDate < DateValue(date1.Text) Or tempDate > DateValue(date5.Text)) Then
								Exit While
							End If
							tempDate = DateAdd("d", 1, tempDate)
						End While				
					End If
				End While
			End If
			If Not alok then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have not been approved for annual leave on " & date3.Text & ".');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)		
				sender.SelectedValue = "P"
				conMISC.Close()
			End if
		End If
	End Sub

	Sub Status4_SelectedChanged(sender as Object, e as EventArgs)
			inputDateTB.Visible = "False"
			status1.Enabled = "True"
			status2.Enabled = "True"
			status3.Enabled = "True"
			status4.Enabled = "True"
			status5.Enabled = "True"
			update.Enabled = "True"
		If sender.SelectedItem.Value = "AL" Or sender.SelectedItem.Value = "1/2A" then
			conMISC.Open()   
			strSQL = "select begin_date, end_date, total_days, approved, status FROM vacrequest WHERE emp_no = @empNo"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", emp_no)
			rsEmp = cmdSelect.ExecuteReader()
			Dim alok as Boolean
			Dim tempDate as DateTime
			if rsEmp.HasRows then
				While rsEmp.Read()
					tempDate = rsEmp("begin_date")
					If rsEmp("end_date") is DBNull.Value
						If date4.Text = rsEmp("begin_date") then
							If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
								alok = true
							End If
						End if
					Else
						While True
							If date4.Text = tempDate then
								If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
									alok = true
								End If
							End if
							If tempDate = rsEmp("end_date") then
								Exit While
							End If
							If (tempDate < DateValue(date1.Text) Or tempDate > DateValue(date5.Text)) Then
								Exit While
							End If
							tempDate = DateAdd("d", 1, tempDate)
						End While				
					End If
				End While
			End If
			If Not alok then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have not been approved for annual leave on " & date4.Text & ".');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)		
				sender.SelectedValue = "P"
				conMISC.Close()
			End if
		End If
	End Sub

	Sub Status5_SelectedChanged(sender as Object, e as EventArgs)
			inputDateTB.Visible = "False"
			status1.Enabled = "True"
			status2.Enabled = "True"
			status3.Enabled = "True"
			status4.Enabled = "True"
			status5.Enabled = "True"
			update.Enabled = "True"
		If sender.SelectedItem.Value = "AL" Or sender.SelectedItem.Value = "1/2A" then
			conMISC.Open()   
			strSQL = "select begin_date, end_date, total_days, approved, status FROM vacrequest WHERE emp_no = @empNo"
			cmdSelect = New SqlCommand(strSQL, conMISC)
			cmdSelect.Parameters.Add("@empNo", emp_no)
			rsEmp = cmdSelect.ExecuteReader()
			Dim alok as Boolean
			Dim tempDate as DateTime
			if rsEmp.HasRows then
				While rsEmp.Read()
					tempDate = rsEmp("begin_date")
					If rsEmp("end_date") is DBNull.Value
						If date5.Text = rsEmp("begin_date") then
							If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
								alok = true
							End If
						End if
					Else
						While True
							If date5.Text = tempDate then
								If rsEmp("approved") = "Y" And rsEmp("status") = "A" then
									alok = true
								End If
							End if
							If tempDate = rsEmp("end_date") then
								Exit While
							End If
							If (tempDate < DateValue(date1.Text) Or tempDate > DateValue(date5.Text)) Then
								Exit While
							End If
							tempDate = DateAdd("d", 1, tempDate)
						End While				
					End If
				End While
			End If
			If Not alok then
				Dim errScript As string
				errScript = "<script language=javascript>" & "window.alert ('You have not been approved for annual leave on " & date5.Text & ".');" & "<" & "/script>"
				RegisterStartupScript("Error", errScript)		
				sender.SelectedValue = "P"
				conMISC.Close()
			End if
		End If
	End Sub
	
	Sub Update_Click(sender As Object, e As EventArgs)
		conMISC.Open()   
		strSQL = "select approved FROM vachistory WHERE emp_no = @empNo AND weekend_date = @weekendDate"
		cmdSelect = New SqlCommand(strSQL, conMISC)
		cmdSelect.Parameters.Add("@empNo", emp_no)
		cmdSelect.Parameters.Add("@weekendDate", date5.Text)
		rsEmp = cmdSelect.ExecuteReader()		
		rsEmp.Read()
		If rsEmp.HasRows then
			conMISC.Close()	
			conMISC.Open()	
            strSQL = "UPDATE vachistory SET monday_status = @monday, tuesday_status = @tuesday, wednesday_status = @wednesday, thursday_status = @thursday, friday_status = @friday "
			strSQL = strSQL & "WHERE emp_no = @empNo AND weekend_date = @weekendDate"
			cmdUpdate = New SqlCommand(strSQL, conMISC)
			cmdUpdate.Parameters.Add("@monday", status1.SelectedItem.Value)
			cmdUpdate.Parameters.Add("@tuesday", status2.SelectedItem.Value)
			cmdUpdate.Parameters.Add("@wednesday", status3.SelectedItem.Value)
			cmdUpdate.Parameters.Add("@thursday", status4.SelectedItem.Value)
			cmdUpdate.Parameters.Add("@friday", status5.SelectedItem.Value)
			cmdUpdate.Parameters.Add("@empNo", emp_no)
			cmdUpdate.Parameters.Add("@weekendDate", date5.Text)
			cmdUpdate.ExecuteNonQuery()
			conMISC.Close()		
			msgLbl.Text = "Record has been updated."
		Else
			conMISC.Close()
			conMISC.Open()
			strSQL = "INSERT into vachistory (emp_no, weekend_date, dept_no, approved, monday_status, tuesday_status, wednesday_status, thursday_status, friday_status) VALUES"
		    strSQL = strSQL & " (@empNo, @weekendDate, @deptNo, @approved, @monday, @tuesday, @wednesday, @thursday, @friday)"
			cmdInsert = New SqlCommand(strSQL, conMISC)
		    cmdInsert.Parameters.Add("@empNo", emp_no)
		    cmdInsert.Parameters.Add("@weekendDate", date5.Text)
		    cmdInsert.Parameters.Add("@deptNo", dept_no)
			If superDuper Then
		    		cmdInsert.Parameters.Add("@approved", "Y")
			Else				
		   		cmdInsert.Parameters.Add("@approved", "N")
			End If
		    cmdInsert.Parameters.Add("@monday", status1.SelectedItem.Value)
		    cmdInsert.Parameters.Add("@tuesday", status2.SelectedItem.Value)
		    cmdInsert.Parameters.Add("@wednesday", status3.SelectedItem.Value)
		    cmdInsert.Parameters.Add("@thursday", status4.SelectedItem.Value)
		    cmdInsert.Parameters.Add("@friday", status5.SelectedItem.Value)
	            cmdInsert.ExecuteNonQuery()						 
		   conMISC.Close()	
		    msgLbl.Text = "Record has been created."
			If superDuper Then
				call Approve_Super()
			End If
		End If
	End Sub

	Function Approve_Super()
		'ADD THE AMOUNT OF DAYS THEY TOOK TO THEIR TOTAL DAYS TAKEN
		
		Dim newTake as Double
		Dim oldTake as Double
		newTake = 0
		newTake = CalcTaken(status1)
		newTake = newTake + CalcTaken(status2)
		newTake = newTake + CalcTaken(status3)
		newTake = newTake + CalcTaken(status4)
		newTake = newTake + CalcTaken(status5)
		conMISC.Open()   
		strSQL = "SELECT leave_taken FROM vacmast WHERE emp_no = @empNo"
		cmdSelect = New SqlCommand(strSQL, conMISC)
		cmdSelect.Parameters.Add("@empNo", emp_no)
		rsEmp = cmdSelect.ExecuteReader()		
		rsEmp.Read()
		If rsEmp.HasRows then
			oldTake = rsEmp("leave_taken")
		End If
		conMISC.Close()
		newTake = newTake + oldTake
		
		conMISC.Open()	
		strSQL = "UPDATE vacmast SET leave_taken = @leave"
		strSQL = strSQL & " WHERE emp_no = @empNo"
		cmdUpdate = New SqlCommand(strSQL, conMISC)
		cmdUpdate.Parameters.Add("@leave", newTake)
		cmdUpdate.Parameters.Add("@empNo", emp_no)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()		
		
		'NEXT ADD THEIR ANNUAL LEAVE DAYS TO THE DETAIL TABLE
		
		'The following will go through all the days and search for consecutive days taken off in order to avoid creating individual records for each day. 
		'Half Days are created as individual records

		Dim i As Integer
		Dim j As Integer
		Dim tempIdDrop As String
		Dim tempIdDate As String
		Dim tempDate As TextBox
		Dim tempDrop As DropDownList
		Dim startDate As String
		Dim nextDate As String
		i = 1
		While i <= 5 
			newTake = 0
			tempIdDrop = "status" & CStr(i)
			tempDrop = Page.FindControl(tempIdDrop)
			tempIdDate = "date" & CStr(i)
			tempDate = Page.FindControl(tempIdDate)
			startDate = ""
			nextDate = ""
			If tempDrop.SelectedItem.Value = "1/2A" Then
				'ADD SINGLE DAY TO DETAILS TABLE
				newTake = 0.5
				startDate = tempDate.Text
				i = i + 1
			Else If tempDrop.SelectedItem.Value = "AL" Then
				startDate = tempDate.Text
				nextDate = startDate
				newTake = 1
				j = i
				While j < 5
					tempIdDrop = "status" & CStr(j + 1)
					tempDrop = Page.FindControl(tempIdDrop)
					If tempDrop.SelectedItem.Value = "AL" Then
						j = j + 1
						newTake = newTake + 1
						tempIdDate = "date" & CStr(j)
						tempDate = Page.FindControl(tempIdDate)		
						nextDate = tempDate.Text
					Else
						Exit While
					End If
				End While
				i = j + 1
			Else
				i = i + 1
			End If
			If newTake > 0 Then
				conMISC.Open()
				strSQL = "INSERT into vacdet (emp_no, begin_date, end_date, total_days) VALUES"
				strSQL = strSQL & " (@empNo, @beginDate, @endDate, @totalDays)"
				cmdInsert = New SqlCommand(strSQL, conMISC)
				cmdInsert.Parameters.Add("@empNo", emp_no)
				cmdInsert.Parameters.Add("@beginDate", DateValue(startDate))
				If newTake <= 1 Then
					cmdInsert.Parameters.Add("@endDate", DBNull.Value)
				Else
					cmdInsert.Parameters.Add("@endDate", DateValue(nextDate))
				End If
				cmdInsert.Parameters.Add("@totalDays", newTake)
				cmdInsert.ExecuteNonQuery()						 
				conMISC.Close()	
			End If
		End While

		'NEXT ADD THEIR SICK DAYS TO THE DETAIL TABLE AND REQUEST TABLE
		
		'The following will go through all the days and search for consecutive days taken off in order to avoid creating individual records for each day. 
		'Half Days are created as individual records
		i = 1
		While i <= 5 
			newTake = 0
			tempIdDrop = "status" & CStr(i)
			tempDrop = Page.FindControl(tempIdDrop)
			tempIdDate = "date" & CStr(i)
			tempDate = Page.FindControl(tempIdDate)
			startDate = ""
			nextDate = ""
			If tempDrop.SelectedItem.Value = "1/2S" Then
				'ADD SINGLE DAY TO DETAILS TABLE
				newTake = 0.5
				startDate = tempDate.Text
				i = i + 1
			Else If tempDrop.SelectedItem.Value = "S" Then
				startDate = tempDate.Text
				nextDate = startDate
				newTake = 1
				j = i
				While j < 5
					tempIdDrop = "status" & CStr(j + 1)
					tempDrop = Page.FindControl(tempIdDrop)
					If tempDrop.SelectedItem.Value = "S" Then
						j = j + 1
						newTake = newTake + 1
						tempIdDate = "date" & CStr(j)
						tempDate = Page.FindControl(tempIdDate)		
						nextDate = tempDate.Text
					Else
						Exit While
					End If
				End While
				i = j + 1
			Else
				i = i + 1
			End If
			If newTake > 0 Then
				conMISC.Open()
				'
				' INSERT INTO DETAIL TABLE FIRST
				'
				strSQL = "INSERT into vacdet (emp_no, begin_date, end_date, total_days) VALUES"
				strSQL = strSQL & " (@empNo, @beginDate, @endDate, @totalDays)"
				cmdInsert = New SqlCommand(strSQL, conMISC)
				cmdInsert.Parameters.Add("@empNo", emp_no)
				cmdInsert.Parameters.Add("@beginDate", DateValue(startDate))
				If newTake <= 1 Then
					cmdInsert.Parameters.Add("@endDate", DBNull.Value)
				Else
					cmdInsert.Parameters.Add("@endDate", DateValue(nextDate))
				End If
				cmdInsert.Parameters.Add("@totalDays", newTake)
				cmdInsert.ExecuteNonQuery()						 
				conMISC.Close()	
			End If
		End While
	End Function
	
	Sub First_Click(sender As Object, e As EventArgs)
		hiddenRec.Text = "0"
		call PopulateMainInfo(1)
		If inputDateTB.Visible = "False" And newWeek.Text = "Accept" Then
			newWeek.Text = "New Week"
		End If
		approve.Visible = "True"
	End Sub
	
	Sub Prev_Click(sender As Object, e As EventArgs)
		If CInt(hiddenRec.Text) > 0 Then 
			hiddenRec.Text = CInt(hiddenRec.Text) - 1
		End If
		call PopulateMainInfo(1)
		If inputDateTB.Visible = "False" And newWeek.Text = "Accept" Then
			newWeek.Text = "New Week"
		End If		
		approve.Visible = "True"
	End Sub
	
	Sub Next_Click(sender As Object, e As EventArgs)
		If CInt(hiddenRec.Text) < (rec_end.Count - 1) Then 
			hiddenRec.Text = CInt(hiddenRec.Text) + 1
		End If
		call PopulateMainInfo(1)
		If inputDateTB.Visible = "False" And newWeek.Text = "Accept" Then
			newWeek.Text = "New Week"
		End If		
		approve.Visible = "True"
	End Sub
	
	Sub Last_Click(sender As Object, e As EventArgs)
		hiddenRec.Text = rec_end.Count - 1
		call PopulateMainInfo(1)
		If inputDateTB.Visible = "False" And newWeek.Text = "Accept" Then
			newWeek.Text = "New Week"
		End If		
		approve.Visible = "True"
	End Sub
	
	Sub Approve_Click(sender As Object, e As EventArgs)
		'FIRST UPDATE THE RECORD TO AN APPROVED STATUS		
		
		conMISC.Open()	
		strSQL = "UPDATE vachistory SET approved = @approved"
		strSQL = strSQL & " WHERE emp_no = @empNo AND weekend_date = @weekendDate"
		cmdUpdate = New SqlCommand(strSQL, conMISC)
		cmdUpdate.Parameters.Add("@approved", "Y")
		cmdUpdate.Parameters.Add("@empNo", usr_no)
		cmdUpdate.Parameters.Add("@weekendDate", date5.Text)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()		

		'NEXT ADD THE AMOUNT OF DAYS THEY TOOK TO THEIR TOTAL DAYS TAKEN
		
		Dim newTake as Double
		Dim oldTake as Double
		newTake = 0
		newTake = CalcTaken(status1)
		newTake = newTake + CalcTaken(status2)
		newTake = newTake + CalcTaken(status3)
		newTake = newTake + CalcTaken(status4)
		newTake = newTake + CalcTaken(status5)
		conMISC.Open()   
		strSQL = "SELECT leave_taken FROM vacmast WHERE emp_no = @empNo"
		cmdSelect = New SqlCommand(strSQL, conMISC)
		cmdSelect.Parameters.Add("@empNo", usr_no)
		rsEmp = cmdSelect.ExecuteReader()		
		rsEmp.Read()
		If rsEmp.HasRows then
			oldTake = rsEmp("leave_taken")
		End If
		conMISC.Close()
		newTake = newTake + oldTake
		
		conMISC.Open()	
		strSQL = "UPDATE vacmast SET leave_taken = @leave"
		strSQL = strSQL & " WHERE emp_no = @empNo"
		cmdUpdate = New SqlCommand(strSQL, conMISC)
		cmdUpdate.Parameters.Add("@leave", newTake)
		cmdUpdate.Parameters.Add("@empNo", usr_no)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()		

        'NEXT ADD THE AMOUNT OF SICK DAYS THEY TOOK TO THEIR TOTAL SICK DAYS TAKEN
		
        Dim newSick As Double
        Dim oldSick As Double
        newSick = 0
        newSick = CalcSick(status1)
        newSick = newSick + CalcSick(status2)
        newSick = newSick + CalcSick(status3)
        newSick = newSick + CalcSick(status4)
        newSick = newSick + CalcSick(status5)
        conMISC.Open()
        strSQL = "SELECT sick_days FROM vacmast WHERE emp_no = @empNo"
        cmdSelect = New SqlCommand(strSQL, conMISC)
        cmdSelect.Parameters.Add("@empNo", usr_no)
        rsEmp = cmdSelect.ExecuteReader()
        rsEmp.Read()
        If rsEmp.HasRows Then
            oldSick = rsEmp("sick_days")
        End If
        conMISC.Close()
        newSick = newSick + oldSick
		
        conMISC.Open()
        strSQL = "UPDATE vacmast SET sick_days = @sick"
        strSQL = strSQL & " WHERE emp_no = @empNo"
        cmdUpdate = New SqlCommand(strSQL, conMISC)
        cmdUpdate.Parameters.Add("@sick", newSick)
        cmdUpdate.Parameters.Add("@empNo", usr_no)
        cmdUpdate.ExecuteNonQuery()
        conMISC.Close()

		'NEXT ADD THEIR ANNUAL LEAVE DAYS TO THE DETAIL TABLE
		
		'The following will go through all the days and search for consecutive days taken off in order to avoid creating individual records for each day. 
		'Half Days are created as individual records
		Dim i As Integer
		Dim j As Integer
		Dim tempIdDrop As String
		Dim tempIdDate As String
		Dim tempDate As TextBox
		Dim tempDrop As DropDownList
		Dim startDate As String
		Dim nextDate As String
		i = 1
		While i <= 5 
			newTake = 0
			tempIdDrop = "status" & CStr(i)
			tempDrop = Page.FindControl(tempIdDrop)
			tempIdDate = "date" & CStr(i)
			tempDate = Page.FindControl(tempIdDate)
			startDate = ""
			nextDate = ""
			If tempDrop.SelectedItem.Value = "1/2A" Then
				'ADD SINGLE DAY TO DETAILS TABLE
				newTake = 0.5
				startDate = tempDate.Text
				i = i + 1
			Else If tempDrop.SelectedItem.Value = "AL" Then
				startDate = tempDate.Text
				nextDate = startDate
				newTake = 1
				j = i
				While j < 5
					tempIdDrop = "status" & CStr(j + 1)
					tempDrop = Page.FindControl(tempIdDrop)
					If tempDrop.SelectedItem.Value = "AL" Then
						j = j + 1
						newTake = newTake + 1
						tempIdDate = "date" & CStr(j)
						tempDate = Page.FindControl(tempIdDate)		
						nextDate = tempDate.Text
					Else
						Exit While
					End If
				End While
				i = j + 1
			Else
				i = i + 1
			End If
			If newTake > 0 Then
				conMISC.Open()
				strSQL = "INSERT into vacdet (emp_no, begin_date, end_date, total_days) VALUES"
				strSQL = strSQL & " (@empNo, @beginDate, @endDate, @totalDays)"
				cmdInsert = New SqlCommand(strSQL, conMISC)
				cmdInsert.Parameters.Add("@empNo", usr_no)
				cmdInsert.Parameters.Add("@beginDate", DateValue(startDate))
				If newTake <= 1 Then
					cmdInsert.Parameters.Add("@endDate", DBNull.Value)
				Else
					cmdInsert.Parameters.Add("@endDate", DateValue(nextDate))
				End If
				cmdInsert.Parameters.Add("@totalDays", newTake)
				cmdInsert.ExecuteNonQuery()						 
				conMISC.Close()	
			End If
		End While

		'NEXT ADD THEIR SICK DAYS TO THE DETAIL TABLE AND REQUEST TABLE
		
		'The following will go through all the days and search for consecutive days taken off in order to avoid creating individual records for each day. 
		'Half Days are created as individual records
		i = 1
		While i <= 5 
			newTake = 0
			tempIdDrop = "status" & CStr(i)
			tempDrop = Page.FindControl(tempIdDrop)
			tempIdDate = "date" & CStr(i)
			tempDate = Page.FindControl(tempIdDate)
			startDate = ""
			nextDate = ""
			If tempDrop.SelectedItem.Value = "1/2S" Then
				'ADD SINGLE DAY TO DETAILS TABLE
				newTake = 0.5
				startDate = tempDate.Text
				i = i + 1
			Else If tempDrop.SelectedItem.Value = "S" Then
				startDate = tempDate.Text
				nextDate = startDate
				newTake = 1
				j = i
				While j < 5
					tempIdDrop = "status" & CStr(j + 1)
					tempDrop = Page.FindControl(tempIdDrop)
					If tempDrop.SelectedItem.Value = "S" Then
						j = j + 1
						newTake = newTake + 1
						tempIdDate = "date" & CStr(j)
						tempDate = Page.FindControl(tempIdDate)		
						nextDate = tempDate.Text
					Else
						Exit While
					End If
				End While
				i = j + 1
			Else
				i = i + 1
			End If
			If newTake > 0 Then
				conMISC.Open()
				'
				' INSERT INTO DETAIL TABLE FIRST
				'
				strSQL = "INSERT into vacdet (emp_no, begin_date, end_date, total_days) VALUES"
				strSQL = strSQL & " (@empNo, @beginDate, @endDate, @totalDays)"
				cmdInsert = New SqlCommand(strSQL, conMISC)
				cmdInsert.Parameters.Add("@empNo", usr_no)
				cmdInsert.Parameters.Add("@beginDate", DateValue(startDate))
				If newTake <= 1 Then
					cmdInsert.Parameters.Add("@endDate", DBNull.Value)
				Else
					cmdInsert.Parameters.Add("@endDate", DateValue(nextDate))
				End If
				cmdInsert.Parameters.Add("@totalDays", newTake)
				cmdInsert.ExecuteNonQuery()						 
				'
				' INSERT INTO REQUEST TABLE NEXT
				'
				strSQL = "INSERT into vacrequest (emp_no, dept_no, begin_date, end_date, total_days, approved, status) VALUES"
				strSQL = strSQL & " (@empNo, @deptNo, @beginDate, @endDate, @totalDays, @appsw, @statuscode)"
				cmdInsert = New SqlCommand(strSQL, conMISC)
				cmdInsert.Parameters.Add("@empNo", usr_no)
				cmdInsert.Parameters.Add("@deptNo", dept_no)
				cmdInsert.Parameters.Add("@beginDate", DateValue(startDate))
				If newTake <= 1 Then
					cmdInsert.Parameters.Add("@endDate", DBNull.Value)
				Else
					cmdInsert.Parameters.Add("@endDate", DateValue(nextDate))
				End If
				cmdInsert.Parameters.Add("@totalDays", newTake)
				cmdInsert.Parameters.Add("@appsw", "Y")
				cmdInsert.Parameters.Add("@statuscode", "S")
				cmdInsert.ExecuteNonQuery()						 
				conMISC.Close()	
			End If
		End While
	
		Call GetRecords()
		Call PopulateMainInfo(1)
		msgLbl.Text = "Record Approved."
	End Sub
	
	Function CalcTaken(sender As Object)
		If sender.SelectedItem.Value = "AL" Then
			CalcTaken = 1.0
		Else If sender.SelectedItem.Value = "1/2A" Then
			CalcTaken = 0.5
		Else If sender.SelectedItem.Value = "S" Then
			CalcTaken = 1.0
		Else If sender.SelectedItem.Value = "1/2S" Then
			CalcTaken = 0.5
		Else
			CalcTaken = 0.0
		End If
	End Function

    Function CalcSick(ByVal sender As Object)
        If sender.SelectedItem.Value = "S" Then
            CalcSick = 1.0
        ElseIf sender.SelectedItem.Value = "1/2S" Then
            CalcSick = 0.5
        Else
            CalcSick = 0.0
        End If
    End Function
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
line-height: 4px;
}

#mainButtons {
width: 110px;
height: 110px;
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

#approveDiv {
text-align: center;
clear: both;
padding: 6px 0px 0px 0px;
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
			<center><font size="3"><b>Annual Leave - Weekly Attendance Form</b></font></center><br><br>
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
					<asp:DropDownList width="90px" id="status1" class="mainTextBox" runat="server" OnSelectedIndexChanged="Status1_SelectedChanged" AutoPostBack="True" BackColor="#FFFFFF" ReadOnly="True">
					</asp:DropDownList>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Tuesday</asp:TextBox>
					<asp:TextBox width="88px" id="date2" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:DropDownList width="90px" id="status2" class="mainTextBox" runat="server" OnSelectedIndexChanged="Status2_SelectedChanged" AutoPostBack="True" BackColor="#FFFFFF" ReadOnly="True">
					</asp:DropDownList>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Wednesday</asp:TextBox>
					<asp:TextBox width="88px" id="date3" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:DropDownList width="90px" id="status3" class="mainTextBox" runat="server" OnSelectedIndexChanged="Status3_SelectedChanged" AutoPostBack="True" BackColor="#FFFFFF" ReadOnly="True">
					</asp:DropDownList>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Thursday</asp:TextBox>
					<asp:TextBox width="88px" id="date4" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:DropDownList width="90px" id="status4" class="mainTextBox" runat="server" OnSelectedIndexChanged="Status4_SelectedChanged" AutoPostBack="True" BackColor="#FFFFFF" ReadOnly="True">
					</asp:DropDownList>
					<BR>
					<asp:TextBox width="76px" class="mainTextBox" runat="server" BackColor="#e0e0e0" ReadOnly="True">Friday</asp:TextBox>
					<asp:TextBox width="88px" id="date5" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
					<asp:DropDownList width="90px" id="status5" class="mainTextBox" runat="server" OnSelectedIndexChanged="Status5_SelectedChanged" AutoPostBack="True" BackColor="#FFFFFF" ReadOnly="True">
					</asp:DropDownList>					
				</div>
				<div id="inputDate">
					<asp:TextBox id="inputDateTB" width="92px" runat="server" BackColor="#FFFFFF"></asp:TextBox><BR>			
				</div>
				<div id="mainButtons">
					<asp:Button id="newWeek" onclick="NewWeek_Click" runat="server" Width="100px" height="35px" Text="New Week"></asp:Button><BR>
					<asp:Button id="update" onclick="Update_Click" runat="server" Width="100px" height="35px" Text="Update"></asp:Button><BR><BR>
					<INPUT type="BUTTON" onClick="window.location.href='annualLeaveSuper.aspx'" style="width:100px;height:35px; margin:0px 0px 4px 0px;" value="Back">
				</div>
				<div id="approveDiv">
					<asp:Button id="approve" onClick="Approve_Click" runat="server" width="100px" height="35px" Text="Approve"></asp:Button>
				</div>
				<div id="msg">
					<br><br>
					<center><asp:Label id="msgLbl" runat="server" ForeColor="Red"></asp:Label></center>
				</div>
				<div id="pageBar">
						<asp:Button id="first" onclick="First_Click" runat="server" Width="60px" height="25px" Text="<< First"></asp:Button>
						&nbsp;<asp:Button id="prev" onclick="Prev_Click" runat="server" Width="60px" height="25px" Text="< Prev"></asp:Button>
						&nbsp;<asp:TextBox id="recCount" runat="server" width="170px" class="mainTextBox" runat="server" BackColor="#FFFFFF" ReadOnly="True"></asp:TextBox>
						<asp:TextBox id="hiddenRec" runat="server" Visible="False"></asp:TextBox>
						&nbsp;<asp:Button id="nextbut" onclick="Next_Click" runat="server" Width="60px" height="25px" Text="Next >"></asp:Button>&nbsp;
						<asp:Button id="last" onclick="Last_Click" runat="server" Width="60px" height="25px" Text="Last >>"></asp:Button>
						<BR>			
				</div>				
				<div id="msg2">
					<p>
					    <center><asp:Label id="msgLbl2" runat="server">Per SMCI Handbook (page 9), no employee is authorized to work over 40 hours in any week unless you have received permission 
                        from your supervisor/manager.</asp:Label></center>
                    </p>
				</div>
			</form>
		</div>
	</div>
</div>
</BODY>
</HEAD>