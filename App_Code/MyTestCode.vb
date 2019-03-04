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


Namespace smci.TestData


    Public Class MyTestCode
        Private Shared ReadOnly _connectionString As String = String.Empty
        Private Shared ReadOnly _connString As String = String.Empty


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function AgencyCustomerList5(ByVal UserNameIs As String) As List(Of PMSL0217)
            Dim CustomerRecord As New List(Of PMSL0217)()

            Dim con As iDB2Connection = New iDB2Connection(_connString)
            Dim cmd As iDB2Command = New iDB2Command()
            cmd.Connection = con
            'cmd.CommandText = "SELECT DISTINCT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, PMSL0217.MODULE AS M0DULE, PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, PMSL0217.TYPE0ACT, PMSL0217.TRANS0STAT, BASP0200E.USRIND3 FROM SOMRC0DAT.PMSL0217 LEFT OUTER JOIN SOMRC0DAT.BASP0200E ON BASP0200E.POLICY0NUM = PMSL0217.POLICY0NUM WHERE (SOMRC0DAT.PMSL0217.POLICY0NUM = '0060758') ORDER BY SOMRC0DAT.PMSL0217.SYMBOL"
            'cmd.CommandText = "SELECT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, SOMRC0DAT.PMSL0217.MODULE AS M0DULE, SOMRC0DAT.PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, SOMRC0DAT.PMSL0217.TYPE0ACT, SOMRC0DAT.PMSL0217.TRANS0STAT, SOMRC0DAT.BASP0200E.USRIND3 FROM SOMRC0DAT.BASP0200E, SOMRC0DAT.PMSL0217 WHERE SOMRC0DAT.BASP0200E.POLICY0NUM = SOMRC0DAT.PMSL0217.POLICY0NUM AND SOMRC0DAT.BASP0200E.MODULE = SOMRC0DAT.PMSL0217.MODULE AND SOMRC0DAT.BASP0200E.SYMBOL = SOMRC0DAT.PMSL0217.SYMBOL AND (SOMRC0DAT.PMSL0217.AGENCY = ?) ORDER BY SOMRC0DAT.PMSL0217.SYMBOL"
            cmd.CommandText = "SELECT SOMRC0DAT.PMSL0217.POLICY0NUM, SOMRC0DAT.PMSL0217.AGENCY, SOMRC0DAT.PMSL0217.SYMBOL, SOMRC0DAT.PMSL0217.CUST0NO, SOMRC0DAT.PMSL0217.MODULE AS M0DULE, SOMRC0DAT.PMSL0217.ADD0LINE01, SUBSTRING(PMSL0217.EFFDT, 4,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 6,2) || '/' || SUBSTRING(PMSL0217.EFFDT, 2,2) As EFF0DT, SUBSTRING(EXPDT, 4,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 6,2) || '/' || SUBSTRING(PMSL0217.EXPDT, 2,2) As EXP0DT, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWINVOICE, PMSL0217.SYMBOL || '' || PMSL0217.POLICY0NUM || '' ||  PMSL0217.MODULE As VIEWPOLICY, SOMRC0DAT.PMSL0217.TYPE0ACT, SOMRC0DAT.PMSL0217.TRANS0STAT, SOMRC0DAT.BASP0200E.USRIND3 FROM SOMRC0DAT.PMSL0217 LEFT OUTER JOIN SOMRC0DAT.BASP0200E ON SOMRC0DAT.BASP0200E.POLICY0NUM = SOMRC0DAT.PMSL0217.POLICY0NUM AND SOMRC0DAT.BASP0200E.MODULE = SOMRC0DAT.PMSL0217.MODULE AND SOMRC0DAT.BASP0200E.SYMBOL = SOMRC0DAT.PMSL0217.SYMBOL WHERE SOMRC0DAT.PMSL0217.AGENCY = ? ORDER BY SOMRC0DAT.PMSL0217.SYMBOL"
            'cmd.Parameters.Add("CN", OdbcType.NVarChar).Value = CN
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            'cmd.Parameters.AddWithValue("@name", name)
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
                    'NOTE: IF POLICY IS PUT ON A SHORT TERM DATE TO MERGE OTHER POLICY ONTO ONE BILL THEN DEPENDING ON YOUR EFF DATE IT COULD SHOW UP TWICE IN THE POLICY LIST BECAUSE IT IS WITHIN THE YEAR,
                    'EXAMPLE: POLICY 0011022 EFF DATE IS ON 04/12/2012 AND EXP DATE IS ON 5/14/2012 AND IS CHANGED TO 5/14/2012 - 05/14/2013 THE EFF DATE WILL BE WITHIN THE TIME FRAME OF ONE YEAR,
                    'THEREFORE SHOWING UP TWICE IN THE POLICY LIST. POSSIBLE SOLUTION IS TO CHANGE THE DaysElasped = y.Subtract(x) FROM x TO z LIKE IT DID ABOVE.
                    If DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "BA " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "WC " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "UM " And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "STD" And SMPYear <> "1" And SMPYear <> "2" And SMPYear <> "3" Then
                        CustomerRecord.Add(SeePolicyList)
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "SMP" And SMPYear = "1" Then
                        Dim SmpDaysElasped As New TimeSpan
                        newExpDate = z.AddDays(730.484)
                        SeePolicyList.Expdate = newExpDate.Date
                        SmpDaysElasped = y.Subtract(newExpDate)
                        'currentPolicy = String.Concat(pType, polNum, Format(m0de - 0, "00"))
                        'SeePolicyList.Viewpolicy = currentPolicy.ToString
                        'If SmpDaysElasped.Days >= 0 And SmpDaysElasped.Days <= 365.242 Then
                        CustomerRecord.Add(SeePolicyList)
                        'End If
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "SMP" And SMPYear = "2" Then
                        Dim SmpDaysElasped As New TimeSpan
                        newExpDate = z.AddDays(365.242)
                        SeePolicyList.Expdate = newExpDate.Date
                        SmpDaysElasped = y.Subtract(newExpDate)
                        'If SmpDaysElasped.Days >= 0 And SmpDaysElasped.Days <= 365.242 Then
                        currentPolicy = String.Concat(pType, polNum, Format(m0de - 1, "00"))
                        SeePolicyList.Viewpolicy = currentPolicy.ToString
                        CustomerRecord.Add(SeePolicyList)
                        'End If
                    ElseIf DaysElasped.Days >= 0 And DaysElasped.Days <= 365.242 And ACT <> "CN" And STAT = "V" And pType = "SMP" And SMPYear = "3" Then
                        currentPolicy = String.Concat(pType, polNum, Format(m0de - 2, "00"))
                        SeePolicyList.Viewpolicy = currentPolicy.ToString
                        CustomerRecord.Add(SeePolicyList)
                    End If
                    'CustomerRecord.Add(SeePolicyList)
                End While
            End Using
            Return CustomerRecord

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
        Public Function GetProcessedPolicies(ByVal UserNameIs As String) As List(Of MediaManagement)
            Dim MyPolicies As New List(Of MediaManagement)
            Dim ReadRecord As New MediaManagement
            'Dim yesterday As Date = DateTime.Now.AddDays(-1)
            Dim yesterday As Date = Today.AddDays(-1)
            ReadRecord.Myparam = String.Concat(UserNameIs, yesterday)
            MyPolicies.Add(ReadRecord)
            Return MyPolicies
        End Function


        Shared Sub New()
            _connString = WebConfigurationManager.ConnectionStrings("iSeries").ConnectionString
            If String.IsNullOrEmpty(_connString) Then
                Throw New Exception("No connection String configured in Web.Config file")
            End If
        End Sub

    End Class

End Namespace
