<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Web.Mail" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.ODBC" %>
<script runat="server">

    Dim conPOINT as ODBCConnection
    Dim conPOINT2 as ODBCConnection
    Dim conPOINT3 as ODBCConnection
    Dim strSQL as String
    Dim cmdSelect as ODBCCommand
    Dim cmdSelect2 as ODBCCommand
    Dim cmdSelect3 as ODBCCommand
    Dim rs0200 as ODBCDataReader
    Dim rsASBU as ODBCDataReader
    Dim rsCL20 as ODBCDataReader
    Dim rsCL30 as ODBCDataReader
    Dim rsCL42 as ODBCDataReader
    Dim rsCL50 as ODBCDataReader
    Dim rsTBT as ODBCDataReader
    Dim IncDate as String
    Dim LossDate as String
    Dim ClmntStatus as String
    Dim ClaimPaid as Decimal
    Dim TotalPaid as Decimal
    Dim ReserveAmt as Decimal
    Dim TotalReserve as Decimal
    Dim ClaimCount as Decimal
    Dim PolicyCount as Decimal
    Dim BeginDate as String
    Dim EndDate as String

    Sub Page_Load
      If Not isPostBack then
        SetFocus(txtPolNo, "frmClaimList")
      End If
    End Sub
    
    Sub btnFindPol_Click(sender As Object, e As EventArgs)
        Dim ClaimType as String
        
        conPOINT = New ODBCConnection("DSN=C0ISERIES;UID=WEBUSR;PWD=smcwebusr")
        conPOINT.Open()
        conPOINT2 = New ODBCConnection("DSN=C0ISERIES;UID=WEBUSR;PWD=smcwebusr")
        conPOINT2.Open()
        conPOINT3 = New ODBCConnection("DSN=C0ISERIES;UID=WEBUSR;PWD=smcwebusr")
        conPOINT3.Open()

        Dim hRow = New TableRow
        Dim h1Cell = New TableCell
        h1Cell.Text = "MODULE"
        hRow.Cells.Add(h1Cell)
        Dim h2Cell = New TableCell
        h2Cell.Text = "EFF. DATE"
        hRow.Cells.Add(h2Cell)
        Dim h3Cell = New TableCell
        h3Cell.Text = "CLAIM NO."
        hRow.Cells.Add(h3Cell)
        Dim h4Cell = New TableCell
        h4Cell.Text = "LOSS DATE"
        hRow.Cells.Add(h4Cell)
        Dim h5Cell = New TableCell
        h5Cell.Text = "DESCRIPTION"
        hRow.Cells.Add(h5Cell)
        Dim h6Cell = New TableCell
        h6Cell.Text = "PAID"
        hRow.Cells.Add(h6Cell)
        Dim h7Cell = New TableCell
        h7Cell.Text = "RESERVE"
        hRow.Cells.Add(h7Cell)
        tblClmList.Rows.Add(hRow)
        
        TotalPaid = 0
        TotalReserve = 0
        ClaimCount = 0
        PolicyCount = 0
        BeginDate = ""
        EndDate = ""
        
        txtPolNo.Text = Mid(txtPolNo.Text, 1, 7)

        strSQL = "select * from PMSP0200 where SYMBOL = '" & ddSymbol.SelectedItem.Text & "' and POLICY0NUM = '" & txtPolNo.Text & "' and TRANS0STAT = 'V' order by MODULE DESC"
        cmdSelect = New ODBCCommand(strSQL, conPOINT)
        rs0200 = cmdSelect.ExecuteReader()

        Do While rs0200.Read()
            PolicyCount = PolicyCount + 1
            If EndDate = "" then
                If Mid(rs0200("EXP0YR"), 1, 1) = "1" then
                    EndDate = rs0200("EXP0MO") & "/" & rs0200("EXP0DA") & "/20" & Mid(rs0200("EXP0YR"), 2, 2)
                Else
                    EndDate = rs0200("EXP0MO") & "/" & rs0200("EXP0DA") & "/19" & Mid(rs0200("EXP0YR"), 1, 2)
                End if
            End if
            If Mid(rs0200("EFF0YR"), 1, 1) = "9" then
                BeginDate = rs0200("EFF0MO") & "/" & rs0200("EFF0DA") & "/19" & Mid(rs0200("EFF0YR"), 1, 2)
            Elseif Mid(rs0200("EFF0YR"), 1, 1) = "0" then
                BeginDate = rs0200("EFF0MO") & "/" & rs0200("EFF0DA") & "/19" & Mid(rs0200("EFF0YR"), 2, 2)
            Else
                BeginDate = rs0200("EFF0MO") & "/" & rs0200("EFF0DA") & "/20" & Mid(rs0200("EFF0YR"), 2, 2)
            End if
            if lblInsured.Text = "" then
                lblInsured.Text = rs0200("ADD0LINE01")
            end if
            lblPolicy.Text = rs0200("SYMBOL") & " " & rs0200("POLICY0NUM") & " valued as of " & Today()
            strSQL = "select * from ASBUCPL1 where BUARTX = '" & rs0200("MODULE") & "' and BUASTX = '" & rs0200("POLICY0NUM") & "' and BUADNB = '" & rs0200("MODULE") & "' and BUBRNB = 1"
            cmdSelect2 = New ODBCCommand(strSQL, conPOINT2)
            rsASBU = cmdSelect2.ExecuteReader()
            rsASBU.Read()
            If rsASBU.HasRows then
                lblAddress.Text = rsASBU("BUEFTX") & " " & rsASBU("BUEGTX")
                lblCityZip.Text = rsASBU("BUEITX") & " " & rsASBU("BUAPNB")
            else
                lblAddress.Text = rs0200("ADD0LINE03")
                lblCityZip.Text = rs0200("ADD0LINE04")
            end if
            rsASBU.Close()

            strSQL = "select * from PMSPCL42 where SYMBOL = '" & rs0200("SYMBOL") & "' and POLICYNO = '" & rs0200("POLICY0NUM") & "' and MODULE = '" & rs0200("MODULE") & "'"
            cmdSelect2 = New ODBCCommand(strSQL, conPOINT2)
            rsCL42 = cmdSelect2.ExecuteReader()
            
            Do While rsCL42.Read()
                Dim tRow = New TableRow
                Dim ModuleCell = New TableCell
                ModuleCell.Text = rs0200("MODULE")
                tRow.Cells.Add(ModuleCell)
                
                If Mid(rs0200("EFF0YR"), 1, 1) = "1" then
                    IncDate = rs0200("EFF0MO") & "/" & rs0200("EFF0DA") & "/20" & Mid(rs0200("EFF0YR"), 2, 2)
                else
                    IncDate = rs0200("EFF0MO") & "/" & rs0200("EFF0DA") & "/19" & Mid(rs0200("EFF0YR"), 1, 2)
                end if
                Dim EffCell = New TableCell
                EffCell.Text = IncDate
                tRow.Cells.Add(EffCell)

                Dim ClaimCell = New TableCell
                ClaimCell.Text = Mid(rsCL42("CLAIM"), 7, 6)
                tRow.Cells.Add(ClaimCell)
                tblClmList.Rows.Add(tRow)

                strSQL = "select * from PMSPCL20 where CLAIM = '" & rsCL42("CLAIM") & "'"
                cmdSelect3 = New ODBCCommand(strSQL, conPOINT3)
                rsCL20 = cmdSelect3.ExecuteReader()
                rsCL20.Read()

                If Mid(rsCL20("LOSSDTE"), 1, 1) = "1" then
                    LossDate = Mid(rsCL20("LOSSDTE"), 4, 2) & "/" & Mid(rsCL20("LOSSDTE"), 6, 2) & "/20" & Mid(rsCL20("LOSSDTE"), 2, 2)
                else
                    LossDate = Mid(rsCL20("LOSSDTE"), 3, 2) & "/" & Mid(rsCL20("LOSSDTE"), 5, 2) & "/19" & Mid(rsCL20("LOSSDTE"), 1, 2)
                end if
                Dim LossCell = New TableCell
                LossCell.Text = LossDate
                tRow.Cells.Add(LossCell)
                
                ClaimType = rsCL20("CLAIMTYPE")
                rsCL20.Close()

                If RTrim(rsCL42("SYMBOL")) = "WC" Then
                Else
                    If rsCL42("LOSSCAUSE") = "01" Or rsCL42("LOSSCAUSE") = "02" Then
                        If ClaimType = "AA" Then
                            strSQL = "select * from TBTC03Y where LOB = 'TNA' and LOSSCAUSE = '" & rsCL42("LOSSCAUSE") & "'"
                            cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                            rsTBT = cmdSelect3.ExecuteReader()
                            rsTBT.Read()
                            Dim DescrCell = New TableCell
                            DescrCell.Text = rsTBT("CLOSSNAME")
                            DescrCell.Text = rsCL42("LOSSCAUSE")
                            tRow.Cells.Add(DescrCell)
                            rsTBT.Close()
                        Else
                            strSQL = "select * from TBTC03Y where LOB = 'SMP' and LOSSCAUSE = '" & rsCL42("LOSSCAUSE") & "'"
                            cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                            rsTBT = cmdSelect3.ExecuteReader()
                            rsTBT.Read()
                            Dim DescrCell = New TableCell
                            DescrCell.Text = rsTBT("CLOSSNAME")
                            tRow.Cells.Add(DescrCell)
                            rsTBT.Close()
                        End If
                    Else
                        strSQL = "select * from TBTC03Y where LOSSCAUSE = '" & rsCL42("LOSSCAUSE") & "'"
                        cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                        rsTBT = cmdSelect3.ExecuteReader()
                        rsTBT.Read()
                        Dim DescrCell = New TableCell
                        DescrCell.Text = rsTBT("CLOSSNAME")
                        tRow.Cells.Add(DescrCell)
                        rsTBT.Close()
                    End If
                End If

                If RTrim(rsCL42("SYMBOL")) = "WC" Then
                    Dim DescrCell = New TableCell
                    DescrCell.Text = "MEDICAL"
                    tRow.Cells.Add(DescrCell)
                    
                    strSQL = "select sum(RESVPAYAMT) as PaidAmt from PMSPCL50 where CLAIM = '" & rsCL42("CLAIM") & "' and CLMTSEQ = " & rsCL42("CLMTSEQ")
                    strSQL = strSQL & " and POLCOVSEQ = " & rsCL42("POLCOVSEQ") & " and CLAIMTRANS in ('PP','FP','FF','IP','SP','PO','OA') and RESVNO = 8"
                    cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                    rsCL50 = cmdSelect3.ExecuteReader()
                    rsCL50.Read()
    
                    If rsCL50.IsDBNull(0) Then
                        ClaimPaid = 0
                    Else
                        ClaimPaid = rsCL50("PaidAmt") * -1
                    End If
                
                    TotalPaid = TotalPaid + ClaimPaid

                    Dim PmtsCell = New TableCell
                    PmtsCell.Text = Format(ClaimPaid, "Currency")
                    tRow.Cells.Add(PmtsCell)
                    tblClmList.Rows.Add(tRow)

                    rsCL50.Close()
                
                    If rsCL42("RECSTATUS") = "C" Then
                        ReserveAmt = 0
                    Else
                        strSQL = "select CURRRESV from PMSPCL50 where CLAIM = '" & rsCL42("CLAIM") & "' and CLMTSEQ = " & rsCL42("CLMTSEQ")
                        strSQL = strSQL & " and POLCOVSEQ = " & rsCL42("POLCOVSEQ") & " and RESVNO = 8 order by CLAIM, CLMTSEQ, POLCOVSEQ, TRANSSEQ DESC"
                        cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                        rsCL50 = cmdSelect3.ExecuteReader()
                        rsCL50.Read()

                        If rsCL50.HasRows Then
                            If rsCL50.IsDBNull(0) Then
                                ReserveAmt = 0
                            Else
                                ReserveAmt = rsCL50!CURRRESV
                            End If
                        End If
                        rsCL50.Close()
                    End If

                    Dim RsvCell = New TableCell
                    RsvCell.Text = Format(ReserveAmt, "Currency")
                    tRow.Cells.Add(RsvCell)
                    tblClmList.Rows.Add(tRow)
                
                    TotalReserve = TotalReserve + ReserveAmt

                    Dim indRow = New TableRow
                    Dim ind1Cell = New TableCell
                    ind1Cell.Text = " "
                    indRow.Cells.Add(ind1Cell)
                    Dim ind2Cell = New TableCell
                    ind2Cell.Text = " "
                    indRow.Cells.Add(ind2Cell)
                    Dim ind3Cell = New TableCell
                    ind3Cell.Text = " "
                    indRow.Cells.Add(ind3Cell)
                    Dim ind4Cell = New TableCell
                    ind4Cell.Text = " "
                    indRow.Cells.Add(ind4Cell)
                    Dim ind5Cell = New TableCell
                    ind5Cell.Text = "INDEMNITY"
                    indRow.Cells.Add(ind5Cell)
                    tblClmList.Rows.Add(indRow)

                    strSQL = "select sum(RESVPAYAMT) as PaidAmt from PMSPCL50 where CLAIM = '" & rsCL42("CLAIM") & "' and CLMTSEQ = " & rsCL42("CLMTSEQ")
                    strSQL = strSQL & " and POLCOVSEQ = " & rsCL42("POLCOVSEQ") & " and CLAIMTRANS in ('PP','FP','FF','IP','SP','PO','OA') and RESVNO = 9"
                    cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                    rsCL50 = cmdSelect3.ExecuteReader()
                    rsCL50.Read()
    
                    If rsCL50.IsDBNull(0) Then
                        ClaimPaid = 0
                    Else
                        ClaimPaid = rsCL50("PaidAmt") * -1
                    End If
                
                    TotalPaid = TotalPaid + ClaimPaid

                    Dim ind6Cell = New TableCell
                    ind6Cell.Text = Format(ClaimPaid, "Currency")
                    indRow.Cells.Add(ind6Cell)
                    tblClmList.Rows.Add(indRow)

                    rsCL50.Close()
                
                    If rsCL42("RECSTATUS") = "C" Then
                        ReserveAmt = 0
                    Else
                        strSQL = "select CURRRESV from PMSPCL50 where CLAIM = '" & rsCL42("CLAIM") & "' and CLMTSEQ = " & rsCL42("CLMTSEQ")
                        strSQL = strSQL & " and POLCOVSEQ = " & rsCL42("POLCOVSEQ") & " and RESVNO = 9 order by CLAIM, CLMTSEQ, POLCOVSEQ, TRANSSEQ DESC"
                        cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                        rsCL50 = cmdSelect3.ExecuteReader()
                        rsCL50.Read()

                        If rsCL50.HasRows Then
                            If rsCL50.IsDBNull(0) Then
                                ReserveAmt = 0
                            Else
                                ReserveAmt = rsCL50!CURRRESV
                            End If
                        End If
                        rsCL50.Close()
                    End If

                    Dim ind7Cell = New TableCell
                    ind7Cell.Text = Format(ReserveAmt, "Currency")
                    indRow.Cells.Add(ind7Cell)
                    tblClmList.Rows.Add(indRow)
                
                    TotalReserve = TotalReserve + ReserveAmt
                Else
                    strSQL = "select sum(RESVPAYAMT) as PaidAmt from PMSPCL50 where CLAIM = '" & rsCL42("CLAIM") & "' and CLMTSEQ = " & rsCL42("CLMTSEQ")
                    strSQL = strSQL & " and POLCOVSEQ = " & rsCL42("POLCOVSEQ") & " and CLAIMTRANS in ('PP','FP','FF','IP','SP','PO','OA') and RESVNO not in (2, 4)"
                    cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                    rsCL50 = cmdSelect3.ExecuteReader()
                    rsCL50.Read()
    
                    If rsCL50.IsDBNull(0) Then
                        ClaimPaid = 0
                    Else
                        ClaimPaid = rsCL50("PaidAmt") * -1
                    End If
                
                    TotalPaid = TotalPaid + ClaimPaid

                    Dim PmtsCell = New TableCell
                    PmtsCell.Text = Format(ClaimPaid, "Currency")
                    tRow.Cells.Add(PmtsCell)
                    tblClmList.Rows.Add(tRow)

                    rsCL50.Close()
                
                    If rsCL42("RECSTATUS") = "C" Then
                        ReserveAmt = 0
                    Else
                        strSQL = "select CURRRESV from PMSPCL50 where CLAIM = '" & rsCL42("CLAIM") & "' and CLMTSEQ = " & rsCL42("CLMTSEQ")
                        strSQL = strSQL & " and POLCOVSEQ = " & rsCL42("POLCOVSEQ") & " and RESVNO not in (2,4) order by CLAIM, CLMTSEQ, POLCOVSEQ, TRANSSEQ DESC"
                        cmdSelect3 = New OdbcCommand(strSQL, conPOINT3)
                        rsCL50 = cmdSelect3.ExecuteReader()
                        rsCL50.Read()

                        If rsCL50.HasRows Then
                            If rsCL50.IsDBNull(0) Then
                                ReserveAmt = 0
                            Else
                                ReserveAmt = rsCL50!CURRRESV
                            End If
                        End If
                        rsCL50.Close()
                    End If

                    Dim RsvCell = New TableCell
                    RsvCell.Text = Format(ReserveAmt, "Currency")
                    tRow.Cells.Add(RsvCell)
                    tblClmList.Rows.Add(tRow)
                
                    TotalReserve = TotalReserve + ReserveAmt
                End If
            Loop
            
            ClaimCount = ClaimCount + 1
            rsCL42.Close()
        Loop

        Dim tlRow = New TableRow
        Dim t1Cell = New TableCell
        t1Cell.Text = " "
        tlRow.Cells.Add(t1Cell)
        Dim t2Cell = New TableCell
        t2Cell.Text = " "
        tlRow.Cells.Add(t2Cell)
        Dim t3Cell = New TableCell
        t3Cell.Text = " "
        tlRow.Cells.Add(t3Cell)
        Dim t4Cell = New TableCell
        t4Cell.Text = " "
        tlRow.Cells.Add(t4Cell)
        Dim t5Cell = New TableCell
        t5Cell.Text = "TOTAL AMOUNTS"
        tlRow.Cells.Add(t5Cell)
        Dim t6Cell = New TableCell
        t6Cell.Text = Format(TotalPaid, "Currency")
        tlRow.Cells.Add(t6Cell)
        Dim t7Cell = New TableCell
        t7Cell.Text = Format(TotalReserve, "Currency")
        tlRow.Cells.Add(t7Cell)
        tblClmList.Rows.Add(tlRow)
        
        If PolicyCount = 0 then
            tblClmList.Rows.Clear()
            Dim NCRow = New TableRow
            Dim NCCell = New TableCell
            NCCell.Text = "POLICY NOT FOUND"
            NCRow.Cells.Add(NCCell)
            tblClmList.Rows.Add(NCRow)
        ElseIf ClaimCount = 0 then
            tblClmList.Rows.Clear()
            Dim NCRow = New TableRow
            Dim NCCell = New TableCell
            NCCell.Text = "THERE ARE NO CLAIMS FOR THIS POLICY."
            NCRow.Cells.Add(NCCell)
            tblClmList.Rows.Add(NCRow)
        End If
        
        lblPolDates.Text = "For Policy Dates " & BeginDate & " to " & EndDate

        Label1.Visible = FALSE
        ddSymbol.Visible = FALSE
        Label2.Visible = FALSE
        txtPolNo.Visible = FALSE

        rs0200.Close()
        SetFocus(txtPolNo, "frmClaimList")
        btnFindPol.Visible = FALSE
        conPOINT.Close()
        conPOINT2.Close()

        Dim EMailBody as String
        if (Trim(Session("AgentNo")) = "") Then
        else
            EMailBody =  "Loss Run Request from " & Session("AgentNo") & " for " & lblPolicy.Text & "--" & lblInsured.Text
            SmtpMail.SmtpServer = "mail.smcins.com"
            SmtpMail.Send( _
                "website@smcins.com", _                               
                "dkarns@smcins.com", _
                "Loss Run Request", _
                EMailBody )
        end if
    End Sub
    

