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

Public Class _AddRecord

    Public Shared Function AddNewRecord(ByVal custnum As Integer, ByVal CustStatus As String, ByVal Proxy As String, ByVal InsuredName As String, ByVal Contact As String, ByVal MailAddress As String, ByVal MailCity As String, ByVal MailState As String, ByVal MailZip As String, ByVal County As String, ByVal Location As String, ByVal State As String, ByVal ChurchEmail As String, ByVal file_location As String, ByVal Agency As String, ByVal EffDate1 As String, ByVal Desc1 As String, ByVal EffDate2 As String, ByVal Desc2 As String, ByVal EffDate3 As String, ByVal Desc3 As String, ByVal EffDate4 As String, ByVal Desc4 As String, ByVal EffDate5 As String, ByVal Desc5 As String, ByVal Action1 As String, ByVal Action1Day As String, ByVal Action2 As String, ByVal Action2Day As String, ByVal Action3 As String, ByVal Action3Day As String, ByVal Action4 As String, ByVal Action4Day As String, ByVal Action5 As String, ByVal Action5Day As String, ByVal Comments As String, ByVal ContactName As String, ByVal ContactNumber As String, ByVal Today As Date, ByVal Empnum As String) As Integer

        'SET IDENTITY_INSERT acctinfo ON
        'INSERT acctinfo (cust_no, cust_status, proxy_init, insured_name, contact, mail_addr, mail_city, mail_state, mail_zip, county, actual_location, loc_state, file_location, agency_number, pol1_date, pol1_descr, pol2_date, pol2_descr, pol3_date, pol3_descr, pol4_date, pol4_descr, pol5_date, pol5_descr, action1, action1_date, action2, action2_date, action3, action3_date, action4, action4_date, action5, action5_date, comments, contact_name, contact_number, date_created, Who) VALUES ('21479', 'ACTIVE', '', 'ROCK BRIDGE COMMUNITY CHURCH INC', '', '121 WEST CRAWFORD ST', 'DALTON', 'GA', '30720', '', '', 'GA', '1000', '0002003', '11/01', 'SMP - SPECIAL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '803-796-5640', '10/31/2014', '2032')
        'SET IDENTITY_INSERT acctinfo OFF
        Dim MyStoreProcedure As String = "spGetCustNumForContacts"
        Dim custno As Integer
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As New SqlConnection(MyConnection)
        Dim cmd As New SqlCommand(MyStoreProcedure, con)
        cmd.CommandType = CommandType.StoredProcedure

        'cmd.Connection = con
        'cmd.CommandText = "INSERT acctinfo (cust_status, proxy_init, insured_name, contact, mail_addr, mail_city, mail_state, mail_zip, county, actual_location, loc_state, file_location, agency_number, pol1_date, pol1_descr, pol2_date, pol2_descr, pol3_date, pol3_descr, pol4_date, pol4_descr, pol5_date, pol5_descr, action1, action1_date, action2, action2_date, action3, action3_date, action4, action4_date, action5, action5_date, comments, contact_name, contact_number, date_created, Who) VALUES (@CustStatus, @Proxy, UPPER(@InsuredName), UPPER(@Contact), UPPER(@MailAddress), UPPER(@MailCity), @MailState, @MailZip, UPPER(@County), UPPER(@Location), @State, @file_location, @Agency, @EffDate1, @Desc1, @EffDate2, @Desc2, @EffDate3, @Desc3, @EffDate4, @Desc4, @EffDate5, @Desc5, @Action1, @Action1Day, @Action2, @Action2Day, @Action3, @Action3Day, @Action4, @Action4Day, @Action5, @Action5Day, UPPER(@Comments), UPPER(@ContactName), UPPER(@ContactNumber), @Today, @Empnum)"
        'cmd.CommandType = CommandType.Text



        cmd.Parameters.AddWithValue("@CustStatus", CustStatus)
        cmd.Parameters.AddWithValue("@Proxy", Proxy)
        cmd.Parameters.AddWithValue("@InsuredName", InsuredName)
        cmd.Parameters.AddWithValue("@Contact", Contact)
        cmd.Parameters.AddWithValue("@MailAddress", MailAddress)
        cmd.Parameters.AddWithValue("@MailCity", MailCity)
        cmd.Parameters.AddWithValue("@MailState", MailState)
        cmd.Parameters.AddWithValue("@MailZip", MailZip)
        cmd.Parameters.AddWithValue("@County", County)
        cmd.Parameters.AddWithValue("@Location", Location)
        cmd.Parameters.AddWithValue("@State", State)
        cmd.Parameters.AddWithValue("@ChurchEmail", ChurchEmail)
        cmd.Parameters.AddWithValue("@file_location", file_location)
        cmd.Parameters.AddWithValue("@Agency", Agency)
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
        cmd.Parameters.AddWithValue("@Action1Day", Action1Day)
        cmd.Parameters.AddWithValue("@Action2", Action2)
        cmd.Parameters.AddWithValue("@Action2Day", Action2Day)
        cmd.Parameters.AddWithValue("@Action3", Action3)
        cmd.Parameters.AddWithValue("@Action3Day", Action3Day)
        cmd.Parameters.AddWithValue("@Action4", Action4)
        cmd.Parameters.AddWithValue("@Action4Day", Action4Day)
        cmd.Parameters.AddWithValue("@Action5", Action5)
        cmd.Parameters.AddWithValue("@Action5Day", Action5Day)
        cmd.Parameters.AddWithValue("@Comments", Comments)
        cmd.Parameters.AddWithValue("@ContactName", DBNull.Value)
        cmd.Parameters.AddWithValue("@ContactNumber", DBNull.Value)
        cmd.Parameters.AddWithValue("@Today", Today)
        cmd.Parameters.AddWithValue("@Empnum", Empnum)
        cmd.Parameters.Add("@CustNum", SqlDbType.Int, 0, "custnum")
        cmd.Parameters("@CustNum").Direction = ParameterDirection.Output
        'cmd.Parameters.AddWithValue("@", )
        'cmd.Parameters.AddWithValue("@", )
        'cmd.Parameters.AddWithValue("@", )

        Using con
            con.Open()
            'cmd.ExecuteNonQuery()
            'custno = cmd.Parameters("@CustNum").Value
            'custno = cmd.ExecuteScalar()
            ' cmd.ExecuteScalar()
            Return Convert.ToInt32(cmd.ExecuteScalar())
        End Using



    End Function


    Public Shared Sub InsertNewBusiness(ByVal QuoteDate As String, ByVal CurrDate As String, ByVal Church As String, ByVal Location As String, ByVal State As String, ByVal Agent As String, ByVal LossControl As String, ByVal UW As String, ByVal Carrier As String, ByVal CurrPrem As String, ByVal SmpQuoted As String, ByVal UmbQuoted As String, ByVal BaQuoted As String, ByVal WcQuoted As String, ByVal NotWritten As String, ByVal Reason As String, ByVal DateWritten As String, ByVal SmpWritten As String, ByVal UmbWritten As String, ByVal BaWritten As String, ByVal WcWritten As String, ByVal SmpPrem As String, ByVal UmbPrem As String, ByVal BaPrem As String, ByVal WcPrem As String, ByVal Seacoast As String, ByVal SeacoastExp As String, ByVal IrpmFactor As String, ByVal CustNo As String, ByVal DeclineDate As String, ByVal RequestNo As String, ByVal InspAppt As String)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "INSERT newbus (quote_date, curr_date, church, location, state, agent, loss_control, uw, carrier, curr_prem, smp_quoted, umb_quoted, ba_quoted, wc_quoted, not_written, reason, date_written, smp_written, umb_written, ba_written, wc_written, smp_prem, umb_prem, ba_prem, wc_prem, seacoast, seacoast_exp, irpm_factor, cust_no, decline_date, request_no, insp_appt) VALUES (@QuoteDate, @CurrDate, UPPER(@Church), UPPER(@Location), @State, @Agent, @LossControl, @UW, UPPER(@Carrier), @CurrPrem, @SmpQuoted, @UmbQuoted, @BaQuoted, @WcQuoted, @NotWritten, @Reason, @DateWritten, @SmpWritten, @UmbWritten, @BaWritten, @WcWritten, @SmpPrem, @UmbPrem, @BaPrem, @WcPrem, @Seacoast, @SeacoastExp, @IrpmFactor, @CustNo, @DeclineDate, @RequestNo, @InspAppt)"
        cmd.CommandType = CommandType.Text
        If QuoteDate > Date.Today Then

        End If
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
        cmd.Parameters.AddWithValue("@DeclineDate", DeclineDate)
        cmd.Parameters.AddWithValue("@RequestNo", RequestNo)
        cmd.Parameters.AddWithValue("@InspAppt", InspAppt)
        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

    End Sub

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Shared Sub AddNewContact(ByVal custnum As String, ByVal fullname As String, ByVal churchnum As String, ByVal cellphone As String, ByVal email As String, ByVal departmentid As Integer, ByVal notes As String)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "INSERT Contacts (cust_no, full_name, church_number, cell_phone, email, department_id, notes, LastUpdate) VALUES (@custnum, @fullname, @churchnum, @cellphone, @email, @departmentid, @notes, @lastupdate)"
        cmd.CommandType = CommandType.Text

        cmd.Parameters.AddWithValue("@custnum", custnum)
        cmd.Parameters.AddWithValue("@fullname", fullname.ToUpper)

        If churchnum Is Nothing Then
            cmd.Parameters.AddWithValue("@churchnum", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@churchnum", churchnum)
        End If

        If cellphone Is Nothing Then
            cmd.Parameters.AddWithValue("@cellphone", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@cellphone", cellphone)
        End If

        If email Is Nothing Then
            cmd.Parameters.AddWithValue("@email", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@email", email)
        End If

        cmd.Parameters.AddWithValue("@departmentid", departmentid)

        If notes Is Nothing Then
            cmd.Parameters.AddWithValue("@notes", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("@notes", notes.ToUpper)
        End If

        cmd.Parameters.AddWithValue("@lastupdate", Date.Today)

        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub


    Public Shared Sub AddCandleSafetyRecord(ByVal custnum As String, ByVal church As String, ByVal location As String, ByVal mailcontact As String, ByVal mailaddress As String, ByVal mailcity As String, ByVal mailstate As String, ByVal mailzip As String, ByVal candleuse As String, ByVal fullname As String, ByVal ipaddress As String)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "INSERT CandleSafety (CustNum, ChurchName, ActualLocation, MailingContact, MailingAddress, MailingCity, MailingState, MailingZip, CandleUse, FullName, EntryDate, IPAddress) VALUES (@custnum, @church, @location, @mailcontact, @mailaddress, @mailcity, @mailstate, @mailzip, @candleuse, @fullname, @entrydate, @ipaddress)"
        cmd.CommandType = CommandType.Text

        cmd.Parameters.AddWithValue("@custnum", custnum)
        cmd.Parameters.AddWithValue("@church", church)
        cmd.Parameters.AddWithValue("@location", location)
        cmd.Parameters.AddWithValue("@mailcontact", mailcontact)
        cmd.Parameters.AddWithValue("@mailaddress", mailaddress)
        cmd.Parameters.AddWithValue("@mailcity", mailcity)
        cmd.Parameters.AddWithValue("@mailstate", mailstate)
        cmd.Parameters.AddWithValue("@mailzip", mailzip)
        cmd.Parameters.AddWithValue("@candleuse", candleuse)
        cmd.Parameters.AddWithValue("@fullname", fullname)
        cmd.Parameters.AddWithValue("@entrydate", Date.Today)
        cmd.Parameters.AddWithValue("@ipaddress", ipaddress)

        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Shared Sub AddDesignatedPerson(ByVal custnum As String, ByVal candleuse As String, ByVal fullname As String, ByVal entry As String)

        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandText = "INSERT Designate (CustNum, CandleUse, FullName, EntryDate, EntryRecipient) VALUES (@custnum, @candleuse, @fullname, @entrydate, @entryreipient)"
        cmd.CommandType = CommandType.Text

        cmd.Parameters.AddWithValue("@custnum", custnum)
        cmd.Parameters.AddWithValue("@fullname", fullname)
        cmd.Parameters.AddWithValue("@candleuse", candleuse)
        cmd.Parameters.AddWithValue("@entrydate", Date.Today)
        cmd.Parameters.AddWithValue("@entryreipient", entry)

        Using con
            con.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    <DataObjectMethod(DataObjectMethodType.Select, True)> _
    Public Function GetContactForAllCalls(ByVal cust_no As Integer) As List(Of _ContactVariables)
        Dim Names As New List(Of _ContactVariables)()

        'Using mycon As New SqlConnection(ConfigurationManager.ConnectionStrings("SMCI").ConnectionString)
        Dim MyConnection As String = WebConfigurationManager.ConnectionStrings("MiscConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(MyConnection)
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con

        cmd.Parameters.Add(New SqlParameter("@custno", cust_no))
        cmd.CommandText = "SELECT contact_id, cust_no, full_name, church_number, cell_phone, email, notes FROM Contacts WHERE cust_no = @custno"
        cmd.CommandType = CommandType.Text

        Using con
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader
            While reader.Read()
                Dim SeeRecord As New _ContactVariables()
                SeeRecord.contact_id = CType(reader("contact_id"), Integer)
                SeeRecord.full_name = CType(reader("full_name"), String)
                SeeRecord.church_number = CType(reader("church_number"), String)
                SeeRecord.cell_phone = CType(reader("cell_phone"), String)
                SeeRecord.email = CType(reader("email"), String)
                SeeRecord.notes = CType(reader("notes"), String)
                Names.Add(SeeRecord)
            End While

        End Using

        Return Names
    End Function



End Class
