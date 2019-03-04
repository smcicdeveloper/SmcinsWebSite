'Option Explicit On
'Option Strict On
'Option Infer On
Imports System
Imports System.Web
Imports System.Web.Services
Imports System.IO
Imports System.Collections
Imports System.Collections.Generic
'Imports System.Linq
'Imports System.Data.Linq
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Configuration
'Imports System.Data.Linq.Mapping
Imports Microsoft.VisualBasic

Public Class _AccountVariables
    ' Inherits SqlConnection

    Private _cust_no As String
    Private _insured_name As String
    Private _contact As String
    Private _mail_addr As String
    Private _mail_city As String
    Private _mail_state As String
    Private _mail_zip As String
    Private _actual_location As String
    Private _loc_state As String
    'Private _loc_zip As String
    Private _county As String
    Private _file_location As String
    Private _full_name As String
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
    Private _action1 As String
    Private _action1_date As String
    Private _action2 As String
    Private _action2_date As String
    Private _action3 As String
    Private _action3_date As String
    Private _action4 As String
    Private _action4_date As String
    Private _action5 As String
    Private _action5_date As String
    Private _proxy_init As String
    Private _agency_name As String
    Private _agent_number As String
    Private _contact_name As String
    Private _contact_number As String
    Private _comments As String
    Private _date_created As Date
    Private _group As String
    Private _church_email As String



    'Read-only property

    Public Property cust_no As String
        Get
            Return _cust_no
        End Get
        Set(ByVal value As String)
            _cust_no = value
        End Set
    End Property


    Public Property insured_name As String
        Get
            Return _insured_name.ToUpper
        End Get
        Set(ByVal value As String)
            _insured_name = value
        End Set
    End Property


    Public Property contact As String
        Get
            Return _contact.ToUpper
        End Get
        Set(ByVal value As String)
            _contact = value
        End Set
    End Property


    Public Property mail_addr As String
        Get
            Return _mail_addr.ToUpper
        End Get
        Set(ByVal value As String)
            _mail_addr = value
        End Set
    End Property


    Public Property mail_city As String
        Get
            Return _mail_city.ToUpper
        End Get
        Set(ByVal value As String)
            _mail_city = value
        End Set
    End Property


    Public Property mail_state As String
        Get
            Return _mail_state
        End Get
        Set(ByVal value As String)
            _mail_state = value
        End Set
    End Property


    Public Property mail_zip As String
        Get
            Return _mail_zip
        End Get
        Set(ByVal value As String)
            _mail_zip = value
        End Set
    End Property


    Public Property actual_location As String
        Get
            Return _actual_location.ToUpper
        End Get
        Set(ByVal value As String)
            _actual_location = value
        End Set
    End Property


    Public Property loc_state As String
        Get
            Return _loc_state
        End Get
        Set(ByVal value As String)
            _loc_state = value
        End Set
    End Property


    Public Property county As String
        Get
            Return _county.ToUpper
        End Get
        Set(ByVal value As String)
            _county = value
        End Set
    End Property


    Public Property file_location As String
        Get
            Return _file_location
        End Get
        Set(ByVal value As String)
            _file_location = value
        End Set
    End Property


    Public Property FullName As String
        Get
            Return _full_name.ToUpper
        End Get
        Set(value As String)
            _full_name = value
        End Set
    End Property


    Public Property cust_status As String
        Get
            Return _cust_status
        End Get
        Set(ByVal value As String)
            _cust_status = value
        End Set
    End Property


    Public Property pol1_date As String
        Get
            Return _pol1_date
        End Get
        Set(ByVal value As String)
            _pol1_date = value
        End Set
    End Property


    Public Property pol1_descr As String
        Get
            Return _pol1_descr.ToUpper
        End Get
        Set(ByVal value As String)
            _pol1_descr = value
        End Set
    End Property


    Public Property pol2_date As String
        Get
            Return _pol2_date
        End Get
        Set(ByVal value As String)
            _pol2_date = value
        End Set
    End Property


    Public Property pol2_descr As String
        Get
            Return _pol2_descr.ToUpper
        End Get
        Set(ByVal value As String)
            _pol2_descr = value
        End Set
    End Property


    Public Property pol3_date As String
        Get
            Return _pol3_date
        End Get
        Set(ByVal value As String)
            _pol3_date = value
        End Set
    End Property


    Public Property pol3_descr As String
        Get
            Return _pol3_descr.ToUpper
        End Get
        Set(ByVal value As String)
            _pol3_descr = value
        End Set
    End Property


    Public Property pol4_date As String
        Get
            Return _pol4_date
        End Get
        Set(ByVal value As String)
            _pol4_date = value
        End Set
    End Property


    Public Property pol4_descr As String
        Get
            Return _pol4_descr.ToUpper
        End Get
        Set(ByVal value As String)
            _pol4_descr = value
        End Set
    End Property


    Public Property pol5_date As String
        Get
            Return _pol5_date
        End Get
        Set(ByVal value As String)
            _pol5_date = value
        End Set
    End Property


    Public Property pol5_descr As String
        Get
            Return _pol5_descr.ToUpper
        End Get
        Set(ByVal value As String)
            _pol5_descr = value
        End Set
    End Property


    Public Property action1 As String
        Get
            Return _action1.ToUpper
        End Get
        Set(ByVal value As String)
            _action1 = value
        End Set
    End Property


    Public Property action1_date As String
        Get
            Return _action1_date
        End Get
        Set(ByVal value As String)
            _action1_date = value
        End Set
    End Property


    Public Property action2 As String
        Get
            Return _action2.ToUpper
        End Get
        Set(ByVal value As String)
            _action2 = value
        End Set
    End Property


    Public Property action2_date As String
        Get
            Return _action2_date
        End Get
        Set(ByVal value As String)
            _action2_date = value
        End Set
    End Property


    Public Property action3 As String
        Get
            Return _action3.ToUpper
        End Get
        Set(ByVal value As String)
            _action3 = value
        End Set
    End Property


    Public Property action3_date As String
        Get
            Return _action3_date
        End Get
        Set(ByVal value As String)
            _action3_date = value
        End Set
    End Property


    Public Property action4 As String
        Get
            Return _action4.ToUpper
        End Get
        Set(ByVal value As String)
            _action4 = value
        End Set
    End Property


    Public Property action4_date As String
        Get
            Return _action4_date
        End Get
        Set(ByVal value As String)
            _action4_date = value
        End Set
    End Property


    Public Property action5 As String
        Get
            Return _action5.ToUpper
        End Get
        Set(ByVal value As String)
            _action5 = value
        End Set
    End Property


    Public Property action5_date As String
        Get
            Return _action5_date
        End Get
        Set(ByVal value As String)
            _action5_date = value
        End Set
    End Property


    Public Property proxy_init As String
        Get
            Return _proxy_init
        End Get
        Set(ByVal value As String)
            _proxy_init = value
        End Set
    End Property


    Public Property agency_name As String
        Get
            Return _agency_name.ToUpper
        End Get
        Set(ByVal value As String)
            _agency_name = value
        End Set
    End Property


    Public Property agency_number As String
        Get
            Return _agent_number
        End Get
        Set(ByVal value As String)
            _agent_number = value
        End Set
    End Property


    Public Property contact_name As String
        Get
            Return _contact_name.ToUpper
        End Get
        Set(ByVal value As String)
            _contact_name = value
        End Set
    End Property


    Public Property contact_number As String
        Get
            Return _contact_number
        End Get
        Set(ByVal value As String)
            _contact_number = value
        End Set
    End Property


    Public Property comments As String
        Get
            Return _comments
        End Get
        Set(ByVal value As String)
            _comments = value
        End Set
    End Property


    Public Property date_created As Date
        Get
            Return _date_created
        End Get
        Set(value As Date)
            _date_created = value
        End Set
    End Property


    Public Property group As String
        Get
            Return _group
        End Get
        Set(ByVal value As String)
            _group = value
        End Set
    End Property

    Public Property church_email As String
        Get
            Return _church_email
        End Get
        Set(ByVal value As String)
            _church_email = value
        End Set
    End Property

    'Public Sub Create(reader As SqlDataReader)
    '    'cust_no = CInt(reader("cust_no"))
    '    insured_name = DirectCast(reader("insured_name"), String)
    'End Sub
    'Public Shared Function [Select]() As IEnumerable
    '    Dim db As New 
    'End Function


    'End Namespace

End Class
