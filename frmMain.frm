VERSION 5.00
Object = "{33101C00-75C3-11CF-A8A0-444553540000}#1.0#0"; "CSWSK32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Broadcasting over LAN with IPX/SPX Protocol"
   ClientHeight    =   4740
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7335
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4740
   ScaleWidth      =   7335
   StartUpPosition =   3  'Windows Default
   Begin SocketWrenchCtrl.Socket sckBroadcast 
      Left            =   6000
      Top             =   2640
      _Version        =   65536
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   0
      AutoResolve     =   -1  'True
      Backlog         =   5
      Binary          =   -1  'True
      Blocking        =   -1  'True
      Broadcast       =   0   'False
      BufferSize      =   0
      HostAddress     =   ""
      HostFile        =   ""
      HostName        =   ""
      InLine          =   0   'False
      Interval        =   0
      KeepAlive       =   0   'False
      Library         =   ""
      Linger          =   0
      LocalPort       =   0
      LocalService    =   ""
      Protocol        =   0
      RemotePort      =   0
      RemoteService   =   ""
      ReuseAddress    =   0   'False
      Route           =   -1  'True
      Timeout         =   0
      Type            =   1
      Urgent          =   0   'False
   End
   Begin VB.CommandButton cmdContact 
      Caption         =   "Contact Me!"
      Height          =   375
      Left            =   5520
      TabIndex        =   7
      Top             =   3120
      Width           =   1695
   End
   Begin VB.Frame Frame2 
      Caption         =   "How to use"
      Height          =   1035
      Left            =   60
      TabIndex        =   4
      Top             =   2940
      Width           =   5355
      Begin VB.Label Label2 
         Caption         =   $"frmMain.frx":0000
         Height          =   675
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   5115
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "About"
      Height          =   2115
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   7035
      Begin VB.TextBox txtAbout 
         Height          =   1755
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Text            =   "frmMain.frx":00C6
         Top             =   240
         Width           =   6795
      End
   End
   Begin VB.CommandButton cmdBroadcast 
      Caption         =   "Broadcast!"
      Height          =   375
      Left            =   5520
      TabIndex        =   0
      Top             =   3600
      Width           =   1695
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   $"frmMain.frx":02B8
      ForeColor       =   &H00FF0000&
      Height          =   555
      Left            =   60
      TabIndex        =   6
      Top             =   4080
      Width           =   7155
   End
   Begin VB.Label Label1 
      Caption         =   "This broadcasting example was created by Plasma (Andrew Armstrong). If you use this code, please credit me :)"
      ForeColor       =   &H80000008&
      Height          =   435
      Left            =   120
      TabIndex        =   3
      Top             =   2280
      Width           =   7035
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
End Sub


Private Sub cmdBroadcast_Click()
'Lets send some test data!
Dim strData As String 'Declare variable
'Ask the user for some data to be broadcasted
strData = InputBox("Enter some data to broadcast!", "Enter data", "Testing!")
'If there was no data entered, or the user pressed cancel, exit this sub
'before the transmittion of the data, to avoid errors.
If strData = "" Then Exit Sub

'Transmit the broadcasted data to EVERY computer on the network!
'The variable 'a' is not used. It is just a temp variable, like the x = MsgBox() statement's
a = sckBroadcast.Write(strData, Len(strData))
'========
'In the first argument, I have passed the data to be sent to the
'.Write() event, the second argument, "Len(strData)", just tells the
'remote host how many characters long the data is.

End Sub

Private Sub cmdContact_Click()
Dim strMSG As String 'Declare variable

'Set variable data (Used to display MsgBox() below)
strMSG = "Hey! You can contact me via the following methods:" & vbCrLf & vbCrLf & _
 "E-Mail: andrewarmstrong@hotmail.com" & vbCrLf & _
 "ICQ#: 14344635" & vbCrLf & vbCrLf & _
 "Please dont hesitate to ask ANY questions about this program, or general VB help!"

MsgBox strMSG, vbInformation, "Contact Me!"
End Sub

Private Sub Form_Load()
'The below code just set's up the sockets...
sckBroadcast.LocalPort = 1414 'Set the 'Listen port'
'====== NOTE ======
'Please note. I have set the localport and the remote port to the same
'So you could test this even if you did not have a network
'If you wish NOT to send the broadcast data to the transmitting PC,
'Simply change the Localport for this PC only. So it dose not receive the
'Packet sent to port 1414 (Specified in .RemotePort)
'===================
sckBroadcast.RemotePort = 1414 'Set the 'Remote listen port'
sckBroadcast.AddressFamily = AF_INET
sckBroadcast.Protocol = IPPROTO_UDP 'Use the UDP Protocol (MUST)
sckBroadcast.SocketType = SOCK_DGRAM
sckBroadcast.Broadcast = True 'Enable the broadcasting feature :)
sckBroadcast.Binary = False 'Disable the sendpacket type to binary
sckBroadcast.Blocking = False
sckBroadcast.Action = SOCKET_OPEN 'Everything is set, enable/open the socket!
'Display the 'Notice' form, to explain something with the socket control.
frmNote.Show vbModal
End Sub

Private Sub Form_Unload(Cancel As Integer)
'My little Thankyou and vote for me message!
MsgBox "Thankyou for downloading my IPX/SPX broadcasting example!" & vbCrLf & vbCrLf & _
"I would be very greatful if you could PLEASE vote for me at" & vbCrLf & vbCrLf & " www.planet-source-code.com/vb/" & vbCrLf & vbCrLf & "It can be your way of saying thanx :)", vbInformation, "Thanx, and please vote!"
'Ask the user if they would like to go and visit PSC now!
x = MsgBox("Would you like to goto http://www.planet-source-code.com/vb/ and vote for me now? :)", vbQuestion + vbYesNo, "Go now?")
If x = vbYes Then
'Open the default webbrowser at PSC's website!
OpenInternet Me, "http://www.planet-source-code.com/vb/", Normal
End If
End Sub

Private Sub sckBroadcast_LastError(ErrorCode As Integer, ErrorString As String, Response As Integer)
'Incase of a socket error, display the error message. (Not needed)
'I added this code just in case of an error while debuging...
MsgBox "Error - " & ErrorCode & " - " & ErrorString & " - " & Response
End Sub

Private Sub sckBroadcast_Read(DataLength As Integer, IsUrgent As Integer)
'=== We have new data! ===
Dim strData As String 'Declare the 'strData' variable (Will hold the received data)
sckBroadcast.RecvLen = DataLength 'How many characters is the entire message? Like the LEN() function of a string...
strData = sckBroadcast.RecvData 'Set the variable!
MsgBox strData, vbInformation, "Received data!" 'Display our nice piece of broadcasted data!
End Sub
