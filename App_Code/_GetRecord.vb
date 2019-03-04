Imports System
Imports System.Web
Imports System.Web.Services
Imports System.Web.Configuration
Imports System.Configuration
Imports System.ComponentModel
Imports System.IO
Imports System.Collections
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class _GetRecord
    'Inherits SqlConnection

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetEmployee() As List(Of _EmployeeVariables)
        Dim Names As New List(Of _EmployeeVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.CommandText = "SELECT file_location, FullName FROM FileLocation"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _EmployeeVariables()
                SeeRecord.file_location = CType(reader("file_location"), Integer)
                SeeRecord.FullName = CType(reader("FullName"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetEmployeeByDepartment() As List(Of _EmployeeVariables)
        Dim Names As New List(Of _EmployeeVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        'cmd.Parameters.AddWithValue("@dept", dept)
        cmd.CommandText = "SELECT file_location, FullName FROM FileLocation WHERE Department <> 'SUPPORT SERVICES' AND Department <> 'OFFICERS' AND Department <> 'FINANCIAL SERVICES' AND Department <> 'NONE' AND file_location <> '1520' AND file_location <> '1560' AND State = 'SC' ORDER BY FullName"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _EmployeeVariables()
                SeeRecord.file_location = CType(reader("file_location"), Integer)
                SeeRecord.FullName = CType(reader("FullName"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetEmployeeByAvailable() As List(Of _EmployeeVariables)
        Dim Names As New List(Of _EmployeeVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        'cmd.Parameters.AddWithValue("@dept", dept)
        cmd.CommandText = "SELECT file_location, FullName FROM FileLocation WHERE Department <> 'SUPPORT SERVICES' AND Department <> 'OFFICERS' AND Department <> 'FINANCIAL SERVICES' AND file_location <> '1520' AND file_location <> '1560' AND State = 'SC' ORDER BY FullName"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _EmployeeVariables()
                SeeRecord.file_location = CType(reader("file_location"), Integer)
                SeeRecord.FullName = CType(reader("FullName"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetEmployeeFromUnderwriting() As List(Of _EmployeeVariables)
        Dim Names As New List(Of _EmployeeVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        'cmd.Parameters.AddWithValue("@dept", dept)
        cmd.CommandText = "SELECT file_location, FullName FROM FileLocation WHERE Department = 'UNDERWRITING' AND file_location <> '1301' AND file_location <> '1303' AND file_location <> '2660' ORDER BY FullName"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _EmployeeVariables()
                SeeRecord.file_location = CType(reader("file_location"), Integer)
                SeeRecord.FullName = CType(reader("FullName"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetEmployeeFromLossControl() As List(Of _EmployeeVariables)
        Dim Names As New List(Of _EmployeeVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        'cmd.Parameters.AddWithValue("@dept", dept)
        cmd.CommandText = "SELECT file_location, FullName FROM FileLocation WHERE Department = 'LOSS CONTROL' AND file_location <> '6596' ORDER BY FullName"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _EmployeeVariables()
                SeeRecord.file_location = CType(reader("file_location"), Integer)
                SeeRecord.FullName = CType(reader("FullName"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetState() As List(Of StateList)
        Dim TheStateList As New List(Of StateList)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT STATE_ID, STATE FROM StateList"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeStateList As New StateList()
                SeeStateList.Stateid = CType(reader("STATE_ID"), String)
                SeeStateList.State = CType(reader("STATE"), String)
                TheStateList.Add(SeeStateList)
            End While
        End Using
        Return TheStateList
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetCounty(ByVal State As String) As List(Of CountyList)
        Dim TheCountyList As New List(Of CountyList)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.Add("@State", SqlDbType.NVarChar).Value = State
        cmd.CommandText = "SELECT STATE_ID, COUNTY FROM CountyList WHERE ABBREVIATION = @State"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeCountyList As New CountyList()
                SeeCountyList.Stateid = CType(reader("STATE_ID"), String)
                SeeCountyList.County = CType(reader("COUNTY"), String)
                TheCountyList.Add(SeeCountyList)
            End While
        End Using
        Return TheCountyList
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetAgency() As List(Of _AgencyVariables)
        Dim Names As New List(Of _AgencyVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.CommandText = "SELECT AGENT_NUMBER, NAME_OF_AGENCY + ' - ' + AGENT_NUMBER As agency_name FROM AgencyBusinessInformation ORDER BY NAME_OF_AGENCY"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AgencyVariables()
                SeeRecord.agency_number = CType(reader("AGENT_NUMBER"), String)
                SeeRecord.agency_name = CType(reader("agency_name"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForAllCalls(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate FROM Contacts WHERE department_id = '1' AND cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.cust_no = CType(reader("cust_no"), String)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.department_id = CType(reader("department_id"), Integer)

                If reader.IsDBNull(3) Then
                    SeeRecord.church_number = Nothing
                Else
                    SeeRecord.church_number = CType(reader("church_number"), String)
                End If

                If reader.IsDBNull(4) Then
                    SeeRecord.cell_phone = Nothing
                Else
                    SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                End If

                If reader.IsDBNull(5) Then
                    SeeRecord.email = Nothing
                Else
                    SeeRecord.email = CType(reader("email"), String)
                End If

                If reader.IsDBNull(7) Then
                    SeeRecord.notes = Nothing
                Else
                    SeeRecord.notes = CType(reader("notes"), String)
                End If
                SeeRecord.last_update = CType(reader("LastUpdate"), Date)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForAccounting(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate FROM Contacts WHERE department_id = '200' AND cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.cust_no = CType(reader("cust_no"), String)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.department_id = CType(reader("department_id"), Integer)

                If reader.IsDBNull(3) Then
                    SeeRecord.church_number = Nothing
                Else
                    SeeRecord.church_number = CType(reader("church_number"), String)
                End If

                If reader.IsDBNull(4) Then
                    SeeRecord.cell_phone = Nothing
                Else
                    SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                End If

                If reader.IsDBNull(5) Then
                    SeeRecord.email = Nothing
                Else
                    SeeRecord.email = CType(reader("email"), String)
                End If

                If reader.IsDBNull(7) Then
                    SeeRecord.notes = Nothing
                Else
                    SeeRecord.notes = CType(reader("notes"), String)
                End If
                SeeRecord.last_update = CType(reader("LastUpdate"), Date)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForClaims(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate FROM Contacts WHERE department_id = '500' AND cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.cust_no = CType(reader("cust_no"), String)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.department_id = CType(reader("department_id"), Integer)

                If reader.IsDBNull(3) Then
                    SeeRecord.church_number = Nothing
                Else
                    SeeRecord.church_number = CType(reader("church_number"), String)
                End If

                If reader.IsDBNull(4) Then
                    SeeRecord.cell_phone = Nothing
                Else
                    SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                End If

                If reader.IsDBNull(5) Then
                    SeeRecord.email = Nothing
                Else
                    SeeRecord.email = CType(reader("email"), String)
                End If

                If reader.IsDBNull(7) Then
                    SeeRecord.notes = Nothing
                Else
                    SeeRecord.notes = CType(reader("notes"), String)
                End If
                SeeRecord.last_update = CType(reader("LastUpdate"), Date)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForMarketing(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate FROM Contacts WHERE department_id = '410' AND cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.cust_no = CType(reader("cust_no"), String)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.department_id = CType(reader("department_id"), Integer)

                If reader.IsDBNull(3) Then
                    SeeRecord.church_number = Nothing
                Else
                    SeeRecord.church_number = CType(reader("church_number"), String)
                End If

                If reader.IsDBNull(4) Then
                    SeeRecord.cell_phone = Nothing
                Else
                    SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                End If

                If reader.IsDBNull(5) Then
                    SeeRecord.email = Nothing
                Else
                    SeeRecord.email = CType(reader("email"), String)
                End If

                If reader.IsDBNull(7) Then
                    SeeRecord.notes = Nothing
                Else
                    SeeRecord.notes = CType(reader("notes"), String)
                End If
                SeeRecord.last_update = CType(reader("LastUpdate"), Date)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForLossControl(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate FROM Contacts WHERE department_id = '420' AND cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.cust_no = CType(reader("cust_no"), String)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.department_id = CType(reader("department_id"), Integer)

                If reader.IsDBNull(3) Then
                    SeeRecord.church_number = Nothing
                Else
                    SeeRecord.church_number = CType(reader("church_number"), String)
                End If

                If reader.IsDBNull(4) Then
                    SeeRecord.cell_phone = Nothing
                Else
                    SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                End If

                If reader.IsDBNull(5) Then
                    SeeRecord.email = Nothing
                Else
                    SeeRecord.email = CType(reader("email"), String)
                End If

                If reader.IsDBNull(7) Then
                    SeeRecord.notes = Nothing
                Else
                    SeeRecord.notes = CType(reader("notes"), String)
                End If
                SeeRecord.last_update = CType(reader("LastUpdate"), Date)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForUnderwriting(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate FROM Contacts WHERE department_id = '400' AND cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.cust_no = CType(reader("cust_no"), String)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.department_id = CType(reader("department_id"), Integer)

                If reader.IsDBNull(3) Then
                    SeeRecord.church_number = Nothing
                Else
                    SeeRecord.church_number = CType(reader("church_number"), String)
                End If

                If reader.IsDBNull(4) Then
                    SeeRecord.cell_phone = Nothing
                Else
                    SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                End If

                If reader.IsDBNull(5) Then
                    SeeRecord.email = Nothing
                Else
                    SeeRecord.email = CType(reader("email"), String)
                End If

                If reader.IsDBNull(7) Then
                    SeeRecord.notes = Nothing
                Else
                    SeeRecord.notes = CType(reader("notes"), String)
                End If
                SeeRecord.last_update = CType(reader("LastUpdate"), Date)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function ShowAgencyByNumber() As List(Of _AgencyVariables)
        Dim Names As New List(Of _AgencyVariables)()

        ' Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.CommandText = "SELECT AGENT_NUMBER, AGENT_NUMBER + ' - ' + NAME_OF_AGENCY As agency_name FROM AgencyBusinessInformation ORDER BY AGENT_NUMBER, NAME_OF_AGENCY"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AgencyVariables()
                SeeRecord.agency_number = CType(reader("AGENT_NUMBER"), String)
                SeeRecord.agency_name = CType(reader("agency_name"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetInsured(ByVal DateCreated As Date, ByVal Empnum As String) As List(Of _AccountVariables)
        Dim Names As New List(Of _AccountVariables)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.AddWithValue("@DateCreated", DateCreated)
        cmd.Parameters.AddWithValue("@Empnum", Empnum)
        cmd.CommandText = "SELECT cust_no, insured_name FROM acctinfo WHERE date_created=@DateCreated AND Who=@Empnum"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AccountVariables()
                SeeRecord.cust_no = CType(reader("cust_no"), Integer)
                SeeRecord.insured_name = CType(reader("insured_name"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetFileLocation(ByVal FileLocation As String) As List(Of _AccountVariables)
        Dim Names As New List(Of _AccountVariables)()
        Dim ValueIsNull As String

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.AddWithValue("@FileLocation", FileLocation)
        cmd.CommandText = "SELECT acctinfo.cust_no, acctinfo.insured_name, acctinfo.cust_status, acctinfo.file_location, FileLocation.FullName FROM acctinfo INNER JOIN FileLocation ON acctinfo.file_location = FileLocation.file_location AND acctinfo.file_location=@FileLocation ORDER BY acctinfo.insured_name"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AccountVariables()
                SeeRecord.cust_no = CType(reader("cust_no"), Integer)
                SeeRecord.insured_name = CType(reader("insured_name"), String)

                'Checking for Null values
                SeeRecord.cust_status = Convert.ToString(reader("cust_status"))
                ValueIsNull = SeeRecord.cust_status.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.cust_status = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.cust_status = CType(reader("cust_status"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.file_location = CType(reader("file_location"), String)
                Names.Add(SeeRecord)

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
            End While

        End Using

        Return Names
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetCandleSafetyRecords() As List(Of _CandleSafetyVariables)
        Dim MyRecord As New List(Of _CandleSafetyVariables)
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmd As New SqlCommand("SELECT CandleID, CustNum, ChurchName, ActualLocation, MailingContact, MailingAddress, MailingCity, MailingState, MailingZip, CandleUse, FullName, EntryDate, IPAddress FROM CandleSafety", con)
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim readRecord As New _CandleSafetyVariables
                readRecord.candleid = CType(reader("CandleID"), Integer)
                readRecord.custnum = CType(reader("CustNum"), String)
                readRecord.churchname = CType(reader("ChurchName"), String)
                readRecord.actuallocation = CType(reader("ActualLocation"), String)
                readRecord.mailingcontact = CType(reader("MailingContact"), String)
                readRecord.mailingaddress = CType(reader("MailingAddress"), String)
                readRecord.mailingcity = CType(reader("MailingCity"), String)
                readRecord.mailingstate = CType(reader("MailingState"), String)
                readRecord.mailingzip = CType(reader("MailingZip"), String)
                readRecord.candleuse = CType(reader("CandleUse"), String)
                readRecord.fullname = CType(reader("FullName"), String)
                readRecord.entrydate = CType(reader("EntryDate"), String)
                readRecord.ipaddress = CType(reader("IPAddress"), String)
                MyRecord.Add(readRecord)
            End While
        End Using

        Return MyRecord
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function CandleSafetyMailingAddress(ByVal custnum As Integer, ByVal postalcode As String) As List(Of _AccountVariables)
        Dim Records As New List(Of _AccountVariables)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@custno", custnum)
        cmd.Parameters.AddWithValue("@postalcode", postalcode)
        cmd.CommandText = "SELECT cust_no, insured_name, mail_addr, mail_city, mail_state, mail_zip, actual_location FROM acctinfo WHERE cust_no LIKE @custno AND mail_zip LIKE @postalcode + '%'"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AccountVariables()
                SeeRecord.cust_no = CType(reader("cust_no"), Integer)
                SeeRecord.insured_name = CType(reader("insured_name"), String)

                'Checking for Null values
                SeeRecord.mail_addr = Convert.ToString(reader("mail_addr"))
                ValueIsNull = SeeRecord.mail_addr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.mail_addr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.mail_addr = CType(reader("mail_addr"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.mail_city = CType(reader("mail_city"), String)
                SeeRecord.mail_state = CType(reader("mail_state"), String)
                SeeRecord.mail_zip = CType(reader("mail_zip"), String)

                'Checking for Null values and assigning the mail city to location if blank
                SeeRecord.actual_location = Convert.ToString(reader("actual_location"))
                ValueIsNull = SeeRecord.actual_location.Trim
                If ValueIsNull = Nothing Then
                    'SeeRecord.actual_location = ""
                    SeeRecord.actual_location = CType(reader("mail_city"), String)
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.actual_location = CType(reader("actual_location"), String)
                    ValueIsNull = String.Empty
                End If
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
    End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function CandleSafetyAppMailingAddress(ByVal custnum As Integer) As List(Of _AccountVariables)
        Dim Records As New List(Of _AccountVariables)()
        Dim ValueIsNull As String

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@custno", custnum)
        cmd.CommandText = "SELECT cust_no, insured_name, mail_addr, mail_city, mail_state, mail_zip, actual_location FROM acctinfo WHERE cust_no LIKE @custno"

        cmd.CommandType = CommandType.Text

        Using con

            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AccountVariables()
                SeeRecord.cust_no = CType(reader("cust_no"), Integer)
                SeeRecord.insured_name = CType(reader("insured_name"), String)

                'Checking for Null values
                SeeRecord.mail_addr = Convert.ToString(reader("mail_addr"))
                ValueIsNull = SeeRecord.mail_addr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.mail_addr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.mail_addr = CType(reader("mail_addr"), String)
                    ValueIsNull = String.Empty
                End If

                SeeRecord.mail_city = CType(reader("mail_city"), String)
                SeeRecord.mail_state = CType(reader("mail_state"), String)
                SeeRecord.mail_zip = CType(reader("mail_zip"), String)

                'Checking for Null values and assigning the mail city to location if blank
                SeeRecord.actual_location = Convert.ToString(reader("actual_location"))
                ValueIsNull = SeeRecord.actual_location.Trim
                If ValueIsNull = Nothing Then
                    'SeeRecord.actual_location = ""
                    SeeRecord.actual_location = CType(reader("mail_city"), String)
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.actual_location = CType(reader("actual_location"), String)
                    ValueIsNull = String.Empty
                End If
                Records.Add(SeeRecord)
            End While

        End Using

        Try
            Return Records
        Catch ex As Exception
            Return Nothing
        End Try

    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function CandleSafetyDesignate(ByVal custnum As Integer) As List(Of _CandleSafetyVariables)
        Dim Records As New List(Of _CandleSafetyVariables)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@custno", custnum)
        cmd.CommandText = "SELECT DesignateID, CustNum, FullName, CandleUse, EntryDate, EntryRecipient FROM Designate WHERE CustNum = @custno AND EntryDate > '12/31/2017'"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _CandleSafetyVariables()
                SeeRecord.designateid = CType(reader("DesignateID"), Integer)
                SeeRecord.custnum = CType(reader("CustNum"), String)
                SeeRecord.fullname = CType(reader("FullName"), String)
                SeeRecord.candleuse = CType(reader("CandleUse"), String)
                SeeRecord.entrydate = CType(reader("EntryDate"), Date)
                SeeRecord.entryRecipient = CType(reader("EntryRecipient"), String)
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function CountCandleUse() As List(Of _CandleSafetyVariables)
        Dim Records As New List(Of _CandleSafetyVariables)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT CandleUse, COUNT(DISTINCT CustNum) As Total FROM Designate WHERE EntryDate > '12/31/2017' GROUP BY CandleUse"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _CandleSafetyVariables()
                SeeRecord.candleuse = CType(reader("CandleUse"), String)
                SeeRecord.Total = CType(reader("Total"), Integer)
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function ComparisonNumbers() As List(Of _CandleSafetyVariables)
        Dim Records As New List(Of _CandleSafetyVariables)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT CandleUse, YEAR(EntryDate) As MyYear, COUNT(DISTINCT CustNum) As Total FROM Designate WHERE YEAR(EntryDate) <> '2015' AND YEAR(EntryDate) <> '2016' GROUP BY CandleUse, YEAR(EntryDate)"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _CandleSafetyVariables()
                SeeRecord.candleuse = CType(reader("CandleUse"), String)
                SeeRecord.Year = CType(reader("MyYear"), Integer)
                SeeRecord.Total = CType(reader("Total"), Integer)
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function CandleStatics() As List(Of _CandleSafetyVariables)
        Dim Records As New List(Of _CandleSafetyVariables)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT EntryRecipient, COUNT(DISTINCT CustNum) As Total FROM Designate WHERE EntryDate > '12/31/2017' GROUP BY EntryRecipient"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _CandleSafetyVariables()
                SeeRecord.entryRecipient = CType(reader("EntryRecipient"), String)
                SeeRecord.Total = CType(reader("Total"), Integer)
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function CalendarCount() As List(Of _CandleSafetyVariables)
        Dim Records As New List(Of _CandleSafetyVariables)()

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "SELECT Count(*) As Total FROM Designate WHERE EntryDate > '12/31/2017'"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _CandleSafetyVariables()
                SeeRecord.Total = CType(reader("Total"), Integer)
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
    End Function

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetSingleRecord(ByVal cust_no As Integer) As List(Of _AccountVariables)
        Dim Records As New List(Of _AccountVariables)()
        Dim ValueIsNull As String

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        'cmd.CommandText = "SELECT cust_no, cust_status, proxy_init, insured_name, contact, mail_addr, mail_city, mail_state, mail_zip, actual_location, loc_state, loc_zip, county, file_location, contact_name, contact_number, pol1_date, pol1_descr, pol2_date, pol2_descr, pol3_date, pol3_descr, pol4_date, pol4_descr, pol5_date, pol5_descr, action1, action1_date, action2, action2_date, action3, action3_date, action4, action4_date, action5, action5_date, comments FROM acctinfo WHERE cust_no = @custno ORDER BY insured_name ASC"
        'cmd.CommandText = "SELECT acctinfo.cust_no, acctinfo.cust_status, acctinfo.proxy_init, acctinfo.insured_name, acctinfo.contact, acctinfo.mail_addr, acctinfo.mail_city, acctinfo.mail_state, acctinfo.mail_zip, acctinfo.actual_location, acctinfo.loc_state, acctinfo.loc_zip, acctinfo.county, accessnetdb.dbo.EmployeeData.FirstName + ' ' + accessnetdb.dbo.EmployeeData.LastName AS FullName, acctinfo.contact_name, acctinfo.contact_number, acctinfo.pol1_date, acctinfo.pol1_descr, acctinfo.pol2_date, acctinfo.pol2_descr, acctinfo.pol3_date, acctinfo.pol3_descr, acctinfo.pol4_date, acctinfo.pol4_descr, acctinfo.pol5_date, acctinfo.pol5_descr, acctinfo.action1, acctinfo.action1_date, acctinfo.action2, acctinfo.action2_date, acctinfo.action3, acctinfo.action3_date, acctinfo.action4, acctinfo.action4_date, acctinfo.action5, acctinfo.action5_date, acctinfo.comments FROM acctinfo INNER JOIN accessnetdb.dbo.EmployeeData ON acctinfo.file_location = accessnetdb.dbo.EmployeeData.EmployeeId AND cust_no = @custno ORDER BY acctinfo.insured_name"
        'cmd.CommandText = "SELECT acctinfo.cust_no, acctinfo.insured_name, acctinfo.contact, acctinfo.mail_addr, acctinfo.mail_city, acctinfo.mail_state, acctinfo.mail_zip, acctinfo.county, acctinfo.file_location, acctinfo.actual_location, acctinfo.loc_state, acctinfo.loc_zip, acctinfo.cust_status, acctinfo.pol1_date, acctinfo.pol1_descr, acctinfo.pol2_date, acctinfo.pol2_descr, acctinfo.pol3_date, acctinfo.pol3_descr, acctinfo.pol4_date, acctinfo.pol4_descr, acctinfo.pol5_date, acctinfo.pol5_descr, acctinfo.proxy_init, acctinfo.action1, acctinfo.action1_date, acctinfo.action2, acctinfo.action2_date, acctinfo.action3, acctinfo.action3_date, acctinfo.action4, acctinfo.action4_date, acctinfo.action5, acctinfo.action5_date, acctinfo.agency_name, acctinfo.contact_name, acctinfo.contact_number, acctinfo.comments, FileLocation.FullName FROM acctinfo INNER JOIN FileLocation ON acctinfo.file_location = FileLocation.file_location AND cust_no = @custno ORDER BY acctinfo.insured_name"
        cmd.CommandText = "SELECT acctinfo.cust_no, acctinfo.insured_name, acctinfo.proxy_init, acctinfo.contact, acctinfo.mail_addr, acctinfo.mail_city, acctinfo.mail_state, acctinfo.mail_zip, acctinfo.county, acctinfo.church_email, acctinfo.file_location, acctinfo.actual_location, acctinfo.loc_state, acctinfo.cust_status, acctinfo.pol1_date, acctinfo.pol1_descr, acctinfo.pol2_date, acctinfo.pol2_descr, acctinfo.pol3_date, acctinfo.pol3_descr, acctinfo.pol4_date, acctinfo.pol4_descr, acctinfo.pol5_date, acctinfo.pol5_descr, acctinfo.action1, acctinfo.action1_date, acctinfo.action2, acctinfo.action2_date, acctinfo.action3, acctinfo.action3_date, acctinfo.action4, acctinfo.action4_date, acctinfo.action5, acctinfo.action5_date, acctinfo.agency_number, AgencyBusinessInformation.NAME_OF_AGENCY As agency_name, acctinfo.contact_name, acctinfo.contact_number, acctinfo.comments, FileLocation.FullName, AgencyBusinessInformation.AGENT_NUMBER FROM acctinfo INNER JOIN FileLocation ON acctinfo.file_location = FileLocation.file_location AND acctinfo.cust_no = @custno INNER JOIN AgencyBusinessInformation ON acctinfo.agency_number = AgencyBusinessInformation.AGENT_NUMBER ORDER BY acctinfo.insured_name"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _AccountVariables()
                SeeRecord.cust_no = CType(reader("cust_no"), String)

                'Checking for Null values
                SeeRecord.cust_status = Convert.ToString(reader("cust_status"))
                ValueIsNull = SeeRecord.cust_status.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.cust_status = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.cust_status = CType(reader("cust_status"), String)
                    ValueIsNull = String.Empty
                End If

                'checking for Null values
                SeeRecord.proxy_init = Convert.ToString(reader("proxy_init"))
                ValueIsNull = SeeRecord.proxy_init.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.proxy_init = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.proxy_init = CType(reader("proxy_init"), String)
                    ValueIsNull = String.Empty
                End If


                SeeRecord.insured_name = CType(reader("insured_name"), String)

                'Checking for Null values
                SeeRecord.contact = Convert.ToString(reader("contact"))
                ValueIsNull = SeeRecord.contact.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.contact = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.contact = CType(reader("contact"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.mail_addr = Convert.ToString(reader("mail_addr"))
                ValueIsNull = SeeRecord.mail_addr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.mail_addr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.mail_addr = CType(reader("mail_addr"), String)
                    ValueIsNull = String.Empty
                End If


                SeeRecord.mail_city = CType(reader("mail_city"), String)
                SeeRecord.mail_state = CType(reader("mail_state"), String)
                SeeRecord.mail_zip = CType(reader("mail_zip"), String)

                'Checking for Null values
                SeeRecord.county = Convert.ToString(reader("county"))
                ValueIsNull = SeeRecord.county.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.county = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.county = CType(reader("county"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.church_email = Convert.ToString(reader("church_email"))
                ValueIsNull = SeeRecord.church_email.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.church_email = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.church_email = CType(reader("church_email"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values and assigning the mail city to location if blank
                SeeRecord.actual_location = Convert.ToString(reader("actual_location"))
                ValueIsNull = SeeRecord.actual_location.Trim
                If ValueIsNull = Nothing Then
                    'SeeRecord.actual_location = ""
                    SeeRecord.actual_location = CType(reader("mail_city"), String)
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.actual_location = CType(reader("actual_location"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.file_location = Convert.ToString(reader("file_location"))
                ValueIsNull = SeeRecord.file_location.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.file_location = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.file_location = CType(reader("file_location"), String)
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
                SeeRecord.contact_name = Convert.ToString(reader("contact_name"))
                ValueIsNull = SeeRecord.contact_name.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.contact_name = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.contact_name = CType(reader("contact_name"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.contact_number = Convert.ToString(reader("contact_number"))
                ValueIsNull = SeeRecord.contact_number.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.contact_number = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.contact_number = CType(reader("contact_number"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.agency_number = Convert.ToString(reader("agency_number"))
                ValueIsNull = SeeRecord.agency_number
                If ValueIsNull = Nothing Then
                    SeeRecord.agency_number = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.agency_number = CType(reader("agency_number"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.agency_name = Convert.ToString(reader("agency_name"))
                ValueIsNull = SeeRecord.agency_name.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.agency_name = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.agency_name = CType(reader("agency_name"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values and assigning the mail state to loc state if blank
                SeeRecord.loc_state = Convert.ToString(reader("loc_state"))
                ValueIsNull = SeeRecord.loc_state.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.loc_state = ""
                    'SeeRecord.loc_state = CType(reader("mail_state"), String)
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.loc_state = CType(reader("loc_state"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol1_date = Convert.ToString(reader("pol1_date"))
                ValueIsNull = SeeRecord.pol1_date.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol1_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol1_date = CType(reader("pol1_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol1_descr = Convert.ToString(reader("pol1_descr"))
                ValueIsNull = SeeRecord.pol1_descr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol1_descr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol1_descr = CType(reader("pol1_descr"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol2_date = Convert.ToString(reader("pol2_date"))
                ValueIsNull = SeeRecord.pol2_date.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol2_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol2_date = CType(reader("pol2_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol2_descr = Convert.ToString(reader("pol2_descr"))
                ValueIsNull = SeeRecord.pol2_descr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol2_descr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol2_descr = CType(reader("pol2_descr"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol3_date = Convert.ToString(reader("pol3_date"))
                ValueIsNull = SeeRecord.pol3_date.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol3_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol3_date = CType(reader("pol3_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol3_descr = Convert.ToString(reader("pol3_descr"))
                ValueIsNull = SeeRecord.pol3_descr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol3_descr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol3_descr = CType(reader("pol3_descr"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol4_date = Convert.ToString(reader("pol4_date"))
                ValueIsNull = SeeRecord.pol4_date.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol4_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol4_date = CType(reader("pol4_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol4_descr = Convert.ToString(reader("pol4_descr"))
                ValueIsNull = SeeRecord.pol4_descr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol4_descr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol4_descr = CType(reader("pol4_descr"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol5_date = Convert.ToString(reader("pol5_date"))
                ValueIsNull = SeeRecord.pol5_date.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol5_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol5_date = CType(reader("pol5_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.pol5_descr = Convert.ToString(reader("pol5_descr"))
                ValueIsNull = SeeRecord.pol5_descr.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.pol5_descr = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.pol5_descr = CType(reader("pol5_descr"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action1 = Convert.ToString(reader("action1"))
                ValueIsNull = SeeRecord.action1.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.action1 = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action1 = CType(reader("action1"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action1_date = Convert.ToString(reader("action1_date"))
                ValueIsNull = SeeRecord.action1_date
                If ValueIsNull = Nothing Then
                    SeeRecord.action1_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action1_date = CType(reader("action1_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action2 = Convert.ToString(reader("action2"))
                ValueIsNull = SeeRecord.action2.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.action2 = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action2 = CType(reader("action2"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action2_date = Convert.ToString(reader("action2_date"))
                ValueIsNull = SeeRecord.action2_date
                If ValueIsNull = Nothing Then
                    SeeRecord.action2_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action2_date = CType(reader("action2_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action3 = Convert.ToString(reader("action3"))
                ValueIsNull = SeeRecord.action3.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.action3 = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action3 = CType(reader("action3"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action3_date = Convert.ToString(reader("action3_date"))
                ValueIsNull = SeeRecord.action3_date
                If ValueIsNull = Nothing Then
                    SeeRecord.action3_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action3_date = CType(reader("action3_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action4 = Convert.ToString(reader("action4"))
                ValueIsNull = SeeRecord.action4.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.action4 = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action4 = CType(reader("action4"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action4_date = Convert.ToString(reader("action4_date"))
                ValueIsNull = SeeRecord.action4_date
                If ValueIsNull = Nothing Then
                    SeeRecord.action4_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action4_date = CType(reader("action4_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action5 = Convert.ToString(reader("action5"))
                ValueIsNull = SeeRecord.action5.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.action5 = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action5 = CType(reader("action5"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Nulls values
                SeeRecord.action5_date = Convert.ToString(reader("action5_date"))
                ValueIsNull = SeeRecord.action5_date
                If ValueIsNull = Nothing Then
                    SeeRecord.action5_date = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.action5_date = CType(reader("action5_date"), String)
                    ValueIsNull = String.Empty
                End If

                'Checking for Null values
                SeeRecord.comments = Convert.ToString(reader("comments"))
                ValueIsNull = SeeRecord.comments.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.comments = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.comments = CType(reader("comments"), String)
                    ValueIsNull = String.Empty
                End If
                Records.Add(SeeRecord)
            End While
        End Using
        Return Records
        'End Using
    End Function

    Public Shared Sub UpdateRecord(ByVal CustNo As String, ByVal CustStatus As String, ByVal proxy_init As String, ByVal InsuredName As String, ByVal Contact As String, ByVal MailAddress As String, ByVal MailCity As String, ByVal MailState As String, ByVal MailZip As String, ByVal County As String, ByVal ChurchEmail As String, ByVal Location As String, ByVal State As String, ByVal file_location As String, ByVal ContactName As String, ByVal ContactNumber As String, ByVal AgencyNumber As String, ByVal EffDate1 As String, ByVal Desc1 As String, ByVal EffDate2 As String, ByVal Desc2 As String, ByVal EffDate3 As String, ByVal Desc3 As String, ByVal EffDate4 As String, ByVal Desc4 As String, ByVal EffDate5 As String, ByVal Desc5 As String, ByVal Action1 As String, ByVal ActionDate1 As String, ByVal Action2 As String, ByVal ActionDate2 As String, ByVal Action3 As String, ByVal ActionDate3 As String, ByVal Action4 As String, ByVal ActionDate4 As String, ByVal Action5 As String, ByVal ActionDate5 As String, ByVal Comments As String)

        'UPDATE acctinfo SET cust_status='Canceled' WHERE cust_status='Cancel';
        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "UPDATE acctinfo SET cust_status=@CustStatus, proxy_init=@proxy_init, insured_name=@InsuredName, contact=@Contact, mail_addr=@MailAddress, mail_city=@MailCity, mail_state=@MailState, mail_zip=@MailZip, county=@County, actual_location=@Location, loc_state=@State, file_location=@file_location, church_email=@ChurchEmail, contact_name=@ContactName, contact_number=@ContactNumber, agency_number=@AgencyNumber, pol1_date=@EffDate1, pol1_descr=@Desc1, pol2_date=@EffDate2, pol2_descr=@Desc2, pol3_date=@EffDate3, pol3_descr=@Desc3, pol4_date=@EffDate4, pol4_descr=@Desc4, pol5_date=@EffDate5, pol5_descr=@Desc5, action1=@Action1, action1_date=@ActionDate1, action2=@Action2, action2_date=@ActionDate2, action3=@Action3, action3_date=@ActionDate3, action4=@Action4, action4_date=@ActionDate4, action5=@Action5, action5_date=@ActionDate5, comments=@Comments WHERE cust_no=@CustNo"
        cmd.Parameters.AddWithValue("@CustNo", CustNo)
        cmd.Parameters.AddWithValue("@CustStatus", CustStatus)
        cmd.Parameters.AddWithValue("@proxy_init", proxy_init)
        cmd.Parameters.AddWithValue("@InsuredName", InsuredName)
        cmd.Parameters.AddWithValue("@Contact", Contact)
        cmd.Parameters.AddWithValue("@MailAddress", MailAddress)
        cmd.Parameters.AddWithValue("@MailCity", MailCity)
        cmd.Parameters.AddWithValue("@MailState", MailState)
        cmd.Parameters.AddWithValue("@MailZip", MailZip)
        cmd.Parameters.AddWithValue("@County", County)
        cmd.Parameters.AddWithValue("@Location", Location)
        cmd.Parameters.AddWithValue("@State", State)
        cmd.Parameters.AddWithValue("@file_location", file_location)
        cmd.Parameters.AddWithValue("@ChurchEmail", ChurchEmail)
        cmd.Parameters.AddWithValue("@ContactName", DBNull.Value)
        cmd.Parameters.AddWithValue("@ContactNumber", DBNull.Value)
        cmd.Parameters.AddWithValue("@AgencyNumber", AgencyNumber)
        cmd.Parameters.AddWithValue("@EffDate1", EffDate1)
        cmd.Parameters.AddWithValue("@Desc1", Desc1)
        cmd.Parameters.AddWithValue("@EffDate2", EffDate2)
        cmd.Parameters.AddWithValue("@Desc2", Desc2)
        cmd.Parameters.AddWithValue("@EffDate3", EffDate3)
        cmd.Parameters.AddWithValue("@Desc3", Desc3)
        cmd.Parameters.AddWithValue("@EffDate4", EffDate4)
        cmd.Parameters.AddWithValue("@Desc4", Desc4)
        cmd.Parameters.AddWithValue("@EffDate5", EffDate5)
        cmd.Parameters.AddWithValue("@Desc5", Desc5)
        cmd.Parameters.AddWithValue("@Action1", Action1)
        cmd.Parameters.AddWithValue("@ActionDate1", ActionDate1)
        cmd.Parameters.AddWithValue("@Action2", Action2)
        cmd.Parameters.AddWithValue("@ActionDate2", ActionDate2)
        cmd.Parameters.AddWithValue("@Action3", Action3)
        cmd.Parameters.AddWithValue("@ActionDate3", ActionDate3)
        cmd.Parameters.AddWithValue("@Action4", Action4)
        cmd.Parameters.AddWithValue("@ActionDate4", ActionDate4)
        cmd.Parameters.AddWithValue("@Action5", Action5)
        cmd.Parameters.AddWithValue("@ActionDate5", ActionDate5)
        cmd.Parameters.AddWithValue("@Comments", Comments)

        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub UpdateRecord2(ByVal cust_no As String, ByVal cust_status As String, ByVal proxy_init As String, ByVal insured_name As String, ByVal contact As String, ByVal mail_addr As String, ByVal mail_city As String, ByVal mail_state As String, ByVal mail_zip As String, ByVal county As String, ByVal actual_location As String, ByVal loc_state As String, ByVal file_location As String, ByVal contact_name As String, ByVal contact_number As String, ByVal agency_number As String, ByVal pol1_date As String, ByVal pol1_descr As String, ByVal pol2_date As String, ByVal pol2_descr As String, ByVal pol3_date As String, ByVal pol3_descr As String, ByVal pol4_date As String, ByVal pol4_descr As String, ByVal pol5_date As String, ByVal pol5_descr As String, ByVal action1 As String, ByVal action1_date As String, ByVal action2 As String, ByVal action2_date As String, ByVal action3 As String, ByVal action3_date As String, ByVal action4 As String, ByVal action4_date As String, ByVal action5 As String, ByVal action5_date As String, ByVal comments As String)

        'UPDATE acctinfo SET cust_status='Canceled' WHERE cust_status='Cancel';
        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "UPDATE acctinfo SET cust_status=@cust_status, proxy_init=@proxy_init, insured_name=UPPER(@insured_name), contact=@contact, mail_addr=@mail_addr, mail_city=@mail_city, mail_state=@mail_state, mail_zip=@mail_zip, county=@County, actual_location=@actual_location, loc_state=@loc_state, file_location=@file_location, contact_name=@contact_name, contact_number=@contact_number, agency_number=@agency_number, pol1_date=@pol1_date, pol1_descr=@pol1_descr, pol2_date=@pol2_date, pol2_descr=@pol2_descr, pol3_date=@pol3_date, pol3_descr=@pol3_descr, pol4_date=@pol4_date, pol4_descr=@pol4_descr, pol5_date=@pol5_date, pol5_descr=@pol5_descr, action1=@action1, action1_date=@action1_date, action2=@action2, action2_date=@action2_date, action3=@Action3, action3_date=@action3_date, action4=@action4, action4_date=@action4_date, action5=@action5, action5_date=@action5_date, comments=@Comments WHERE cust_no=@cust_no"
        cmd.Parameters.AddWithValue("@cust_no", cust_no)
        cmd.Parameters.AddWithValue("@cust_status", cust_status)
        cmd.Parameters.AddWithValue("@proxy_init", proxy_init)
        cmd.Parameters.AddWithValue("@insured_name", insured_name)
        cmd.Parameters.AddWithValue("@contact", contact).ToString.ToUpper()
        cmd.Parameters.AddWithValue("@mail_addr", mail_addr)
        cmd.Parameters.AddWithValue("@mail_city", mail_city)
        cmd.Parameters.AddWithValue("@mail_state", mail_state)
        cmd.Parameters.AddWithValue("@mail_zip", mail_zip)
        cmd.Parameters.AddWithValue("@county", county)
        cmd.Parameters.AddWithValue("@actual_location", actual_location)
        cmd.Parameters.AddWithValue("@loc_state", loc_state)
        cmd.Parameters.AddWithValue("@file_location", file_location)
        cmd.Parameters.AddWithValue("@contact_name", contact_name).ToString.ToUpper()
        cmd.Parameters.AddWithValue("@contact_number", contact_number)
        cmd.Parameters.AddWithValue("@agency_number", agency_number)
        cmd.Parameters.AddWithValue("@pol1_date", pol1_date)
        cmd.Parameters.AddWithValue("@pol1_descr", pol1_descr)
        cmd.Parameters.AddWithValue("@pol2_date", pol2_date)
        cmd.Parameters.AddWithValue("@pol2_descr", pol2_descr)
        cmd.Parameters.AddWithValue("@pol3_date", pol3_date)
        cmd.Parameters.AddWithValue("@pol3_descr", pol3_descr)
        cmd.Parameters.AddWithValue("@pol4_date", pol4_date)
        cmd.Parameters.AddWithValue("@pol4_descr", pol4_descr)
        cmd.Parameters.AddWithValue("@pol5_date", pol5_date)
        cmd.Parameters.AddWithValue("@pol5_descr", pol5_descr)
        cmd.Parameters.AddWithValue("@action1", action1)
        cmd.Parameters.AddWithValue("@action1_date", action1_date)
        cmd.Parameters.AddWithValue("@action2", action2)
        cmd.Parameters.AddWithValue("@action2_date", action2_date)
        cmd.Parameters.AddWithValue("@action3", action3)
        cmd.Parameters.AddWithValue("@action3_date", action3_date)
        cmd.Parameters.AddWithValue("@action4", action4)
        cmd.Parameters.AddWithValue("@action4_date", action4_date)
        cmd.Parameters.AddWithValue("@action5", action5)
        cmd.Parameters.AddWithValue("@action5_date", action5_date)
        cmd.Parameters.AddWithValue("@Comments", comments)

        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub UpdateRecord3(ByVal cust_no As String, ByVal cust_status As String, ByVal file_location As String)

        'UPDATE acctinfo SET cust_status='Canceled' WHERE cust_status='Cancel';
        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "UPDATE acctinfo SET cust_status=@cust_status, file_location=@file_location WHERE cust_no=@cust_no"
        cmd.Parameters.AddWithValue("@cust_no", cust_no)
        cmd.Parameters.AddWithValue("@cust_status", cust_status)
        cmd.Parameters.AddWithValue("@file_location", file_location)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub UpdateContacts(ByVal contact_id As Integer, ByVal full_name As String, ByVal church_number As String, ByVal cell_phone As String, ByVal department_id As Integer, ByVal email As String, ByVal notes As String, ByVal last_update As Date)

        'UPDATE acctinfo SET cust_status='Canceled' WHERE cust_status='Cancel';
        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "UPDATE Contacts SET full_name=@fullname, church_number=@churchnum, cell_phone=@cellphone, department_id=@departmentId, email=@email, notes=@notes, LastUpdate=@last_update WHERE contact_id=@contact_id"

        cmd.Parameters.AddWithValue("@contact_id", contact_id)

        cmd.Parameters.AddWithValue("@fullname", full_name.ToUpper)

        'cmd.Parameters.AddWithValue("@custnum", cust_no)

        If church_number Is Nothing Then
            cmd.Parameters.AddWithValue("@churchnum", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@churchnum", church_number)
        End If

        If cell_phone Is Nothing Then
            cmd.Parameters.AddWithValue("@cellphone", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@cellphone", cell_phone)
        End If

        If email Is Nothing Then
            cmd.Parameters.AddWithValue("@email", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@email", email)
        End If

        cmd.Parameters.AddWithValue("@departmentId", department_id)

        If notes Is Nothing Then
            cmd.Parameters.AddWithValue("@notes", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@notes", notes.ToUpper)
        End If

        cmd.Parameters.AddWithValue("@last_update", Date.Today)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub


    Public Shared Sub DeleteCandleRecord(ByVal candleId As Integer)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)

        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "DELETE CandleSafety WHERE CandleID=@candleId"
        cmd.CommandType = CommandType.Text

        'Add parameter
        cmd.Parameters.AddWithValue("@candleId", candleId)

        'Execute command
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub DeleteDesignatedPerson(ByVal designateid As Integer)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)

        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "DELETE Designate WHERE DesignateID=@DesiId"
        cmd.CommandType = CommandType.Text

        'Add parameter
        cmd.Parameters.AddWithValue("@DesiId", designateid)

        'Execute command
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub


    Public Shared Sub DeleteRecord(ByVal cust_no As String)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)

        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "DELETE acctinfo WHERE cust_no=@cust_no"
        cmd.CommandType = CommandType.Text

        'Add parameter
        cmd.Parameters.AddWithValue("@cust_no", cust_no)

        'Execute command
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub DeleteNewBusiness(ByVal Newbusid As Integer)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)

        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "DELETE newbus WHERE newbus_id=@Id"
        cmd.CommandType = CommandType.Text

        'Add parameter
        cmd.Parameters.AddWithValue("@Id", Newbusid)

        'Execute command
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub DeleteContact(ByVal contact_id As Integer)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)

        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "DELETE Contacts WHERE contact_id=@contactId"
        cmd.CommandType = CommandType.Text

        'Add parameter
        cmd.Parameters.AddWithValue("@contactId", contact_id)

        'Execute command
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    Public Shared Sub DeleteAllContacts(ByVal cust_no As String)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)

        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "DELETE Contacts WHERE cust_no=@custno"
        cmd.CommandType = CommandType.Text

        'Add parameter
        cmd.Parameters.AddWithValue("@custno", cust_no)

        'Execute command
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    '<System.Web.Script.Services.ScriptMethod(), _
    'System.Web.Services.WebMethod()> _
    'Public Shared Function SearchCustomers(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
    '    Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
    '    Dim con As SqlConnection = New SqlConnection(MyConnection)

    '    Dim cmd As SqlCommand = New SqlCommand()
    '    cmd.Connection = con
    '    cmd.CommandText = "select insured_name from acctinfo where insured_name like @SearchText + '%'"
    '    cmd.Parameters.AddWithValue("@SearchText", prefixText)

    '    con.Open()

    '    Dim accounts As List(Of String) = New List(Of String)
    '    Dim sdr As SqlDataReader = cmd.ExecuteReader
    '    While sdr.Read
    '        accounts.Add(sdr("ContactName").ToString)
    '    End While

    '    con.Close()

    '    Return accounts

    'End Function


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function SelectNewBusiness(ByVal QuoteDate As String, ByVal CurrentDate As String, ByVal Agent As String, ByVal ChurchName As String, ByVal Location As String, ByVal MyCarrier As String, ByVal LossControl As String, ByVal Underwriter As String, ByVal RequestNo As String) As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        ''This code was supposedly checking or stopping future date searches, but
        ''if Zion Grove is seached the app has an error in this section of code.
        ''4/24/2015 - 4/27/2015

        'If (String.IsNullOrEmpty(QuoteDate)) = False Then
        '    cmd.Parameters.AddWithValue("@qDate", QuoteDate)
        'ElseIf QuoteDate > Date.Today Then
        '    cmd.Parameters.AddWithValue("@qDate", DBNull.Value)
        'Else
        '    cmd.Parameters.AddWithValue("@qDate", DBNull.Value)
        'End If

        If (String.IsNullOrEmpty(QuoteDate)) = False Then
            cmd.Parameters.AddWithValue("@qDate", QuoteDate)
        Else
            cmd.Parameters.AddWithValue("@qDate", DBNull.Value)
        End If


        If (String.IsNullOrEmpty(CurrentDate)) = False Then
            cmd.Parameters.AddWithValue("@cDate", CurrentDate)
        Else
            cmd.Parameters.AddWithValue("@cDate", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(Agent)) = False Then
            cmd.Parameters.AddWithValue("@tAgent", Agent)
        Else
            cmd.Parameters.AddWithValue("@tAgent", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(ChurchName)) = False Then
            cmd.Parameters.AddWithValue("@church", ChurchName)
        Else
            cmd.Parameters.AddWithValue("@church", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(Location)) = False Then
            cmd.Parameters.AddWithValue("@loc", Location)
        Else
            cmd.Parameters.AddWithValue("@loc", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(MyCarrier)) = False Then
            cmd.Parameters.AddWithValue("@carrier", MyCarrier)
        Else
            cmd.Parameters.AddWithValue("@carrier", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(LossControl)) = False Then
            cmd.Parameters.AddWithValue("@loss", LossControl)
        Else
            cmd.Parameters.AddWithValue("@loss", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(Underwriter)) = False Then
            cmd.Parameters.AddWithValue("@under", Underwriter)
        Else
            cmd.Parameters.AddWithValue("@under", DBNull.Value)
        End If

        If (String.IsNullOrEmpty(RequestNo)) = False Then
            cmd.Parameters.AddWithValue("@request", RequestNo)
        Else
            cmd.Parameters.AddWithValue("@request", DBNull.Value)
        End If

        'cmd.CommandText = "SELECT quote_date, curr_date, church, location, state, agent, loss_control, uw, carrier, curr_prem, smp_quoted, umb_quoted, ba_quoted, wc_quoted, not_written, reason, date_written, smp_written, umb_written, ba_written, wc_written, smp_prem, umb_prem, ba_prem, wc_prem, seacoast, seacoast_exp, irpm_factor, cust_no, decline_date, request_no, insp_appt FROM newbus WHERE agent LIKE '%' + @tAgent + '%'"
        cmd.CommandText = "SELECT newbus.quote_date, newbus.curr_date, newbus.church, newbus.location, newbus.state, newbus.agent, newbus.loss_control, newbus.uw, newbus.carrier, newbus.curr_prem, newbus.smp_quoted, newbus.umb_quoted, newbus.ba_quoted, newbus.wc_quoted, newbus.not_written, newbus.reason, newbus.date_written, newbus.smp_written, newbus.umb_written, newbus.ba_written, newbus.wc_written, newbus.smp_prem, newbus.umb_prem, newbus.ba_prem, newbus.wc_prem, newbus.seacoast, newbus.seacoast_exp, newbus.irpm_factor, newbus.cust_no, newbus.decline_date, newbus.request_no, newbus.insp_appt, newbus.newbus_id, FileLocation.FullName FROM newbus INNER JOIN FileLocation ON newbus.uw = FileLocation.file_location WHERE (quote_date = @qDate OR @qDate IS NULL) AND (curr_date = @cDate OR @cDate IS NULL) AND (agent LIKE @tAgent + '%' OR @tAgent IS NULL) AND (church LIKE @church + '%' OR @church IS NULL) AND (Location LIKE @loc + '%' OR @loc IS NULL) AND (carrier LIKE @carrier + '%' OR @carrier IS NULL) AND (loss_control LIKE @loss + '%' OR @loss IS NULL) AND (uw LIKE @under + '%' OR @under IS NULL) AND (request_no LIKE @request + '%' OR @request IS NULL) ORDER BY quote_date DESC"

        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _NewBusiness()
                SeeRecord.NewbusId = CType(reader("newbus_id"), Integer)

                'Checking for Null values
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
                SeeRecord.Agent = Convert.ToString(reader("agent"))
                ValueIsNull = SeeRecord.Agent.Trim
                If ValueIsNull = Nothing Then
                    SeeRecord.Agent = ""
                    ValueIsNull = String.Empty
                Else
                    SeeRecord.Agent = CType(reader("agent"), String)
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
                ValueIsNull = SeeRecord.LossControl.Trim
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
                SeeRecord.IrpmFactor = Convert.ToDecimal(reader("irpm_factor"))
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
    Public Shared Function GetNewBusiness(ByVal newBusId As Integer) As List(Of _NewBusiness)
        Dim Records As New List(Of _NewBusiness)()
        Dim ValueIsNull As String

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.Parameters.AddWithValue("@Id", newBusId)
        cmd.CommandText = "SELECT newbus.newbus_id, newbus.quote_date, newbus.curr_date, newbus.church, newbus.location, newbus.state, newbus.agent, newbus.loss_control, newbus.uw, newbus.carrier, newbus.curr_prem, newbus.smp_quoted, newbus.umb_quoted, newbus.ba_quoted, newbus.wc_quoted, newbus.not_written, newbus.reason, newbus.date_written, newbus.smp_written, newbus.umb_written, newbus.ba_written, newbus.wc_written, newbus.smp_prem, newbus.umb_prem, newbus.ba_prem, newbus.wc_prem, newbus.seacoast, newbus.seacoast_exp, newbus.irpm_factor, newbus.cust_no, newbus.decline_date, newbus.request_no, newbus.insp_appt, FileLocation.FullName FROM newbus INNER JOIN FileLocation ON newbus.uw = FileLocation.file_location OR newbus.loss_control = FileLocation.file_location WHERE newbus_id = @Id"

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

    Public Shared Sub UpdateNewBusiness(ByVal Newbusid As String, ByVal QuoteDate As String, ByVal CurrDate As String, ByVal Church As String, ByVal Location As String, ByVal State As String, ByVal Agent As String, ByVal LossControl As String, ByVal UW As String, ByVal Carrier As String, ByVal CurrPrem As String, ByVal DeclineDate As String, ByVal SmpQuoted As String, ByVal UmbQuoted As String, ByVal BaQuoted As String, ByVal WcQuoted As String, ByVal NotWritten As String, ByVal Reason As String, ByVal DateWritten As String, ByVal SmpWritten As String, ByVal UmbWritten As String, ByVal BaWritten As String, ByVal WcWritten As String, ByVal SmpPrem As String, ByVal UmbPrem As String, ByVal BaPrem As String, ByVal WcPrem As String, ByVal Seacoast As String, ByVal SeacoastExp As String, ByVal IrpmFactor As String, ByVal CustNo As String, ByVal RequestNo As String, ByVal InspAppt As String)

        'UPDATE newbus SET agent = '000' + agent WHERE LEN(agent) = 4
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "UPDATE newbus SET quote_date=@QuoteDate, curr_date=@CurrDate, church=UPPER(@Church), location=@Location, state=@State, agent=@Agent, loss_control=@LossControl, uw=@UW, carrier=@Carrier, curr_prem=@CurrPrem, decline_date=@DeclineDate, smp_quoted=@SmpQuoted, umb_quoted=@UmbQuoted, ba_quoted=@BaQuoted, wc_quoted=@WcQuoted, not_written=@NotWritten, reason=@Reason, date_written=@DateWritten, smp_written=@SmpWritten, umb_written=@UmbWritten, ba_written=@BaWritten, wc_written=@WcWritten, smp_prem=@SmpPrem, umb_prem=@UmbPrem, ba_prem=@BaPrem, wc_prem=@WcPrem, seacoast=@Seacoast, seacoast_exp=@SeacoastExp, irpm_factor=@IrpmFactor, cust_no=@CustNo, request_no=@RequestNo, insp_appt=@InspAppt WHERE newbus_id=@Newbusid"
        cmd.Parameters.AddWithValue("@Newbusid", Newbusid)
        cmd.Parameters.AddWithValue("@QuoteDate", QuoteDate)
        cmd.Parameters.AddWithValue("@CurrDate", CurrDate)
        cmd.Parameters.AddWithValue("@Church", Church)
        cmd.Parameters.AddWithValue("@Location", Location)
        cmd.Parameters.AddWithValue("@State", State)
        cmd.Parameters.AddWithValue("@Agent", Agent)
        cmd.Parameters.AddWithValue("@LossControl", LossControl)
        cmd.Parameters.AddWithValue("@UW", UW)
        cmd.Parameters.AddWithValue("@Carrier", Carrier)
        cmd.Parameters.AddWithValue("@CurrPrem", CurrPrem)
        cmd.Parameters.AddWithValue("@DeclineDate", DeclineDate)
        cmd.Parameters.AddWithValue("@SmpQuoted", SmpQuoted)
        cmd.Parameters.AddWithValue("@UmbQuoted", UmbQuoted)
        cmd.Parameters.AddWithValue("@BaQuoted", BaQuoted)
        cmd.Parameters.AddWithValue("@WcQuoted", WcQuoted)
        cmd.Parameters.AddWithValue("@NotWritten", NotWritten)
        cmd.Parameters.AddWithValue("@Reason", Reason)
        cmd.Parameters.AddWithValue("@DateWritten", DateWritten)
        cmd.Parameters.AddWithValue("@SmpWritten", SmpWritten)
        cmd.Parameters.AddWithValue("@UmbWritten", UmbWritten)
        cmd.Parameters.AddWithValue("@BaWritten", BaWritten)
        cmd.Parameters.AddWithValue("@WcWritten", WcWritten)
        cmd.Parameters.AddWithValue("@SmpPrem", SmpPrem)
        cmd.Parameters.AddWithValue("@UmbPrem", UmbPrem)
        cmd.Parameters.AddWithValue("@BaPrem", BaPrem)
        cmd.Parameters.AddWithValue("@WcPrem", WcPrem)
        cmd.Parameters.AddWithValue("@Seacoast", Seacoast)
        cmd.Parameters.AddWithValue("@SeacoastExp", SeacoastExp)
        cmd.Parameters.AddWithValue("@IrpmFactor", IrpmFactor)
        cmd.Parameters.AddWithValue("@CustNo", CustNo)
        cmd.Parameters.AddWithValue("@RequestNo", RequestNo)
        cmd.Parameters.AddWithValue("@InspAppt", InspAppt)

        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub


    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Function GetNothing(ByVal newBusId As Integer) As List(Of _NewBusiness)
        Return Nothing
    End Function

End Class
