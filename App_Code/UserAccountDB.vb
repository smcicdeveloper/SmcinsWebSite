Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports Microsoft.VisualBasic

Public Class UserAccountDB

    Private Shared ReadOnly _connectionString As String = String.Empty
    Private Shared ReadOnly _con As String = String.Empty

    Shared Sub New()
        _connectionString = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        _con = WebConfigurationManager.ConnectionStrings("AllPortal").ConnectionString
        If String.IsNullOrEmpty(_connectionString) Then
            Throw New Exception("No connection String configured in Web.Config file")
        ElseIf String.IsNullOrEmpty(_con) Then
            Throw New Exception("No connection String configured in Web.Config file")
        End If
    End Sub

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetUserAccountData(ByVal stateParam As String) As List(Of _UserAccountVariables)
        Dim Records As New List(Of _UserAccountVariables)()
        'Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("AllPortal").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@state", stateParam)
        cmd.CommandText = "SELECT abi.NAME_OF_AGENCY, users.UserName, ap.MasterID, ap.SubID, member.LoweredEmail, ap.FirstName + ' ' + ap.LastName As FullName, ap.Phone, ap.Position, ap.City, ap.State, ap.Role, ap.DateCreated FROM aspnet_Users As users INNER JOIN aspnet_Membership As member ON users.UserId = member.UserId INNER JOIN AgentProfiles As ap ON users.UserName = ap.UserName INNER JOIN SMCINS_Web_Prod.dbo.AgencyBusinessInformation As abi ON ap.SubID = abi.AGENT_NUMBER WHERE State = @state ORDER BY users.UserName"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _UserAccountVariables()
                SeeRecord.Agency = CType(reader("NAME_OF_AGENCY"), String)
                SeeRecord.MasterId = CType(reader("MasterID"), String)
                SeeRecord.SubAgentId = CType(reader("SubID"), String)
                SeeRecord.Email = CType(reader("LoweredEmail"), String)
                SeeRecord.FullName = CType(reader("FullName"), String)
                SeeRecord.Username = CType(reader("UserName"), String)
                SeeRecord.Telephone = CType(reader("Phone"), String)
                SeeRecord.Title = CType(reader("Position"), String)
                SeeRecord.City = CType(reader("City"), String)
                SeeRecord.State = CType(reader("State"), String)
                SeeRecord.Role = CType(reader("Role"), String)
                SeeRecord.DateCreated = CType(reader("DateCreated"), String)
                Records.Add(SeeRecord)
            End While
        End Using

        Return Records
    End Function

End Class
