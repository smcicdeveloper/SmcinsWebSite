Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Collections.Generic
Imports System.Collections.Specialized

Namespace myControls
    <ParseChildren(False)> _
    Public Class ClientTabs
        Inherits WebControl
        Implements IPostBackDataHandler

        ''' <summary>
        ''' Ignore every child tag except for Tabs
        ''' </summary>
        Protected Overrides Sub AddParsedSubObject(ByVal obj As Object)
            If TypeOf obj Is Tab Then
                MyBase.AddParsedSubObject(obj)
            End If
        End Sub

        ''' <summary>
        ''' Gets or sets the selected tab index
        ''' </summary>
        Public Property SelectedIndex() As Integer
            Get
                If ViewState("SelectedIndex") Is Nothing Then
                    Return 0
                Else
                    Return CType(ViewState("SelectedIndex"), Integer)
                End If
            End Get
            Set(ByVal Value As Integer)
                ViewState("SelectedIndex") = value
            End Set
        End Property

        ''' <summary>
        ''' Helper method which returns the hidden
        ''' form field ID
        ''' </summary>
        Private ReadOnly Property HiddenFieldID() As String
            Get
                Return String.Format("{0}_hidden", Me.ClientID)
            End Get
        End Property

        ''' <summary>
        ''' ID for the DIV tag which contains all of the tabs
        ''' </summary>
        Private ReadOnly Property TabContainerID() As String
            Get
                Return String.Format("{0}_tabs", Me.ClientID)
            End Get
        End Property

        ''' <summary>
        ''' ID for the DIV tag which contains all of the tab contents
        ''' </summary>
        Private ReadOnly Property TabContentContainerID() As String
            Get
                Return String.Format("{0}_tabContent", Me.ClientID)
            End Get
        End Property

        ''' <summary>
        ''' Register all client-side content including scripts and CSS
        ''' </summary>
        Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
            ' Process server events
            Page.RegisterRequiresPostBack(Me)

            ' Make sure selected index is possible
            If SelectedIndex > (Controls.Count - 1) Then
                Throw New Exception("SelectedIndex must be less than Tab count")
            End If

            ' Register hidden field to maintain state
            Page.ClientScript.RegisterHiddenField(HiddenFieldID, Controls(SelectedIndex).ClientID)

            ' Add link to external Cascading Style Sheet
            Dim styleLink As New HtmlLink()
            styleLink.Href = "~/CSS/layout.css"
            styleLink.Attributes.Add("rel", "stylesheet")
            styleLink.Attributes.Add("type", "text/css")
            Page.Header.Controls.Add(styleLink)

            ' Register javascript include
            If Not Page.ClientScript.IsClientScriptIncludeRegistered("ClientTabs") Then
                Page.ClientScript.RegisterClientScriptInclude("ClientTabs", Page.ResolveUrl("~/js/ClientTabs.js"))
            End If

            MyBase.OnPreRender(e)
        End Sub

        ''' <summary>
        ''' Contain control content in a DIV
        ''' </summary>
        Protected Overrides ReadOnly Property TagKey() As HtmlTextWriterTag
            Get
                Return HtmlTextWriterTag.Div
            End Get
        End Property


        ''' <summary>
        ''' Render tabs and tab content
        ''' </summary>
        Protected Overrides Sub RenderContents(ByVal writer As HtmlTextWriter)
            RenderTabs(writer)
            RenderTabContent(writer)
        End Sub

        ''' <summary>
        ''' Render the tab strip
        ''' </summary>
        Private Sub RenderTabs(ByVal writer As HtmlTextWriter)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "tabs")
            writer.RenderBeginTag(HtmlTextWriterTag.Table)
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody)
            writer.AddAttribute(HtmlTextWriterAttribute.Id, TabContainerID)
            writer.RenderBeginTag(HtmlTextWriterTag.Tr)

            Dim index As Integer
            For index = 0 To Controls.Count - 1 Step index + 1
                Dim currentTab As Tab = CType(Controls(index), Tab)
                Dim script As String = String.Format("ClientTabs.selectTab('{0}','{1}')", Me.ClientID, currentTab.ClientID)
                writer.AddAttribute(HtmlTextWriterAttribute.Onclick, script)
                If index = SelectedIndex Then
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "tab selectedTab")
                Else
                    writer.AddAttribute(HtmlTextWriterAttribute.Class, "tab unselectedTab")
                End If
                writer.AddAttribute(HtmlTextWriterAttribute.Id, currentTab.ClientID + "_tab")
                writer.RenderBeginTag(HtmlTextWriterTag.Td)
                writer.Write(currentTab.Text)
                writer.RenderEndTag()
            Next

            writer.RenderEndTag()
            writer.RenderEndTag()
            writer.RenderEndTag()
        End Sub

        ''' <summary>
        ''' Render the tab contents
        ''' </summary>
        Private Sub RenderTabContent(ByVal writer As HtmlTextWriter)
            writer.AddAttribute(HtmlTextWriterAttribute.Id, TabContentContainerID)
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "tabContent")
            writer.RenderBeginTag(HtmlTextWriterTag.Div)

            Dim index As Integer
            For index = 0 To Controls.Count - 1 Step index + 1
                Dim currentTab As Tab = CType(Controls(index), Tab)
                If index <> SelectedIndex Then
                    currentTab.Style.Add("display", "none")
                End If

                currentTab.RenderControl(writer)
            Next
            writer.RenderEndTag()
        End Sub

        ''' <summary>
        ''' Process postback data
        ''' </summary>
        Public Function LoadPostData(ByVal postDataKey As String, ByVal postCollection As NameValueCollection) As Boolean _
        Implements IPostBackDataHandler.LoadPostData
            Dim selectedTabId As String = postCollection(HiddenFieldID)
            EnsureChildControls()
            Dim index As Integer
            For index = 0 To Controls.Count - 1 Step index + 1
                If Controls(index).ClientID = selectedTabId Then
                    SelectedIndex = index
                End If
            Next
            Return False
        End Function

        ''' <summary>
        ''' If selected tab changed, raise event
        ''' </summary>
        Public Sub RaisePostDataChangedEvent() Implements IPostBackDataHandler.RaisePostDataChangedEvent
        End Sub
    End Class


    <ParseChildren(False)> _
    Public Class Tab
        Inherits WebControl
        Private _text As String

        ''' <summary>
        ''' Represents tab label
        ''' </summary>
        Public Property Text() As String
            Get
                Return _text
            End Get
            Set(ByVal Value As String)
                _text = value
            End Set
        End Property

        ''' <summary>
        ''' Make sure each tab has an id
        ''' </summary>
        Protected Overrides Sub OnLoad(ByVal e As EventArgs)
            Me.EnsureID()
            MyBase.OnLoad(e)
        End Sub


        ''' <summary>
        ''' Render tab in a DIV
        ''' </summary>
        Protected Overrides ReadOnly Property TagKey() As HtmlTextWriterTag
            Get
                Return HtmlTextWriterTag.Div
            End Get
        End Property

    End Class

End Namespace

