Imports System
Imports System.IO
Imports System.Linq
Imports System.Collections
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
'Imports System.Web.UI.WebControls.WebParts
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports IBM.Data.DB2.iSeries
Imports System.Threading
Imports iTextSharp.text
Imports iTextSharp.text.pdf



Partial Class AgencyPortal_Administrator_Test
    Inherits System.Web.UI.Page

    'Dim counter As Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        Dim YY As String = "1" + Now().ToString("yy")
        Dim LastYear As String = ("1" + Now().ToString("yy")) - 1
        'Dim counter As Integer


        If ddlYear.SelectedValue = YY Then
            GetLastMonthStatement()
            RemoveFutureMonths(YY)
        End If

        'counter += 1
        'If ddlYear.SelectedValue = LastYear And counter = 1 Then
        '    'Dim test As Integer = ddlMonth.c
        '    'counter = (counter) + 1
        '    'counter += 1
        '    DisplayAllMonth()
        'ElseIf ddlYear.SelectedValue = LastYear And counter = 2 Then

        '    GetSelectedMonth()
        'End If

        'If ddlYear.AutoPostBack = True Then
        '    GetSelectedMonth()
        'End If



    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Session("StartDate") = String.Empty
        Session("EndDate") = String.Empty
        Session("anum") = String.Empty
        Session("TOTALPREM") = String.Empty

        'Session("DateRange") = ddlYear.SelectedValue + "" + ddlMonth.SelectedValue
        Session("anum") = ddlSelectAgency.SelectedValue
        Dim GreaterDate As Integer = "1" + Now().ToString("yy") + "" + Now().ToString("MM")
        Dim LessDate As Integer = ddlYear.SelectedValue + "" + ddlMonth.SelectedValue


        'Dim somedata As DataRow = GetData3("SELECT p.RISK0STATE As STATE, r2.D2POLSYM As POLICYTYPE, r2.D2POLSYM + ' ' + r2.D2POLNO + '-' + r2.D2POLMOD As POLICYNUMBER, p.ADD0LINE01 As INSUREDNAME, substring(p.EFFDT,4,2) + '/' + substring(p.EFFDT,6,2) + '/' + substring(p.EFFDT,2,2) As EFFDATE, r2.D2HRVA As PAIDPREM, r2.D2CGVA As SERVICECHARGE, r2.D2HLVA, r2.D2HJVA As PAIDCOMMISSION, r2.D2CMVA As ORIGINALPREMIUM FROM RCD2CPP As r2 INNER JOIN RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN @start AND @end AND D2DHNB = @agency AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN @start AND @end AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)
        'GridView1.DataSourc = somedata.Item("POLICYTYPE")
        'GridView1.DataBind()


        If GreaterDate > LessDate Then
            GetDateRange()
            'Dim dr1 As DataRow = GetData1("SELECT DISTINCT r.D2DHNB As AGENTNUMBER, pa.ACNM_NAME1 As AGENCY, pa.ACNM_ADDRS As MAILADDRESS, pa.ACNM_CTYST || ' ' || pa.ACNM_ZIP As CITYZIP FROM SOMRC0DAT.RCD2CPP As r INNER JOIN SOMRC0DAT.PMSPAG00 as pa ON r.D2DHNB=pa.AGNM_AGCY WHERE r.D2B7ST='PCOM' AND pa.AGNM_AGCY = " + Session("anum").ToString).Rows(0)
            Dim dr1 As DataRow = GetData1("SELECT AGNM_AGCY As AGENTNUMBER, ACNM_NAME1 As AGENCY, ACNM_ADDRS As MAILADDRESS, ACNM_CTYST || ' ' || ACNM_ZIP As CITYZIP FROM SOMRC0DAT.PMSPAG00 WHERE AGNM_AGCY = " + Session("anum").ToString).Rows(0)
            'Dim dr2 As DataRow = GetData2("SELECT r.D2POLSYM As POLICYTYPE, r.D2POLSYM || ' ' || r.D2POLNO || '-' || r.D2POLMOD As POLICYNUMBER, l.ADD0LINE01 As INSUREDNAME, substring(l.EFFDT,4,2) || '/' || substring(l.EFFDT,6,2) || '/' || substring(l.EFFDT,2,2) As EFFDATE, r.D2CDVA As PAIDPREMIUM, ' ' As COMMRATE, r.D2HLVA As PAIDCOMMISSION, r.D2CMVA As ORIGINALPREMIUM, r.D2B7ST, r.D2HMVA As DATERANGE, pa.AGNM_STATE FROM SOMRC0DAT.RCD2CPP As r INNER JOIN SOMRC0DAT.PMSL0217 As l ON ((r.D2POLSYM=l.SYMBOL) AND (r.D2POLNO=l.POLICY0NUM)) AND (r.D2POLMOD=l.MODULE) INNER JOIN SOMRC0DAT.PMSPAG00 as pa ON r.D2DHNB=pa.AGNM_AGCY WHERE r.D2HMVA = ? AND r.D2B7ST='PCOM' AND pa.AGNM_AGCY = " + Session("AgentNumber").ToString).Rows(0)
            'Dim dr3 As DataRow = GetData2("SELECT SUM(r.D2CDVA) As TOTALPREM FROM SOMRC0DAT.RCD2CPP As r INNER JOIN SOMRC0DAT.PMSL0217 As l ON ((r.D2POLSYM=l.SYMBOL) AND (r.D2POLNO=l.POLICY0NUM)) AND (r.D2POLMOD=l.MODULE) INNER JOIN SOMRC0DAT.PMSPAG00 as pa ON r.D2DHNB=pa.AGNM_AGCY WHERE r.D2HMVA = ? AND r.D2B7ST='PCOM' AND pa.AGNM_AGCY = " + Session("AgentNumber").ToString).Rows(0)
            'Dim dr4 As DataRow = GetData2("SELECT SUM(r.D2HLVA) As TOTALCOMM FROM SOMRC0DAT.RCD2CPP As r INNER JOIN SOMRC0DAT.PMSL0217 As l ON ((r.D2POLSYM=l.SYMBOL) AND (r.D2POLNO=l.POLICY0NUM)) AND (r.D2POLMOD=l.MODULE) INNER JOIN SOMRC0DAT.PMSPAG00 as pa ON r.D2DHNB=pa.AGNM_AGCY WHERE r.D2HMVA = ? AND r.D2B7ST='PCOM' AND pa.AGNM_AGCY = " + Session("AgentNumber").ToString).Rows(0)
            'Dim dr5 As DataRow = GetData2("SELECT p.RISK0STATE As STATE, r2.D2POLSYM As POLICYTYPE, r2.D2POLSYM || ' ' || r2.D2POLNO || '-' || r2.D2POLMOD As POLICYNUMBER, p.ADD0LINE01 As INSUREDNAME, substring(p.EFFDT,4,2) || '/' || substring(p.EFFDT,6,2) || '/' || substring(p.EFFDT,2,2) As EFFDATE, r2.D2HRVA, r2.D2CGVA, r2.D2HLVA, r2.D2HJVA As PAIDCOMMISSION, r2.D2CMVA As ORIGINALPREMIUM FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON ((r2.D2POLSYM=r0.D0POLSYM) AND (r2.D2POLNO=r0.D0POLNO)) AND (r2.D2POLMOD=r0.D0POLMOD) AND (r2.D2BHNB=r0.D0CURRIN) AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND (r2.D2B8ST <> 'W') AND (r2.D2HJVA <> '0') AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND (D2B8ST <> 'W') AND (D2DHNB = ?) AND (r2.D2AKDT BETWEEN ? AND ?) AND (D2POLSYM=D0POLSYM) AND (D2POLNO=D0POLNO) AND (D2POLMOD=D0POLMOD) AND (D2BHNB=D0CURRIN)) INNER JOIN SOMRC0DAT.PMSL0217 As p ON (p.SYMBOL = r2.D2POLSYM) AND (p.POLICY0NUM = r2.D2POLNO) AND (p.MODULE = r2.D2POLMOD) WHERE (r2.D2AKDT BETWEEN ? AND ?) AND r2.D2DHNB = " + Session("AgentNumber").ToString).Rows(0)
            'Dim dr6 As DataRow = GetData2("SELECT SUM(r2.D2HRVA) As SUMPREM FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON ((r2.D2POLSYM=r0.D0POLSYM) AND (r2.D2POLNO=r0.D0POLNO)) AND (r2.D2POLMOD=r0.D0POLMOD) AND (r2.D2BHNB=r0.D0CURRIN) AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND (r2.D2B8ST <> 'W') AND (r2.D2HJVA <> '0') AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND (D2B8ST <> 'W') AND (D2DHNB = ?) AND (D2POLSYM=D0POLSYM) AND (D2POLNO=D0POLNO) AND (D2POLMOD=D0POLMOD) AND (D2BHNB=D0CURRIN)) INNER JOIN SOMRC0DAT.PMSL0217 As p ON (p.SYMBOL = r2.D2POLSYM) AND (p.POLICY0NUM = r2.D2POLNO) AND (p.MODULE = r2.D2POLMOD) WHERE r2.D2AKDT BETWEEN ? AND ? AND r2.D2DHNB = " + Session("AgentNumber").ToString).Rows(0)
            'Dim dr7 As DataRow = GetData2("SELECT SUM(r2.D2CGVA) As SERVICECHARGE FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON ((r2.D2POLSYM=r0.D0POLSYM) AND (r2.D2POLNO=r0.D0POLNO)) AND (r2.D2POLMOD=r0.D0POLMOD) AND (r2.D2BHNB=r0.D0CURRIN) AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND (r2.D2B8ST <> 'W') AND (r2.D2HJVA <> '0') AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND (D2B8ST <> 'W') AND (D2DHNB = ?) AND (D2POLSYM=D0POLSYM) AND (D2POLNO=D0POLNO) AND (D2POLMOD=D0POLMOD) AND (D2BHNB=D0CURRIN)) INNER JOIN SOMRC0DAT.PMSL0217 As p ON (p.SYMBOL = r2.D2POLSYM) AND (p.POLICY0NUM = r2.D2POLNO) AND (p.MODULE = r2.D2POLMOD) WHERE r2.D2AKDT BETWEEN ? AND ? AND r2.D2DHNB = " + Session("AgentNumber").ToString).Rows(0)
            '(LEFT(r2.D2AKDT,5) = ?) AND

            Dim drCheck As DataRow = GetData3("SELECT COUNT(r2.D2POLNO) As HowManyRows FROM RCD2CPP As r2 INNER JOIN RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN @start AND @end AND D2DHNB = @agency AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN @start AND @end AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)
            If drCheck.Item("HowManyRows") = 0 Then
                Response.Write("<script type=""text/javascript"">alert(""No policies at this time."");</script")
            Else

                'Dim dr5 As DataRow = GetData2("SELECT CHAR(p.RISK0STATE) As STATE, CHAR(r2.D2POLSYM) As POLICYTYPE, CHAR(r2.D2POLSYM) || ' ' || CHAR(r2.D2POLNO) || '-' || CHAR(r2.D2POLMOD) As POLICYNUMBER, CHAR(p.ADD0LINE01) As INSUREDNAME, substring(p.EFFDT,4,2) || '/' || substring(p.EFFDT,6,2) || '/' || substring(p.EFFDT,2,2) As EFFDATE, CHAR(r2.D2HRVA) As PAIDPREM, CHAR(r2.D2CGVA) As SERVICECHARGE, CHAR(r2.D2HLVA), CHAR(r2.D2HJVA) As PAIDCOMMISSION, CHAR(r2.D2CMVA) As ORIGINALPREMIUM FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN ? AND ? AND D2DHNB = ? AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN SOMRC0DAT.PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN ? AND ? AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)
                Dim dr5 As DataRow = GetData4("SELECT p.RISK0STATE As STATE, r2.D2POLSYM As POLICYTYPE, r2.D2POLSYM + ' ' + r2.D2POLNO + '-' + r2.D2POLMOD As POLICYNUMBER, p.ADD0LINE01 As INSUREDNAME, substring(p.EFFDT,4,2) + '/' + substring(p.EFFDT,6,2) + '/' + substring(p.EFFDT,2,2) As EFFDATE, r2.D2HRVA As PAIDPREM, r2.D2CGVA As SERVICECHARGE, r2.D2HLVA, r2.D2HJVA As PAIDCOMMISSION, r2.D2CMVA As ORIGINALPREMIUM FROM RCD2CPP As r2 INNER JOIN RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN @start AND @end AND D2DHNB = @agency AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN @start AND @end AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)


                'Total for Paid Prem
                'Dim dr6 As DataRow = GetData2("SELECT SUM(r2.D2HRVA) As SUMPREM FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN ? AND ? AND D2DHNB = ? AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN SOMRC0DAT.PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN ? AND ? AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)
                Dim dr6 As DataRow = GetData3("SELECT SUM(r2.D2HRVA) As SUMPREM FROM RCD2CPP As r2 INNER JOIN RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN @start AND @end AND D2DHNB = @agency AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN @start AND @end AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)

                'Service Charge
                'Dim dr7 As DataRow = GetData2("SELECT SUM(r2.D2CGVA) As SERVICECHARGE FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN ? AND ? AND D2DHNB = ? AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN SOMRC0DAT.PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN ? AND ? AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)
                Dim dr7 As DataRow = GetData3("SELECT SUM(r2.D2CGVA) As SERVICECHARGE FROM RCD2CPP As r2 INNER JOIN RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN @start AND @end AND D2DHNB = @agency AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN @start AND @end AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)

                'Commission D2HLVA or D2HJVA
                'Dim dr8 As DataRow = GetData2("SELECT SUM(r2.D2HJVA) As TOTALCOMM FROM SOMRC0DAT.RCD2CPP As r2 INNER JOIN SOMRC0DAT.RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM SOMRC0DAT.RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN ? AND ? AND D2DHNB = ? AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN SOMRC0DAT.PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN ? AND ? AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)
                Dim dr8 As DataRow = GetData3("SELECT SUM(r2.D2HJVA) As TOTALCOMM FROM RCD2CPP As r2 INNER JOIN RCD0CPP As r0 ON r2.D2POLSYM=r0.D0POLSYM AND r2.D2POLNO = r0.D0POLNO AND r2.D2POLMOD = r0.D0POLMOD AND r2.D2BHNB = r0.D0CURRIN AND r2.D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND r2.D2B8ST <> 'W' AND r2.D2HJVA <> 0 AND r2.D2BINB = (SELECT MAX(D2BINB) FROM RCD2CPP WHERE D2B7ST NOT IN ('PCOM','RESC','BILL','INV') AND D2B8ST <> 'W' AND D2AKDT BETWEEN @start AND @end AND D2DHNB = @agency AND D2POLSYM = D0POLSYM AND D2POLNO=D0POLNO AND D2POLMOD=D0POLMOD AND D2BHNB=D0CURRIN) INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD AND r2.D2AKDT BETWEEN @start AND @end AND r2.D2DHNB = " + Session("anum").ToString).Rows(0)


                'Dim query As String = Session("AgentNumber")
                'Dim x As String = GetData2(query).Item("POLICYNUMBER").POLICYNUMBER


                'Code works - There are 72 points in one inch, width 216pt(3 inches), height 720pt(10 inches) 3 x 10 in.
                Dim pageSize As New Rectangle(792.0F, 612.0F)

                'Set margins 54 left, 54 right, 50 top, 125 bottom
                Dim document As New Document(pageSize, 54, 54, 50, 125)

                ''The 12 represents the line spacing
                'Dim header As New Paragraph(12)

                Using memoryStream As New System.IO.MemoryStream()
                    Dim writer As PdfWriter = PdfWriter.GetInstance(document, memoryStream)

                    document.Open()

                    Dim FontStyle As Font = New Font(FontFactory.GetFont("Calibri", 9, Font.NORMAL))
                    Dim FontBold As Font = New Font(FontFactory.GetFont("Calibri", 11, Font.BOLD))

                    'Created a new instance of table with 1 column 
                    Dim mainHeader As New PdfPTable(1)

                    'Set spacing before mainHeader to 10
                    mainHeader.SpacingBefore = 10.0F

                    'Set spacing after mainHeader to 40
                    mainHeader.SpacingAfter = 40.0F

                    'No border width for mainHeader
                    mainHeader.DefaultCell.Border = PdfPCell.NO_BORDER

                    'Set horizontal aligment to center in mainHeader
                    mainHeader.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER

                    'Created a new instance of table with 1 column
                    Dim table1 As New PdfPTable(2)

                    'Set spacing after table1 to 20
                    table1.SpacingAfter = 20.0F

                    'No border width for table1
                    table1.DefaultCell.Border = PdfPCell.NO_BORDER

                    'Changing column widths as 3 represents 1 column width space
                    Dim width1 As Single() = {4.0F, 7.0F, 2.0F, 3.0F, 2.0F, 3.0F, 3.0F}

                    'Create a new instance of sub header with 7 columns
                    Dim subHeader As New PdfPTable(width1)

                    'No border width for table1
                    subHeader.DefaultCell.BorderWidthLeft = PdfPCell.NO_BORDER
                    subHeader.DefaultCell.BorderWidthTop = PdfPCell.NO_BORDER
                    subHeader.DefaultCell.BorderWidthRight = PdfPCell.NO_BORDER

                    'Set bottom padding
                    subHeader.DefaultCell.PaddingBottom = 4.0F

                    'Created a new instance of table with 7 columns
                    Dim table2 As New PdfPTable(width1)

                    'No border width for table1
                    table2.DefaultCell.Border = PdfPCell.NO_BORDER

                    'Set top & bottom padding
                    table2.DefaultCell.PaddingTop = 10
                    table2.DefaultCell.PaddingBottom = 5

                    'Set the Ascender and Decender to true
                    table2.DefaultCell.UseAscender = True
                    table2.DefaultCell.UseDescender = True

                    'Created a new instance of table with 7 columns
                    Dim table3 As New PdfPTable(width1)

                    'No border width for table1
                    table3.DefaultCell.BorderWidthLeft = PdfPCell.NO_BORDER
                    table3.DefaultCell.BorderWidthBottom = PdfPCell.NO_BORDER
                    table3.DefaultCell.BorderWidthRight = PdfPCell.NO_BORDER

                    'Set top & bottom padding
                    table3.DefaultCell.PaddingTop = 10
                    table3.DefaultCell.PaddingBottom = 2


                    'Changing column widths as 3 represents 1 column width space
                    'Dim width1 As Single() = {3.0F, 3.0F, 3.0F, 7.0F, 3.0F, 7.0F, 3.0F}

                    Dim cell_1 As PdfPCell

                    Dim cell_left As PdfPCell

                    Dim cell_right As PdfPCell

                    Dim cell_2 As PdfPCell

                    Dim cell_3 As PdfPCell

                    Dim cell_4 As PdfPCell


                    cell_1 = New PdfPCell
                    cell_1.Colspan = 1
                    cell_1.Border = PdfPCell.NO_BORDER
                    mainHeader.AddCell("Southern Mutual Church Insurance Company")
                    Dim line2 As Paragraph = New Paragraph("Agency Commission Statement", FontStyle)
                    Dim line3 As Paragraph = New Paragraph("for Month ending " + ddlMonth.SelectedValue + "/" + ddlYear.SelectedItem.Text, FontStyle)
                    mainHeader.AddCell(line2)
                    mainHeader.AddCell(line3)
                    mainHeader.AddCell(cell_1)

                    Dim p1 As Paragraph = New Paragraph(dr1.Item("AGENCY").ToString, FontStyle)
                    Dim p2 As Paragraph = New Paragraph("AGENCY: " + dr1.Item("AGENTNUMBER").ToString, FontStyle)
                    Dim p3 As Paragraph = New Paragraph(dr1.Item("MAILADDRESS").ToString, FontStyle)
                    Dim p4 As Paragraph = New Paragraph(dr1.Item("CITYZIP"), FontStyle)
                    p1.Alignment = Element.ALIGN_LEFT
                    p2.Alignment = Element.ALIGN_RIGHT
                    p3.Alignment = Element.ALIGN_LEFT
                    p4.Alignment = Element.ALIGN_LEFT
                    cell_left = New PdfPCell
                    cell_left.Border = PdfPCell.NO_BORDER
                    cell_left.AddElement(p1)
                    cell_left.AddElement(p3)
                    cell_left.AddElement(p4)
                    cell_right = New PdfPCell
                    cell_right.Border = PdfPCell.NO_BORDER
                    cell_right.AddElement(p2)
                    table1.AddCell(cell_left)
                    table1.AddCell(cell_right)


                    cell_2 = New PdfPCell
                    'cell_2.Colspan = 5
                    'table2.AddCell(cell_2) 
                    cell_2.UseBorderPadding = True
                    cell_2.NoWrap = False
                    'cell_2.Width = 32.0F
                    'cell_2.FixedHeight = 36.0F
                    Dim sh1 As Paragraph = New Paragraph("Policy Number", FontBold)
                    Dim sh2 As Paragraph = New Paragraph("Insured Name", FontBold)
                    Dim sh3 As Paragraph = New Paragraph("Eff. Date", FontBold)
                    Dim sh4 As Paragraph = New Paragraph("Paid Prem.", FontBold)
                    Dim sh5 As Paragraph = New Paragraph("Comm. Rate", FontBold)
                    Dim sh6 As Paragraph = New Paragraph("Paid Comm.", FontBold)
                    Dim sh7 As Paragraph = New Paragraph("Original Premium", FontBold)

                    sh4.Alignment = Element.ALIGN_RIGHT
                    sh5.Alignment = Element.ALIGN_RIGHT
                    sh6.Alignment = Element.ALIGN_RIGHT
                    sh7.Alignment = Element.ALIGN_RIGHT
                    subHeader.AddCell(sh1)
                    subHeader.AddCell(sh2)
                    subHeader.AddCell(sh3)
                    subHeader.AddCell(sh4)
                    subHeader.AddCell(sh5)
                    subHeader.AddCell(sh6)
                    subHeader.AddCell(sh7)
                    subHeader.AddCell(cell_2)


                    Dim iRow As Integer = 0
                    For iRow = 0 To dr5.Table.Rows.Count - 1

                        Dim PolicyType As String = dr5.Table.Rows(iRow).Item("POLICYTYPE")
                        Dim AgencyState As String = dr5.Table.Rows(iRow).Item("STATE")

                        Dim COMMRATE As String

                        If PolicyType.ToString = "SMP" Then
                            COMMRATE = "0.150"
                        ElseIf PolicyType.ToString = "STD" Then
                            COMMRATE = "0.150"
                        ElseIf PolicyType.ToString = "UM " Then
                            COMMRATE = "0.150"
                        ElseIf PolicyType.ToString = "WC " Then
                            COMMRATE = "0.050"
                        ElseIf PolicyType.ToString = "BA " And AgencyState.ToString = "39" Then
                            COMMRATE = "0.075"
                        ElseIf PolicyType.ToString = "BA " And AgencyState.ToString <> "39" Then
                            COMMRATE = "0.100"
                        Else
                            COMMRATE = "0.000"
                        End If

                        Dim num1 As Decimal = dr5.Table.Rows(iRow).Item("PAIDPREM")
                        Dim num2 As Decimal = dr5.Table.Rows(iRow).Item("SERVICECHARGE")
                        Dim PaidPremium As Decimal
                        If num1 > 0 Then
                            PaidPremium = num1 * -1
                        Else
                            PaidPremium = (num1 * -1) + num2
                        End If



                        Dim p5 As Paragraph = New Paragraph(dr5.Table.Rows(iRow).Item("POLICYNUMBER"), FontStyle)
                        Dim p6 As Paragraph = New Paragraph(dr5.Table.Rows(iRow).Item("INSUREDNAME"), FontStyle)
                        Dim p7 As Paragraph = New Paragraph(dr5.Table.Rows(iRow).Item("EFFDATE"), FontStyle)
                        Dim p8 As Paragraph = New Paragraph(PaidPremium, FontStyle)
                        Dim p9 As Paragraph = New Paragraph(COMMRATE, FontStyle)
                        Dim p10 As Paragraph = New Paragraph(dr5.Table.Rows(iRow).Item("PAIDCOMMISSION"), FontStyle)
                        Dim p11 As Paragraph = New Paragraph(dr5.Table.Rows(iRow).Item("ORIGINALPREMIUM"), FontStyle)
                        p8.Alignment = Element.ALIGN_RIGHT
                        p9.Alignment = Element.ALIGN_RIGHT
                        p10.Alignment = Element.ALIGN_RIGHT
                        p11.Alignment = Element.ALIGN_RIGHT
                        cell_3 = New PdfPCell
                        table2.AddCell(p5)
                        table2.AddCell(p6)
                        table2.AddCell(p7)
                        table2.AddCell(p8)
                        table2.AddCell(p9)
                        table2.AddCell(p10)
                        table2.AddCell(p11)
                        ' table2.AddCell(cell_3)
                    Next


                    Dim total1 As Decimal = dr6.Item("SUMPREM")
                    Dim total2 As Decimal = dr7.Item("SERVICECHARGE")
                    Dim TotalPremium As Decimal
                    If total1 > 0 Then
                        TotalPremium = total1 * -1
                    Else
                        TotalPremium = (total1 * -1) + total2

                        'TotalPremium = total1 * -1
                        'TotalPremium = (total1 + total2)
                    End If

                    Session("TOTALPREM") = TotalPremium



                    'cell_3 = New PdfPCell
                    'table2.AddCell(cell_3)

                    cell_4 = New PdfPCell
                    cell_4.SetLeading(1, 8)
                    'cell_4.BorderWidthTop = 2.0F
                    'cell_4.BorderColorTop = CMYKColor.BLUE
                    ' table3.AddCell(cell_4)
                    'Dim p12 As Paragraph = New Paragraph(dr3.Item("TOTALPREM"), FontBold)
                    'Dim p13 As Paragraph = New Paragraph(dr4.Item("TOTALCOMM"), FontBold)
                    Dim p12 As Paragraph = New Paragraph(Session("TOTALPREM").ToString, FontBold)
                    Dim p13 As Paragraph = New Paragraph(dr8.Item("TOTALCOMM"), FontBold)
                    table3.AddCell("")
                    table3.AddCell("")
                    table3.AddCell("")
                    table3.AddCell(p12)
                    table3.AddCell("")
                    table3.AddCell(p13)
                    table3.AddCell("")
                    table3.AddCell(cell_4)

                    'The formula for the width of the table is:
                    'width of page is 792
                    'margins of page is 54 + 54 + 50 + 180 = 338
                    'default width of a table is 80%
                    '(792 - 338) * .8 = 363.20
                    'The width of each cell is equal to the width of the table divided by the number of columns
                    'table1 - 363.20 / 2 = 181.60
                    'table2 - 363.20 / 7 = 51.88
                    'table3 - 363.20 / 7 = 51.88

                    'Set width of table to 100%
                    mainHeader.WidthPercentage = 100
                    'Set width of table1 to 100%
                    table1.WidthPercentage = 100
                    'Set width of subHeader to 100%
                    subHeader.WidthPercentage = 100
                    'Set width of table2 to 100%
                    table2.WidthPercentage = 100
                    'Set width of table3 to 100%
                    table3.WidthPercentage = 100

                    document.Add(mainHeader)
                    document.Add(table1)
                    document.Add(subHeader)
                    document.Add(table2)
                    document.Add(table3)

                    document.Close()
                    Dim bytes As Byte() = memoryStream.ToArray()
                    memoryStream.Close()
                    Response.Clear()
                    Response.ContentType = "application/pdf"
                    Response.AddHeader("Content-Disposition", "attachment; filename=SMCICommission.pdf")
                    Response.ContentType = "application/pdf"
                    Response.Buffer = True
                    Response.Cache.SetCacheability(HttpCacheability.NoCache)
                    Response.BinaryWrite(bytes)
                    Response.[End]()
                    Response.Close()
                End Using
            End If


        Else


        End If

    End Sub

    Sub RemoveFutureMonths(ByVal ThisYear As String)
        If ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "01" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("February"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("March"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("April"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "02" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("March"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("April"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "03" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("April"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "04" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "05" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "06" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "07" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "08" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "09" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "10" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        ElseIf ddlYear.SelectedValue = ThisYear And ddlMonth.SelectedValue = "11" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
        Else
            GetLastMonthStatement()
        End If
    End Sub

    Sub GetLastMonthStatement()
        If Now.ToString("MM") = "01" Then
            ddlMonth.Items.FindByText("December").Selected = True
        ElseIf Now.ToString("MM") = "02" Then
            ddlMonth.Items.FindByText("January").Selected = True
        ElseIf Now.ToString("MM") = "03" Then
            ddlMonth.Items.FindByText("February").Selected = True
        ElseIf Now.ToString("MM") = "04" Then
            ddlMonth.Items.FindByText("March").Selected = True
        ElseIf Now.ToString("MM") = "05" Then
            ddlMonth.Items.FindByText("April").Selected = True
        ElseIf Now.ToString("MM") = "06" Then
            ddlMonth.Items.FindByText("May").Selected = True
        ElseIf Now.ToString("MM") = "07" Then
            ddlMonth.Items.FindByText("June").Selected = True
        ElseIf Now.ToString("MM") = "08" Then
            ddlMonth.Items.FindByText("July").Selected = True
        ElseIf Now.ToString("MM") = "09" Then
            ddlMonth.Items.FindByText("August").Selected = True
        ElseIf Now.ToString("MM") = "10" Then
            ddlMonth.Items.FindByText("September").Selected = True
        ElseIf Now.ToString("MM") = "11" Then
            ddlMonth.Items.FindByText("October").Selected = True
        ElseIf Now.ToString("MM") = "12" Then
            ddlMonth.Items.FindByText("November").Selected = True
        End If
    End Sub

    Sub DisplayAllMonth()
        'Dim counter As Integer
        'ByVal tracker As Integer
        If ddlYear.SelectedValue = "117" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("January"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("February"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("March"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("April"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("January", "01"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("February", "02"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("March", "03"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("April", "04"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("May", "05"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("June", "06"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("July", "07"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("August", "08"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("September", "09"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("October", "10"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("November", "11"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("December", "12"))
        End If



    End Sub

    Sub GetSelectedMonth()
        If ddlMonth.SelectedValue = "01" Then
            ddlMonth.Items.FindByText("January").Selected = True
        ElseIf ddlMonth.SelectedValue = "02" Then
            ddlMonth.Items.FindByText("February").Selected = True
        ElseIf ddlMonth.SelectedValue = "03" Then
            ddlMonth.Items.FindByText("March").Selected = True
        ElseIf ddlMonth.SelectedValue = "04" Then
            ddlMonth.Items.FindByText("April").Selected = True
        ElseIf ddlMonth.SelectedValue = "05" Then
            ddlMonth.Items.FindByText("May").Selected = True
        ElseIf ddlMonth.SelectedValue = "06" Then
            ddlMonth.Items.FindByText("June").Selected = True
        ElseIf ddlMonth.SelectedValue = "07" Then
            ddlMonth.Items.FindByText("July").Selected = True
        ElseIf ddlMonth.SelectedValue = "08" Then
            ddlMonth.Items.FindByText("August").Selected = True
        ElseIf ddlMonth.SelectedValue = "09" Then
            ddlMonth.Items.FindByText("September").Selected = True
        ElseIf ddlMonth.SelectedValue = "10" Then
            ddlMonth.Items.FindByText("October").Selected = True
        ElseIf ddlMonth.SelectedValue = "11" Then
            ddlMonth.Items.FindByText("November").Selected = True
        ElseIf ddlMonth.SelectedValue = "12" Then
            ddlMonth.Items.FindByText("December").Selected = True
        End If

    End Sub

    Sub GetDateRange()
        'Dim Begin As String
        'Dim Ending As String
        If ddlYear.SelectedValue = "110" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "111" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "112" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "113" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "114" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "115" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "116" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "117" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        ElseIf ddlYear.SelectedValue = "118" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        End If
        'Session("DateRange") = ddlYear.SelectedValue + "" + ddlMonth.SelectedValue
        Session("StartDate") = ddlYear.SelectedValue + "" + Session("Begin").ToString
        Session("EndDate") = ddlYear.SelectedValue + "" + Session("Ending").ToString
    End Sub

    Private Function GetLastDay() As String
        If ddlMonth.SelectedValue = "01" Then
            Session("End") = "31"
        ElseIf ddlYear.SelectedValue = "112" And ddlMonth.SelectedValue = "02" Then
            Session("End") = "29"
        ElseIf ddlYear.SelectedValue = "116" And ddlMonth.SelectedValue = "02" Then
            Session("End") = "29"
        ElseIf ddlMonth.SelectedValue = "02" Then
            Session("End") = "28"
        ElseIf ddlMonth.SelectedValue = "03" Then
            Session("End") = "31"
        ElseIf ddlMonth.SelectedValue = "04" Then
            Session("End") = "30"
        ElseIf ddlMonth.SelectedValue = "05" Then
            Session("End") = "31"
        ElseIf ddlMonth.SelectedValue = "06" Then
            Session("End") = "30"
        ElseIf ddlMonth.SelectedValue = "07" Then
            Session("End") = "31"
        ElseIf ddlMonth.SelectedValue = "08" Then
            Session("End") = "31"
        ElseIf ddlMonth.SelectedValue = "09" Then
            Session("End") = "30"
        ElseIf ddlMonth.SelectedValue = "10" Then
            Session("End") = "31"
        ElseIf ddlMonth.SelectedValue = "11" Then
            Session("End") = "30"
        ElseIf ddlMonth.SelectedValue = "12" Then
            Session("End") = "31"

        End If
        Return Session("End").ToString
    End Function

    'Sub GetMatchDate()
    '    Dim matchdate As String = "1" + Now().ToString("yy") + "" + Now().ToString("MM")
    'End Sub

    Private Function GetData1(query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        Dim cmd As New iDB2Command(query)
        Using con As New iDB2Connection(conString)
            Using sda As New iDB2DataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Return dt
                End Using
            End Using
        End Using
    End Function

    Private Function GetData2(query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        Dim cmd As New iDB2Command(query)

        'cmd.Parameters.AddWithValue("@daterange", Session("DateRange").ToString)
        cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        cmd.Parameters.AddWithValue("@agency", Session("anum").ToString)
        cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        Using con As New iDB2Connection(conString)
            Using sda As New iDB2DataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt1 As New DataTable()
                    sda.Fill(dt1)
                    Return dt1
                End Using
            End Using
        End Using
    End Function


    Private Function GetData3(query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("TsqlPOINT").ConnectionString
        Dim cmd As New SqlCommand(query)

        'cmd.Parameters.AddWithValue("@daterange", Session("DateRange").ToString)
        cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        cmd.Parameters.AddWithValue("@agency", Session("anum").ToString)
        'cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        'cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        Using con As New SqlConnection(conString)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    Try
                        sda.Fill(dt)
                        Return dt
                    Catch ex As SqlException
                        Response.Write("<script type=""text/javascript"">alert(""Your Message."");</script")
                    End Try
                    Return Nothing
                End Using
            End Using
        End Using
    End Function


    Private Function GetData4(query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("TsqlPOINT").ConnectionString
        Dim cmd As New SqlCommand(query)

        'cmd.Parameters.AddWithValue("@daterange", Session("DateRange").ToString)
        cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        cmd.Parameters.AddWithValue("@agency", Session("anum").ToString)
        'cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        'cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        Using con As New SqlConnection(conString)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()

                    Try

                        'Dim dataView As New DataView(dt)
                        'dataView.Sort = "D2POLSYM, D2POLNO ASC"
                        'Dim x As DataTable = dataView.ToTable
                        dt.DefaultView.RowFilter = "D2POLSYM, D2POLNO ASC"

                        sda.Fill(dt)
                        Return dt
                        'dt.Select.OrderBy()

                    Catch ex As SqlException
                        Response.Write("<script type=""text/javascript"">alert(""Your Message."");</script")
                    End Try
                    Return Nothing
                End Using
            End Using
        End Using
    End Function



    Protected Sub ddlYear_TextChanged(sender As Object, e As System.EventArgs) Handles ddlYear.TextChanged
        Dim MM As String = Now().ToString("mm")
        If ddlYear.SelectedValue = "117" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("January"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("February"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("March"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("April"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("October"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("November"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("December"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("January", "01"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("February", "02"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("March", "03"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("April", "04"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("May", "05"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("June", "06"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("July", "07"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("August", "08"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("September", "09"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("October", "10"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("November", "11"))
            ddlMonth.Items.Add(New System.Web.UI.WebControls.ListItem("December", "12"))
            If Now.ToString("MM") = "01" Then
                ddlMonth.SelectedValue = "12"
            ElseIf Now.ToString("MM") = "02" Then
                ddlMonth.SelectedValue = "01"
            ElseIf Now.ToString("MM") = "03" Then
                ddlMonth.SelectedValue = "02"
            ElseIf Now.ToString("MM") = "04" Then
                ddlMonth.SelectedValue = "03"
            ElseIf Now.ToString("MM") = "05" Then
                ddlMonth.SelectedValue = "04"
            ElseIf Now.ToString("MM") = "06" Then
                ddlMonth.SelectedValue = "05"
            ElseIf Now.ToString("MM") = "07" Then
                ddlMonth.SelectedValue = "06"
            ElseIf Now.ToString("MM") = "08" Then
                ddlMonth.SelectedValue = "07"
            ElseIf Now.ToString("MM") = "09" Then
                ddlMonth.SelectedValue = "08"
            ElseIf Now.ToString("MM") = "10" Then
                ddlMonth.SelectedValue = "09"
            ElseIf Now.ToString("MM") = "11" Then
                ddlMonth.SelectedValue = "10"
            ElseIf Now.ToString("MM") = "12" Then
                ddlMonth.SelectedValue = "11"
            End If

        End If
    End Sub
End Class
