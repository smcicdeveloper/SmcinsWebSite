Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports smci.policyholders
Imports smci.agents
Imports smci.employees
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.IO
Imports Microsoft.VisualBasic
Imports System.Web.Configuration
Imports smci.SetVaribles


Namespace smci.SqlAccessLayer


    Public Class MySqlCode

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

        Public Shared Function GetMembers(ByVal BoardAlbumID As Integer) As Generic.List(Of BoardPhoto)
            Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
                Using command As New SqlCommand("GetMembers", connection)
                    command.CommandType = CommandType.StoredProcedure
                    command.Parameters.Add(New SqlParameter("@BoardAlbumID", BoardAlbumID))
                    Dim Filter As Boolean = Not (HttpContext.Current.User.IsInRole("Friends") Or HttpContext.Current.User.IsInRole("Administrators"))
                    command.Parameters.Add(New SqlParameter("@IsPublic", Filter))
                    connection.Open()
                    Dim list As New Generic.List(Of BoardPhoto)()
                    Using reader As SqlDataReader = command.ExecuteReader()
                        Do While (reader.Read())
                            Dim temp As New BoardPhoto(CInt(reader("BoardPhotoID")), CInt(reader("BoardAlbumID")), CStr(reader("FullName")), CStr(reader("Description")))
                            list.Add(temp)
                        Loop
                    End Using
                    Return list
                End Using
            End Using
        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetAgentTerritory(ByVal CountyName As String, ByVal StateId As String) As List(Of AgentTerritories)
            Dim TheCountyList As New List(Of AgentTerritories)()

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.Parameters.Add("@CountyName", SqlDbType.NVarChar).Value = CountyName
            cmd.Parameters.Add("@StateId", SqlDbType.NVarChar).Value = StateId
            cmd.CommandText = "SELECT AgentTerritories.AGENT_NUMBER AS Agentnum, AgencyBusinessInformation.NAME_OF_AGENCY AS Nameofagency, AgencyProfileInformation.FIRST_NAME + ' ' + AgencyProfileInformation.LAST_NAME AS Fullname, AgencyAddressInformation.ADDRESS AS Address, AgencyAddressInformation.CITY AS City, AgencyAddressInformation.STATE AS State, AgencyAddressInformation.ZIP AS Zip, AgencyAddressInformation.PHONE AS Phone, AgencyProfileInformation.EMAIL AS Email, AgentTerritories.COUNTY FROM AgencyBusinessInformation INNER JOIN AgencyProfileInformation ON AgencyBusinessInformation.AGENT_NUMBER = AgencyProfileInformation.AGENT_NUMBER INNER JOIN AgencyAddressInformation ON AgencyProfileInformation.AGENT_NUMBER = AgencyAddressInformation.AGENT_NUMBER INNER JOIN AgentTerritories ON AgencyBusinessInformation.AGENT_NUMBER = AgentTerritories.AGENT_NUMBER WHERE (AgentTerritories.COUNTY = @CountyName) AND AgentTerritories.STATE_ID = @StateId"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeeCountyList As New AgentTerritories()
                    SeeCountyList.Agentnum = CType(reader("Agentnum"), String)
                    SeeCountyList.Nameofagency = CType(reader("Nameofagency"), String)
                    SeeCountyList.Fullname = CType(reader("Fullname"), String)
                    SeeCountyList.Address = CType(reader("Address"), String)
                    SeeCountyList.City = CType(reader("City"), String)
                    SeeCountyList.State = CType(reader("State"), String)
                    SeeCountyList.Zip = CType(reader("Zip"), String)
                    SeeCountyList.Phone = CType(reader("Phone"), String)
                    SeeCountyList.Email = CType(reader("Email"), String)

                    TheCountyList.Add(SeeCountyList)
                End While
            End Using
            Return TheCountyList
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetState() As List(Of StateList)
            Dim TheStateList As New List(Of StateList)()

            Dim con As SqlConnection = New SqlConnection(_connectionString)
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
        Public Function GetCounty(ByVal StateId As String) As List(Of CountyList)
            Dim TheCountyList As New List(Of CountyList)()

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.Parameters.Add("@StateId", SqlDbType.NVarChar).Value = StateId
            cmd.CommandText = "SELECT STATE_ID, COUNTY FROM CountyList WHERE STATE_ID = @StateId ORDER BY COUNTY"
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
        Public Function ReadAgencyInfo() As List(Of Agency)
            Dim AgencyRecord As New List(Of Agency)()

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT AgencyBusinessInformation.AGENT_NUMBER, AgencyAddressInformation.ADDRESS, AgencyAddressInformation.CITY, AgencyAddressInformation.STATE, AgencyAddressInformation.ZIP, AgencyAddressInformation.MAILING_ADDRESS, AgencyAddressInformation.PHONE, AgencyProfileInformation.FIRST_NAME + ' ' + AgencyProfileInformation.LAST_NAME As FULL_NAME FROM AgencyAddressInformation INNER JOIN AgencyBusinessInformation ON AgencyAddressInformation.AGENT_NUMBER = AgencyBusinessInformation.AGENT_NUMBER INNER JOIN AgencyProfileInformation ON AgencyBusinessInformation.AGENT_NUMBER = AgencyProfileInformation.AGENT_NUMBER"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim SeeAgencyRecord As New Agency()
                    SeeAgencyRecord.Agentnumber = CType(reader("AGENT_NUMBER"), String)
                    SeeAgencyRecord.Fullname = CType(reader("FULL_NAME"), String)
                    SeeAgencyRecord.Address = CType(reader("ADDRESS"), String)
                    SeeAgencyRecord.Mailaddress = CType(reader("MAILING_ADDRESS"), String)
                    SeeAgencyRecord.City = CType(reader("CITY"), String)
                    SeeAgencyRecord.State = CType(reader("STATE"), String)
                    SeeAgencyRecord.Zip = CType(reader("ZIP"), String)
                    SeeAgencyRecord.Phone = CType(reader("PHONE"), String)
                    AgencyRecord.Add(SeeAgencyRecord)
                End While
            End Using
            Return AgencyRecord
        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function MyProductionSummary(ByVal UserNameIs As String) As List(Of vw_agysummary)
            Dim TheStats As New List(Of vw_agysummary)()

            Dim con As SqlConnection = New SqlConnection(_conString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            'cmd.CommandText = "SELECT agent, mtd_prem, ytd_prem, earned_prem, inforce_prem, curr_resv, prior_resv, paid_ytd, lae_curr_resv, lae_prior_resv, lae_paid_ytd FROM vw_agysummary WHERE agent = @UserNameIs"
            cmd.CommandText = "SELECT agent, mtd_prem, ytd_prem, earned_prem, inforce_prem, curr_resv, prior_resv, paid_ytd, lae_curr_resv, lae_prior_resv, lae_paid_ytd, (paid_ytd + curr_resv + lae_paid_ytd + lae_curr_resv - prior_resv - lae_prior_resv) As total_Incurred FROM vw_agysummary WHERE agent = @UserNameIs"
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
        Public Function AllProductionSummary(ByVal UserNameIs As String) As List(Of vw_agysummary)
            Dim TheStats As New List(Of vw_agysummary)()

            Dim con As SqlConnection = New SqlConnection(_conString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
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
                    Dim agentNum As String = CType(reader("agent"), String)
                    If agentNum = "0" Then
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


        Public Shared Sub InsertStep1(ByVal Agentnumber As String, ByVal Nameofagency As String, ByVal Fileas As String, ByVal Fid As String, ByVal Licensenum As String, ByVal Npn As String, ByVal Contingency As Decimal, ByVal Cancellationdate As Date, ByVal Activedate As Date, ByVal Copyoflicense As String, ByVal Recorddate As Date)

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "spInsertAgencyBusinessRecord"
            cmd.CommandType = CommandType.StoredProcedure


            cmd.Parameters.AddWithValue("@Agentnumber", Agentnumber)
            cmd.Parameters.AddWithValue("@Nameofagency", Nameofagency)
            cmd.Parameters.AddWithValue("@Fileas", Fileas)
            cmd.Parameters.AddWithValue("@Fid", Fid)
            cmd.Parameters.AddWithValue("@Licensenum", Licensenum)
            cmd.Parameters.AddWithValue("@Npn", Npn)
            cmd.Parameters.AddWithValue("@Contingency", Contingency)
            cmd.Parameters.AddWithValue("@Cancellationdate", Cancellationdate)
            cmd.Parameters.AddWithValue("@Activedate", Activedate)
            cmd.Parameters.AddWithValue("@Copyoflicense", Copyoflicense)
            cmd.Parameters.AddWithValue("@Recorddate", Recorddate)

            cmd.Parameters.Add(New SqlParameter("@Result", SqlDbType.Int))
            cmd.Parameters("@Result").Direction = ParameterDirection.ReturnValue
            Dim commandResult As Integer = 1

            Try
                con.Open()
                cmd.ExecuteNonQuery()
                commandResult = CType(cmd.Parameters("@Result").Value, Integer)
            Catch ex As SqlException
                commandResult = ex.Number
            Finally
                con.Close()
            End Try

            'Step1.Save()
        End Sub


        Public Shared Sub InsertStep2_PhysicalAddress(ByVal Agentnumber As String, ByVal Address As String, ByVal City As String, ByVal State As String, ByVal Zip As Integer, ByVal Mailaddress As String, ByVal Mailcity As String, ByVal Mailstate As String, ByVal Mailzip As Integer, ByVal Phone As String, ByVal Fax As String, ByVal Tollfreenumber As String, ByVal Dateofchange As Date, ByVal Recorddate As Date)

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "spInsertAddress"
            cmd.CommandType = CommandType.StoredProcedure


            cmd.Parameters.AddWithValue("@Agentnumber", Agentnumber)
            cmd.Parameters.AddWithValue("@Address", Address)
            cmd.Parameters.AddWithValue("@City", City)
            cmd.Parameters.AddWithValue("@State", State)
            cmd.Parameters.AddWithValue("@Zip", Zip)
            cmd.Parameters.AddWithValue("@Mailaddress", Mailaddress)
            cmd.Parameters.AddWithValue("@MailCity", Mailcity)
            cmd.Parameters.AddWithValue("@Mailstate", Mailstate)
            cmd.Parameters.AddWithValue("@Mailzip", Mailzip)
            cmd.Parameters.AddWithValue("@Phone", Phone)
            cmd.Parameters.AddWithValue("@Fax", Fax)
            cmd.Parameters.AddWithValue("@Tollfreenumber", Tollfreenumber)
            cmd.Parameters.AddWithValue("@Dateofchange", Dateofchange)
            cmd.Parameters.AddWithValue("@Recorddate", Recorddate)

            cmd.Parameters.Add(New SqlParameter("@Result", SqlDbType.Int))
            cmd.Parameters("@Result").Direction = ParameterDirection.ReturnValue
            Dim commandResult As Integer = 1

            Try
                con.Open()
                cmd.ExecuteNonQuery()
                commandResult = CType(cmd.Parameters("@Result").Value, Integer)
            Catch ex As SqlException
                commandResult = ex.Number
            Finally
                con.Close()
            End Try

            'Step1.Save()
        End Sub


        Public Shared Sub InsertStep3_Profile(ByVal Agentnumber As String, ByVal Firstname As String, ByVal Lastname As String, ByVal Cellnumber As String, ByVal Email As String, ByVal Dateofchange As Date, ByVal Recorddate As Date)

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "spInsertContact"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@Agentnumber", Agentnumber)
            cmd.Parameters.AddWithValue("@Firstname", Firstname)
            cmd.Parameters.AddWithValue("@Lastname", Lastname)
            cmd.Parameters.AddWithValue("@Cellnumber", Cellnumber)
            cmd.Parameters.AddWithValue("@Email", Email)
            cmd.Parameters.AddWithValue("@Dateofchange", Dateofchange)
            cmd.Parameters.AddWithValue("@Recorddate", Recorddate)

            cmd.Parameters.Add(New SqlParameter("@Result", SqlDbType.Int))
            cmd.Parameters("@Result").Direction = ParameterDirection.ReturnValue
            Dim commandResult As Integer = 1

            Try
                con.Open()
                cmd.ExecuteNonQuery()
                commandResult = CType(cmd.Parameters("@Result").Value, Integer)
            Catch ex As SqlException
                commandResult = ex.Number
            Finally
                con.Close()
            End Try

            'Step1.Save()
        End Sub


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetFiles() As List(Of Uploadfiles)
            Dim ReadFile As New List(Of Uploadfiles)()

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con

            cmd.CommandText = "SELECT Id, FileName, CreatedDate FROM ExceptionForms"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim GetDocument As New Uploadfiles()
                    GetDocument.Id = CType(reader("Id"), String)
                    GetDocument.FileName = CType(reader("FileName"), String)
                    GetDocument.Filedate = CType(reader("CreatedDate"), Date)
                    ReadFile.Add(GetDocument)
                    'GetDocument.Id = String.Empty
                    'GetDocument.FileName = String.Empty
                    'reader.NextResult()
                End While
            End Using

            Return ReadFile
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetPolicyForms() As List(Of Uploadfiles)
            Dim ReadFile As New List(Of Uploadfiles)()
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT Id, FileName, CreatedDate FROM PolicyForms"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim GetDocument As New Uploadfiles()
                    GetDocument.Id = CType(reader("Id"), String)
                    GetDocument.FileName = CType(reader("FileName"), String)
                    GetDocument.Filedate = CType(reader("CreatedDate"), Date)
                    ReadFile.Add(GetDocument)
                    'GetDocument.Id = String.Empty
                    'GetDocument.FileName = String.Empty
                    'reader.NextResult()
                End While
            End Using
            Return ReadFile
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetClaimsLossForms() As List(Of Uploadfiles)
            Dim ReadFile As New List(Of Uploadfiles)()
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT Id, FileName, CreatedDate FROM ClaimsLossForms"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim GetDocument As New Uploadfiles()
                    GetDocument.Id = CType(reader("Id"), String)
                    GetDocument.FileName = CType(reader("FileName"), String)
                    GetDocument.Filedate = CType(reader("CreatedDate"), Date)
                    ReadFile.Add(GetDocument)
                    'GetDocument.Id = String.Empty
                    'GetDocument.FileName = String.Empty
                    'reader.NextResult()
                End While
            End Using
            Return ReadFile
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetLossForms() As List(Of Uploadfiles)
            Dim ReadFile As New List(Of Uploadfiles)()
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT Id, FileName, CreatedDate FROM LossForms"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim GetDocument As New Uploadfiles()
                    GetDocument.Id = CType(reader("Id"), String)
                    GetDocument.FileName = CType(reader("FileName"), String)
                    GetDocument.Filedate = CType(reader("CreatedDate"), Date)
                    ReadFile.Add(GetDocument)
                    'GetDocument.Id = String.Empty
                    'GetDocument.FileName = String.Empty
                    'reader.NextResult()
                End While
            End Using
            Return ReadFile
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetWorkersCompForms() As List(Of Uploadfiles)
            Dim ReadFile As New List(Of Uploadfiles)()
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT Id, FileName FROM WorkersCompForms"
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim GetDocument As New Uploadfiles()
                    GetDocument.Id = CType(reader("Id"), String)
                    GetDocument.FileName = CType(reader("FileName"), String)
                    ReadFile.Add(GetDocument)
                    'GetDocument.Id = String.Empty
                    'GetDocument.FileName = String.Empty
                    'reader.NextResult()
                End While
            End Using
            Return ReadFile
        End Function

        Public Shared Sub CreateUserProfile(ByVal userName As String, ByVal firstName As String, ByVal lastName As String, ByVal theInsured As String, ByVal address As String, ByVal city As String, ByVal zip As String, ByVal phone As String)

            'Dim conString As String = WebConfigurationManager.ConnectionStrings("AllPortal").ConnectionString
            Dim con As New SqlConnection(_con)
            Dim cmd As New SqlCommand("INSERT UserProfiles (UserName,FirstName,LastName,TheInsured,Address,City,Zip,Phone) VALUES (@UserName,@FirstName,@LastName,@theInsured,@address,@city,@zip,@phone)", con)
            cmd.Parameters.AddWithValue("@UserName", userName)
            cmd.Parameters.AddWithValue("@FirstName", firstName)
            cmd.Parameters.AddWithValue("@LastName", lastName)
            cmd.Parameters.AddWithValue("@theInsured", theInsured)
            cmd.Parameters.AddWithValue("@address", address)
            cmd.Parameters.AddWithValue("@city", city)
            cmd.Parameters.AddWithValue("@zip", zip)
            cmd.Parameters.AddWithValue("@phone", phone)
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetUserProfile(ByVal UserNameIs As String) As List(Of USERPROFILETABLE)
            Dim UserProfile As New List(Of USERPROFILETABLE)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT  UserName, FirstName + ' ' + LastName As FullName, Phone FROM UserProfiles WHERE UserName = @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New USERPROFILETABLE()
                    ReadProfile.Username = CType(reader("UserName"), String)
                    ReadProfile.Fullname = CType(reader("FullName"), String)
                    ReadProfile.Phone = CType(reader("Phone"), String)
                    UserProfile.Add(ReadProfile)
                End While
            End Using
            Return UserProfile

        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function ViewUserProfile(ByVal UserNameIs As String) As List(Of USERPROFILETABLE)
            Dim UserProfile As New List(Of USERPROFILETABLE)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT  UserName, FirstName, LastName, Phone FROM UserProfiles WHERE UserName = @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New USERPROFILETABLE()
                    ReadProfile.Username = CType(reader("UserName"), String)
                    ReadProfile.Firstname = CType(reader("FirstName"), String)
                    ReadProfile.Lastname = CType(reader("LastName"), String)
                    ReadProfile.Phone = CType(reader("Phone"), String)
                    UserProfile.Add(ReadProfile)
                End While
            End Using
            Return UserProfile

        End Function

        Public Shared Sub UpdateProfile(ByVal UserNameIs As String, ByVal FirstName As String, ByVal LastName As String, ByVal Phone As String)
            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE UserProfiles SET FirstName=@first, LastName=@last, Phone=@phone WHERE UserName=@UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@first", FirstName)
            cmd.Parameters.AddWithValue("@last", LastName)
            cmd.Parameters.AddWithValue("@Phone", Phone)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        Public Sub CreateAgentProfileFromMaster(ByVal UserNameIs As String, ByVal subAgentCode As String, ByVal userName As String, ByVal firstName As String, ByVal lastName As String, ByVal phone As String, ByVal position As String, ByVal city As String, ByVal state As String, ByVal role As String)

            Dim con As New SqlConnection(_con)
            Dim cmd As New SqlCommand("INSERT AgentProfiles (MasterID,SubID,UserName,FirstName,LastName,Phone,Position,City,State,Role,CreatedFrom,DateCreated) VALUES (@UserNameIs,@SubAgentCode,@UserName,@FirstName,@LastName,@Phone,@Position,@City,@State,@Role,@CreatedFrom,@Datecreated)", con)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@SubAgentCode", subAgentCode)
            cmd.Parameters.AddWithValue("@UserName", userName)
            cmd.Parameters.AddWithValue("@FirstName", firstName)
            cmd.Parameters.AddWithValue("@LastName", lastName)
            cmd.Parameters.AddWithValue("@Phone", phone)
            cmd.Parameters.AddWithValue("@Position", position)
            cmd.Parameters.AddWithValue("@City", city)
            cmd.Parameters.AddWithValue("@State", state)
            cmd.Parameters.AddWithValue("@Role", role)
            cmd.Parameters.AddWithValue("@CreatedFrom", 2)
            cmd.Parameters.AddWithValue("@Datecreated", Date.Now)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        Public Sub CreateAgentProfile(ByVal UserNameIs As String, ByVal subAgentCode As String, ByVal userName As String, ByVal firstName As String, ByVal lastName As String, ByVal phone As String, ByVal position As String, ByVal city As String, ByVal state As String, ByVal role As String)

            Dim con As New SqlConnection(_con)
            Dim cmd As New SqlCommand("INSERT AgentProfiles (MasterID,SubID,UserName,FirstName,LastName,Phone,Position,City,State,Role,CreatedFrom,DateCreated) VALUES (@UserNameIs,@AgentCode,@UserName,@FirstName,@LastName,@Phone,@Position,@City,@State,@Role,@CreatedFrom,@Datecreated)", con)
            cmd.CommandType = CommandType.Text
            Dim master As String = GetMasterKey(UserNameIs)
            cmd.Parameters.AddWithValue("@UserNameIs", master)
            cmd.Parameters.AddWithValue("@AgentCode", UserNameIs)
            cmd.Parameters.AddWithValue("@UserName", userName)
            cmd.Parameters.AddWithValue("@FirstName", firstName)
            cmd.Parameters.AddWithValue("@LastName", lastName)
            cmd.Parameters.AddWithValue("@Phone", phone)
            cmd.Parameters.AddWithValue("@Position", position)
            cmd.Parameters.AddWithValue("@City", city)
            cmd.Parameters.AddWithValue("@State", state)
            cmd.Parameters.AddWithValue("@Role", role)
            cmd.Parameters.AddWithValue("@CreatedFrom", 2)
            cmd.Parameters.AddWithValue("@Datecreated", Date.Now)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        Public Function GetMasterKey(ByVal UserNameIs As String) As String
            Dim con As New SqlConnection(_con)
            Dim cmd As New SqlCommand("SELECT MasterKeyID FROM AgencyOriginationTable WHERE MasterID = @UserNameIs", con)
            Dim master As Object
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                master = cmd.ExecuteScalar()
            End Using

            Return master

        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetAgentProfile(ByVal UserNameIs As String) As List(Of AGENTPROFILETABLE)
            Dim AgentProfile As New List(Of AGENTPROFILETABLE)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT Id, MasterID, SubID, UserName, FirstName + ' ' + LastName As FullName, Role, CreatedFrom FROM AgentProfiles WHERE MasterID = @UserNameIs AND UserName != @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New AGENTPROFILETABLE()
                    ReadProfile.Id = CType(reader("Id"), String)
                    ReadProfile.Masterid = CType(reader("MasterID"), String)
                    ReadProfile.Agentcode = CType(reader("SubID"), String)
                    ReadProfile.Username = CType(reader("UserName"), String)
                    ReadProfile.Fullname = CType(reader("FullName"), String)
                    ReadProfile.Role = CType(reader("Role"), String)
                    ReadProfile.Createdfrom = CType(reader("CreatedFrom"), Integer)
                    Dim master As String = CType(reader("MasterID"), String)
                    Dim subid As String = CType(reader("SubID"), String)
                    AgentProfile.Add(ReadProfile)
                End While
            End Using

            Return AgentProfile

        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSubAgentProfile(ByVal UserNameIs As String) As List(Of AGENTPROFILETABLE)
            Dim AgentProfile As New List(Of AGENTPROFILETABLE)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT Id, MasterID, SubID, UserName, FirstName + ' ' + LastName As FullName, Role, CreatedFrom FROM AgentProfiles WHERE SubID = @UserNameIs AND UserName != @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New AGENTPROFILETABLE()
                    ReadProfile.Id = CType(reader("Id"), String)
                    ReadProfile.Masterid = CType(reader("MasterID"), String)
                    ReadProfile.Agentcode = CType(reader("SubID"), String)
                    ReadProfile.Username = CType(reader("UserName"), String)
                    ReadProfile.Fullname = CType(reader("FullName"), String)
                    ReadProfile.Role = CType(reader("Role"), String)
                    ReadProfile.Createdfrom = CType(reader("CreatedFrom"), Integer)
                    'Dim master As String = CType(reader("MasterID"), String)
                    'Dim subid As String = CType(reader("SubID"), String)
                    AgentProfile.Add(ReadProfile)
                End While
            End Using

            Return AgentProfile

        End Function


        Public Shared Sub DeleteAgentProfile(ByVal Id As Integer)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_con)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "DELETE AgentProfiles WHERE Id=@Id"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Id", Id)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetAgentName(ByVal UserNameIs As String) As List(Of Agency)
            Dim UserName As New List(Of Agency)()

            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT FIRST_NAME + ' ' + LAST_NAME As FullName FROM AgencyProfileInformation WHERE AGENT_NUMBER = @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Try
                Using con
                    con.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader
                    While reader.Read()
                        Dim ReadProfile As New Agency()
                        ReadProfile.Fullname = CType(reader("FullName"), String)
                        UserName.Add(ReadProfile)
                    End While
                End Using
            Catch ex As Exception
                HttpContext.Current.Response.Redirect("~/login/login_a.aspx")
            End Try

            Return UserName
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetUserName(ByVal ProfileNameIs As String) As List(Of Agency)
            Dim UserName As New List(Of Agency)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT SubID, FirstName + ' ' + LastName As FullName FROM AgentProfiles WHERE UserName = @ProfileNameIs"
            cmd.Parameters.AddWithValue("@ProfileNameIs", ProfileNameIs)
            cmd.CommandType = CommandType.Text

            'Try
            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New Agency()
                    ReadProfile.Fullname = CType(reader("FullName"), String)
                    ReadProfile.Agentnumber = CType(reader("SubID"), String)
                    UserName.Add(ReadProfile)
                End While
            End Using
            'Catch ex As Exception
            '    HttpContext.Current.Response.Redirect("~/login/login_a.aspx")
            'End Try

            Return UserName
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetMasterAgencies(ByVal UserNameIs As String) As List(Of Agency)
            Dim Agencies As New List(Of Agency)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "SELECT MasterID, MasterID + ' - ' + AgencyName As AGENCY FROM AgencyOriginationTable WHERE MasterID = @UserNameIs"
            'cmd.CommandText = "SELECT MasterID, SubID + ' - ' + City As AGENCY FROM AgentProfiles WHERE UserName = @ProfileNameIs"
            cmd.CommandText = "SELECT MasterID, MasterID + ' - ' + AgencyName As AGENCY FROM AgencyOriginationTable WHERE MasterKeyID = @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            'Try
            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New Agency()
                    ReadProfile.Fullname = CType(reader("AGENCY"), String)
                    ReadProfile.Agentnumber = CType(reader("MasterID"), String)
                    Agencies.Add(ReadProfile)
                End While
            End Using
            'Catch ex As Exception
            '    HttpContext.Current.Response.Redirect("~/login/login_a.aspx")
            'End Try

            Return Agencies

            con.Close()


        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSubAgencies(ByVal UserNameIs As String) As List(Of Agency)
            Dim Agencies As New List(Of Agency)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "SELECT MasterID, MasterID + ' - ' + AgencyName As AGENCY FROM AgencyOriginationTable WHERE MasterID = @UserNameIs"
            'cmd.CommandText = "SELECT MasterID, SubID + ' - ' + City As AGENCY FROM AgentProfiles WHERE UserName = @ProfileNameIs"
            cmd.CommandText = "SELECT MasterID, MasterID + ' - ' + AgencyName As AGENCY FROM AgencyOriginationTable WHERE MasterID = @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            'Try
            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadProfile As New Agency()
                    ReadProfile.Fullname = CType(reader("AGENCY"), String)
                    ReadProfile.Agentnumber = CType(reader("MasterID"), String)
                    Agencies.Add(ReadProfile)
                End While
            End Using
            'Catch ex As Exception
            '    HttpContext.Current.Response.Redirect("~/login/login_a.aspx")
            'End Try

            Return Agencies
        End Function


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetEmployeeName(ByVal UserNameIs As String) As List(Of SetEmployeeVariables)
            Dim EmployeeProfile As New List(Of SetEmployeeVariables)()

            Dim con As SqlConnection = New SqlConnection(_con)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT FirstName + ' ' + LastName As FullName FROM EmployeeProfiles WHERE UserName = @UserNameIs"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                    Dim SeeEmployeeProfile As New SetEmployeeVariables()
                    SeeEmployeeProfile.Fullname = CType(reader("FullName"), String)
                    EmployeeProfile.Add(SeeEmployeeProfile)
                End While
            End Using
            Return EmployeeProfile
        End Function

        Public Shared Sub InsertGeneralInfo(ByVal Agency As String, ByVal AgentNumber As String, ByVal AgentName As String, ByVal AgentEmail1 As String, ByVal AgentEmail2 As String, ByVal ChurchName As String, ByVal MailingAddress As String, ByVal MailingCity As String, ByVal MailingState As String, ByVal MailingZip As String, ByVal ChurchUrl As String, ByVal CurrentCarrier As String, ByVal ExDate As Date, ByVal CurrentSmpPremium As Decimal, ByVal Prior3Years As String, ByVal PriorExplanation As String, ByVal ContactPerson As String, ByVal Phone1 As String, ByVal Phone2 As String, ByVal MortLossPayee As String, ByVal Incorporated As String, ByVal QuoteType As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO GeneralInformationApplication (Agency, AgentNumber, AgentName, AgentEmail1, AgentEmail2, ChurchName, MailingAddress, MailingCity, MailingState, MailingZip, ChurchUrl, CurrentCarrier, ExDate, CurrentSmpPremium, Prior3Years, PriorExplanation, ContactPerson, Phone1, Phone2, MortLossPayee, Incorporated, QuoteType, AppLevel, Status, SubmitDate, AssignedTo) VALUES (@Agency, @AgentNum, @Agentname, @Agentemail1, @Agentemail2, @Churchname, @Mailingaddress, @Mailingcity, @Mailingstate, @Mailingzip, @Churchurl, @Currentcarrier, @Exdate, @Currsmpprem, @Prior3, @Priorexplain, @Contact, @Phone1, @Phone2, @Mortlosspayee, @Incorp, @Quotetype, @Applevel, @Status, @Submitdate, @Assignedto)"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Agency", Agency)
            cmd.Parameters.AddWithValue("@AgentNum", AgentNumber)
            cmd.Parameters.AddWithValue("@Agentname", AgentName)
            cmd.Parameters.AddWithValue("@Agentemail1", AgentEmail1)
            cmd.Parameters.AddWithValue("@Agentemail2", AgentEmail2)
            cmd.Parameters.AddWithValue("@Churchname", ChurchName)
            cmd.Parameters.AddWithValue("@Mailingaddress", MailingAddress)
            cmd.Parameters.AddWithValue("@Mailingcity", MailingCity)
            cmd.Parameters.AddWithValue("@Mailingstate", MailingState)
            cmd.Parameters.AddWithValue("@Mailingzip", MailingZip)
            cmd.Parameters.AddWithValue("@Churchurl", ChurchUrl)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Exdate", ExDate)
            cmd.Parameters.AddWithValue("@Currsmpprem", CurrentSmpPremium)
            cmd.Parameters.AddWithValue("@Prior3", Prior3Years)
            cmd.Parameters.AddWithValue("@Priorexplain", PriorExplanation)
            cmd.Parameters.AddWithValue("@Contact", ContactPerson)
            cmd.Parameters.AddWithValue("@Phone1", Phone1)
            cmd.Parameters.AddWithValue("@Phone2", Phone2)
            cmd.Parameters.AddWithValue("@Mortlosspayee", MortLossPayee)
            cmd.Parameters.AddWithValue("@Incorp", Incorporated)
            cmd.Parameters.AddWithValue("@Quotetype", QuoteType)
            cmd.Parameters.AddWithValue("@Applevel", "0")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@Submitdate", Today.Date)
            cmd.Parameters.AddWithValue("@Assignedto", "Pending")

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetGeneralInfo(ByVal RequestNumber As Integer) As List(Of GeneralInformationApplication)
            Dim Application As New List(Of GeneralInformationApplication)()

            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, AgentNumber, Agency, AgentName, AgentEmail1, AgentEmail2, ChurchName, MailingAddress, MailingCity, MailingState, MailingZip, ChurchUrl, CurrentCarrier, ExDate, CurrentSmpPremium, Prior3Years, PriorExplanation, ContactPerson, Phone1, Phone2, MortLossPayee, Incorporated, QuoteType, SubmitDate, AssignedTo FROM GeneralInformationApplication WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)

            'Add parameter
            'cmd.Parameters.AddWithValue("Reqnum", Reqnum)
            'cmd.Parameters.AddWithValue("@ddate", ddate)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadApp As New GeneralInformationApplication()
                    ReadApp.Agency = CType(reader("Agency"), String)
                    ReadApp.Reqnum = CType(reader("RequestNumber"), String)
                    ReadApp.Agentnum = CType(reader("AgentNumber"), String)
                    ReadApp.Agentname = CType(reader("AgentName"), String)
                    ReadApp.Agentemail1 = CType(reader("AgentEmail1"), String)
                    ReadApp.Agentemail2 = CType(reader("AgentEmail2"), String)
                    ReadApp.Churchname = CType(reader("ChurchName"), String)
                    ReadApp.Mailingaddress = CType(reader("MailingAddress"), String)
                    ReadApp.Mailingcity = CType(reader("MailingCity"), String)
                    ReadApp.Mailingstate = CType(reader("MailingState"), String)
                    ReadApp.Mailingzip = CType(reader("MailingZip"), String)
                    ReadApp.Churchurl = CType(reader("Churchurl"), String)
                    ReadApp.Currentcarrier = CType(reader("CurrentCarrier"), String)
                    ReadApp.Exdate = CType(reader("ExDate"), Date)
                    ReadApp.Currsmpprem = CType(reader("CurrentSmpPremium"), Decimal)
                    ReadApp.Prior3 = CType(reader("Prior3Years"), String)
                    ReadApp.Priorexplain = CType(reader("PriorExplanation"), String)
                    ReadApp.Contact = CType(reader("ContactPerson"), String)
                    ReadApp.Phone1 = CType(reader("Phone1"), String)
                    ReadApp.Phone2 = CType(reader("Phone2"), String)
                    ReadApp.Mortlosspayee = CType(reader("MortLossPayee"), String)
                    ReadApp.Incorp = CType(reader("Incorporated"), String)
                    ReadApp.Quotetype = CType(reader("QuoteType"), String)
                    ReadApp.Submittdate = CType(reader("SubmitDate"), Date)
                    ReadApp.Assignedto = CType(reader("AssignedTo"), String)
                    Application.Add(ReadApp)
                End While
            End Using
            Return Application

        End Function

        Public Shared Sub UpdateGeneralInfoApplication(ByVal RequestNumber As Integer, ByVal Agency As String, ByVal AgentNumber As String, ByVal AgentName As String, ByVal AgentEmail1 As String, ByVal AgentEmail2 As String, ByVal ChurchName As String, ByVal MailingAddress As String, ByVal MailingCity As String, ByVal MailingState As String, ByVal MailingZip As String, ByVal ChurchUrl As String, ByVal CurrentCarrier As String, ByVal ExDate As Date, ByVal CurrentSmpPremium As Decimal, ByVal Prior3Years As String, ByVal PriorExplanation As String, ByVal ContactPerson As String, ByVal Phone1 As String, ByVal Phone2 As String, ByVal MortLossPayee As String, ByVal Incorporated As String, ByVal QuoteType As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE GeneralInformationApplication SET AgentNumber=@AgentNum, Agency=@Agency, AgentName=@Agentname, AgentEmail1=@Agentemail1, AgentEmail2=@Agentemail2, ChurchName=@Churchname, MailingAddress=@Mailingaddress, MailingCity=@Mailingcity, MailingState=@Mailingstate, MailingZip=@Mailingzip, ChurchUrl=@Churchurl, CurrentCarrier=@Currentcarrier, ExDate=@Exdate, CurrentSmpPremium=@Currsmpprem, Prior3Years=@Prior3, PriorExplanation=@Priorexplain, ContactPerson=@Contact, Phone1=@Phone1, Phone2=@Phone2, MortLossPayee=@Mortlosspayee, Incorporated=@Incorp, QuoteType=@Quotetype, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@AgentNum", AgentNumber)
            cmd.Parameters.AddWithValue("@Agency", Agency)
            cmd.Parameters.AddWithValue("@Agentname", AgentName)
            cmd.Parameters.AddWithValue("@Agentemail1", AgentEmail1)
            cmd.Parameters.AddWithValue("@Agentemail2", AgentEmail2)
            cmd.Parameters.AddWithValue("@Churchname", ChurchName)
            cmd.Parameters.AddWithValue("@Mailingaddress", MailingAddress)
            cmd.Parameters.AddWithValue("@Mailingcity", MailingCity)
            cmd.Parameters.AddWithValue("@Mailingstate", MailingState)
            cmd.Parameters.AddWithValue("@Mailingzip", MailingZip)
            cmd.Parameters.AddWithValue("@Churchurl", ChurchUrl)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Exdate", ExDate)
            cmd.Parameters.AddWithValue("@Currsmpprem", CurrentSmpPremium)
            cmd.Parameters.AddWithValue("@Prior3", Prior3Years)
            cmd.Parameters.AddWithValue("@Priorexplain", PriorExplanation)
            cmd.Parameters.AddWithValue("@Contact", ContactPerson)
            cmd.Parameters.AddWithValue("@Phone1", Phone1)
            cmd.Parameters.AddWithValue("@Phone2", Phone2)
            cmd.Parameters.AddWithValue("@Mortlosspayee", MortLossPayee)
            cmd.Parameters.AddWithValue("@Incorp", Incorporated)
            cmd.Parameters.AddWithValue("@Quotetype", QuoteType)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@Submitdate", Today.Date)

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub UpdateAppLevel(ByVal RequestNumber As Integer, ByVal CurrentAppLevel As Integer)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE GeneralInformationApplication SET AppLevel=@Applevel WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Applevel", CurrentAppLevel)
            'Add parameter

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using


        End Sub

        Public Shared Sub InsertSmpApplication(ByVal RequestNumber As Integer, ByVal Deductible As Decimal, ByVal FormType As String, ByVal RcAcv As String, ByVal BlanketCoverage As String, ByVal Earthquake As String, ByVal MoneySecurity As Decimal, ByVal EmployeeDishonesty As Decimal, ByVal Forgery As Decimal, ByVal OrdinaceLaw As Decimal, ByVal ExtraExp As Decimal, ByVal WaterSewer As Decimal, ByVal PropertyComments As String, ByVal GeneralLiability As Decimal, ByVal PreOccurance As Decimal, ByVal MedPay As Decimal, ByVal PastoralCoun As Decimal, ByVal SexualMiscon As Decimal, ByVal DirectorsOfficers As Decimal, ByVal HiredNonOwnAuto As Decimal, ByVal EmployeeBenefits As Decimal, ByVal EmployeePratice As Decimal, ByVal MiscLegalDefense As String, ByVal ViolentActs As String, ByVal TeacherProfessional As Decimal, ByVal CorporalPunishment As Decimal, ByVal LostWages As Decimal, ByVal PropOwned As String, ByVal WhoIsOwner As String, ByVal Daycare As String, ByVal NumOfChild As String, ByVal BgChecks As String, ByVal Playground As String, ByVal PlayFenced As String, ByVal Cemetery As String, ByVal CemFenced As String, ByVal MainProperty As String, ByVal CemeteryAddress As String, ByVal BallField As String, ByVal BallFenced As String, ByVal LocChurProp As String, ByVal ExpChurchComments As String, ByVal AverageAtten As String, ByVal FiveYearLoss As String, ByVal Date1 As Date, ByVal Description1 As String, ByVal Amount1 As Decimal, ByVal Date2 As Date, ByVal Description2 As String, ByVal Amount2 As Decimal, ByVal Date3 As Date, ByVal Description3 As String, ByVal Amount3 As Decimal, ByVal Date4 As Date, ByVal Description4 As String, ByVal Amount4 As Decimal, ByVal Date5 As Date, ByVal Description5 As String, ByVal Amount5 As Decimal, ByVal OweVehicle As String, ByVal WorkComp As String, ByVal Umbrella As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpApplicationDetails (RequestNumber, Deductible, FormType, RcAcv, BlanketCoverage, Earthquake, MoneySecurity, EmployeeDishonesty, Forgery, OrdinaceLaw, ExtraExp, WaterSewer, PropertyComments, GeneralLiability, PerOccurance, MedPay, PastoralCoun, SexualMiscon, DirectorsOfficers, HiredNonOwnAuto, EmployeeBenefits, EmployeePratice, MiscLegalDefense, ViolentActs, TeacherProfessional, CorporalPunishment, LostWages, PropOwned, WhoIsOwner, Daycare, NumOfChild, BgChecks, Playground, PlayFenced, Cemetery, CemFenced, MainProperty, CemeteryAddress, Ballfield, Ballfenced, LocChurProp, ExpChurchComments, AverageAtten, FiveYearLoss, Date1, Description1, Amount1, Date2, Description2, Amount2, Date3, Description3, Amount3, Date4, Description4, Amount4, Date5, Description5, Amount5, OweVehicle, WorkComp, Umbrella, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Deduct, @Formtype, @Rcacv, @Blanketcov, @Earthquake, @Moneysecur, @Employeedis, @Forgery, @Ordinance, @Extraexp, @Watersewer, @PropCom, @Generallia, @Preoccur, @Medpay, @Past, @Sex, @Direct, @Hire, @EmployeeB, @EmployeeP, @Misc, @Violent, @Teacher, @Corporal, @lost, @Propowned, @Whoisowner, @Daycare, @Numofchild, @Bgchecks, @Playground, @Playfenced, @Cemetery, @Cemfenced, @Mainproperty, @Cemeteryaddress, @Ballfield, @Ballfenced, @Locchurprop, @Expchurchcomments, @Averageatten, @Fiveyearloss, @Date1, @Description1, @Amount1, @Date2, @Description2, @Amount2 , @Date3, @Description3, @Amount3, @Date4, @Description4, @Amount4, @Date5, @Description5, @Amount5, @OweVehicle, @WorkComp, @Umbrella, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Deduct", Deductible)
            cmd.Parameters.AddWithValue("@Formtype", FormType)
            cmd.Parameters.AddWithValue("@Rcacv", RcAcv)
            cmd.Parameters.AddWithValue("@Blanketcov", BlanketCoverage)
            cmd.Parameters.AddWithValue("@Earthquake", Earthquake)
            cmd.Parameters.AddWithValue("@Moneysecur", MoneySecurity)
            cmd.Parameters.AddWithValue("@Employeedis", EmployeeDishonesty)
            cmd.Parameters.AddWithValue("@Forgery", Forgery)
            cmd.Parameters.AddWithValue("@Ordinance", OrdinaceLaw)
            cmd.Parameters.AddWithValue("@Extraexp", ExtraExp)
            cmd.Parameters.AddWithValue("@Watersewer", WaterSewer)
            cmd.Parameters.AddWithValue("@PropCom", PropertyComments)
            cmd.Parameters.AddWithValue("@Generallia", GeneralLiability)
            cmd.Parameters.AddWithValue("@Preoccur", PreOccurance)
            cmd.Parameters.AddWithValue("@Medpay", MedPay)
            cmd.Parameters.AddWithValue("@Past", PastoralCoun)
            cmd.Parameters.AddWithValue("@Sex", SexualMiscon)
            cmd.Parameters.AddWithValue("@Direct", DirectorsOfficers)
            cmd.Parameters.AddWithValue("@Hire", HiredNonOwnAuto)
            cmd.Parameters.AddWithValue("@EmployeeB", EmployeeBenefits)
            cmd.Parameters.AddWithValue("@EmployeeP", EmployeePratice)
            cmd.Parameters.AddWithValue("@Misc", MiscLegalDefense)
            cmd.Parameters.AddWithValue("@Violent", ViolentActs)
            cmd.Parameters.AddWithValue("@Teacher", TeacherProfessional)
            cmd.Parameters.AddWithValue("@Corporal", CorporalPunishment)
            cmd.Parameters.AddWithValue("@lost", LostWages)
            cmd.Parameters.AddWithValue("@Propowned", PropOwned)
            cmd.Parameters.AddWithValue("@Whoisowner", WhoIsOwner)
            cmd.Parameters.AddWithValue("@Daycare", Daycare)
            cmd.Parameters.AddWithValue("@Numofchild", NumOfChild)
            cmd.Parameters.AddWithValue("@Bgchecks", BgChecks)
            cmd.Parameters.AddWithValue("@Playground", Playground)
            cmd.Parameters.AddWithValue("@Playfenced", PlayFenced)
            cmd.Parameters.AddWithValue("@Cemetery", Cemetery)
            cmd.Parameters.AddWithValue("@Cemfenced", CemFenced)
            cmd.Parameters.AddWithValue("@Mainproperty", MainProperty)
            cmd.Parameters.AddWithValue("@Cemeteryaddress", CemeteryAddress)
            cmd.Parameters.AddWithValue("@Ballfield", BallField)
            cmd.Parameters.AddWithValue("@Ballfenced", BallFenced)
            cmd.Parameters.AddWithValue("@Locchurprop", LocChurProp)
            cmd.Parameters.AddWithValue("@Expchurchcomments", ExpChurchComments)
            cmd.Parameters.AddWithValue("@Averageatten", AverageAtten)
            cmd.Parameters.AddWithValue("@Fiveyearloss", FiveYearLoss)
            cmd.Parameters.AddWithValue("@Date1", Date1)
            cmd.Parameters.AddWithValue("@Description1", Description1)
            cmd.Parameters.AddWithValue("@Amount1", Amount1)
            cmd.Parameters.AddWithValue("@Date2", Date2)
            cmd.Parameters.AddWithValue("@Description2", Description2)
            cmd.Parameters.AddWithValue("@Amount2", Amount2)
            cmd.Parameters.AddWithValue("@Date3", Date3)
            cmd.Parameters.AddWithValue("@Description3", Description3)
            cmd.Parameters.AddWithValue("@Amount3", Amount3)
            cmd.Parameters.AddWithValue("@Date4", Date4)
            cmd.Parameters.AddWithValue("@Description4", Description4)
            cmd.Parameters.AddWithValue("@Amount4", Amount4)
            cmd.Parameters.AddWithValue("@Date5", Date5)
            cmd.Parameters.AddWithValue("@Description5", Description5)
            cmd.Parameters.AddWithValue("@Amount5", Amount5)
            cmd.Parameters.AddWithValue("@OweVehicle", OweVehicle)
            cmd.Parameters.AddWithValue("@WorkComp", WorkComp)
            cmd.Parameters.AddWithValue("@Umbrella", Umbrella)
            cmd.Parameters.AddWithValue("@Applevel", "1")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSmpApplication(ByVal RequestNumber As Integer) As List(Of SmpApplication)
            Dim Application As New List(Of SmpApplication)()

            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create Command
            Dim cmd As SqlCommand = New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, Deductible, FormType, RcAcv, BlanketCoverage, Earthquake, MoneySecurity, EmployeeDishonesty, Forgery, OrdinaceLaw, ExtraExp, WaterSewer, PropertyComments, GeneralLiability, PerOccurance, MedPay, PastoralCoun, SexualMiscon, DirectorsOfficers, HiredNonOwnAuto, EmployeeBenefits, EmployeePratice, MiscLegalDefense, ViolentActs, TeacherProfessional, CorporalPunishment, LostWages, PropOwned, WhoIsOwner, Daycare, NumOfChild, BgChecks, Playground, PlayFenced, Cemetery, CemFenced, MainProperty, CemeteryAddress, Ballfield, Ballfenced, LocChurProp, ExpChurchComments, AverageAtten, FiveYearLoss, Date1, Description1, Amount1, Date2, Description2, Amount2, Date3, Description3, Amount3, Date4, Description4, Amount4, Date5, Description5, Amount5, OweVehicle, WorkComp, Umbrella, Status, SubmitDate FROM SmpApplicationDetails WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadApp As New SmpApplication()
                    ReadApp.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadApp.Deduct = CType(reader("Deductible"), Decimal)
                    ReadApp.Formtype = CType(reader("FormType"), String)
                    ReadApp.Rcacv = CType(reader("RcAcv"), String)
                    ReadApp.Blanket = CType(reader("BlanketCoverage"), String)
                    ReadApp.Earthquake = CType(reader("Earthquake"), String)
                    ReadApp.Moneysecurity = CType(reader("MoneySecurity"), Decimal)
                    ReadApp.Empdishonesty = CType(reader("EmployeeDishonesty"), Decimal)
                    ReadApp.Forgery = CType(reader("Forgery"), Decimal)
                    ReadApp.Ordlaw = CType(reader("OrdinaceLaw"), Decimal)
                    ReadApp.Extraexp = CType(reader("ExtraExp"), Decimal)
                    ReadApp.Watersewer = CType(reader("WaterSewer"), Decimal)
                    ReadApp.Propcomments = CType(reader("PropertyComments"), String)
                    ReadApp.Genliability = CType(reader("GeneralLiability"), Decimal)
                    ReadApp.Peroccur = CType(reader("PerOccurance"), Decimal)
                    ReadApp.Medpay = CType(reader("MedPay"), Decimal)
                    ReadApp.Pastoral = CType(reader("PastoralCoun"), Decimal)
                    ReadApp.Sexualmiscon = CType(reader("SexualMiscon"), Decimal)
                    ReadApp.Directors = CType(reader("DirectorsOfficers"), Decimal)
                    ReadApp.Hired = CType(reader("HiredNonOwnAuto"), Decimal)
                    ReadApp.Empbenefits = CType(reader("EmployeeBenefits"), Decimal)
                    ReadApp.Emppratice = CType(reader("EmployeePratice"), Decimal)
                    ReadApp.Misclegaldefense = CType(reader("MiscLegalDefense"), String)
                    ReadApp.Violentacts = CType(reader("ViolentActs"), String)
                    ReadApp.Teacher = CType(reader("TeacherProfessional"), Decimal)
                    ReadApp.Corppunish = CType(reader("CorporalPunishment"), Decimal)
                    ReadApp.Lostwages = CType(reader("LostWages"), Decimal)
                    ReadApp.Propowned = CType(reader("PropOwned"), String)
                    ReadApp.Whoisowner = CType(reader("WhoIsOwner"), String)
                    ReadApp.Daycare = CType(reader("Daycare"), String)
                    ReadApp.Numofchild = CType(reader("NumOfChild"), String)
                    ReadApp.Bgchecks = CType(reader("BgChecks"), String)
                    ReadApp.Playground = CType(reader("Playground"), String)
                    ReadApp.Playfence = CType(reader("Playfenced"), String)
                    ReadApp.Cemetery = CType(reader("Cemetery"), String)
                    ReadApp.Cemfenced = CType(reader("CemFenced"), String)
                    ReadApp.Mainproperty = CType(reader("MainProperty"), String)
                    ReadApp.Cemeteryaddress = CType(reader("CemeteryAddress"), String)
                    ReadApp.Ballfield = CType(reader("Ballfield"), String)
                    ReadApp.Ballfenced = CType(reader("Ballfenced"), String)
                    ReadApp.Locchurchprop = CType(reader("LocChurProp"), String)
                    ReadApp.Expchurchcomments = CType(reader("ExpChurchComments"), String)
                    ReadApp.Averageatten = CType(reader("AverageAtten"), String)
                    ReadApp.Fiveyearloss = CType(reader("FiveYearLoss"), String)
                    ReadApp.Date1 = CType(reader("Date1"), Date)
                    ReadApp.Descr1 = CType(reader("Description1"), String)
                    ReadApp.Amount1 = CType(reader("Amount1"), Decimal)
                    ReadApp.Date2 = CType(reader("Date2"), Date)
                    ReadApp.Descr2 = CType(reader("Description2"), String)
                    ReadApp.Amount2 = CType(reader("Amount2"), Decimal)
                    ReadApp.Date3 = CType(reader("Date3"), Date)
                    ReadApp.Descr3 = CType(reader("Description3"), String)
                    ReadApp.Amount3 = CType(reader("Amount3"), Decimal)
                    ReadApp.Date4 = CType(reader("Date4"), Date)
                    ReadApp.Descr4 = CType(reader("Description4"), String)
                    ReadApp.Amount4 = CType(reader("Amount4"), Decimal)
                    ReadApp.Date5 = CType(reader("Date5"), Date)
                    ReadApp.Descr5 = CType(reader("Description5"), String)
                    ReadApp.Amount5 = CType(reader("Amount5"), Decimal)
                    ReadApp.Owevehicle = CType(reader("OweVehicle"), String)
                    ReadApp.Workcomp = CType(reader("WorkComp"), String)
                    ReadApp.Umbrella = CType(reader("Umbrella"), String)
                    ReadApp.Status = CType(reader("Status"), String)
                    ReadApp.Submittdate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadApp)
                End While
            End Using


            Return Application
        End Function

        Public Shared Sub UpdateSmpApplication(ByVal RequestNumber As Integer, ByVal Deductible As Decimal, ByVal FormType As String, ByVal RcAcv As String, ByVal BlanketCoverage As String, ByVal Earthquake As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpApplicationDetails SET Deductible=@Deductible, FormType=@Formtype, RcAcv=@Rcacv, BlanketCoverage=@Blanketcoverage, Earthquake=@Earthquake, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Deductible", Deductible)
            cmd.Parameters.AddWithValue("@Formtype", FormType)
            cmd.Parameters.AddWithValue("@Rcacv", RcAcv)
            cmd.Parameters.AddWithValue("@Blanketcoverage", BlanketCoverage)
            cmd.Parameters.AddWithValue("@Earthquake", Earthquake)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub UpdateSmpApplication1(ByVal RequestNumber As Integer, ByVal MoneySecurity As Decimal, ByVal EmployeeDishonesty As Decimal, ByVal Forgery As Decimal, ByVal OrdinaceLaw As Decimal, ByVal ExtraExp As Decimal, ByVal WaterSewer As Decimal, ByVal PropertyComments As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "UPDATE SmpApplicationDetails SET MoneySecurity=@Moneysecur, EmployeeDishonesty=@Employeedis, Forgery=@Forgery, OrdinaceLaw=@Ordinance, ExtraExp=@Extraexp, WaterSewer=@Watersewer, PropertyComments=@PropCom, GeneralLiability=@Generallia, PerOccurance=@Preoccur, MedPay=@Medpay, PastoralCoun=@Past, SexualMiscon=@Sex, DirectorsOfficers=@Direct, HiredNonOwnAuto=@Hire, EmployeeBenefits=@EmployeeB, EmployeePratice=@EmployeeP, MiscLegalDefense=@Misc, ViolentActs=@Violent, TeacherProfessional=@Teacher, CorporalPunishment=@Corporal, LostWages=@lost, PropOwned=@Propowned, WhoIsOwner=@Whoisowner, Daycare=@Daycare, NumOfChild=@Numofchild, BgChecks=@Bgchecks, Playground=@Playground, PlayFenced=@Playfenced, Cemetery=@Cemetery, CemFenced=@Cemfenced, MainProperty=@Mainproperty, CemeteryAddress=@Cemeteryaddress, Ballfield=@Ballfield, Ballfenced=@Ballfenced, LocChurProp=@Locchurprop, ExpChurchComments=@Expchurchcomments, AverageAtten=@Averageatten, FiveYearLoss=@Fiveyearloss, Date1=@Date1, Description1=@Description1, Amount1=@Amount1, Date2=@Date2, Description2=@Description2, Amount2=@Amount2, Date3=@Date3, Description3=@Description3, Amount3=@Amount3, Date4=@Date4, Description4=@Description4, Amount4=@Amount4, Date5=@Date5, Description5=@Description5, Amount5=@Amount5, OweVehicle=@OweVehicle, WorkComp=@WorkComp, Umbrella=@Umbrella, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandText = "UPDATE SmpApplicationDetails SET MoneySecurity=@Moneysecur, EmployeeDishonesty=@Employeedis, Forgery=@Forgery, OrdinaceLaw=@Ordinance, ExtraExp=@Extraexp, WaterSewer=@Watersewer, PropertyComments=@PropCom, AppLevel=@Applevel, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Moneysecur", MoneySecurity)
            cmd.Parameters.AddWithValue("@Employeedis", EmployeeDishonesty)
            cmd.Parameters.AddWithValue("@Forgery", Forgery)
            cmd.Parameters.AddWithValue("@Ordinance", OrdinaceLaw)
            cmd.Parameters.AddWithValue("@Extraexp", ExtraExp)
            cmd.Parameters.AddWithValue("@Watersewer", WaterSewer)
            cmd.Parameters.AddWithValue("@PropCom", PropertyComments)
            cmd.Parameters.AddWithValue("@Applevel", "4")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub UpdateSmpApplication2(ByVal RequestNumber As Integer, ByVal GeneralLiability As Decimal, ByVal PreOccurance As Decimal, ByVal MedPay As Decimal, ByVal PastoralCoun As Decimal, ByVal SexualMiscon As Decimal, ByVal DirectorsOfficers As Decimal, ByVal HiredNonOwnAuto As Decimal, ByVal EmployeeBenefits As Decimal, ByVal EmployeePratice As Decimal, ByVal MiscLegalDefense As String, ByVal ViolentActs As String, ByVal TeacherProfessional As Decimal, ByVal CorporalPunishment As Decimal, ByVal LostWages As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpApplicationDetails SET GeneralLiability=@Generallia, PerOccurance=@Preoccur, MedPay=@Medpay, PastoralCoun=@Past, SexualMiscon=@Sex, DirectorsOfficers=@Direct, HiredNonOwnAuto=@Hire, EmployeeBenefits=@EmployeeB, EmployeePratice=@EmployeeP, MiscLegalDefense=@Misc, ViolentActs=@Violent, TeacherProfessional=@Teacher, CorporalPunishment=@Corporal, LostWages=@lost, AppLevel=@Applevel, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Generallia", GeneralLiability)
            cmd.Parameters.AddWithValue("@Preoccur", PreOccurance)
            cmd.Parameters.AddWithValue("@Medpay", MedPay)
            cmd.Parameters.AddWithValue("@Past", PastoralCoun)
            cmd.Parameters.AddWithValue("@Sex", SexualMiscon)
            cmd.Parameters.AddWithValue("@Direct", DirectorsOfficers)
            cmd.Parameters.AddWithValue("@Hire", HiredNonOwnAuto)
            cmd.Parameters.AddWithValue("@EmployeeB", EmployeeBenefits)
            cmd.Parameters.AddWithValue("@EmployeeP", EmployeePratice)
            cmd.Parameters.AddWithValue("@Misc", MiscLegalDefense)
            cmd.Parameters.AddWithValue("@Violent", ViolentActs)
            cmd.Parameters.AddWithValue("@Teacher", TeacherProfessional)
            cmd.Parameters.AddWithValue("@Corporal", CorporalPunishment)
            cmd.Parameters.AddWithValue("@lost", LostWages)
            cmd.Parameters.AddWithValue("@Applevel", "5")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub UpdateSmpApplication3(ByVal RequestNumber As Integer, ByVal PropOwned As String, ByVal WhoIsOwner As String, ByVal Daycare As String, ByVal NumOfChild As String, ByVal BgChecks As String, ByVal Playground As String, ByVal PlayFenced As String, ByVal Cemetery As String, ByVal CemFenced As String, ByVal MainProperty As String, ByVal CemeteryAddress As String, ByVal BallField As String, ByVal BallFenced As String, ByVal LocChurProp As String, ByVal ExpChurchComments As String, ByVal AverageAtten As String, ByVal FiveYearLoss As String, ByVal Date1 As Date, ByVal Description1 As String, ByVal Amount1 As Decimal, ByVal Date2 As Date, ByVal Description2 As String, ByVal Amount2 As Decimal, ByVal Date3 As Date, ByVal Description3 As String, ByVal Amount3 As Decimal, ByVal Date4 As Date, ByVal Description4 As String, ByVal Amount4 As Decimal, ByVal Date5 As Date, ByVal Description5 As String, ByVal Amount5 As Decimal, ByVal OweVehicle As String, ByVal WorkComp As String, ByVal Umbrella As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpApplicationDetails SET PropOwned=@Propowned, WhoIsOwner=@Whoisowner, Daycare=@Daycare, NumOfChild=@Numofchild, BgChecks=@Bgchecks, Playground=@Playground, PlayFenced=@Playfenced, Cemetery=@Cemetery, CemFenced=@Cemfenced, MainProperty=@Mainproperty, CemeteryAddress=@Cemeteryaddress, Ballfield=@Ballfield, Ballfenced=@Ballfenced, LocChurProp=@Locchurprop, ExpChurchComments=@Expchurchcomments, AverageAtten=@Averageatten, FiveYearLoss=@Fiveyearloss, Date1=@Date1, Description1=@Description1, Amount1=@Amount1, Date2=@Date2, Description2=@Description2, Amount2=@Amount2, Date3=@Date3, Description3=@Description3, Amount3=@Amount3, Date4=@Date4, Description4=@Description4, Amount4=@Amount4, Date5=@Date5, Description5=@Description5, Amount5=@Amount5, OweVehicle=@OweVehicle, WorkComp=@WorkComp, Umbrella=@Umbrella, AppLevel=@Applevel, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Propowned", PropOwned)
            cmd.Parameters.AddWithValue("@Whoisowner", WhoIsOwner)
            cmd.Parameters.AddWithValue("@Daycare", Daycare)
            cmd.Parameters.AddWithValue("@Numofchild", NumOfChild)
            cmd.Parameters.AddWithValue("@Bgchecks", BgChecks)
            cmd.Parameters.AddWithValue("@Playground", Playground)
            cmd.Parameters.AddWithValue("@Playfenced", PlayFenced)
            cmd.Parameters.AddWithValue("@Cemetery", Cemetery)
            cmd.Parameters.AddWithValue("@Cemfenced", CemFenced)
            cmd.Parameters.AddWithValue("@Mainproperty", MainProperty)
            cmd.Parameters.AddWithValue("@Cemeteryaddress", CemeteryAddress)
            cmd.Parameters.AddWithValue("@Ballfield", BallField)
            cmd.Parameters.AddWithValue("@Ballfenced", BallFenced)
            cmd.Parameters.AddWithValue("@Locchurprop", LocChurProp)
            cmd.Parameters.AddWithValue("@Expchurchcomments", ExpChurchComments)
            cmd.Parameters.AddWithValue("@Averageatten", AverageAtten)
            cmd.Parameters.AddWithValue("@Fiveyearloss", FiveYearLoss)
            cmd.Parameters.AddWithValue("@Date1", Date1)
            cmd.Parameters.AddWithValue("@Description1", Description1)
            cmd.Parameters.AddWithValue("@Amount1", Amount1)
            cmd.Parameters.AddWithValue("@Date2", Date2)
            cmd.Parameters.AddWithValue("@Description2", Description2)
            cmd.Parameters.AddWithValue("@Amount2", Amount2)
            cmd.Parameters.AddWithValue("@Date3", Date3)
            cmd.Parameters.AddWithValue("@Description3", Description3)
            cmd.Parameters.AddWithValue("@Amount3", Amount3)
            cmd.Parameters.AddWithValue("@Date4", Date4)
            cmd.Parameters.AddWithValue("@Description4", Description4)
            cmd.Parameters.AddWithValue("@Amount4", Amount4)
            cmd.Parameters.AddWithValue("@Date5", Date5)
            cmd.Parameters.AddWithValue("@Description5", Description5)
            cmd.Parameters.AddWithValue("@Amount5", Amount5)
            cmd.Parameters.AddWithValue("@OweVehicle", OweVehicle)
            cmd.Parameters.AddWithValue("@WorkComp", WorkComp)
            cmd.Parameters.AddWithValue("@Umbrella", Umbrella)
            cmd.Parameters.AddWithValue("@Applevel", "6")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            'Excute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertLocation(ByVal UserNameIs As String, ByVal RequestNumber As Integer, ByVal LocationAddress As String, ByVal LocationCity As String, ByVal LocationState As String, ByVal LocationZip As String, ByVal LocationCounty As String)
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpPhysicalLocation (AGENT_NUMBER, REQUEST_NUMBER, LOCATION_ADDRESS, LOCATION_CITY, LOCATION_STATE, LOCATION_ZIP, LOCATION_COUNTY, STATUS, TODAY_DATE) VALUES (@UserNameIs, @ReqNum, @LocationAddress, @LocationCity, @LocationState, @LocationZip, @LocationCounty, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@LocationAddress", LocationAddress)
            cmd.Parameters.AddWithValue("@LocationCity", LocationCity)
            cmd.Parameters.AddWithValue("@LocationState", LocationState)
            cmd.Parameters.AddWithValue("@LocationZip", LocationZip)
            cmd.Parameters.AddWithValue("@LocationCounty", LocationCounty)
            cmd.Parameters.AddWithValue("@Status", "Open")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetLocation(ByVal RequestNumber As Integer) As List(Of SmpPhysicalLocation)
            Dim Location As New List(Of SmpPhysicalLocation)()
            'Dim ddate As Date = Today.Date
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "SELECT LOCATION_NUMBER, AGENT_NUMBER, LOCATION_ADDRESS, LOCATION_CITY, LOCATION_STATE, LOCATION_ZIP, LOCATION_COUNTY, STATUS, TODAY_DATE FROM SmpPhysicalLocation WHERE REQUEST_NUMBER = @Reqnum AND STATUS = 'Open' AND TODAY_DATE = @ddate"
            cmd.CommandText = "SELECT LOCATION_NUMBER, AGENT_NUMBER, LOCATION_ADDRESS, LOCATION_CITY, LOCATION_STATE, LOCATION_ZIP, LOCATION_COUNTY, STATUS, TODAY_DATE FROM SmpPhysicalLocation WHERE REQUEST_NUMBER = @Reqnum AND STATUS = 'Open'"
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            'cmd.Parameters.AddWithValue("@ddate", ddate)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadLocation As New SmpPhysicalLocation()
                    ReadLocation.Locnum = CType(reader("LOCATION_NUMBER"), String)
                    ReadLocation.Agentnum = CType(reader("AGENT_NUMBER"), String)
                    ReadLocation.Locaddress = CType(reader("LOCATION_ADDRESS"), String)
                    ReadLocation.Loccity = CType(reader("LOCATION_CITY"), String)
                    ReadLocation.Locstate = CType(reader("LOCATION_STATE"), String)
                    ReadLocation.Loczip = CType(reader("LOCATION_ZIP"), String)
                    ReadLocation.Loccounty = CType(reader("LOCATION_COUNTY"), String)
                    ReadLocation.Status = CType(reader("STATUS"), String)
                    ReadLocation.Todaydate = CType(reader("TODAY_DATE"), Date)
                    Location.Add(ReadLocation)
                End While
            End Using
            Return Location
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function ChooseLocation(ByVal RequestNumber As Integer, ByVal ddate As Date) As List(Of SmpPhysicalLocation)
            Dim cLocation As New List(Of SmpPhysicalLocation)()
            'Dim ddate As Date = Today.Date
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT LOCATION_NUMBER, LOCATION_ADDRESS + ' ,' + LOCATION_CITY + ' ' + LOCATION_STATE As UNIT FROM SmpPhysicalLocation WHERE REQUEST_NUMBER = @Reqnum AND STATUS = 'Open' AND TODAY_DATE = @ddate"
            'cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@ddate", ddate)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadcLocation As New SmpPhysicalLocation()
                    ReadcLocation.Locnum = CType(reader("LOCATION_NUMBER"), String)
                    ReadcLocation.Unit = CType(reader("UNIT"), String)
                    cLocation.Add(ReadcLocation)
                End While
            End Using
            Return cLocation
        End Function

        Public Shared Sub UpdateLocation(ByVal LocNum As String, ByVal LocAddress As String, ByVal LocCity As String, ByVal LocState As String, ByVal LocZip As String, ByVal LocCounty As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpPhysicalLocation SET LOCATION_ADDRESS=@LocAddress, LOCATION_CITY=@LocCity, LOCATION_STATE=@LocState, LOCATION_ZIP=@LocZip, LOCATION_COUNTY=@LocCounty WHERE LOCATION_NUMBER=@LocNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@LocNum", LocNum)
            cmd.Parameters.AddWithValue("@LocAddress", LocAddress)
            cmd.Parameters.AddWithValue("@LocCity", LocCity)
            cmd.Parameters.AddWithValue("@LocState", LocState)
            cmd.Parameters.AddWithValue("@LocZip", LocZip)
            cmd.Parameters.AddWithValue("@LocCounty", LocCounty)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub DeleteLocation(ByVal LocNum As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "DELETE SmpPhysicalLocation WHERE LOCATION_NUMBER=@LocNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@LocNum", LocNum)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertBuilding(ByVal UserNameIs As String, ByVal RequestNumber As Integer, ByVal LocNumber As String, ByVal BuildOccupancy As String, ByVal BuildValue As Decimal, ByVal ConValue As Decimal, ByVal ExtConstr As String, ByVal IntConstr As String, ByVal SqFeet As String, ByVal FireClass As String, ByVal FireDist As String)
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpBuildingInformation (AGENT_NUMBER, REQUEST_NUMBER, LOCATION_NUMBER, BUILDING_OCCUPANCY, BUILDING_VALUE, CONTENT_VALUE, EXTERIOR_CONSTRUCTION, INTERIOR_CONSTRUCTION, SQUARE_FEET, FIRE_CLASS, FIRE_DISTRICT, STATUS, TODAY_DATE) VALUES (@UserNameIs, @ReqNum, @LocNumber, @BuildOccupancy, @BuildValue, @ConValue, @ExtConstr, @IntConstr, @SqFeet, @FireClass, @FireDist, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@LocNumber", LocNumber)
            cmd.Parameters.AddWithValue("@BuildOccupancy", BuildOccupancy)
            cmd.Parameters.AddWithValue("@BuildValue", BuildValue)
            cmd.Parameters.AddWithValue("@ConValue", ConValue)
            cmd.Parameters.AddWithValue("@ExtConstr", ExtConstr)
            cmd.Parameters.AddWithValue("@IntConstr", IntConstr)
            cmd.Parameters.AddWithValue("@SqFeet", SqFeet)
            cmd.Parameters.AddWithValue("@FireClass", FireClass)
            cmd.Parameters.AddWithValue("@FireDist", FireDist)
            cmd.Parameters.AddWithValue("@Status", "Open")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetBuilding(ByVal RequestNumber As Integer) As List(Of SmpBuildingInformation)
            Dim MyBuilding As New List(Of SmpBuildingInformation)()
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "SELECT BUILDING_NUMBER, AGENT_NUMBER, LOCATION_NUMBER, BUILDING_OCCUPANCY, BUILDING_VALUE, CONTENT_VALUE, EXTERIOR_CONSTRUCTION, INTERIOR_CONSTRUCTION, SQUARE_FEET, FIRE_CLASS, FIRE_DISTRICT, STATUS, TODAY_DATE FROM SmpBuildingInformation WHERE AGENT_NUMBER = @UserNameIs AND STATUS = 'Open' AND TODAY_DATE = @ddate"
            'cmd.CommandText = "SELECT SmpBuildingInformation.BUILDING_NUMBER, SmpBuildingInformation.AGENT_NUMBER, SmpBuildingInformation.LOCATION_NUMBER, SmpBuildingInformation.BUILDING_OCCUPANCY, SmpBuildingInformation.BUILDING_VALUE, SmpBuildingInformation.CONTENT_VALUE, SmpBuildingInformation.EXTERIOR_CONSTRUCTION, SmpBuildingInformation.INTERIOR_CONSTRUCTION, SmpBuildingInformation.SQUARE_FEET, SmpBuildingInformation.FIRE_CLASS, SmpBuildingInformation.FIRE_DISTRICT, SmpBuildingInformation.STATUS, SmpBuildingInformation.TODAY_DATE, SmpPhysicalLocation.LOCATION_ADDRESS + ',' + SmpPhysicalLocation.LOCATION_CITY + ' ' + SmpPhysicalLocation.LOCATION_STATE As UNIT FROM SmpBuildingInformation INNER JOIN SmpPhysicalLocation ON SmpBuildingInformation.LOCATION_NUMBER = SmpPhysicalLocation.LOCATION_NUMBER WHERE SmpBuildingInformation.REQUEST_NUMBER = @Reqnum AND SmpBuildingInformation.STATUS = 'Open' AND SmpBuildingInformation.TODAY_DATE = @ddate"
            cmd.CommandText = "SELECT SmpBuildingInformation.BUILDING_NUMBER, SmpBuildingInformation.AGENT_NUMBER, SmpBuildingInformation.LOCATION_NUMBER, SmpBuildingInformation.BUILDING_OCCUPANCY, SmpBuildingInformation.BUILDING_VALUE, SmpBuildingInformation.CONTENT_VALUE, SmpBuildingInformation.EXTERIOR_CONSTRUCTION, SmpBuildingInformation.INTERIOR_CONSTRUCTION, SmpBuildingInformation.SQUARE_FEET, SmpBuildingInformation.FIRE_CLASS, SmpBuildingInformation.FIRE_DISTRICT, SmpBuildingInformation.STATUS, SmpBuildingInformation.TODAY_DATE, SmpPhysicalLocation.LOCATION_ADDRESS + ',' + SmpPhysicalLocation.LOCATION_CITY + ' ' + SmpPhysicalLocation.LOCATION_STATE As UNIT FROM SmpBuildingInformation INNER JOIN SmpPhysicalLocation ON SmpBuildingInformation.LOCATION_NUMBER = SmpPhysicalLocation.LOCATION_NUMBER WHERE SmpBuildingInformation.REQUEST_NUMBER = @Reqnum AND SmpBuildingInformation.STATUS = 'Open'"
            'cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            'cmd.Parameters.AddWithValue("@ddate", ddate)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New SmpBuildingInformation()
                    ReadRecord.Buildnumber = CType(reader("BUILDING_NUMBER"), String)
                    ReadRecord.Agentnum = CType(reader("AGENT_NUMBER"), String)
                    ReadRecord.Locnum = CType(reader("LOCATION_NUMBER"), String)
                    ReadRecord.BuildOccupancy = CType(reader("BUILDING_OCCUPANCY"), String)
                    ReadRecord.Buildvalue = CType(reader("BUILDING_VALUE"), String)
                    ReadRecord.Contentvalue = CType(reader("CONTENT_VALUE"), String)
                    ReadRecord.Extconstr = CType(reader("EXTERIOR_CONSTRUCTION"), String)
                    ReadRecord.Intconstr = CType(reader("INTERIOR_CONSTRUCTION"), String)
                    ReadRecord.Sqfeet = CType(reader("SQUARE_FEET"), String)
                    ReadRecord.Fireclass = CType(reader("FIRE_CLASS"), String)
                    ReadRecord.Firedistrict = CType(reader("FIRE_DISTRICT"), String)
                    ReadRecord.Unit = CType(reader("UNIT"), String)
                    ReadRecord.Status = CType(reader("STATUS"), String)
                    ReadRecord.Todaydate = CType(reader("TODAY_DATE"), Date)
                    MyBuilding.Add(ReadRecord)
                End While
            End Using
            Return MyBuilding
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSpecificBuilding(ByVal UserNameIs As String, ByVal ddate As Date, ByVal Buildnumber As Integer) As List(Of SmpBuildingInformation)
            Dim MyBuilding As New List(Of SmpBuildingInformation)()
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "SELECT BUILDING_NUMBER, AGENT_NUMBER, LOCATION_NUMBER, BUILDING_OCCUPANCY, BUILDING_VALUE, CONTENT_VALUE, EXTERIOR_CONSTRUCTION, INTERIOR_CONSTRUCTION, SQUARE_FEET, FIRE_CLASS, FIRE_DISTRICT, STATUS, TODAY_DATE FROM SmpBuildingInformation WHERE AGENT_NUMBER = @UserNameIs AND STATUS = 'Open' AND TODAY_DATE = @ddate"
            cmd.CommandText = "SELECT SmpBuildingInformation.BUILDING_NUMBER, SmpBuildingInformation.AGENT_NUMBER, SmpBuildingInformation.LOCATION_NUMBER, SmpBuildingInformation.BUILDING_OCCUPANCY, SmpBuildingInformation.BUILDING_VALUE, SmpBuildingInformation.CONTENT_VALUE, SmpBuildingInformation.EXTERIOR_CONSTRUCTION, SmpBuildingInformation.INTERIOR_CONSTRUCTION, SmpBuildingInformation.SQUARE_FEET, SmpBuildingInformation.FIRE_CLASS, SmpBuildingInformation.FIRE_DISTRICT, SmpBuildingInformation.STATUS, SmpBuildingInformation.TODAY_DATE, SmpPhysicalLocation.LOCATION_ADDRESS + ',' + SmpPhysicalLocation.LOCATION_CITY + ' ' + SmpPhysicalLocation.LOCATION_STATE As UNIT FROM SmpBuildingInformation INNER JOIN SmpPhysicalLocation ON SmpBuildingInformation.LOCATION_NUMBER = SmpPhysicalLocation.LOCATION_NUMBER WHERE SmpBuildingInformation.AGENT_NUMBER = @UserNameIs AND SmpBuildingInformation.STATUS = 'Open' AND SmpBuildingInformation.TODAY_DATE = @ddate AND SmpBuildingInformation.BUILDING_NUMBER = @Buildnumber"
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@ddate", ddate)
            cmd.Parameters.AddWithValue("@Buildnumber", Buildnumber)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New SmpBuildingInformation()
                    ReadRecord.Buildnumber = CType(reader("BUILDING_NUMBER"), Integer)
                    ReadRecord.Agentnum = CType(reader("AGENT_NUMBER"), String)
                    ReadRecord.Locnum = CType(reader("LOCATION_NUMBER"), String)
                    ReadRecord.BuildOccupancy = CType(reader("BUILDING_OCCUPANCY"), String)
                    ReadRecord.Buildvalue = CType(reader("BUILDING_VALUE"), String)
                    ReadRecord.Contentvalue = CType(reader("CONTENT_VALUE"), String)
                    ReadRecord.Extconstr = CType(reader("EXTERIOR_CONSTRUCTION"), String)
                    ReadRecord.Intconstr = CType(reader("INTERIOR_CONSTRUCTION"), String)
                    ReadRecord.Sqfeet = CType(reader("SQUARE_FEET"), String)
                    ReadRecord.Fireclass = CType(reader("FIRE_CLASS"), String)
                    ReadRecord.Firedistrict = CType(reader("FIRE_DISTRICT"), String)
                    ReadRecord.Unit = CType(reader("UNIT"), String)
                    ReadRecord.Status = CType(reader("STATUS"), String)
                    ReadRecord.Todaydate = CType(reader("TODAY_DATE"), Date)
                    MyBuilding.Add(ReadRecord)
                End While
            End Using
            Return MyBuilding
        End Function

        Public Shared Sub UpdateBuilding(ByVal Buildnumber As Integer, ByVal LocNum As String, ByVal BuildOccupancy As String, ByVal Buildvalue As Decimal, ByVal Contentvalue As Decimal, ByVal ExtConstr As String, ByVal IntConstr As String, ByVal Sqfeet As String, ByVal Fireclass As String, ByVal Firedistrict As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpBuildingInformation SET LOCATION_NUMBER=@LocNum, BUILDING_OCCUPANCY=@BuildOccupy, BUILDING_VALUE=@Buildvalue, CONTENT_VALUE=@ContentValue, EXTERIOR_CONSTRUCTION=@ExtConstr, INTERIOR_CONSTRUCTION=@IntConstr, SQUARE_FEET=@Sqfeet, FIRE_CLASS=@Fireclass, FIRE_DISTRICT=@Firedistrict WHERE BUILDING_NUMBER=@Buildnumber"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Buildnumber", Buildnumber)
            cmd.Parameters.AddWithValue("@LocNum", LocNum)
            cmd.Parameters.AddWithValue("@BuildOccupy", BuildOccupancy)
            cmd.Parameters.AddWithValue("@Buildvalue", Buildvalue)
            cmd.Parameters.AddWithValue("@ContentValue", Contentvalue)
            cmd.Parameters.AddWithValue("@ExtConstr", ExtConstr)
            cmd.Parameters.AddWithValue("@IntConstr", IntConstr)
            cmd.Parameters.AddWithValue("@Sqfeet", Sqfeet)
            cmd.Parameters.AddWithValue("@Fireclass", Fireclass)
            cmd.Parameters.AddWithValue("@Firedistrict", Firedistrict)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        Public Shared Sub DeleteBuilding(ByVal Buildnumber As Integer)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "DELETE SmpBuildingInformation WHERE BUILDING_NUMBER=@BuildNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@BuildNum", Buildnumber)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertPastoralInfo(ByVal RequestNumber As Integer, ByVal NumOfMembers As String, ByVal ExpCounseling As String, ByVal CounselingFee As String, ByVal CounselingRooms As String, ByVal Allegations As String, ByVal ExpAllegations As String)
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpPastoralCounseling (RequestNumber, NumOfMembers, ExpCounseling, CounselingFee, CounselingRooms, Allegations, ExpAllegations, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Numofmem, @Expcoun, @Counfee, @Counrooms, @Allegations, @Expall, @AppLevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Numofmem", NumOfMembers)
            cmd.Parameters.AddWithValue("@Expcoun", ExpCounseling)
            cmd.Parameters.AddWithValue("@Counfee", CounselingFee)
            cmd.Parameters.AddWithValue("@Counrooms", CounselingRooms)
            cmd.Parameters.AddWithValue("@Allegations", Allegations)
            cmd.Parameters.AddWithValue("@Expall", ExpAllegations)
            cmd.Parameters.AddWithValue("@AppLevel", "7")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetPastoralInfo(ByVal RequestNumber As Integer) As IList(Of SmpPastoralCounseling)
            Dim Application As New List(Of SmpPastoralCounseling)

            Dim con As SqlConnection = New SqlConnection(_connectionString)

            Dim cmd As SqlCommand = New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, NumOfMembers, ExpCounseling, CounselingFee, CounselingRooms, Allegations, ExpAllegations, Status, SubmitDate FROM SmpPastoralCounseling WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New SmpPastoralCounseling
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Members = CType(reader("NumOfMembers"), String)
                    ReadRecord.Councomments = CType(reader("ExpCounseling"), String)
                    ReadRecord.Fee = CType(reader("CounselingFee"), String)
                    ReadRecord.Rooms = CType(reader("CounselingRooms"), String)
                    ReadRecord.Allegations = CType(reader("Allegations"), String)
                    ReadRecord.Allegcomments = CType(reader("ExpAllegations"), String)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using
            Return Application
        End Function

        Public Shared Sub UpdateSmpPastoralCounseling(ByVal RequestNumber As Integer, ByVal NumOfMembers As String, ByVal ExpCounseling As String, ByVal CounselingFee As String, ByVal CounselingRooms As String, ByVal Allegations As String, ByVal ExpAllegations As String)
            Dim con As SqlConnection = New SqlConnection(_connectionString)
            Dim cmd As SqlCommand = New SqlCommand()

            cmd.Connection = con
            cmd.CommandText = "Update SmpPastoralCounseling SET NumOfMembers=@Numofmem, ExpCounseling=@Expcoun, CounselingFee=@Counfee, CounselingRooms=@Counrooms, Allegations=@Allegations, ExpAllegations=@Expall, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Numofmem", NumOfMembers)
            cmd.Parameters.AddWithValue("@Expcoun", ExpCounseling)
            cmd.Parameters.AddWithValue("@Counfee", CounselingFee)
            cmd.Parameters.AddWithValue("@Counrooms", CounselingRooms)
            cmd.Parameters.AddWithValue("@Allegations", Allegations)
            cmd.Parameters.AddWithValue("@Expall", ExpAllegations)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        Public Shared Sub InsertSexMisconduct(ByVal RequestNumber As Integer, ByVal Miscon As String, ByVal Perfom As String, ByVal Allbg As String, ByVal Sixmonth As String, ByVal ReqAdult As String, ByVal Installedwin As String, ByVal Misconchar As String, ByVal Expmiscon As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpSexualMisconduct (RequestNumber, MisconPolicy, PerformBgCheck, AllBgCheck, SixMonthWait, ReqAdult, InstalledWin, MisconCharges, ExpMisconCharges, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Miscon, @Perfom, @Allbg, @Sixmonth, @ReqAdult, @Installedwin, @Misconchar, @Expmiscon, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Miscon", Miscon)
            cmd.Parameters.AddWithValue("@Perfom", Perfom)
            cmd.Parameters.AddWithValue("@Allbg", Allbg)
            cmd.Parameters.AddWithValue("@Sixmonth", Sixmonth)
            cmd.Parameters.AddWithValue("@ReqAdult", ReqAdult)
            cmd.Parameters.AddWithValue("@Installedwin", Installedwin)
            cmd.Parameters.AddWithValue("@Misconchar", Misconchar)
            cmd.Parameters.AddWithValue("@Expmiscon", Expmiscon)
            cmd.Parameters.AddWithValue("@Applevel", "8")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSexMisconduct(ByVal RequestNumber As Integer) As List(Of SmpSexualMisconduct)
            Dim Application As New List(Of SmpSexualMisconduct)

            Dim con As SqlConnection = New SqlConnection(_connectionString)

            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, MisconPolicy, PerformBgCheck, AllBgCheck, SixMonthWait, ReqAdult, InstalledWin, MisconCharges, ExpMisconCharges, Status, SubmitDate FROM SmpSexualMisconduct WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read
                    Dim ReadRecord As New SmpSexualMisconduct
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Misconpolicy = CType(reader("MisconPolicy"), String)
                    ReadRecord.Bgcheck = CType(reader("PerformBgCheck"), String)
                    ReadRecord.Allbgcheck = CType(reader("AllBgCheck"), String)
                    ReadRecord.Sixmonthwait = CType(reader("SixMonthWait"), String)
                    ReadRecord.Reqadult = CType(reader("ReqAdult"), String)
                    ReadRecord.Installedwin = CType(reader("InstalledWin"), String)
                    ReadRecord.Misconcharges = CType(reader("MisconCharges"), String)
                    ReadRecord.Expmisconcharges = CType(reader("ExpMisconCharges"), String)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using

            Return Application
        End Function

        Public Shared Sub UpdateSexMisconduct(ByVal RequestNumber As Integer, ByVal Miscon As String, ByVal Perfom As String, ByVal Allbg As String, ByVal Sixmonth As String, ByVal ReqAdult As String, ByVal Installedwin As String, ByVal Misconchar As String, ByVal Expmiscon As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpSexualMisconduct SET MisconPolicy=@Miscon, PerformBgCheck=@Perfom, AllBgCheck=@Allbg, SixMonthWait=@Sixmonth, ReqAdult=@ReqAdult, InstalledWin=@Installedwin, MisconCharges=@Misconchar, ExpMisconCharges=@Expmiscon, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Miscon", Miscon)
            cmd.Parameters.AddWithValue("@Perfom", Perfom)
            cmd.Parameters.AddWithValue("@Allbg", Allbg)
            cmd.Parameters.AddWithValue("@Sixmonth", Sixmonth)
            cmd.Parameters.AddWithValue("@ReqAdult", ReqAdult)
            cmd.Parameters.AddWithValue("@Installedwin", Installedwin)
            cmd.Parameters.AddWithValue("@Misconchar", Misconchar)
            cmd.Parameters.AddWithValue("@Expmiscon", Expmiscon)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertSupplementCoverage(ByVal RequestNumber As Integer, ByVal EstDirect As String, ByVal RotateDirect As String, ByVal PastLosses As String, ByVal ExpLosses As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpSupplementalCoverage (RequestNumber, EstDirectors, RotateDirectors, PastLosses, ExpLosses, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Estdirect, @Rotdirect, @Pastloss, @Exploss, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Estdirect", EstDirect)
            cmd.Parameters.AddWithValue("@Rotdirect", RotateDirect)
            cmd.Parameters.AddWithValue("@Pastloss", PastLosses)
            cmd.Parameters.AddWithValue("@Exploss", ExpLosses)
            cmd.Parameters.AddWithValue("@Applevel", "9")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSupplementalCoverage(ByVal RequestNumber As Integer) As List(Of SmpSupplementalCoverage)
            Dim Application As New List(Of SmpSupplementalCoverage)

            Dim con As SqlConnection = New SqlConnection(_connectionString)

            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, EstDirectors, RotateDirectors, PastLosses, ExpLosses, Status, SubmitDate FROM SmpSupplementalCoverage WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read
                    Dim ReadRecord As New SmpSupplementalCoverage
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Estdirectors = CType(reader("EstDirectors"), String)
                    ReadRecord.Rotatedirectors = CType(reader("RotateDirectors"), String)
                    ReadRecord.Pastlosses = CType(reader("PastLosses"), String)
                    ReadRecord.Explosses = CType(reader("ExpLosses"), String)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using
            Return Application
        End Function

        Public Shared Sub UpdateSupplementalCoverage(ByVal RequestNumber As Integer, ByVal EstDirect As String, ByVal RotateDirect As String, ByVal PastLosses As String, ByVal ExpLosses As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpSupplementalCoverage SET EstDirectors=@Estdirect, RotateDirectors=@Rotdirect, PastLosses=@Pastloss, ExpLosses=@Exploss, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Estdirect", EstDirect)
            cmd.Parameters.AddWithValue("@Rotdirect", RotateDirect)
            cmd.Parameters.AddWithValue("@Pastloss", PastLosses)
            cmd.Parameters.AddWithValue("@Exploss", ExpLosses)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertEmployeePratice(ByVal RequestNumber As Integer, ByVal NumOfEmp As String, ByVal EmpHandbook As String, ByVal DistribToAll As String, ByVal WrittenStatement As String, ByVal FormalApp As String, ByVal AnnualReview As String, ByVal MaintainRecords As String, ByVal DrugTest As String, ByVal ExpDrugTest As String, ByVal NumTerminated As String, ByVal PraticeClaims As String, ByVal ExpPraticesClaims As String, ByVal RiseToClaim As String, ByVal ExpRiseToClaim As String, ByVal PriorCoverage As String, ByVal ExpPriorCoverage As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpEmploymentPractices (RequestNumber, NumOfEmp, EmpHandbook, DistribToAll, WrittenStatement, FormalApp, AnnualReview, MaintainRecords, DrugTest, ExpDrugTest, NumTerminated, PraticeClaims, ExpPraticesClaims, RiseToClaim, ExpRiseToClaim, PriorCoverage, ExpPriorCoverage, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Numofemp, @Emphandbook, @Distribtoall, @Writtenstatement, @Formalapp, @Annualreview, @Maintainrecords, @Drugtest, @Expdrugtest, @Numterminated, @Praticeclaims, @Exppraticesclaims, @RiseToClaim, @Exprisetoclaim, @Priorcoverage, @Exppriorcoverage, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add Parameters
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Numofemp", NumOfEmp)
            cmd.Parameters.AddWithValue("@Emphandbook", EmpHandbook)
            cmd.Parameters.AddWithValue("@Distribtoall", DistribToAll)
            cmd.Parameters.AddWithValue("@Writtenstatement", WrittenStatement)
            cmd.Parameters.AddWithValue("@Formalapp", FormalApp)
            cmd.Parameters.AddWithValue("@Annualreview", AnnualReview)
            cmd.Parameters.AddWithValue("@Maintainrecords", MaintainRecords)
            cmd.Parameters.AddWithValue("@Drugtest", DrugTest)
            cmd.Parameters.AddWithValue("@Expdrugtest", ExpDrugTest)
            cmd.Parameters.AddWithValue("@Numterminated", NumTerminated)
            cmd.Parameters.AddWithValue("@Praticeclaims", PraticeClaims)
            cmd.Parameters.AddWithValue("@Exppraticesclaims", ExpPraticesClaims)
            cmd.Parameters.AddWithValue("@RiseToClaim", RiseToClaim)
            cmd.Parameters.AddWithValue("@Exprisetoclaim", ExpRiseToClaim)
            cmd.Parameters.AddWithValue("@Priorcoverage", PriorCoverage)
            cmd.Parameters.AddWithValue("@Exppriorcoverage", ExpPriorCoverage)
            cmd.Parameters.AddWithValue("@Applevel", "10")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSmpEmployeePractices(ByVal RequestNumber As Integer) As List(Of SmpEmploymentPractices)
            Dim Application As New List(Of SmpEmploymentPractices)

            'Create Connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, NumOfEmp, EmpHandbook, DistribToAll, WrittenStatement, FormalApp, AnnualReview, MaintainRecords, DrugTest, ExpDrugTest, NumTerminated, PraticeClaims, ExpPraticesClaims, RiseToClaim, ExpRiseToClaim, PriorCoverage, ExpPriorCoverage, Status, SubmitDate FROM SmpEmploymentPractices WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New SmpEmploymentPractices
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Numofemp = CType(reader("NumOfEmp"), String)
                    ReadRecord.Emphandbook = CType(reader("EmpHandbook"), String)
                    ReadRecord.Distribtoall = CType(reader("DistribToAll"), String)
                    ReadRecord.Writtenstatement = CType(reader("WrittenStatement"), String)
                    ReadRecord.Formalapp = CType(reader("FormalApp"), String)
                    ReadRecord.Annualreview = CType(reader("AnnualReview"), String)
                    ReadRecord.Maintainrecords = CType(reader("MaintainRecords"), String)
                    ReadRecord.Drugtest = CType(reader("DrugTest"), String)
                    ReadRecord.Expdrugtest = CType(reader("ExpDrugTest"), String)
                    ReadRecord.Numterminated = CType(reader("NumTerminated"), String)
                    ReadRecord.Praticeclaims = CType(reader("PraticeClaims"), String)
                    ReadRecord.Exppraticesclaims = CType(reader("ExpPraticesClaims"), String)
                    ReadRecord.Risetoclaim = CType(reader("RiseToClaim"), String)
                    ReadRecord.Exprisetoclaim = CType(reader("ExpRiseToClaim"), String)
                    ReadRecord.Priorcoverage = CType(reader("PriorCoverage"), String)
                    ReadRecord.Exppriorcoverage = CType(reader("ExpPriorCoverage"), String)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using
            Return Application
        End Function

        Public Shared Sub UpdateSmpEmployeePractices(ByVal RequestNumber As Integer, ByVal NumOfEmp As String, ByVal EmpHandbook As String, ByVal DistribToAll As String, ByVal WrittenStatement As String, ByVal FormalApp As String, ByVal AnnualReview As String, ByVal MaintainRecords As String, ByVal DrugTest As String, ByVal NumTerminated As String, ByVal PraticeClaims As String, ByVal ExpPraticesClaims As String, ByVal RiseToClaim As String, ByVal ExpRiseToClaim As String, ByVal PriorCoverage As String, ByVal ExpPriorCoverage As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpEmploymentPractices SET NumOfEmp=@Numofemp, EmpHandbook=@Emphandbook, DistribToAll=@Distribtoall, WrittenStatement=@Writtenstatement, FormalApp=@Formalapp, AnnualReview=@Annualreview, MaintainRecords=@Maintainrecords, DrugTest=@Drugtest, NumTerminated=@Numterminated, PraticeClaims=@Praticeclaims, ExpPraticesClaims=@Exppraticesclaims, RiseToClaim=@RiseToClaim, ExpRiseToClaim=@Exprisetoclaim, PriorCoverage=@Priorcoverage, ExpPriorCoverage=@Exppriorcoverage, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add Parameters
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Numofemp", NumOfEmp)
            cmd.Parameters.AddWithValue("@Emphandbook", EmpHandbook)
            cmd.Parameters.AddWithValue("@Distribtoall", DistribToAll)
            cmd.Parameters.AddWithValue("@Writtenstatement", WrittenStatement)
            cmd.Parameters.AddWithValue("@Formalapp", FormalApp)
            cmd.Parameters.AddWithValue("@Annualreview", AnnualReview)
            cmd.Parameters.AddWithValue("@Maintainrecords", MaintainRecords)
            cmd.Parameters.AddWithValue("@Drugtest", DrugTest)
            cmd.Parameters.AddWithValue("@Numterminated", NumTerminated)
            cmd.Parameters.AddWithValue("@Praticeclaims", PraticeClaims)
            cmd.Parameters.AddWithValue("@Exppraticesclaims", ExpPraticesClaims)
            cmd.Parameters.AddWithValue("@RiseToClaim", RiseToClaim)
            cmd.Parameters.AddWithValue("@Exprisetoclaim", ExpRiseToClaim)
            cmd.Parameters.AddWithValue("@Priorcoverage", PriorCoverage)
            cmd.Parameters.AddWithValue("@Exppriorcoverage", ExpPriorCoverage)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        Public Shared Sub InsertTeacherLiability(ByVal RequestNumber As Integer, ByVal GradesStart As String, ByVal GradesEnd As String, ByVal MaxEnrollment As String, ByVal AveNumEnrolled As String, ByVal DateEstablished As Date, ByVal WithDegreeFull As Integer, ByVal WithDegreePart As Integer, ByVal WithDegreeVol As Integer, ByVal WithoutDegreeFull As Integer, ByVal WithoutDegreePart As Integer, ByVal WithoutDegreeVol As Integer, ByVal TeacherAidFull As Integer, ByVal TeacherAidPart As Integer, ByVal TeacherAidVol As Integer, ByVal CounselorsFull As Integer, ByVal CounselorsPart As Integer, ByVal CounselorsVol As Integer, ByVal NursesFull As Integer, ByVal NursesPart As Integer, ByVal NursesVol As Integer, ByVal OtherAdminFull As Integer, ByVal OtherAdminPart As Integer, ByVal OtherAdminVol As Integer, ByVal TeachersPerform As String, ByVal ExpCriteria As String, ByVal EvaluteStudents As String, ByVal ResultsShared As String, ByVal ImprovePerform As String, ByVal Suspension As String, ByVal Dismissal As String, ByVal SexHarass As String, ByVal StudentAggres As String, ByVal Promotion As String, ByVal Acceptance As String, ByVal DrugTesting As String, ByVal Weapons As String, ByVal WrittenPolicy As String, ByVal PriorEnrollment As String, ByVal AgainstSchool As String, ByVal ExpClaim As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO SmpTeachersLiability (RequestNumber, GradesStart, GradesEnd, MaxEnrollment, AveNumEnrolled, DateEstablished, WithDegreeFull, WithDegreePart, WithDegreeVol, WithoutDegreeFull, WithoutDegreePart, WithoutDegreeVol, TeacherAidFull, TeacherAidPart, TeacherAidVol, CounselorsFull, CounselorsPart, CounselorsVol, NursesFull, NursesPart, NursesVol, OtherAdminFull, OtherAdminPart, OtherAdminVol, TeachersPerform, ExpCriteria, EvaluteStudents, ResultsShared, ImprovePerform, Suspension, Dismissal, SexHarass, StudentAggres, Promotion, Acceptance, DrugTesting, Weapons, WrittenPolicy, PriorEnrollment, AgainstSchool, ExpClaim, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Gradesstart, @Gradesend, @Maxenrollment, @Avenumenrolled, @Dateestablished, @Withdegreefull, @Withdegreepart, @Withdegreevol, @Withoutdegreefull, @Withoutdegreepart, @Withoutdegreevol, @TeacherAidFull, @TeacherAidPart, @Teacheraidvol, @Counselorsfull, @Counselorspart, @Counselorsvol, @Nursesfull, @Nursespart, @Nursesvol, @Otheradminfull, @Otheradminpart, @Otheradminvol, @Teachersperform, @Expcriteria, @Evalutestudents, @Resultsshared, @Improveperform, @Suspension, @Dismissal, @Sexharass, @Studentaggres, @Promotion, @Acceptance, @Drugtesting, @Weapons, @Writtenpolicy, @Priorenrollment, @Againstschool, @Expclaim, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add Parameters
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Gradesstart", GradesStart)
            cmd.Parameters.AddWithValue("@Gradesend", GradesEnd)
            cmd.Parameters.AddWithValue("@MaxEnrollment", MaxEnrollment)
            cmd.Parameters.AddWithValue("@AveNumEnrolled", AveNumEnrolled)
            cmd.Parameters.AddWithValue("@DateEstablished", DateEstablished)
            cmd.Parameters.AddWithValue("@WithDegreeFull", WithDegreeFull)
            cmd.Parameters.AddWithValue("@WithDegreePart", WithDegreePart)
            cmd.Parameters.AddWithValue("@WithDegreeVol", WithDegreeVol)
            cmd.Parameters.AddWithValue("@WithoutDegreeFull", WithoutDegreeFull)
            cmd.Parameters.AddWithValue("@WithoutDegreePart", WithDegreePart)
            cmd.Parameters.AddWithValue("@WithoutDegreeVol", WithoutDegreeVol)
            cmd.Parameters.AddWithValue("@TeacherAidFull", TeacherAidFull)
            cmd.Parameters.AddWithValue("@TeacherAidPart", TeacherAidPart)
            cmd.Parameters.AddWithValue("@TeacherAidVol", TeacherAidVol)
            cmd.Parameters.AddWithValue("@CounselorsFull", CounselorsFull)
            cmd.Parameters.AddWithValue("@CounselorsPart", CounselorsPart)
            cmd.Parameters.AddWithValue("@CounselorsVol", CounselorsVol)
            cmd.Parameters.AddWithValue("@NursesFull", NursesFull)
            cmd.Parameters.AddWithValue("@NursesPart", NursesPart)
            cmd.Parameters.AddWithValue("@NursesVol", NursesVol)
            cmd.Parameters.AddWithValue("@OtherAdminFull", OtherAdminFull)
            cmd.Parameters.AddWithValue("@OtherAdminPart", OtherAdminPart)
            cmd.Parameters.AddWithValue("@OtherAdminVol", OtherAdminVol)
            cmd.Parameters.AddWithValue("@TeachersPerform", TeachersPerform)
            cmd.Parameters.AddWithValue("@ExpCriteria", ExpCriteria)
            cmd.Parameters.AddWithValue("@EvaluteStudents", EvaluteStudents)
            cmd.Parameters.AddWithValue("@ResultsShared", ResultsShared)
            cmd.Parameters.AddWithValue("@ImprovePerform", ImprovePerform)
            cmd.Parameters.AddWithValue("@Suspension", Suspension)
            cmd.Parameters.AddWithValue("@Dismissal", Dismissal)
            cmd.Parameters.AddWithValue("@SexHarass", SexHarass)
            cmd.Parameters.AddWithValue("@StudentAggres", StudentAggres)
            cmd.Parameters.AddWithValue("@Promotion", Promotion)
            cmd.Parameters.AddWithValue("@Acceptance", Acceptance)
            cmd.Parameters.AddWithValue("@DrugTesting", DrugTesting)
            cmd.Parameters.AddWithValue("@Weapons", Weapons)
            cmd.Parameters.AddWithValue("@WrittenPolicy", WrittenPolicy)
            cmd.Parameters.AddWithValue("@PriorEnrollment", PriorEnrollment)
            cmd.Parameters.AddWithValue("@AgainstSchool", AgainstSchool)
            cmd.Parameters.AddWithValue("@ExpClaim", ExpClaim)
            cmd.Parameters.AddWithValue("@Applevel", "11")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetSmpTeachersLiability(ByVal RequestNumber As Integer) As List(Of SmpTeachersLiability)
            Dim Application As New List(Of SmpTeachersLiability)

            'Create Connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, GradesStart, GradesEnd, MaxEnrollment, AveNumEnrolled, DateEstablished, WithDegreeFull, WithDegreePart, WithDegreeVol, WithoutDegreeFull, WithoutDegreePart, WithoutDegreeVol, TeacherAidFull, TeacherAidPart, TeacherAidVol, CounselorsPart, CounselorsFull, CounselorsVol, NursesFull, NursesPart, NursesVol, OtherAdminFull, OtherAdminPart, OtherAdminVol, TeachersPerform, ExpCriteria, EvaluteStudents, ResultsShared, ImprovePerform, Suspension, Dismissal, SexHarass, StudentAggres, Promotion, Acceptance, DrugTesting, Weapons, WrittenPolicy, PriorEnrollment, AgainstSchool, ExpClaim, Status, SubmitDate FROM SmpTeachersLiability WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New SmpTeachersLiability
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Gradesstart = CType(reader("GradesStart"), String)
                    ReadRecord.Gradesend = CType(reader("GradesEnd"), String)
                    ReadRecord.Maxenrollment = CType(reader("MaxEnrollment"), String)
                    ReadRecord.Avenumenrolled = CType(reader("AveNumEnrolled"), String)
                    ReadRecord.Dateestablished = CType(reader("DateEstablished"), Date)
                    ReadRecord.Withdegreefull = CType(reader("WithDegreeFull"), Integer)
                    ReadRecord.Withdegreepart = CType(reader("WithDegreePart"), Integer)
                    ReadRecord.Withdegreevol = CType(reader("WithDegreeVol"), Integer)
                    ReadRecord.Withoutdegreefull = CType(reader("WithoutDegreeFull"), Integer)
                    ReadRecord.Withoutdegreepart = CType(reader("WithoutDegreePart"), Integer)
                    ReadRecord.Withoutdegreevol = CType(reader("WithoutDegreeVol"), Integer)
                    ReadRecord.Teacheraidfull = CType(reader("TeacherAidFull"), Integer)
                    ReadRecord.Teacheraidpart = CType(reader("TeacherAidPart"), Integer)
                    ReadRecord.Teacheraidvol = CType(reader("TeacherAidVol"), Integer)
                    ReadRecord.Counselorspart = CType(reader("CounselorsPart"), Integer)
                    ReadRecord.Counselorsfull = CType(reader("CounselorsFull"), Integer)
                    ReadRecord.Counselorsvol = CType(reader("CounselorsVol"), Integer)
                    ReadRecord.Nursesfull = CType(reader("NursesFull"), Integer)
                    ReadRecord.Nursespart = CType(reader("NursesPart"), Integer)
                    ReadRecord.Nursesvol = CType(reader("NursesVol"), Integer)
                    ReadRecord.Otheradminfull = CType(reader("OtherAdminFull"), Integer)
                    ReadRecord.Otheradminpart = CType(reader("OtherAdminPart"), Integer)
                    ReadRecord.Otheradminvol = CType(reader("OtherAdminVol"), Integer)
                    ReadRecord.Teacersperform = CType(reader("TeachersPerform"), String)
                    ReadRecord.Expcriteria = CType(reader("ExpCriteria"), String)
                    ReadRecord.Evalutestudents = CType(reader("EvaluteStudents"), String)
                    ReadRecord.Resultsshared = CType(reader("ResultsShared"), String)
                    ReadRecord.Improveperform = CType(reader("ImprovePerform"), String)
                    ReadRecord.Suspension = CType(reader("Suspension"), String)
                    ReadRecord.Dismissal = CType(reader("Dismissal"), String)
                    ReadRecord.Sexharass = CType(reader("SexHarass"), String)
                    ReadRecord.Studentaggress = CType(reader("StudentAggres"), String)
                    ReadRecord.Promotion = CType(reader("Promotion"), String)
                    ReadRecord.Acceptance = CType(reader("Acceptance"), String)
                    ReadRecord.Drugtesting = CType(reader("DrugTesting"), String)
                    ReadRecord.Weapons = CType(reader("Weapons"), String)
                    ReadRecord.Writtenpolicy = CType(reader("WrittenPolicy"), String)
                    ReadRecord.Priorenrollment = CType(reader("PriorEnrollment"), String)
                    ReadRecord.Againstschool = CType(reader("AgainstSchool"), String)
                    ReadRecord.Expclaim = CType(reader("ExpClaim"), String)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While

            End Using
            Return Application
        End Function

        Public Shared Sub UpdateSmpTeachersLiability(ByVal RequestNumber As Integer, ByVal GradesStart As String, ByVal GradesEnd As String, ByVal MaxEnrollment As String, ByVal AveNumEnrolled As String, ByVal DateEstablished As Date, ByVal WithDegreeFull As Integer, ByVal WithDegreePart As Integer, ByVal WithDegreeVol As Integer, ByVal WithoutDegreeFull As Integer, ByVal WithoutDegreePart As Integer, ByVal WithoutDegreeVol As Integer, ByVal TeacherAidFull As Integer, ByVal TeacherAidPart As Integer, ByVal TeacherAidVol As Integer, ByVal CounselorsFull As Integer, ByVal CounselorsPart As Integer, ByVal CounselorsVol As Integer, ByVal NursesFull As Integer, ByVal NursesPart As Integer, ByVal NursesVol As Integer, ByVal OtherAdminFull As Integer, ByVal OtherAdminPart As Integer, ByVal OtherAdminVol As Integer, ByVal TeachersPerform As String, ByVal ExpCriteria As String, ByVal EvaluteStudents As String, ByVal ResultsShared As String, ByVal ImprovePerform As String, ByVal Suspension As String, ByVal Dismissal As String, ByVal SexHarass As String, ByVal StudentAggres As String, ByVal Promotion As String, ByVal Acceptance As String, ByVal DrugTesting As String, ByVal Weapons As String, ByVal WrittenPolicy As String, ByVal PriorEnrollment As String, ByVal AgainstSchool As String, ByVal ExpClaim As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE SmpTeachersLiability SET GrasSdetart=@Gradesstart, GradesEnd=@Gradesend, MaxEnrollment=@Maxenrollment, AveNumEnrolled=@Avenumenrolled, DateEstablished=@Dateestablished, WithDegreeFull=@Withdegreefull, WithDegreePart=@Withdegreepart, WithDegreeVol=@Withdegreevol, WithoutDegreeFull=@Withoutdegreefull, WithoutDegreePart=@Withoutdegreepart, WithoutDegreeVol=@Withoutdegreevol, TeacherAidFull=@TeacherAidFull, TeacherAidPart=@TeacherAidPart, TeacherAidVol=@Teacheraidvol, CounselorsFull=@Counselorsfull, CounselorsPart=@Counselorspart, CounselorsVol=@Counselorsvol, NursesFull=@Nursesfull, NursesPart=@Nursespart, NursesVol=@Nursesvol, OtherAdminFull=@Otheradminfull, OtherAdminPart=@Otheradminpart, OtherAdminVol=@Otheradminvol, TeachersPerform=@Teachersperform, ExpCriteria=@Expcriteria, EvaluteStudents=@Evalutestudents, ResultsShared=@Resultsshared, ImprovePerform=@Improveperform, Suspension=@Suspension, Dismissal=@Dismissal, SexHarass=@Sexharass, StudentAggres=@Studentaggres, Promotion=@Promotion, Acceptance=@Acceptance, DrugTesting=@Drugtesting, Weapons=@Weapons, WrittenPolicy=@Writtenpolicy, PriorEnrollment=@Priorenrollment, AgainstSchool=@Againstschool, ExpClaim=@Expclaim, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@Reqnum"
            cmd.CommandType = CommandType.Text

            'Add Parameters
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Gradesstart", GradesStart)
            cmd.Parameters.AddWithValue("@Gradesend", GradesEnd)
            cmd.Parameters.AddWithValue("@MaxEnrollment", MaxEnrollment)
            cmd.Parameters.AddWithValue("@AveNumEnrolled", AveNumEnrolled)
            cmd.Parameters.AddWithValue("@DateEstablished", DateEstablished)
            cmd.Parameters.AddWithValue("@WithDegreeFull", WithDegreeFull)
            cmd.Parameters.AddWithValue("@WithDegreePart", WithDegreePart)
            cmd.Parameters.AddWithValue("@WithDegreeVol", WithDegreeVol)
            cmd.Parameters.AddWithValue("@WithoutDegreeFull", WithoutDegreeFull)
            cmd.Parameters.AddWithValue("@WithoutDegreePart", WithDegreePart)
            cmd.Parameters.AddWithValue("@WithoutDegreeVol", WithoutDegreeVol)
            cmd.Parameters.AddWithValue("@TeacherAidFull", TeacherAidFull)
            cmd.Parameters.AddWithValue("@TeacherAidPart", TeacherAidPart)
            cmd.Parameters.AddWithValue("@TeacherAidVol", TeacherAidVol)
            cmd.Parameters.AddWithValue("@CounselorsFull", CounselorsFull)
            cmd.Parameters.AddWithValue("@CounselorsPart", CounselorsPart)
            cmd.Parameters.AddWithValue("@CounselorsVol", CounselorsVol)
            cmd.Parameters.AddWithValue("@NursesFull", NursesFull)
            cmd.Parameters.AddWithValue("@NursesPart", NursesPart)
            cmd.Parameters.AddWithValue("@NursesVol", NursesVol)
            cmd.Parameters.AddWithValue("@OtherAdminFull", OtherAdminFull)
            cmd.Parameters.AddWithValue("@OtherAdminPart", OtherAdminPart)
            cmd.Parameters.AddWithValue("@OtherAdminVol", OtherAdminVol)
            cmd.Parameters.AddWithValue("@TeachersPerform", TeachersPerform)
            cmd.Parameters.AddWithValue("@ExpCriteria", ExpCriteria)
            cmd.Parameters.AddWithValue("@EvaluteStudents", EvaluteStudents)
            cmd.Parameters.AddWithValue("@ResultsShared", ResultsShared)
            cmd.Parameters.AddWithValue("@ImprovePerform", ImprovePerform)
            cmd.Parameters.AddWithValue("@Suspension", Suspension)
            cmd.Parameters.AddWithValue("@Dismissal", Dismissal)
            cmd.Parameters.AddWithValue("@SexHarass", SexHarass)
            cmd.Parameters.AddWithValue("@StudentAggres", StudentAggres)
            cmd.Parameters.AddWithValue("@Promotion", Promotion)
            cmd.Parameters.AddWithValue("@Acceptance", Acceptance)
            cmd.Parameters.AddWithValue("@DrugTesting", DrugTesting)
            cmd.Parameters.AddWithValue("@Weapons", Weapons)
            cmd.Parameters.AddWithValue("@WrittenPolicy", WrittenPolicy)
            cmd.Parameters.AddWithValue("@PriorEnrollment", PriorEnrollment)
            cmd.Parameters.AddWithValue("@AgainstSchool", AgainstSchool)
            cmd.Parameters.AddWithValue("@ExpClaim", ExpClaim)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertBaApplication(ByVal RequestNumber As Integer, ByVal CurrentCarrier As String, ByVal CurrentPrem As String, ByVal LiabilityLimit As Decimal, ByVal PhysicalDamage As String, ByVal DriversAge As String, ByVal ExpComments As String, ByVal PastLosses As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO BaApplicationDetails (RequestNumber, CurrentCarrier, CurrentBaPrem, LiabilityLimit, PhysicalDamage, DriversAge, ExpComments, PastLosses, PastLossDate1, PastLossDescr1, PastLossAmount1, PastLossDate2, PastLossDescr2, PastLossAmount2,  PastLossDate3, PastLossDescr3, PastLossAmount3, PastLossDate4, PastLossDescr4, PastLossAmount4, PastLossDate5, PastLossDescr5, PastLossAmount5, AppLevel, Status, SubmitDate) VALUES (@Reqnum, @Currentcarrier, @Currentbaprem, @Liabilitylimit, @Physicaldamage, @Driversage, @Expcomments, @Pastlosses, @Pastlossdate1, @Pastlossdescr1, @Pastlossamount1, @Pastlossdate2, @Pastlossdescr2, @Pastlossamount2,  @Pastlossdate3, @Pastlossdescr3, @Pastlossamount3, @Pastlossdate4, @Pastlossdescr4, @Pastlossamount4, @Pastlossdate5, @Pastlossdescr5, @Pastlossamount5, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add Parameters
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Currentbaprem", CurrentPrem)
            cmd.Parameters.AddWithValue("@Liabilitylimit", LiabilityLimit)
            cmd.Parameters.AddWithValue("@Physicaldamage", PhysicalDamage)
            cmd.Parameters.AddWithValue("@Driversage", DriversAge)
            cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
            cmd.Parameters.AddWithValue("@Pastlosses", PastLosses)
            cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
            cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
            cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
            cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
            cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
            cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
            cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
            cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
            cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
            cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
            cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
            cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
            cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
            cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
            cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
            cmd.Parameters.AddWithValue("@Applevel", "12")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub


        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetBaApplication(ByVal RequestNumber As Integer) As List(Of BaApplicationDetails)
            Dim Application As New List(Of BaApplicationDetails)

            Dim con As SqlConnection = New SqlConnection(_connectionString)

            Dim cmd As SqlCommand = New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, CurrentCarrier, CurrentBaPrem, LiabilityLimit, PhysicalDamage, DriversAge, ExpComments, PastLosses, PastLossDate1, PastLossDescr1, PastLossAmount1, PastLossDate2, PastLossDescr2, PastLossAmount2, PastLossDate3, PastLossDescr3, PastLossAmount3, PastLossDate4, PastLossDescr4, PastLossAmount4, PastLossDate5, PastLossDescr5, PastLossAmount5, AppLevel, Status, SubmitDate FROM BaApplicationDetails WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New BaApplicationDetails()
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Currentcarrier = CType(reader("CurrentCarrier"), String)
                    ReadRecord.Currentbaprem = CType(reader("CurrentBaPrem"), String)
                    ReadRecord.LiabilityLimit = CType(reader("LiabilityLimit"), Decimal)
                    ReadRecord.Physicaldamage = CType(reader("PhysicalDamage"), String)
                    ReadRecord.Driversage = CType(reader("DriversAge"), String)
                    ReadRecord.Expcomments = CType(reader("ExpComments"), String)
                    ReadRecord.PastLosses = CType(reader("PastLosses"), String)
                    ReadRecord.PastLossDate1 = CType(reader("PastLossDate1"), Date)
                    ReadRecord.PastLossDescr1 = CType(reader("PastLossDescr1"), String)
                    ReadRecord.Pastlossamount1 = CType(reader("PastLossAmount1"), Decimal)
                    ReadRecord.PastLossDate2 = CType(reader("PastLossDate2"), Date)
                    ReadRecord.PastLossDescr2 = CType(reader("PastLossDescr2"), String)
                    ReadRecord.Pastlossamount2 = CType(reader("PastLossAmount2"), Decimal)
                    ReadRecord.PastLossDate3 = CType(reader("PastLossDate3"), Date)
                    ReadRecord.PastLossDescr3 = CType(reader("PastLossDescr3"), String)
                    ReadRecord.Pastlossamount3 = CType(reader("PastLossAmount3"), Decimal)
                    ReadRecord.PastLossDate4 = CType(reader("PastLossDate4"), Date)
                    ReadRecord.PastLossDescr4 = CType(reader("PastLossDescr4"), String)
                    ReadRecord.Pastlossamount4 = CType(reader("PastLossAmount4"), Decimal)
                    ReadRecord.PastLossDate5 = CType(reader("PastLossDate5"), Date)
                    ReadRecord.PastLossDescr5 = CType(reader("PastLossDescr5"), String)
                    ReadRecord.Pastlossamount5 = CType(reader("PastLossAmount5"), Decimal)
                    ReadRecord.Applevel = CType(reader("AppLevel"), Integer)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using
            Return Application
        End Function

        Public Shared Sub UpdateBaApplication(ByVal RequestNumber As Integer, ByVal CurrentCarrier As String, ByVal CurrentBaPrem As String, ByVal LiabilityLimit As Decimal, ByVal PhysicalDamage As String, ByVal DriversAge As String, ByVal ExpComments As String, ByVal PastLosses As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
            'Allow the user to perform after ending the entire process 1/03/2013
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE BaApplicationDetails SET CurrentCarrier=@Currentcarrier, CurrentPrem=@Currentbaprem, LiabilityLimit=@Liabilitylimit, PhysicalDamage=@Physicaldamage, DriversAge=@Driversage, ExpComments=@Expcomments, PastLosses=@Pastlosses, PastLossDate1=@Pastlossdate1, PastLossDescr1=@Pastlossdescr1, PastLossAmount1=@Pastlossamount1, PastLossDate2=@Pastlossdate2, PastLossDescr2=@Pastlossdescr2, PastLossAmount2=@Pastlossamount2, PastLossDate3=@Pastlossdate3, PastLossDescr3=@Pastlossdescr3, PastLossAmount3=@Pastlossamount3, PastLossDate4=@Pastlossdate4, PastLossDescr4=@Pastlossdescr4, PastLossAmount4=@Pastlossamount4, PastLossDate5=@Pastlossdate5, PastLossDescr5=@Pastlossdescr5, PastLossAmount5=@Pastlossamount5, SubmitDate=@TodayDate WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Currentbaprem", CurrentBaPrem)
            cmd.Parameters.AddWithValue("@Liabilitylimit", LiabilityLimit)
            cmd.Parameters.AddWithValue("@Physicaldamage", PhysicalDamage)
            cmd.Parameters.AddWithValue("@Driversage", DriversAge)
            cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
            cmd.Parameters.AddWithValue("@Pastlosses", PastLosses)
            cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
            cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
            cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
            cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
            cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
            cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
            cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
            cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
            cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
            cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
            cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
            cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
            cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
            cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
            cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub InsertChurchVehicle(ByVal UserNameIs As String, ByVal RequestNumber As Integer, ByVal VehicleYear As Integer, ByVal Make As String, ByVal Model As String, ByVal VIN As String, ByVal NumOfPassengers As Integer, ByVal CostNew As Decimal, ByVal County As String, ByVal RadiusOfOperation As String, ByVal LiabilityOnly As String, ByVal CompDeduct As Decimal, ByVal CollisionDeduct As Decimal, ByVal RentalReimbur As Decimal, ByVal TowingLabor As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO BaChurchVehicle (AgentNumber, RequestNumber, VehicleYear, Make, Model, VIN, NumOfPassengers, CostNew, County, RadiusOfOperation, LiabilityOnly, CompDeduct, CollisionDeduct, RentalReimbur, TowingLabor, Status, TodayDate) VALUES (@UserNameIs, @Reqnum, @Vehicleyear, @Make, @Model, @Vin, @Numofpassengers, @Costnew, @County, @Radiusofoperation, @Liabilityonly, @Compdeduct, @Collisiondeduct, @Rentalreimbur, @Towinglabor, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add Parameters
            cmd.Parameters.AddWithValue("@UserNameIs", UserNameIs)
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.Parameters.AddWithValue("@Vehicleyear", VehicleYear)
            cmd.Parameters.AddWithValue("@Make", Make)
            cmd.Parameters.AddWithValue("@Model", Model)
            cmd.Parameters.AddWithValue("@Vin", VIN)
            cmd.Parameters.AddWithValue("@Numofpassengers", NumOfPassengers)
            cmd.Parameters.AddWithValue("@Costnew", CostNew)
            cmd.Parameters.AddWithValue("@County", County)
            cmd.Parameters.AddWithValue("@Radiusofoperation", RadiusOfOperation)
            cmd.Parameters.AddWithValue("@Liabilityonly", LiabilityOnly)
            cmd.Parameters.AddWithValue("@Compdeduct", CompDeduct)
            cmd.Parameters.AddWithValue("@Collisiondeduct", CollisionDeduct)
            cmd.Parameters.AddWithValue("@Rentalreimbur", RentalReimbur)
            cmd.Parameters.AddWithValue("@Towinglabor", TowingLabor)
            cmd.Parameters.AddWithValue("@Status", "Open")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetChurchVehicle(ByVal RequestNumber As Integer) As List(Of BaChurchVehicle)
            Dim Vehicle As New List(Of BaChurchVehicle)

            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            'cmd.CommandText = "SELECT VehicleId, AgentNumber, RequestNumber, VehicleYear, Make, Model, VIN, NumOfPassengers, CostNew, County, RadiusOfOperation, LiabilityOnly, CompDeduct, CollisionDeduct, RentalReimbur, TowingLabor, Status, TodayDate FROM BaChurchVehicle WHERE Status = 'Open' AND TodayDate = @ddate AND RequestNumber = @ReqNum"
            cmd.CommandText = "SELECT VehicleId, AgentNumber, RequestNumber, VehicleYear, Make, Model, VIN, NumOfPassengers, CostNew, County, RadiusOfOperation, LiabilityOnly, CompDeduct, CollisionDeduct, RentalReimbur, TowingLabor, Status, TodayDate FROM BaChurchVehicle WHERE Status = 'Open' AND RequestNumber = @Reqnum"
            'cmd.Parameters.AddWithValue("@ddate", ddate)
            cmd.Parameters.AddWithValue("@Reqnum", RequestNumber)
            cmd.CommandType = CommandType.Text

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New BaChurchVehicle()
                    ReadRecord.Vehicleid = CType(reader("VehicleId"), Integer)
                    ReadRecord.Agentnum = CType(reader("AgentNumber"), String)
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Year = CType(reader("VehicleYear"), Integer)
                    ReadRecord.Make = CType(reader("Make"), String)
                    ReadRecord.Model = CType(reader("Model"), String)
                    ReadRecord.VIN = CType(reader("VIN"), String)
                    ReadRecord.Numofpassen = CType(reader("NumOfPassengers"), Integer)
                    ReadRecord.Costnew = CType(reader("CostNew"), Decimal)
                    ReadRecord.County = CType(reader("County"), String)
                    ReadRecord.Radiusofoperation = CType(reader("RadiusOfOperation"), String)
                    ReadRecord.Liability = CType(reader("LiabilityOnly"), String)
                    ReadRecord.Compdeduct = CType(reader("CompDeduct"), Decimal)
                    ReadRecord.Collision = CType(reader("CollisionDeduct"), Decimal)
                    ReadRecord.Rental = CType(reader("RentalReimbur"), Decimal)
                    ReadRecord.Towing = CType(reader("TowingLabor"), Decimal)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("TodayDate"), Date)
                    Vehicle.Add(ReadRecord)
                End While
            End Using

            Return Vehicle
        End Function

        Public Shared Sub UpdateVehicle(ByVal Vehicleid As Integer, ByVal Year As Integer, ByVal Make As String, ByVal Model As String, ByVal VIN As String, ByVal Numofpassen As Integer, ByVal Costnew As Decimal, ByVal County As String, ByVal Radiusofoperation As String, ByVal Liability As String, ByVal Compdeduct As Decimal, ByVal Collision As Decimal, ByVal Rental As Decimal, ByVal Towing As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE BaChurchVehicle SET VehicleYear=@Year, Make=@Make, Model=@Model, VIN=@VIN, NumOfPassengers=@Numofpassen, CostNew=@Costnew, County=@County, RadiusOfOperation=@Radiusofoperation, LiabilityOnly=@Liability, CompDeduct=@Compdeduct, CollisionDeduct=@Collision, RentalReimbur=@Rental, TowingLabor=@Towing WHERE VehicleId=@Vehicleid"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Vehicleid", Vehicleid)
            cmd.Parameters.AddWithValue("@Year", Year)
            cmd.Parameters.AddWithValue("@Make", Make)
            cmd.Parameters.AddWithValue("@Model", Model)
            cmd.Parameters.AddWithValue("@VIN", VIN)
            cmd.Parameters.AddWithValue("@Numofpassen", Numofpassen)
            cmd.Parameters.AddWithValue("@Costnew", Costnew)
            cmd.Parameters.AddWithValue("@County", County)
            cmd.Parameters.AddWithValue("@Radiusofoperation", Radiusofoperation)
            cmd.Parameters.AddWithValue("@Liability", Liability)
            cmd.Parameters.AddWithValue("@Compdeduct", Compdeduct)
            cmd.Parameters.AddWithValue("@Collision", Collision)
            cmd.Parameters.AddWithValue("@Rental", Rental)
            cmd.Parameters.AddWithValue("@Towing", Towing)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        Public Shared Sub DeleteVehicle(ByVal VehicleId As Integer)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "DELETE BaChurchVehicle WHERE VehicleId=@Id"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@Id", VehicleId)

            'Execute command
            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub


        Public Shared Sub InsertWcApplication(ByVal RequestNumber As Integer, ByVal FID As String, ByVal CurrentCarrier As String, ByVal CurrentWcPremium As Decimal, ByVal CodesClassNOE1 As String, ByVal CodesClassEAR1 As Decimal, ByVal CodesClassNOE2 As String, ByVal CodesClassEAR2 As Decimal, ByVal CodesClassNOE3 As String, ByVal CodesClassEAR3 As Decimal, ByVal CodesClassNOE4 As String, ByVal CodesClassEAR4 As Decimal, ByVal CodesClassNOE5 As String, ByVal CodesClassEAR5 As Decimal, ByVal CodesClassNOE6 As String, ByVal CodesClassEAR6 As Decimal, ByVal ExpCodesClass As String, ByVal Watercraft As String, ByVal Engaged As String, ByVal SubContractor As String, ByVal SafetyProgram As String, ByVal UnderSixteen As String, ByVal OverSixtyfive As String, ByVal Handicap As String, ByVal Travel As String, ByVal ReqPhysicals As String, ByVal Transportation As String, ByVal PriorCoverage As String, ByVal ExpComments As String, ByVal PastLoss As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO WcApplicationDetails (RequestNumber, FID, CurrentCarrier, CurrentWcPremium, CodesClassNOE1, CodesClassEAR1, CodesClassNOE2, CodesClassEAR2, CodesClassNOE3, CodesClassEAR3, CodesClassNOE4, CodesClassEAR4, CodesClassNOE5, CodesClassEAR5, CodesClassNOE6, CodesClassEAR6, ExpCodesClass, Watercraft, Engaged, SubContractor, SafetyProgram, UnderSixteen, OverSixtyfive, Handicap, Travel, ReqPhysicals, Transportation, PriorCoverage, ExpComments, PastLoss, PastLossDate1, PastLossDescr1, PastLossAmount1, PastLossDate2, PastLossDescr2, PastLossAmount2, PastLossDate3, PastLossDescr3, PastLossAmount3, PastLossDate4, PastLossDescr4, PastLossAmount4, PastLossDate5, PastLossDescr5, PastLossAmount5, AppLevel, Status, SubmitDate) VALUES (@ReqNum, @FID, @Currentcarrier, @Currentwcpremium, @Codesclassnoe1, @Codesclassear1, @Codesclassnoe2, @Codesclassear2, @Codesclassnoe3, @Codesclassear3, @Codesclassnoe4, @Codesclassear4, @Codesclassnoe5, @Codesclassear5, @Codesclassnoe6, @Codesclassear6, @Expcodesclass, @Watercraft, @Engaged, @Subcontractor, @Safetyprogram, @Undersixteen, @Oversixtyfive, @Handicap, @Travel, @Reqphysicals, @Transportation, @Priorcoverage, @Expcomments, @Pastloss, @Pastlossdate1, @Pastlossdescr1, @Pastlossamount1, @Pastlossdate2, @Pastlossdescr2, @Pastlossamount2, @Pastlossdate3, @Pastlossdescr3, @Pastlossamount3, @Pastlossdate4, @Pastlossdescr4, @Pastlossamount4, @Pastlossdate5, @Pastlossdescr5, @Pastlossamount5, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@FID", FID)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Currentwcpremium", CurrentWcPremium)
            cmd.Parameters.AddWithValue("@Codesclassnoe1", CodesClassNOE1)
            cmd.Parameters.AddWithValue("@Codesclassear1", CodesClassEAR1)
            cmd.Parameters.AddWithValue("@Codesclassnoe2", CodesClassNOE2)
            cmd.Parameters.AddWithValue("@Codesclassear2", CodesClassEAR2)
            cmd.Parameters.AddWithValue("@Codesclassnoe3", CodesClassNOE3)
            cmd.Parameters.AddWithValue("@Codesclassear3", CodesClassEAR3)
            cmd.Parameters.AddWithValue("@Codesclassnoe4", CodesClassNOE4)
            cmd.Parameters.AddWithValue("@Codesclassear4", CodesClassEAR4)
            cmd.Parameters.AddWithValue("@Codesclassnoe5", CodesClassNOE5)
            cmd.Parameters.AddWithValue("@Codesclassear5", CodesClassEAR5)
            cmd.Parameters.AddWithValue("@Codesclassnoe6", CodesClassNOE6)
            cmd.Parameters.AddWithValue("@Codesclassear6", CodesClassEAR6)
            cmd.Parameters.AddWithValue("@Expcodesclass", ExpCodesClass)
            cmd.Parameters.AddWithValue("@Watercraft", Watercraft)
            cmd.Parameters.AddWithValue("@Engaged", Engaged)
            cmd.Parameters.AddWithValue("@Subcontractor", SubContractor)
            cmd.Parameters.AddWithValue("@Safetyprogram", SafetyProgram)
            cmd.Parameters.AddWithValue("@Undersixteen", UnderSixteen)
            cmd.Parameters.AddWithValue("@Oversixtyfive", OverSixtyfive)
            cmd.Parameters.AddWithValue("@Handicap", Handicap)
            cmd.Parameters.AddWithValue("@Travel", Travel)
            cmd.Parameters.AddWithValue("@Reqphysicals", ReqPhysicals)
            cmd.Parameters.AddWithValue("@Transportation", Transportation)
            cmd.Parameters.AddWithValue("@Priorcoverage", PriorCoverage)
            cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
            cmd.Parameters.AddWithValue("@Pastloss", PastLoss)
            cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
            cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
            cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
            cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
            cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
            cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
            cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
            cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
            cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
            cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
            cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
            cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
            cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
            cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
            cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
            cmd.Parameters.AddWithValue("@Applevel", "14")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetWcApplicationDetails(ByVal RequestNumber As Integer) As List(Of WcApplicationDetails)
            Dim Application As New List(Of WcApplicationDetails)

            Dim con As SqlConnection = New SqlConnection(_connectionString)

            Dim cmd As SqlCommand = New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, FID, CurrentCarrier, CurrentWcPremium, CodesClassNOE1, CodesClassEAR1, CodesClassNOE2, CodesClassEAR2, CodesClassNOE3, CodesClassEAR3, CodesClassNOE4, CodesClassEAR4, CodesClassNOE5, CodesClassEAR5, CodesClassNOE6, CodesClassEAR6, ExpCodesClass, Watercraft, Engaged, SubContractor, SafetyProgram, UnderSixteen, OverSixtyfive, Handicap, Travel, ReqPhysicals, Transportation, PriorCoverage, ExpComments, PastLoss, PastLossDate1, PastLossDescr1, PastLossAmount1, PastLossDate2, PastLossDescr2, PastLossAmount2, PastLossDate3, PastLossDescr3, PastLossAmount3, PastLossDate4, PastLossDescr4, PastLossAmount4, PastLossDate5, PastLossDescr5, PastLossAmount5, Status, SubmitDate FROM WcApplicationDetails WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New WcApplicationDetails()
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Fid = CType(reader("FID"), String)
                    ReadRecord.Currentcarrier = CType(reader("CurrentCarrier"), String)
                    ReadRecord.Currentwcpremium = CType(reader("CurrentWcPremium"), Decimal)
                    ReadRecord.Codesclassnoe1 = CType(reader("CodesClassNOE1"), String)
                    ReadRecord.Codesclassear1 = CType(reader("CodesClassEar1"), Decimal)
                    ReadRecord.Codesclassnoe2 = CType(reader("CodesClassNOE2"), String)
                    ReadRecord.Codesclassear2 = CType(reader("CodesClassEar2"), Decimal)
                    ReadRecord.Codesclassnoe3 = CType(reader("CodesClassNOE3"), String)
                    ReadRecord.Codesclassear3 = CType(reader("CodesClassEar3"), Decimal)
                    ReadRecord.Codesclassnoe4 = CType(reader("CodesClassNOE4"), String)
                    ReadRecord.Codesclassear4 = CType(reader("CodesClassEar4"), Decimal)
                    ReadRecord.Codesclassnoe5 = CType(reader("CodesClassNOE5"), String)
                    ReadRecord.Codesclassear5 = CType(reader("CodesClassEar5"), Decimal)
                    ReadRecord.Codesclassnoe6 = CType(reader("CodesClassNOE6"), String)
                    ReadRecord.Codesclassear6 = CType(reader("CodesClassEar6"), Decimal)
                    ReadRecord.Expcodesclass = CType(reader("ExpCodesClass"), String)
                    ReadRecord.Watercraft = CType(reader("Watercraft"), String)
                    ReadRecord.Engaged = CType(reader("Engaged"), String)
                    ReadRecord.Subcontractor = CType(reader("SubContractor"), String)
                    ReadRecord.Safetyprogram = CType(reader("SafetyProgram"), String)
                    ReadRecord.Undersixteen = CType(reader("UnderSixteen"), String)
                    ReadRecord.Oversixtyfive = CType(reader("OverSixtyfive"), String)
                    ReadRecord.Handicap = CType(reader("Handicap"), String)
                    ReadRecord.Travel = CType(reader("Travel"), String)
                    ReadRecord.Reqphysicals = CType(reader("ReqPhysicals"), String)
                    ReadRecord.Transportation = CType(reader("Transportation"), String)
                    ReadRecord.Priorcoverage = CType(reader("PriorCoverage"), String)
                    ReadRecord.Expcomments = CType(reader("ExpComments"), String)
                    ReadRecord.Pastloss = CType(reader("PastLoss"), String)
                    ReadRecord.PastLossDate1 = CType(reader("PastLossDate1"), Date)
                    ReadRecord.PastLossDescr1 = CType(reader("PastLossDescr1"), String)
                    ReadRecord.PastLossAmount1 = CType(reader("PastLossAmount1"), Decimal)
                    ReadRecord.PastLossDate2 = CType(reader("PastLossDate2"), Date)
                    ReadRecord.PastLossDescr2 = CType(reader("PastLossDescr2"), String)
                    ReadRecord.PastLossAmount2 = CType(reader("PastLossAmount2"), Decimal)
                    ReadRecord.PastLossDate3 = CType(reader("PastLossDate3"), Date)
                    ReadRecord.PastLossDescr3 = CType(reader("PastLossDescr3"), String)
                    ReadRecord.PastLossAmount3 = CType(reader("PastLossAmount3"), Decimal)
                    ReadRecord.PastLossDate4 = CType(reader("PastLossDate4"), Date)
                    ReadRecord.PastLossDescr4 = CType(reader("PastLossDescr4"), String)
                    ReadRecord.PastLossAmount4 = CType(reader("PastLossAmount4"), Decimal)
                    ReadRecord.PastLossDate5 = CType(reader("PastLossDate5"), Date)
                    ReadRecord.PastLossDescr5 = CType(reader("PastLossDescr5"), String)
                    ReadRecord.PastLossAmount5 = CType(reader("PastLossAmount5"), Decimal)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using

            Return Application
        End Function

        'Public Shared Sub UpdateWcApplication(ByVal RequestNumber As Integer, ByVal FID As String, ByVal CurrentCarrier As String, ByVal CurrentWcPremium As Decimal, ByVal CodesClassNOE1 As String, ByVal CodesClassEAR1 As Decimal, ByVal CodesClassNOE2 As String, ByVal CodesClassEAR2 As Decimal, ByVal CodesClassNOE3 As String, ByVal CodesClassEAR3 As Decimal, ByVal CodesClassNOE4 As String, ByVal CodesClassEAR4 As Decimal, ByVal CodesClassNOE5 As String, ByVal CodesClassEAR5 As Decimal, ByVal CodesClassNOE6 As String, ByVal CodesClassEAR6 As Decimal, ByVal ExpCodesClass As String, ByVal Watercraft As String, ByVal Engaged As String, ByVal SubContractor As String, ByVal SafetyProgram As String, ByVal UnderSixteen As String, ByVal OverSixtyfive As String, ByVal Handicap As String, ByVal Travel As String, ByVal ReqPhysicals As String, ByVal Transportation As String, ByVal PriorCoverage As String, ByVal ExpComments As String, ByVal PastLoss As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
        '    'Create connection
        '    Dim con As SqlConnection = New SqlConnection(_connectionString)

        '    'Create command
        '    Dim cmd As SqlCommand = New SqlCommand()
        '    cmd.Connection = con
        '    cmd.CommandText = "UPDATE WcApplicationDetails SET FID=@FID, CurrentCarrier=@Currentcarrier, CurrentWcPremium=@Currentwcpremium, CodesClassNOE1=@Codesclassnoe1, CodesClassEAR1=@Codesclassear1, CodesClassNOE2=@Codesclassnoe2, CodesClassEAR2=@Codesclassear2, CodesClassNOE3=@Codesclassnoe3, CodesClassEAR3=@Codesclassear3, CodesClassNOE4=@Codesclassnoe4, CodesClassEAR4=@Codesclassear4, CodesClassNOE5=@Codesclassnoe5, CodesClassEAR5=@Codesclassear5, CodesClassNOE6=@Codesclassnoe6, CodesClassEAR6=@Codesclassear6, ExpCodesClass=@Expcodesclass, Watercraft=@Watercraft, Engaged=@Engaged, SubContractor=@Subcontractor, SafetyProgram=@Safetyprogram, UnderSixteen=@Undersixteen, OverSixtyfive=@Oversixtyfive, Handicap=@Handicap, Travel=@Travel, ReqPhysicals=@Reqphysicals, Transportation=@Transportation, PriorCoverage=@Priorcoverage, ExpComments=@Expcomments, PastLoss=@Pastloss, PastLossDate1=@Pastlossdate1, PastLossDescr1=@Pastlossdescr1, PastLossAmount1=@Pastlossamount1, PastLossDate2=@Pastlossdate2, PastLossDescr2=@Pastlossdescr2, PastLossAmount2=@Pastlossamount2, PastLossDate3=@Pastlossdate3, PastLossDescr3=@Pastlossdescr3, PastLossAmount3=@Pastlossamount3, PastLossDate4=@Pastlossdate4, PastLossDescr4=@Pastlossdescr4, PastLossAmount4=@Pastlossamount4, PastLossDate5=@Pastlossdate5, PastLossDescr5=@Pastlossdescr5, PastLossAmount5=@Pastlossamount5 WHERE VehicleId=@Vehicleid"
        '    cmd.CommandType = CommandType.Text

        '    'Add parameter
        '    cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
        '    cmd.Parameters.AddWithValue("@FID", FID)
        '    cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
        '    cmd.Parameters.AddWithValue("@Currentwcpremium", CurrentWcPremium)
        '    cmd.Parameters.AddWithValue("@Codesclassnoe1", CodesClassNOE1)
        '    cmd.Parameters.AddWithValue("@Codesclassear1", CodesClassEAR1)
        '    cmd.Parameters.AddWithValue("@Codesclassnoe2", CodesClassNOE2)
        '    cmd.Parameters.AddWithValue("@Codesclassear2", CodesClassEAR2)
        '    cmd.Parameters.AddWithValue("@Codesclassnoe3", CodesClassNOE3)
        '    cmd.Parameters.AddWithValue("@Codesclassear3", CodesClassEAR3)
        '    cmd.Parameters.AddWithValue("@Codesclassnoe4", CodesClassNOE4)
        '    cmd.Parameters.AddWithValue("@Codesclassear4", CodesClassEAR4)
        '    cmd.Parameters.AddWithValue("@Codesclassnoe5", CodesClassNOE5)
        '    cmd.Parameters.AddWithValue("@Codesclassear5", CodesClassEAR5)
        '    cmd.Parameters.AddWithValue("@Codesclassnoe6", CodesClassNOE6)
        '    cmd.Parameters.AddWithValue("@Codesclassear6", CodesClassEAR6)
        '    cmd.Parameters.AddWithValue("@Expcodesclass", ExpCodesClass)
        '    cmd.Parameters.AddWithValue("@Watercraft", Watercraft)
        '    cmd.Parameters.AddWithValue("@Engaged", Engaged)
        '    cmd.Parameters.AddWithValue("@Subcontractor", SubContractor)
        '    cmd.Parameters.AddWithValue("@Safetyprogram", SafetyProgram)
        '    cmd.Parameters.AddWithValue("@Undersixteen", UnderSixteen)
        '    cmd.Parameters.AddWithValue("@Oversixtyfive", OverSixtyfive)
        '    cmd.Parameters.AddWithValue("@Handicap", Handicap)
        '    cmd.Parameters.AddWithValue("@Travel", Travel)
        '    cmd.Parameters.AddWithValue("@Reqphysicals", ReqPhysicals)
        '    cmd.Parameters.AddWithValue("@Transportation", Transportation)
        '    cmd.Parameters.AddWithValue("@Priorcoverage", PriorCoverage)
        '    cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
        '    cmd.Parameters.AddWithValue("@Pastloss", PastLoss)
        '    cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
        '    cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
        '    cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
        '    cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
        '    cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
        '    cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
        '    cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
        '    cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
        '    cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
        '    cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
        '    cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
        '    cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
        '    cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
        '    cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
        '    cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
        '    'cmd.Parameters.AddWithValue("@Status", "open")
        '    'cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

        '    Using con
        '        con.Open()
        '        cmd.ExecuteNonQuery()
        '    End Using

        'End Sub

        Public Shared Sub UpdateWcApplication1(ByVal RequestNumber As Integer, ByVal FID As String, ByVal CurrentCarrier As String, ByVal CurrentWcPremium As Decimal, ByVal CodesClassNOE1 As String, ByVal CodesClassEAR1 As Decimal, ByVal CodesClassNOE2 As String, ByVal CodesClassEAR2 As Decimal, ByVal CodesClassNOE3 As String, ByVal CodesClassEAR3 As Decimal, ByVal CodesClassNOE4 As String, ByVal CodesClassEAR4 As Decimal, ByVal CodesClassNOE5 As String, ByVal CodesClassEAR5 As Decimal, ByVal CodesClassNOE6 As String, ByVal CodesClassEAR6 As Decimal, ByVal ExpCodesClass As String)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE WcApplicationDetails SET FID=@FID, CurrentCarrier=@Currentcarrier, CurrentWcPremium=@Currentwcpremium, CodesClassNOE1=@Codesclassnoe1, CodesClassEAR1=@Codesclassear1, CodesClassNOE2=@Codesclassnoe2, CodesClassEAR2=@Codesclassear2, CodesClassNOE3=@Codesclassnoe3, CodesClassEAR3=@Codesclassear3, CodesClassNOE4=@Codesclassnoe4, CodesClassEAR4=@Codesclassear4, CodesClassNOE5=@Codesclassnoe5, CodesClassEAR5=@Codesclassear5, CodesClassNOE6=@Codesclassnoe6, CodesClassEAR6=@Codesclassear6, ExpCodesClass=@Expcodesclass, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@FID", FID)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Currentwcpremium", CurrentWcPremium)
            cmd.Parameters.AddWithValue("@Codesclassnoe1", CodesClassNOE1)
            cmd.Parameters.AddWithValue("@Codesclassear1", CodesClassEAR1)
            cmd.Parameters.AddWithValue("@Codesclassnoe2", CodesClassNOE2)
            cmd.Parameters.AddWithValue("@Codesclassear2", CodesClassEAR2)
            cmd.Parameters.AddWithValue("@Codesclassnoe3", CodesClassNOE3)
            cmd.Parameters.AddWithValue("@Codesclassear3", CodesClassEAR3)
            cmd.Parameters.AddWithValue("@Codesclassnoe4", CodesClassNOE4)
            cmd.Parameters.AddWithValue("@Codesclassear4", CodesClassEAR4)
            cmd.Parameters.AddWithValue("@Codesclassnoe5", CodesClassNOE5)
            cmd.Parameters.AddWithValue("@Codesclassear5", CodesClassEAR5)
            cmd.Parameters.AddWithValue("@Codesclassnoe6", CodesClassNOE6)
            cmd.Parameters.AddWithValue("@Codesclassear6", CodesClassEAR6)
            cmd.Parameters.AddWithValue("@Expcodesclass", ExpCodesClass)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        Public Shared Sub UpdateWcApplication2(ByVal RequestNumber As Integer, ByVal Watercraft As String, ByVal Engaged As String, ByVal SubContractor As String, ByVal SafetyProgram As String, ByVal UnderSixteen As String, ByVal OverSixtyfive As String, ByVal Handicap As String, ByVal Travel As String, ByVal ReqPhysicals As String, ByVal Transportation As String, ByVal PriorCoverage As String, ByVal ExpComments As String, ByVal PastLoss As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE WcApplicationDetails SET Watercraft=@Watercraft, Engaged=@Engaged, SubContractor=@Subcontractor, SafetyProgram=@Safetyprogram, UnderSixteen=@Undersixteen, OverSixtyfive=@Oversixtyfive, Handicap=@Handicap, Travel=@Travel, ReqPhysicals=@Reqphysicals, Transportation=@Transportation, PriorCoverage=@Priorcoverage, ExpComments=@Expcomments, PastLoss=@Pastloss, PastLossDate1=@Pastlossdate1, PastLossDescr1=@Pastlossdescr1, PastLossAmount1=@Pastlossamount1, PastLossDate2=@Pastlossdate2, PastLossDescr2=@Pastlossdescr2, PastLossAmount2=@Pastlossamount2, PastLossDate3=@Pastlossdate3, PastLossDescr3=@Pastlossdescr3, PastLossAmount3=@Pastlossamount3, PastLossDate4=@Pastlossdate4, PastLossDescr4=@Pastlossdescr4, PastLossAmount4=@Pastlossamount4, PastLossDate5=@Pastlossdate5, PastLossDescr5=@Pastlossdescr5, PastLossAmount5=@Pastlossamount5, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@Watercraft", Watercraft)
            cmd.Parameters.AddWithValue("@Engaged", Engaged)
            cmd.Parameters.AddWithValue("@Subcontractor", SubContractor)
            cmd.Parameters.AddWithValue("@Safetyprogram", SafetyProgram)
            cmd.Parameters.AddWithValue("@Undersixteen", UnderSixteen)
            cmd.Parameters.AddWithValue("@Oversixtyfive", OverSixtyfive)
            cmd.Parameters.AddWithValue("@Handicap", Handicap)
            cmd.Parameters.AddWithValue("@Travel", Travel)
            cmd.Parameters.AddWithValue("@Reqphysicals", ReqPhysicals)
            cmd.Parameters.AddWithValue("@Transportation", Transportation)
            cmd.Parameters.AddWithValue("@Priorcoverage", PriorCoverage)
            cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
            cmd.Parameters.AddWithValue("@Pastloss", PastLoss)
            cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
            cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
            cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
            cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
            cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
            cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
            cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
            cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
            cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
            cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
            cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
            cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
            cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
            cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
            cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        Public Shared Sub InsertUmApplication(ByVal RequestNumber As Integer, ByVal LimitOfLiability As Decimal, ByVal Automobiles As String, ByVal WorkersComp As String, ByVal CurrentCarrier As String, ByVal CurrentUmPrem As Decimal, ByVal ExpComments As String, ByVal PastLoss As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO UmApplicationDetails (RequestNumber, LimitOfLiability, Automobiles, WorkersComp, CurrentCarrier, CurrentUmPrem, ExpComments, PastLoss, PastLossDate1, PastLossDescr1, PastLossAmount1, PastLossDate2, PastLossDescr2, PastLossAmount2, PastLossDate3, PastLossDescr3, PastLossAmount3, PastLossDate4, PastLossDescr4, PastLossAmount4, PastLossDate5, PastLossDescr5, PastLossAmount5, AppLevel, Status, SubmitDate) VALUES (@ReqNum, @Limitofliability, @Automobiles, @Workerscomp, @Currentcarrier, @Currentumprem, @Expcomments, @Pastloss, @Pastlossdate1, @Pastlossdescr1, @Pastlossamount1, @Pastlossdate2, @Pastlossdescr2, @Pastlossamount2, @Pastlossdate3, @Pastlossdescr3, @Pastlossamount3, @Pastlossdate4, @Pastlossdescr4, @Pastlossamount4, @Pastlossdate5, @Pastlossdescr5, @Pastlossamount5, @Applevel, @Status, @TodayDate)"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@Limitofliability", LimitOfLiability)
            cmd.Parameters.AddWithValue("@Automobiles", Automobiles)
            cmd.Parameters.AddWithValue("@Workerscomp", WorkersComp)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Currentumprem", CurrentUmPrem)
            cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
            cmd.Parameters.AddWithValue("@Pastloss", PastLoss)
            cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
            cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
            cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
            cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
            cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
            cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
            cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
            cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
            cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
            cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
            cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
            cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
            cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
            cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
            cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
            cmd.Parameters.AddWithValue("@Applevel", "16")
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetUmApplication(ByVal RequestNumber As Integer) As List(Of UmApplicationDetails)
            Dim Application As New List(Of UmApplicationDetails)

            Dim con As SqlConnection = New SqlConnection(_connectionString)

            Dim cmd As SqlCommand = New SqlCommand
            cmd.Connection = con
            cmd.CommandText = "SELECT RequestNumber, LimitOfLiability, Automobiles, WorkersComp, CurrentCarrier, CurrentUmPrem, ExpComments, PastLoss, PastLossDate1, PastLossDescr1, PastLossAmount1, PastLossDate2, PastLossDescr2, PastLossAmount2, PastLossDate3, PastLossDescr3, PastLossAmount3, PastLossDate4, PastLossDescr4, PastLossAmount4, PastLossDate5, PastLossDescr5, PastLossAmount5, Status, SubmitDate FROM UmApplicationDetails WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)

            Using con
                con.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader
                While reader.Read()
                    Dim ReadRecord As New UmApplicationDetails
                    ReadRecord.Reqnum = CType(reader("RequestNumber"), Integer)
                    ReadRecord.Limitofliability = CType(reader("LimitOfLiability"), Decimal)
                    ReadRecord.Automobiles = CType(reader("Automobiles"), String)
                    ReadRecord.Workerscomp = CType(reader("WorkersComp"), String)
                    ReadRecord.Currentcarrier = CType(reader("CurrentCarrier"), String)
                    ReadRecord.Currentumprem = CType(reader("CurrentUmPrem"), String)
                    ReadRecord.Expcomments = CType(reader("ExpComments"), String)
                    ReadRecord.Pastloss = CType(reader("PastLoss"), String)
                    ReadRecord.Pastlossdate1 = CType(reader("PastLossDate1"), Date)
                    ReadRecord.Passlossdescr1 = CType(reader("PastLossDescr1"), String)
                    ReadRecord.Passlossamount1 = CType(reader("PastLossAmount1"), Decimal)
                    ReadRecord.Pastlossdate2 = CType(reader("PastLossDate2"), Date)
                    ReadRecord.Passlossdescr2 = CType(reader("PastLossDescr2"), String)
                    ReadRecord.Passlossamount2 = CType(reader("PastLossAmount2"), Decimal)
                    ReadRecord.Pastlossdate3 = CType(reader("PastLossDate3"), Date)
                    ReadRecord.Passlossdescr3 = CType(reader("PastLossDescr3"), String)
                    ReadRecord.Passlossamount3 = CType(reader("PastLossAmount3"), Decimal)
                    ReadRecord.Pastlossdate4 = CType(reader("PastLossDate4"), Date)
                    ReadRecord.Passlossdescr4 = CType(reader("PastLossDescr4"), String)
                    ReadRecord.Passlossamount4 = CType(reader("PastLossAmount4"), Decimal)
                    ReadRecord.Pastlossdate5 = CType(reader("PastLossDate5"), Date)
                    ReadRecord.Passlossdescr5 = CType(reader("PastLossDescr5"), String)
                    ReadRecord.Passlossamount5 = CType(reader("PastLossAmount5"), Decimal)
                    ReadRecord.Status = CType(reader("Status"), String)
                    ReadRecord.Todaydate = CType(reader("SubmitDate"), Date)
                    Application.Add(ReadRecord)
                End While
            End Using
            Return Application
        End Function

        Public Shared Sub UpdateUmApplication(ByVal RequestNumber As Integer, ByVal LimitOfLiability As Decimal, ByVal Automobiles As String, ByVal WorkersComp As String, ByVal CurrentCarrier As String, ByVal CurrentUmPrem As Decimal, ByVal ExpComments As String, ByVal PastLoss As String, ByVal PastLossDate1 As Date, ByVal PastLossDescr1 As String, ByVal PastLossAmount1 As Decimal, ByVal PastLossDate2 As Date, ByVal PastLossDescr2 As String, ByVal PastLossAmount2 As Decimal, ByVal PastLossDate3 As Date, ByVal PastLossDescr3 As String, ByVal PastLossAmount3 As Decimal, ByVal PastLossDate4 As Date, ByVal PastLossDescr4 As String, ByVal PastLossAmount4 As Decimal, ByVal PastLossDate5 As Date, ByVal PastLossDescr5 As String, ByVal PastLossAmount5 As Decimal)
            'Create connection
            Dim con As SqlConnection = New SqlConnection(_connectionString)

            'Create command
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.Connection = con
            cmd.CommandText = "UPDATE UmApplicationDetails SET LimitOfLiability=@Limitofliability, Automobiles=@Automobiles, WorkersComp=@Workerscomp, CurrentCarrier=@Currentcarrier, CurrentUmPrem=@Currentumprem, ExpComments=@Expcomments, PastLoss=@Pastloss, PastLossDate1=@Pastlossdate1, PastLossDescr1=@Pastlossdescr1, PastLossAmount1=@Pastlossamount1, PastLossDate2=@Pastlossdate2, PastLossDescr2=@Pastlossdescr2, PastLossAmount2=@Pastlossamount2, PastLossDate3=@Pastlossdate3, PastLossDescr3=@Pastlossdescr3, PastLossAmount3=@Pastlossamount3, PastLossDate4=@Pastlossdate4, PastLossDescr4=@Pastlossdescr4, PastLossAmount4=@Pastlossamount4, PastLossDate5=@Pastlossdate5, PastLossDescr5=@Pastlossdescr5, , PastLossAmount5=@Pastlossamount5, Status=@Status, SubmitDate=@TodayDate WHERE RequestNumber=@ReqNum"
            cmd.CommandType = CommandType.Text

            'Add parameter
            cmd.Parameters.AddWithValue("@ReqNum", RequestNumber)
            cmd.Parameters.AddWithValue("@Limitofliability", LimitOfLiability)
            cmd.Parameters.AddWithValue("@Automobiles", Automobiles)
            cmd.Parameters.AddWithValue("@Workerscomp", WorkersComp)
            cmd.Parameters.AddWithValue("@Currentcarrier", CurrentCarrier)
            cmd.Parameters.AddWithValue("@Currentumprem", CurrentUmPrem)
            cmd.Parameters.AddWithValue("@Expcomments", ExpComments)
            cmd.Parameters.AddWithValue("@Pastloss", PastLoss)
            cmd.Parameters.AddWithValue("@Pastlossdate1", PastLossDate1)
            cmd.Parameters.AddWithValue("@Pastlossdescr1", PastLossDescr1)
            cmd.Parameters.AddWithValue("@Pastlossamount1", PastLossAmount1)
            cmd.Parameters.AddWithValue("@Pastlossdate2", PastLossDate2)
            cmd.Parameters.AddWithValue("@Pastlossdescr2", PastLossDescr2)
            cmd.Parameters.AddWithValue("@Pastlossamount2", PastLossAmount2)
            cmd.Parameters.AddWithValue("@Pastlossdate3", PastLossDate3)
            cmd.Parameters.AddWithValue("@Pastlossdescr3", PastLossDescr3)
            cmd.Parameters.AddWithValue("@Pastlossamount3", PastLossAmount3)
            cmd.Parameters.AddWithValue("@Pastlossdate4", PastLossDate4)
            cmd.Parameters.AddWithValue("@Pastlossdescr4", PastLossDescr4)
            cmd.Parameters.AddWithValue("@Pastlossamount4", PastLossAmount4)
            cmd.Parameters.AddWithValue("@Pastlossdate5", PastLossDate5)
            cmd.Parameters.AddWithValue("@Pastlossdescr5", PastLossDescr5)
            cmd.Parameters.AddWithValue("@Pastlossamount5", PastLossAmount5)
            cmd.Parameters.AddWithValue("@Status", "Incomplete")
            cmd.Parameters.AddWithValue("@TodayDate", Today.Date)

            Using con
                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Sub

        <DataObjectMethod(DataObjectMethodType.Select, True)> _
        Public Function GetProcessedPolicies(ByVal UserNameIs As String) As List(Of MediaManagement)
            Dim MyPolicies As New List(Of MediaManagement)
            Dim ReadRecord As New MediaManagement

            MyPolicies.Add(ReadRecord)
            Return MyPolicies
        End Function


        '01/28/2013
        '<DataObjectMethod(DataObjectMethodType.Select, True)> _
        'Public Function GetHelpfulLinks() As List(Of FeatureLinks)
        '    Dim Helpful As New List(Of FeatureLinks)

        '    Dim con As SqlConnection = New SqlConnection(_connectionString)

        '    Dim cmd As SqlCommand = New SqlCommand
        '    cmd.Connection = con
        '    cmd.CommandText = "SELECT LINK_ID, INSTITUTION, DESCRIPTION, LINK FROM FeatureLinks"
        '    cmd.CommandType = CommandType.Text

        '    Using con
        '        con.Open()
        '        Dim reader As SqlDataReader = cmd.ExecuteReader
        '        While reader.Read()
        '            Dim ReadRecord As New FeatureLinks()
        '            ReadRecord.Linkid = CType(reader("LINK_ID"), Integer)
        '            ReadRecord.Institution = CType(reader("INSTITUTION"), String)
        '            ReadRecord.Description = CType(reader("DESCRIPTION"), String)
        '            ReadRecord.Link = CType(reader("LINK"), String)
        '            Helpful.Add(ReadRecord)
        '        End While
        '    End Using
        '    Return Helpful
        'End Function

        '    Private Sub CreateUserProfile(ByVal userName As String, ByVal firstName As String, ByVal lastName As String, ByVal Address As String, ByVal City As String, ByVal State As String, ByVal Zip As String)

        '        Dim con As New SqlConnection(_con)
        '        Dim cmd As New SqlCommand("INSERT UserProfiles userName, FirstName")
        '    End Sub

    End Class

End Namespace