```foxpro
*---------------------------------------
* Account Statement Report
*---------------------------------------

PROCEDURE GenerateStatement
    PARAMETERS tcAccountNo, tdStartDate, tdEndDate
    
    * Open required tables
    USE accounts IN 0 SHARED
    USE transactions IN 0 SHARED
    
    SELECT transactions
    SET RELATION TO account_no INTO accounts
    
    * Filter transactions
    SELECT transactions.trans_id, ;
           transactions.trans_date, ;
           transactions.trans_type, ;
           transactions.amount, ;
           transactions.balance, ;
           accounts.account_name ;
      FROM transactions ;
      INNER JOIN accounts ON transactions.account_no = accounts.account_no ;
      WHERE transactions.account_no = tcAccountNo ;
        AND transactions.trans_date BETWEEN tdStartDate AND tdEndDate ;
      ORDER BY transactions.trans_date ;
      INTO CURSOR curStatement
    
    * Generate report
    IF _TALLY > 0
        REPORT FORM statement_template TO PRINTER PROMPT NOCONSOLE
    ELSE
        MESSAGEBOX("No transactions found for specified period", 48, "Information")
    ENDIF
    
    USE IN curStatement
    USE IN transactions
    USE IN accounts
ENDPROC

FUNCTION CalculateRunningBalance(tcAccountNo)
    LOCAL lnBalance, lnRunningBalance
    
    SELECT transactions
    SCAN FOR account_no = tcAccountNo ORDER BY trans_date
        IF trans_type = "CREDIT"
            lnRunningBalance = lnRunningBalance + amount
        ELSE
            lnRunningBalance = lnRunningBalance - amount
        ENDIF
        
        REPLACE balance WITH lnRunningBalance
    ENDSCAN
    
    RETURN lnRunningBalance
ENDFUNC
```
* test change
* testingingg
