Imports System
Imports System.Web
Imports System.Web.Services
Imports System.Web.Configuration
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class GetAutoCodes

    Private Shared ReadOnly _conString As String = String.Empty

    Shared Sub New()
        _conString = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        If String.IsNullOrEmpty(_conString) Then
            Throw New Exception("No connection String configured in Web.Config file")
        End If
    End Sub

    Public Shared Function GetAllAutoCodes(ByVal zip As String) As List(Of _ZipVariables)
        Dim AutoCodeList As New List(Of _ZipVariables)()

        Dim con As SqlConnection = New SqlConnection(_conString)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.Add("@zip", SqlDbType.NVarChar).Value = zip
        cmd.CommandText = "SELECT code_id, zip_code, territory, county, state, territory_code FROM TerritoryCodes where zip_code LIKE '%'+@zip+'%'"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim GetRecord As New _ZipVariables
                GetRecord.CodeId = CType(reader("code_id"), Integer)
                GetRecord.ZipCode = CType(reader("zip_code"), String)
                GetRecord.Territory = CType(reader("territory"), String)
                GetRecord.County = CType(reader("county"), String)
                GetRecord.State = CType(reader("state"), String)
                GetRecord.TerritoryCode = CType(reader("territory_code"), String)
                AutoCodeList.Add(GetRecord)
            End While
        End Using
        Return AutoCodeList

    End Function


    Public Shared Function GetKentuckyAutoCodes(ByVal zip As String) As List(Of _ZipVariables)
        Dim AutoCodeList As New List(Of _ZipVariables)()

        Dim con As SqlConnection = New SqlConnection(_conString)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.Add("@zip", SqlDbType.NVarChar).Value = zip
        cmd.CommandText = "SELECT code_id, zip_code, territory, county, state, territory_code FROM Kentucky where zip_code LIKE '%'+@zip+'%'"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim GetRecord As New _ZipVariables
                GetRecord.CodeId = CType(reader("code_id"), Integer)
                GetRecord.ZipCode = CType(reader("zip_code"), String)
                GetRecord.Territory = CType(reader("territory"), String)
                GetRecord.County = CType(reader("county"), String)
                GetRecord.State = CType(reader("state"), String)
                GetRecord.TerritoryCode = CType(reader("territory_code"), String)
                AutoCodeList.Add(GetRecord)
            End While
        End Using
        Return AutoCodeList

    End Function


    Public Shared Function GetVirginiaAutoCodes(ByVal zip As String) As List(Of _ZipVariables)
        Dim AutoCodeList As New List(Of _ZipVariables)()

        Dim con As SqlConnection = New SqlConnection(_conString)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.Add("@zip", SqlDbType.NVarChar).Value = zip
        cmd.CommandText = "SELECT code_id, zip_code, territory, county, state, territory_code FROM Virginia where zip_code LIKE '%'+@zip+'%'"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim GetRecord As New _ZipVariables
                GetRecord.CodeId = CType(reader("code_id"), Integer)
                GetRecord.ZipCode = CType(reader("zip_code"), String)
                GetRecord.Territory = CType(reader("territory"), String)
                GetRecord.County = CType(reader("county"), String)
                GetRecord.State = CType(reader("state"), String)
                GetRecord.TerritoryCode = CType(reader("territory_code"), String)
                AutoCodeList.Add(GetRecord)
            End While
        End Using
        Return AutoCodeList

    End Function


End Class
