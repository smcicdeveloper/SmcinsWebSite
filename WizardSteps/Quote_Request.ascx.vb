Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Collections.Generic
Imports System.Collections
Imports smci.SetVaribles

Partial Class WizardSteps_Quote_Request
    Inherits System.Web.UI.UserControl



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim txtAgentNum As TextBox = CType(FormView1.FindControl("txtAgentNum"), TextBox)
        txtAgentNum.Text = CStr(Session("UserNameIs"))

        Dim txtAgency As TextBox = CType(FormView1.FindControl("txtAgency"), TextBox)
        Dim txtAgentName As TextBox = CType(FormView1.FindControl("txtAgentName"), TextBox)

        Dim txtAgentEmail As TextBox = CType(FormView1.FindControl("txtAgentEmail"), TextBox)
        txtAgentEmail.Focus()

        Dim rfvPrePolicyComments As RequiredFieldValidator = CType(FormView1.FindControl("rfvPrePolicyComments"), RequiredFieldValidator)
        rfvPrePolicyComments.Enabled = False

        'Dim rfvFTEmp As RequiredFieldValidator = CType(FormView6.FindControl("rfvFTEmp"), RequiredFieldValidator)
        'rfvFTEmp.Enabled = False

        'Dim rfvPTEmp As RequiredFieldValidator = CType(FormView6.FindControl("rfvPTEmp"), RequiredFieldValidator)
        'rfvPTEmp.Enabled = False

        'Dim rfvNumTeachers As RequiredFieldValidator = CType(FormView6.FindControl("rfvNumTeachers"), RequiredFieldValidator)
        'rfvNumTeachers.Enabled = False

        'Dim grdLocation As GridView = CType(FormView3.FindControl("grdLocation"), GridView)
        'grdLocation.DataBind()


        Dim txtFTEmp As TextBox = CType(FormView6.FindControl("txtFTEmp"), TextBox)
        'If txtFTEmp.Text = "0" Then
        '    rfvFTEmp.Enabled = True
        '    rfvFTEmp.ErrorMessage = "Value must be greater then zero"
        'End If

        'Step 7
        Dim txtPropOwner As TextBox = CType(FormView7.FindControl("txtPropOwner"), TextBox)
        txtPropOwner.Enabled = False
        txtPropOwner.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")

        Dim rfvPropOwner As RequiredFieldValidator = CType(FormView7.FindControl("rfvPropOwner"), RequiredFieldValidator)
        rfvPropOwner.Enabled = False

        Dim rfvSchoolKids As RequiredFieldValidator = CType(FormView7.FindControl("rfvSchoolKids"), RequiredFieldValidator)
        Dim rbSchoolYes As RadioButton = CType(FormView7.FindControl("rbSchoolYes"), RadioButton)
        Dim txtSchoolKids As TextBox = CType(FormView7.FindControl("txtSchoolKids"), TextBox)
        Dim rbSchoolNo As RadioButton = CType(FormView7.FindControl("rbSchoolNo"), RadioButton)

        rfvSchoolKids.Enabled = False

        If rbSchoolYes.Checked = True Then
            rfvSchoolKids.Enabled = True
        Else
            rfvSchoolKids.Enabled = False
            txtSchoolKids.Text = String.Empty
            txtSchoolKids.Enabled = False
            txtSchoolKids.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

        Dim txtCemeteryAddress As TextBox = CType(FormView7.FindControl("txtCemeteryAddress"), TextBox)
        Dim rfvCemeteryAddress As RequiredFieldValidator = CType(FormView7.FindControl("rfvCemeteryAddress"), RequiredFieldValidator)
        rfvCemeteryAddress.Enabled = False
        txtCemeteryAddress.Enabled = False
        txtCemeteryAddress.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")

        Dim rbLoss7No As RadioButton = CType(FormView7.FindControl("rbLoss7No"), RadioButton)
        Dim Panel1 As Panel = CType(FormView7.FindControl("Panel1"), Panel)

        If rbLoss7No.Checked = True Then
            Panel1.Enabled = False
        End If

        Dim rfvLossDate7a As RequiredFieldValidator = CType(FormView7.FindControl("rfvLossDate7a"), RequiredFieldValidator)
        rfvLossDate7a.Enabled = False
        Dim rfvLossDescr7a As RequiredFieldValidator = CType(FormView7.FindControl("rfvLossDescr7a"), RequiredFieldValidator)
        rfvLossDescr7a.Enabled = False
        Dim rfvLossAmt7a As RequiredFieldValidator = CType(FormView7.FindControl("rfvLossAmt7a"), RequiredFieldValidator)
        rfvLossAmt7a.Enabled = False

        'Step 8
        'Dim Panel2 As Panel = CType(FormView8.FindControl("Panel2"), Panel)
        'Panel2.Enabled = False
        'Dim rfvNumEmp As RequiredFieldValidator = CType(FormView8.FindControl("rfvNumEmp"), RequiredFieldValidator)
        'rfvNumEmp.Enabled = False
        'Dim rfvTraining As RequiredFieldValidator = CType(FormView8.FindControl("rfvTraining"), RequiredFieldValidator)
        'rfvTraining.Enabled = False
        'Dim txtNumEmp As TextBox = CType(FormView8.FindControl("txtNumEmp"), TextBox)
        'txtNumEmp.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        'Dim txtTraining As TextBox = CType(FormView8.FindControl("txtTraining"), TextBox)
        'txtTraining.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        'Dim txtExplain As TextBox = CType(FormView8.FindControl("txtExplain"), TextBox)
        'txtExplain.Enabled = False
        'txtExplain.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        'Dim rfvExplain As RequiredFieldValidator = CType(FormView8.FindControl("rfvExplain"), RequiredFieldValidator)
        'rfvExplain.Enabled = False

        'Step 9
        Dim txtExplainCharges As TextBox = CType(FormView9.FindControl("txtExplainCharges"), TextBox)
        txtExplainCharges.Enabled = False
        txtExplainCharges.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        Dim rfvExplainCharges As RequiredFieldValidator = CType(FormView9.FindControl("rfvExplainCharges"), RequiredFieldValidator)
        rfvExplainCharges.Enabled = False

        'Step 10
        Dim txtExplainLosses As TextBox = CType(FormView10.FindControl("txtExplainLosses"), TextBox)
        txtExplainLosses.Enabled = False
        txtExplainLosses.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        Dim rfvExpLoss As RequiredFieldValidator = CType(FormView10.FindControl("rfvExpLoss"), RequiredFieldValidator)
        rfvExpLoss.Enabled = False

        'Step 11
        Dim Panel3 As Panel = CType(FormView11.FindControl("Panel3"), Panel)
        Panel3.Enabled = False
        Dim rfvLossDate11a As RequiredFieldValidator = CType(FormView11.FindControl("rfvLossDate11a"), RequiredFieldValidator)
        Dim rfvLossDescr11a As RequiredFieldValidator = CType(FormView11.FindControl("rfvLossDescr11a"), RequiredFieldValidator)
        Dim rfvLossAmt11a As RequiredFieldValidator = CType(FormView11.FindControl("rfvLossAmt11a"), RequiredFieldValidator)
        rfvLossDate11a.Enabled = False
        rfvLossDescr11a.Enabled = False
        rfvLossAmt11a.Enabled = False

        'Step 14
        Dim Panel4 As Panel = CType(FormView14.FindControl("Panel4"), Panel)
        Panel4.Enabled = False
        Dim rfvLossDate14a As RequiredFieldValidator = CType(FormView14.FindControl("rfvLossDate14a"), RequiredFieldValidator)
        Dim rfvLossDescr14a As RequiredFieldValidator = CType(FormView14.FindControl("rfvLossDescr14a"), RequiredFieldValidator)
        Dim rfvLossAmt14a As RequiredFieldValidator = CType(FormView14.FindControl("rfvLossAmt14a"), RequiredFieldValidator)
        rfvLossDate14a.Enabled = False
        rfvLossDescr14a.Enabled = False
        rfvLossAmt14a.Enabled = False

        'Step 15
        Dim Panel5 As Panel = CType(FormView15.FindControl("Panel5"), Panel)
        Panel5.Enabled = False
        Dim rfvLossDate15a As RequiredFieldValidator = CType(FormView15.FindControl("rfvLossDate15a"), RequiredFieldValidator)
        Dim rfvLossDescr15a As RequiredFieldValidator = CType(FormView15.FindControl("rfvLossDescr15a"), RequiredFieldValidator)
        Dim rfvLossAmt15a As RequiredFieldValidator = CType(FormView15.FindControl("rfvLossAmt15a"), RequiredFieldValidator)
        rfvLossDate15a.Enabled = False
        rfvLossDescr15a.Enabled = False
        rfvLossAmt15a.Enabled = False

        'This method will automatically generate agency information on General Information form
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("SMCI").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmd1 As New SqlCommand("SELECT NAME_OF_AGENCY FROM AgencyBusinessInformation WHERE AGENT_NUMBER=@an", con)
        Dim cmd2 As New SqlCommand("SELECT FIRST_NAME + ' ' + LAST_NAME As FULL_NAME FROM AgencyProfileInformation WHERE AGENT_NUMBER=@an", con)
        cmd1.Parameters.AddWithValue("@an", txtAgentNum.Text)
        cmd2.Parameters.AddWithValue("@an", txtAgentNum.Text)

        Using con
            con.Open()
            Dim result1 As Object = cmd1.ExecuteScalar()
            Dim result2 As Object = cmd2.ExecuteScalar()
            If Not IsNothing(result1) Then
                txtAgency.Text = String.Format("{0:c}", result1)
            Else
                txtAgency.Text = "No Match!"
            End If

            If Not IsNothing(result2) Then
                txtAgentName.Text = String.Format("{0:c}", result2)
            Else
                txtAgentName.Text = "No Match!"
            End If
        End Using
    End Sub

    Public Class Building
        Private _id As Integer
        Public _address As String
        Public _city As String
        Public _state As String
        Public _zip As String
        Public _county As String
        Private _p1 As Integer
        Private _p2 As String

        Sub New()
            ' TODO: Complete member initialization 
        End Sub

        'Sub New()
        '    ' TODO: Complete member initialization 
        'End Sub

        'Sub New(ByVal p1 As Integer, ByVal p2 As String)
        '    ' TODO: Complete member initialization 
        '    _p1 = p1
        '    _p2 = p2
        'End Sub

        Public Property Id() As Integer
            Get
                Return _id
            End Get
            Set(ByVal value As Integer)
                _id = value
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

        Public Property County() As String
            Get
                Return _county
            End Get
            Set(ByVal value As String)
                _county = value
            End Set
        End Property

        'Public Sub New(ByVal address As String)
        '    _address = address
        'End Sub

        Public Sub New(ByVal id As Integer, ByVal address As String, ByVal city As String, ByVal state As String, ByVal zip As String, ByVal county As String)
            _id = id
            _address = address
            _city = city
            _state = state
            _zip = zip
            _county = county
        End Sub

    End Class

    Protected Sub lnkSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim txtAddress As TextBox = CType(FormView3.FindControl("txtAddress"), TextBox)
        Dim txtCity As TextBox = CType(FormView3.FindControl("txtCity"), TextBox)
        Dim ddlState As DropDownList = CType(FormView3.FindControl("ddlState"), DropDownList)
        Dim txtZip As TextBox = CType(FormView3.FindControl("txtZip"), TextBox)
        Dim txtCounty As TextBox = CType(FormView3.FindControl("txtCounty"), TextBox)
        Dim grdLocation As GridView = CType(FormView3.FindControl("grdLocation"), GridView)
        Dim dlstLocation As DataList = CType(FormView3.FindControl("dlstLocation"), DataList)
        'Dim ListView1 As ListView

        Dim AddBuilding As New List(Of Building)()
        'Dim b As New Building
        Dim x As Integer = grdLocation.Rows.Count

        'Dim building(4, 5) As String
        'If x = 0 Then
        '    building(0, 0) = 1
        '    building(0, 1) = txtAddress.Text
        '    building(0, 2) = txtCity.Text
        '    building(0, 3) = ddlState.SelectedValue
        '    building(0, 4) = txtZip.Text
        '    building(0, 5) = txtCounty.Text
        'ElseIf x = 1 Then
        '    building(1, 0) = 1
        '    building(1, 1) = txtAddress.Text
        '    building(1, 2) = txtCity.Text
        '    building(1, 3) = ddlState.SelectedValue
        '    building(1, 4) = txtZip.Text
        '    building(1, 5) = txtCounty.Text
        'End If

        'Dim buildingString As String = ""
        'For numberOfRows As Integer = 0 To building.GetLength(0) - 1
        '    For numberOfColumns As Integer = 0 To building.GetLength(1) - 1
        '        buildingString &= building(numberOfRows, numberOfColumns) & " "
        '    Next 'numberOfColumns
        '    buildingString.ToString()
        'Next 'numberOfRows
        'MsgBox(buildingString)

        'grdLocation.DataSource = buildingString
        'grdLocation.DataBind()

        'dlstLocation.DataSource = buildingString
        'dlstLocation.DataBind()

        'Dim bbuild(4) As String
        'bbuild(0) = (1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)

        'If x = 0 Then
        ' AddBuilding.Add(New Building(1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text))
        '    'grdLocation.DataSource = AddBuilding
        '    'grdLocation.DataBind()
        'ElseIf x = 1 Then
        '    AddBuilding.Add(New Building(2, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text))
        '    'grdLocation.DataSource = AddBuilding
        '    'grdLocation.DataBind()
        'End If

        'grdLocation.DataSource = AddBuilding
        'grdLocation.DataBind()
        'Dim Buildings As New ArrayList(4)
        'If x < 5 Then
        '    'Dim y As Integer = 0
        '    'Dim building1 As New Building(txtAddress.Text)
        '    ' Dim building(0) As buildings = {1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text}
        '    'Dim building1 As New Building(x + 1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        '    'Dim building2 As New Building(x + 1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        '    'Dim building3 As New Building(x + 1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        '    Buildings.Add(Buildings)
        '    'Dim b As Building = CType(Buildings(1), Building)
        '    'Buildings.Add(building2)
        '    'Buildings.Add(building3)
        '    For Each b As Building In Buildings
        '        'For i As Integer = 0 To Buildings.Count - 1
        '        grdLocation.DataSource = Buildings
        '        grdLocation.DataBind()
        '    Next
        'End If

        'Dim bbuilding() As String = New String(0) {1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text}

        'Dim buildings(4) As String
        'buildings(0) = (x, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)

        'Dim buildings() As String = (1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)

        'Dim Buildings As New ArrayList()
        'If x = 0 Then
        '    Dim building1() As New Building(1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        '    Buildings.Add(building1)
        '    grdLocation.DataSource = Buildings
        '    grdLocation.DataBind()
        'ElseIf x = 1 Then
        '    Dim building2 As New Building(2, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        '    Buildings.Add(building2)
        '    grdLocation.DataSource = Buildings
        '    grdLocation.DataBind()
        'ElseIf x = 2 Then
        '    Dim building3 As New Building(3, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        '    Buildings.Add(building3)
        '    grdLocation.DataSource = Buildings
        '    grdLocation.DataBind()
        'End If



        'For Each b As Building In Buildings
        '    grdLocation.DataSource = Buildings

        'Next

        'For i As Integer = 0 To Buildings.Count - 1
        '    grdLocation.DataSource = Buildings
        '    grdLocation.DataBind()
        'Next


        'Working but it will override each row
        'If x = 0 Then
        '    x = x + 1
        '    b.Id = x
        '    b.Address = txtAddress.Text
        '    b.City = txtCity.Text
        '    b.State = ddlState.SelectedValue
        '    b.Zip = txtZip.Text
        '    b.County = txtCounty.Text
        '    AddBuilding.Add(b)

        '    grdLocation.DataSource = AddBuilding
        '    grdLocation.DataBind()

        '    txtAddress.Text = String.Empty
        '    txtCity.Text = String.Empty
        '    txtZip.Text = String.Empty
        '    txtCounty.Text = String.Empty
        '    x = 0
        'ElseIf x = 1 Then
        '    x = x + 1
        '    b.Id = x
        '    b.Address = txtAddress.Text
        '    b.City = txtCity.Text
        '    b.State = ddlState.SelectedValue
        '    b.Zip = txtZip.Text
        '    b.County = txtCounty.Text
        '    AddBuilding.Add(b)

        '    grdLocation.DataSource = AddBuilding
        '    grdLocation.DataBind()

        '    txtAddress.Text = String.Empty
        '    txtCity.Text = String.Empty
        '    txtZip.Text = String.Empty
        '    txtCounty.Text = String.Empty
        'End If

        'x = grdLocation.Rows.Count
        'If x = 1 Then
        '    x = x + 1
        '    b.Id = x
        '    b.Address = txtAddress.Text
        '    b.City = txtCity.Text
        '    b.State = ddlState.SelectedValue
        '    b.Zip = txtZip.Text
        '    b.County = txtCounty.Text
        '    AddBuilding.Add(b)

        '    grdLocation.DataSource = AddBuilding
        '    grdLocation.DataBind()

        '    txtAddress.Text = String.Empty
        '    txtCity.Text = String.Empty
        '    txtZip.Text = String.Empty
        '    txtCounty.Text = String.Empty
        'End If

        'b = New Building
        'x = ++1


        'ReDim Preserve Buildings(4)

        ''Dim bbuilding As New List(Of String)
        ''bbuilding.Insert(0, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)
        'Dim zBuilding() As String
        'Dim buildings As New List(Of String)
        'If x = 0 Then
        '    zBuilding = {0, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text}
        '    For Each record As String In zBuilding
        '        buildings.Add(record)
        '    Next
        'ElseIf x = 6 Then
        '    zBuilding = {1, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text}
        '    For Each record As String In zBuilding
        '        buildings.Add(record)
        '    Next
        'End If

        'grdLocation.DataSource = buildings
        'grdLocation.DataBind()

        'Dim buildingList As New SortedList(Of String, String)
        'buildingList.Add(0, txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtCounty.Text)



        Dim Buildings As New List(Of Building)()
        Dim b As New Building
        If x = 0 Then
            b.Id = 1
            b.Address = txtAddress.Text
            b.City = txtCity.Text
            b.State = ddlState.SelectedValue
            b.Zip = txtZip.Text
            b.County = txtCounty.Text
            'Buildings.Add(b)
            'Dim w As String
            'w = Buildings.Item(b)
            'Buildings.Insert(0, b)
            'If Buildings.Contains(b) Then
            '    MsgBox("Duplicate element rejected")
        ElseIf x = 1 Then
            b = New Building
            b.Id = 2
            b.Address = txtAddress.Text
            b.City = txtCity.Text
            b.State = ddlState.SelectedValue
            b.Zip = txtZip.Text
            b.County = txtCounty.Text
            Buildings.Add(b)
            'Buildings.Insert(1, b)
        End If
        'b = New Building
        'x = x + 1
        'b.Id = x
        'b.Address = txtAddress.Text
        'b.City = txtCity.Text
        'b.State = ddlState.SelectedValue
        'b.Zip = txtZip.Text
        'b.County = txtCounty.Text
        'Buildings.Insert(1, b)
        'Buildings.Add(b)
        'For Each S As String In b
        '    Buildings.Add(b)
        'Next
        'End If

        'Dim Buildings As New List(Of Building)
        'Dim

        grdLocation.DataSource = Buildings
        grdLocation.DataBind()

    End Sub

    'Protected Sub Step1ClearButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim txtAgentEmail As TextBox = CType(FormView1.FindControl("txtAgentEmail"), TextBox)
    '    txtAgentEmail.Text = String.Empty
    '    Dim txtAgentEmail2 As TextBox = CType(FormView1.FindControl("txtAgentEmail2"), TextBox)
    '    txtAgentEmail2.Text = String.Empty
    '    Dim txtChName As TextBox = CType(FormView1.FindControl("txtChName"), TextBox)
    '    txtChName.Text = String.Empty
    '    Dim txtMailAddr As TextBox = CType(FormView1.FindControl("txtMailAddr"), TextBox)
    '    txtMailAddr.Text = String.Empty
    '    Dim txtMailCity As TextBox = CType(FormView1.FindControl("txtMailCity"), TextBox)
    '    txtMailCity.Text = String.Empty
    '    Dim txtMailState As TextBox = CType(FormView1.FindControl("txtMailState"), TextBox)
    '    txtMailState.Text = String.Empty
    '    Dim txtMailZip As TextBox = CType(FormView1.FindControl("txtMailZip"), TextBox)
    '    txtMailZip.Text = String.Empty
    '    Dim txtWebAddr As TextBox = CType(FormView1.FindControl("txtWebAddr"), TextBox)
    '    txtWebAddr.Text = String.Empty
    '    Dim chbCarrier As CheckBox = CType(FormView1.FindControl("chbCarrier"), CheckBox)
    '    chbCarrier.Checked = False
    '    Dim txtCarrier As TextBox = CType(FormView1.FindControl("txtCarrier"), TextBox)
    '    txtCarrier.Text = String.Empty
    '    Dim txtExDate As TextBox = CType(FormView1.FindControl("txtExDate"), TextBox)
    '    txtExDate.Text = String.Empty
    '    Dim txtPrem As TextBox = CType(FormView1.FindControl("txtPrem"), TextBox)
    '    txtPrem.Text = String.Empty
    '    Dim txtComments1 As TextBox = CType(FormView1.FindControl("txtComments1"), TextBox)
    '    txtComments1.Text = String.Empty
    '    Dim txtChContact As TextBox = CType(FormView1.FindControl("txtChContact"), TextBox)
    '    txtChContact.Text = String.Empty
    '    Dim txtPhone1 As TextBox = CType(FormView1.FindControl("txtPhone1"), TextBox)
    '    txtPhone1.Text = String.Empty
    '    Dim txtPhone2 As TextBox = CType(FormView1.FindControl("txtPhone2"), TextBox)
    '    txtPhone2.Text = String.Empty
    '    Dim txtMortgLp As TextBox = CType(FormView1.FindControl("txtMortgLp"), TextBox)
    '    txtMortgLp.Text = String.Empty
    'End Sub

    Protected Sub chbCarrier_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chbCarrier As CheckBox = CType(FormView1.FindControl("chbCarrier"), CheckBox)
        Dim txtExDate As TextBox = CType(FormView1.FindControl("txtExDate"), TextBox)
        Dim txtCarrier As TextBox = CType(FormView1.FindControl("txtCarrier"), TextBox)
        Dim rfvCarrier As RequiredFieldValidator = CType(FormView1.FindControl("rfvCarrier"), RequiredFieldValidator)
        Dim rfvExDate As RequiredFieldValidator = CType(FormView1.FindControl("rfvExDate"), RequiredFieldValidator)
        If chbCarrier.Checked = True Then
            txtCarrier.Enabled = False
            txtExDate.Enabled = False
            rfvExDate.Enabled = False
            rfvCarrier.Enabled = False
            txtCarrier.Text = String.Empty
            txtExDate.Text = String.Empty
            txtCarrier.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            txtExDate.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        Else
            txtCarrier.Enabled = True
            txtExDate.Enabled = True
            rfvExDate.Enabled = True
            rfvCarrier.Enabled = True
            txtCarrier.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            txtExDate.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

    End Sub

    Protected Sub chbNoCarrier_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chbNoCarrier As CheckBox = CType(FormView11.FindControl("chbNoCarrier"), CheckBox)
        Dim txtCurrCarrier As TextBox = CType(FormView11.FindControl("txtCurrCarrier"), TextBox)
        Dim rfvCurrCarrier As RequiredFieldValidator = CType(FormView11.FindControl("rfvCurrCarrier"), RequiredFieldValidator)
        If chbNoCarrier.Checked = True Then
            txtCurrCarrier.Enabled = False
            rfvCurrCarrier.Enabled = False
            txtCurrCarrier.Text = String.Empty
            txtCurrCarrier.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        Else
            txtCurrCarrier.Enabled = True
            rfvCurrCarrier.Enabled = True
            txtCurrCarrier.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

    End Sub

    Protected Sub rbPreviousPolicyYes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbPreviousPolicyYes As RadioButton = CType(FormView1.FindControl("rbPreviousPolicyYes"), RadioButton)
        Dim rfvPrePolicyComments As RequiredFieldValidator = CType(FormView1.FindControl("rfvPrePolicyComments"), RequiredFieldValidator)

        If rbPreviousPolicyYes.Checked = True Then
            rfvPrePolicyComments.Enabled = True
        End If
    End Sub

    Protected Sub ddEBLliab_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rfvFTEmp As RequiredFieldValidator = CType(FormView6.FindControl("rfvFTEmp"), RequiredFieldValidator)
        Dim ddEBLliab As DropDownList = CType(FormView6.FindControl("ddEBLliab"), DropDownList)
        Dim txtFTEmp As TextBox = CType(FormView6.FindControl("txtFTEmp"), TextBox)

        If ddEBLliab.SelectedValue = "0" Then
            rfvFTEmp.Enabled = False
            txtFTEmp.Text = String.Empty
        Else
            rfvFTEmp.Enabled = True
        End If
    End Sub

    'Protected Sub ddEPLliab_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim rfvPTEmp As RequiredFieldValidator = CType(FormView6.FindControl("rfvPTEmp"), RequiredFieldValidator)
    '    Dim ddEPLliab As DropDownList = CType(FormView6.FindControl("ddEPLliab"), DropDownList)
    '    Dim txtPTEmp As TextBox = CType(FormView6.FindControl("txtPTEmp"), TextBox)

    '    If ddEPLliab.SelectedValue = "0" Then
    '        rfvPTEmp.Enabled = False
    '        txtPTEmp.Text = String.Empty
    '    Else
    '        rfvPTEmp.Enabled = True
    '    End If
    'End Sub

    'Protected Sub ddTeachLiab_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim rfvNumTeachers As RequiredFieldValidator = CType(FormView6.FindControl("rfvNumTeachers"), RequiredFieldValidator)
    '    Dim ddTeachLiab As DropDownList = CType(FormView6.FindControl("ddTeachLiab"), DropDownList)
    '    Dim txtNumTeachers As TextBox = CType(FormView6.FindControl("txtNumTeachers"), TextBox)

    '    If ddTeachLiab.SelectedValue = "0" Then
    '        rfvNumTeachers.Enabled = False
    '        txtNumTeachers.Text = String.Empty
    '    Else
    '        rfvNumTeachers.Enabled = True
    '    End If
    'End Sub

    'Protected Sub txtFTEmp_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim txtFTEmp As TextBox = CType(FormView6.FindControl("txtFTEmp"), TextBox)
    '    Dim rfvFTEmp As RequiredFieldValidator = CType(FormView6.FindControl("rfvFTEmp"), RequiredFieldValidator)

    '    If txtFTEmp.Text = String.Empty Then
    '        rfvFTEmp.Enabled = True
    '    End If

    '    'If txtFTEmp.Text = "0" Then
    '    '    rfvFTEmp.ErrorMessage = "Value must be greater then zero"
    '    'End If

    'End Sub

    'Protected Sub txtPTEmp_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim txtPTEmp As TextBox = CType(FormView6.FindControl("txtPTEmp"), TextBox)
    '    Dim rfvPTEmp As RequiredFieldValidator = CType(FormView6.FindControl("rfvPTEmp"), RequiredFieldValidator)

    '    If txtPTEmp.Text = String.Empty Then
    '        rfvPTEmp.Enabled = True
    '    End If

    'End Sub

    'Protected Sub txtNumTeachers_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim txtNumTeachers As TextBox = CType(FormView6.FindControl("txtNumTeachers"), TextBox)
    '    Dim rfvNumTeachers As RequiredFieldValidator = CType(FormView6.FindControl("rfvNumTeachers"), RequiredFieldValidator)

    '    If txtNumTeachers.Text = String.Empty Then
    '        rfvNumTeachers.Enabled = True
    '    End If
    'End Sub

    Protected Sub rbPropYes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbPropYes As RadioButton = CType(FormView7.FindControl("rbPropYes"), RadioButton)
        Dim txtPropOwner As TextBox = CType(FormView7.FindControl("txtPropOwner"), TextBox)

        If rbPropYes.Checked = True Then
            txtPropOwner.Text = String.Empty
            txtPropOwner.Enabled = False
            txtPropOwner.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

    End Sub

    Protected Sub rbPropNo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbPropNo As RadioButton = CType(FormView7.FindControl("rbPropNo"), RadioButton)
        Dim txtPropOwner As TextBox = CType(FormView7.FindControl("txtPropOwner"), TextBox)
        Dim rfvPropOwner As RequiredFieldValidator = CType(FormView7.FindControl("rfvPropOwner"), RequiredFieldValidator)

        If rbPropNo.Checked = True Then
            txtPropOwner.Enabled = True
            txtPropOwner.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            rfvPropOwner.Enabled = True
        End If
    End Sub

    Protected Sub rbSchoolYes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbSchoolYes As RadioButton = CType(FormView7.FindControl("rbSchoolYes"), RadioButton)
        Dim rfvSchoolKids As RequiredFieldValidator = CType(FormView7.FindControl("rfvSchoolKids"), RequiredFieldValidator)
        Dim txtSchoolKids As TextBox = CType(FormView7.FindControl("txtSchoolKids"), TextBox)

        If rbSchoolYes.Checked = True Then
            txtSchoolKids.Enabled = True
            txtSchoolKids.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            rfvSchoolKids.Enabled = True
        End If
    End Sub

    Protected Sub rbSchoolNo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtSchoolKids As TextBox = CType(FormView7.FindControl("txtSchoolKids"), TextBox)
        Dim rbSchoolNo As RadioButton = CType(FormView7.FindControl("rbSchoolNo"), RadioButton)

        If rbSchoolNo.Checked = True Then
            txtSchoolKids.Text = String.Empty
            txtSchoolKids.Enabled = False
            txtSchoolKids.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

    End Sub

    Protected Sub rbCemLocN_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtCemeteryAddress As TextBox = CType(FormView7.FindControl("txtCemeteryAddress"), TextBox)
        Dim rbCemLocN As RadioButton = CType(FormView7.FindControl("rbCemLocN"), RadioButton)
        Dim rfvCemeteryAddress As RequiredFieldValidator = CType(FormView7.FindControl("rfvCemeteryAddress"), RequiredFieldValidator)

        If rbCemLocN.Checked = True Then
            txtCemeteryAddress.Enabled = True
            rfvCemeteryAddress.Enabled = True
            txtCemeteryAddress.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If
    End Sub

    Protected Sub rbCemLocY_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtCemeteryAddress As TextBox = CType(FormView7.FindControl("txtCemeteryAddress"), TextBox)
        Dim rbCemLocY As RadioButton = CType(FormView7.FindControl("rbCemLocY"), RadioButton)
        Dim rfvCemeteryAddress As RequiredFieldValidator = CType(FormView7.FindControl("rfvCemeteryAddress"), RequiredFieldValidator)

        If rbCemLocY.Checked = True Then
            txtCemeteryAddress.Text = String.Empty
            'txtCemeteryAddress.Enabled =
            'rfvCemeteryAddress.Enabled = True
            'txtCemeteryAddress.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If
    End Sub

    Protected Sub rbLoss7No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss7No As RadioButton = CType(FormView7.FindControl("rbLoss7No"), RadioButton)
        Dim Panel1 As Panel = CType(FormView7.FindControl("Panel1"), Panel)
        Dim txtLossDate7a As TextBox = CType(FormView7.FindControl("txtLossDate7a"), TextBox)
        Dim txtLossDescr7a As TextBox = CType(FormView7.FindControl("txtLossDescr7a"), TextBox)
        Dim txtLossAmt7a As TextBox = CType(FormView7.FindControl("txtLossAmt7a"), TextBox)
        Dim txtLossDate7b As TextBox = CType(FormView7.FindControl("txtLossDate7b"), TextBox)
        Dim txtLossDescr7b As TextBox = CType(FormView7.FindControl("txtLossDescr7b"), TextBox)
        Dim txtLossAmt7b As TextBox = CType(FormView7.FindControl("txtLossAmt7b"), TextBox)
        Dim txtLossDate7c As TextBox = CType(FormView7.FindControl("txtLossDate7c"), TextBox)
        Dim txtLossDescr7c As TextBox = CType(FormView7.FindControl("txtLossDescr7c"), TextBox)
        Dim txtLossAmt7c As TextBox = CType(FormView7.FindControl("txtLossAmt7c"), TextBox)
        Dim txtLossDate7d As TextBox = CType(FormView7.FindControl("txtLossDate7d"), TextBox)
        Dim txtLossDescr7d As TextBox = CType(FormView7.FindControl("txtLossDescr7d"), TextBox)
        Dim txtLossAmt7d As TextBox = CType(FormView7.FindControl("txtLossAmt7d"), TextBox)
        Dim txtLossDate7e As TextBox = CType(FormView7.FindControl("txtLossDate7e"), TextBox)
        Dim txtLossDescr7e As TextBox = CType(FormView7.FindControl("txtLossDescr7e"), TextBox)
        Dim txtLossAmt7e As TextBox = CType(FormView7.FindControl("txtLossAmt7e"), TextBox)

        If rbLoss7No.Checked = True Then
            Panel1.Enabled = False
            txtLossDate7a.Text = String.Empty
            txtLossDescr7a.Text = String.Empty
            txtLossAmt7a.Text = String.Empty
            txtLossDate7b.Text = String.Empty
            txtLossDescr7b.Text = String.Empty
            txtLossAmt7b.Text = String.Empty
            txtLossDate7c.Text = String.Empty
            txtLossDescr7c.Text = String.Empty
            txtLossAmt7c.Text = String.Empty
            txtLossDate7d.Text = String.Empty
            txtLossDescr7d.Text = String.Empty
            txtLossAmt7d.Text = String.Empty
            txtLossDate7e.Text = String.Empty
            txtLossDescr7e.Text = String.Empty
            txtLossAmt7e.Text = String.Empty
        End If
    End Sub

    Protected Sub rbLoss7Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss7Yes As RadioButton = CType(FormView7.FindControl("rbLoss7Yes"), RadioButton)
        Dim Panel1 As Panel = CType(FormView7.FindControl("Panel1"), Panel)
        Dim txtLossDate7a As TextBox = CType(FormView7.FindControl("txtLossDate7a"), TextBox)
        Dim rfvLossDate7a As RequiredFieldValidator = CType(FormView7.FindControl("rfvLossDate7a"), RequiredFieldValidator)
        Dim rfvLossDescr7a As RequiredFieldValidator = CType(FormView7.FindControl("rfvLossDescr7a"), RequiredFieldValidator)
        Dim rfvLossAmt7a As RequiredFieldValidator = CType(FormView7.FindControl("rfvLossAmt7a"), RequiredFieldValidator)

        If rbLoss7Yes.Checked = True Then
            Panel1.Enabled = True
            txtLossDate7a.Focus()
            rfvLossDate7a.Enabled = True
            rfvLossDescr7a.Enabled = True
            rfvLossAmt7a.Enabled = True
        End If
    End Sub

    'Protected Sub rbCounselNo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim rbCounselNo As RadioButton = CType(FormView8.FindControl("rbCounselNo"), RadioButton)
    '    Dim Panel2 As Panel = CType(FormView8.FindControl("Panel2"), Panel)
    '    Dim txtNumEmp As TextBox = CType(FormView8.FindControl("txtNumEmp"), TextBox)
    '    Dim txtTraining As TextBox = CType(FormView8.FindControl("txtTraining"), TextBox)

    '    If rbCounselNo.Checked = True Then
    '        Panel2.Enabled = False
    '        txtNumEmp.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
    '        txtTraining.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
    '        txtNumEmp.Text = String.Empty
    '        txtTraining.Text = String.Empty
    '    End If
    'End Sub

    'Protected Sub rbCounselYes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim rbCounselYes As RadioButton = CType(FormView8.FindControl("rbCounselYes"), RadioButton)
    '    Dim Panel2 As Panel = CType(FormView8.FindControl("Panel2"), Panel)
    '    Dim txtNumEmp As TextBox = CType(FormView8.FindControl("txtNumEmp"), TextBox)
    '    Dim txtTraining As TextBox = CType(FormView8.FindControl("txtTraining"), TextBox)
    '    Dim rfvNumEmp As RequiredFieldValidator = CType(FormView8.FindControl("rfvNumEmp"), RequiredFieldValidator)
    '    Dim rfvTraining As RequiredFieldValidator = CType(FormView8.FindControl("rfvTraining"), RequiredFieldValidator)

    '    If rbCounselYes.Checked = True Then
    '        Panel2.Enabled = True
    '        txtNumEmp.Focus()
    '        txtNumEmp.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
    '        txtTraining.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
    '        rfvNumEmp.Enabled = True
    '        rfvTraining.Enabled = True
    '    End If
    'End Sub

    Protected Sub rb5Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rb5Yes As RadioButton = CType(FormView8.FindControl("rb5Yes"), RadioButton)
        Dim txtExplain As TextBox = CType(FormView8.FindControl("txtExplain"), TextBox)
        Dim rfvExplain As RequiredFieldValidator = CType(FormView8.FindControl("rfvExplain"), RequiredFieldValidator)

        If rb5Yes.Checked = True Then
            txtExplain.Enabled = True
            txtExplain.Focus()
            txtExplain.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            rfvExplain.Enabled = True
        End If
    End Sub

    Protected Sub rb5No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rb5No As RadioButton = CType(FormView8.FindControl("rb5No"), RadioButton)
        Dim txtExplain As TextBox = CType(FormView8.FindControl("txtExplain"), TextBox)

        If rb5No.Checked = True Then
            txtExplain.Enabled = False
            txtExplain.Text = String.Empty
            txtExplain.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If
    End Sub

    Protected Sub rb7Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtExplainCharges As TextBox = CType(FormView9.FindControl("txtExplainCharges"), TextBox)
        Dim rb7Yes As RadioButton = CType(FormView9.FindControl("rb7Yes"), RadioButton)
        Dim rfvExplainCharges As RequiredFieldValidator = CType(FormView9.FindControl("rfvExplainCharges"), RequiredFieldValidator)

        If rb7Yes.Checked = True Then
            txtExplainCharges.Focus()
            txtExplainCharges.Enabled = True
            txtExplainCharges.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
            rfvExplainCharges.Enabled = True
        End If

    End Sub

    Protected Sub rb7No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtExplainCharges As TextBox = CType(FormView9.FindControl("txtExplainCharges"), TextBox)
        Dim rb7No As RadioButton = CType(FormView9.FindControl("rb7No"), RadioButton)

        If rb7No.Checked = True Then
            txtExplainCharges.Text = String.Empty
            txtExplainCharges.Enabled = False
            txtExplainCharges.Attributes.Add("style", "background-color:silver;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If
    End Sub

    Protected Sub rb10Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtExplainLosses As TextBox = CType(FormView10.FindControl("txtExplainLosses"), TextBox)
        Dim rb10Yes As RadioButton = CType(FormView10.FindControl("rb10Yes"), RadioButton)
        Dim rfvExpLoss As RequiredFieldValidator = CType(FormView10.FindControl("rfvExpLoss"), RequiredFieldValidator)

        If rb10Yes.Checked = True Then
            txtExplainLosses.Focus()
            txtExplainLosses.Enabled = True
            rfvExpLoss.Enabled = True
            txtExplainLosses.Attributes.Add("style", "background-color:white;border-right-style:groove;border-bottom-style:groove;border-left-style:groove;border-width: .07em;")
        End If

    End Sub

    Protected Sub rb10No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtExplainLosses As TextBox = CType(FormView10.FindControl("txtExplainLosses"), TextBox)
        Dim rb10No As RadioButton = CType(FormView10.FindControl("rb10No"), RadioButton)

        If rb10No.Checked = True Then
            txtExplainLosses.Text = String.Empty
        End If
    End Sub

    Protected Sub rbLoss11Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss11Yes As RadioButton = CType(FormView11.FindControl("rbLoss11Yes"), RadioButton)
        Dim Panel3 As Panel = CType(FormView11.FindControl("Panel3"), Panel)
        Dim txtLossDate11a As TextBox = CType(FormView11.FindControl("txtLossDate11a"), TextBox)
        Dim rfvLossDate11a As RequiredFieldValidator = CType(FormView11.FindControl("rfvLossDate11a"), RequiredFieldValidator)
        Dim rfvLossDescr11a As RequiredFieldValidator = CType(FormView11.FindControl("rfvLossDescr11a"), RequiredFieldValidator)
        Dim rfvLossAmt11a As RequiredFieldValidator = CType(FormView11.FindControl("rfvLossAmt11a"), RequiredFieldValidator)

        If rbLoss11Yes.Checked = True Then
            Panel3.Enabled = True
            txtLossDate11a.Focus()
            rfvLossDate11a.Enabled = True
            rfvLossDescr11a.Enabled = True
            rfvLossAmt11a.Enabled = True
        End If
    End Sub

    Protected Sub rbLoss11No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss11No As RadioButton = CType(FormView11.FindControl("rbLoss11No"), RadioButton)
        Dim Panel3 As Panel = CType(FormView11.FindControl("Panel3"), Panel)
        Dim txtLossDate11a As TextBox = CType(FormView11.FindControl("txtLossDate11a"), TextBox)
        Dim txtLossDescr11a As TextBox = CType(FormView11.FindControl("txtLossDescr11a"), TextBox)
        Dim txtLossAmt11a As TextBox = CType(FormView11.FindControl("txtLossAmt11a"), TextBox)
        Dim txtLossDate11b As TextBox = CType(FormView11.FindControl("txtLossDate11b"), TextBox)
        Dim txtLossDescr11b As TextBox = CType(FormView11.FindControl("txtLossDescr11b"), TextBox)
        Dim txtLossAmt11b As TextBox = CType(FormView11.FindControl("txtLossAmt11b"), TextBox)
        Dim txtLossDate11c As TextBox = CType(FormView11.FindControl("txtLossDate11c"), TextBox)
        Dim txtLossDescr11c As TextBox = CType(FormView11.FindControl("txtLossDescr11c"), TextBox)
        Dim txtLossAmt11c As TextBox = CType(FormView11.FindControl("txtLossAmt11c"), TextBox)
        Dim txtLossDate11d As TextBox = CType(FormView11.FindControl("txtLossDate11d"), TextBox)
        Dim txtLossDescr11d As TextBox = CType(FormView11.FindControl("txtLossDescr11d"), TextBox)
        Dim txtLossAmt11d As TextBox = CType(FormView11.FindControl("txtLossAmt11d"), TextBox)
        Dim txtLossDate11e As TextBox = CType(FormView11.FindControl("txtLossDate11e"), TextBox)
        Dim txtLossDescr11e As TextBox = CType(FormView11.FindControl("txtLossDescr11e"), TextBox)
        Dim txtLossAmt11e As TextBox = CType(FormView11.FindControl("txtLossAmt11e"), TextBox)

        If rbLoss11No.Checked = True Then
            Panel3.Enabled = False
            txtLossDate11a.Text = String.Empty
            txtLossDescr11a.Text = String.Empty
            txtLossAmt11a.Text = String.Empty
            txtLossDate11b.Text = String.Empty
            txtLossDescr11b.Text = String.Empty
            txtLossAmt11b.Text = String.Empty
            txtLossDate11c.Text = String.Empty
            txtLossDescr11c.Text = String.Empty
            txtLossAmt11c.Text = String.Empty
            txtLossDate11d.Text = String.Empty
            txtLossDescr11d.Text = String.Empty
            txtLossAmt11d.Text = String.Empty
            txtLossDate11e.Text = String.Empty
            txtLossDescr11e.Text = String.Empty
            txtLossAmt11e.Text = String.Empty
        End If
    End Sub

    Protected Sub rbLoss14Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss14Yes As RadioButton = CType(FormView14.FindControl("rbLoss14Yes"), RadioButton)
        Dim Panel4 As Panel = CType(FormView14.FindControl("Panel4"), Panel)
        Dim txtLossDate14a As TextBox = CType(FormView14.FindControl("txtLossDate14a"), TextBox)
        Dim rfvLossDate14a As RequiredFieldValidator = CType(FormView14.FindControl("rfvLossDate14a"), RequiredFieldValidator)
        Dim rfvLossDescr14a As RequiredFieldValidator = CType(FormView14.FindControl("rfvLossDescr14a"), RequiredFieldValidator)
        Dim rfvLossAmt14a As RequiredFieldValidator = CType(FormView14.FindControl("rfvLossAmt14a"), RequiredFieldValidator)

        If rbLoss14Yes.Checked = True Then
            Panel4.Enabled = True
            txtLossDate14a.Focus()
            rfvLossDate14a.Enabled = True
            rfvLossDescr14a.Enabled = True
            rfvLossAmt14a.Enabled = True
        End If

    End Sub

    Protected Sub rbLoss14No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss14No As RadioButton = CType(FormView14.FindControl("rbLoss14No"), RadioButton)
        'Dim Panel4 As Panel = CType(FormView14.FindControl("Panel4"), Panel)
        Dim txtLossDate14a As TextBox = CType(FormView14.FindControl("txtLossDate14a"), TextBox)
        Dim txtLossDescr14a As TextBox = CType(FormView14.FindControl("txtLossDescr14a"), TextBox)
        Dim txtLossAmt14a As TextBox = CType(FormView14.FindControl("txtLossAmt14a"), TextBox)
        Dim txtLossDate14b As TextBox = CType(FormView14.FindControl("txtLossDate14b"), TextBox)
        Dim txtLossDescr14b As TextBox = CType(FormView14.FindControl("txtLossDescr14b"), TextBox)
        Dim txtLossAmt14b As TextBox = CType(FormView14.FindControl("txtLossAmt14b"), TextBox)
        Dim txtLossDate14c As TextBox = CType(FormView14.FindControl("txtLossDate14c"), TextBox)
        Dim txtLossDescr14c As TextBox = CType(FormView14.FindControl("txtLossDescr14c"), TextBox)
        Dim txtLossAmt14c As TextBox = CType(FormView14.FindControl("txtLossAmt14c"), TextBox)
        Dim txtLossDate14d As TextBox = CType(FormView14.FindControl("txtLossDate14d"), TextBox)
        Dim txtLossDescr14d As TextBox = CType(FormView14.FindControl("txtLossDescr14d"), TextBox)
        Dim txtLossAmt14d As TextBox = CType(FormView14.FindControl("txtLossAmt14d"), TextBox)
        Dim txtLossDate14e As TextBox = CType(FormView14.FindControl("txtLossDate14e"), TextBox)
        Dim txtLossDescr14e As TextBox = CType(FormView14.FindControl("txtLossDescr14e"), TextBox)
        Dim txtLossAmt14e As TextBox = CType(FormView14.FindControl("txtLossAmt14e"), TextBox)

        If rbLoss14No.Checked = True Then
            'Panel4.Enabled = False
            txtLossDate14a.Text = String.Empty
            txtLossDescr14a.Text = String.Empty
            txtLossAmt14a.Text = String.Empty
            txtLossDate14b.Text = String.Empty
            txtLossDescr14b.Text = String.Empty
            txtLossAmt14b.Text = String.Empty
            txtLossDate14c.Text = String.Empty
            txtLossDescr14c.Text = String.Empty
            txtLossAmt14c.Text = String.Empty
            txtLossDate14d.Text = String.Empty
            txtLossDescr14d.Text = String.Empty
            txtLossAmt14d.Text = String.Empty
            txtLossDate14e.Text = String.Empty
            txtLossDescr14e.Text = String.Empty
            txtLossAmt14e.Text = String.Empty
        End If

    End Sub

    Protected Sub rbLoss15Yes_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss15Yes As RadioButton = CType(FormView15.FindControl("rbLoss15Yes"), RadioButton)
        Dim Panel5 As Panel = CType(FormView15.FindControl("Panel5"), Panel)
        Dim txtLossDate15a As TextBox = CType(FormView15.FindControl("txtLossDate15a"), TextBox)
        Dim rfvLossDate15a As RequiredFieldValidator = CType(FormView15.FindControl("rfvLossDate15a"), RequiredFieldValidator)
        Dim rfvLossDescr15a As RequiredFieldValidator = CType(FormView15.FindControl("rfvLossDescr15a"), RequiredFieldValidator)
        Dim rfvLossAmt15a As RequiredFieldValidator = CType(FormView15.FindControl("rfvLossAmt15a"), RequiredFieldValidator)

        If rbLoss15Yes.Checked = True Then
            Panel5.Enabled = True
            txtLossDate15a.Focus()
            rfvLossDate15a.Enabled = True
            rfvLossDescr15a.Enabled = True
            rfvLossAmt15a.Enabled = True
        End If

    End Sub

    Protected Sub rbLoss15No_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim rbLoss15No As RadioButton = CType(FormView15.FindControl("rbLoss15No"), RadioButton)
        Dim txtLossDate15a As TextBox = CType(FormView15.FindControl("txtLossDate15a"), TextBox)
        Dim txtLossDescr15a As TextBox = CType(FormView15.FindControl("txtLossDescr15a"), TextBox)
        Dim txtLossAmt15a As TextBox = CType(FormView15.FindControl("txtLossAmt15a"), TextBox)
        Dim txtLossDate15b As TextBox = CType(FormView15.FindControl("txtLossDate15b"), TextBox)
        Dim txtLossDescr15b As TextBox = CType(FormView15.FindControl("txtLossDescr15b"), TextBox)
        Dim txtLossAmt15b As TextBox = CType(FormView15.FindControl("txtLossAmt15b"), TextBox)
        Dim txtLossDate15c As TextBox = CType(FormView15.FindControl("txtLossDate15c"), TextBox)
        Dim txtLossDescr15c As TextBox = CType(FormView15.FindControl("txtLossDescr15c"), TextBox)
        Dim txtLossAmt15c As TextBox = CType(FormView15.FindControl("txtLossAmt15c"), TextBox)
        Dim txtLossDate15d As TextBox = CType(FormView15.FindControl("txtLossDate15d"), TextBox)
        Dim txtLossDescr15d As TextBox = CType(FormView15.FindControl("txtLossDescr15d"), TextBox)
        Dim txtLossAmt15d As TextBox = CType(FormView15.FindControl("txtLossAmt15d"), TextBox)
        Dim txtLossDate15e As TextBox = CType(FormView15.FindControl("txtLossDate15e"), TextBox)
        Dim txtLossDescr15e As TextBox = CType(FormView15.FindControl("txtLossDescr15e"), TextBox)
        Dim txtLossAmt15e As TextBox = CType(FormView15.FindControl("txtLossAmt15e"), TextBox)

        If rbLoss15No.Checked = True Then
            txtLossDate15a.Text = String.Empty
            txtLossDescr15a.Text = String.Empty
            txtLossAmt15a.Text = String.Empty
            txtLossDate15b.Text = String.Empty
            txtLossDescr15b.Text = String.Empty
            txtLossAmt15b.Text = String.Empty
            txtLossDate15c.Text = String.Empty
            txtLossDescr15c.Text = String.Empty
            txtLossAmt15c.Text = String.Empty
            txtLossDate15d.Text = String.Empty
            txtLossDescr15d.Text = String.Empty
            txtLossAmt15d.Text = String.Empty
            txtLossDate15e.Text = String.Empty
            txtLossDescr15e.Text = String.Empty
            txtLossAmt15e.Text = String.Empty
        End If
    End Sub

    Protected Sub StepNextButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.NextButtonClick
        Dim index As Integer = Int32.Parse(e.CurrentStepIndex.ToString)
        'Wizard1.ActiveStepIndex = index
        Dim grdLocation As GridView = CType(FormView3.FindControl("grdLocation"), GridView)
        Dim grdBuilding As GridView = CType(FormView4.FindControl("grdBuilding"), GridView)
        Dim ddPCliab As DropDownList = CType(FormView6.FindControl("ddPCliab"), DropDownList)
        Dim ddSMMliab As DropDownList = CType(FormView6.FindControl("ddSMMliab"), DropDownList)
        Dim ddDOliab As DropDownList = CType(FormView6.FindControl("ddDOliab"), DropDownList)
        Dim ddEPLliab As DropDownList = CType(FormView6.FindControl("ddEPLliab"), DropDownList)
        Dim ddTeachLiab As DropDownList = CType(FormView6.FindControl("ddTeachLiab"), DropDownList)
        Dim rbPropYes As RadioButton = CType(FormView7.FindControl("rbPropYes"), RadioButton)
        Dim rbPropNo As RadioButton = CType(FormView7.FindControl("rbPropNo"), RadioButton)
        Dim txtNumEmp As TextBox = CType(FormView8.FindControl("txtNumEmp"), TextBox)
        Dim cmpNumEmp As CompareValidator = CType(FormView8.FindControl("cmpNumEmp"), CompareValidator)
        Dim cmpTotalEmp As CompareValidator = CType(FormView16.FindControl("cmpTotalEmp"), CompareValidator)
        Dim misconductYes As RadioButton = CType(FormView9.FindControl("misconductYes"), RadioButton)
        Dim misconductNo As RadioButton = CType(FormView9.FindControl("misconductNo"), RadioButton)
        Dim rb10Yes As RadioButton = CType(FormView10.FindControl("rb10Yes"), RadioButton)
        Dim rb10No As RadioButton = CType(FormView10.FindControl("rb10No"), RadioButton)
        Dim txtTotalEmployees As TextBox = CType(FormView16.FindControl("txtTotalEmployees"), TextBox)
        Dim rdTeachersYes1 As RadioButton = CType(FormView17.FindControl("rdTeachersYes1"), RadioButton)
        Dim rdTeachersNo1 As RadioButton = CType(FormView17.FindControl("rdTeachersNo1"), RadioButton)

        If index = 2 And grdLocation.Rows.Count = 0 Then
            MsgBox("need Location")
        ElseIf index = 3 And grdBuilding.Rows.Count = 0 Then
            MsgBox("Need Building")
        ElseIf index = 5 And ddPCliab.SelectedValue > 0 And ddSMMliab.SelectedValue > 0 And ddDOliab.SelectedValue > 0 And ddEPLliab.SelectedValue > 0 And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 7 'Check to see if all five have been selected - goto pastoral page / first 
        ElseIf index = 5 And ddPCliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 7 'Check to see if all five have been selected - goto sexual misconduct page / second 
        ElseIf index = 5 And ddSMMliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 8 'Check to see if all five have been selected - goto directors page / forth 
        ElseIf index = 5 And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9 'Check to see if all five have been selected - goto directors page / fifth 
        ElseIf index = 5 And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10 'Scenario if pastoral is greater than zero and if sexual misconduct is greater than zero goto pastoral page
        ElseIf index = 5 And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11 'Scenario if pastoral is greater than zero and if sexual misconduct is greater than zero goto sexual misconduct page
        ElseIf index = 5 And ddPCliab.SelectedValue = 0 And ddSMMliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6 'Check to see if all five have been selected - goto directors page / third 


        ElseIf index = 7 And txtNumEmp.Text > "0" And ddSMMliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 8 'Check after completing the pastoral form if there was a value for sexual misconduct and goto the sexual misconduct page
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9 'Check after completing the pastoral form if there was a value for directors page and goto directors page page
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10 'Employee
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11 'Teacher
        ElseIf index = 7 And txtNumEmp.Text > "0" And ddSMMliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6


        ElseIf index = 8 And misconductYes.Checked = True And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9
        ElseIf index = 8 And misconductNo.Checked = True And ddDOliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 9
        ElseIf index = 8 And misconductYes.Checked = True And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 8 And misconductNo.Checked = True And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 8 And misconductYes.Checked = True And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 8 And misconductNo.Checked = True And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 8 And misconductYes.Checked = True And ddPCliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6
        ElseIf index = 8 And misconductNo.Checked = True And ddPCliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6



        ElseIf index = 9 And rb10Yes.Checked = True And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 9 And rb10No.Checked = True And ddEPLliab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 10
        ElseIf index = 9 And rb10Yes.Checked = True And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 9 And rb10No.Checked = True And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 9 And rb10Yes.Checked = True And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6
        ElseIf index = 9 And rb10No.Checked = True And ddEPLliab.SelectedValue = 0 And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6


        ElseIf index = 10 And txtTotalEmployees.Text > "0" And ddTeachLiab.SelectedValue > 0 Then
            Wizard1.ActiveStepIndex = 11
        ElseIf index = 10 And txtTotalEmployees.Text > "0" And ddTeachLiab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6


        ElseIf index = 5 And ddPCliab.SelectedValue = 0 And ddSMMliab.SelectedValue = 0 And ddDOliab.SelectedValue = 0 Then
            Wizard1.ActiveStepIndex = 6 'Check to see if all three have been selected - goto pastoral page / first 
        ElseIf index = 6 And rbPropYes.Checked = True Then
            Wizard1.ActiveStepIndex = 12
        ElseIf index = 6 And rbPropNo.Checked = True Then
            Wizard1.ActiveStepIndex = 12
        ElseIf index = 11 And rdTeachersYes1.Checked = True Then
            Wizard1.ActiveStepIndex = 6
        ElseIf index = 11 And rdTeachersNo1.Checked = True Then
            Wizard1.ActiveStepIndex = 6
        End If



        cmpNumEmp.ValueToCompare = 0
        cmpTotalEmp.ValueToCompare = 0
        'page 223
        'If index = 3 And grdBuilding.Rows.Count = 0 Then
        '    MsgBox("Need Building")
        'End If


    End Sub

    Protected Sub Wizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Wizard1.ActiveStepChanged
        'Dim index As Integer = Int32.Parse(e.CurrentStepIndex.ToString)
        'Wizard1.ActiveStepIndex = index
        'Dim grdLocation As GridView = CType(FormView3.FindControl("grdLocation"), GridView)
        'Dim grdBuilding As GridView = CType(FormView4.FindControl("grdBuilding"), GridView)
        'Dim ddPCliab As DropDownList = CType(FormView6.FindControl("ddPCliab"), DropDownList)
        'Dim ddSMMliab As DropDownList = CType(FormView6.FindControl("ddSMMliab"), DropDownList)
        'Dim txtNumEmp As TextBox = CType(FormView8.FindControl("txtNumEmp"), TextBox)
        'Dim cmpNumEmp As CompareValidator = CType(FormView8.FindControl("cmpNumEmp"), CompareValidator)
        'Dim misconductYes As RadioButton = CType(FormView9.FindControl("misconductYes"), RadioButton)
        'Dim misconductNo As RadioButton = CType(FormView9.FindControl("misconductNo"), RadioButton)


        'If ddPCliab.SelectedValue <= 0 Then
        '    Wizard1.ActiveStepIndex = 6
        'ElseIf ddSMMliab.SelectedValue <= 0 Then
        '    Wizard1.ActiveStepIndex = 6
        'End If
    End Sub
End Class
