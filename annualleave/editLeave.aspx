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
			Call PopDrop()
			Call BindMainGrid()
		End If
	End Sub
	
	Function PopDrop()
		empLeave.Items.Clear()
		Dim sideKick As Boolean
		sideKick = IsSuper()
        conMISC.Open()
        If emp_no = 1065 Then
            strSQL = "SELECT emp_no, dept_no, last_name, first_name FROM employees WHERE emp_no = 1065 or emp_no = 1090 or emp_no = 1200 or emp_no = 1520 or emp_no = 2070 or emp_no = 2505 ORDER BY last_name ASC"
            cmdSelect = New SqlCommand(strSQL, conMISC)
        ElseIf emp_no = 1200 Then
            strSQL = "SELECT emp_no, dept_no, last_name, first_name FROM employees WHERE emp_no = 2030 or emp_no = 3050 or emp_no = 3570 or emp_no = 4120 ORDER BY last_name ASC"
            cmdSelect = New SqlCommand(strSQL, conMISC)
        ElseIf sideKick Then
            strSQL = "SELECT emp_no, dept_no, last_name, first_name FROM employees WHERE (dept_no = @deptNo) AND (emp_no != @empNo) AND (supervisor = @super) AND (term_date is null) ORDER BY last_name ASC"
            cmdSelect = New SqlCommand(strSQL, conMISC)
            cmdSelect.Parameters.Add("@deptNo", dept_no)
            cmdSelect.Parameters.Add("@empNo", emp_no)
            cmdSelect.Parameters.Add("@super", "N")
        Else
            'NO ACCESS
            Response.Clear()
            Response.End()
        End If
        rsEmp = cmdSelect.ExecuteReader()
		If rsEmp.HasRows then
			Dim fName as String
            'If emp_no = 1065 Then
            'empLeave.Items.Add(New ListItem("Robert Bates", 1065))
            'End If
            While rsEmp.Read()
                fName = rsEmp("first_name")
                fName = fName & " "
                fName = fName & rsEmp("last_name")
                empLeave.Items.Add(New ListItem(fName, rsEmp("emp_no")))
                'Response.Write(fName & ": " & rsEmp("emp_no") & "<BR>")
            End While
        Else
            'No employees under them.
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
	
	Function BindMainGrid()
        conMISC.Open()
		strSql = "SELECT vr.*, emp.first_name, emp.last_name FROM vacrequest AS vr INNER JOIN employees AS emp ON vr.emp_no = emp.emp_no WHERE (vr.emp_no = @empNo) AND (vr.approved = @approved) AND (vr.begin_date > @earliest) ORDER BY vr.begin_date DESC"
		dadData = New SqlDataAdapter(strSQL, conMISC)	
		dadData.SelectCommand.Parameters.Add("@approved", "Y")
		dadData.SelectCommand.Parameters.Add("@earliest", DateAdd("m", -12, DateValue(Now)))				
		dadData.SelectCommand.Parameters.Add("@empNo", empLeave.SelectedItem.Value)
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
	
	Sub Emp_SelectedChanged(sender As Object, e As EventArgs)
		Call BindMainGrid()
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
	
    Sub dg_Delete(sender As Object, e As DataGridCommandEventArgs)
        ' For bound columns the edited value is stored in a textbox,
        ' and the textbox is the 0th element in the column's cell
		Dim empNum As Integer = empLeave.SelectedItem.Value
        Dim tempTB As TextBox = e.Item.Cells(0).Controls(1)
        Dim beginDate As Date = tempTB.Text

		 'DELETE THE ENTRY FROM THE TABLE
		conMISC.Open()	
		strSQL = "DELETE FROM vacrequest "
		strSQL = strSQL & "WHERE emp_no = @empNo AND begin_date = @beginDate"
		cmdUpdate = New SqlCommand(strSQL, conMISC)
		cmdUpdate.Parameters.Add("@empNo", empNum)
		cmdUpdate.Parameters.Add("@beginDate", beginDate)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()				
		
		Call BindMainGrid()
    End Sub

    Sub dg_Edit(sender As Object, e As DataGridCommandEventArgs)
        mainGrid.EditItemIndex = e.Item.ItemIndex
        Call BindMainGrid()
    End Sub	
	
    Sub dg_Update(sender As Object, e As DataGridCommandEventArgs)
        ' For bound columns the edited value is stored in a textbox,
        ' and the textbox is the 0th element in the column's cell
		Dim empNum As Integer = empLeave.SelectedItem.Value
        Dim tempTB As TextBox = e.Item.Cells(0).Controls(1)
        Dim beginDate As Date = tempTB.Text
        tempTB = e.Item.Cells(1).Controls(1)
        Dim endDate As String = Trim(tempTB.Text)
        tempTB = e.Item.Cells(2).Controls(1)
        Dim totalDays As String = Trim(tempTB.Text)
        tempTB = e.Item.Cells(3).Controls(1)
        Dim approved As String = Left(Trim(tempTB.Text), 1)
        tempTB = e.Item.Cells(4).Controls(1)
        Dim status As String = Left(Trim(tempTB.Text), 1)
		

		 'UPDATE THE APPROVED STATUS IN THE DATABASE
		conMISC.Open()	
		strSQL = "UPDATE vacrequest SET end_date = @endDate, total_days = @totalDays, approved = @approved, status = @status "
		strSQL = strSQL & "WHERE emp_no = @empNo AND begin_date = @beginDate"
		cmdUpdate = New SqlCommand(strSQL, conMISC)		
		If endDate = "" Then
			cmdUpdate.Parameters.Add("@endDate", DBNull.Value)
		Else
			endDate = DateValue(endDate)		
			cmdUpdate.Parameters.Add("@endDate", endDate)
		End If		
		cmdUpdate.Parameters.Add("@approved", approved)
		cmdUpdate.Parameters.Add("@totalDays", totalDays)
		cmdUpdate.Parameters.Add("@status", status)
		cmdUpdate.Parameters.Add("@empNo", empNum)
		cmdUpdate.Parameters.Add("@beginDate", beginDate)
		cmdUpdate.ExecuteNonQuery()
		conMISC.Close()		
		
		mainGrid.EditItemIndex = -1		
		Call BindMainGrid()
    End Sub	
	
    Sub dg_Cancel(sender As Object, e As DataGridCommandEventArgs)
        mainGrid.EditItemIndex = -1
        Call BindMainGrid()
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

