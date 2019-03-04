Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
'Imports System.Data.Odbc
Imports IBM.Data.DB2.iSeries
Imports Microsoft.VisualBasic
Imports System.Web.Configuration
Imports smci.agents

Public Class _ProductionSummary

    Private Shared ReadOnly _connectionString As String = String.Empty
    Private Shared ReadOnly _con As String = String.Empty
    Private Shared ReadOnly _conString As String = String.Empty

    Shared Sub New()
        _connectionString = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        _con = WebConfigurationManager.ConnectionStrings("AllPortal").ConnectionString
        _conString = WebConfigurationManager.ConnectionStrings("prodsum").ConnectionString
        If String.IsNullOrEmpty(_connectionString) Then
            Throw New Exception("No connection String configured in Web.Config file")
        ElseIf String.IsNullOrEmpty(_con) Then
            Throw New Exception("No connection String configured in Web.Config file")
        ElseIf String.IsNullOrEmpty(_conString) Then
            Throw New Exception("No connection String configured in Web.Config file")
        End If
    End Sub

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetProductionSummary(ByVal agentNum As String) As List(Of vw_agysummary)
        Dim TheStats As New List(Of vw_agysummary)()

        Dim con As SqlConnection = New SqlConnection(_conString)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT agent, mtd_prem, ytd_prem, earned_prem, inforce_prem, curr_resv, prior_resv, paid_ytd, lae_curr_resv, lae_prior_resv, lae_paid_ytd, (paid_ytd + curr_resv + lae_paid_ytd + lae_curr_resv - prior_resv - lae_prior_resv) As total_Incurred FROM vw_agysummary WHERE agent = @agent"
        cmd.Parameters.AddWithValue("@agent", agentNum)

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeStats As New vw_agysummary()
                SeeStats.Agent = CType(reader("agent"), String)
                SeeStats.Mtdprem = CType(reader("mtd_prem"), Double)
                SeeStats.Ytdprem = CType(reader("ytd_prem"), Double)
                SeeStats.Earnprem = CType(reader("earned_prem"), Double)
                SeeStats.Inforceprem = CType(reader("inforce_prem"), Double)
                SeeStats.Currresv = CType(reader("curr_resv"), Double)
                SeeStats.Priorresv = CType(reader("prior_resv"), Double)
                SeeStats.Paidytd = CType(reader("paid_ytd"), Double)
                SeeStats.Laecurrresv = CType(reader("lae_curr_resv"), Double)
                SeeStats.Laepriorresv = CType(reader("lae_prior_resv"), Double)
                SeeStats.Laepaidytd = CType(reader("lae_paid_ytd"), Double)
                SeeStats.Totalincurred = CType(reader("total_Incurred"), Single)
                Dim TotalIncurred As Single = CType(reader("total_Incurred"), Single)
                Dim EarnPrem As Single = CType(reader("earned_prem"), Single)
                Dim Calculation As Single = ((TotalIncurred / EarnPrem) * 100)
                Calculation = Math.Round(Calculation, 2)
                If SeeStats.Agent <> "0009902" Then
                    SeeStats.Lossratio = Calculation
                End If
                TheStats.Add(SeeStats)
            End While
        End Using
        Return TheStats
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetAllProductionSummary(ByVal agentNum As String) As List(Of vw_agysummary)
        Dim TheStats As New List(Of vw_agysummary)()

        Dim con As SqlConnection = New SqlConnection(_conString)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@UserNameIs", agentNum)
        'cmd.CommandText = "SELECT agent, mtd_prem, ytd_prem, earned_prem, inforce_prem, curr_resv, prior_resv, paid_ytd, lae_curr_resv, lae_prior_resv, lae_paid_ytd FROM vw_agysummary WHERE agent = @UserNameIs"
        'cmd.CommandText = "SELECT ISNULL(agent, 0), sum(mtd_prem) as mtd_prem, sum(ytd_prem) as ytd_prem, sum(earned_prem) as earned_prem, sum(inforce_prem) as inforce_prem, sum(curr_resv) as curr_resv, sum(prior_resv) as prior_resv, sum(paid_ytd) as paid_ytd, sum(lae_curr_resv) as lae_curr_resv, sum(lae_prior_resv) as lae_prior_resv, sum(lae_paid_ytd) as lae_paid_ytd, (sum(paid_ytd) + sum(curr_resv) + sum(lae_paid_ytd) + sum(lae_curr_resv) - sum(prior_resv) - sum(lae_prior_resv)) As total_Incurred FROM agyexp WHERE agent IN (SELECT MasterID FROM testnetdb.dbo.AgencyOriginationTable WHERE MasterKeyID = @UserNameIs) GROUP BY agent WITH ROLLUP"
        'cmd.CommandType = CommandType.Text
        cmd.CommandText = "GetProductionTotals"
        cmd.CommandType = CommandType.StoredProcedure

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeStats As New vw_agysummary()
                Dim agencyNum As String = CType(reader("agent"), String)
                If agencyNum = "0" Then
                    'SeeStats.Agent = CType(reader("agent"), String)
                    SeeStats.Agent = "TOTAL"
                    SeeStats.Mtdprem = CType(reader("mtd_prem"), Double)
                    SeeStats.Ytdprem = CType(reader("ytd_prem"), Double)
                    SeeStats.Earnprem = CType(reader("earned_prem"), Double)
                    SeeStats.Inforceprem = CType(reader("inforce_prem"), Double)
                    SeeStats.Currresv = CType(reader("curr_resv"), Double)
                    SeeStats.Priorresv = CType(reader("prior_resv"), Double)
                    SeeStats.Paidytd = CType(reader("paid_ytd"), Double)
                    SeeStats.Laecurrresv = CType(reader("lae_curr_resv"), Double)
                    SeeStats.Laepriorresv = CType(reader("lae_prior_resv"), Double)
                    SeeStats.Laepaidytd = CType(reader("lae_paid_ytd"), Double)
                    SeeStats.Totalincurred = CType(reader("total_Incurred"), Double)
                    Dim TotalIncurred As Double = CType(reader("total_Incurred"), Double)
                    Dim EarnPrem As Double = CType(reader("earned_prem"), Integer)
                    Dim Calculation As Double = ((TotalIncurred / EarnPrem) * 100)
                    Calculation = Math.Round(Calculation, 2)
                    If SeeStats.Agent <> "0009902" Then
                        SeeStats.Lossratio = Calculation
                    End If
                    TheStats.Add(SeeStats)
                End If
            End While
        End Using
        Return TheStats
    End Function

    Enum SelectMonth
        Jan
        Feb
        Mar
        Apr
        May
        Jun
        Jul
        Aug
        Sep
        Oct
        Nov
        Dec
    End Enum


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetSmpCount(ByVal agentNum As String, ByVal TheYear As String) As List(Of _SummaryVariables)
        Dim Records As New List(Of _SummaryVariables)()
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim selectStatement As String = "SELECT AgentNumber, _Year, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec FROM smpQuoteTotal WHERE agentNumber = @agent AND _Year = @year"
        Dim cmd As SqlCommand = New SqlCommand(selectStatement, con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        cmd.CommandType = CommandType.Text

        'Try
        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _SummaryVariables()
                SeeRecord.SmpJan = CType(reader("Jan"), Integer)
                SeeRecord.SmpFeb = CType(reader("Feb"), Integer)
                SeeRecord.SmpMar = CType(reader("Mar"), Integer)
                SeeRecord.SmpApr = CType(reader("Apr"), Integer)
                SeeRecord.SmpMay = CType(reader("May"), Integer)
                SeeRecord.SmpJun = CType(reader("Jun"), Integer)
                SeeRecord.SmpJul = CType(reader("Jul"), Integer)
                SeeRecord.SmpAug = CType(reader("Aug"), Integer)
                SeeRecord.SmpSep = CType(reader("Sep"), Integer)
                SeeRecord.SmpOct = CType(reader("Oct"), Integer)
                SeeRecord.SmpNov = CType(reader("Nov"), Integer)
                SeeRecord.SmpDec = CType(reader("Dec"), Integer)
                Records.Add(SeeRecord)
            End While
        End Using
        'Catch ex As Exception
        'End Try
        'Using con
        '    con.Open()
        '    Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleRow)
        '    While reader.Read()
        '        Dim SeeRecord As New _NewBusiness()
        '        SeeRecord.SmpQuoted = CType(reader("Jan"), Byte)
        '        Records.Add(SeeRecord)
        '    End While
        'End Using

        Return Records

        'GetSmpWrittenCount(agentNum)

    End Function

    '<DataObjectMethod(DataObjectMethodType.Select, True)> _
    'Public Shared Function GetSmpCount(ByVal agentNum As String) As List(Of _SummaryVariables)
    '    Dim Records As New List(Of _SummaryVariables)()
    '    Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
    '    Dim con As SqlConnection = New SqlConnection(MyConnection)
    '    Dim selectStatement As String = "SELECT Q.Jan As qJan, W.Jan As wJan, Q.Feb As qFeb, W.Feb As wFeb, Q.Mar As qMar, W.Mar As wMar, Q.Apr As qApr, W.Apr As wApr, Q.May As qMay, W.May As wMay, Q.Jun As qJun, W.Jun As wJun, Q.Jul As qJul, W.Jul As wJul, Q.Aug As qAug, W.Aug As wAug, Q.Sep As qSep, W.Sep As wSep, Q.Oct As qOct, W.Oct As wOct, Q.Nov As qNov, W.Nov As wNov, Q.Dec As qDec, W.Dec As wDec FROM smpQuoteTotal Q INNER JOIN smpWrittenTotal W ON Q.agentNumber = W.agentNumber AND Q.Year = W.Year WHERE Q.agentNumber = @agent AND Q.Year = '2018'"
    '    Dim cmd As SqlCommand = New SqlCommand(selectStatement, con)
    '    cmd.Parameters.AddWithValue("@agent", agentNum)
    '    cmd.CommandType = CommandType.Text

    '    'Try
    '    Using con
    '        con.Open()
    '        Dim reader As SqlDataReader = cmd.ExecuteReader
    '        While reader.Read()
    '            Dim SeeRecord As New _SummaryVariables()
    '            SeeRecord.SmpJan = CType(reader("qJan"), Integer)
    '            SeeRecord.SmpFeb = CType(reader("qFeb"), Integer)
    '            SeeRecord.SmpMar = CType(reader("qMar"), Integer)
    '            SeeRecord.SmpApr = CType(reader("qApr"), Integer)
    '            SeeRecord.SmpMay = CType(reader("qMay"), Integer)
    '            SeeRecord.SmpJun = CType(reader("qJun"), Integer)
    '            SeeRecord.SmpJul = CType(reader("qJul"), Integer)
    '            SeeRecord.SmpAug = CType(reader("qAug"), Integer)
    '            SeeRecord.SmpSep = CType(reader("qSep"), Integer)
    '            SeeRecord.SmpOct = CType(reader("qOct"), Integer)
    '            SeeRecord.SmpNov = CType(reader("qNov"), Integer)
    '            SeeRecord.SmpDec = CType(reader("qDec"), Integer)

    '            SeeRecord.SmpWJan = CType(reader("wJan"), Integer)
    '            SeeRecord.SmpWFeb = CType(reader("wFeb"), Integer)
    '            SeeRecord.SmpWMar = CType(reader("wMar"), Integer)
    '            SeeRecord.SmpWApr = CType(reader("wApr"), Integer)
    '            SeeRecord.SmpWMay = CType(reader("wMay"), Integer)
    '            SeeRecord.SmpWJun = CType(reader("wJun"), Integer)
    '            SeeRecord.SmpWJul = CType(reader("wJul"), Integer)
    '            SeeRecord.SmpWAug = CType(reader("wAug"), Integer)
    '            SeeRecord.SmpWSep = CType(reader("wSep"), Integer)
    '            SeeRecord.SmpWOct = CType(reader("wOct"), Integer)
    '            SeeRecord.SmpWNov = CType(reader("wNov"), Integer)
    '            SeeRecord.SmpWDec = CType(reader("wDec"), Integer)
    '            Records.Add(SeeRecord)
    '        End While
    '    End Using
    '    'Catch ex As Exception
    '    'End Try
    '    'Using con
    '    '    con.Open()
    '    '    Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleRow)
    '    '    While reader.Read()
    '    '        Dim SeeRecord As New _NewBusiness()
    '    '        SeeRecord.SmpQuoted = CType(reader("Jan"), Byte)
    '    '        Records.Add(SeeRecord)
    '    '    End While
    '    'End Using

    '    Return Records

    '    'GetSmpWrittenCount(agentNum)

    'End Function



    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetSmpWrittenCount(ByVal agentNum As String, ByVal TheYear As String) As List(Of _SummaryVariables)
        Dim Records As New List(Of _SummaryVariables)()
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim selectStatement As String = "SELECT AgentNumber, _Year, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec FROM smpWrittenTotal WHERE AgentNumber = @agent AND _Year = @year"
        Dim cmd As SqlCommand = New SqlCommand(selectStatement, con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _SummaryVariables()
                SeeRecord.SmpWJan = CType(reader("Jan"), Integer)
                SeeRecord.SmpWFeb = CType(reader("Feb"), Integer)
                SeeRecord.SmpWMar = CType(reader("Mar"), Integer)
                SeeRecord.SmpWApr = CType(reader("Apr"), Integer)
                SeeRecord.SmpWMay = CType(reader("May"), Integer)
                SeeRecord.SmpWJun = CType(reader("Jun"), Integer)
                SeeRecord.SmpWJul = CType(reader("Jul"), Integer)
                SeeRecord.SmpWAug = CType(reader("Aug"), Integer)
                SeeRecord.SmpWSep = CType(reader("Sep"), Integer)
                SeeRecord.SmpWOct = CType(reader("Oct"), Integer)
                SeeRecord.SmpWNov = CType(reader("Nov"), Integer)
                SeeRecord.SmpWDec = CType(reader("Dec"), Integer)
                Records.Add(SeeRecord)
            End While
        End Using

        Return Records

    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetQuotePrem(ByVal agentNum As String, ByVal TheYear As String) As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@agent", agentNum)
        'cmd.Parameters.AddWithValue("@month", TheMonth)
        cmd.Parameters.AddWithValue("@year", TheYear)
        cmd.CommandText = "SELECT church, location, quote_date, curr_date FROM newbus WHERE agent = @agent AND YEAR(quote_date) = @year AND smp_quoted = '1'"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _NewBusiness()

                'Checking for Null values
                SeeRecord.Church = Convert.ToString(reader("church"))
                ValueIsNull = SeeRecord.Church.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Church = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Church = CType(reader("church"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Location = Convert.ToString(reader("location"))
                ValueIsNull = SeeRecord.Location.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Location = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Location = CType(reader("location"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.QuoteDate = Convert.ToString(reader("quote_date"))
                ValueIsNull = SeeRecord.QuoteDate
                If ValueIsNull = Nothing Then
                    SeeRecord.QuoteDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.QuoteDate = CType(reader("quote_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.DateWritten = Convert.ToString(reader("curr_date"))
                ValueIsNull = SeeRecord.DateWritten
                If ValueIsNull = Nothing Then
                    SeeRecord.DateWritten = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.DateWritten = CType(reader("curr_date"), String)
                    ValueIsNull = String.Empty
                End If
                Records.Add(SeeRecord)
            End While
        End Using

        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetWrittenPrem(ByVal agentNum As String, ByVal TheYear As String) As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@agent", agentNum)
        'cmd.Parameters.AddWithValue("@begin", TheMonth + "/01/" + TheYear)
        'cmd.Parameters.AddWithValue("@end", TheMonth + "/31/" + TheYear)
        cmd.Parameters.AddWithValue("@year", TheYear)
        'cmd.Parameters.AddWithValue("@month", TheMonth)
        cmd.CommandText = "SELECT quote_date, church, date_written, smp_prem, umb_prem, ba_prem, wc_prem FROM newbus WHERE agent = @agent AND YEAR(date_written) = @year"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _NewBusiness()

                SeeRecord.QuoteDate = Convert.ToString(reader("quote_date"))
                ValueIsNull = SeeRecord.QuoteDate
                If ValueIsNull = Nothing Then
                    SeeRecord.QuoteDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.QuoteDate = CType(reader("quote_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Church = Convert.ToString(reader("church"))
                ValueIsNull = SeeRecord.Church.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Church = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Church = CType(reader("church"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.DateWritten = Convert.ToString(reader("date_written"))
                ValueIsNull = SeeRecord.DateWritten
                If ValueIsNull = Nothing Then
                    SeeRecord.DateWritten = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.DateWritten = CType(reader("date_written"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.SmpPrem = Convert.ToDecimal(reader("smp_prem"))
                ValueIsNull = SeeRecord.SmpPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.SmpPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.SmpPrem = CType(reader("smp_prem"), Double)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.UmbPrem = Convert.ToDecimal(reader("umb_prem"))
                ValueIsNull = SeeRecord.UmbPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.UmbPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.UmbPrem = CType(reader("umb_prem"), Double)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.BaPrem = Convert.ToDecimal(reader("ba_prem"))
                ValueIsNull = SeeRecord.BaPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.BaPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.BaPrem = CType(reader("ba_prem"), Double)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.WcPrem = Convert.ToDecimal(reader("wc_prem"))
                ValueIsNull = SeeRecord.WcPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.WcPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.WcPrem = CType(reader("wc_prem"), Double)
                    ValueIsNull = String.Empty
                End If


                Records.Add(SeeRecord)
            End While
        End Using

        Return Records
    End Function

    Public Shared Sub AddTotalSmpQuoteRecord(ByVal agentNum As String, ByVal TheYear As String)
        If IsPresent(agentNum, TheYear) = False Then
            Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
            Dim con As SqlConnection = New SqlConnection(MyConnection)
            Dim cmd As SqlCommand = New SqlCommand("INSERT INTO smpQuoteTotal (AgentNumber, _Year, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec) SELECT DISTINCT agent, YEAR(quote_date), '0','0','0','0','0','0','0','0','0','0','0','0' FROM newbus WHERE agent = @agent AND YEAR(quote_date) = @year ", con)
            cmd.Parameters.AddWithValue("@agent", agentNum)
            cmd.Parameters.AddWithValue("@year", TheYear)
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End If

        AddTotalSmpWrittenRecord(agentNum, TheYear)

    End Sub

    Public Shared Sub AddTotalSmpWrittenRecord(ByVal agentNum As String, ByVal TheYear As String)
        If IsValid(agentNum, TheYear) = False Then
            Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
            Dim con As SqlConnection = New SqlConnection(MyConnection)
            Dim cmd As SqlCommand = New SqlCommand("INSERT INTO smpWrittenTotal (AgentNumber, _Year, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec) SELECT DISTINCT agent, YEAR(date_written), '0','0','0','0','0','0','0','0','0','0','0','0' FROM newbus WHERE agent = @agent AND YEAR(date_written) = @year ", con)
            cmd.Parameters.AddWithValue("@agent", agentNum)
            cmd.Parameters.AddWithValue("@year", TheYear)
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End If

    End Sub

    Public Shared Function IsPresent(ByVal agentNum As String, ByVal TheYear As String) As Boolean
        Dim Records As New List(Of _SummaryVariables)()
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("SELECT COUNT(AgentNumber) As aNum, _Year FROM smpQuoteTotal WHERE agentNumber = @agent AND _Year = @year GROUP BY _Year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Dim x As Integer

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _SummaryVariables()
                SeeRecord.AgentNumber = CType(reader("aNum"), Integer)
                x = SeeRecord.AgentNumber
                'Records.Add(SeeRecord)
            End While
        End Using
        If x >= 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function IsValid(ByVal agentNum As String, ByVal TheYear As String) As Boolean
        Dim Records As New List(Of _SummaryVariables)()
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("SELECT COUNT(AgentNumber) As aNum, _Year FROM smpWrittenTotal WHERE agentNumber = @agent AND _Year = @year GROUP BY _Year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Dim x As Integer

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _SummaryVariables()
                SeeRecord.AgentNumber = CType(reader("aNum"), Integer)
                x = SeeRecord.AgentNumber
                'Records.Add(SeeRecord)
            End While
        End Using
        If x >= 1 Then
            Return True
        Else
            Return False
        End If
    End Function


    Public Shared Sub UpdateTotalSmpRecord(ByVal agentNum As String, ByVal TheYear As String)

        UpdateTotalSmpJan(agentNum, TheYear)
        UpdateTotalSmpFeb(agentNum, TheYear)
        UpdateTotalSmpMar(agentNum, TheYear)
        UpdateTotalSmpApr(agentNum, TheYear)
        UpdateTotalSmpMay(agentNum, TheYear)
        UpdateTotalSmpJun(agentNum, TheYear)
        UpdateTotalSmpJul(agentNum, TheYear)
        UpdateTotalSmpAug(agentNum, TheYear)
        UpdateTotalSmpSep(agentNum, TheYear)
        UpdateTotalSmpOct(agentNum, TheYear)
        UpdateTotalSmpNov(agentNum, TheYear)
        UpdateTotalSmpDec(agentNum, TheYear)

    End Sub

    Public Shared Sub UpdateTotalSmpJan(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Jan = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 1 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpFeb(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Feb = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 2 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpMar(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Mar = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 3 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpApr(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Apr = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 4 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpMay(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET May = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 5 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpJun(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Jun = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 6 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpJul(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Jul = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 7 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpAug(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Aug = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 8 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpSep(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Sep = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 9 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpOct(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Oct = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 10 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpNov(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Nov = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 11 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpDec(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpQuoteTotal SET Dec = (SELECT COUNT(smp_quoted) FROM newbus INNER JOIN smpQuoteTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(quote_date) = 12 AND YEAR(quote_date) = @year GROUP BY MONTH(quote_date)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    'Start Update for total smp written
    Public Shared Sub UpdateTotalSmpWrittenRecord(ByVal agentNum As String, ByVal TheYear As String)
        UpdateTotalSmpWrittenJan(agentNum, TheYear)
        UpdateTotalSmpWrittenFeb(agentNum, TheYear)
        UpdateTotalSmpWrittenMar(agentNum, TheYear)
        UpdateTotalSmpWrittenApr(agentNum, TheYear)
        UpdateTotalSmpWrittenMay(agentNum, TheYear)
        UpdateTotalSmpWrittenJun(agentNum, TheYear)
        UpdateTotalSmpWrittenJul(agentNum, TheYear)
        UpdateTotalSmpWrittenAug(agentNum, TheYear)
        UpdateTotalSmpWrittenSep(agentNum, TheYear)
        UpdateTotalSmpWrittenOct(agentNum, TheYear)
        UpdateTotalSmpWrittenNov(agentNum, TheYear)
        UpdateTotalSmpWrittenDec(agentNum, TheYear)
    End Sub


    'Start Update for total smp written
    Public Shared Sub UpdateTotalSmpWrittenJan(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Jan = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 1 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenFeb(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Feb = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 2 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub


    Public Shared Sub UpdateTotalSmpWrittenMar(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Mar = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 3 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenApr(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Apr = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 4 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenMay(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET May = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 5 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenJun(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Jun = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 6 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenJul(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Jul = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 7 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenAug(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Aug = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 8 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenSep(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Sep = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 9 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenOct(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Oct = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 10 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenNov(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Nov = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 11 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub UpdateTotalSmpWrittenDec(ByVal agentNum As String, ByVal TheYear As String)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand("UPDATE smpWrittenTotal SET Dec = (SELECT COUNT(smp_written) FROM newbus INNER JOIN smpWrittenTotal As T ON agent = T.AgentNumber WHERE agent = @agent AND MONTH(date_written) = 12 AND YEAR(date_written) = @year GROUP BY MONTH(date_written)) WHERE AgentNumber = @agent AND _Year = @year", con)
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.Parameters.AddWithValue("@year", TheYear)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub




    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetAllSmpCount() As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@agent", "0005010")
        cmd.CommandText = "SELECT quote_date, agent, smp_quoted, not_written, date_written, smp_written FROM newbus WHERE agent = @agent AND quote_date BETWEEN '01-01-2018' AND '01-31-2018'"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _NewBusiness()

                SeeRecord.QuoteDate = Convert.ToString(reader("quote_date"))
                ValueIsNull = SeeRecord.QuoteDate
                If ValueIsNull = Nothing Then
                    SeeRecord.QuoteDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.QuoteDate = CType(reader("quote_date"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.SmpQuoted = CType(reader("smp_quoted"), Byte)

                Records.Add(SeeRecord)
            End While
        End Using

        Return Records
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetBusinessSummary() As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@agent", "0005010")
        cmd.CommandText = "SELECT newbus.newbus_id, newbus.quote_date, newbus.curr_date, newbus.church, newbus.location, newbus.state, newbus.agent, newbus.loss_control, newbus.uw, newbus.carrier, newbus.curr_prem, newbus.smp_quoted, newbus.umb_quoted, newbus.ba_quoted, newbus.wc_quoted, newbus.not_written, newbus.reason, newbus.date_written, newbus.smp_written, newbus.umb_written, newbus.ba_written, newbus.wc_written, newbus.smp_prem, newbus.umb_prem, newbus.ba_prem, newbus.wc_prem, newbus.seacoast, newbus.seacoast_exp, newbus.irpm_factor, newbus.cust_no, newbus.decline_date, newbus.request_no, newbus.insp_appt, FileLocation.FullName FROM newbus INNER JOIN FileLocation ON newbus.uw = FileLocation.file_location OR newbus.loss_control = FileLocation.file_location WHERE newbus.agent = @agent AND newbus.date_written BETWEEN '01-01-2018' AND '10-01-2018'"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _NewBusiness()
                SeeRecord.NewbusId = CType(reader("newbus_id"), Integer)


                SeeRecord.QuoteDate = Convert.ToString(reader("quote_date"))
                ValueIsNull = SeeRecord.QuoteDate
                If ValueIsNull = Nothing Then
                    SeeRecord.QuoteDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.QuoteDate = CType(reader("quote_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Agent = Convert.ToString(reader("agent"))
                ValueIsNull = SeeRecord.Agent
                If ValueIsNull = Nothing Then
                    SeeRecord.Agent = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Agent = CType(reader("agent"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.CurrDate = Convert.ToString(reader("curr_date"))
                ValueIsNull = SeeRecord.CurrDate.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.CurrDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.CurrDate = CType(reader("curr_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Church = Convert.ToString(reader("church"))
                ValueIsNull = SeeRecord.Church.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Church = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Church = CType(reader("church"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Location = Convert.ToString(reader("location"))
                ValueIsNull = SeeRecord.Location.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Location = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Location = CType(reader("location"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.State = Convert.ToString(reader("state"))
                ValueIsNull = SeeRecord.State
                If ValueIsNull = Nothing Then
                    SeeRecord.State = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.State = CType(reader("state"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.LossControl = Convert.ToString(reader("loss_control"))
                ValueIsNull = SeeRecord.LossControl
                If ValueIsNull = Nothing Then
                    SeeRecord.LossControl = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.LossControl = CType(reader("loss_control"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.UW = Convert.ToString(reader("uw"))
                ValueIsNull = SeeRecord.UW.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.UW = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.UW = CType(reader("uw"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.FullName = Convert.ToString(reader("FullName"))
                ValueIsNull = SeeRecord.FullName.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.FullName = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.FullName = CType(reader("FullName"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Carrier = Convert.ToString(reader("carrier"))
                ValueIsNull = SeeRecord.Carrier.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Carrier = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Carrier = CType(reader("carrier"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.CurrPrem = Convert.ToDecimal(reader("curr_prem"))
                ValueIsNull = SeeRecord.CurrPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.CurrPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.CurrPrem = CType(reader("curr_prem"), Decimal)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.SmpQuoted = CType(reader("smp_quoted"), Byte)
                SeeRecord.UmbQuoted = CType(reader("umb_quoted"), Byte)
                SeeRecord.BaQuoted = CType(reader("ba_quoted"), Byte)
                SeeRecord.WcQuoted = CType(reader("wc_quoted"), Byte)


                SeeRecord.NotWritten = CType(reader("not_written"), Byte)

                'Checking for Null values
                SeeRecord.Reason = Convert.ToString(reader("reason"))
                ValueIsNull = SeeRecord.Reason.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Reason = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Reason = CType(reader("reason"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.DateWritten = Convert.ToString(reader("date_written"))
                ValueIsNull = SeeRecord.DateWritten
                If ValueIsNull = Nothing Then
                    SeeRecord.DateWritten = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.DateWritten = CType(reader("date_written"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.SmpWritten = CType(reader("smp_written"), Byte)
                SeeRecord.UmbWritten = CType(reader("umb_written"), Byte)
                SeeRecord.BaWritten = CType(reader("ba_written"), Byte)
                SeeRecord.WcWritten = CType(reader("wc_written"), Byte)

                'Checking for Null values
                SeeRecord.SmpPrem = Convert.ToDecimal(reader("smp_prem"))
                ValueIsNull = SeeRecord.SmpPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.SmpPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.SmpPrem = CType(reader("smp_prem"), Decimal)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.UmbPrem = Convert.ToDecimal(reader("umb_prem"))
                ValueIsNull = SeeRecord.UmbPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.UmbPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.UmbPrem = CType(reader("umb_prem"), Decimal)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.BaPrem = Convert.ToDecimal(reader("ba_prem"))
                ValueIsNull = SeeRecord.BaPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.BaPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.BaPrem = CType(reader("ba_prem"), Decimal)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.WcPrem = Convert.ToDecimal(reader("wc_prem"))
                ValueIsNull = SeeRecord.WcPrem
                If ValueIsNull = Nothing Then
                    SeeRecord.WcPrem = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.WcPrem = CType(reader("wc_prem"), Decimal)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Seacoast = Convert.ToSByte(reader("seacoast"))
                ValueIsNull = SeeRecord.Seacoast
                If ValueIsNull = Nothing Then
                    SeeRecord.Seacoast = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Seacoast = CType(reader("seacoast"), Byte)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.SeacoastExp = Convert.ToDecimal(reader("seacoast_exp"))
                ValueIsNull = SeeRecord.SeacoastExp
                If ValueIsNull = Nothing Then
                    SeeRecord.SeacoastExp = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.SeacoastExp = CType(reader("seacoast_exp"), Decimal)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.IrpmFactor = Convert.ToString(reader("irpm_factor"))
                ValueIsNull = SeeRecord.IrpmFactor
                If ValueIsNull = Nothing Then
                    SeeRecord.IrpmFactor = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.IrpmFactor = CType(reader("irpm_factor"), Decimal)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.CustNo = Convert.ToString(reader("cust_no"))
                ValueIsNull = SeeRecord.CustNo
                If ValueIsNull = Nothing Then
                    SeeRecord.CustNo = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.CustNo = CType(reader("cust_no"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.DeclineDate = Convert.ToString(reader("decline_date"))
                ValueIsNull = SeeRecord.DeclineDate
                If ValueIsNull = Nothing Then
                    SeeRecord.DeclineDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.DeclineDate = CType(reader("decline_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.RequestNo = Convert.ToString(reader("request_no"))
                ValueIsNull = SeeRecord.RequestNo
                If ValueIsNull = Nothing Then
                    SeeRecord.RequestNo = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.RequestNo = CType(reader("request_no"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.InspAppt = Convert.ToString(reader("insp_appt"))
                ValueIsNull = SeeRecord.InspAppt
                If ValueIsNull = Nothing Then
                    SeeRecord.InspAppt = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.InspAppt = CType(reader("insp_appt"), String)
                    ValueIsNull = String.Empty
                End If
                Records.Add(SeeRecord)
            End While
        End Using

        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function ShowAgencyByNumber(ByVal agentNum As String) As List(Of _AgencyVariables)
        Dim Names As New List(Of _AgencyVariables)()

        ' Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.CommandText = "SELECT AGENT_NUMBER, NAME_OF_AGENCY FROM AgencyBusinessInformation WHERE AGENT_NUMBER = @agent ORDER BY AGENT_NUMBER, NAME_OF_AGENCY"
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.CommandType = CommandType.Text


        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AgencyVariables()
                SeeRecord.agency_number = CType(reader("AGENT_NUMBER"), String)
                SeeRecord.agency_name = CType(reader("NAME_OF_AGENCY"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetAgencyBusinessInfo(ByVal agent As String) As List(Of _AgencyVariables)
        Dim Names As New List(Of _AgencyVariables)()

        ' Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.CommandText = "SELECT AGENT_NUMBER + ' - ' + NAME_OF_AGENCY As CodeName FROM AgencyBusinessInformation WHERE AGENT_NUMBER = @agent ORDER BY AGENT_NUMBER, NAME_OF_AGENCY"
        cmd.Parameters.AddWithValue("@agent", agent)
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AgencyVariables()
                'SeeRecord.agency_number = CType(reader("AGENT_NUMBER"), String)
                SeeRecord.agency_name = CType(reader("CodeName"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetCurrentYear(ByVal TheYear As String) As List(Of _DateVariables)
        Dim Record As New List(Of _DateVariables)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@year", TheYear)
        cmd.CommandText = "SELECT YEAR(quote_date) As YY FROM newbus WHERE YEAR(quote_date) = @year"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim result As Object = cmd.ExecuteScalar

            Dim SeeRecord As New _DateVariables()
            SeeRecord.Year = Convert.ToString(result)
            ValueIsNull = SeeRecord.Year
            If ValueIsNull = Nothing Then
                SeeRecord.Year = ""
                ValueIsNull = String.Empty
            Else
                SeeRecord.Year = Convert.ToString(result)
                ValueIsNull = String.Empty
            End If
            Record.Add(SeeRecord)
        End Using

        Return Record
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetGrowth(ByVal agentNum As String) As List(Of _LossDetailGrowthVaiable)
        Dim TheGrowth As New List(Of _LossDetailGrowthVaiable)()

        Dim con As SqlConnection = New SqlConnection(_conString)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.CommandText = "SELECT inforce_prem - prev_year As Growth FROM agyperf WHERE agency_no = @agent"
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _LossDetailGrowthVaiable()
                SeeRecord.Growth = CType(reader("Growth"), String)
                TheGrowth.Add(SeeRecord)
            End While

        End Using

        Return TheGrowth
    End Function

End Class
