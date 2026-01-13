```foxpro
*---------------------------------------
* Validation Module
*---------------------------------------

FUNCTION ValidateAccountNumber(tcAccountNo)
    * Validate account number format (10 digits)
    IF LEN(ALLTRIM(tcAccountNo)) <> 10
        RETURN .F.
    ENDIF
    
    IF NOT ISDIGIT(tcAccountNo)
        RETURN .F.
    ENDIF
    
    RETURN .T.
ENDFUNC

FUNCTION ValidateAmount(tnAmount)
    * Validate transaction amount
    IF tnAmount <= 0
        RETURN .F.
    ENDIF
    
    IF tnAmount > 1000000
        MESSAGEBOX("Amount exceeds maximum limit", 48, "Validation")
        RETURN .F.
    ENDIF
    
    RETURN .T.
ENDFUNC

FUNCTION ValidateDate(tdDate)
    * Validate date is not in future
    IF tdDate > DATE()
        RETURN .F.
    ENDIF
    RETURN .T.
ENDFUNC

PROCEDURE CheckBalance
    PARAMETERS tcAccountNo, tnAmount
    LOCAL lnBalance
    
    SELECT accounts
    LOCATE FOR account_no = tcAccountNo
    
    IF FOUND()
        lnBalance = accounts.balance
        IF lnBalance < tnAmount
            MESSAGEBOX("Insufficient balance", 16, "Error")
            RETURN .F.
        ENDIF
    ELSE
        MESSAGEBOX("Account not found", 16, "Error")
        RETURN .F.
    ENDIF
    
    RETURN .T.
ENDPROC
```

* test change
* test change
* test change
* test change
* test changes
* test change
* test, change
* test change
* testchanges
* test changess
* test change1
* test1