#mainBox {
width: 100%;
height: 240px;
margin: 0px 0px 0px 0px;
overflow: scroll;
}

#mainButtons {
width: 600px;
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

#dropDownPeeps {
width:100%;
clear: both;
float:left;
margin: 4px 0px 16px 0px;
text-align: center;
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
			<center><font size="3"><b>Edit Approved Leave</b></font></center>
			<BR><BR>
			<form id="ALMain" runat="server">
				<div id="dropDownPeeps">
					<asp:DropDownList id="empLeave" class="mainTextBox" runat="server" OnSelectedIndexChanged="Emp_SelectedChanged" AutoPostBack="True" BackColor="#FFFFFF">
					</asp:DropDownList>
				</div>
				<div id="mainBox">
					<asp:DataGrid id="mainGrid" runat="server" AutoGenerateColumns="False"
						 AllowSorting="False"
						 OnEditCommand="dg_Edit"
						 OnCancelCommand="dg_Cancel"
						 OnUpdateCommand="dg_Update"
						 OnDeleteCommand="dg_Delete"						 
						 DataKeyField="emp_no">
						<HeaderStyle font-size="9pt" HorizontalAlign="Center" font-names="Verdana" font-bold="True" backcolor="#e0e0e0"></HeaderStyle>
						<ItemStyle font-size="8pt" font-names="Verdana"></ItemStyle>
						<AlternatingItemStyle backcolor="#d3d3d3"></AlternatingItemStyle>
						<Columns>
							<asp:TemplateColumn headertext="Begin Date">
								<ItemTemplate>
								   <asp:TextBox id="mgTB3" style="TEXT-ALIGN: center" width="86px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "begin_date") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
								<EditItemTemplate>
								   <asp:TextBox id="mgTB3" style="TEXT-ALIGN: center" width="86px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "begin_date") %>'>
								   </asp:TextBox>					
								</EditItemTemplate>
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="End Date">
								<ItemTemplate>
								   <asp:TextBox id="mgTB4" style="TEXT-ALIGN: center" width="86px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CheckDate(Container.DataItem, "end_date") %>'>
								   </asp:TextBox>					
								</ItemTemplate>
								<EditItemTemplate>
								   <asp:TextBox id="mgTB4" style="TEXT-ALIGN: center" width="86px" BackColor="#99CCFF" ReadOnly="False" runat="server" Text='<%# CheckDate(Container.DataItem, "end_date") %>'>
								   </asp:TextBox>					
								</EditItemTemplate>									
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="Days">
								<ItemTemplate>
								   <asp:TextBox id="mgTB5" style="TEXT-ALIGN: center" width="50px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# CDbl(Container.DataItem("total_days")) %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
								<EditItemTemplate>
								   <asp:TextBox id="mgTB5" style="TEXT-ALIGN: center" width="50px" BackColor="#99CCFF" ReadOnly="False" runat="server" Text='<%# CDbl(Container.DataItem("total_days")) %>'>
								   </asp:TextBox>					
								</EditItemTemplate>
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="Approved">
								<ItemTemplate>
								   <asp:TextBox id="mgTB6" style="TEXT-ALIGN: center" width="70px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# Container.DataItem("approved") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
								<EditItemTemplate>
								   <asp:TextBox id="mgTB6" style="TEXT-ALIGN: center" width="70px" BackColor="#99CCFF" ReadOnly="False" runat="server" Text='<%# Container.DataItem("approved") %>'>
								   </asp:TextBox>					
								</EditItemTemplate>
							</asp:TemplateColumn>	
							<asp:TemplateColumn headertext="Status">
								<ItemTemplate>
								   <asp:TextBox id="mgTB7" style="TEXT-ALIGN: center" width="56px" BackColor="Transparent" ReadOnly="True" runat="server" Text='<%# Container.DataItem("status") %>'>
								   </asp:TextBox>					
								</ItemTemplate>	
								<EditItemTemplate>
								   <asp:TextBox id="mgTB7" style="TEXT-ALIGN: center" width="56px" BackColor="#99CCFF" ReadOnly="False" runat="server" Text='<%# Container.DataItem("status") %>'>
								   </asp:TextBox>					
								</EditItemTemplate>
							</asp:TemplateColumn>	
							<asp:EditCommandColumn ButtonType="PushButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" />
							<asp:ButtonColumn Text="Delete" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
						</Columns>
					</asp:DataGrid>					
				</div>
				<div id="mainButtons">
					<INPUT type="BUTTON" onClick="window.location.href='adminLeave.aspx'" style="width:120px;height:42px;" value="Back">
				</div>
			</form>
		</div>
	</div>
</div>
</BODY>
</HEAD>