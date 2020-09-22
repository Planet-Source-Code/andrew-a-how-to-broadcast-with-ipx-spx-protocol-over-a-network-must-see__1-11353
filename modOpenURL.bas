Attribute VB_Name = "modOpenURL"
'The below code has NOTHING to do with the IPX/SPX protocol or broadcasting.
'It is mearly used for the ending "Goto PSC's site?" thing
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" _
    (ByVal hwnd As Long, ByVal lpOperation As String, _
    ByVal lpFile As String, ByVal lpParameters As String, _
    ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long


Public Enum T_WindowStyle
    Maximized = 3
    Normal = 1
    ShowOnly = 5
End Enum

'The below code has NOTHING to do with the IPX/SPX protocol or broadcasting.
'It is mearly used for the ending "Goto PSC's site?" thing

Public Sub OpenInternet(Parent As Form, URL As String, _
    WindowStyle As T_WindowStyle)
    ShellExecute Parent.hwnd, "Open", URL, "", "", WindowStyle
End Sub

