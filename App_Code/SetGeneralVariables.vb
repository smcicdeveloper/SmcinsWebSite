Imports Microsoft.VisualBasic
Imports smci.DataAccessLayer

Namespace smci.SetVaribles

    Public Class BoardPhoto
        Private _id As Integer
        Private _albumid As Integer
        'Private _caption As String
        Private _fullname As String
        Private _description As String

        Public Sub New(ByVal id As Integer, ByVal boardalbumid As Integer, ByVal FullName As String, ByVal Description As String)
            MyBase.New()
            _id = id
            _albumid = boardalbumid
            _fullname = FullName
            _description = Description
        End Sub

        Public ReadOnly Property BoardPhotoID() As Integer
            Get
                Return _id
            End Get
        End Property

        Public ReadOnly Property BoardAlbumID() As Integer
            Get
                Return _albumid
            End Get
        End Property

        Public ReadOnly Property FullName() As String
            Get
                Return _fullname
            End Get
        End Property

        Public ReadOnly Property Description() As String
            Get
                Return _description
            End Get
        End Property
    End Class

    Public Class AgentTerritories
        Private _agentNum As String = String.Empty
        Private _stateId As String = String.Empty
        Private _county As String = String.Empty
        Private _nameOfAgency As String = String.Empty
        Private _fullName As String = String.Empty
        Private _address As String = String.Empty
        Private _city As String = String.Empty
        Private _state As String = String.Empty
        Private _zip As String = String.Empty
        Private _phone As String = String.Empty
        Private _eMail As String = String.Empty


        Public Property Agentnum() As String
            Get
                Return _agentNum
            End Get
            Set(ByVal value As String)
                _agentNum = value
            End Set
        End Property

        Public Property Stateid() As String
            Get
                Return _stateId
            End Get
            Set(ByVal value As String)
                _stateId = value
            End Set
        End Property

        Public Property County() As String
            Get
                Return _county
            End Get
            Set(ByVal value As String)
                _county = value
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

        Public Property Fullname() As String
            Get
                Return _fullName
            End Get
            Set(ByVal value As String)
                _fullName = value
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

        Public Property Phone() As String
            Get
                Return _phone
            End Get
            Set(ByVal value As String)
                _phone = value
            End Set
        End Property

        Public Property Email() As String
            Get
                Return _eMail
            End Get
            Set(ByVal value As String)
                _eMail = value
            End Set
        End Property

    End Class

    Public Class StateList
        Private _stateId As String = String.Empty
        Private _state As String = String.Empty

        Public Property Stateid As String
            Get
                Return _stateId
            End Get
            Set(ByVal value As String)
                _stateId = value
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
    End Class

    Public Class CountyList
        Private _stateId As String = String.Empty
        Private _county As String

        Public Property Stateid() As String
            Get
                Return _stateId
            End Get
            Set(ByVal value As String)
                _stateId = value
            End Set
        End Property

        Public Property County() As String
            Get
                Return _county
            End Get
            Set(ByVal value As String)
                _county = value
            End Set
        End Property
    End Class


    Public Class Uploadfiles
        Private _id As String = String.Empty
        Private _fname As String = String.Empty
        Private _Cdate As Date
        Private _fbytes As String

        Public Property Id() As String
            Get
                Return _id
            End Get
            Set(ByVal value As String)
                _id = value
            End Set
        End Property

        Public Property FileName() As String
            Get
                Return _fname
            End Get
            Set(ByVal value As String)
                _fname = value
            End Set
        End Property

        Public Property Filedate() As Date
            Get
                Return _Cdate
            End Get
            Set(ByVal value As Date)
                _Cdate = value
            End Set
        End Property

        Public Property Fbytes() As String
            Get
                Return _fbytes
            End Get
            Set(ByVal value As String)
                _fbytes = value
            End Set
        End Property
    End Class

    Public Class GeneralInformationApplication
        Private _ReqNum As Integer
        Private _Agency As String
        Private _AgentNum As String
        Private _AgentName As String
        Private _AgentEmail1 As String
        Private _AgentEmail2 As String
        Private _ChurchName As String
        Private _MailingAddress As String
        Private _MailingCity As String
        Private _MailingState As String
        Private _MailingZip As String
        Private _ChurchUrl As String
        Private _CurrentCarrier As String
        Private _ExDate As Date
        Private _CurrSmpPrem As Decimal
        Private _Prior3 As String
        Private _PriorExplain As String
        Private _Contact As String
        Private _Phone1 As String
        Private _Phone2 As String
        Private _MortLossPayee As String
        Private _Incorp As String
        Private _QuoteType As String
        Private _Status As String
        Private _AppLevel As Integer
        Private _SubmitDate As Date
        Private _AssignedTo As String

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Agency As String
            Get
                Return _Agency
            End Get
            Set(ByVal value As String)
                _Agency = value
            End Set
        End Property

        Public Property Agentnum As String
            Get
                Return _AgentNum
            End Get
            Set(ByVal value As String)
                _AgentNum = value
            End Set
        End Property

        Public Property Agentname As String
            Get
                Return _AgentNum
            End Get
            Set(ByVal value As String)
                _AgentNum = value
            End Set
        End Property

        Public Property Agentemail1 As String
            Get
                Return _AgentEmail1
            End Get
            Set(ByVal value As String)
                _AgentEmail1 = value
            End Set
        End Property

        Public Property Agentemail2 As String
            Get
                Return _AgentEmail2
            End Get
            Set(ByVal value As String)
                _AgentEmail2 = value
            End Set
        End Property

        Public Property Churchname As String
            Get
                Return _ChurchName
            End Get
            Set(ByVal value As String)
                _ChurchName = value
            End Set
        End Property

        Public Property Mailingaddress As String
            Get
                Return _MailingAddress
            End Get
            Set(ByVal value As String)
                _MailingAddress = value
            End Set
        End Property

        Public Property Mailingcity As String
            Get
                Return _MailingCity
            End Get
            Set(ByVal value As String)
                _MailingCity = value
            End Set
        End Property

        Public Property Mailingstate As String
            Get
                Return _MailingState
            End Get
            Set(ByVal value As String)
                _MailingState = value
            End Set
        End Property

        Public Property Mailingzip As String
            Get
                Return _MailingZip
            End Get
            Set(ByVal value As String)
                _MailingZip = value
            End Set
        End Property

        Public Property Churchurl As String
            Get
                Return _CurrentCarrier
            End Get
            Set(ByVal value As String)
                _CurrentCarrier = value
            End Set
        End Property

        Public Property Currentcarrier As String
            Get
                Return _CurrentCarrier
            End Get
            Set(ByVal value As String)
                _CurrentCarrier = value
            End Set
        End Property

        Public Property Exdate As Date
            Get
                Return _ExDate
            End Get
            Set(ByVal value As Date)
                _ExDate = value
            End Set
        End Property

        Public Property Currsmpprem As String
            Get
                Return _CurrSmpPrem
            End Get
            Set(ByVal value As String)
                _CurrSmpPrem = value
            End Set
        End Property

        Public Property Prior3 As String
            Get
                Return _Prior3
            End Get
            Set(ByVal value As String)
                _Prior3 = value
            End Set
        End Property

        Public Property Priorexplain As String
            Get
                Return _PriorExplain
            End Get
            Set(ByVal value As String)
                _PriorExplain = value
            End Set
        End Property

        Public Property Contact As String
            Get
                Return _Contact
            End Get
            Set(ByVal value As String)
                _Contact = value
            End Set
        End Property

        Public Property Phone1 As String
            Get
                Return _Phone1
            End Get
            Set(ByVal value As String)
                _Phone1 = value
            End Set
        End Property

        Public Property Phone2 As String
            Get
                Return _Phone2
            End Get
            Set(ByVal value As String)
                _Phone2 = value
            End Set
        End Property

        Public Property Mortlosspayee As String
            Get
                Return _MortLossPayee
            End Get
            Set(ByVal value As String)
                _MortLossPayee = value
            End Set
        End Property

        Public Property Incorp As String
            Get
                Return _Incorp
            End Get
            Set(ByVal value As String)
                _Incorp = value
            End Set
        End Property

        Public Property Quotetype As String
            Get
                Return _QuoteType
            End Get
            Set(ByVal value As String)
                _QuoteType = value
            End Set
        End Property

        Public Property Applevel As Integer
            Get
                Return _AppLevel
            End Get
            Set(ByVal value As Integer)
                _AppLevel = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Submittdate As Date
            Get
                Return _SubmitDate
            End Get
            Set(ByVal value As Date)
                _SubmitDate = value
            End Set
        End Property

        Public Property Assignedto As String
            Get
                Return _AssignedTo
            End Get
            Set(ByVal value As String)
                _AssignedTo = value
            End Set
        End Property

    End Class

    Public Class SmpApplication

        Private _ReqNum As Integer
        Private _Deduct As Decimal
        Private _FormType As String
        Private _RcAcv As String
        Private _Blanket As String
        Private _Earth As String
        Private _Money As Decimal
        Private _EmpDis As Decimal
        Private _Forgery As Decimal
        Private _OrdLaw As Decimal
        Private _ExtraExp As Decimal
        Private _WaterSewer As Decimal
        Private _PropComments As String
        Private _GenLiab As Decimal
        Private _PerOccur As Decimal
        Private _MedPay As Decimal
        Private _PastoralCoun As Decimal
        Private _SexMisconduct As Decimal
        Private _DirectOffice As Decimal
        Private _Hired As Decimal
        Private _EmpBenefits As Decimal
        Private _EmpPratice As Decimal
        Private _Misc As String
        Private _ViolentActs As String
        Private _Teacher As Decimal
        Private _CorpPunish As Decimal
        Private _LostWages As Decimal
        Private _PropOwned As String
        Private _WhoIsOwner As String
        Private _Daycare As String
        Private _NumOfChild As String
        Private _BgChecks As String
        Private _Playground As String
        Private _PlayFence As String
        Private _Cemetery As String
        Private _CemFenced As String
        Private _MainProperty As String
        Private _CemeteryAddress As String
        Private _Ballfield As String
        Private _Ballfenced As String
        Private _LocChurProp As String
        Private _ExpChurchComments As String
        Private _AverageAtten As String
        Private _FiveYearLoss As String
        Private _Date1 As Date
        Private _Descr1 As String
        Private _Amount1 As Decimal
        Private _Date2 As Date
        Private _Descr2 As String
        Private _Amount2 As Decimal
        Private _Date3 As Date
        Private _Descr3 As String
        Private _Amount3 As Decimal
        Private _Date4 As Date
        Private _Descr4 As String
        Private _Amount4 As Decimal
        Private _Date5 As Date
        Private _Descr5 As String
        Private _Amount5 As Decimal
        Private _OweVehicle As String
        Private _WorkComp As String
        Private _Umbrella As String
        Private _Status As String
        Private _SubmitDate As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Deduct As Decimal
            Get
                Return _Deduct
            End Get
            Set(ByVal value As Decimal)
                _Deduct = value
            End Set
        End Property

        Public Property Formtype As String
            Get
                Return _FormType
            End Get
            Set(ByVal value As String)
                _FormType = value
            End Set
        End Property

        Public Property Rcacv As String
            Get
                Return _RcAcv
            End Get
            Set(ByVal value As String)
                _RcAcv = value
            End Set
        End Property

        Public Property Blanket As String
            Get
                Return _Blanket
            End Get
            Set(ByVal value As String)
                _Blanket = value
            End Set
        End Property

        Public Property Earthquake As String
            Get
                Return _Earth
            End Get
            Set(ByVal value As String)
                _Earth = value
            End Set
        End Property

        Public Property Moneysecurity As Decimal
            Get
                Return _Money
            End Get
            Set(ByVal value As Decimal)
                _Money = value
            End Set
        End Property

        Public Property Empdishonesty As Decimal
            Get
                Return _EmpDis
            End Get
            Set(ByVal value As Decimal)
                _EmpDis = value
            End Set
        End Property

        Public Property Forgery As Decimal
            Get
                Return _Forgery
            End Get
            Set(ByVal value As Decimal)
                _Forgery = value
            End Set
        End Property

        Public Property Ordlaw As Decimal
            Get
                Return _OrdLaw
            End Get
            Set(ByVal value As Decimal)
                _OrdLaw = value
            End Set
        End Property

        Public Property Extraexp As Decimal
            Get
                Return _ExtraExp
            End Get
            Set(ByVal value As Decimal)
                _ExtraExp = value
            End Set
        End Property

        Public Property Watersewer As Decimal
            Get
                Return _WaterSewer
            End Get
            Set(ByVal value As Decimal)
                _WaterSewer = value
            End Set
        End Property

        Public Property Propcomments As String
            Get
                Return _PropComments
            End Get
            Set(ByVal value As String)
                _PropComments = value
            End Set
        End Property

        Public Property Genliability As Decimal
            Get
                Return _GenLiab
            End Get
            Set(ByVal value As Decimal)
                _GenLiab = value
            End Set
        End Property

        Public Property Peroccur As Decimal
            Get
                Return _PerOccur
            End Get
            Set(ByVal value As Decimal)
                _PerOccur = value
            End Set
        End Property

        Public Property Medpay As Decimal
            Get
                Return _MedPay
            End Get
            Set(ByVal value As Decimal)
                _MedPay = value
            End Set
        End Property

        Public Property Pastoral As Decimal
            Get
                Return _PastoralCoun
            End Get
            Set(ByVal value As Decimal)
                _PastoralCoun = value
            End Set
        End Property

        Public Property Sexualmiscon As Decimal
            Get
                Return _SexMisconduct
            End Get
            Set(ByVal value As Decimal)
                _SexMisconduct = value
            End Set
        End Property

        Public Property Directors As Decimal
            Get
                Return _DirectOffice
            End Get
            Set(ByVal value As Decimal)
                _DirectOffice = value
            End Set
        End Property

        Public Property Hired As Decimal
            Get
                Return _Hired
            End Get
            Set(ByVal value As Decimal)
                _Hired = value
            End Set
        End Property

        Public Property Empbenefits As Decimal
            Get
                Return _EmpBenefits
            End Get
            Set(ByVal value As Decimal)
                _EmpBenefits = value
            End Set
        End Property

        Public Property Emppratice As Decimal
            Get
                Return _EmpPratice
            End Get
            Set(ByVal value As Decimal)
                _EmpPratice = value
            End Set
        End Property

        Public Property Misclegaldefense As String
            Get
                Return _Misc
            End Get
            Set(ByVal value As String)
                _Misc = value
            End Set
        End Property

        Public Property Violentacts As String
            Get
                Return _ViolentActs
            End Get
            Set(ByVal value As String)
                _ViolentActs = value
            End Set
        End Property

        Public Property Teacher As Decimal
            Get
                Return _Teacher
            End Get
            Set(ByVal value As Decimal)
                _Teacher = value
            End Set
        End Property

        Public Property Corppunish As Decimal
            Get
                Return _CorpPunish
            End Get
            Set(ByVal value As Decimal)
                _CorpPunish = value
            End Set
        End Property

        Public Property Lostwages As Decimal
            Get
                Return _LostWages
            End Get
            Set(ByVal value As Decimal)
                _LostWages = value
            End Set
        End Property

        Public Property Propowned As String
            Get
                Return _PropOwned
            End Get
            Set(ByVal value As String)
                _PropOwned = value
            End Set
        End Property

        Public Property Whoisowner As String
            Get
                Return _WhoIsOwner
            End Get
            Set(ByVal value As String)
                _WhoIsOwner = value
            End Set
        End Property

        Public Property Daycare As String
            Get
                Return _Daycare
            End Get
            Set(ByVal value As String)
                _Daycare = value
            End Set
        End Property

        Public Property Numofchild As String
            Get
                Return _NumOfChild
            End Get
            Set(ByVal value As String)
                _NumOfChild = value
            End Set
        End Property

        Public Property Bgchecks As String
            Get
                Return _BgChecks
            End Get
            Set(ByVal value As String)
                _BgChecks = value
            End Set
        End Property

        Public Property Playground As String
            Get
                Return _Playground
            End Get
            Set(ByVal value As String)
                _Playground = value
            End Set
        End Property

        Public Property Playfence As String
            Get
                Return _PlayFence
            End Get
            Set(ByVal value As String)
                _PlayFence = value
            End Set
        End Property

        Public Property Cemetery As String
            Get
                Return _Cemetery
            End Get
            Set(ByVal value As String)
                _Cemetery = value
            End Set
        End Property

        Public Property Cemfenced As String
            Get
                Return _CemFenced
            End Get
            Set(ByVal value As String)
                _CemFenced = value
            End Set
        End Property

        Public Property Mainproperty As String
            Get
                Return _MainProperty
            End Get
            Set(ByVal value As String)
                _MainProperty = value
            End Set
        End Property

        Public Property Cemeteryaddress As String
            Get
                Return _CemeteryAddress
            End Get
            Set(ByVal value As String)
                _CemeteryAddress = value
            End Set
        End Property

        Public Property Ballfield As String
            Get
                Return _Ballfield
            End Get
            Set(ByVal value As String)
                _Ballfield = value
            End Set
        End Property

        Public Property Ballfenced As String
            Get
                Return _Ballfenced
            End Get
            Set(ByVal value As String)
                _Ballfenced = value
            End Set
        End Property

        Public Property Locchurchprop As String
            Get
                Return _LocChurProp
            End Get
            Set(ByVal value As String)
                _LocChurProp = value
            End Set
        End Property

        Public Property Expchurchcomments As String
            Get
                Return _ExpChurchComments
            End Get
            Set(ByVal value As String)
                _ExpChurchComments = value
            End Set
        End Property

        Public Property Averageatten As String
            Get
                Return _AverageAtten
            End Get
            Set(ByVal value As String)
                _AverageAtten = value
            End Set
        End Property

        Public Property Fiveyearloss As String
            Get
                Return _FiveYearLoss
            End Get
            Set(ByVal value As String)
                _FiveYearLoss = value
            End Set
        End Property

        Public Property Date1 As Date
            Get
                Return _Date1
            End Get
            Set(ByVal value As Date)
                _Date1 = value
            End Set
        End Property

        Public Property Descr1 As String
            Get
                Return _Descr1
            End Get
            Set(ByVal value As String)
                _Descr1 = value
            End Set
        End Property

        Public Property Amount1 As Decimal
            Get
                Return _Amount1
            End Get
            Set(ByVal value As Decimal)
                _Amount1 = value
            End Set
        End Property

        Public Property Date2 As Date
            Get
                Return _Date2
            End Get
            Set(ByVal value As Date)
                _Date2 = value
            End Set
        End Property

        Public Property Descr2 As String
            Get
                Return _Descr2
            End Get
            Set(ByVal value As String)
                _Descr2 = value
            End Set
        End Property

        Public Property Amount2 As Decimal
            Get
                Return _Amount2
            End Get
            Set(ByVal value As Decimal)
                _Amount2 = value
            End Set
        End Property

        Public Property Date3 As Date
            Get
                Return _Date3
            End Get
            Set(ByVal value As Date)
                _Date3 = value
            End Set
        End Property

        Public Property Descr3 As String
            Get
                Return _Descr3
            End Get
            Set(ByVal value As String)
                _Descr3 = value
            End Set
        End Property

        Public Property Amount3 As Decimal
            Get
                Return _Amount3
            End Get
            Set(ByVal value As Decimal)
                _Amount3 = value
            End Set
        End Property

        Public Property Date4 As Date
            Get
                Return _Date4
            End Get
            Set(ByVal value As Date)
                _Date4 = value
            End Set
        End Property

        Public Property Descr4 As String
            Get
                Return _Descr4
            End Get
            Set(ByVal value As String)
                _Descr4 = value
            End Set
        End Property

        Public Property Amount4 As Decimal
            Get
                Return _Amount4
            End Get
            Set(ByVal value As Decimal)
                _Amount4 = value
            End Set
        End Property

        Public Property Date5 As Date
            Get
                Return _Date5
            End Get
            Set(ByVal value As Date)
                _Date5 = value
            End Set
        End Property

        Public Property Descr5 As String
            Get
                Return _Descr5
            End Get
            Set(ByVal value As String)
                _Descr5 = value
            End Set
        End Property

        Public Property Amount5 As Decimal
            Get
                Return _Amount5
            End Get
            Set(ByVal value As Decimal)
                _Amount5 = value
            End Set
        End Property

        Public Property Owevehicle As String
            Get
                Return _OweVehicle
            End Get
            Set(ByVal value As String)
                _OweVehicle = value
            End Set
        End Property

        Public Property Workcomp As String
            Get
                Return _WorkComp
            End Get
            Set(ByVal value As String)
                _WorkComp = value
            End Set
        End Property

        Public Property Umbrella As String
            Get
                Return _Umbrella
            End Get
            Set(ByVal value As String)
                _Umbrella = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Submittdate As Date
            Get
                Return _SubmitDate
            End Get
            Set(ByVal value As Date)
                _SubmitDate = value
            End Set
        End Property

    End Class


    Public Class SmpPhysicalLocation

        Private _LocNum As Integer
        Private _AgentNum As String
        Private _ReqNum As Integer
        Private _LocAddress As String
        Private _LocCity As String
        Private _LocState As String
        Private _LocZip As String
        Private _LocCounty As String
        Private _Unit As String
        Private _Status As String
        Private _Today As Date

        Public Property Locnum As Integer
            Get
                Return _LocNum
            End Get
            Set(ByVal value As Integer)
                _LocNum = value
            End Set
        End Property

        Public Property Agentnum As String
            Get
                Return _AgentNum
            End Get
            Set(ByVal value As String)
                _AgentNum = value
            End Set
        End Property

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Locaddress As String
            Get
                Return _LocAddress
            End Get
            Set(ByVal value As String)
                _LocAddress = value
            End Set
        End Property

        Public Property Loccity As String
            Get
                Return _LocCity
            End Get
            Set(ByVal value As String)
                _LocCity = value
            End Set
        End Property

        Public Property Locstate As String
            Get
                Return _LocState
            End Get
            Set(ByVal value As String)
                _LocState = value
            End Set
        End Property

        Public Property Loczip As String
            Get
                Return _LocZip
            End Get
            Set(ByVal value As String)
                _LocZip = value
            End Set
        End Property

        Public Property Loccounty As String
            Get
                Return _LocCounty
            End Get
            Set(ByVal value As String)
                _LocCounty = value
            End Set
        End Property

        Public Property Unit As String
            Get
                Return _Unit
            End Get
            Set(ByVal value As String)
                _Unit = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class SmpBuildingInformation

        Private _BuildNum As Integer
        Private _AgentNum As String
        Private _ReqNum As Integer
        Private _LocNum As Integer
        Private _BuildOccupy As String
        Private _BuildValue As Decimal
        Private _ContentValue As Decimal
        Private _ExtConstr As String
        Private _IntConstr As String
        Private _SqFeet As String
        Private _FireClass As String
        Private _FireDistrict As String
        Private _Unit As String
        Private _Status As String
        Private _Today As Date

        Public Property Buildnumber As Integer
            Get
                Return _BuildNum
            End Get
            Set(ByVal value As Integer)
                _BuildNum = value
            End Set
        End Property

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Agentnum As String
            Get
                Return _AgentNum
            End Get
            Set(ByVal value As String)
                _AgentNum = value
            End Set
        End Property

        Public Property Locnum As Integer
            Get
                Return _LocNum
            End Get
            Set(ByVal value As Integer)
                _LocNum = value
            End Set
        End Property

        Public Property BuildOccupancy As String
            Get
                Return _BuildOccupy
            End Get
            Set(ByVal value As String)
                _BuildOccupy = value
            End Set
        End Property

        Public Property Buildvalue As Decimal
            Get
                Return _BuildValue
            End Get
            Set(ByVal value As Decimal)
                _BuildValue = value
            End Set
        End Property

        Public Property Contentvalue As Decimal
            Get
                Return _ContentValue
            End Get
            Set(ByVal value As Decimal)
                _ContentValue = value
            End Set
        End Property

        Public Property Extconstr As String
            Get
                Return _ExtConstr
            End Get
            Set(ByVal value As String)
                _ExtConstr = value
            End Set
        End Property

        Public Property Intconstr As String
            Get
                Return _IntConstr
            End Get
            Set(ByVal value As String)
                _IntConstr = value
            End Set
        End Property

        Public Property Sqfeet As String
            Get
                Return _SqFeet
            End Get
            Set(ByVal value As String)
                _SqFeet = value
            End Set
        End Property

        Public Property Fireclass As String
            Get
                Return _FireClass
            End Get
            Set(ByVal value As String)
                _FireClass = value
            End Set
        End Property

        Public Property Firedistrict As String
            Get
                Return _FireDistrict
            End Get
            Set(ByVal value As String)
                _FireDistrict = value
            End Set
        End Property

        Public Property Unit As String
            Get
                Return _Unit
            End Get
            Set(ByVal value As String)
                _Unit = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class SmpPastoralCounseling
        Private _ReqNum As Integer
        Private _NumOfMembers As Integer
        Private _ExpCounseling As String
        Private _CounselingFee As String
        Private _CounselingRooms As String
        Private _Allegations As String
        Private _ExpAllegations As String
        Private _Status As String
        Private _Today As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Members As Integer
            Get
                Return _NumOfMembers
            End Get
            Set(ByVal value As Integer)
                _NumOfMembers = value
            End Set
        End Property

        Public Property Councomments As String
            Get
                Return _ExpCounseling
            End Get
            Set(ByVal value As String)
                _ExpCounseling = value
            End Set
        End Property

        Public Property Fee As String
            Get
                Return _CounselingFee
            End Get
            Set(ByVal value As String)
                _CounselingFee = value
            End Set
        End Property

        Public Property Rooms As String
            Get
                Return _CounselingRooms
            End Get
            Set(ByVal value As String)
                _CounselingRooms = value
            End Set
        End Property

        Public Property Allegations As String
            Get
                Return _Allegations
            End Get
            Set(ByVal value As String)
                _Allegations = value
            End Set
        End Property

        Public Property Allegcomments As String
            Get
                Return _ExpAllegations
            End Get
            Set(ByVal value As String)
                _ExpAllegations = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class SmpSexualMisconduct
        Private _ReqNum As Integer
        Private _MisconPolicy As String
        Private _BgCheck As String
        Private _AllBgCheck As String
        Private _Wait As String
        Private _Adult As String
        Private _Install As String
        Private _Charges As String
        Private _ExpCharges As String
        Private _Status As String
        Private _Today As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Misconpolicy As String
            Get
                Return _MisconPolicy
            End Get
            Set(ByVal value As String)
                _MisconPolicy = value
            End Set
        End Property

        Public Property Bgcheck As String
            Get
                Return _BgCheck
            End Get
            Set(ByVal value As String)
                _BgCheck = value
            End Set
        End Property

        Public Property Allbgcheck As String
            Get
                Return _AllBgCheck
            End Get
            Set(ByVal value As String)
                _AllBgCheck = value
            End Set
        End Property

        Public Property Sixmonthwait As String
            Get
                Return _Wait
            End Get
            Set(ByVal value As String)
                _Wait = value
            End Set
        End Property

        Public Property Reqadult As String
            Get
                Return _Adult
            End Get
            Set(ByVal value As String)
                _Adult = value
            End Set
        End Property

        Public Property Installedwin As String
            Get
                Return _Install
            End Get
            Set(ByVal value As String)
                _Install = value
            End Set
        End Property

        Public Property Misconcharges As String
            Get
                Return _Charges
            End Get
            Set(ByVal value As String)
                _Charges = value
            End Set
        End Property

        Public Property Expmisconcharges As String
            Get
                Return _ExpCharges
            End Get
            Set(ByVal value As String)
                _ExpCharges = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class SmpSupplementalCoverage
        Private _ReqNum As Integer
        Private _EstDirectors As String
        Private _RotateDirectors As String
        Private _PastLosses As String
        Private _ExpLosses As String
        Private _Status As String
        Private _Today As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Estdirectors As String
            Get
                Return _EstDirectors
            End Get
            Set(ByVal value As String)
                _EstDirectors = value
            End Set
        End Property

        Public Property Rotatedirectors As String
            Get
                Return _RotateDirectors
            End Get
            Set(ByVal value As String)
                _RotateDirectors = value
            End Set
        End Property

        Public Property Pastlosses As String
            Get
                Return _PastLosses
            End Get
            Set(ByVal value As String)
                _PastLosses = value
            End Set
        End Property

        Public Property Explosses As String
            Get
                Return _ExpLosses
            End Get
            Set(ByVal value As String)
                _ExpLosses = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class SmpEmploymentPractices
        Private _ReqNum As Integer
        Private _NumOfEmp As String
        Private _EmpHandbook As String
        Private _DistribToAll As String
        Private _WrittenStatement As String
        Private _FormalApp As String
        Private _AnnualReview As String
        Private _MaintainRecords As String
        Private _DrugTest As String
        Private _ExpDrugTest As String
        Private _NumTerminated As String
        Private _PraticeClaims As String
        Private _ExpPraticeClaims As String
        Private _RiseToClaim As String
        Private _ExpRiseToClaim As String
        Private _PriorCoverage As String
        Private _ExpPriorCoverage As String
        Private _Status As String
        Private _Today As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Numofemp As String
            Get
                Return _NumOfEmp
            End Get
            Set(ByVal value As String)
                _NumOfEmp = value
            End Set
        End Property

        Public Property Emphandbook As String
            Get
                Return _EmpHandbook
            End Get
            Set(ByVal value As String)
                _EmpHandbook = value
            End Set
        End Property

        Public Property Distribtoall As String
            Get
                Return _DistribToAll
            End Get
            Set(ByVal value As String)
                _DistribToAll = value
            End Set
        End Property

        Public Property Writtenstatement As String
            Get
                Return _WrittenStatement
            End Get
            Set(ByVal value As String)
                _WrittenStatement = value
            End Set
        End Property

        Public Property Formalapp As String
            Get
                Return _FormalApp
            End Get
            Set(ByVal value As String)
                _FormalApp = value
            End Set
        End Property

        Public Property Annualreview As String
            Get
                Return _AnnualReview
            End Get
            Set(ByVal value As String)
                _AnnualReview = value
            End Set
        End Property

        Public Property Maintainrecords As String
            Get
                Return _MaintainRecords
            End Get
            Set(ByVal value As String)
                _MaintainRecords = value
            End Set
        End Property

        Public Property Drugtest As String
            Get
                Return _DrugTest
            End Get
            Set(ByVal value As String)
                _DrugTest = value
            End Set
        End Property

        Public Property Expdrugtest As String
            Get
                Return _ExpDrugTest
            End Get
            Set(ByVal value As String)
                _ExpDrugTest = value
            End Set
        End Property

        Public Property Numterminated As String
            Get
                Return _NumTerminated
            End Get
            Set(ByVal value As String)
                _NumTerminated = value
            End Set
        End Property

        Public Property Praticeclaims As String
            Get
                Return _PraticeClaims
            End Get
            Set(ByVal value As String)
                _PraticeClaims = value
            End Set
        End Property

        Public Property Exppraticesclaims As String
            Get
                Return _ExpPraticeClaims
            End Get
            Set(ByVal value As String)
                _ExpPraticeClaims = value
            End Set
        End Property

        Public Property Risetoclaim As String
            Get
                Return _RiseToClaim
            End Get
            Set(ByVal value As String)
                _RiseToClaim = value
            End Set
        End Property

        Public Property Exprisetoclaim As String
            Get
                Return _ExpRiseToClaim
            End Get
            Set(ByVal value As String)
                _ExpRiseToClaim = value
            End Set
        End Property

        Public Property Priorcoverage As String
            Get
                Return _PriorCoverage
            End Get
            Set(ByVal value As String)
                _PriorCoverage = value
            End Set
        End Property

        Public Property Exppriorcoverage As String
            Get
                Return _ExpPriorCoverage
            End Get
            Set(ByVal value As String)
                _ExpPriorCoverage = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class SmpTeachersLiability
        Private _ReqNum As Integer
        Private _GradesStart As String
        Private _GradesEnd As String
        Private _MaxEnrollment As String
        Private _AveNumEnrolled As String
        Private _DateEstablished As Date
        Private _WithDegreeFull As Integer
        Private _WithDegreePart As Integer
        Private _WithDegreeVol As Integer
        Private _WithoutDegreeFull As Integer
        Private _WithoutDegreePart As Integer
        Private _WithoutDegreeVol As Integer
        Private _TeacherAidFull As Integer
        Private _TeacherAidPart As Integer
        Private _TeacherAidVol As Integer
        Private _CounselorsPart As Integer
        Private _CounselorsFull As Integer
        Private _CounselorsVol As Integer
        Private _NursesFull As Integer
        Private _NursesPart As Integer
        Private _NursesVol As Integer
        Private _OtherAdminFull As Integer
        Private _OtherAdminPart As Integer
        Private _OtherAdminVol As Integer
        Private _TeachersPerform As String
        Private _ExpCriteria As String
        Private _EvaluteStudents As String
        Private _ResultsShared As String
        Private _ImprovePerform As String
        Private _Suspension As String
        Private _Dismissal As String
        Private _SexHarass As String
        Private _StudentAggres As String
        Private _Promotion As String
        Private _Acceptance As String
        Private _DrugTesting As String
        Private _Weapons As String
        Private _WrittenPolicy As String
        Private _PriorEnrollment As String
        Private _AgainstSchool As String
        Private _ExpClaim As String
        Private _Status As String
        Private _Today As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Gradesstart As String
            Get
                Return _GradesStart
            End Get
            Set(ByVal value As String)
                _GradesStart = value
            End Set
        End Property

        Public Property Gradesend As String
            Get
                Return _GradesEnd
            End Get
            Set(ByVal value As String)
                _GradesEnd = value
            End Set
        End Property

        Public Property Maxenrollment As String
            Get
                Return _MaxEnrollment
            End Get
            Set(ByVal value As String)
                _MaxEnrollment = value
            End Set
        End Property

        Public Property Avenumenrolled As String
            Get
                Return _AveNumEnrolled
            End Get
            Set(ByVal value As String)
                _AveNumEnrolled = value
            End Set
        End Property

        Public Property Dateestablished As String
            Get
                Return _DateEstablished
            End Get
            Set(ByVal value As String)
                _DateEstablished = value
            End Set
        End Property

        Public Property Withdegreefull As Integer
            Get
                Return _WithDegreeFull
            End Get
            Set(ByVal value As Integer)
                _WithDegreeFull = value
            End Set
        End Property

        Public Property Withdegreepart As Integer
            Get
                Return _WithDegreePart
            End Get
            Set(ByVal value As Integer)
                _WithDegreePart = value
            End Set
        End Property

        Public Property Withdegreevol As Integer
            Get
                Return _WithDegreeVol
            End Get
            Set(ByVal value As Integer)
                _WithDegreeVol = value
            End Set
        End Property

        Public Property Withoutdegreefull As Integer
            Get
                Return _WithoutDegreeFull
            End Get
            Set(ByVal value As Integer)
                _WithoutDegreeFull = value
            End Set
        End Property

        Public Property Withoutdegreepart As Integer
            Get
                Return _WithoutDegreePart
            End Get
            Set(ByVal value As Integer)
                _WithoutDegreePart = value
            End Set
        End Property

        Public Property Withoutdegreevol As Integer
            Get
                Return _WithoutDegreeVol
            End Get
            Set(ByVal value As Integer)
                _WithoutDegreeVol = value
            End Set
        End Property

        Public Property Teacheraidfull As Integer
            Get
                Return _TeacherAidFull
            End Get
            Set(ByVal value As Integer)
                _TeacherAidFull = value
            End Set
        End Property

        Public Property Teacheraidpart As Integer
            Get
                Return _TeacherAidPart
            End Get
            Set(ByVal value As Integer)
                _TeacherAidPart = value
            End Set
        End Property

        Public Property Teacheraidvol As Integer
            Get
                Return _TeacherAidVol
            End Get
            Set(ByVal value As Integer)
                _TeacherAidVol = value
            End Set
        End Property

        Public Property Counselorsfull As Integer
            Get
                Return _CounselorsFull
            End Get
            Set(ByVal value As Integer)
                _CounselorsFull = value
            End Set
        End Property

        Public Property Counselorspart As Integer
            Get
                Return _CounselorsPart
            End Get
            Set(ByVal value As Integer)
                _CounselorsPart = value
            End Set
        End Property

        Public Property Counselorsvol As Integer
            Get
                Return _CounselorsVol
            End Get
            Set(ByVal value As Integer)
                _CounselorsVol = value
            End Set
        End Property

        Public Property Nursesfull As Integer
            Get
                Return _NursesFull
            End Get
            Set(ByVal value As Integer)
                _NursesFull = value
            End Set
        End Property

        Public Property Nursespart As Integer
            Get
                Return _NursesPart
            End Get
            Set(ByVal value As Integer)
                _NursesPart = value
            End Set
        End Property

        Public Property Nursesvol As Integer
            Get
                Return _NursesVol
            End Get
            Set(ByVal value As Integer)
                _NursesVol = value
            End Set
        End Property

        Public Property Otheradminfull As Integer
            Get
                Return _OtherAdminFull
            End Get
            Set(ByVal value As Integer)
                _OtherAdminFull = value
            End Set
        End Property

        Public Property Otheradminpart As Integer
            Get
                Return _OtherAdminPart
            End Get
            Set(ByVal value As Integer)
                _OtherAdminPart = value
            End Set
        End Property

        Public Property Otheradminvol As Integer
            Get
                Return _OtherAdminVol
            End Get
            Set(ByVal value As Integer)
                _OtherAdminVol = value
            End Set
        End Property

        Public Property Teacersperform As String
            Get
                Return _TeachersPerform
            End Get
            Set(ByVal value As String)
                _TeachersPerform = value
            End Set
        End Property

        Public Property Expcriteria As String
            Get
                Return _ExpCriteria
            End Get
            Set(ByVal value As String)
                _ExpCriteria = value
            End Set
        End Property

        Public Property Evalutestudents As String
            Get
                Return _EvaluteStudents
            End Get
            Set(ByVal value As String)
                _ExpCriteria = value
            End Set
        End Property

        Public Property Resultsshared As String
            Get
                Return _EvaluteStudents
            End Get
            Set(ByVal value As String)
                _EvaluteStudents = value
            End Set
        End Property

        Public Property Improveperform As String
            Get
                Return _ImprovePerform
            End Get
            Set(ByVal value As String)
                _ImprovePerform = value
            End Set
        End Property

        Public Property Suspension As String
            Get
                Return _Suspension
            End Get
            Set(ByVal value As String)
                _Suspension = value
            End Set
        End Property

        Public Property Dismissal As String
            Get
                Return _Dismissal
            End Get
            Set(ByVal value As String)
                _Dismissal = value
            End Set
        End Property

        Public Property Sexharass As String
            Get
                Return _SexHarass
            End Get
            Set(ByVal value As String)
                _SexHarass = value
            End Set
        End Property

        Public Property Studentaggress As String
            Get
                Return _StudentAggres
            End Get
            Set(ByVal value As String)
                _StudentAggres = value
            End Set
        End Property

        Public Property Promotion As String
            Get
                Return _Promotion
            End Get
            Set(ByVal value As String)
                _Promotion = value
            End Set
        End Property

        Public Property Acceptance As String
            Get
                Return _Acceptance
            End Get
            Set(ByVal value As String)
                _Acceptance = value
            End Set
        End Property

        Public Property Drugtesting As String
            Get
                Return _DrugTesting
            End Get
            Set(ByVal value As String)
                _DrugTesting = value
            End Set
        End Property

        Public Property Weapons As String
            Get
                Return _Weapons
            End Get
            Set(ByVal value As String)
                _Weapons = value
            End Set
        End Property

        Public Property Writtenpolicy As String
            Get
                Return _WrittenPolicy
            End Get
            Set(ByVal value As String)
                _WrittenPolicy = value
            End Set
        End Property

        Public Property Priorenrollment As String
            Get
                Return _PriorEnrollment
            End Get
            Set(ByVal value As String)
                _PriorEnrollment = value
            End Set
        End Property

        Public Property Againstschool As String
            Get
                Return _AgainstSchool
            End Get
            Set(ByVal value As String)
                _AgainstSchool = value
            End Set
        End Property

        Public Property Expclaim As String
            Get
                Return _ExpClaim
            End Get
            Set(ByVal value As String)
                _ExpClaim = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    'Public Class SmpEmploymentPractices
    'End Class

    Public Class UmApplicationDetails
        Private _ReqNum As Integer
        Private _LimitOfLiability As Decimal
        Private _Automobiles As String
        Private _WorkersComp As String
        Private _CurrentCarrier As String
        Private _CurrentUmPrem As String
        Private _ExpComments As String
        Private _PastLoss As String
        Private _PastLossDate1 As Date
        Private _PastLossDescr1 As String
        Private _PastLossAmount1 As Decimal
        Private _PastLossDate2 As Date
        Private _PastLossDescr2 As String
        Private _PastLossAmount2 As Decimal
        Private _PastLossDate3 As Date
        Private _PastLossDescr3 As String
        Private _PastLossAmount3 As Decimal
        Private _PastLossDate4 As Date
        Private _PastLossDescr4 As String
        Private _PastLossAmount4 As Decimal
        Private _PastLossDate5 As Date
        Private _PastLossDescr5 As String
        Private _PastLossAmount5 As Decimal
        Private _Status As String
        Private _Today As Date


        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Limitofliability As Decimal
            Get
                Return _LimitOfLiability
            End Get
            Set(ByVal value As Decimal)
                _LimitOfLiability = value
            End Set
        End Property

        Public Property Automobiles As String
            Get
                Return _Automobiles
            End Get
            Set(ByVal value As String)
                _Automobiles = value
            End Set
        End Property

        Public Property Workerscomp As String
            Get
                Return _WorkersComp
            End Get
            Set(ByVal value As String)
                _WorkersComp = value
            End Set
        End Property

        Public Property Currentcarrier As String
            Get
                Return _CurrentCarrier
            End Get
            Set(ByVal value As String)
                _CurrentCarrier = value
            End Set
        End Property

        Public Property Currentumprem As Decimal
            Get
                Return _CurrentUmPrem
            End Get
            Set(ByVal value As Decimal)
                _CurrentUmPrem = value
            End Set
        End Property

        Public Property Expcomments As String
            Get
                Return _ExpComments
            End Get
            Set(ByVal value As String)
                _ExpComments = value
            End Set
        End Property

        Public Property Pastloss As String
            Get
                Return _PastLoss
            End Get
            Set(ByVal value As String)
                _PastLoss = value
            End Set
        End Property

        Public Property Pastlossdate1 As Date
            Get
                Return _PastLossDate1
            End Get
            Set(ByVal value As Date)
                _PastLossDate1 = value
            End Set
        End Property

        Public Property Passlossdescr1 As String
            Get
                Return _PastLossDescr1
            End Get
            Set(ByVal value As String)
                _PastLossDescr1 = value
            End Set
        End Property

        Public Property Passlossamount1 As Decimal
            Get
                Return _PastLossAmount1
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount1 = value
            End Set
        End Property

        Public Property Pastlossdate2 As Date
            Get
                Return _PastLossDate2
            End Get
            Set(ByVal value As Date)
                _PastLossDate2 = value
            End Set
        End Property

        Public Property Passlossdescr2 As String
            Get
                Return _PastLossDescr2
            End Get
            Set(ByVal value As String)
                _PastLossDescr2 = value
            End Set
        End Property

        Public Property Passlossamount2 As Decimal
            Get
                Return _PastLossAmount2
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount2 = value
            End Set
        End Property

        Public Property Pastlossdate3 As Date
            Get
                Return _PastLossDate3
            End Get
            Set(ByVal value As Date)
                _PastLossDate3 = value
            End Set
        End Property

        Public Property Passlossdescr3 As String
            Get
                Return _PastLossDescr3
            End Get
            Set(ByVal value As String)
                _PastLossDescr3 = value
            End Set
        End Property

        Public Property Passlossamount3 As Decimal
            Get
                Return _PastLossAmount3
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount3 = value
            End Set
        End Property

        Public Property Pastlossdate4 As Date
            Get
                Return _PastLossDate4
            End Get
            Set(ByVal value As Date)
                _PastLossDate4 = value
            End Set
        End Property

        Public Property Passlossdescr4 As String
            Get
                Return _PastLossDescr4
            End Get
            Set(ByVal value As String)
                _PastLossDescr4 = value
            End Set
        End Property

        Public Property Passlossamount4 As Decimal
            Get
                Return _PastLossAmount4
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount4 = value
            End Set
        End Property

        Public Property Pastlossdate5 As Date
            Get
                Return _PastLossDate5
            End Get
            Set(ByVal value As Date)
                _PastLossDate5 = value
            End Set
        End Property

        Public Property Passlossdescr5 As String
            Get
                Return _PastLossDescr5
            End Get
            Set(ByVal value As String)
                _PastLossDescr5 = value
            End Set
        End Property

        Public Property Passlossamount5 As Decimal
            Get
                Return _PastLossAmount5
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount5 = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class WcApplicationDetails
        Private _ReqNum As Integer
        Private _FID As String
        Private _CurrentCarrier As String
        Private _CurrentWcPremium As Decimal
        Private _CodesClassNOE1 As String
        Private _CodesClassEAR1 As Decimal
        Private _CodesClassNOE2 As String
        Private _CodesClassEAR2 As Decimal
        Private _CodesClassNOE3 As String
        Private _CodesClassEAR3 As Decimal
        Private _CodesClassNOE4 As String
        Private _CodesClassEAR4 As Decimal
        Private _CodesClassNOE5 As String
        Private _CodesClassEAR5 As Decimal
        Private _CodesClassNOE6 As String
        Private _CodesClassEAR6 As Decimal
        Private _ExpCodesClass As String
        Private _Watercraft As String
        Private _Engaged As String
        Private _SubContractor As String
        Private _SafetyProgram As String
        Private _UnderSixteen As String
        Private _OverSixtyFive As String
        Private _Handicap As String
        Private _Travel As String
        Private _ReqPhysicals As String
        Private _Transportation As String
        Private _PriorCoverage As String
        Private _ExpComments As String
        Private _PastLoss As String
        Private _PastLossDate1 As Date
        Private _PastLossDescr1 As String
        Private _PastLossAmount1 As Decimal
        Private _PastLossDate2 As Date
        Private _PastLossDescr2 As String
        Private _PastLossAmount2 As Decimal
        Private _PastLossDate3 As Date
        Private _PastLossDescr3 As String
        Private _PastLossAmount3 As Decimal
        Private _PastLossDate4 As Date
        Private _PastLossDescr4 As String
        Private _PastLossAmount4 As Decimal
        Private _PastLossDate5 As Date
        Private _PastLossDescr5 As String
        Private _PastLossAmount5 As Decimal
        Private _Status As String
        Private _Today As Date


        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Fid As String
            Get
                Return _FID
            End Get
            Set(ByVal value As String)
                _FID = value
            End Set
        End Property

        Public Property Currentcarrier As String
            Get
                Return _CurrentCarrier
            End Get
            Set(ByVal value As String)
                _CurrentCarrier = value
            End Set
        End Property

        Public Property Currentwcpremium As Decimal
            Get
                Return _CurrentWcPremium
            End Get
            Set(ByVal value As Decimal)
                _CurrentWcPremium = value
            End Set
        End Property

        Public Property Codesclassnoe1 As String
            Get
                Return _CodesClassNOE1
            End Get
            Set(ByVal value As String)
                _CodesClassNOE1 = value
            End Set
        End Property

        Public Property Codesclassear1 As Decimal
            Get
                Return _CodesClassEAR1
            End Get
            Set(ByVal value As Decimal)
                _CodesClassEAR1 = value
            End Set
        End Property

        Public Property Codesclassnoe2 As String
            Get
                Return _CodesClassNOE2
            End Get
            Set(ByVal value As String)
                _CodesClassNOE2 = value
            End Set
        End Property

        Public Property Codesclassear2 As Decimal
            Get
                Return _CodesClassEAR2
            End Get
            Set(ByVal value As Decimal)
                _CodesClassEAR2 = value
            End Set
        End Property

        Public Property Codesclassnoe3 As String
            Get
                Return _CodesClassNOE3
            End Get
            Set(ByVal value As String)
                _CodesClassNOE3 = value
            End Set
        End Property

        Public Property Codesclassear3 As Decimal
            Get
                Return _CodesClassEAR3
            End Get
            Set(ByVal value As Decimal)
                _CodesClassEAR3 = value
            End Set
        End Property

        Public Property Codesclassnoe4 As String
            Get
                Return _CodesClassNOE4
            End Get
            Set(ByVal value As String)
                _CodesClassNOE4 = value
            End Set
        End Property

        Public Property Codesclassear4 As Decimal
            Get
                Return _CodesClassEAR4
            End Get
            Set(ByVal value As Decimal)
                _CodesClassEAR4 = value
            End Set
        End Property

        Public Property Codesclassnoe5 As String
            Get
                Return _CodesClassNOE5
            End Get
            Set(ByVal value As String)
                _CodesClassNOE5 = value
            End Set
        End Property

        Public Property Codesclassear5 As Decimal
            Get
                Return _CodesClassEAR5
            End Get
            Set(ByVal value As Decimal)
                _CodesClassEAR5 = value
            End Set
        End Property

        Public Property Codesclassnoe6 As String
            Get
                Return _CodesClassNOE6
            End Get
            Set(ByVal value As String)
                _CodesClassNOE6 = value
            End Set
        End Property

        Public Property Codesclassear6 As Decimal
            Get
                Return _CodesClassEAR6
            End Get
            Set(ByVal value As Decimal)
                _CodesClassEAR6 = value
            End Set
        End Property

        Public Property Expcodesclass As String
            Get
                Return _ExpCodesClass
            End Get
            Set(ByVal value As String)
                _ExpCodesClass = value
            End Set
        End Property

        Public Property Watercraft As String
            Get
                Return _Watercraft
            End Get
            Set(ByVal value As String)
                _Watercraft = value
            End Set
        End Property

        Public Property Engaged As String
            Get
                Return _Engaged
            End Get
            Set(ByVal value As String)
                _Engaged = value
            End Set
        End Property

        Public Property Subcontractor As String
            Get
                Return _SubContractor
            End Get
            Set(ByVal value As String)
                _SubContractor = value
            End Set
        End Property

        Public Property Safetyprogram As String
            Get
                Return _SafetyProgram
            End Get
            Set(ByVal value As String)
                _SafetyProgram = value
            End Set
        End Property

        Public Property Undersixteen As String
            Get
                Return _UnderSixteen
            End Get
            Set(ByVal value As String)
                _UnderSixteen = value
            End Set
        End Property

        Public Property Oversixtyfive As String
            Get
                Return _OverSixtyFive
            End Get
            Set(ByVal value As String)
                _OverSixtyFive = value
            End Set
        End Property

        Public Property Handicap As String
            Get
                Return _Handicap
            End Get
            Set(ByVal value As String)
                _Handicap = value
            End Set
        End Property

        Public Property Travel As String
            Get
                Return _Travel
            End Get
            Set(ByVal value As String)
                _Travel = value
            End Set
        End Property

        Public Property Reqphysicals As String
            Get
                Return _ReqPhysicals
            End Get
            Set(ByVal value As String)
                _ReqPhysicals = value
            End Set
        End Property

        Public Property Transportation As String
            Get
                Return _Transportation
            End Get
            Set(ByVal value As String)
                _Transportation = value
            End Set
        End Property

        Public Property Priorcoverage As String
            Get
                Return _PriorCoverage
            End Get
            Set(ByVal value As String)
                _PriorCoverage = value
            End Set
        End Property

        Public Property Expcomments As String
            Get
                Return _ExpComments
            End Get
            Set(ByVal value As String)
                _ExpComments = value
            End Set
        End Property

        Public Property Pastloss As String
            Get
                Return _PastLoss
            End Get
            Set(ByVal value As String)
                _PastLoss = value
            End Set
        End Property

        Public Property PastLossDate1 As Date
            Get
                Return _PastLossDate1
            End Get
            Set(ByVal value As Date)
                _PastLossDate1 = value
            End Set
        End Property

        Public Property PastLossDescr1 As String
            Get
                Return _PastLossDescr1
            End Get
            Set(ByVal value As String)
                _PastLossDescr1 = value
            End Set
        End Property

        Public Property PastLossAmount1 As Decimal
            Get
                Return _PastLossAmount1
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount1 = value
            End Set
        End Property

        Public Property PastLossDate2 As Date
            Get
                Return _PastLossDate2
            End Get
            Set(ByVal value As Date)
                _PastLossDate2 = value
            End Set
        End Property

        Public Property PastLossDescr2 As String
            Get
                Return _PastLossDescr2
            End Get
            Set(ByVal value As String)
                _PastLossDescr2 = value
            End Set
        End Property

        Public Property PastLossAmount2 As Decimal
            Get
                Return _PastLossAmount2
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount2 = value
            End Set
        End Property

        Public Property PastLossDate3 As Date
            Get
                Return _PastLossDate3
            End Get
            Set(ByVal value As Date)
                _PastLossDate3 = value
            End Set
        End Property

        Public Property PastLossDescr3 As String
            Get
                Return _PastLossDescr3
            End Get
            Set(ByVal value As String)
                _PastLossDescr3 = value
            End Set
        End Property

        Public Property PastLossAmount3 As Decimal
            Get
                Return _PastLossAmount3
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount3 = value
            End Set
        End Property

        Public Property PastLossDate4 As Date
            Get
                Return _PastLossDate4
            End Get
            Set(ByVal value As Date)
                _PastLossDate4 = value
            End Set
        End Property

        Public Property PastLossDescr4 As String
            Get
                Return _PastLossDescr4
            End Get
            Set(ByVal value As String)
                _PastLossDescr4 = value
            End Set
        End Property

        Public Property PastLossAmount4 As Decimal
            Get
                Return _PastLossAmount4
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount4 = value
            End Set
        End Property

        Public Property PastLossDate5 As Date
            Get
                Return _PastLossDate5
            End Get
            Set(ByVal value As Date)
                _PastLossDate5 = value
            End Set
        End Property

        Public Property PastLossDescr5 As String
            Get
                Return _PastLossDescr5
            End Get
            Set(ByVal value As String)
                _PastLossDescr5 = value
            End Set
        End Property

        Public Property PastLossAmount5 As Decimal
            Get
                Return _PastLossAmount5
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount5 = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class BaApplicationDetails
        Private _ReqNum As Integer
        Private _CurrentCarrier As String
        Private _CurrentBaPremium As Decimal
        Private _LiabilityLimit As Decimal
        Private _PhysicalDamage As String
        Private _DriversAge As String
        Private _ExpComments As String
        Private _PastLosses As String
        Private _PastLossDate1 As Date
        Private _PastLossDescr1 As String
        Private _PastLossAmount1 As Decimal
        Private _PastLossDate2 As Date
        Private _PastLossDescr2 As String
        Private _PastLossAmount2 As Decimal
        Private _PastLossDate3 As Date
        Private _PastLossDescr3 As String
        Private _PastLossAmount3 As Decimal
        Private _PastLossDate4 As Date
        Private _PastLossDescr4 As String
        Private _PastLossAmount4 As Decimal
        Private _PastLossDate5 As Date
        Private _PastLossDescr5 As String
        Private _PastLossAmount5 As Decimal
        Private _AppLevel As Integer
        Private _Status As String
        Private _Today As Date

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Currentcarrier As String
            Get
                Return _CurrentCarrier
            End Get
            Set(ByVal value As String)
                _CurrentCarrier = value
            End Set
        End Property

        Public Property Currentbaprem As String
            Get
                Return _CurrentBaPremium
            End Get
            Set(ByVal value As String)
                _CurrentBaPremium = value
            End Set
        End Property

        Public Property LiabilityLimit As Decimal
            Get
                Return _LiabilityLimit
            End Get
            Set(ByVal value As Decimal)
                _LiabilityLimit = value
            End Set
        End Property

        Public Property Physicaldamage As String
            Get
                Return _PhysicalDamage
            End Get
            Set(ByVal value As String)
                _PhysicalDamage = value
            End Set
        End Property

        Public Property Driversage As String
            Get
                Return _DriversAge
            End Get
            Set(ByVal value As String)
                _DriversAge = value
            End Set
        End Property

        Public Property Expcomments As String
            Get
                Return _ExpComments
            End Get
            Set(ByVal value As String)
                _ExpComments = value
            End Set
        End Property

        Public Property PastLosses As String
            Get
                Return _PastLosses
            End Get
            Set(ByVal value As String)
                _PastLosses = value
            End Set
        End Property

        Public Property PastLossDate1 As Date
            Get
                Return _PastLossDate1
            End Get
            Set(ByVal value As Date)
                _PastLossDate1 = value
            End Set
        End Property

        Public Property PastLossDescr1 As String
            Get
                Return _PastLossDescr1
            End Get
            Set(ByVal value As String)
                _PastLossDescr1 = value
            End Set
        End Property

        Public Property Pastlossamount1 As Decimal
            Get
                Return _PastLossAmount1
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount1 = value
            End Set
        End Property

        Public Property PastLossDate2 As Date
            Get
                Return _PastLossDate2
            End Get
            Set(ByVal value As Date)
                _PastLossDate2 = value
            End Set
        End Property

        Public Property PastLossDescr2 As String
            Get
                Return _PastLossDescr2
            End Get
            Set(ByVal value As String)
                _PastLossDescr2 = value
            End Set
        End Property

        Public Property Pastlossamount2 As Decimal
            Get
                Return _PastLossAmount2
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount2 = value
            End Set
        End Property

        Public Property PastLossDate3 As Date
            Get
                Return _PastLossDate3
            End Get
            Set(ByVal value As Date)
                _PastLossDate3 = value
            End Set
        End Property

        Public Property PastLossDescr3 As String
            Get
                Return _PastLossDescr3
            End Get
            Set(ByVal value As String)
                _PastLossDescr3 = value
            End Set
        End Property

        Public Property Pastlossamount3 As Decimal
            Get
                Return _PastLossAmount3
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount3 = value
            End Set
        End Property

        Public Property PastLossDate4 As Date
            Get
                Return _PastLossDate4
            End Get
            Set(ByVal value As Date)
                _PastLossDate4 = value
            End Set
        End Property

        Public Property PastLossDescr4 As String
            Get
                Return _PastLossDescr4
            End Get
            Set(ByVal value As String)
                _PastLossDescr4 = value
            End Set
        End Property

        Public Property Pastlossamount4 As Decimal
            Get
                Return _PastLossAmount4
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount4 = value
            End Set
        End Property

        Public Property PastLossDate5 As Date
            Get
                Return _PastLossDate5
            End Get
            Set(ByVal value As Date)
                _PastLossDate5 = value
            End Set
        End Property

        Public Property PastLossDescr5 As String
            Get
                Return _PastLossDescr5
            End Get
            Set(ByVal value As String)
                _PastLossDescr5 = value
            End Set
        End Property

        Public Property Pastlossamount5 As Decimal
            Get
                Return _PastLossAmount5
            End Get
            Set(ByVal value As Decimal)
                _PastLossAmount5 = value
            End Set
        End Property

        Public Property Applevel As Integer
            Get
                Return _AppLevel
            End Get
            Set(ByVal value As Integer)
                _AppLevel = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class

    Public Class BaChurchVehicle
        Private _VehicleId As Integer
        Private _AgentNum As String
        Private _ReqNum As Integer
        Private _Year As Integer
        Private _Make As String
        Private _Model As String
        Private _Vin As String
        Private _NumOfPassen As Integer
        Private _Cost As Decimal
        Private _County As String
        Private _Operation As String
        Private _Liability As String
        Private _CompDeduct As Decimal
        Private _CollisionDeduct As Decimal
        Private _Rental As Decimal
        Private _Towing As Decimal
        Private _Status As String
        Private _Today As Date

        Public Property Vehicleid As Integer
            Get
                Return _VehicleId
            End Get
            Set(ByVal value As Integer)
                _VehicleId = value
            End Set
        End Property

        Public Property Agentnum As String
            Get
                Return _AgentNum
            End Get
            Set(ByVal value As String)
                _AgentNum = value
            End Set
        End Property

        Public Property Reqnum As Integer
            Get
                Return _ReqNum
            End Get
            Set(ByVal value As Integer)
                _ReqNum = value
            End Set
        End Property

        Public Property Year As Integer
            Get
                Return _Year
            End Get
            Set(ByVal value As Integer)
                _Year = value
            End Set
        End Property

        Public Property Make As String
            Get
                Return _Make
            End Get
            Set(ByVal value As String)
                _Make = value
            End Set
        End Property

        Public Property Model As String
            Get
                Return _Model
            End Get
            Set(ByVal value As String)
                _Model = value
            End Set
        End Property

        Public Property VIN As String
            Get
                Return _Vin
            End Get
            Set(ByVal value As String)
                _Vin = value
            End Set
        End Property

        Public Property Numofpassen As Integer
            Get
                Return _NumOfPassen
            End Get
            Set(ByVal value As Integer)
                _NumOfPassen = value
            End Set
        End Property

        Public Property Costnew As Decimal
            Get
                Return _Cost
            End Get
            Set(ByVal value As Decimal)
                _Cost = value
            End Set
        End Property

        Public Property County As String
            Get
                Return _County
            End Get
            Set(ByVal value As String)
                _County = value
            End Set
        End Property

        Public Property Radiusofoperation As String
            Get
                Return _Operation
            End Get
            Set(ByVal value As String)
                _Operation = value
            End Set
        End Property

        Public Property Liability As String
            Get
                Return _Liability
            End Get
            Set(ByVal value As String)
                _Liability = value
            End Set
        End Property

        Public Property Compdeduct As Decimal
            Get
                Return _CompDeduct
            End Get
            Set(ByVal value As Decimal)
                _CompDeduct = value
            End Set
        End Property

        Public Property Collision As Decimal
            Get
                Return _CollisionDeduct
            End Get
            Set(ByVal value As Decimal)
                _CollisionDeduct = value
            End Set
        End Property

        Public Property Rental As Decimal
            Get
                Return _Rental
            End Get
            Set(ByVal value As Decimal)
                _Rental = value
            End Set
        End Property

        Public Property Towing As Decimal
            Get
                Return _Towing
            End Get
            Set(ByVal value As Decimal)
                _Towing = value
            End Set
        End Property

        Public Property Status As String
            Get
                Return _Status
            End Get
            Set(ByVal value As String)
                _Status = value
            End Set
        End Property

        Public Property Todaydate As Date
            Get
                Return _Today
            End Get
            Set(ByVal value As Date)
                _Today = value
            End Set
        End Property

    End Class
    '01/28/2013
    'Public Class FeatureLinks
    '    Private _LinkId As Integer
    '    'Private _Image As ma
    '    Private _Institution As String
    '    Private _Description As String
    '    Private _Link As String

    '    Public Property Linkid As Integer
    '        Get
    '            Return _LinkId
    '        End Get
    '        Set(value As Integer)
    '            _LinkId = value
    '        End Set
    '    End Property

    '    Public Property Institution As String
    '        Get
    '            Return _Institution
    '        End Get
    '        Set(value As String)
    '            _Institution = value
    '        End Set
    '    End Property

    '    Public Property Description As String
    '        Get
    '            Return _Description
    '        End Get
    '        Set(value As String)
    '            _Description = value
    '        End Set
    '    End Property

    '    Public Property Link As String
    '        Get
    '            Return _Link
    '        End Get
    '        Set(value As String)
    '            _Link = value
    '        End Set
    '    End Property

    'End Class

    'Public Class Building
    '    Private _id As Integer
    '    Private _address As String
    '    Private _city As String
    '    Private _state As String
    '    Private _zip As String
    '    Private _county As String
    '    Private _p1 As Integer
    '    Private _p2 As String

    '    'Sub New(ByVal p1 As Integer, ByVal p2 As String)
    '    '    ' TODO: Complete member initialization 
    '    '    _p1 = p1
    '    '    _p2 = p2
    '    'End Sub

    '    Public Property Id() As Integer
    '        Get
    '            Return _id
    '        End Get
    '        Set(ByVal value As Integer)
    '            _id = value
    '        End Set
    '    End Property

    '    Public Property Address() As String
    '        Get
    '            Return _address
    '        End Get
    '        Set(ByVal value As String)
    '            _address = value
    '        End Set
    '    End Property

    '    Public Property City() As String
    '        Get
    '            Return _city
    '        End Get
    '        Set(ByVal value As String)
    '            _city = value
    '        End Set
    '    End Property

    '    Public Property State() As String
    '        Get
    '            Return _state
    '        End Get
    '        Set(ByVal value As String)
    '            _state = value
    '        End Set
    '    End Property

    '    Public Property Zip() As String
    '        Get
    '            Return _zip
    '        End Get
    '        Set(ByVal value As String)
    '            _zip = value
    '        End Set
    '    End Property

    '    Public Property County() As String
    '        Get
    '            Return _county
    '        End Get
    '        Set(ByVal value As String)
    '            _county = value
    '        End Set
    '    End Property

    '    'Public Sub New(ByVal id As Integer, ByVal address As String, ByVal city As String, ByVal state As String, ByVal zip As Double, ByVal county As String)
    '    '    _id = id
    '    '    _address = address
    '    '    _city = city
    '    '    _state = state
    '    '    _zip = zip
    '    '    _county = county
    '    'End Sub

    'End Class


End Namespace