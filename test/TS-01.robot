*** Settings ***
Resource    SheepCodeAB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Bokning av biljett.
    [Tags]    [TS-01.1]   Reseledare    [G-PS]
    [Documentation]    Reseledaren beställer X antal biljetter av en viss typ
    Klicka på "Buy Tickets"
    Välj biljettyp    biljettyp=Child    kategori=VIP    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    88    #Välj antal biljetter
    Välj antal    8    #Välj antal biljetter
    Lägg i varukorgen
    
Logga in
    [Tags]    [TS-01.2]    Reseledare    [G-PS]
    [Documentation]    Reseledaren har blivit skickad till login-sidan.
    Logga In    username="reseledaren@company.se"     password=1234
    Tryck Login