Public Shared Sub SetFocus(ByVal ctrl As Control, ByVal formName As String) 

  Dim sb As New StringBuilder 
  Dim p As Control = ctrl.Parent 

  With sb 
    .Append("<script language='JavaScript' type='text/javascript'>") 
    .Append("function SetFocus()") 
    .Append("{") 
    If formName = String.Empty Then 
    .Append("document.forms(0).") 
    Else 
    .Append("document.forms('" + formName + "').") 
    End If 
    .Append(ctrl.UniqueID) 
    .Append(".focus();") 
    .Append("}") 
    .Append("window.onload = SetFocus;") 
    .Append("") 
    .Append("<" + "/script>") 
  End With 

  ctrl.Page.RegisterClientScriptBlock("SetFocus", sb.ToString()) 

End Sub 

</script>
<html>
<head>
    <style type="text/css">A {
	TEXT-DECORATION: none
}
.copy {
	LINE-HEIGHT: 12px; TEXT-ALIGN: justify
}
.copynj {
	LINE-HEIGHT: 12px; TEXT-ALIGN: left
}
</style>
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" body="body" marginwidth="0" marginheight="0">
    <form runat="server" id="frmClaimList">
        <p>
            <strong><font face="Verdana, Arial, Helvetica, sans-serif" font size="3">
            &nbsp;&nbsp;&nbsp;&nbsp;Southern Mutual Church Insurance Co.</br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Claim Listing </font></strong>
        </p>
        <p>
            <asp:Label id="Label1" runat="server" font-names="Verdana" height="16px" width="60px" font-bold="True" font-size="Smaller">Symbol </asp:Label>
            <asp:DropDownList id="ddSymbol" runat="server" Font-Names="Verdana">
                <asp:ListItem Value="SMP">SMP</asp:ListItem>
                <asp:ListItem Value="BA">BA</asp:ListItem>
                <asp:ListItem Value="WC">WC</asp:ListItem>
                <asp:ListItem Value="UM">UM</asp:ListItem>
                <asp:ListItem Value="STD">STD</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Label id="Label2" runat="server" font-names="Verdana" height="16px" width="80px" font-bold="True" font-size="Smaller">Policy No. </asp:Label>
            <asp:TextBox id="txtPolNo" runat="server" Font-Size="Smaller" Font-Names="Verdana" Width="80px"></asp:TextBox>
            &nbsp;&nbsp; 
            <asp:button id="btnFindPol" onclick="btnFindPol_Click" runat="server" Width="64px" Text="Go"></asp:button>
        </p>
        <p>
            <asp:Label id="lblInsured" runat="server" font-names="Verdana" height="16px" width="500px" font-bold="True" font-size="Smaller"></asp:Label>
            </br>
            <asp:Label id="lblAddress" runat="server" font-names="Verdana" height="16px" width="500px" font-bold="True" font-size="Smaller"></asp:Label>
            </br>
            <asp:Label id="lblCityZip" runat="server" font-names="Verdana" height="16px" width="500px" font-bold="True" font-size="Smaller"></asp:Label>
        </p>
        <p>
            <asp:Label id="lblPolicy" runat="server" font-names="Verdana" height="16px" width="300px" font-bold="True" font-size="Smaller"></asp:Label>
        </p>
        <p>
            <asp:Label id="lblPolDates" runat="server" font-names="Verdana" height="16px" width="500px" font-bold="True" font-size="Smaller"></asp:Label>
        </p>
        <p>
            <asp:Table id="tblClmList" GridLines="none" CellSpacing="10" font-names="Verdana" font-size="Smaller" runat="server"></asp:Table>
        </p>
    </form>
</body>
</html>
