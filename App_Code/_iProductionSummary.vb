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

Public Class _iProductionSummary
    Private Shared ReadOnly _connectionString As String = String.Empty
    Private Shared ReadOnly _connString As String = String.Empty

    Shared Sub New()
        _connString = WebConfigurationManager.ConnectionStrings("iSeries").ConnectionString
        If String.IsNullOrEmpty(_connString) Then
            Throw New Exception("No connection String configured in Web.Config file")
        End If
    End Sub

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetQuotePrem(ByVal agentNum As String, ByVal TheYear As String) As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        Dim con As iDB2Connection = New iDB2Connection(_connString)
        Dim cmd As iDB2Command = New iDB2Command()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@agent", agentNum)
        'cmd.Parameters.AddWithValue("@month", TheMonth)
        cmd.Parameters.AddWithValue("@year", TheYear)
        cmd.CommandText = "SELECT ADD0LINE01, ADD0LINE04, substring(ENTER0DATE,4,2) || '/' || substring(ENTER0DATE,6,2) || '/' || substring(ENTER0DATE,2,2) As DATEENTERED, substring(EFFDT,4,2) || '/' || substring(EFFDT,6,2) || '/' || substring(EFFDT,2,2) As EFFECTDATE FROM PMSL0217 WHERE AGENCY = ? AND '20' || substring(ENTER0DATE,2,2) = ? AND SYMBOL <> 'SMP' AND SYMBOL <> 'BA' AND SYMBOL <> 'UM' AND SYMBOL <> 'WC' "
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As iDB2DataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _NewBusiness()

                'Checking for Null values
                SeeRecord.Church = Convert.ToString(reader("ADD0LINE01"))
                ValueIsNull = SeeRecord.Church.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Church = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Church = CType(reader("ADD0LINE01"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.Location = Convert.ToString(reader("ADD0LINE04"))
                ValueIsNull = SeeRecord.Location.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Location = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Location = CType(reader("ADD0LINE04"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.QuoteDate = Convert.ToString(reader("DATEENTERED"))
                ValueIsNull = SeeRecord.QuoteDate
                If ValueIsNull = Nothing Then
                    SeeRecord.QuoteDate = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.QuoteDate = CType(reader("DATEENTERED"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.DateWritten = Convert.ToString(reader("EFFECTDATE"))
                ValueIsNull = SeeRecord.DateWritten
                If ValueIsNull = Nothing Then
                    SeeRecord.DateWritten = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.DateWritten = CType(reader("EFFECTDATE"), String)
                    ValueIsNull = String.Empty
                End If
                Records.Add(SeeRecord)
            End While
        End Using

        Return Records
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetLossRatio(ByVal agentNum As String) As List(Of _LossDetailVariables)
        Dim Records As New List(Of _LossDetailVariables)()

        Dim con As iDB2Connection = New iDB2Connection(_connString)
        Dim cmd As iDB2Command = New iDB2Command()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@agent", agentNum)
        cmd.CommandText = "SELECT pms.AGENCY, pms.POLICYNO, MOD, SUBSTRING(CAST(pms.LOSSDATE AS VARCHAR(7)), 4, 2) || '/' || SUBSTRING(CAST(pms.LOSSDATE AS VARCHAR(7)), 6, 2) || '/' || SUBSTRING(CAST(pms.LOSSDATE AS VARCHAR(7)), 2, 2) AS LOSSDATE1, pms.ACCDESC, ((SUM(pms.PDLOSSYTD)+SUM(pms.PDAEXPYTD)+SUM(pms.CURRRESV)+SUM(pms.CURREXPRES))-(SUM(pms.SALVGYTD)+SUM(pms.SUBROGAYTD))) As TotalLosses FROM PMSPYL00 As pms WHERE pms.AGENCY = ? GROUP BY AGENCY,POLICYNO,MOD,LOSSDATE,ACCDESC,PDLOSSYTD,PDAEXPYTD,CURRRESV,CURREXPRES,SALVGYTD,SUBROGAYTD"
        'cmd.CommandText = "SELECT pms.AGENCY, pms.POLICYNO, MOD, pms.LOSSDATE AS LOSSDATE, pms.ACCDESC, SUM(pms.PDLOSSYTD) As TotalLosses FROM PMSPYL00 As pms WHERE pms.AGENCY = ? GROUP BY AGENCY,POLICYNO,MOD,LOSSDATE,ACCDESC,PDLOSSYTD"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As iDB2DataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _LossDetailVariables
                SeeRecord.Agency = CType(reader("AGENCY"), String)
                SeeRecord.Policyno = CType(reader("POLICYNO"), String)
                SeeRecord.LossDate = CType(reader("LOSSDATE1"), String)
                SeeRecord.LossDescription = CType(reader("ACCDESC"), String)
                SeeRecord.TotalLoss = CType(reader("TotalLosses"), String)
                If SeeRecord.TotalLoss <> "0.00" Then
                    Records.Add(SeeRecord)
                End If

            End While
        End Using

        Return Records
    End Function

End Class
