Imports Microsoft.VisualBasic


Namespace smci.policyholders


    Public Class PolicyholderAccountInfoVariables
        Private _customerNumber As String = String.Empty
        Private _policyNumber As String = String.Empty
        Private _moduleNumber As String = String.Empty
        Private _policyType As String = String.Empty
        Private _theInsured As String = String.Empty
        Private _insuredAddress As String = String.Empty
        Private _insuredCity As String = String.Empty
        Private _insuredZip As String = String.Empty
        Private _insuredState As String = String.Empty
        Private _insuredPhone As String = String.Empty
        Private _mailingAddress As String = String.Empty
        Private _mailingCity As String = String.Empty
        Private _mailingZip As String = String.Empty
        Private _mailingState As String = String.Empty
        Private _contactFullname As String = String.Empty


        Public Property Customernumber() As String
            Get
                Return _customerNumber
            End Get
            Set(ByVal value As String)
                _customerNumber = value
            End Set
        End Property

        Public Property Policynumber() As String
            Get
                Return _policyNumber
            End Get
            Set(ByVal value As String)
                _policyNumber = value
            End Set
        End Property

        Public Property Modulenumber() As String
            Get
                Return _moduleNumber
            End Get
            Set(ByVal value As String)
                _moduleNumber = value
            End Set
        End Property

        Public Property Policytype() As String
            Get
                Return _policyType
            End Get
            Set(ByVal value As String)
                _policyType = value
            End Set
        End Property

        Public Property Theinsured() As String
            Get
                Return _theInsured
            End Get
            Set(ByVal value As String)
                _theInsured = value
            End Set
        End Property

        Public Property Insuredaddress() As String
            Get
                Return _insuredAddress
            End Get
            Set(ByVal value As String)
                _insuredAddress = value
            End Set
        End Property

        Public Property Insuredcity() As String
            Get
                Return _insuredCity
            End Get
            Set(ByVal value As String)
                _insuredCity = value
            End Set
        End Property

        Public Property Insuredzip() As String
            Get
                Return _insuredZip
            End Get
            Set(ByVal value As String)
                _insuredZip = value
            End Set
        End Property

        Public Property Insuredstate() As String
            Get
                Return _insuredState
            End Get
            Set(ByVal value As String)
                _insuredState = value
            End Set
        End Property

        Public Property Insuredphone() As String
            Get
                Return _insuredPhone
            End Get
            Set(ByVal value As String)
                _insuredPhone = value
            End Set
        End Property

        Public Property Mailingaddress() As String
            Get
                Return _mailingAddress
            End Get
            Set(ByVal value As String)
                _mailingAddress = value
            End Set
        End Property

        Public Property Mailingcity() As String
            Get
                Return _mailingCity
            End Get
            Set(ByVal value As String)
                _mailingCity = value
            End Set
        End Property

        Public Property Mailingzip() As String
            Get
                Return _mailingState
            End Get
            Set(ByVal value As String)
                _mailingState = value
            End Set
        End Property

        Public Property Mailingstate() As String
            Get
                Return _mailingState
            End Get
            Set(ByVal value As String)
                _mailingState = value
            End Set
        End Property

        Public Property Contactfullname() As String
            Get
                Return _contactFullname
            End Get
            Set(ByVal value As String)
                _contactFullname = value
            End Set
        End Property
    End Class


    Public Class PMSP0200TABLE
        Private _cust0no As String = String.Empty
        Private _trans0stat As String = String.Empty
        Private _id02 As String = String.Empty
        Private _symbol As String = String.Empty
        Private _policy0num As String = String.Empty
        Private _policy0type As String = String.Empty
        Private _add0line01 As String = String.Empty
        Private _add0line03 As String = String.Empty
        Private _add0line04 As String = String.Empty
        Private _zip0post As String = String.Empty
        Private _module As String = String.Empty
        Private _days0elapsed As Integer
        Private _tot0ag0prm As String = String.Empty
        Private _enter0date As String
        Private _eff0date As Date
        Private _exp0date As Date
        Private _type0act As String = String.Empty
        Private _today0date As Date
        Private _agencyn0 As String = String.Empty
        Private _acnm0name1 As String = String.Empty
        Private _acnm0addrs As String = String.Empty
        Private _acnm0ctyst As String = String.Empty
        Private _acnm0zip As String = String.Empty
        Private _acnm0tele As String = String.Empty

        Public Property CUST0NO() As String
            Get
                Return _cust0no
            End Get
            Set(ByVal value As String)
                _cust0no = value
            End Set
        End Property


        Public Property TRANS0STAT() As String
            Get
                Return _trans0stat
            End Get
            Set(ByVal value As String)
                _trans0stat = value
            End Set
        End Property

        Public Property ID02() As String
            Get
                Return _id02
            End Get
            Set(ByVal value As String)
                _id02 = value
            End Set
        End Property

        Public Property SYMBOL() As String
            Get
                Return _symbol
            End Get
            Set(ByVal value As String)
                _symbol = value
            End Set
        End Property

        Public Property POLICY0NUM() As String
            Get
                Return _policy0num
            End Get
            Set(ByVal value As String)
                _policy0num = value
            End Set
        End Property

        Public Property POLICY0TYPE() As String
            Get
                Return _policy0type
            End Get
            Set(ByVal value As String)
                _policy0type = value
            End Set
        End Property

        Public Property ADD0LINE01() As String
            Get
                Return _add0line01
            End Get
            Set(ByVal value As String)
                _add0line01 = value
            End Set
        End Property

        Public Property ADD0LINE03() As String
            Get
                Return _add0line03
            End Get
            Set(ByVal value As String)
                _add0line03 = value
            End Set
        End Property

        Public Property ADD0LINE04() As String
            Get
                Return _add0line04
            End Get
            Set(ByVal value As String)
                _add0line04 = value
            End Set
        End Property

        Public Property ZIP0POST() As String
            Get
                Return _zip0post
            End Get
            Set(ByVal value As String)
                _zip0post = value
            End Set
        End Property

        Public Property M0DULE() As String
            Get
                Return _module
            End Get
            Set(ByVal value As String)
                _module = value
            End Set
        End Property

        Public Property DAYSELAPSED As Integer
            Get
                Return _days0elapsed
            End Get
            Set(ByVal value As Integer)
                _days0elapsed = value
            End Set
        End Property

        Public Property ENTER0DATE01 As String
            Get
                Return _enter0date
            End Get
            Set(ByVal value As String)
                _enter0date = value
            End Set
        End Property

        Public Property EFF0DATE As Date
            Get
                Return _eff0date
            End Get
            Set(ByVal value As Date)
                _eff0date = value
            End Set
        End Property

        Public Property EXP0DATE As Date
            Get
                Return _exp0date
            End Get
            Set(ByVal value As Date)
                _exp0date = value
            End Set
        End Property

        Public Property TOT0AG0PRM As String
            Get
                Return _tot0ag0prm
            End Get
            Set(ByVal value As String)
                _tot0ag0prm = value
            End Set
        End Property

        Public Property TYPE0ACT As String
            Get
                Return _type0act
            End Get
            Set(ByVal value As String)
                _type0act = value
            End Set
        End Property

        Public Property TODAY0DATE As Date
            Get
                Return _today0date
            End Get
            Set(ByVal value As Date)
                _today0date = value
            End Set
        End Property

        Public Property AGENCYNO As String
            Get
                Return _agencyn0
            End Get
            Set(ByVal value As String)
                _agencyn0 = value
            End Set
        End Property

        Public Property ACNM_NAME1 As String
            Get
                Return _acnm0name1
            End Get
            Set(ByVal value As String)
                _acnm0name1 = value
            End Set
        End Property

        Public Property ACNM_ADDRS As String
            Get
                Return _acnm0addrs
            End Get
            Set(ByVal value As String)
                _acnm0addrs = value
            End Set
        End Property

        Public Property ACNM_CTYST As String
            Get
                Return _acnm0ctyst
            End Get
            Set(ByVal value As String)
                _acnm0ctyst = value
            End Set
        End Property

        Public Property ACNM_ZIP As String
            Get
                Return _acnm0zip
            End Get
            Set(ByVal value As String)
                _acnm0zip = value
            End Set
        End Property

        Public Property ACNM_TELE As String
            Get
                Return _acnm0tele
            End Get
            Set(ByVal value As String)
                _acnm0tele = value
            End Set
        End Property

    End Class


    Public Class RCD0CPL1VIEW
        Private _d0custcd As String = String.Empty
        Private _d0polsym As String = String.Empty
        Private _d0polno As String = String.Empty
        Private _d0polsymno As String = String.Empty
        Private _d0polmod As String = String.Empty
        Private _d0nameins As String = String.Empty
        Private _d0modedesc As String = String.Empty
        Private _d0paydesc As String = String.Empty
        Private _d0effdte As Date
        Private _d0expdte As Date
        Private _d0dddt As Date
        Private _d0carry As Date
        'Private _d0nextdt As Date
        Private _d0chgdte As Date
        Private _d0akdt As Date
        Private _myexpdate As Date
        Private _todaydate As Date
        Private _d0clprem As String = String.Empty
        Private _d0gsva As Decimal
        Private _d0guva As Decimal
        Private _d0gvva As Decimal
        Private _amount0due As Decimal

        Public Property D0CUSTCD As String
            Get
                Return _d0custcd
            End Get
            Set(ByVal value As String)
                _d0custcd = value
            End Set
        End Property

        Public Property D0POLSYM As String
            Get
                Return _d0polsym
            End Get
            Set(ByVal value As String)
                _d0polsym = value
            End Set
        End Property

        Public Property D0POLNO As String
            Get
                Return _d0polno
            End Get
            Set(ByVal value As String)
                _d0polno = value
            End Set
        End Property

        Public Property D0POLSYMNO As String
            Get
                Return _d0polsymno
            End Get
            Set(ByVal value As String)
                _d0polsymno = value
            End Set
        End Property

        Public Property D0POLMOD As String
            Get
                Return _d0polmod
            End Get
            Set(ByVal value As String)
                _d0polmod = value
            End Set
        End Property

        Public Property D0NAMEINS As String
            Get
                Return _d0nameins
            End Get
            Set(ByVal value As String)
                _d0nameins = value
            End Set
        End Property

        Public Property D0MODEDESC As String
            Get
                Return _d0modedesc
            End Get
            Set(ByVal value As String)
                _d0modedesc = value
            End Set
        End Property

        Public Property D0PAYDESC As String
            Get
                Return _d0paydesc
            End Get
            Set(ByVal value As String)
                _d0paydesc = value
            End Set
        End Property

        Public Property D0EFFDTE As Date
            Get
                Return _d0effdte
            End Get
            Set(ByVal value As Date)
                _d0effdte = value
            End Set
        End Property

        Public Property D0EXPDTE As Date
            Get
                Return _d0expdte
            End Get
            Set(ByVal value As Date)
                _d0expdte = value
            End Set
        End Property

        Public Property D0DDDT As Date
            Get
                Return _d0dddt
            End Get
            Set(ByVal value As Date)
                _d0dddt = value
            End Set
        End Property

        Public Property D0CARRY As Date
            Get
                Return _d0carry
            End Get
            Set(ByVal value As Date)
                _d0carry = value
            End Set
        End Property

        'Public Property D0NEXTDT As Date
        '    Get
        '        Return _d0nextdt
        '    End Get
        '    Set(ByVal value As Date)
        '        _d0nextdt = value
        '    End Set
        'End Property

        Public Property D0CHGDTE As Date
            Get
                Return _d0chgdte
            End Get
            Set(ByVal value As Date)
                _d0chgdte = value
            End Set
        End Property

        Public Property D0AKDT As Date
            Get
                Return _d0akdt
            End Get
            Set(ByVal value As Date)
                _d0akdt = value
            End Set
        End Property

        Public Property MYEXPDATE As Date
            Get
                Return _myexpdate
            End Get
            Set(ByVal value As Date)
                _myexpdate = value
            End Set
        End Property

        Public Property TODAYDATE As Date
            Get
                Return _todaydate
            End Get
            Set(ByVal value As Date)
                _todaydate = value
            End Set
        End Property

        Public Property D0CLPREM As String
            Get
                Return _d0clprem
            End Get
            Set(ByVal value As String)
                _d0clprem = value
            End Set
        End Property

        Public Property D0GSVA As String
            Get
                Return _d0gsva
            End Get
            Set(ByVal value As String)
                _d0gsva = value
            End Set
        End Property

        Public Property D0GUVA As Decimal
            Get
                Return _d0guva
            End Get
            Set(ByVal value As Decimal)
                _d0guva = value
            End Set
        End Property

        Public Property D0GVVA As Decimal
            Get
                Return _d0gvva
            End Get
            Set(ByVal value As Decimal)
                _d0gvva = value
            End Set
        End Property

        Public Property AMOUNT0DUE As Decimal
            Get
                Return _amount0due
            End Get
            Set(ByVal value As Decimal)
                _amount0due = value
            End Set
        End Property

    End Class

    Public Class RCD3CPL1VIEW
        Private _d3poltype As String = String.Empty
        Private _d3totapp As String = String.Empty
        Private _d3writdate As Date
        Private _d3d4rcptid As String = String.Empty
        Private _d3d4act As String = String.Empty
        Private _d3polclt As String = String.Empty
        Private _amount As Decimal
        Private _viewinvoice As String = String.Empty
        Private _viewpolicy As String = String.Empty
        Private _policynum As String = String.Empty

        Public Property D3POLTYPE As String
            Get
                Return _d3poltype
            End Get
            Set(ByVal value As String)
                _d3poltype = value
            End Set
        End Property

        Public Property D3TOTAPP As String
            Get
                Return _d3totapp
            End Get
            Set(ByVal value As String)
                _d3totapp = value
            End Set
        End Property

        Public Property D3WRITDATE As Date
            Get
                Return _d3writdate
            End Get
            Set(ByVal value As Date)
                _d3writdate = value
            End Set
        End Property

        Public Property D3D4RCPTID As String
            Get
                Return _d3d4rcptid
            End Get
            Set(ByVal value As String)
                _d3d4rcptid = value
            End Set
        End Property

        Public Property D3D4ACT As String
            Get
                Return _d3d4act
            End Get
            Set(ByVal value As String)
                _d3d4act = value
            End Set
        End Property

        Public Property D3POLCLT As String
            Get
                Return _d3polclt
            End Get
            Set(ByVal value As String)
                _d3polclt = value
            End Set
        End Property

        Public Property AMOUNT As Decimal
            Get
                Return _amount
            End Get
            Set(ByVal value As Decimal)
                _amount = value
            End Set
        End Property

        Public Property VIEWINVOICE2 As String
            Get
                Return _viewinvoice
            End Get
            Set(ByVal value As String)
                _viewinvoice = value
            End Set
        End Property

        Public Property VIEWPOLICY2 As String
            Get
                Return _viewpolicy
            End Get
            Set(ByVal value As String)
                _viewpolicy = value
            End Set
        End Property

        Public Property D2POLNO As String
            Get
                Return _policynum
            End Get
            Set(ByVal value As String)
                _policynum = value
            End Set
        End Property

    End Class

    Public Class DRFTFILEVIEW
        Private _CLAIM As String = String.Empty
        Private _DRFTPRTDTE As Date
        Private _DRFTAMT As Decimal
        Private _DRFTNUMBER As String = String.Empty

        Public Property CLAIM As String
            Get
                Return _CLAIM
            End Get
            Set(ByVal value As String)
                _CLAIM = value
            End Set
        End Property

        Public Property DRFTPRTDTE As Date
            Get
                Return _DRFTPRTDTE
            End Get
            Set(ByVal value As Date)
                _DRFTPRTDTE = value
            End Set
        End Property

        Public Property DRFTAMT As Decimal
            Get
                Return _DRFTAMT
            End Get
            Set(ByVal value As Decimal)
                _DRFTAMT = value
            End Set
        End Property

        Public Property DRFTNUMBER As String
            Get
                Return _DRFTNUMBER
            End Get
            Set(ByVal value As String)
                _DRFTNUMBER = value
            End Set
        End Property
    End Class

    Public Class PMSL0217
        Private _agency As String = String.Empty
        Private _cust0no As String = String.Empty
        Private _symbol As String = String.Empty
        Private _policynum As String = String.Empty
        Private _m0dule As String = String.Empty
        Private _add0line01 As String = String.Empty
        Private _effdate As Date
        Private _expdate As Date
        Private _type0act As String = String.Empty
        Private _trans0stat As String = String.Empty
        Private _dayselapsed As String = String.Empty
        Private _viewinvoice As String = String.Empty
        Private _viewpolicy As String = String.Empty
        'Private _usrind3 As String = String.Empty
        Private _usrind3 As String

        Public Property Agency() As String
            Get
                Return _agency
            End Get
            Set(ByVal value As String)
                _agency = value
            End Set
        End Property

        Public Property Custnumber() As String
            Get
                Return _cust0no
            End Get
            Set(ByVal value As String)
                _cust0no = value
            End Set
        End Property

        Public Property Symbol() As String
            Get
                Return _symbol
            End Get
            Set(ByVal value As String)
                _symbol = value
            End Set
        End Property

        Public Property Policynum() As String
            Get
                Return _policynum
            End Get
            Set(ByVal value As String)
                _policynum = value
            End Set
        End Property

        Public Property M0dule() As String
            Get
                Return _m0dule
            End Get
            Set(ByVal value As String)
                _m0dule = value
            End Set
        End Property

        Public Property Add0line01() As String
            Get
                Return _add0line01
            End Get
            Set(ByVal value As String)
                _add0line01 = value
            End Set
        End Property

        Public Property Effdate() As Date
            Get
                Return _effdate
            End Get
            Set(ByVal value As Date)
                _effdate = value
            End Set
        End Property

        Public Property Expdate() As Date
            Get
                Return _expdate
            End Get
            Set(ByVal value As Date)
                _expdate = value
            End Set
        End Property

        Public Property Type0act() As String
            Get
                Return _type0act
            End Get
            Set(ByVal value As String)
                _type0act = value
            End Set
        End Property

        Public Property Trans0stat As String
            Get
                Return _trans0stat
            End Get
            Set(ByVal value As String)
                _trans0stat = value
            End Set
        End Property

        Public Property Dayselapsed() As String
            Get
                Return _dayselapsed
            End Get
            Set(ByVal value As String)
                _dayselapsed = value
            End Set
        End Property

        Public Property Viewinvoice As String
            Get
                Return _viewinvoice
            End Get
            Set(ByVal value As String)
                _viewinvoice = value
            End Set
        End Property

        Public Property Viewpolicy As String
            Get
                Return _viewpolicy
            End Get
            Set(ByVal value As String)
                _viewpolicy = value
            End Set
        End Property

        Public Property Usrind3 As String
            Get
                Return _usrind3
            End Get
            Set(ByVal value As String)
                _usrind3 = value
            End Set
        End Property
    End Class

    Public Class USERPROFILETABLE
        Private _username As String = String.Empty
        Private _firstname As String = String.Empty
        Private _lastname As String = String.Empty
        Private _fullname As String = String.Empty
        Private _Theinsured As String = String.Empty
        Private _address As String = String.Empty
        Private _city As String = String.Empty
        Private _zip As String = String.Empty
        Private _phone As String = String.Empty


        Public Property Username() As String
            Get
                Return _username
            End Get
            Set(ByVal value As String)
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
            Set(ByVal value As String)
                _fullname = value
            End Set
        End Property

        Public Property Theinsured As String
            Get
                Return _Theinsured
            End Get
            Set(ByVal value As String)
                _Theinsured = value
            End Set
        End Property

        Public Property Address As String
            Get
                Return _address
            End Get
            Set(ByVal value As String)
                _address = value
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

        Public Property Zip As String
            Get
                Return _zip
            End Get
            Set(ByVal value As String)
                _zip = value
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
    End Class

    Public Class RCD0CPL1TABLE
        Private _d0polagy As String = String.Empty
        Private _d0nameins As String = String.Empty
        Private _d0custcd As String = String.Empty
        Private _d0polsym As String = String.Empty
        Private _d0polno As String = String.Empty
        Private _d0polmod As String = String.Empty
        Private _d0paydesc As String = String.Empty
        Private _d0modedesc As String = String.Empty
        Private _d0clprem As Decimal = 0
        Private _d0gsva As Decimal = 0
        Private _d0gvva As Decimal = 0
        Private _d0eff0dte As Date
        Private _d0exp0dte As Date
        Private _d0polsymnomod As String = String.Empty
        Private _d0session As String = String.Empty
        Private _current As String = String.Empty
        Private _symb0l As String = String.Empty
        'INNER JOIN TABLE
        Private _usrind3 As String = String.Empty
        Private _viewit As String = String.Empty

        Public Property Agency As String
            Get
                Return _d0polagy
            End Get
            Set(ByVal value As String)
                _d0polagy = value
            End Set
        End Property

        Public Property TheInsured As String
            Get
                Return _d0nameins
            End Get
            Set(ByVal value As String)
                _d0nameins = value
            End Set
        End Property

        Public Property CustomerNum As String
            Get
                Return _d0custcd
            End Get
            Set(ByVal value As String)
                _d0custcd = value
            End Set
        End Property

        Public Property PolicyType As String
            Get
                Return _d0polsym
            End Get
            Set(ByVal value As String)
                _d0polsym = value
            End Set
        End Property

        Public Property PolicyNum As String
            Get
                Return _d0polno
            End Get
            Set(ByVal value As String)
                _d0polno = value
            End Set
        End Property

        Public Property Paymenttype As String
            Get
                Return _d0paydesc
            End Get
            Set(ByVal value As String)
                _d0paydesc = value
            End Set
        End Property

        Public Property Paymentplan As String
            Get
                Return _d0modedesc
            End Get
            Set(ByVal value As String)
                _d0modedesc = value
            End Set
        End Property

        Public Property M0dule As String
            Get
                Return _d0polmod
            End Get
            Set(ByVal value As String)
                _d0polmod = value
            End Set
        End Property

        Public Property TotalPrem As Decimal
            Get
                Return _d0clprem
            End Get
            Set(ByVal value As Decimal)
                _d0clprem = value
            End Set
        End Property

        Public Property TotalPaid As Decimal
            Get
                Return _d0gsva
            End Get
            Set(ByVal value As Decimal)
                _d0gsva = value
            End Set
        End Property

        Public Property Balance As Decimal
            Get
                Return _d0gvva
            End Get
            Set(ByVal value As Decimal)
                _d0gvva = value
            End Set
        End Property

        Public Property EffDate As Date
            Get
                Return _d0eff0dte
            End Get
            Set(ByVal value As Date)
                _d0eff0dte = value
            End Set
        End Property

        Public Property ExpDate As Date
            Get
                Return _d0exp0dte
            End Get
            Set(ByVal value As Date)
                _d0exp0dte = value
            End Set
        End Property

        Public Property Allpolnum As String
            Get
                Return _d0polsymnomod
            End Get
            Set(ByVal value As String)
                _d0polsymnomod = value
            End Set
        End Property

        Public Property HyperlinkId As String
            Get
                Return _d0session
            End Get
            Set(ByVal value As String)
                _d0session = value
            End Set
        End Property

        Public Property Currentpol As String
            Get
                Return _current
            End Get
            Set(ByVal value As String)
                _current = value
            End Set
        End Property

        'INNER JOIN
        Public Property Usrind3 As String
            Get
                Return _usrind3
            End Get
            Set(ByVal value As String)
                _usrind3 = value
            End Set
        End Property

        Public Property VIEWIT As String
            Get
                Return _viewit
            End Get
            Set(ByVal value As String)
                _viewit = value
            End Set
        End Property

        Public Property Symbol As String
            Get
                Return _symb0l
            End Get
            Set(value As String)
                _symb0l = value
            End Set
        End Property

    End Class

    Public Class RCD2CPPTABLE
        Private _d2b8st As String = String.Empty
        Private _d2axdt As Date
        Private _d2bhnb As String = String.Empty
        Private _d2cjva As Decimal = 0
        Private _d2b2cd As String = String.Empty
        Private _d2istx As String = String.Empty
        Private _d2polsym As String = String.Empty
        Private _d2polmod As String = String.Empty
        Private _d2polno As String = String.Empty
        Private _message As String = String.Empty
        Private _paid As String = String.Empty
        'INNER JOIN TABLE
        'Private _trans0stat As String = String.Empty
        'Private _id02 As String = String.Empty
        'Private _symb0l As String = String.Empty
        'Private _policy0num As String = String.Empty
        'Private _m0dule As Integer
        'Private _usrind3 As String = String.Empty

        Public Property Custnum As String
            Get
                Return _d2b2cd
            End Get
            Set(ByVal value As String)
                _d2b2cd = value
            End Set
        End Property

        Public Property Policynum As String
            Get
                Return _d2polno
            End Get
            Set(ByVal value As String)
                _d2polno = value
            End Set
        End Property

        Public Property Policytype As String
            Get
                Return _d2polsym
            End Get
            Set(ByVal value As String)
                _d2polsym = value
            End Set
        End Property

        Public Property D2istx As String
            Get
                Return _d2istx
            End Get
            Set(ByVal value As String)
                _d2istx = value
            End Set
        End Property

        Public Property M0dule As String
            Get
                Return _d2polmod
            End Get
            Set(ByVal value As String)
                _d2polmod = value
            End Set
        End Property

        Public Property Nextpayment As Decimal
            Get
                Return _d2cjva
            End Get
            Set(ByVal value As Decimal)
                _d2cjva = value
            End Set
        End Property

        Public Property D2bhnb As String
            Get
                Return _d2bhnb
            End Get
            Set(ByVal value As String)
                _d2bhnb = value
            End Set
        End Property

        Public Property Datedue As Date
            Get
                Return _d2axdt
            End Get
            Set(ByVal value As Date)
                _d2axdt = value
            End Set
        End Property

        Public Property D2b8st As String
            Get
                Return _d2b8st
            End Get
            Set(ByVal value As String)
                _d2b8st = value
            End Set
        End Property

        Public Property Message As String
            Get
                Return _message
            End Get
            Set(ByVal value As String)
                _message = value
            End Set
        End Property

        Public Property Paid As String
            Get
                Return _paid
            End Get
            Set(ByVal value As String)
                _paid = value
            End Set
        End Property

    End Class

    Public Class RCD2CPP_FOR_PAYMENT
        Private _d2b8st As String = String.Empty
        Private _d2axdt As Date
        Private _d2bhnb As String = String.Empty
        Private _d2cjva As Decimal = 0
        Private _d2b2cd As String = String.Empty
        Private _d2istx As String = String.Empty
        Private _d2polsym As String = String.Empty
        Private _d2polmod As String = String.Empty
        Private _d2polno As String = String.Empty
        Private _message As String = String.Empty
        Private _paid As String = String.Empty

        Public Property Custnum As String
            Get
                Return _d2b2cd
            End Get
            Set(ByVal value As String)
                _d2b2cd = value
            End Set
        End Property

        Public Property Policynum As String
            Get
                Return _d2polno
            End Get
            Set(ByVal value As String)
                _d2polno = value
            End Set
        End Property

        Public Property Policytype As String
            Get
                Return _d2polsym
            End Get
            Set(ByVal value As String)
                _d2polsym = value
            End Set
        End Property

        Public Property D2istx As String
            Get
                Return _d2istx
            End Get
            Set(ByVal value As String)
                _d2istx = value
            End Set
        End Property

        Public Property M0dule As String
            Get
                Return _d2polmod
            End Get
            Set(ByVal value As String)
                _d2polmod = value
            End Set
        End Property

        Public Property Nextpayment As Decimal
            Get
                Return _d2cjva
            End Get
            Set(ByVal value As Decimal)
                _d2cjva = value
            End Set
        End Property

        Public Property D2bhnb As String
            Get
                Return _d2bhnb
            End Get
            Set(ByVal value As String)
                _d2bhnb = value
            End Set
        End Property

        Public Property Datedue As Date
            Get
                Return _d2axdt
            End Get
            Set(ByVal value As Date)
                _d2axdt = value
            End Set
        End Property

        Public Property D2b8st As String
            Get
                Return _d2b8st
            End Get
            Set(ByVal value As String)
                _d2b8st = value
            End Set
        End Property

        Public Property Message As String
            Get
                Return _message
            End Get
            Set(ByVal value As String)
                _message = value
            End Set
        End Property

        Public Property Paid As String
            Get
                Return _paid
            End Get
            Set(ByVal value As String)
                _paid = value
            End Set
        End Property
    End Class

    Public Class BASP0200E
        Private _trans0stat As String = String.Empty
        Private _id02 As String = String.Empty
        Private _symb0l As String = String.Empty
        Private _policy0num As String = String.Empty
        Private _m0dule As Integer
        Private _usrind3 As String = String.Empty

        Public Property Trans0stat As String
            Get
                Return _trans0stat
            End Get
            Set(ByVal value As String)
                _trans0stat = value
            End Set
        End Property

        Public Property Symbol As String
            Get
                Return _symb0l
            End Get
            Set(ByVal value As String)
                _symb0l = value
            End Set
        End Property

        Public Property Policynum As String
            Get
                Return _policy0num
            End Get
            Set(ByVal value As String)
                _policy0num = value
            End Set
        End Property

        Public Property M0dule As Integer
            Get
                Return _m0dule
            End Get
            Set(ByVal value As Integer)
                _m0dule = value
            End Set
        End Property

        Public Property Usrind3 As String
            Get
                Return _usrind3
            End Get
            Set(ByVal value As String)
                _usrind3 = value
            End Set
        End Property

    End Class

End Namespace