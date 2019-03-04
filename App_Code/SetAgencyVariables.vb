Imports System
Imports System.Collections.Generic
Imports smci.DataAccessLayer


Namespace smci.agents

    Public Class Agency

        Private _agentNum As String = String.Empty
        Private _nameOfAgency As String = String.Empty
        Private _fileAs As String = String.Empty
        Private _Fid As String = String.Empty
        Private _licenseNum As String = String.Empty
        Private _Npn As String = String.Empty
        Private _contingency As String = String.Empty
        Private _canceldate As Date
        Private _activeDate As Date
        Private _copyOfLicense As String = String.Empty
        Private _locationNumber As Integer = 0
        Private _address As String = String.Empty
        Private _city As String = String.Empty
        Private _state As String = String.Empty
        Private _zip As String = String.Empty
        Private _mailaddress As String = String.Empty
        Private _mailcity As String = String.Empty
        Private _mailstate As String = String.Empty
        Private _mailzip As String = String.Empty
        Private _phone As String = String.Empty
        Private _fax As String = String.Empty
        Private _tollFreeNum As String = String.Empty
        Private _recordNumber As Integer = 0
        Private _firstName As String = String.Empty
        Private _lastName As String = String.Empty
        Private _fullname As String = String.Empty
        Private _cellNum As String = String.Empty
        Private _email As String = String.Empty
        Private _recordDate As Date
        Private _dateOfChange As Date
        Private _agentnumber As String
        Private _contingency1 As Decimal
        Private _cancellationdate As Date

        Public Property Agentnumber() As String
            Get
                Return _agentNum
            End Get
            Set(ByVal value As String)
                _agentNum = value
            End Set
        End Property

        Public Property Nameofagency() As String
            Get
                Return _nameOfAgency
            End Get
            Set(ByVal value As String)
                _nameOfAgency = value
            End Set
        End Property

        Public Property Fileas() As String
            Get
                Return _fileAs
            End Get
            Set(ByVal value As String)
                _fileAs = value
            End Set
        End Property

        Public Property Fid() As String
            Get
                Return _Fid
            End Get
            Set(ByVal value As String)
                _Fid = value
            End Set
        End Property

        Public Property Licensenum() As String
            Get
                Return _licenseNum
            End Get
            Set(ByVal value As String)
                _licenseNum = value
            End Set
        End Property

        Public Property Npn() As String
            Get
                Return _Npn
            End Get
            Set(ByVal value As String)
                _Npn = value
            End Set
        End Property

        Public Property Contingency() As String
            Get
                Return _contingency
            End Get
            Set(ByVal value As String)
                _contingency = value
            End Set
        End Property

        Public Property Cancellationdate() As Date
            Get
                Return _canceldate
            End Get
            Set(ByVal value As Date)
                _canceldate = value
            End Set
        End Property

        Public Property Activedate() As Date
            Get
                Return _activeDate
            End Get
            Set(ByVal value As Date)
                _activeDate = value
            End Set
        End Property

        Public Property Copyoflicense() As String
            Get
                Return _copyOfLicense
            End Get
            Set(ByVal value As String)
                _copyOfLicense = value
            End Set
        End Property

        Public Property Recorddate() As Date
            Get
                Return _recordDate
            End Get
            Set(ByVal value As Date)
                _recordDate = value
            End Set
        End Property

        Public Property Locationnumber() As Integer
            Get
                Return _locationNumber
            End Get
            Set(ByVal value As Integer)
                _locationNumber = value
            End Set
        End Property

        Public Property Address() As String
            Get
                Return _address
            End Get
            Set(ByVal value As String)
                _address = value
            End Set
        End Property

        Public Property City() As String
            Get
                Return _city
            End Get
            Set(ByVal value As String)
                _city = value
            End Set
        End Property

        Public Property State() As String
            Get
                Return _state
            End Get
            Set(ByVal value As String)
                _state = value
            End Set
        End Property

        Public Property Zip() As String
            Get
                Return _zip
            End Get
            Set(ByVal value As String)
                _zip = value
            End Set
        End Property

        Public Property Mailaddress() As String
            Get
                Return _mailaddress
            End Get
            Set(ByVal value As String)
                _mailaddress = value
            End Set
        End Property

        Public Property Mailcity() As String
            Get
                Return _mailcity
            End Get
            Set(ByVal value As String)
                _mailcity = value
            End Set
        End Property

        Public Property Mailstate() As String
            Get
                Return _mailstate
            End Get
            Set(ByVal value As String)
                _state = value
            End Set
        End Property

        Public Property Mailzip() As String
            Get
                Return _mailzip
            End Get
            Set(ByVal value As String)
                _zip = value
            End Set
        End Property

        Public Property Phone() As String
            Get
                Return _phone
            End Get
            Set(ByVal value As String)
                _phone = value
            End Set
        End Property

        Public Property Fax() As String
            Get
                Return _fax
            End Get
            Set(ByVal value As String)
                _fax = value
            End Set
        End Property

        Public Property Tollfreenumber() As String
            Get
                Return _tollFreeNum
            End Get
            Set(ByVal value As String)
                _tollFreeNum = value
            End Set
        End Property

        Public Property Dateofchange() As Date
            Get
                Return _dateOfChange
            End Get
            Set(ByVal value As Date)
                _dateOfChange = value
            End Set
        End Property

        Public Property Recordnumber() As Integer
            Get
                Return _recordNumber
            End Get
            Set(ByVal value As Integer)
                _recordNumber = value
            End Set
        End Property

        Public Property Firstname() As String
            Get
                Return _firstName
            End Get
            Set(ByVal value As String)
                _firstName = value
            End Set
        End Property

        Public Property Lastname() As String
            Get
                Return _lastName
            End Get
            Set(ByVal value As String)
                _lastName = value
            End Set
        End Property

        Public Property Fullname() As String
            Get
                Return _fullname
            End Get
            Set(ByVal value As String)
                _fullname = value
            End Set
        End Property

        Public Property Cellnumber() As String
            Get
                Return _cellNum
            End Get
            Set(ByVal value As String)
                _cellNum = value
            End Set
        End Property

        Public Property Email() As String
            Get
                Return _email
            End Get
            Set(ByVal value As String)
                _email = value
            End Set
        End Property

    End Class

    Public Class vw_agysummary
        Private _agent As String = String.Empty
        Private _mtdPrem As Double
        Private _ytdPrem As Double
        Private _earnedPrem As Double
        Private _inforcePrem As Double
        Private _currResv As Double
        Private _priorResv As Double
        Private _paidYtd As Double
        Private _laeCurrResv As Double
        Private _laePriorResv As Double
        Private _laePaidYtd As Double
        Private _totalIncurred As Double
        Private _lossRatio As Single

        Public Property Agent() As String
            Get
                Return _agent
            End Get
            Set(ByVal value As String)
                _agent = value
            End Set
        End Property

        Public Property Mtdprem() As Double
            Get
                Return _mtdPrem
            End Get
            Set(ByVal value As Double)
                _mtdPrem = value
            End Set
        End Property

        Public Property Ytdprem() As Double
            Get
                Return _ytdPrem
            End Get
            Set(ByVal value As Double)
                _ytdPrem = value
            End Set
        End Property

        Public Property Earnprem() As Double
            Get
                Return _earnedPrem
            End Get
            Set(ByVal value As Double)
                _earnedPrem = value
            End Set
        End Property

        Public Property Inforceprem() As Double
            Get
                Return _inforcePrem
            End Get
            Set(ByVal value As Double)
                _inforcePrem = value
            End Set
        End Property

        Public Property Currresv() As Double
            Get
                Return _currResv
            End Get
            Set(ByVal value As Double)
                _currResv = value
            End Set
        End Property

        Public Property Priorresv() As Double
            Get
                Return _priorResv
            End Get
            Set(ByVal value As Double)
                _priorResv = value
            End Set
        End Property

        Public Property Paidytd() As Double
            Get
                Return _paidYtd
            End Get
            Set(ByVal value As Double)
                _paidYtd = value
            End Set
        End Property

        Public Property Laecurrresv() As Double
            Get
                Return _laeCurrResv
            End Get
            Set(ByVal value As Double)
                _laeCurrResv = value
            End Set
        End Property

        Public Property Laepriorresv() As Double
            Get
                Return _laePriorResv
            End Get
            Set(ByVal value As Double)
                _laePriorResv = value
            End Set
        End Property

        Public Property Laepaidytd() As Double
            Get
                Return _laePaidYtd
            End Get
            Set(ByVal value As Double)
                _laePaidYtd = value
            End Set
        End Property

        Public Property Totalincurred As Double
            Get
                Return _totalIncurred
            End Get
            Set(ByVal value As Double)
                _totalIncurred = value
            End Set
        End Property

        Public Property Lossratio As Single
            Get
                Return _lossRatio
            End Get
            Set(ByVal value As Single)
                _lossRatio = value
            End Set
        End Property
    End Class

    Public Class AGENTPROFILETABLE
        Private _id As Integer
        Private _usernameis As String = String.Empty
        Private _masterid As String = String.Empty
        Private _agentcode As String = String.Empty
        Private _username As String = String.Empty
        Private _firstname As String = String.Empty
        Private _lastname As String = String.Empty
        Private _fullname As String = String.Empty
        Private _phone As String = String.Empty
        Private _position As String = String.Empty
        Private _city As String = String.Empty
        Private _state As String = String.Empty
        Private _role As String = String.Empty
        Private _from As Integer = 0

        Public Property Id() As Integer
            Get
                Return _id
            End Get
            Set(value As Integer)
                _id = value
            End Set
        End Property

        Public Property Usernameis As String
            Get
                Return _usernameis
            End Get
            Set(value As String)
                _usernameis = value
            End Set
        End Property

        Public Property Masterid As String
            Get
                Return _masterid
            End Get
            Set(value As String)
                _masterid = value
            End Set
        End Property

        Public Property Agentcode() As String
            Get
                Return _agentcode
            End Get
            Set(ByVal value As String)
                _agentcode = value
            End Set
        End Property

        Public Property Username() As String
            Get
                Return _username
            End Get
            Set(value As String)
                _username = value
            End Set
        End Property

        Public Property Firstname() As String
            Get
                Return _firstname
            End Get
            Set(ByVal value As String)
                _firstname = value
            End Set
        End Property

        Public Property Lastname() As String
            Get
                Return _lastname
            End Get
            Set(ByVal value As String)
                _lastname = value
            End Set
        End Property

        Public Property Fullname() As String
            Get
                Return _fullname
            End Get
            Set(value As String)
                _fullname = value
            End Set
        End Property

        Public Property Phone As String
            Get
                Return _phone
            End Get
            Set(ByVal value As String)
                _phone = value
            End Set
        End Property

        Public Property Position As String
            Get
                Return _position
            End Get
            Set(ByVal value As String)
                _position = value
            End Set
        End Property

        Public Property City As String
            Get
                Return _city
            End Get
            Set(ByVal value As String)
                _city = value
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

        Public Property Role As String
            Get
                Return _role
            End Get
            Set(value As String)
                _role = value
            End Set
        End Property

        Public Property Createdfrom As Integer
            Get
                Return _from
            End Get
            Set(value As Integer)
                _from = value
            End Set
        End Property

    End Class

    Public Class MediaManagement
        Private _MyParam As String


        Public Property Myparam As String
            Get
                Return _MyParam
            End Get
            Set(value As String)
                _MyParam = value
            End Set
        End Property

    End Class

End Namespace