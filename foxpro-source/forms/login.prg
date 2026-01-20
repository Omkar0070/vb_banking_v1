```foxpro
*---------------------------------------
* Banking System - Login Form
*---------------------------------------
PUBLIC oLoginForm
oLoginForm = CREATEOBJECT("LoginForm")
oLoginForm.Show()

DEFINE CLASS LoginForm AS Form
    Height = 300
    Width = 400
    Caption = "Banking System Login"
    AutoCenter = .T.
    
    ADD OBJECT txtUsername AS TextBox WITH ;
        Left = 120, ;
        Top = 80, ;
        Width = 200, ;
        Height = 25
    
    ADD OBJECT txtPassword AS TextBox WITH ;
        Left = 120, ;
        Top = 120, ;
        Width = 200, ;
        Height = 25, ;
        PasswordChar = "*"
    
    ADD OBJECT cmdLogin AS CommandButton WITH ;
        Left = 120, ;
        Top = 180, ;
        Width = 80, ;
        Height = 30, ;
        Caption = "Login"
    
    ADD OBJECT cmdCancel AS CommandButton WITH ;
        Left = 240, ;
        Top = 180, ;
        Width = 80, ;
        Height = 30, ;
        Caption = "Cancel"
    
    PROCEDURE cmdLogin.Click
        lcUsername = ALLTRIM(THISFORM.txtUsername.Value)
        lcPassword = ALLTRIM(THISFORM.txtPassword.Value)
        
        IF EMPTY(lcUsername) OR EMPTY(lcPassword)
            MESSAGEBOX("Please enter username and password", 48, "Validation")
            RETURN .F.
        ENDIF
        
        IF THIS.ValidateUser(lcUsername, lcPassword)
            MESSAGEBOX("Login successful!", 64, "Success")
            THISFORM.Release()
        ELSE
            MESSAGEBOX("Invalid credentials", 16, "Error")
        ENDIF
    ENDPROC
    
    PROCEDURE cmdCancel.Click
        THISFORM.Release()
    ENDPROC
    
    FUNCTION ValidateUser(tcUser, tcPass)
        SELECT users
        LOCATE FOR ALLTRIM(username) = tcUser AND ALLTRIM(password) = tcPass
        RETURN FOUND()
    ENDFUNC
ENDDEFINE
```
*
