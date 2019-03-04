Imports System
Imports System.IO
Imports System.Linq
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports IBM.Data.DB2.iSeries
Imports System.Web.Configuration
Imports System.Threading
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Partial Class AgencyPortal_agency_tools
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ProcessedDate As DateTime
        Dim PolDate As String
        ProcessedDate = DateTime.Now.AddDays(-1)
        PolDate = ProcessedDate.ToString("MM/dd/yyyy")
        hypPolicies.NavigateUrl = "http://policies.smcins.com/MediaMgtC1SMCRScriptMain/MMInterfaceCall.asp?userlist=Source:SMCRSrc,Level:Inbox,MMAgent:" & Session("UserNameIs") & ",MMDateProd:" & PolDate

        'Dim YY As String = "1" + Now().ToString("yy")
        'GetLastMonthStatement()
        'GetPreviousMonths(YY)

        Dim YY As String = "1" + Now().ToString("yy")
        Dim LastYear As String = ("1" + Now().ToString("yy")) - 1

        If ddlYear.SelectedValue = YY Then
            GetLastMonthStatement()
            RemoveFutureMonths(YY)
        End If


    End Sub


    Protected Sub lnkCommission_Click(sender As Object, e As System.EventArgs) Handles lnkCommission.Click

        Session("StartDate") = String.Empty
        Session("EndDate") = String.Empty
        Session("anum") = String.Empty
        Session("TOTALPREM") = String.Empty

        Session("anum") = ddlSelectAgency.SelectedValue
        Dim GreaterDate As Integer = "1" + Now().ToString("yy") + "" + Now().ToString("MM")
        Dim LessDate As Integer = ddlYear.SelectedValue + "" + ddlMonth.SelectedValue
        Dim SUMPREM As Decimal = 0

 
        If GreaterDate > LessDate Then
            GetDateRange()
            '
            ' Get agency info for header
            '
            Dim dr1 As DataRow = GetData1("SELECT AGNM_AGCY As AGENTNUMBER, ACNM_NAME1 As AGENCY, ACNM_ADDRS As MAILADDRESS, ACNM_CTYST || ' ' || ACNM_ZIP As CITYZIP FROM SOMRC0DAT.PMSPAG00 WHERE AGNM_AGCY = " + Session("anum").ToString).Rows(0)
            '
            ' Get record count from Receivables table in POINT
            '
            Dim drCheck As DataRow = GetData3("SELECT COUNT(D2POLNO) As HowManyRows FROM RCD2CPP WHERE D2B7ST = 'PCOM' AND D2AKDT between @start and @end AND D2DHNB = " + Session("anum").ToString).Rows(0)
            If drCheck.Item("HowManyRows") = 0 Then
                Response.Write("<script type=""text/javascript"">alert(""No commission due this month."");</script")
            Else
                '
                ' Get records for this agency and date range of month selected
                '
                'Dim dr5 As DataRow = GetData4("SELECT p.RISK0STATE As STATE, r2.D2POLSYM As POLICYTYPE, r2.D2POLSYM + ' ' + r2.D2POLNO + '-' + r2.D2POLMOD As POLICYNUMBER, r2.D2B2CD as CUSTOMERNO, p.ADD0LINE01 As INSUREDNAME, substring(p.EFFDT,4,2) + '/' + substring(p.EFFDT,6,2) + '/20' + substring(p.EFFDT,2,2) As EFFDATE, r2.D2H6VA As PAIDCOMMISSION, r2.D2CMVA As ORIGINALPREMIUM FROM RCD2CPP As r2 INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD WHERE D2B7ST = 'PCOM' AND D2AKDT between @start and @end AND D2DHNB = " + Session("anum").ToString).Rows(0)
                Dim dr5 As DataRow = GetData4("SELECT p.RISK0STATE As STATE, r2.D2POLSYM As POLICYTYPE, r2.D2POLSYM || ' ' || r2.D2POLNO || '-' || r2.D2POLMOD As POLICYNUMBER, r2.D2B2CD as CUSTOMERNO, p.ADD0LINE01 As INSUREDNAME, substring(p.EFFDT,4,2) || '/' || substring(p.EFFDT,6,2) || '/20' || substring(p.EFFDT,2,2) As EFFDATE, r2.D2H6VA As PAIDCOMMISSION, r2.D2CMVA As ORIGINALPREMIUM FROM RCD2CPP As r2 INNER JOIN PMSL0217 As p ON p.SYMBOL = r2.D2POLSYM AND p.POLICY0NUM = r2.D2POLNO AND p.MODULE = r2.D2POLMOD WHERE D2B7ST = 'PCOM' AND D2AKDT between @start and @end AND D2DHNB = " + Session("anum").ToString).Rows(0)
                '
                ' Get sum of Commission for total line
                '
                Dim dr8 As DataRow = GetData3("SELECT SUM(r2.D2H6VA) As TOTALCOMM FROM RCD2CPP As r2 WHERE D2B7ST = 'PCOM' AND D2AKDT between @start and @end AND D2DHNB = " + Session("anum").ToString).Rows(0)

                'Code works - There are 72 points in one inch, width 216pt(3 inches), height 720pt(10 inches) 3 x 10 in.
                Dim pageSize As New Rectangle(792.0F, 612.0F)

                'Set margins 54 left, 54 right, 50 top, 50 bottom
                Dim document As New Document(pageSize, 54, 54, 40, 40)

                ''The 12 represents the line spacing
                'Dim header As New Paragraph(12)

                Using memoryStream As New System.IO.MemoryStream()
                    Dim writer As PdfWriter = PdfWriter.GetInstance(document, memoryStream)

                    document.Open()

                    Dim FontStyle As Font = New Font(FontFactory.GetFont("Calibri", 9, Font.NORMAL))
                    Dim FontBold As Font = New Font(FontFactory.GetFont("Calibri", 9, Font.BOLD))

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

                    table2.HeaderRows = 1

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
                    mainHeader.AddCell("SOUTHERN MUTUAL CHURCH INSURANCE COMPANY")
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
                    Dim sh1 As PdfPCell
                    sh1 = New PdfPCell(New Phrase("POLICY NUMBER", FontBold))
                    sh1.Border = 2
                    table2.AddCell(sh1)
                    Dim sh2 As PdfPCell
                    sh2 = New PdfPCell(New Phrase("INSURED NAME", FontBold))
                    sh2.Border = 2
                    table2.AddCell(sh2)
                    Dim sh3 As PdfPCell
                    sh3 = New PdfPCell(New Phrase("EFF. DATE", FontBold))
                    sh3.Border = 2
                    table2.AddCell(sh3)
                    Dim sh4 As PdfPCell
                    sh4 = New PdfPCell(New Phrase("PAID PREM", FontBold))
                    sh4.HorizontalAlignment = Element.ALIGN_RIGHT
                    sh4.Border = 2
                    table2.AddCell(sh4)
                    Dim sh5 As PdfPCell
                    sh5 = New PdfPCell(New Phrase("RATE", FontBold))
                    sh5.HorizontalAlignment = Element.ALIGN_RIGHT
                    sh5.Border = 2
                    table2.AddCell(sh5)
                    Dim sh6 As PdfPCell
                    sh6 = New PdfPCell(New Phrase("COMMISSION", FontBold))
                    sh6.HorizontalAlignment = Element.ALIGN_RIGHT
                    sh6.Border = 2
                    table2.AddCell(sh6)
                    Dim sh7 As PdfPCell
                    sh7 = New PdfPCell(New Phrase("ORIG. PREM", FontBold))
                    sh7.HorizontalAlignment = Element.ALIGN_RIGHT
                    sh7.Border = 2
                    table2.AddCell(sh7)
                    '
                    ' Iterate thru receivables records to create report
                    '
                    Dim iRow As Integer = 0
                    For iRow = 0 To dr5.Table.Rows.Count - 1

                        Dim PolicyType As String = dr5.Table.Rows(iRow).Item("POLICYTYPE")
                        Dim AgencyState As String = dr5.Table.Rows(iRow).Item("STATE")

                        Dim COMMRATE As Decimal

                        If PolicyType.ToString = "SMP" Then
                            COMMRATE = 0.15
                        ElseIf PolicyType.ToString = "STD" Then
                            COMMRATE = 0.15
                        ElseIf RTrim(dr5.Table.Rows(iRow).Item("POLICYTYPE")) = "UM" Then
                            COMMRATE = 0.15
                        ElseIf RTrim(dr5.Table.Rows(iRow).Item("POLICYTYPE")) = "WC" Then
                            COMMRATE = 0.05
                        ElseIf RTrim(dr5.Table.Rows(iRow).Item("POLICYTYPE")) = "BA" And AgencyState.ToString = "39" Then
                            COMMRATE = 0.075
                        ElseIf RTrim(dr5.Table.Rows(iRow).Item("POLICYTYPE")) = "BA" And AgencyState.ToString <> "39" Then
                            COMMRATE = 0.1
                        Else
                            COMMRATE = 1
                        End If

                        Dim PaidPremium As Decimal
                        PaidPremium = dr5.Table.Rows(iRow).Item("PAIDCOMMISSION") / COMMRATE
                        SUMPREM = SUMPREM + PaidPremium

                        Dim c5 As PdfPCell
                        c5 = New PdfPCell(New Phrase(dr5.Table.Rows(iRow).Item("POLICYNUMBER"), FontStyle))
                        c5.Border = 0
                        c5.Padding = 4
                        table2.AddCell(c5)
                        Dim c6 As PdfPCell
                        c6 = New PdfPCell(New Phrase(dr5.Table.Rows(iRow).Item("INSUREDNAME"), FontStyle))
                        c6.Border = 0
                        c6.Padding = 4
                        table2.AddCell(c6)
                        Dim c7 As PdfPCell
                        c7 = New PdfPCell(New Phrase(dr5.Table.Rows(iRow).Item("EFFDATE"), FontStyle))
                        c7.Border = 0
                        c7.Padding = 4
                        table2.AddCell(c7)
                        Dim c8 As PdfPCell
                        c8 = New PdfPCell(New Phrase(Format(PaidPremium, "###,###.00"), FontStyle))
                        c8.HorizontalAlignment = Element.ALIGN_RIGHT
                        c8.Border = 0
                        c8.Padding = 4
                        table2.AddCell(c8)
                        Dim c9 As PdfPCell
                        c9 = New PdfPCell(New Phrase(Format(COMMRATE, "0.000"), FontStyle))
                        c9.HorizontalAlignment = Element.ALIGN_RIGHT
                        c9.Border = 0
                        c9.Padding = 4
                        table2.AddCell(c9)
                        Dim c10 As PdfPCell
                        c10 = New PdfPCell(New Phrase(Format(dr5.Table.Rows(iRow).Item("PAIDCOMMISSION"), "###,###.00"), FontStyle))
                        c10.HorizontalAlignment = Element.ALIGN_RIGHT
                        c10.Border = 0
                        c10.Padding = 4
                        table2.AddCell(c10)
                        Dim c11 As PdfPCell
                        c11 = New PdfPCell(New Phrase(Format(dr5.Table.Rows(iRow).Item("ORIGINALPREMIUM"), "###,###.00"), FontStyle))
                        c11.HorizontalAlignment = Element.ALIGN_RIGHT
                        c11.Border = 0
                        c11.Padding = 4
                        table2.AddCell(c11)
                    Next
                    '
                    ' Create totals line at end of report
                    '
                    cell_4 = New PdfPCell
                    cell_4.SetLeading(1, 8)
                    table3.AddCell("")
                    table3.AddCell("")
                    table3.AddCell("")
                    Dim c12 As PdfPCell
                    c12 = New PdfPCell(New Phrase(Format(SUMPREM, "#,###,###.00"), FontBold))
                    c12.HorizontalAlignment = Element.ALIGN_RIGHT
                    c12.Border = 1
                    table3.AddCell(c12)
                    table3.AddCell("")
                    Dim c13 As PdfPCell
                    c13 = New PdfPCell(New Phrase(Format(dr8.Item("TOTALCOMM"), "###,###.00"), FontBold))
                    c13.HorizontalAlignment = Element.ALIGN_RIGHT
                    c13.Border = 1
                    table3.AddCell(c13)
                    table3.AddCell("")
                    table3.AddCell(cell_4)

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
        If ddlYear.SelectedValue = "118" Then
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("January"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("February"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("March"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("April"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("May"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("June"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("July"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("August"))
            ddlMonth.Items.Remove(ddlMonth.Items.FindByText("September"))
        End If
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
        If ddlYear.SelectedValue = "118" Then
            Session("Begin") = ddlMonth.SelectedValue + "" + "01"
            Session("Ending") = ddlMonth.SelectedValue + "" + GetLastDay()
        End If
        'Session("DateRange") = ddlYear.SelectedValue + "" + ddlMonth.SelectedValue
        Session("StartDate") = ddlYear.SelectedValue + "" + Session("Begin").ToString
        'Session("StartDate") = ddlYear.SelectedValue + "" + ddlMonth.SelectedValue
        Session("EndDate") = ddlYear.SelectedValue + "" + Session("Ending").ToString
    End Sub


    Private Function GetLastDay() As String
        If ddlMonth.SelectedValue = "01" Then
            Session("End") = "31"
        ElseIf ddlYear.SelectedValue = "120" And ddlMonth.SelectedValue = "02" Then
            Session("End") = "29"
        ElseIf ddlYear.SelectedValue = "124" And ddlMonth.SelectedValue = "02" Then
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
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Return dt
                End Using
            End Using
        End Using
    End Function

    Private Function GetData3(query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        Dim cmd As New iDB2Command(query)

        cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        cmd.Parameters.AddWithValue("@agency", Session("anum").ToString)
        Using con As New iDB2Connection(conString)
            Using sda As New iDB2DataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    Try
                        sda.Fill(dt)
                        Return dt
                    Catch ex As SqlException
                        Response.Write("<script type=""text/javascript"">alert(""No commission records for month selected."");</script")
                    End Try
                    Return Nothing
                End Using
            End Using
        End Using
    End Function

    Private Function GetData4(ByVal query As String) As DataTable
        Dim conString As String = ConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        Dim cmd As New iDB2Command(query)

        cmd.Parameters.AddWithValue("@start", Session("StartDate").ToString)
        cmd.Parameters.AddWithValue("@end", Session("EndDate").ToString)
        cmd.Parameters.AddWithValue("@agency", Session("anum").ToString)
        Using con As New iDB2Connection(conString)
            Using sda As New iDB2DataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    Try
                        sda.Fill(dt)
                        Return dt.Select("", "INSUREDNAME, CUSTOMERNO, POLICYTYPE").CopyToDataTable
                    Catch ex As SqlException
                        Response.Write("<script type=""text/javascript"">alert(""No commission records for month selected."");</script")
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

        PopupExtender.Show()

    End Sub
End Class
