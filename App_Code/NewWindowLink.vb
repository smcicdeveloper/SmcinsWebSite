Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace myControls

    Public Class NewWindowLink
        Inherits WebControl
        Private _text As String = "Click Here!"
        Private _navigateUrl As String
        Private _target As String = "_blank"
        Private _windowWidth As String = "auto"
        Private _windowHeight As String = "auto"
        Private _windowLeft As Integer = 100
        Private _windowTop As Integer = 100
        Private _fullScreen As Boolean = False
        Private _resizable As Boolean = True

        Public Property Text() As String
            Get
                Return _text
            End Get
            Set(ByVal Value As String)
                _text = value
            End Set
        End Property

        Public Property NavigateUrl() As String
            Get
                Return _navigateUrl
            End Get
            Set(ByVal Value As String)
                _navigateUrl = value
            End Set
        End Property

        Public Property Target() As String
            Get
                Return _target
            End Get
            Set(ByVal Value As String)
                _target = value
            End Set
        End Property

        Public Property WindowWidth() As String
            Get
                Return _windowWidth
            End Get
            Set(ByVal Value As String)
                _windowWidth = Value
            End Set
        End Property

        Public Property WindowHeight() As Integer
            Get
                Return _windowHeight
            End Get
            Set(ByVal Value As Integer)
                _windowHeight = value
            End Set
        End Property

        Public Property WindowLeft() As Integer
            Get
                Return _windowLeft
            End Get
            Set(ByVal Value As Integer)
                _windowLeft = value
            End Set
        End Property

        Public Property WindowTop() As Integer
            Get
                Return _windowTop
            End Get
            Set(ByVal Value As Integer)
                _windowTop = value
            End Set
        End Property

        Public Property FullScreen() As Boolean
            Get
                Return _fullScreen
            End Get
            Set(ByVal Value As Boolean)
                _fullScreen = value
            End Set
        End Property

        Public Property Resizable() As Boolean
            Get
                Return _resizable
            End Get
            Set(ByVal Value As Boolean)
                _resizable = value
            End Set
        End Property

        Protected Overrides Sub AddAttributesToRender(ByVal writer As HtmlTextWriter)
            Dim fullscreenValue As String = "no"
            If (_fullScreen) Then
                fullscreenValue = "yes"
            End If
            Dim resizableValue As String = "no"
            If (_resizable) Then
                resizableValue = "yes"
            End If
            Dim features As String = "width={0},height={1},left={2},top={3},fullscreen={4},resizable={5},status=no,toolbar=no,menubar=no,location=no"
            Dim featuresValue As String = String.Format(features, _windowWidth, _windowHeight, _windowLeft, _windowTop, fullscreenValue, resizableValue)
            Dim script As String = String.Format("window.open('{0}','{1}','{2}');return false;", Page.ResolveUrl(_navigateUrl), _target, featuresValue)
            writer.AddAttribute(HtmlTextWriterAttribute.Onclick, script)
            writer.AddAttribute(HtmlTextWriterAttribute.Href, Page.ResolveUrl(_navigateUrl))
            MyBase.AddAttributesToRender(writer)
        End Sub

        Protected Overrides Sub RenderContents(ByVal writer As HtmlTextWriter)
            writer.Write(_text)
        End Sub

        Protected Overrides ReadOnly Property TagKey() As HtmlTextWriterTag
            Get
                Return HtmlTextWriterTag.A
            End Get
        End Property

    End Class
End Namespace


