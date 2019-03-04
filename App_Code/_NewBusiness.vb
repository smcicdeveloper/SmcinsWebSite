Imports System
Imports System.Web
Imports System.Web.Services
Imports System.IO
Imports System.Collections
Imports System.Collections.Generic
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Configuration
Imports Microsoft.VisualBasic

Public Class _NewBusiness

    Private _newbus_id As String
    Private _quote_date As String
    Private _curr_date As String
    Private _church As String
    Private _location As String
    Private _state As String
    Private _agent As String
    Private _loss_control As String
    Private _uw As String
    Private _full_name As String
    Private _carrier As String
    Private _curr_prem As String
    Private _smp_quoted As String
    Private _umb_quoted As String
    Private _ba_quoted As String
    Private _wc_quoted As String
    Private _not_written As String
    Private _reason As String
    Private _date_written As String
    Private _smp_written As String
    Private _umb_written As String
    Private _ba_written As String
    Private _wc_written As String
    Private _smp_prem As Double
    Private _umb_prem As Double
    Private _ba_prem As Double
    Private _wc_prem As Double
    Private _seacoast As String
    Private _seacoast_exp As String
    Private _irpm_factor As String
    Private _cust_no As String
    Private _decline_date As String
    Private _request_no As String
    Private _insp_appt As String

    Public Property NewbusId As String
        Get
            Return _newbus_id
        End Get
        Set(ByVal value As String)
            _newbus_id = value
        End Set
    End Property

    Public Property QuoteDate As String
        Get
            Return _quote_date
        End Get
        Set(ByVal value As String)
            _quote_date = value
        End Set
    End Property

    Public Property CurrDate As String
        Get
            Return _curr_date
        End Get
        Set(ByVal value As String)
            _curr_date = value
        End Set
    End Property

    Public Property Church As String
        Get
            Return _church
        End Get
        Set(ByVal value As String)
            _church = value
        End Set
    End Property

    Public Property Location As String
        Get
            Return _location
        End Get
        Set(ByVal value As String)
            _location = value
        End Set
    End Property

    Public Property State As String
        Get
            Return _state
        End Get
        Set(ByVal value As String)
            _state = value
        End Set
    End Property

    Public Property Agent As String
        Get
            Return _agent
        End Get
        Set(ByVal value As String)
            _agent = value
        End Set
    End Property

    Public Property LossControl As String
        Get
            Return _loss_control
        End Get
        Set(ByVal value As String)
            _loss_control = value
        End Set
    End Property

    Public Property UW As String
        Get
            Return _uw
        End Get
        Set(ByVal value As String)
            _uw = value
        End Set
    End Property

    Public Property FullName As String
        Get
            Return _full_name
        End Get
        Set(ByVal value As String)
            _full_name = value
        End Set
    End Property

    Public Property Carrier As String
        Get
            Return _carrier
        End Get
        Set(ByVal value As String)
            _carrier = value
        End Set
    End Property

    Public Property CurrPrem As String
        Get
            Return _curr_prem
        End Get
        Set(ByVal value As String)
            _curr_prem = value
        End Set
    End Property

    Public Property SmpQuoted As String
        Get
            Return _smp_quoted
        End Get
        Set(ByVal value As String)
            _smp_quoted = value
        End Set
    End Property

    Public Property UmbQuoted As String
        Get
            Return _umb_quoted
        End Get
        Set(ByVal value As String)
            _umb_quoted = value
        End Set
    End Property

    Public Property BaQuoted As String
        Get
            Return _ba_quoted
        End Get
        Set(ByVal value As String)
            _ba_quoted = value
        End Set
    End Property

    Public Property WcQuoted As String
        Get
            Return _wc_quoted
        End Get
        Set(ByVal value As String)
            _wc_quoted = value
        End Set
    End Property

    Public Property NotWritten As String
        Get
            Return _not_written
        End Get
        Set(ByVal value As String)
            _not_written = value
        End Set
    End Property

    Public Property Reason As String
        Get
            Return _reason
        End Get
        Set(ByVal value As String)
            _reason = value
        End Set
    End Property

    Public Property DateWritten As String
        Get
            Return _date_written
        End Get
        Set(ByVal value As String)
            _date_written = value
        End Set
    End Property

    Public Property SmpWritten As String
        Get
            Return _smp_written
        End Get
        Set(ByVal value As String)
            _smp_written = value
        End Set
    End Property

    Public Property UmbWritten As String
        Get
            Return _umb_written
        End Get
        Set(ByVal value As String)
            _umb_written = value
        End Set
    End Property

    Public Property BaWritten As String
        Get
            Return _ba_written
        End Get
        Set(ByVal value As String)
            _ba_written = value
        End Set
    End Property

    Public Property WcWritten As String
        Get
            Return _wc_written
        End Get
        Set(ByVal value As String)
            _wc_written = value
        End Set
    End Property

    Public Property SmpPrem As Double
        Get
            Return _smp_prem
        End Get
        Set(ByVal value As Double)
            _smp_prem = value
        End Set
    End Property

    Public Property UmbPrem As Double
        Get
            Return _umb_prem
        End Get
        Set(ByVal value As Double)
            _umb_prem = value
        End Set
    End Property

    Public Property BaPrem As Double
        Get
            Return _ba_prem
        End Get
        Set(ByVal value As Double)
            _ba_prem = value
        End Set
    End Property

    Public Property WcPrem As Double
        Get
            Return _wc_prem
        End Get
        Set(ByVal value As Double)
            _wc_prem = value
        End Set
    End Property

    Public Property Seacoast As String
        Get
            Return _seacoast
        End Get
        Set(ByVal value As String)
            _seacoast = value
        End Set
    End Property

    Public Property SeacoastExp As String
        Get
            Return _seacoast_exp
        End Get
        Set(ByVal value As String)
            _seacoast_exp = value
        End Set
    End Property

    Public Property IrpmFactor As String
        Get
            Return _irpm_factor
        End Get
        Set(ByVal value As String)
            _irpm_factor = value
        End Set
    End Property

    Public Property CustNo As String
        Get
            Return _cust_no
        End Get
        Set(ByVal value As String)
            _cust_no = value
        End Set
    End Property

    Public Property DeclineDate As String
        Get
            Return _decline_date
        End Get
        Set(ByVal value As String)
            _decline_date = value
        End Set
    End Property

    Public Property RequestNo As String
        Get
            Return _request_no
        End Get
        Set(ByVal value As String)
            _request_no = value
        End Set
    End Property

    Public Property InspAppt As String
        Get
            Return _insp_appt
        End Get
        Set(ByVal value As String)
            _insp_appt = value
        End Set
    End Property

End Class
