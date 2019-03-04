Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.Page
Imports System.Web.HttpServerUtility
Imports System.Web.Configuration
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data.Odbc
Imports System.Data.OleDb
Imports IBM.Data.DB2.iSeries
Imports smci.policyholders
Imports smci.agents
Imports Microsoft.VisualBasic

Namespace smci.DataAccessLayer

    Public Class MySqlIdb2Code
        Private Shared ReadOnly _connectionString As String = String.Empty
        Private Shared ReadOnly _connString As String = String.Empty

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function ReadCustomerInfo() As List(Of PolicyholderAccountInfoVariables)
            Dim CustomerRecord As New List(Of PolicyholderAccountInfoVariables)()

            Dim con As iDB2Connection = New iDB2Connection(_connectionString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "select POLICY0NUM from PMSP0200 ORDER BY POLICY0NUM"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeeCustomerRecord As New PolicyholderAccountInfoVariables()
                    SeeCustomerRecord.Policynumber = CType(reader("POLICY0NUM"), String)
                    CustomerRecord.Add(SeeCustomerRecord)
                End While
            End Using
            Return CustomerRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function TestCustomerInfo(ByVal UserNameIs As String) As List(Of PMSP0200TABLE)
            Dim CustomerRecord As New List(Of PMSP0200TABLE)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            'cmd.CommandText = "SELECT CUST0NO, SYMBOL, POLICY0NUM, ADD0LINE01, ADD0LINE03, ADD0LINE04, ZIP0POST, TOT0AG0PRM, MODULE, EFF0MO || '/' || EFF0DA || '/' || SUBSTRING(EFF0YR, 2,2) As EFF0DATE, EXP0MO || '/' || EXP0DA || '/' || SUBSTRING(EXP0YR, 2,2) As EXP0DATE, SUBSTRING(ENTER0DATE, 4,2) || '/' || SUBSTRING(ENTER0DATE, 6,2) || '/' || SUBSTRING(ENTER0DATE, 2,2) As ENTER0DATE01 FROM PMSP0200 WHERE CUST0NO = ? ORDER BY CUST0NO, SYMBOL, MODULE DESC"
            'cmd.CommandText = "SELECT CUST0NO, TRANS0STAT, SYMBOL || ' - ' || POLICY0NUM As POLICY0TYPE, ADD0LINE01, ADD0LINE03, ADD0LINE04, ZIP0POST, TOT0AG0PRM, MODULE, EFF0DATE, EXP0DATE, ENTER0DATE01, TYPE0ACT, TODAYDATE FROM vPolicyholderBillingData WHERE CUST0NO = ? ORDER BY CUST0NO, SYMBOL, MODULE DESC"
            cmd.CommandText = "SELECT CUST0NO, POLICY0TYPE, TRANS0STAT, ADD0LINE01, ADD0LINE03, ADD0LINE04, ZIP0POST, TOT0AG0PRM, MODULE, DAYSELAPSED, EXP0DATE, EFF0DATE, ENTER0DATE01, TYPE0ACT FROM vPolicyholderBilling2 WHERE CUST0NO = ? AND DAYSELAPSED >= 0 AND POLICY0TYPE NOT LIKE 'BAQ%' ORDER BY CUST0NO, POLICY0TYPE, MODULE DESC"
            'cmd.CommandText = "SELECT DISTINCT S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO As CUST0NO, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.POLICY0TYPE As POLICY0TYPE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE01 As ADD0LINE01, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_NAME1 As ACNM_NAME1, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_ADDRS As ACNM_ADDRS, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_CTYST As ACNM_CTYST, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_ZIP As ACNM_ZIP, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_TELE As ACNM_TELE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE03 As ADD0LINE03, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE04 As ADD0LINE04, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.&quot;MODULE&quot; As MODULE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.EXP0DATE As EXP0DATE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.EFF0DATE As EFF0DATE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ENTER0DATE01 As ENTER0DATE01, S06F8355.SOMRC0DAT.PMSL0217.AGENCY As AGENCY, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TRANS0STAT As TRANS0STAT, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ZIP0POST As ZIP0POST, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TOT0AG0PRM As TOT0AG0PRM, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.DAYSELAPSED As DAYSELAPSED, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TYPE0ACT As TYPE0ACT FROM(S06F8355.SOMRC0DAT.PMSL0217, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2, S06F8355.SOMRC0DAT.VAGENCYINFO) WHERE(S06F8355.SOMRC0DAT.PMSL0217.CUST0NO = S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO) AND S06F8355.SOMRC0DAT.PMSL0217.AGENCY = S06F8355.SOMRC0DAT.VAGENCYINFO.AGNM_AGCY AND (S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO = ?) AND (S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.DAYSELAPSED &gt;= 0) ORDER BY S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.POLICY0TYPE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.&quot;MODULE&quot; DESC"
            'cmd.CommandText = "SELECT DISTINCT S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO As CUST0NO, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.POLICY0TYPE As POLICY0TYPE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE01 As ADD0LINE01, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_NAME1 As ACNM_NAME1, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_ADDRS As ACNM_ADDRS, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_CTYST As ACNM_CTYST, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_ZIP As ACNM_ZIP, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_TELE As ACNM_TELE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE03 As ADD0LINE03, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE04 As ADD0LINE04, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.MODULE As MODULE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.EXP0DATE As EXP0DATE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.EFF0DATE As EFF0DATE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ENTER0DATE01 As ENTER0DATE01, S06F8355.SOMRC0DAT.PMSL0217.AGENCY As AGENCY, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TRANS0STAT As TRANS0STAT, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ZIP0POST As ZIP0POST, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TOT0AG0PRM As TOT0AG0PRM, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.DAYSELAPSED As DAYSELAPSED, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TYPE0ACT As TYPE0ACT FROM S06F8355.SOMRC0DAT.PMSL0217 inner join S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2 on S06F8355.SOMRC0DAT.PMSL0217.CUST0NO = S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO inner join S06F8355.SOMRC0DAT.VAGENCYINFO on S06F8355.SOMRC0DAT.PMSL0217.AGENCY = S06F8355.SOMRC0DAT.VAGENCYINFO.AGNM_AGCY AND (S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO = ?) AND (S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.DAYSELAPSED >= 0) ORDER BY S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.POLICY0TYPE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.MODULE DESC"
            'cmd.Parameters.Add("CN", OdbcType.NVarChar).Value = CN
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeeCustomerRecord As New PMSP0200TABLE()
                    SeeCustomerRecord.CUST0NO = CType(reader("CUST0NO"), String)
                    SeeCustomerRecord.POLICY0TYPE = CType(reader("POLICY0TYPE"), String)
                    SeeCustomerRecord.ADD0LINE01 = CType(reader("ADD0LINE01"), String)
                    'SeeCustomerRecord.ACNM_NAME1 = CType(reader("ACNM_NAME1"), String)
                    'SeeCustomerRecord.ACNM_ADDRS = CType(reader("ACNM_ADDRS"), String)
                    'SeeCustomerRecord.ACNM_CTYST = CType(reader("ACNM_CTYST"), String)
                    'SeeCustomerRecord.ACNM_ZIP = CType(reader("ACNM_ZIP"), String)
                    'SeeCustomerRecord.ACNM_TELE = CType(reader("ACNM_TELE"), String)
                    SeeCustomerRecord.ADD0LINE03 = CType(reader("ADD0LINE03"), String)
                    SeeCustomerRecord.ADD0LINE04 = CType(reader("ADD0LINE04"), String)
                    SeeCustomerRecord.M0DULE = CType(reader("MODULE"), String)
                    SeeCustomerRecord.EXP0DATE = CType(reader("EXP0DATE"), Date)
                    SeeCustomerRecord.EFF0DATE = CType(reader("EFF0DATE"), Date)
                    SeeCustomerRecord.ENTER0DATE01 = CType(reader("ENTER0DATE01"), String)
                    'SeeCustomerRecord.AGENCYNO = CType(reader("AGENCY"), String)
                    SeeCustomerRecord.TRANS0STAT = CType(reader("TRANS0STAT"), String)
                    SeeCustomerRecord.ZIP0POST = CType(reader("ZIP0POST"), String)
                    SeeCustomerRecord.TOT0AG0PRM = CType(reader("TOT0AG0PRM"), String)
                    SeeCustomerRecord.DAYSELAPSED = CType(reader("DAYSELAPSED"), Integer)
                    SeeCustomerRecord.TYPE0ACT = CType(reader("TYPE0ACT"), String)
                    'SeeCustomerRecord.ID02 = CType(reader("ID02"), String)
                    'SeeCustomerRecord.SYMBOL = CType(reader("SYMBOL"), String)
                    'SeeCustomerRecord.POLICY0NUM = CType(reader("POLICY0NUM"), String)
                    'SeeCustomerRecord.TODAY0DATE = CType(reader("TODAYDATE"), Date)
                    CustomerRecord.Add(SeeCustomerRecord)
                End While
            End Using
            Return CustomerRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function TheInsuredSMPInfo(ByVal UserNameIs As String) As List(Of RCD0CPL1TABLE)
            Dim ReadPolicy As New List(Of RCD0CPL1TABLE)()
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            'cmd.CommandText = "SELECT D0POLAGY, D0NAMEINS, D0CUSTCD, D0POLSYM, D0POLNO, D0POLMOD, D0POLSYM || ' ' || D0POLNO || '-' ||  D0POLMOD As ALLPOLICYNUM, D0POLSYM || D0POLNO || D0POLMOD As HYPERLINKID, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As DOEFF0DTE, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As DOEXP0DTE FROM RCD0CPL1 WHERE (D0CUSTCD = ?)"
            'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD0CPL1.D0POLMOD, SOMRC0DAT.BASP0200E.USRIND3, SOMRC0DAT.RCD0CPL1.D0POLAGY, SOMRC0DAT.RCD0CPL1.D0NAMEINS, SOMRC0DAT.RCD0CPL1.D0CUSTCD, SOMRC0DAT.RCD0CPL1.D0POLSYM, SOMRC0DAT.RCD0CPL1.D0POLNO, SOMRC0DAT.RCD0CPL1.D0PAYDESC, SOMRC0DAT.RCD0CPL1.D0MODEDESC, SOMRC0DAT.RCD0CPL1.D0POLSYM || ' ' || SOMRC0DAT.RCD0CPL1.D0POLNO || '-' ||  SOMRC0DAT.RCD0CPL1.D0POLMOD As ALLPOLICYNUM, SOMRC0DAT.RCD0CPL1.D0POLSYM || SOMRC0DAT.RCD0CPL1.D0POLNO || SOMRC0DAT.RCD0CPL1.D0POLMOD As HYPERLINKID, substring(SOMRC0DAT.RCD0CPL1.D0EFFDTE,4,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EFFDTE,6,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EFFDTE,2,2) As DOEFF0DTE, substring(SOMRC0DAT.RCD0CPL1.D0EXPDTE,4,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EXPDTE,6,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EXPDTE,2,2) As DOEXP0DTE FROM SOMRC0DAT.BASP0200E, SOMRC0DAT.RCD0CPL1 WHERE (SOMRC0DAT.BASP0200E.POLICY0NUM = SOMRC0DAT.RCD0CPL1.D0POLNO) AND (SOMRC0DAT.RCD0CPL1.D0CUSTCD = ?) ORDER BY SOMRC0DAT.RCD0CPL1.D0POLMOD DESC"
            cmd.CommandText = "SELECT SOMRC0DAT.BASP0200E.SYMBOL, SOMRC0DAT.BASP0200E.POLICY0NUM, SOMRC0DAT.BASP0200E.MODULE, SOMRC0DAT.BASP0200E.USRIND3, SOMRC0DAT.BASP0200E.SYMBOL || ' ' || SOMRC0DAT.BASP0200E.POLICY0NUM || '-' ||  SOMRC0DAT.BASP0200E.MODULE As ALLPOLICYNUM, SOMRC0DAT.BASP0200E.SYMBOL || SOMRC0DAT.BASP0200E.POLICY0NUM || SOMRC0DAT.BASP0200E.MODULE As HYPERLINKID, substring(SOMRC0DAT.RCD0CPL1.D0EFFDTE,4,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EFFDTE,6,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EFFDTE,2,2) As DOEFF0DTE, substring(SOMRC0DAT.RCD0CPL1.D0EXPDTE,4,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EXPDTE,6,2) || '/' || substring(SOMRC0DAT.RCD0CPL1.D0EXPDTE,2,2) As DOEXP0DTE, SOMRC0DAT.RCD0CPL1.D0PAYDESC, SOMRC0DAT.RCD0CPL1.D0MODEDESC FROM SOMRC0DAT.BASP0200E, SOMRC0DAT.RCD0CPL1 WHERE (SOMRC0DAT.RCD0CPL1.D0POLNO = SOMRC0DAT.BASP0200E.POLICY0NUM) AND (SOMRC0DAT.RCD0CPL1.D0POLMOD = SOMRC0DAT.BASP0200E.MODULE) AND (SOMRC0DAT.RCD0CPL1.D0CUSTCD = ?) ORDER BY SOMRC0DAT.BASP0200E.MODULE DESC, SOMRC0DAT.BASP0200E.SYMBOL"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text
            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim GetPolicyRecord As New RCD0CPL1TABLE()
                    GetPolicyRecord.PolicyType = CType(reader("SYMBOL"), String)
                    GetPolicyRecord.PolicyNum = CType(reader("POLICY0NUM"), String)
                    GetPolicyRecord.M0dule = CType(reader("MODULE"), String)
                    GetPolicyRecord.Usrind3 = CType(reader("USRIND3"), String)
                    GetPolicyRecord.Allpolnum = CType(reader("ALLPOLICYNUM"), String)
                    GetPolicyRecord.HyperlinkId = CType(reader("HYPERLINKID"), String)
                    GetPolicyRecord.Paymenttype = CType(reader("D0PAYDESC"), String)
                    GetPolicyRecord.Paymentplan = CType(reader("D0MODEDESC"), String)
                    GetPolicyRecord.EffDate = CType(reader("DOEFF0DTE"), Date)
                    GetPolicyRecord.ExpDate = CType(reader("DOEXP0DTE"), String)
                    GetPolicyRecord.Usrind3 = CType(reader("USRIND3"), String)
                    Dim pType As String = CType(reader("SYMBOL"), String)
                    Dim polNum As String = CType(reader("POLICY0NUM"), String)
                    Dim m0de As Integer = CType(reader("MODULE"), String)
                    Dim usrTerm As String = CType(reader("USRIND3"), String)
                    Dim x As Date = GetPolicyRecord.EffDate.ToString
                    Dim y As Date = Today.Date
                    Dim z As Date = GetPolicyRecord.ExpDate.ToString
                    Dim newExpDate As Date
                    'Dim currentModule As Integer
                    Dim currentPolicy As String
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = x.Subtract(y)
                    'In order for the user to view their policy in media view the field 'USRIND3' within the BASP0200E table
                    'must equal to 1 that represents the first cycle in a SMP policy.
                    If DaysElasped.Days >= -365.242 And DaysElasped.Days <= 0 And pType = "SMP" And usrTerm = "1" Then
                        'SMP policies that are within the first cycle need to override the current exp date
                        'the code below changes the exp date to the three year exp date.
                        newExpDate = z.AddDays(730.484)
                        GetPolicyRecord.ExpDate = newExpDate.Date
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days >= -730.484 And DaysElasped.Days <= -365.242 And pType = "SMP" And usrTerm = "1" Then
                        'SMP policies that are within the second cycle need to override the current exp date
                        'the code below changes the exp date to the three year exp date.
                        newExpDate = z.AddDays(730.484)
                        GetPolicyRecord.ExpDate = newExpDate.Date
                        'SMP policies that are within the second cycle need to override the first cycle module
                        'to the current module.
                        currentPolicy = String.Concat(pType, polNum, Format(m0de + 1, "00"))
                        GetPolicyRecord.Currentpol = currentPolicy.ToString
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days >= -1095.726 And DaysElasped.Days <= -730.484 And pType = "SMP" And usrTerm = "1" Then
                        'SMP policies that are within the third cycle need to override the current exp date
                        'the code below changes the exp date to the three year exp date.
                        newExpDate = z.AddDays(730.484)
                        GetPolicyRecord.ExpDate = newExpDate.Date
                        'SMP policies that are within the third cycle need to override the first cycle module
                        'to the current module.
                        currentPolicy = String.Concat(pType, polNum, Format(m0de + 2, "00"))
                        GetPolicyRecord.Currentpol = currentPolicy.ToString
                        ReadPolicy.Add(GetPolicyRecord)
                    End If
                End While
            End Using
            Return ReadPolicy
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function TheInsuredOtherInfo(ByVal UserNameIs As String) As List(Of RCD0CPL1TABLE)
            Dim ReadPolicy As New List(Of RCD0CPL1TABLE)()
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT D0POLAGY, D0NAMEINS, D0CUSTCD, D0POLSYM, D0POLNO, D0POLMOD, D0POLSYM || ' ' || D0POLNO || '-' ||  D0POLMOD As ALLPOLICYNUM, D0POLSYM || D0POLNO || D0POLMOD As HYPERLINKID, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As DOEFF0DTE, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As DOEXP0DTE FROM RCD0CPL1 WHERE (D0CUSTCD = ?)"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text
            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim GetPolicyRecord As New RCD0CPL1TABLE()
                    GetPolicyRecord.Agency = CType(reader("D0POLAGY"), String)
                    GetPolicyRecord.TheInsured = CType(reader("D0NAMEINS"), String)
                    GetPolicyRecord.CustomerNum = CType(reader("D0CUSTCD"), String)
                    GetPolicyRecord.PolicyType = CType(reader("D0POLSYM"), String)
                    GetPolicyRecord.PolicyNum = CType(reader("D0POLNO"), String)
                    GetPolicyRecord.M0dule = CType(reader("D0POLMOD"), String)
                    GetPolicyRecord.Allpolnum = CType(reader("ALLPOLICYNUM"), String)
                    GetPolicyRecord.HyperlinkId = CType(reader("HYPERLINKID"), String)
                    GetPolicyRecord.EffDate = CType(reader("DOEFF0DTE"), Date)
                    GetPolicyRecord.ExpDate = CType(reader("DOEXP0DTE"), String)
                    Dim pType As String = CType(reader("D0POLSYM"), String)
                    Dim m0de As Integer = CType(reader("D0POLMOD"), String)
                    Dim x As Date = GetPolicyRecord.EffDate.ToString
                    'Dim x As Date = GetPolicyRecord.ExpDate.ToString
                    Dim y As Date = Today.Date
                    Dim z As Date = GetPolicyRecord.ExpDate.ToString
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = x.Subtract(y)
                    If DaysElasped.Days >= -365.242 And DaysElasped.Days <= 0 And pType = "BA " Then
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days >= -365.242 And DaysElasped.Days <= 0 And pType = "WC " Then
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days >= -365.242 And DaysElasped.Days <= 0 And pType = "UM " Then
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days >= -365.242 And DaysElasped.Days <= 0 And pType = "STD" Then
                        ReadPolicy.Add(GetPolicyRecord)
                    End If
                End While
            End Using
            Return ReadPolicy
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetAgencyInfo(ByVal UserNameIs As String) As List(Of PMSP0200TABLE)
            Dim AgencyRecord As New List(Of PMSP0200TABLE)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT DISTINCT S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO As CUST0NO, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.POLICY0TYPE As POLICY0TYPE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE01 As ADD0LINE01, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_NAME1 As ACNM_NAME1, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_ADDRS As ACNM_ADDRS, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_CTYST As ACNM_CTYST, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_ZIP As ACNM_ZIP, S06F8355.SOMRC0DAT.VAGENCYINFO.ACNM_TELE As ACNM_TELE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE03 As ADD0LINE03, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ADD0LINE04 As ADD0LINE04, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.MODULE As MODULE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.EXP0DATE As EXP0DATE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.EFF0DATE As EFF0DATE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ENTER0DATE01 As ENTER0DATE01, S06F8355.SOMRC0DAT.PMSL0217.AGENCY As AGENCY, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TRANS0STAT As TRANS0STAT, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.ZIP0POST As ZIP0POST, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TOT0AG0PRM As TOT0AG0PRM, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.DAYSELAPSED As DAYSELAPSED, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.TYPE0ACT As TYPE0ACT FROM S06F8355.SOMRC0DAT.PMSL0217 inner join S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2 on S06F8355.SOMRC0DAT.PMSL0217.CUST0NO = S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO inner join S06F8355.SOMRC0DAT.VAGENCYINFO on S06F8355.SOMRC0DAT.PMSL0217.AGENCY = S06F8355.SOMRC0DAT.VAGENCYINFO.AGNM_AGCY AND (S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO = ?) AND (S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.DAYSELAPSED >= 0) AND (S06F8355.SOMRC0DAT.PMSL0217.AGENCY NOT LIKE '%0009%') ORDER BY S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.CUST0NO, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.POLICY0TYPE, S06F8355.SOMRC0DAT.VPOLICYHOLDERBILLING2.MODULE DESC"
            'cmd.Parameters.Add("CN", OdbcType.NVarChar).Value = CN
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeeAgencyRecord As New PMSP0200TABLE()
                    SeeAgencyRecord.CUST0NO = CType(reader("CUST0NO"), String)
                    SeeAgencyRecord.POLICY0TYPE = CType(reader("POLICY0TYPE"), String)
                    SeeAgencyRecord.ADD0LINE01 = CType(reader("ADD0LINE01"), String)
                    SeeAgencyRecord.ACNM_NAME1 = CType(reader("ACNM_NAME1"), String)
                    SeeAgencyRecord.ACNM_ADDRS = CType(reader("ACNM_ADDRS"), String)
                    SeeAgencyRecord.ACNM_CTYST = CType(reader("ACNM_CTYST"), String)
                    SeeAgencyRecord.ACNM_ZIP = CType(reader("ACNM_ZIP"), String)
                    SeeAgencyRecord.ACNM_TELE = CType(reader("ACNM_TELE"), String)
                    SeeAgencyRecord.ADD0LINE03 = CType(reader("ADD0LINE03"), String)
                    SeeAgencyRecord.ADD0LINE04 = CType(reader("ADD0LINE04"), String)
                    SeeAgencyRecord.M0DULE = CType(reader("MODULE"), String)
                    SeeAgencyRecord.EXP0DATE = CType(reader("EXP0DATE"), Date)
                    SeeAgencyRecord.EFF0DATE = CType(reader("EFF0DATE"), Date)
                    SeeAgencyRecord.ENTER0DATE01 = CType(reader("ENTER0DATE01"), String)
                    SeeAgencyRecord.AGENCYNO = CType(reader("AGENCY"), String)
                    SeeAgencyRecord.TRANS0STAT = CType(reader("TRANS0STAT"), String)
                    SeeAgencyRecord.ZIP0POST = CType(reader("ZIP0POST"), String)
                    SeeAgencyRecord.TOT0AG0PRM = CType(reader("TOT0AG0PRM"), String)
                    SeeAgencyRecord.DAYSELAPSED = CType(reader("DAYSELAPSED"), Integer)
                    SeeAgencyRecord.TYPE0ACT = CType(reader("TYPE0ACT"), String)
                    'SeeCustomerRecord.ID02 = CType(reader("ID02"), String)
                    'SeeCustomerRecord.SYMBOL = CType(reader("SYMBOL"), String)
                    'SeeCustomerRecord.POLICY0NUM = CType(reader("POLICY0NUM"), String)
                    'SeeCustomerRecord.TODAY0DATE = CType(reader("TODAYDATE"), Date)
                    AgencyRecord.Add(SeeAgencyRecord)
                End While
            End Using
            Return AgencyRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetBilling(ByVal UserNameIs As String) As List(Of RCD0CPL1TABLE)
            'Retreiving billing info
            Dim ReadPolicy As New List(Of RCD0CPL1TABLE)()
            If UserNameIs Is Nothing Then

            Else

                Dim con As iDB2Connection = New iDB2Connection(_connString)
                Dim cmd As iDB2Command = New iDB2Command()
                cmd.Connection = con
                cmd.CommandText = "SELECT D0POLAGY, D0NAMEINS, D0CUSTCD, D0POLNO, D0POLSYM, D0POLSYM || ' ' || D0POLNO As PolicyType, D0POLSYM || '' || D0POLNO || '' || D0POLMOD As VIEWIT, D0POLMOD, D0CLPREM, D0GVVA * -1 As D0GVVA, D0GSVA * 1.00 As D0GSVA, D0PAYDESC, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As DOEFF0DTE, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As DOEXP0DTE FROM RCD0CPL1 WHERE (D0CUSTCD = ?)"
                cmd.Parameters.AddWithValue("@custnum", UserNameIs)
                cmd.CommandType = CommandType.Text
                Using con
                    con.Open()
                    Dim reader As iDB2DataReader = cmd.ExecuteReader
                    While reader.Read()
                        Dim GetPolicyRecord As New RCD0CPL1TABLE()
                        GetPolicyRecord.Agency = CType(reader("D0POLAGY"), String)
                        GetPolicyRecord.TheInsured = CType(reader("D0NAMEINS"), String)
                        GetPolicyRecord.CustomerNum = CType(reader("D0CUSTCD"), String)
                        GetPolicyRecord.PolicyType = CType(reader("PolicyType"), String)
                        GetPolicyRecord.PolicyNum = CType(reader("D0POLNO"), String)
                        GetPolicyRecord.M0dule = CType(reader("D0POLMOD"), String)
                        GetPolicyRecord.Paymenttype = CType(reader("D0PAYDESC"), String)
                        GetPolicyRecord.TotalPrem = CType(reader("D0CLPREM"), Decimal)
                        GetPolicyRecord.Balance = CType(reader("D0GSVA"), Decimal)
                        GetPolicyRecord.TotalPaid = CType(reader("D0GVVA"), Decimal)
                        GetPolicyRecord.EffDate = CType(reader("DOEFF0DTE"), Date)
                        GetPolicyRecord.ExpDate = CType(reader("DOEXP0DTE"), String)
                        GetPolicyRecord.VIEWIT = CType(reader("VIEWIT"), String)
                        GetPolicyRecord.Symbol = CType(reader("D0POLSYM"), String)
                        Dim x As Date = GetPolicyRecord.ExpDate.ToString
                        Dim y As Date = Today.Date
                        Dim DaysElasped As New TimeSpan
                        DaysElasped = y.Subtract(x)
                        If DaysElasped.Days <= 0 And DaysElasped.Days >= -365.242 Then
                            ReadPolicy.Add(GetPolicyRecord)
                        End If
                    End While
                End Using
            End If
            Return ReadPolicy


        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetNextPayment(ByVal UserNameIs As String) As List(Of RCD2CPPTABLE)
            Dim ReadPolicy As New List(Of RCD2CPPTABLE)()

            If UserNameIs Is Nothing Then

            Else
                'This code 
                Dim con As iDB2Connection = New iDB2Connection(_connString)
                Dim cmd As iDB2Command = New iDB2Command()
                cmd.Connection = con
                cmd.CommandText = "SELECT D2B2CD, D2POLSYM, D2ISTX, D2POLNO, D2POLMOD, D2CJVA, D2BHNB, substring(D2AXDT,4,2) || '/' || substring(D2AXDT,6,2) || '/' || substring(D2AXDT,2,2) As D2AXDT, D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) ORDER BY D2POLMOD DESC"
                cmd.Parameters.AddWithValue("@custnum", UserNameIs)
                cmd.CommandType = CommandType.Text

                'Pull the field D2B8ST from RCD2CPP table that represents either 'P' for paid or 'IN' for invoice or 'RN' for renewal.
                Dim cmd2 As iDB2Command = New iDB2Command()
                cmd2.Connection = con
                cmd2.CommandText = "SELECT D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) ORDER BY D2POLMOD DESC"
                cmd2.Parameters.AddWithValue("@custnum", UserNameIs)
                cmd2.CommandType = CommandType.Text

                Using con
                    con.Open()
                    Dim reader As iDB2DataReader = cmd.ExecuteReader
                    While reader.Read()
                        Dim GetPolicyRecord As New RCD2CPPTABLE()
                        GetPolicyRecord.Custnum = CType(reader("D2B2CD"), String)
                        GetPolicyRecord.Policynum = CType(reader("D2POLNO"), String)
                        GetPolicyRecord.D2istx = CType(reader("D2ISTX"), String)
                        GetPolicyRecord.Policytype = CType(reader("D2POLSYM"), String)
                        GetPolicyRecord.M0dule = CType(reader("D2POLMOD"), String)
                        GetPolicyRecord.Nextpayment = CType(reader("D2CJVA"), Decimal)
                        GetPolicyRecord.D2bhnb = CType(reader("D2BHNB"), String)
                        GetPolicyRecord.Datedue = CType(reader("D2AXDT"), Date)
                        GetPolicyRecord.D2b8st = CType(reader("D2B8ST"), String)

                        Dim MyPolicyNum As String = GetPolicyRecord.Policynum.ToString
                        Dim x As Date = GetPolicyRecord.Datedue.ToString
                        Dim y As Date = Today.Date
                        Dim NextPay As Decimal = GetPolicyRecord.Nextpayment.ToString
                        Dim _status As String = GetPolicyRecord.D2b8st.ToString

                        Dim DaysElasped As New TimeSpan
                        DaysElasped = y.Subtract(x)

                        'If the value in DaysElasped is negative, that means the record is within the due date time frame, if positive the policy is past due.
                        'Check to see if DaysElasped are negative by being less than zero the due date and between the 15 day grace period.
                        'Note: You must not change the number 0 to 31 when checking DaysElasped because if a policy is 32 days past due it will not show up in the 
                        'policyholder payment summary. Do not change the number 0 to 90 when checking DaysElasped because it will only display the past due amount only
                        'and not the next payment or let customers know how many days left until payment.

                        If DaysElasped.Days <= 0 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "IN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            GetScalerValue(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is due in " & DaysElasped.Days.ToString * -1 & " days.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 10 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "IN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            GetScalerValue(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 25 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "IN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            GetScalerValue(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 90 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "IN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            GetScalerValue(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 0 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "RN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            PaidPolicyies(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                            GetPolicyRecord.Message = ("You have " & DaysElasped.Days.ToString * -1 & " days until payment is due.")
                            ReadPolicy.Add(GetPolicyRecord)
                        ElseIf DaysElasped.Days <= 10 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "RN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            PaidPolicyies(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 25 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "RN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            PaidPolicyies(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 90 And DaysElasped.Days >= -15 And NextPay <> "0" And _status = "RN" Then
                            Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                            Dim _mode As String = GetPolicyRecord.M0dule.ToString
                            Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                            Dim MyStatus As Object = cmd2.ExecuteScalar()
                            PaidPolicyies(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)
                            If MyStatus = "P " Then
                                'Return Nothing
                            Else
                                GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                                ReadPolicy.Add(GetPolicyRecord)
                            End If
                        ElseIf DaysElasped.Days <= 0 And DaysElasped.Days >= -90 And NextPay <> "0" And _status = "IN" Then
                            ReadPolicy.Add(GetPolicyRecord)
                        End If
                    End While
                End Using
            End If
            Return ReadPolicy

        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function PaidPolicyies(ByRef UserNameIs As String, ByRef _policynum As String, ByRef _mode As String, ByRef _recordnum As String, ByRef _status As String, ByRef MyStatus As Object) As List(Of RCD2CPP_FOR_PAYMENT)

            Dim ReadPolicy As New List(Of RCD2CPP_FOR_PAYMENT)()
            'This code 
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con

            cmd.CommandText = "SELECT D2B2CD, D2POLSYM, D2ISTX, D2POLNO, D2POLMOD, D2CJVA, D2BHNB, substring(D2AXDT,4,2) || '/' || substring(D2AXDT,6,2) || '/' || substring(D2AXDT,2,2) As D2AXDT, D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) AND D2B8ST = 'P' AND (D2POLNO = ?) AND (D2POLMOD = ?) AND (D2BHNB = ?) ORDER BY D2POLMOD DESC"
            'cmd.CommandText = "SELECT D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) AND D2B8ST = 'P' AND (D2POLNO = ?) AND (D2POLMOD = ?) AND (D2BHNB = ?) ORDER BY D2POLMOD DESC"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.Parameters.AddWithValue("@policynum", _policynum)
            cmd.Parameters.AddWithValue("@module", _mode)
            cmd.Parameters.AddWithValue("@recordnum", _recordnum)
            cmd.Parameters.AddWithValue("@status", _status)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                'Dim a As Integer = 0
                While reader.Read()
                    Dim GetPolicyRecord As New RCD2CPP_FOR_PAYMENT()
                    GetPolicyRecord.Custnum = CType(reader("D2B2CD"), String)
                    GetPolicyRecord.Policynum = CType(reader("D2POLNO"), String)
                    GetPolicyRecord.D2istx = CType(reader("D2ISTX"), String)
                    GetPolicyRecord.Policytype = CType(reader("D2POLSYM"), String)
                    GetPolicyRecord.M0dule = CType(reader("D2POLMOD"), String)
                    GetPolicyRecord.Nextpayment = CType(reader("D2CJVA"), Decimal)
                    GetPolicyRecord.D2bhnb = CType(reader("D2BHNB"), String)
                    GetPolicyRecord.Datedue = CType(reader("D2AXDT"), Date)
                    GetPolicyRecord.D2b8st = CType(reader("D2B8ST"), String)
                    Dim x As Date = GetPolicyRecord.Datedue.ToString
                    Dim y As Date = Today.Date
                    Dim NextPay As Decimal = GetPolicyRecord.Nextpayment.ToString
                    Dim Status As String = GetPolicyRecord.D2b8st.ToString
                    Status = GetPolicyRecord.D2b8st.ToString
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = y.Subtract(x)

                    'Dim _policynum As String = GetPolicyRecord.Policynum.ToString
                    'Dim _mode As String = GetPolicyRecord.M0dule.ToString
                    'Dim _recordnum As String = GetPolicyRecord.D2bhnb.ToString
                    'Dim MyStatus As Object = cmd.ExecuteScalar()

                    GetScalerValue(UserNameIs, _policynum, _mode, _recordnum, _status, MyStatus)

                    If DaysElasped.Days < 90 And NextPay = "0" Then

                    End If
                    'a = a + 1
                End While
            End Using

            Return Nothing
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetScalerValue(ByRef UserNameIs As String, ByRef _policynum As String, ByRef _mode As String, ByRef _recordnum As String, ByRef _status As String, ByRef MyStatus As Object) As List(Of RCD2CPP_FOR_PAYMENT)
            Dim ReadPolicy As New List(Of RCD2CPP_FOR_PAYMENT)()

            'This code 
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            Dim cmd2 As iDB2Command = New iDB2Command()
            cmd.Connection = con

            cmd.CommandText = "SELECT D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) AND D2B8ST = 'P' AND (D2POLNO = ?) AND (D2POLMOD = ?) AND (D2BHNB = ?) ORDER BY D2POLMOD DESC"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.Parameters.AddWithValue("@policynum", _policynum)
            cmd.Parameters.AddWithValue("@module", _mode)
            cmd.Parameters.AddWithValue("@recordnum", _recordnum)
            cmd.Parameters.AddWithValue("@status", _status)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                MyStatus = cmd.ExecuteScalar()
                If Not IsNothing(MyStatus) Then
                    Return Nothing
                Else
                    Return MyStatus
                End If
            End Using
            Return Nothing
        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetBillingInfo(ByVal UserNameIs As String) As List(Of RCD0CPL1VIEW)
            Dim BillingRecord As New List(Of RCD0CPL1VIEW)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT D0CUSTCD, D0POLSYM, D0POLNO, D0POLSYM || ' - ' || D0POLNO As D0POLSYMNO, D0POLMOD, D0NAMEINS, D0MODEDESC, D0PAYDESC, D0CLPREM, D0GSVA, D0GUVA, D0GVVA, D0GUVA - D0GSVA As AMOUNT0DUE, substr(D0EFFDTE,4,2) || '/' || substr(D0EFFDTE,6,2) || '/' || substr(D0EFFDTE,2,2) As D0EFFDTE, substr(D0EXPDTE,4,2) || '/' || substr(D0EXPDTE,6,2) || '/' || substr(D0EXPDTE,2,2) As D0EXPDTE,  substr(D0DDDT,4,2) || '/' || substr(D0DDDT,6,2) || '/' || substr(D0DDDT,2,2) As D0DDDT, substr(D0CARRY,4,2) || '/' || substr(D0CARRY,6,2) || '/' || substr(D0CARRY,2,2) As D0CARRY, substr(D0CHGDTE,4,2) || '/' || substr(D0CHGDTE,6,2) || '/' || substr(D0CHGDTE,2,2) As D0CHGDTE, substr(D0AKDT,4,2) || '/' || substr(D0AKDT,6,2) || '/' || substr(D0AKDT,2,2) As D0AKDT, substr(D0EXPDTE,4,2) || '/' || substr(D0EXPDTE,6,2) || '/' || case substr(D0EXPDTE,1,1) when '0' then '19' when  '1' then '20' end || substr(D0EXPDTE,2,2) As MYEXPDATE, current_date As TODAYDATE FROM RCD0CPL1 WHERE D0CUSTCD = ? AND (substr(D0EXPDTE,4,2) || '/' || substr(D0EXPDTE,6,2) || '/' || case substr(D0EXPDTE,1,1) when '0' then '19' when '1' then '20' end || substr(D0EXPDTE,2,2)) >= current_date"
            'cmd.Parameters.Add("CN", OdbcType.NVarChar).Value = CN
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeeBill As New RCD0CPL1VIEW()
                    SeeBill.D0CUSTCD = CType(reader("D0CUSTCD"), String)
                    SeeBill.D0POLSYM = CType(reader("D0POLSYM"), String)
                    SeeBill.D0POLNO = CType(reader("D0POLNO"), String)
                    SeeBill.D0POLSYMNO = CType(reader("D0POLSYMNO"), String)
                    SeeBill.D0POLMOD = CType(reader("D0POLMOD"), String)
                    SeeBill.D0NAMEINS = CType(reader("D0NAMEINS"), String)
                    SeeBill.D0MODEDESC = CType(reader("D0MODEDESC"), String)
                    SeeBill.D0PAYDESC = CType(reader("D0PAYDESC"), String)
                    SeeBill.D0EFFDTE = CType(reader("D0EFFDTE"), Date)
                    SeeBill.D0EXPDTE = CType(reader("D0EXPDTE"), Date)
                    SeeBill.D0DDDT = CType(reader("D0DDDT"), Date)
                    SeeBill.D0CARRY = CType(reader("D0CARRY"), Date)
                    'SeeBill.D0NEXTDT = CType(reader("D0NEXTDT"), Date)
                    SeeBill.D0CHGDTE = CType(reader("D0CHGDTE"), Date)
                    SeeBill.D0AKDT = CType(reader("D0AKDT"), Date)
                    SeeBill.MYEXPDATE = CType(reader("MYEXPDATE"), Date)
                    SeeBill.TODAYDATE = CType(reader("TODAYDATE"), Date)
                    SeeBill.D0CLPREM = CType(reader("D0CLPREM"), String)
                    SeeBill.D0GSVA = CType(reader("D0GSVA"), Decimal)
                    SeeBill.D0GUVA = CType(reader("D0GUVA"), Decimal)
                    SeeBill.D0GVVA = CType(reader("D0GVVA"), Decimal)
                    SeeBill.AMOUNT0DUE = CType(reader("AMOUNT0DUE"), Decimal)
                    BillingRecord.Add(SeeBill)
                End While
            End Using
            Return BillingRecord
        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetBillingDetails(ByVal UserNameIs As String) As List(Of RCD3CPL1VIEW)
            Dim PaymentRecord As New List(Of RCD3CPL1VIEW)()
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            Dim PolicyNo, DatePaid As String

            cmd.Connection = con
            cmd.CommandText = "SELECT SOMRC0DAT.RCD2CPL1.D2POLSYM, SOMRC0DAT.RCD2CPL1.D2POLNO, SOMRC0DAT.RCD2CPL1.D2POLMOD, SOMRC0DAT.RCD2CPL1.D2CCVA * -1 As AMOUNT, SOMRC0DAT.RCD2CPL1.D2WRITDATE, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD2CPL1.D2B2CD FROM SOMRC0DAT.RCD2CPL1 INNER JOIN SOMRC0DAT.RCD3CPL1 ON SOMRC0DAT.RCD3CPL1.D3WRITDATE = SOMRC0DAT.RCD2CPL1.D2WRITDATE AND SOMRC0DAT.RCD3CPL1.D3D4RECSEQ = SOMRC0DAT.RCD2CPL1.D2D4RECSEQ WHERE SOMRC0DAT.RCD2CPL1.D2B7ST = 'CASH' AND D2B8ST = 'P' AND SOMRC0DAT.RCD2CPL1.D2B2CD = ? AND D2WRITDATE > '1141231' ORDER BY D2WRITDATE DESC"
            'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD3CPL1.D3POLSYM || ' ' || SOMRC0DAT.RCD3CPL1.D3POLNO || '-' || SOMRC0DAT.RCD3CPL1.D3POLMOD As D3POLTYPE, SOMRC0DAT.RCD3CPL1.D3D4AMTPAY * -1 As AMOUNT, substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,4,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,6,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2) As D3WRITDATE, SOMRC0DAT.RCD3CPL1.D3C2DT, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD3CPL1.D3D4ACT, SOMRC0DAT.RCD3CPL1.D3D4RECSEQ, SOMRC0DAT.RCD3CPL1.D3POLCLT, SOMRC0DAT.RCD3CPL1.D3BINB FROM SOMRC0DAT.RCD3CPL1  INNER JOIN SOMRC0DAT.RCD2CPP ON SOMRC0DAT.RCD3CPL1.D3POLNO = SOMRC0DAT.RCD2CPP.D2POLNO WHERE SOMRC0DAT.RCD3CPL1.D3D4ACT = 'P' AND SOMRC0DAT.RCD2CPP.D2B2CD = ? AND (case substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,1,1) when '0' then '19' when '1' then '20' end || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2)) >= Year(current_date) - 1 ORDER BY SOMRC0DAT.RCD3CPL1.D3C2DT DESC"
            '1/02/2015 cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD3CPL1.D3POLSYM || ' ' || SOMRC0DAT.RCD3CPL1.D3POLNO || '-' || SOMRC0DAT.RCD3CPL1.D3POLMOD As D3POLTYPE, SOMRC0DAT.RCD3CPL1.D3TOTAPP * -1 As AMOUNT, substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,4,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,6,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2) As D3WRITDATE, SOMRC0DAT.RCD3CPL1.D3C2DT, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD3CPL1.D3D4ACT, SOMRC0DAT.RCD3CPL1.D3D4RECSEQ, SOMRC0DAT.RCD3CPL1.D3POLCLT, SOMRC0DAT.RCD3CPL1.D3BINB FROM SOMRC0DAT.RCD3CPL1  INNER JOIN SOMRC0DAT.RCD2CPP ON SOMRC0DAT.RCD3CPL1.D3POLNO = SOMRC0DAT.RCD2CPP.D2POLNO WHERE SOMRC0DAT.RCD3CPL1.D3D4ACT = 'A' AND SOMRC0DAT.RCD2CPP.D2B2CD = ? AND (case substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,1,1) when '0' then '19' when '1' then '20' end || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2)) >= Year(current_date) - 1  AND SOMRC0DAT.RCD3CPL1.D3TOTAPP LIKE '-%' ORDER BY SOMRC0DAT.RCD3CPL1.D3C2DT DESC"
            'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD3CPL1.D3POLSYM || ' ' || SOMRC0DAT.RCD3CPL1.D3POLNO || '-' || SOMRC0DAT.RCD3CPL1.D3POLMOD As D3POLTYPE, SOMRC0DAT.RCD3CPL1.D3TOTAPP * -1 As AMOUNT, substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,4,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,6,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2) As D3WRITDATE, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD3CPL1.D3D4ACT, SOMRC0DAT.RCD3CPL1.D3D4RECSEQ, SOMRC0DAT.RCD3CPL1.D3POLCLT, SOMRC0DAT.RCD3CPL1.D3BINB FROM SOMRC0DAT.RCD3CPL1  INNER JOIN SOMRC0DAT.RCD2CPP ON SOMRC0DAT.RCD3CPL1.D3POLNO = SOMRC0DAT.RCD2CPP.D2POLNO WHERE SOMRC0DAT.RCD3CPL1.D3D4ACT = 'A' AND SOMRC0DAT.RCD2CPP.D2B2CD = ? AND (case substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,1,1) when '0' then '19' when '1' then '20' end || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2)) >= Year(current_date) - 1  AND SOMRC0DAT.RCD3CPL1.D3TOTAPP LIKE '-%' ORDER BY D3WRITDATE DESC"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    PolicyNo = RTrim(reader("D2POLSYM")) & " " & reader("D2POLNO") & "-" & reader("D2POLMOD")
                    DatePaid = Mid(reader("D2WRITDATE"), 4, 2) & "/" & Mid(reader("D2WRITDATE"), 6, 2) & "/20" & Mid(reader("D2WRITDATE"), 2, 2)
                    Dim SeePayments As New RCD3CPL1VIEW()
                    'SeePayments.D3POLTYPE = CType(reader("D3POLTYPE"), String)
                    SeePayments.D3POLTYPE = PolicyNo
                    SeePayments.AMOUNT = CType(reader("AMOUNT"), Decimal)
                    SeePayments.D3WRITDATE = CType(DatePaid, Date)
                    SeePayments.D3D4RCPTID = CType(reader("D3D4RCPTID"), String)
                    'SeePayments.D3D4ACT = CType(reader("D3D4ACT"), String)
                    'SeePayments.D3POLCLT = CType(reader("D3POLCLT"), String)
                    PaymentRecord.Add(SeePayments)
                End While
            End Using
            Return PaymentRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetBillingDetails2(ByVal UserNameIs As String) As List(Of RCD3CPL1VIEW)
            Dim PaymentRecord As New List(Of RCD3CPL1VIEW)()

            If UserNameIs Is Nothing Then

            Else
                Dim con As iDB2Connection = New iDB2Connection(_connString)
                Dim cmd As iDB2Command = New iDB2Command()
                Dim PolicyNo, DatePaid As String

                cmd.Connection = con
                cmd.CommandText = "SELECT SOMRC0DAT.RCD2CPL1.D2POLSYM, SOMRC0DAT.RCD2CPL1.D2POLNO, SOMRC0DAT.RCD2CPL1.D2POLMOD, SOMRC0DAT.RCD2CPL1.D2POLSYM || '' || SOMRC0DAT.RCD2CPL1.D2POLNO || '' ||  SOMRC0DAT.RCD2CPL1.D2POLMOD As VIEWINVOICE, SOMRC0DAT.RCD2CPL1.D2POLSYM || '' || SOMRC0DAT.RCD2CPL1.D2POLNO || '' ||  SOMRC0DAT.RCD2CPL1.D2POLMOD As VIEWPOLICY, SOMRC0DAT.RCD2CPL1.D2CCVA * -1 As AMOUNT, SOMRC0DAT.RCD2CPL1.D2WRITDATE, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD2CPL1.D2B2CD FROM SOMRC0DAT.RCD2CPL1 INNER JOIN SOMRC0DAT.RCD3CPL1 ON SOMRC0DAT.RCD3CPL1.D3WRITDATE = SOMRC0DAT.RCD2CPL1.D2WRITDATE AND SOMRC0DAT.RCD3CPL1.D3D4RECSEQ = SOMRC0DAT.RCD2CPL1.D2D4RECSEQ WHERE SOMRC0DAT.RCD2CPL1.D2B7ST = 'CASH' AND D2B8ST = 'P' AND SOMRC0DAT.RCD2CPL1.D2B2CD = ? AND D2WRITDATE > '1141231' ORDER BY D2WRITDATE DESC"
                'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD3CPL1.D3POLSYM || ' ' || SOMRC0DAT.RCD3CPL1.D3POLNO || '-' || SOMRC0DAT.RCD3CPL1.D3POLMOD As D3POLTYPE, SOMRC0DAT.RCD3CPL1.D3D4AMTPAY * -1 As AMOUNT, substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,4,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,6,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2) As D3WRITDATE, SOMRC0DAT.RCD3CPL1.D3C2DT, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD3CPL1.D3D4ACT, SOMRC0DAT.RCD3CPL1.D3D4RECSEQ, SOMRC0DAT.RCD3CPL1.D3POLCLT, SOMRC0DAT.RCD3CPL1.D3BINB FROM SOMRC0DAT.RCD3CPL1  INNER JOIN SOMRC0DAT.RCD2CPP ON SOMRC0DAT.RCD3CPL1.D3POLNO = SOMRC0DAT.RCD2CPP.D2POLNO WHERE SOMRC0DAT.RCD3CPL1.D3D4ACT = 'P' AND SOMRC0DAT.RCD2CPP.D2B2CD = ? AND (case substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,1,1) when '0' then '19' when '1' then '20' end || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2)) >= Year(current_date) - 1 ORDER BY SOMRC0DAT.RCD3CPL1.D3C2DT DESC"
                '1/02/2015 cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD3CPL1.D3POLSYM || ' ' || SOMRC0DAT.RCD3CPL1.D3POLNO || '-' || SOMRC0DAT.RCD3CPL1.D3POLMOD As D3POLTYPE, SOMRC0DAT.RCD3CPL1.D3TOTAPP * -1 As AMOUNT, substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,4,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,6,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2) As D3WRITDATE, SOMRC0DAT.RCD3CPL1.D3C2DT, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD3CPL1.D3D4ACT, SOMRC0DAT.RCD3CPL1.D3D4RECSEQ, SOMRC0DAT.RCD3CPL1.D3POLCLT, SOMRC0DAT.RCD3CPL1.D3BINB FROM SOMRC0DAT.RCD3CPL1  INNER JOIN SOMRC0DAT.RCD2CPP ON SOMRC0DAT.RCD3CPL1.D3POLNO = SOMRC0DAT.RCD2CPP.D2POLNO WHERE SOMRC0DAT.RCD3CPL1.D3D4ACT = 'A' AND SOMRC0DAT.RCD2CPP.D2B2CD = ? AND (case substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,1,1) when '0' then '19' when '1' then '20' end || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2)) >= Year(current_date) - 1  AND SOMRC0DAT.RCD3CPL1.D3TOTAPP LIKE '-%' ORDER BY SOMRC0DAT.RCD3CPL1.D3C2DT DESC"
                'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.RCD3CPL1.D3POLSYM || ' ' || SOMRC0DAT.RCD3CPL1.D3POLNO || '-' || SOMRC0DAT.RCD3CPL1.D3POLMOD As D3POLTYPE, SOMRC0DAT.RCD3CPL1.D3TOTAPP * -1 As AMOUNT, substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,4,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,6,2) || '/' || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2) As D3WRITDATE, SOMRC0DAT.RCD3CPL1.D3D4RCPTID, SOMRC0DAT.RCD3CPL1.D3D4ACT, SOMRC0DAT.RCD3CPL1.D3D4RECSEQ, SOMRC0DAT.RCD3CPL1.D3POLCLT, SOMRC0DAT.RCD3CPL1.D3BINB FROM SOMRC0DAT.RCD3CPL1  INNER JOIN SOMRC0DAT.RCD2CPP ON SOMRC0DAT.RCD3CPL1.D3POLNO = SOMRC0DAT.RCD2CPP.D2POLNO WHERE SOMRC0DAT.RCD3CPL1.D3D4ACT = 'A' AND SOMRC0DAT.RCD2CPP.D2B2CD = ? AND (case substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,1,1) when '0' then '19' when '1' then '20' end || substr(SOMRC0DAT.RCD3CPL1.D3WRITDATE,2,2)) >= Year(current_date) - 1  AND SOMRC0DAT.RCD3CPL1.D3TOTAPP LIKE '-%' ORDER BY D3WRITDATE DESC"
                cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
                cmd.CommandType = CommandType.Text

                Using con
                    con.Open()
                    Dim reader As iDB2DataReader = cmd.ExecuteReader
                    While reader.Read()
                        PolicyNo = RTrim(reader("D2POLSYM")) & " " & reader("D2POLNO") & "-" & reader("D2POLMOD")
                        DatePaid = Mid(reader("D2WRITDATE"), 4, 2) & "/" & Mid(reader("D2WRITDATE"), 6, 2) & "/20" & Mid(reader("D2WRITDATE"), 2, 2)
                        Dim SeePayments As New RCD3CPL1VIEW()
                        'SeePayments.D3POLTYPE = CType(reader("D3POLTYPE"), String)
                        SeePayments.D3POLTYPE = PolicyNo
                        SeePayments.AMOUNT = CType(reader("AMOUNT"), Decimal)
                        SeePayments.D3WRITDATE = CType(DatePaid, Date)
                        SeePayments.D3D4RCPTID = CType(reader("D3D4RCPTID"), String)
                        SeePayments.D2POLNO = CType(reader("D2POLNO"), String)
                        SeePayments.VIEWINVOICE2 = CType(reader("VIEWINVOICE"), String)
                        SeePayments.VIEWPOLICY2 = CType(reader("VIEWPOLICY"), String)
                        'SeePayments.D3D4ACT = CType(reader("D3D4ACT"), String)
                        'SeePayments.D3POLCLT = CType(reader("D3POLCLT"), String)
                        PaymentRecord.Add(SeePayments)
                    End While
                End Using
            End If
            Return PaymentRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetClaimPayments(ByVal UserNameIs As String) As List(Of DRFTFILEVIEW)
            Dim ClaimRecord As New List(Of DRFTFILEVIEW)()
            If UserNameIs Is Nothing Then

            Else
                Dim con As iDB2Connection = New iDB2Connection(_connString)
                Dim cmd As iDB2Command = New iDB2Command()
                cmd.Connection = con
                'cmd.CommandText = "SELECT SOMRC0DAT.DRFTFILE.CLAIM, substr(SOMRC0DAT.DRFTFILE.DRFTPRTDTE,4,2) || '/' || substr(SOMRC0DAT.DRFTFILE.DRFTPRTDTE,6,2) || '/' || substr(SOMRC0DAT.DRFTFILE.DRFTPRTDTE,2,2) As DRFTPRTDTE, SOMRC0DAT.DRFTFILE.DRFTAMT, SOMRC0DAT.DRFTFILE.DRFTNUMBER FROM SOMRC0DAT.DRFTFILE, SOMRC0DAT.PMSP0200 WHERE SOMRC0DAT.PMSP0200.CUST0NO = ? AND SOMRC0DAT.DRFTFILE.SYMBOL = SOMRC0DAT.PMSP0200.SYMBOL AND SOMRC0DAT.DRFTFILE.POLICYNO = SOMRC0DAT.PMSP0200.POLICY0NUM AND SOMRC0DAT.DRFTFILE.MODULE = SOMRC0DAT.PMSP0200.MODULE AND SOMRC0DAT.DRFTFILE.PAYSTATUS = 'I' AND SOMRC0DAT.DRFTFILE.TRANSCODE in ('PP','FP','FF','SP') ORDER BY SOMRC0DAT.DRFTFILE.DRFTPRTDTE DESC"
                cmd.CommandText = "SELECT SOMRC0DAT.DRFTFILE.CLAIM, substr(SOMRC0DAT.DRFTFILE.DRFTPRTDTE,4,2) || '/' || substr(SOMRC0DAT.DRFTFILE.DRFTPRTDTE,6,2) || '/' || substr(SOMRC0DAT.DRFTFILE.DRFTPRTDTE,2,2) As DRFTPRTDTE, SOMRC0DAT.DRFTFILE.DRFTAMT, SOMRC0DAT.DRFTFILE.DRFTNUMBER FROM SOMRC0DAT.DRFTFILE, SOMRC0DAT.PMSP0200 WHERE SOMRC0DAT.PMSP0200.CUST0NO = ? AND SOMRC0DAT.DRFTFILE.SYMBOL = SOMRC0DAT.PMSP0200.SYMBOL AND SOMRC0DAT.DRFTFILE.POLICYNO = SOMRC0DAT.PMSP0200.POLICY0NUM AND SOMRC0DAT.DRFTFILE.MODULE = SOMRC0DAT.PMSP0200.MODULE AND SOMRC0DAT.DRFTFILE.PAYSTATUS in ('I','P') AND SOMRC0DAT.DRFTFILE.TRANSCODE in ('PP','FP','FF','SP') AND SOMRC0DAT.DRFTFILE.RESVNO not in ('2','4') AND SOMRC0DAT.DRFTFILE.DRFTPRTDTE <> 0 ORDER BY SOMRC0DAT.DRFTFILE.DRFTPRTDTE DESC"
                cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
                cmd.CommandType = CommandType.Text

                Using con
                    con.Open()
                    Dim reader As iDB2DataReader = cmd.ExecuteReader
                    While reader.Read()
                        Dim SeeClaims As New DRFTFILEVIEW()
                        SeeClaims.CLAIM = CType(reader("CLAIM"), String)
                        SeeClaims.DRFTPRTDTE = CType(reader("DRFTPRTDTE"), Date)
                        SeeClaims.DRFTAMT = CType(reader("DRFTAMT"), Decimal)
                        SeeClaims.DRFTNUMBER = CType(reader("DRFTNUMBER"), String)

                        ClaimRecord.Add(SeeClaims)
                    End While
                End Using
            End If
            Return ClaimRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function AgencyCustomerList(ByVal UserNameIs As String) As List(Of PMSL0217)
            Dim CustomerRecord As New List(Of PMSL0217)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, PMSL0217.MODULE AS M0DULE, PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, PMSL0217.TYPE0ACT, PMSL0217.TRANS0STAT, BASP0200E.USRIND3 FROM SOMRC0DAT.PMSL0217 LEFT OUTER JOIN SOMRC0DAT.BASP0200E ON BASP0200E.POLICY0NUM = PMSL0217.POLICY0NUM WHERE (SOMRC0DAT.PMSL0217.AGENCY = ?) ORDER BY SOMRC0DAT.PMSL0217.SYMBOL"
            cmd.CommandText = "SELECT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, SOMRC0DAT.PMSL0217.MODULE AS M0DULE, SOMRC0DAT.PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, SOMRC0DAT.PMSL0217.TYPE0ACT, SOMRC0DAT.PMSL0217.TRANS0STAT, SOMRC0DAT.BASP0200E.USRIND3 FROM SOMRC0DAT.PMSL0217 LEFT OUTER JOIN SOMRC0DAT.BASP0200E ON SOMRC0DAT.BASP0200E.POLICY0NUM = SOMRC0DAT.PMSL0217.POLICY0NUM AND SOMRC0DAT.BASP0200E.MODULE = SOMRC0DAT.PMSL0217.MODULE AND SOMRC0DAT.BASP0200E.SYMBOL = SOMRC0DAT.PMSL0217.SYMBOL WHERE (SOMRC0DAT.PMSL0217.AGENCY = ?) ORDER BY SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.POLICY0NUM"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeePolicyList As New PMSL0217()
                    SeePolicyList.Agency = CType(reader("AGENCY"), String)
                    SeePolicyList.Custnumber = CType(reader("CUST0NO"), String)
                    SeePolicyList.Symbol = CType(reader("SYMBOL"), String)
                    SeePolicyList.Policynum = CType(reader("POLICY0NUM"), String)
                    SeePolicyList.M0dule = CType(reader("M0DULE"), String)
                    SeePolicyList.Add0line01 = CType(reader("ADD0LINE01"), String)
                    SeePolicyList.Effdate = CType(reader("EFF0DT"), Date)
                    SeePolicyList.Expdate = CType(reader("EXP0DT"), Date)
                    SeePolicyList.Type0act = CType(reader("TYPE0ACT"), String)
                    SeePolicyList.Trans0stat = CType(reader("TRANS0STAT"), String)
                    SeePolicyList.Viewinvoice = CType(reader("VIEWINVOICE"), String)
                    SeePolicyList.Viewpolicy = CType(reader("VIEWPOLICY"), String)
                    SeePolicyList.Usrind3 = DirectCast(reader("USRIND3").ToString, String)
                    Dim ACT As String = CType(reader("TYPE0ACT"), String)
                    Dim STAT As String = CType(reader("TRANS0STAT"), String)
                    Dim pType As String = CType(reader("SYMBOL"), String)
                    Dim polNum As String = CType(reader("POLICY0NUM"), String)
                    Dim m0de As Integer = CType(reader("M0DULE"), String)
                    Dim SMPYear As String = CType(reader("USRIND3").ToString, String)
                    Dim currentPolicy As String
                    Dim x As Date = SeePolicyList.Effdate.ToString
                    Dim y As Date = Today.Date
                    Dim z As Date = SeePolicyList.Expdate.ToString
                    Dim newExpDate As Date
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = y.Subtract(x)
                    'If DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "BA " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                    'Added the 'CN' to not show canceled policies 7/14/2017
                    'Per request from chris is to remove the 'CN' code from production but leave it in development for further testing 7/14/2017
                    If DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "BA " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "WC " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "UM " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "STD" And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "SMP" And SMPYear = "1" Then
                        Dim SmpDaysElasped As New TimeSpan
                        newExpDate = z.AddDays(730.484)
                        SeePolicyList.Expdate = newExpDate.Date
                        SmpDaysElasped = y.Subtract(newExpDate)
                        CustomerRecord.Add(SeePolicyList)
                        'Added the 'CN' to not show canceled policies 7/14/2017
                        'Per request from chris is to remove the 'CN' code from production but leave it in development for further testing 7/14/2017
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "SMP" And SMPYear = "2" Then
                        Dim SmpDaysElasped As New TimeSpan
                        newExpDate = z.AddDays(365.242)
                        SeePolicyList.Expdate = newExpDate.Date
                        SmpDaysElasped = y.Subtract(newExpDate)
                        currentPolicy = String.Concat(pType, polNum, Format(m0de - 1, "00"))
                        SeePolicyList.Viewpolicy = currentPolicy.ToString
                        CustomerRecord.Add(SeePolicyList)
                        'End If
                        'Added the 'CN' to not show canceled policies 7/14/2017
                        'Per request from chris is to remove the 'CN' code from production but leave it in development for further testing 7/14/2017
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "SMP" And SMPYear = "3" Then
                        currentPolicy = String.Concat(pType, polNum, Format(m0de - 2, "00"))
                        SeePolicyList.Viewpolicy = currentPolicy.ToString
                        CustomerRecord.Add(SeePolicyList)
                    End If
                End While
            End Using
            Return CustomerRecord

        End Function

        Public Function AgencyCustomerList2(ByVal UserNameIs As String) As DataSet
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            'cmd.CommandText = "SELECT AGENCY, CUST0NO, SYMBOL, POLICY0NUM, MODULE As M0DULE, ADD0LINE01, SUBSTRING(EFFDT, 4,2) || '/' || SUBSTRING(EFFDT, 6,2) || '/' || SUBSTRING(EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(EXPDT, 6,2) || '/' || SUBSTRING(EXPDT, 2,2) As EXP0DT, TYPE0ACT, DAYS(DATE(case substr(EXPDT,1,1) when '0' then '19' when '1' then '20' end || substr(EXPDT,2,2) || '-' || SUBSTRING(EXPDT, 4,2) || '-' || SUBSTRING(EXPDT, 6,2))) - DAYS(CURRENT_DATE) As DAYSELAPSED FROM PMSL0217 WHERE (AGENCY = ?) AND (TRANS0STAT = 'V') AND (TYPE0ACT <> 'CN')"
            'cmd.CommandText = "SELECT AGENCY, CUST0NO, SYMBOL, POLICY0NUM, MODULE As M0DULE, ADD0LINE01, SUBSTRING(EFFDT, 4,2) || '/' || SUBSTRING(EFFDT, 6,2) || '/' || SUBSTRING(EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(EXPDT, 6,2) || '/' || SUBSTRING(EXPDT, 2,2) As EXP0DT, TYPE0ACT, DAYS(DATE(case substr(EXPDT,1,1) when '0' then '19' when '1' then '20' end || substr(EXPDT,2,2) || '-' || SUBSTRING(EXPDT, 4,2) || '-' || SUBSTRING(EXPDT, 6,2))) - DAYS(CURRENT_DATE) As DAYSELAPSED FROM PMSL0217 WHERE (AGENCY = ?) AND (TRANS0STAT = 'V') AND (TYPE0ACT <> 'CN') AND EFFDT BETWEEN EFFDT AND EXPDT"
            cmd.CommandText = "SELECT AGENCY, CUST0NO, SYMBOL, POLICY0NUM, MODULE As M0DULE, ADD0LINE01, SUBSTRING(EFFDT, 4,2) || '/' || SUBSTRING(EFFDT, 6,2) || '/' || SUBSTRING(EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(EXPDT, 6,2) || '/' || SUBSTRING(EXPDT, 2,2) As EXP0DT, TYPE0ACT FROM PMSL0217 WHERE (AGENCY = ?) AND (TRANS0STAT = 'V') AND EFFDT BETWEEN EFFDT AND EXPDT ORDER BY ADD0LINE01"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Using da
                da.Fill(ds)
            End Using

            'Dim x As String = ds.Tables(0).Rows(0).Item(9).ToString()

            'If x > 0 Then
            '    Return ds
            'Else
            '    Return Nothing
            'End If

            Return ds
        End Function
        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function AgencyCustomerList3(ByVal policynum As String) As List(Of PMSL0217)
            'This query is used for the archieve policies list 3-01-2013

            Dim CustomerRecord As New List(Of PMSL0217)()
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.SYMBOL || ' ' || SOMRC0DAT.PMSL0217.POLICY0NUM || '-' || SOMRC0DAT.PMSL0217.MODULE As POLICYFULL, SOMRC0DAT.PMSL0217.CUST0NO, SOMRC0DAT.PMSL0217.MODULE AS M0DULE, SOMRC0DAT.PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, SOMRC0DAT.PMSL0217.TYPE0ACT, SOMRC0DAT.PMSL0217.TRANS0STAT FROM SOMRC0DAT.PMSL0217 WHERE (SOMRC0DAT.PMSL0217.POLICY0NUM = ?) ORDER BY SOMRC0DAT.PMSL0217.MODULE DESC"
            'cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            'cmd.Parameters.AddWithValue("@custnum", custnum)
            'cmd.Parameters.AddWithValue("@symb0l", symb0l)
            cmd.Parameters.AddWithValue("@policynum", policynum)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeePolicyList As New PMSL0217()
                    SeePolicyList.Agency = CType(reader("AGENCY"), String)
                    SeePolicyList.Custnumber = CType(reader("CUST0NO"), String)
                    SeePolicyList.Symbol = CType(reader("SYMBOL"), String)
                    SeePolicyList.Policynum = CType(reader("POLICYFULL"), String)
                    SeePolicyList.M0dule = CType(reader("M0DULE"), String)
                    SeePolicyList.Add0line01 = CType(reader("ADD0LINE01"), String)
                    SeePolicyList.Effdate = CType(reader("EFF0DT"), Date)
                    SeePolicyList.Expdate = CType(reader("EXP0DT"), Date)
                    SeePolicyList.Type0act = CType(reader("TYPE0ACT"), String)
                    SeePolicyList.Trans0stat = CType(reader("TRANS0STAT"), String)
                    SeePolicyList.Viewinvoice = CType(reader("VIEWINVOICE"), String)
                    SeePolicyList.Viewpolicy = CType(reader("VIEWPOLICY"), String)
                    SeePolicyList.Usrind3 = " "
                    Dim ACT As String = CType(reader("TYPE0ACT"), String)
                    Dim STAT As String = CType(reader("TRANS0STAT"), String)
                    Dim pType As String = CType(reader("SYMBOL"), String)
                    Dim polNum As String = CType(reader("POLICY0NUM"), String)
                    Dim m0de As Integer = CType(reader("M0DULE"), String)
                    If pType = "SMP" Or pType = "STD" Or pType = "WC " Or pType = "BA " Or pType = "UM " Then
                        CustomerRecord.Add(SeePolicyList)
                    End If
                End While
            End Using
            Return CustomerRecord
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function AgencyCustomerList4(ByVal UserNameIs As String) As List(Of PMSL0217)
            Dim CustomerRecord As New List(Of PMSL0217)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, PMSL0217.MODULE AS M0DULE, PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, PMSL0217.TYPE0ACT, PMSL0217.TRANS0STAT, BASP0200E.USRIND3 FROM SOMRC0DAT.PMSL0217 LEFT OUTER JOIN SOMRC0DAT.BASP0200E ON BASP0200E.POLICY0NUM = PMSL0217.POLICY0NUM WHERE (SOMRC0DAT.PMSL0217.AGENCY = ?) ORDER BY SOMRC0DAT.PMSL0217.ADD0LINE01"
            cmd.CommandText = "SELECT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, SOMRC0DAT.PMSL0217.MODULE AS M0DULE, SOMRC0DAT.PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, SOMRC0DAT.PMSL0217.TYPE0ACT, SOMRC0DAT.PMSL0217.TRANS0STAT, SOMRC0DAT.BASP0200E.USRIND3 FROM SOMRC0DAT.PMSL0217 LEFT OUTER JOIN SOMRC0DAT.BASP0200E ON SOMRC0DAT.BASP0200E.POLICY0NUM = SOMRC0DAT.PMSL0217.POLICY0NUM AND SOMRC0DAT.BASP0200E.MODULE = SOMRC0DAT.PMSL0217.MODULE AND SOMRC0DAT.BASP0200E.SYMBOL = SOMRC0DAT.PMSL0217.SYMBOL WHERE (SOMRC0DAT.PMSL0217.AGENCY = ?) ORDER BY SOMRC0DAT.PMSL0217.ADD0LINE01"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeePolicyList As New PMSL0217()
                    SeePolicyList.Agency = CType(reader("AGENCY"), String)
                    SeePolicyList.Custnumber = CType(reader("CUST0NO"), String)
                    SeePolicyList.Symbol = CType(reader("SYMBOL"), String)
                    SeePolicyList.Policynum = CType(reader("POLICY0NUM"), String)
                    SeePolicyList.M0dule = CType(reader("M0DULE"), String)
                    SeePolicyList.Add0line01 = CType(reader("ADD0LINE01"), String)
                    SeePolicyList.Effdate = CType(reader("EFF0DT"), Date)
                    SeePolicyList.Expdate = CType(reader("EXP0DT"), Date)
                    SeePolicyList.Type0act = CType(reader("TYPE0ACT"), String)
                    SeePolicyList.Trans0stat = CType(reader("TRANS0STAT"), String)
                    SeePolicyList.Viewinvoice = CType(reader("VIEWINVOICE"), String)
                    SeePolicyList.Viewpolicy = CType(reader("VIEWPOLICY"), String)
                    SeePolicyList.Usrind3 = DirectCast(reader("USRIND3").ToString, String)
                    Dim ACT As String = CType(reader("TYPE0ACT"), String)
                    Dim STAT As String = CType(reader("TRANS0STAT"), String)
                    Dim pType As String = CType(reader("SYMBOL"), String)
                    Dim polNum As String = CType(reader("POLICY0NUM"), String)
                    Dim m0de As Integer = CType(reader("M0DULE"), String)
                    Dim SMPYear As String = CType(reader("USRIND3").ToString, String)
                    Dim currentPolicy As String
                    Dim x As Date = SeePolicyList.Effdate.ToString
                    Dim y As Date = Today.Date
                    Dim z As Date = SeePolicyList.Expdate.ToString
                    Dim newExpDate As Date
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = y.Subtract(x)
                    'Added the 'CN' to not show canceled policies 7/14/2017
                    'Per request from chris is to remove the 'CN' code from production but leave it in development for further testing 7/14/2017
                    If DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "BA " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "WC " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "UM " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "STD" And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "SMP" And SMPYear = "1" Then
                        Dim SmpDaysElasped As New TimeSpan
                        newExpDate = z.AddDays(730.484)
                        SeePolicyList.Expdate = newExpDate.Date
                        SmpDaysElasped = y.Subtract(newExpDate)
                        CustomerRecord.Add(SeePolicyList)
                        'Added the 'CN' to not show canceled policies 7/14/2017
                        'Per request from chris is to remove the 'CN' code from production but leave it in development for further testing 7/14/2017
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "SMP" And SMPYear = "2" Then
                        Dim SmpDaysElasped As New TimeSpan
                        newExpDate = z.AddDays(365.242)
                        SeePolicyList.Expdate = newExpDate.Date
                        SmpDaysElasped = y.Subtract(newExpDate)
                        currentPolicy = String.Concat(pType, polNum, Format(m0de - 1, "00"))
                        SeePolicyList.Viewpolicy = currentPolicy.ToString
                        CustomerRecord.Add(SeePolicyList)
                        'Added the 'CN' to not show canceled policies 7/14/2017
                        'Per request from chris is to remove the 'CN' code from production but leave it in development for further testing 7/14/2017
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And STAT = "V" And pType = "SMP" And SMPYear = "3" Then
                        currentPolicy = String.Concat(pType, polNum, Format(m0de - 2, "00"))
                        SeePolicyList.Viewpolicy = currentPolicy.ToString
                        CustomerRecord.Add(SeePolicyList)
                    End If
                End While
            End Using
            Return CustomerRecord

        End Function

        Public Function AgencyCustomerList5(ByVal policynum As String, ByVal symbol As String) As DataSet
            'This query is used for the change request form 3-01-2013

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT AGENCY, CUST0NO, SYMBOL, POLICY0NUM, MODULE As M0DULE, ADD0LINE01, ADD0LINE03, ADD0LINE04, SUBSTRING(EFFDT, 4,2) || '/' || SUBSTRING(EFFDT, 6,2) || '/' || SUBSTRING(EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(EXPDT, 6,2) || '/' || SUBSTRING(EXPDT, 2,2) As EXP0DT, TYPE0ACT FROM PMSL0217 WHERE (POLICY0NUM = ?) AND (SYMBOL = ?) AND (TRANS0STAT = 'V') AND EFFDT BETWEEN EFFDT AND EXPDT ORDER BY M0DULE DESC FETCH FIRST ROW ONLY"
            cmd.Parameters.AddWithValue("@policynum", policynum)
            cmd.Parameters.AddWithValue("@symbol", symbol)
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Using da
                da.Fill(ds)
            End Using

            Return ds
        End Function

        Public Function CandleSafetyStep1(ByVal custnum As String, ByVal postalcode As String) As DataSet

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command("SELECT CUST0NO, ADD0LINE01, ADD0LINE03, ADD0LINE04, ZIP0POST, TYPE0ACT FROM PMSP0200 WHERE CUST0NO = ? AND ZIP0POST = ? AND SYMBOL = 'SMP' ORDER BY MODULE DESC FETCH FIRST ROW ONLY", con)
            cmd.Parameters.AddWithValue("@custnum", custnum)
            cmd.Parameters.AddWithValue("@postalcode", postalcode)
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Try
                Using da
                    da.Fill(ds)
                    Dim x As String = ds.Tables(0).Rows(0).Item(5).ToString()
                    Select Case x
                        Case "CN"
                            Return Nothing
                        Case Else
                            Return ds
                    End Select
                End Using
            Catch ex As Exception
                HttpContext.Current.Response.Redirect("~/login/login_p.aspx")
            End Try

            Return Nothing
        End Function

        Public Function ReadPolicyStep1(ByVal custnum As String, ByVal symb0l As String, ByVal policynum As String) As DataSet

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command("SELECT CUST0NO, ADD0LINE01, ADD0LINE03, ADD0LINE04, ZIP0POST, TYPE0ACT FROM PMSP0200 WHERE CUST0NO = ? AND SYMBOL = ? AND POLICY0NUM = ? ORDER BY MODULE DESC FETCH FIRST ROW ONLY", con)
            cmd.Parameters.AddWithValue("@custnum", custnum)
            cmd.Parameters.AddWithValue("@symb0l", symb0l)
            cmd.Parameters.AddWithValue("@policynum", policynum)
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Try
                Using da
                    da.Fill(ds)
                    Dim x As String = ds.Tables(0).Rows(0).Item(5).ToString()
                    Select Case x
                        Case "CN"
                            Return Nothing
                        Case Else
                            Return ds
                    End Select
                End Using
            Catch ex As Exception
                HttpContext.Current.Response.Redirect("~/login/NoMatchFound.aspx")
            End Try

            Return Nothing
        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function ReadStep1(ByVal custnum As String, ByVal symb0l As String, ByVal policynum As String) As List(Of PMSP0200TABLE)
            Dim ReadPolicy As New List(Of PMSP0200TABLE)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con

            cmd.CommandText = "SELECT CUST0NO, SYMBOL, POLICY0NUM, MODULE, TYPE0ACT FROM PMSP0200 WHERE CUST0NO = ? AND SYMBOL = ? AND POLICY0NUM = ? AND TYPE0ACT <> 'CN' ORDER BY MODULE DESC"
            cmd.Parameters.AddWithValue("@custnum", custnum)
            cmd.Parameters.AddWithValue("@symb0l", symb0l)
            cmd.Parameters.AddWithValue("@policynum", policynum)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim GetPolicyRecord As New PMSP0200TABLE()
                    GetPolicyRecord.CUST0NO = CType(reader("CUST0NO"), String)
                    GetPolicyRecord.SYMBOL = CType(reader("SYMBOL"), String)
                    GetPolicyRecord.POLICY0NUM = CType(reader("POLICY0NUM"), String)
                    GetPolicyRecord.M0DULE = CType(reader("MODULE"), String)
                    GetPolicyRecord.TYPE0ACT = CType(reader("TYPE0ACT"), String)
                    ReadPolicy.Add(GetPolicyRecord)
                    'reader.NextResult()
                End While
            End Using

            Return ReadPolicy
        End Function

        Public Function ReadTestPolicy(ByVal UserNameIs As String) As DataSet

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command("SELECT SYMBOL, CUST0NO, POLICY0NUM, ADD0LINE01, substr(EFFDT,4,2) || '/' || substr(EFFDT,6,2) || '/' || substr(EFFDT,2,2) As EFF0DT, substr(EXPDT,4,2) || '/' || substr(EXPDT,6,2) || '/' || substr(EXPDT,2,2) As EXP0DT FROM PMSL0217 WHERE (CUST0NO = ?) and (TRANS0STAT = 'V') ORDER BY SYMBOL, POLICY0NUM", con)
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            'Using da
            '    da.Fill(ds)
            'End Using

            'Return ds

            Try
                Using da
                    da.Fill(ds)
                    Dim x As String = ds.Tables(0).Rows(0).Item(5).ToString()
                    If x < Today.Date Then
                        Return ds
                    End If
                End Using
            Catch ex As Exception
                HttpContext.Current.Response.Redirect("~/login/NoMatchFound.aspx")
            End Try

            Return Nothing
        End Function


        Public Function ReadSPpolicy(ByVal UserNameIs As String) As DataSet

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandText = "temp_test2"
            cmd.CommandType = CommandType.StoredProcedure

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Using da
                da.Fill(ds)
            End Using

            Return ds

            'Try
            '    Using da
            '        da.Fill(ds)
            '        Dim x As String = ds.Tables(0).Rows(0).Item(5).ToString()
            '        If x < Today.Date Then
            '            Return ds
            '        End If
            '    End Using
            'Catch ex As Exception
            '    HttpContext.Current.Response.Redirect("~/login/NoMatchFound.aspx")
            'End Try

            'Return Nothing
        End Function


        Public Function iSeriesTest(ByVal UserNameIs As String) As DataSet
            'This code can be deleted later on 9/11/2012, need a little tweeking, not exactly right with date comparison
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command("SELECT D0POLAGY, D0NAMEINS, D0CUSTCD, D0POLSYM, D0POLNO, D0POLMOD, D0GVVA, D0GSVA, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As DOEFF0DTE, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As DOEXP0DTE FROM RCD0CPL1 WHERE (D0CUSTCD = ?)", con)
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text

            Dim ida As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()
            Dim iRow As Integer = 0

            'Try

            Using ida
                ida.Fill(ds)
                Do While iRow >= 0
                    Dim xdate As String = ds.Tables(0).Rows(iRow).Item(9).ToString()
                    If xdate > Today.Date Then
                        Dim m0de As String = ds.Tables(0).Rows(iRow).Item(5).ToString()
                        Dim cmd2 As iDB2Command = New iDB2Command("SELECT D0POLAGY As Agency, D0NAMEINS As Insured, D0CUSTCD As CustNum, D0POLSYM, D0POLNO, D0POLMOD, D0GVVA * -1 As Balance, D0GSVA As Paid, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As Start, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As End FROM RCD0CPL1 WHERE (D0POLMOD = ?) AND (D0CUSTCD = ?)", con)
                        cmd2.Parameters.AddWithValue("@mod", m0de)
                        cmd2.Parameters.AddWithValue("@custnum", UserNameIs)
                        cmd2.CommandType = CommandType.Text
                        Dim iAdapter As New iDB2DataAdapter(cmd2)
                        Dim ds2 As New DataSet()

                        Using iAdapter
                            iAdapter.Fill(ds2)
                        End Using

                        Return ds2
                    End If

                    iRow += 1
                Loop

            End Using

            'Catch ex As Exception
            '    HttpContext.Current.Response.Redirect("~/login/NoMatchFound.aspx")
            'End Try

            Return Nothing

        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function iSeriesTest2() As List(Of RCD0CPL1TABLE)
            Dim ReadPolicy As New List(Of RCD0CPL1TABLE)()
            'This code can be deleted later on 9/11/2012
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT D0POLAGY, D0NAMEINS, D0CUSTCD, D0POLSYM, D0POLNO, D0POLMOD, D0GSVA, D0GVVA * -1 As Balance, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As DOEFF0DTE, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As DOEXP0DTE FROM RCD0CPL1 WHERE (D0CUSTCD = '0000023174')"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim GetPolicyRecord As New RCD0CPL1TABLE()
                    GetPolicyRecord.Agency = CType(reader("D0POLAGY"), String)
                    GetPolicyRecord.TheInsured = CType(reader("D0NAMEINS"), String)
                    GetPolicyRecord.CustomerNum = CType(reader("D0CUSTCD"), String)
                    GetPolicyRecord.PolicyType = CType(reader("D0POLSYM"), String)
                    GetPolicyRecord.PolicyNum = CType(reader("D0POLNO"), String)
                    GetPolicyRecord.M0dule = CType(reader("D0POLMOD"), String)
                    GetPolicyRecord.TotalPaid = CType(reader("D0GSVA"), String)
                    GetPolicyRecord.Balance = CType(reader("Balance"), String)
                    GetPolicyRecord.EffDate = CType(reader("DOEFF0DTE"), Date)
                    GetPolicyRecord.ExpDate = CType(reader("DOEXP0DTE"), String)
                    ReadPolicy.Add(GetPolicyRecord)
                    'reader.NextResult()
                End While
            End Using

            Return ReadPolicy

        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function iSeriesTest3(ByVal UserNameIs As String) As List(Of RCD0CPL1TABLE)
            Dim ReadPolicy As New List(Of RCD0CPL1TABLE)()
            'This code can be deleted later on 9/11/2012
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT D0POLAGY, D0NAMEINS, D0CUSTCD, D0POLSYM, D0POLNO, D0POLMOD, D0GVVA, D0GSVA, substring(D0EFFDTE,4,2) || '/' || substring(D0EFFDTE,6,2) || '/' || substring(D0EFFDTE,2,2) As DOEFF0DTE, substring(D0EXPDTE,4,2) || '/' || substring(D0EXPDTE,6,2) || '/' || substring(D0EXPDTE,2,2) As DOEXP0DTE FROM RCD0CPL1 WHERE (D0CUSTCD = ?)"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim GetPolicyRecord As New RCD0CPL1TABLE()
                    GetPolicyRecord.Agency = CType(reader("D0POLAGY"), String)
                    GetPolicyRecord.TheInsured = CType(reader("D0NAMEINS"), String)
                    GetPolicyRecord.CustomerNum = CType(reader("D0CUSTCD"), String)
                    GetPolicyRecord.PolicyType = CType(reader("D0POLSYM"), String)
                    GetPolicyRecord.PolicyNum = CType(reader("D0POLNO"), String)
                    GetPolicyRecord.M0dule = CType(reader("D0POLMOD"), String)
                    GetPolicyRecord.Balance = CType(reader("D0GVVA"), String)
                    GetPolicyRecord.TotalPaid = CType(reader("D0GSVA"), String)
                    GetPolicyRecord.EffDate = CType(reader("DOEFF0DTE"), Date)
                    GetPolicyRecord.ExpDate = CType(reader("DOEXP0DTE"), String)
                    Dim x As Date = GetPolicyRecord.ExpDate.ToString
                    Dim y As Date = Today.Date
                    'Dim Date1 As Integer = GetPolicyRecord.ExpDate.ToString
                    'Dim Date2 As Integer = Now()
                    'Dim z As Integer
                    'z = System.DateTime.Compare(x.DayOfYear, y.Day)
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = y.Subtract(x)
                    'If x >= Today.Date Then
                    If DaysElasped.Days <= 0 And DaysElasped.Days >= -365.242 Then
                        ReadPolicy.Add(GetPolicyRecord)
                    End If
                    'reader.NextResult()
                End While
            End Using
            Return ReadPolicy
        End Function

        Public Function iSeriesTest4(ByVal UserNameIs As String) As DataSet
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT D2B2CD, D2ISTX, D2POLNO, D2POLSYM, D2POLMOD, D2CJVA, D2BHNB, substring(D2AXDT,4,2) || '/' || substring(D2AXDT,6,2) || '/' || substring(D2AXDT,2,2) As D2AXDT, D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) ORDER BY D2POLMOD DESC, D2AXDT DESC"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Using da
                da.Fill(ds)
            End Using

            Return ds
            Return Nothing
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function iSeriesTest5(ByVal UserNameIs As String) As List(Of RCD2CPPTABLE)
            Dim ReadPolicy As New List(Of RCD2CPPTABLE)()
            'This code can be deleted later on 9/11/2012
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT D2B2CD, D2POLSYM, D2ISTX, D2POLNO, D2POLMOD, D2CJVA, D2BHNB, substring(D2AXDT,4,2) || '/' || substring(D2AXDT,6,2) || '/' || substring(D2AXDT,2,2) As D2AXDT, D2B8ST FROM RCD2CPP WHERE (D2B2CD = ?) ORDER BY D2POLMOD DESC"
            cmd.Parameters.AddWithValue("@custnum", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As iDB2DataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim GetPolicyRecord As New RCD2CPPTABLE()
                    GetPolicyRecord.Custnum = CType(reader("D2B2CD"), String)
                    GetPolicyRecord.Policynum = CType(reader("D2POLNO"), String)
                    GetPolicyRecord.D2istx = CType(reader("D2ISTX"), String)
                    GetPolicyRecord.Policytype = CType(reader("D2POLSYM"), String)
                    GetPolicyRecord.M0dule = CType(reader("D2POLMOD"), String)
                    GetPolicyRecord.Nextpayment = CType(reader("D2CJVA"), Decimal)
                    GetPolicyRecord.D2bhnb = CType(reader("D2BHNB"), String)
                    GetPolicyRecord.Datedue = CType(reader("D2AXDT"), Date)
                    GetPolicyRecord.D2b8st = CType(reader("D2B8ST"), String)
                    Dim x As Date = GetPolicyRecord.Datedue.ToString
                    Dim y As Date = Today.Date
                    Dim NextPay As Decimal = GetPolicyRecord.Nextpayment.ToString
                    Dim Status As String = GetPolicyRecord.D2b8st.ToString
                    'Dim z As String = GetPolicyRecord.D2b8st.ToString
                    'Dim Date1 As Integer = GetPolicyRecord.ExpDate.ToString
                    'Dim Date2 As Integer = Now()
                    'Dim z As Integer
                    'z = System.DateTime.Compare(x.DayOfYear, y.Day)
                    Dim DaysElasped As New TimeSpan
                    DaysElasped = y.Subtract(x)
                    'If x >= Today.Date Then
                    If DaysElasped.Days <= 0 And DaysElasped.Days >= -15 And NextPay <> "0" And Status = "IN" Then
                        GetPolicyRecord.Message = ("You have " & DaysElasped.Days.ToString * -1 & " days until payment is due.")
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days <= 10 And DaysElasped.Days >= -15 And NextPay <> "0" And Status = "IN" Then
                        GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days <= 25 And DaysElasped.Days >= -15 And NextPay <> "0" And Status = "IN" Then
                        GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days <= 0 And DaysElasped.Days >= -15 And NextPay <> "0" And Status = "RN" Then
                        GetPolicyRecord.Message = ("You have " & DaysElasped.Days.ToString * -1 & " days until payment is due.")
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days <= 10 And DaysElasped.Days >= -15 And NextPay <> "0" And Status = "RN" Then
                        GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                        ReadPolicy.Add(GetPolicyRecord)
                    ElseIf DaysElasped.Days <= 25 And DaysElasped.Days >= -15 And NextPay <> "0" And Status = "RN" Then
                        GetPolicyRecord.Message = ("This policy is " & DaysElasped.Days.ToString & " days past due.")
                        ReadPolicy.Add(GetPolicyRecord)
                    End If

                    'reader.NextResult()
                End While
            End Using
            Return ReadPolicy
        End Function

        Public Function BuildingOccupancy() As DataSet
            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            cmd.CommandText = "SELECT DISTINCT A1KKTX FROM ASA1REP WHERE A1AGTX = 'CP' ORDER BY A1KKTX"
            cmd.CommandType = CommandType.Text

            Dim da As New iDB2DataAdapter(cmd)
            Dim ds As New DataSet()
            Dim dt As New DataTable()

            Using da
                da.Fill(ds)
            End Using

            Return ds
        End Function

        'Shared Sub New()
        '    _connectionString = WebConfigurationManager.ConnectionStrings("Phony").ConnectionString
        '    If String.IsNullOrEmpty(_connectionString) Then
        '        Throw New Exception("No connection String configured in Web.Config file")
        '    End If
        'End Sub

        Shared Sub New()
            _connString = WebConfigurationManager.ConnectionStrings("iSeries").ConnectionString
            If String.IsNullOrEmpty(_connString) Then
                Throw New Exception("No connection String configured in Web.Config file")
            End If
        End Sub
    End Class

End Namespace