Imports System
Imports System.Web
Imports System.Web.Services
Imports Microsoft.VisualBasic

Public Class _EmployeeVariables

    Private _employeeId As Integer
    Private _departmentId As Integer
    Private _department As String
    Private _location_code As Integer
    Private _first As String
    Private _last As String
    Private _fullname As String



    'Read-only property

    Public Property EmployeeId As Integer
        Get
            Return _employeeId
        End Get
        Set(ByVal value As Integer)
            _employeeId = value
        End Set
    End Property


    Public Property DepartmentId As Integer
        Get
            Return _departmentId
        End Get
        Set(value As Integer)
            _departmentId = value
        End Set
    End Property


    Public Property Department As String
        Get
            Return _department
        End Get
        Set(value As String)
            _department = value
        End Set
    End Property


    Public Property file_location As String
        Get
            Return _location_code
        End Get
        Set(value As String)
            _location_code = value
        End Set
    End Property


    Public Property FirstName As String
        Get
            Return _first
        End Get
        Set(value As String)
            _first = value
        End Set
    End Property


    Public Property LastName As String
        Get
            Return _last
        End Get
        Set(value As String)
            _last = value
        End Set
    End Property


    Public Property FullName As String
        Get
            Return _fullname
        End Get
        Set(value As String)
            _fullname = value
        End Set
    End Property


End Class
