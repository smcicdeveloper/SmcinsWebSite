﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.42000
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection


<Global.System.Data.Linq.Mapping.DatabaseAttribute(Name:="Misc")>  _
Partial Public Class MyDatabaseDataContext
	Inherits System.Data.Linq.DataContext
	
	Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource()
	
  #Region "Extensibility Method Definitions"
  Partial Private Sub OnCreated()
  End Sub
  Partial Private Sub Insertacctinfo(instance As acctinfo)
    End Sub
  Partial Private Sub Updateacctinfo(instance As acctinfo)
    End Sub
  Partial Private Sub Deleteacctinfo(instance As acctinfo)
    End Sub
  #End Region
	
	Public Sub New(ByVal connection As String)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public ReadOnly Property acctinfos() As System.Data.Linq.Table(Of acctinfo)
		Get
			Return Me.GetTable(Of acctinfo)
		End Get
	End Property
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.acctinfo")>  _
Partial Public Class acctinfo
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _cust_no As Integer
	
	Private _insured_name As String
	
	Private _contact As String
	
	Private _mail_addr As String
	
	Private _mail_city As String
	
	Private _mail_state As String
	
	Private _mail_zip As String
	
	Private _county As String
	
	Private _actual_location As String
	
	Private _loc_state As String
	
	Private _file_location As String
	
	Private _cust_status As String
	
	Private _pol1_date As String
	
	Private _pol1_descr As String
	
	Private _pol2_date As String
	
	Private _pol2_descr As String
	
	Private _pol3_date As String
	
	Private _pol3_descr As String
	
	Private _pol4_date As String
	
	Private _pol4_descr As String
	
	Private _pol5_date As String
	
	Private _pol5_descr As String
	
	Private _proxy_init As String
	
	Private _action1 As String
	
	Private _action1_date As System.Nullable(Of Date)
	
	Private _action2 As String
	
	Private _action2_date As System.Nullable(Of Date)
	
	Private _action3 As String
	
	Private _action3_date As System.Nullable(Of Date)
	
	Private _action4 As String
	
	Private _action4_date As System.Nullable(Of Date)
	
	Private _action5 As String
	
	Private _action5_date As System.Nullable(Of Date)
	
	Private _agency_number As String
	
	Private _contact_name As String
	
	Private _contact_number As String
	
	Private _comments As String
	
	Private _date_created As System.Nullable(Of Date)
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub Oncust_noChanging(value As Integer)
    End Sub
    Partial Private Sub Oncust_noChanged()
    End Sub
    Partial Private Sub Oninsured_nameChanging(value As String)
    End Sub
    Partial Private Sub Oninsured_nameChanged()
    End Sub
    Partial Private Sub OncontactChanging(value As String)
    End Sub
    Partial Private Sub OncontactChanged()
    End Sub
    Partial Private Sub Onmail_addrChanging(value As String)
    End Sub
    Partial Private Sub Onmail_addrChanged()
    End Sub
    Partial Private Sub Onmail_cityChanging(value As String)
    End Sub
    Partial Private Sub Onmail_cityChanged()
    End Sub
    Partial Private Sub Onmail_stateChanging(value As String)
    End Sub
    Partial Private Sub Onmail_stateChanged()
    End Sub
    Partial Private Sub Onmail_zipChanging(value As String)
    End Sub
    Partial Private Sub Onmail_zipChanged()
    End Sub
    Partial Private Sub OncountyChanging(value As String)
    End Sub
    Partial Private Sub OncountyChanged()
    End Sub
    Partial Private Sub Onactual_locationChanging(value As String)
    End Sub
    Partial Private Sub Onactual_locationChanged()
    End Sub
    Partial Private Sub Onloc_stateChanging(value As String)
    End Sub
    Partial Private Sub Onloc_stateChanged()
    End Sub
    Partial Private Sub Onfile_locationChanging(value As String)
    End Sub
    Partial Private Sub Onfile_locationChanged()
    End Sub
    Partial Private Sub Oncust_statusChanging(value As String)
    End Sub
    Partial Private Sub Oncust_statusChanged()
    End Sub
    Partial Private Sub Onpol1_dateChanging(value As String)
    End Sub
    Partial Private Sub Onpol1_dateChanged()
    End Sub
    Partial Private Sub Onpol1_descrChanging(value As String)
    End Sub
    Partial Private Sub Onpol1_descrChanged()
    End Sub
    Partial Private Sub Onpol2_dateChanging(value As String)
    End Sub
    Partial Private Sub Onpol2_dateChanged()
    End Sub
    Partial Private Sub Onpol2_descrChanging(value As String)
    End Sub
    Partial Private Sub Onpol2_descrChanged()
    End Sub
    Partial Private Sub Onpol3_dateChanging(value As String)
    End Sub
    Partial Private Sub Onpol3_dateChanged()
    End Sub
    Partial Private Sub Onpol3_descrChanging(value As String)
    End Sub
    Partial Private Sub Onpol3_descrChanged()
    End Sub
    Partial Private Sub Onpol4_dateChanging(value As String)
    End Sub
    Partial Private Sub Onpol4_dateChanged()
    End Sub
    Partial Private Sub Onpol4_descrChanging(value As String)
    End Sub
    Partial Private Sub Onpol4_descrChanged()
    End Sub
    Partial Private Sub Onpol5_dateChanging(value As String)
    End Sub
    Partial Private Sub Onpol5_dateChanged()
    End Sub
    Partial Private Sub Onpol5_descrChanging(value As String)
    End Sub
    Partial Private Sub Onpol5_descrChanged()
    End Sub
    Partial Private Sub Onproxy_initChanging(value As String)
    End Sub
    Partial Private Sub Onproxy_initChanged()
    End Sub
    Partial Private Sub Onaction1Changing(value As String)
    End Sub
    Partial Private Sub Onaction1Changed()
    End Sub
    Partial Private Sub Onaction1_dateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub Onaction1_dateChanged()
    End Sub
    Partial Private Sub Onaction2Changing(value As String)
    End Sub
    Partial Private Sub Onaction2Changed()
    End Sub
    Partial Private Sub Onaction2_dateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub Onaction2_dateChanged()
    End Sub
    Partial Private Sub Onaction3Changing(value As String)
    End Sub
    Partial Private Sub Onaction3Changed()
    End Sub
    Partial Private Sub Onaction3_dateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub Onaction3_dateChanged()
    End Sub
    Partial Private Sub Onaction4Changing(value As String)
    End Sub
    Partial Private Sub Onaction4Changed()
    End Sub
    Partial Private Sub Onaction4_dateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub Onaction4_dateChanged()
    End Sub
    Partial Private Sub Onaction5Changing(value As String)
    End Sub
    Partial Private Sub Onaction5Changed()
    End Sub
    Partial Private Sub Onaction5_dateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub Onaction5_dateChanged()
    End Sub
    Partial Private Sub Onagency_numberChanging(value As String)
    End Sub
    Partial Private Sub Onagency_numberChanged()
    End Sub
    Partial Private Sub Oncontact_nameChanging(value As String)
    End Sub
    Partial Private Sub Oncontact_nameChanged()
    End Sub
    Partial Private Sub Oncontact_numberChanging(value As String)
    End Sub
    Partial Private Sub Oncontact_numberChanged()
    End Sub
    Partial Private Sub OncommentsChanging(value As String)
    End Sub
    Partial Private Sub OncommentsChanged()
    End Sub
    Partial Private Sub Ondate_createdChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub Ondate_createdChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		OnCreated
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_cust_no", AutoSync:=AutoSync.OnInsert, DbType:="Int NOT NULL IDENTITY", IsPrimaryKey:=true, IsDbGenerated:=true)>  _
	Public Property cust_no() As Integer
		Get
			Return Me._cust_no
		End Get
		Set
			If ((Me._cust_no = value)  _
						= false) Then
				Me.Oncust_noChanging(value)
				Me.SendPropertyChanging
				Me._cust_no = value
				Me.SendPropertyChanged("cust_no")
				Me.Oncust_noChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_insured_name", DbType:="Char(40) NOT NULL", CanBeNull:=false)>  _
	Public Property insured_name() As String
		Get
			Return Me._insured_name
		End Get
		Set
			If (String.Equals(Me._insured_name, value) = false) Then
				Me.Oninsured_nameChanging(value)
				Me.SendPropertyChanging
				Me._insured_name = value
				Me.SendPropertyChanged("insured_name")
				Me.Oninsured_nameChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_contact", DbType:="Char(40)")>  _
	Public Property contact() As String
		Get
			Return Me._contact
		End Get
		Set
			If (String.Equals(Me._contact, value) = false) Then
				Me.OncontactChanging(value)
				Me.SendPropertyChanging
				Me._contact = value
				Me.SendPropertyChanged("contact")
				Me.OncontactChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_mail_addr", DbType:="Char(40)")>  _
	Public Property mail_addr() As String
		Get
			Return Me._mail_addr
		End Get
		Set
			If (String.Equals(Me._mail_addr, value) = false) Then
				Me.Onmail_addrChanging(value)
				Me.SendPropertyChanging
				Me._mail_addr = value
				Me.SendPropertyChanged("mail_addr")
				Me.Onmail_addrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_mail_city", DbType:="Char(30) NOT NULL", CanBeNull:=false)>  _
	Public Property mail_city() As String
		Get
			Return Me._mail_city
		End Get
		Set
			If (String.Equals(Me._mail_city, value) = false) Then
				Me.Onmail_cityChanging(value)
				Me.SendPropertyChanging
				Me._mail_city = value
				Me.SendPropertyChanged("mail_city")
				Me.Onmail_cityChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_mail_state", DbType:="Char(2) NOT NULL", CanBeNull:=false)>  _
	Public Property mail_state() As String
		Get
			Return Me._mail_state
		End Get
		Set
			If (String.Equals(Me._mail_state, value) = false) Then
				Me.Onmail_stateChanging(value)
				Me.SendPropertyChanging
				Me._mail_state = value
				Me.SendPropertyChanged("mail_state")
				Me.Onmail_stateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_mail_zip", DbType:="Char(10)")>  _
	Public Property mail_zip() As String
		Get
			Return Me._mail_zip
		End Get
		Set
			If (String.Equals(Me._mail_zip, value) = false) Then
				Me.Onmail_zipChanging(value)
				Me.SendPropertyChanging
				Me._mail_zip = value
				Me.SendPropertyChanged("mail_zip")
				Me.Onmail_zipChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_county", DbType:="NVarChar(50)")>  _
	Public Property county() As String
		Get
			Return Me._county
		End Get
		Set
			If (String.Equals(Me._county, value) = false) Then
				Me.OncountyChanging(value)
				Me.SendPropertyChanging
				Me._county = value
				Me.SendPropertyChanged("county")
				Me.OncountyChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_actual_location", DbType:="Char(30)")>  _
	Public Property actual_location() As String
		Get
			Return Me._actual_location
		End Get
		Set
			If (String.Equals(Me._actual_location, value) = false) Then
				Me.Onactual_locationChanging(value)
				Me.SendPropertyChanging
				Me._actual_location = value
				Me.SendPropertyChanged("actual_location")
				Me.Onactual_locationChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_loc_state", DbType:="Char(2)")>  _
	Public Property loc_state() As String
		Get
			Return Me._loc_state
		End Get
		Set
			If (String.Equals(Me._loc_state, value) = false) Then
				Me.Onloc_stateChanging(value)
				Me.SendPropertyChanging
				Me._loc_state = value
				Me.SendPropertyChanged("loc_state")
				Me.Onloc_stateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_file_location", DbType:="NVarChar(50)")>  _
	Public Property file_location() As String
		Get
			Return Me._file_location
		End Get
		Set
			If (String.Equals(Me._file_location, value) = false) Then
				Me.Onfile_locationChanging(value)
				Me.SendPropertyChanging
				Me._file_location = value
				Me.SendPropertyChanged("file_location")
				Me.Onfile_locationChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_cust_status", DbType:="NVarChar(10)")>  _
	Public Property cust_status() As String
		Get
			Return Me._cust_status
		End Get
		Set
			If (String.Equals(Me._cust_status, value) = false) Then
				Me.Oncust_statusChanging(value)
				Me.SendPropertyChanging
				Me._cust_status = value
				Me.SendPropertyChanged("cust_status")
				Me.Oncust_statusChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol1_date", DbType:="Char(10)")>  _
	Public Property pol1_date() As String
		Get
			Return Me._pol1_date
		End Get
		Set
			If (String.Equals(Me._pol1_date, value) = false) Then
				Me.Onpol1_dateChanging(value)
				Me.SendPropertyChanging
				Me._pol1_date = value
				Me.SendPropertyChanged("pol1_date")
				Me.Onpol1_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol1_descr", DbType:="Char(30)")>  _
	Public Property pol1_descr() As String
		Get
			Return Me._pol1_descr
		End Get
		Set
			If (String.Equals(Me._pol1_descr, value) = false) Then
				Me.Onpol1_descrChanging(value)
				Me.SendPropertyChanging
				Me._pol1_descr = value
				Me.SendPropertyChanged("pol1_descr")
				Me.Onpol1_descrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol2_date", DbType:="Char(10)")>  _
	Public Property pol2_date() As String
		Get
			Return Me._pol2_date
		End Get
		Set
			If (String.Equals(Me._pol2_date, value) = false) Then
				Me.Onpol2_dateChanging(value)
				Me.SendPropertyChanging
				Me._pol2_date = value
				Me.SendPropertyChanged("pol2_date")
				Me.Onpol2_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol2_descr", DbType:="NVarChar(50)")>  _
	Public Property pol2_descr() As String
		Get
			Return Me._pol2_descr
		End Get
		Set
			If (String.Equals(Me._pol2_descr, value) = false) Then
				Me.Onpol2_descrChanging(value)
				Me.SendPropertyChanging
				Me._pol2_descr = value
				Me.SendPropertyChanged("pol2_descr")
				Me.Onpol2_descrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol3_date", DbType:="Char(10)")>  _
	Public Property pol3_date() As String
		Get
			Return Me._pol3_date
		End Get
		Set
			If (String.Equals(Me._pol3_date, value) = false) Then
				Me.Onpol3_dateChanging(value)
				Me.SendPropertyChanging
				Me._pol3_date = value
				Me.SendPropertyChanged("pol3_date")
				Me.Onpol3_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol3_descr", DbType:="Char(30)")>  _
	Public Property pol3_descr() As String
		Get
			Return Me._pol3_descr
		End Get
		Set
			If (String.Equals(Me._pol3_descr, value) = false) Then
				Me.Onpol3_descrChanging(value)
				Me.SendPropertyChanging
				Me._pol3_descr = value
				Me.SendPropertyChanged("pol3_descr")
				Me.Onpol3_descrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol4_date", DbType:="Char(10)")>  _
	Public Property pol4_date() As String
		Get
			Return Me._pol4_date
		End Get
		Set
			If (String.Equals(Me._pol4_date, value) = false) Then
				Me.Onpol4_dateChanging(value)
				Me.SendPropertyChanging
				Me._pol4_date = value
				Me.SendPropertyChanged("pol4_date")
				Me.Onpol4_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol4_descr", DbType:="Char(30)")>  _
	Public Property pol4_descr() As String
		Get
			Return Me._pol4_descr
		End Get
		Set
			If (String.Equals(Me._pol4_descr, value) = false) Then
				Me.Onpol4_descrChanging(value)
				Me.SendPropertyChanging
				Me._pol4_descr = value
				Me.SendPropertyChanged("pol4_descr")
				Me.Onpol4_descrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol5_date", DbType:="Char(10)")>  _
	Public Property pol5_date() As String
		Get
			Return Me._pol5_date
		End Get
		Set
			If (String.Equals(Me._pol5_date, value) = false) Then
				Me.Onpol5_dateChanging(value)
				Me.SendPropertyChanging
				Me._pol5_date = value
				Me.SendPropertyChanged("pol5_date")
				Me.Onpol5_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_pol5_descr", DbType:="Char(30)")>  _
	Public Property pol5_descr() As String
		Get
			Return Me._pol5_descr
		End Get
		Set
			If (String.Equals(Me._pol5_descr, value) = false) Then
				Me.Onpol5_descrChanging(value)
				Me.SendPropertyChanging
				Me._pol5_descr = value
				Me.SendPropertyChanged("pol5_descr")
				Me.Onpol5_descrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_proxy_init", DbType:="NVarChar(4)")>  _
	Public Property proxy_init() As String
		Get
			Return Me._proxy_init
		End Get
		Set
			If (String.Equals(Me._proxy_init, value) = false) Then
				Me.Onproxy_initChanging(value)
				Me.SendPropertyChanging
				Me._proxy_init = value
				Me.SendPropertyChanged("proxy_init")
				Me.Onproxy_initChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action1", DbType:="NVarChar(50)")>  _
	Public Property action1() As String
		Get
			Return Me._action1
		End Get
		Set
			If (String.Equals(Me._action1, value) = false) Then
				Me.Onaction1Changing(value)
				Me.SendPropertyChanging
				Me._action1 = value
				Me.SendPropertyChanged("action1")
				Me.Onaction1Changed
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action1_date", DbType:="SmallDateTime")>  _
	Public Property action1_date() As System.Nullable(Of Date)
		Get
			Return Me._action1_date
		End Get
		Set
			If (Me._action1_date.Equals(value) = false) Then
				Me.Onaction1_dateChanging(value)
				Me.SendPropertyChanging
				Me._action1_date = value
				Me.SendPropertyChanged("action1_date")
				Me.Onaction1_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action2", DbType:="NVarChar(50)")>  _
	Public Property action2() As String
		Get
			Return Me._action2
		End Get
		Set
			If (String.Equals(Me._action2, value) = false) Then
				Me.Onaction2Changing(value)
				Me.SendPropertyChanging
				Me._action2 = value
				Me.SendPropertyChanged("action2")
				Me.Onaction2Changed
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action2_date", DbType:="SmallDateTime")>  _
	Public Property action2_date() As System.Nullable(Of Date)
		Get
			Return Me._action2_date
		End Get
		Set
			If (Me._action2_date.Equals(value) = false) Then
				Me.Onaction2_dateChanging(value)
				Me.SendPropertyChanging
				Me._action2_date = value
				Me.SendPropertyChanged("action2_date")
				Me.Onaction2_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action3", DbType:="NVarChar(50)")>  _
	Public Property action3() As String
		Get
			Return Me._action3
		End Get
		Set
			If (String.Equals(Me._action3, value) = false) Then
				Me.Onaction3Changing(value)
				Me.SendPropertyChanging
				Me._action3 = value
				Me.SendPropertyChanged("action3")
				Me.Onaction3Changed
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action3_date", DbType:="SmallDateTime")>  _
	Public Property action3_date() As System.Nullable(Of Date)
		Get
			Return Me._action3_date
		End Get
		Set
			If (Me._action3_date.Equals(value) = false) Then
				Me.Onaction3_dateChanging(value)
				Me.SendPropertyChanging
				Me._action3_date = value
				Me.SendPropertyChanged("action3_date")
				Me.Onaction3_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action4", DbType:="NVarChar(50)")>  _
	Public Property action4() As String
		Get
			Return Me._action4
		End Get
		Set
			If (String.Equals(Me._action4, value) = false) Then
				Me.Onaction4Changing(value)
				Me.SendPropertyChanging
				Me._action4 = value
				Me.SendPropertyChanged("action4")
				Me.Onaction4Changed
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action4_date", DbType:="SmallDateTime")>  _
	Public Property action4_date() As System.Nullable(Of Date)
		Get
			Return Me._action4_date
		End Get
		Set
			If (Me._action4_date.Equals(value) = false) Then
				Me.Onaction4_dateChanging(value)
				Me.SendPropertyChanging
				Me._action4_date = value
				Me.SendPropertyChanged("action4_date")
				Me.Onaction4_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action5", DbType:="NVarChar(50)")>  _
	Public Property action5() As String
		Get
			Return Me._action5
		End Get
		Set
			If (String.Equals(Me._action5, value) = false) Then
				Me.Onaction5Changing(value)
				Me.SendPropertyChanging
				Me._action5 = value
				Me.SendPropertyChanged("action5")
				Me.Onaction5Changed
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_action5_date", DbType:="SmallDateTime")>  _
	Public Property action5_date() As System.Nullable(Of Date)
		Get
			Return Me._action5_date
		End Get
		Set
			If (Me._action5_date.Equals(value) = false) Then
				Me.Onaction5_dateChanging(value)
				Me.SendPropertyChanging
				Me._action5_date = value
				Me.SendPropertyChanged("action5_date")
				Me.Onaction5_dateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_agency_number", DbType:="NVarChar(50)")>  _
	Public Property agency_number() As String
		Get
			Return Me._agency_number
		End Get
		Set
			If (String.Equals(Me._agency_number, value) = false) Then
				Me.Onagency_numberChanging(value)
				Me.SendPropertyChanging
				Me._agency_number = value
				Me.SendPropertyChanged("agency_number")
				Me.Onagency_numberChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_contact_name", DbType:="Char(40)")>  _
	Public Property contact_name() As String
		Get
			Return Me._contact_name
		End Get
		Set
			If (String.Equals(Me._contact_name, value) = false) Then
				Me.Oncontact_nameChanging(value)
				Me.SendPropertyChanging
				Me._contact_name = value
				Me.SendPropertyChanged("contact_name")
				Me.Oncontact_nameChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_contact_number", DbType:="NVarChar(50)")>  _
	Public Property contact_number() As String
		Get
			Return Me._contact_number
		End Get
		Set
			If (String.Equals(Me._contact_number, value) = false) Then
				Me.Oncontact_numberChanging(value)
				Me.SendPropertyChanging
				Me._contact_number = value
				Me.SendPropertyChanged("contact_number")
				Me.Oncontact_numberChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_comments", DbType:="VarChar(200)")>  _
	Public Property comments() As String
		Get
			Return Me._comments
		End Get
		Set
			If (String.Equals(Me._comments, value) = false) Then
				Me.OncommentsChanging(value)
				Me.SendPropertyChanging
				Me._comments = value
				Me.SendPropertyChanged("comments")
				Me.OncommentsChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_date_created", DbType:="SmallDateTime")>  _
	Public Property date_created() As System.Nullable(Of Date)
		Get
			Return Me._date_created
		End Get
		Set
			If (Me._date_created.Equals(value) = false) Then
				Me.Ondate_createdChanging(value)
				Me.SendPropertyChanging
				Me._date_created = value
				Me.SendPropertyChanged("date_created")
				Me.Ondate_createdChanged
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class
