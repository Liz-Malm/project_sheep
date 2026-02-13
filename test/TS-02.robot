*** Settings ***

Resource    SheepCodeAB_TS_02.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Skapa konto
    [Tags]    [TS-02.1]   Van parkbesökare
    [Documentation]    Kund skapar ett konto på KallePark
    
    Klicka på "Register"
    Fyll i användaruppgifter reg

    Click Button    Register

*** Test Cases ***
Logga in
    [Tags]    [TS-02.2]   Van parkbesökare
    [Documentation]    Kund loggar in

    Klicka på "Login"
    Fyll i användaruppgifter log

    Click Button    Login
    Sleep    2 seconds

*** Test Cases ***
Välj biljetter
    [Tags]    [TS-02.3]   Van parkbesökare
    [Documentation]    Kund väljer biljetter

    Klicka På "Buy Tickets"
        Välj Biljettyp    Child    VIP    2
        Välj Biljettyp    Adult    Regular    2

*** Test Cases ***
Betala
    [Tags]    [TS-02.4]   Van parkbesökare
    [Documentation]    Kund betalar

    Klicka på "Cart"
        Sleep    5 seconds
        Click Button    id:checkout-button
        Sleep    1 seconds
        Handle Alert    ACCEPT
        Sleep    2 seconds