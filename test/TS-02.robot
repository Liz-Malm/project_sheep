*** Settings ***

Resource    SheepCodeAB_TS_02.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Skapa konto
    [Tags]    [TS-02.1]   Van parkbesökare
    [Documentation]    Van parkbesökare bokar resa
    
    Klicka på "Register"
       
        Input Text    id:reg-username    MrAndersson
        Input Text    id:reg-password    B3stF8m1ly
        Click Button    Register

*** Test Cases ***
Logga in
    [Tags]    [TS-02.2]   Van parkbesökare
    [Documentation]    Van parkbesökare bokar resa

    Klicka på "Login"
    
        Input Text    id:login-username    MrAndersson
        Input Text    id:login-password    B3stF8m1ly
        Click Button    Login
        Sleep    2 seconds

*** Test Cases ***
Välj biljetter
    [Tags]    [TS-02.3]   Van parkbesökare
    [Documentation]    Van parkbesökare bokar resa

    Klicka På "Buy Tickets"
        Välj Biljettyp2    Child    VIP    2
        Välj Biljettyp2    Adult    Regular    2

*** Test Cases ***
Betala
    [Tags]    [TS-02.4]   Van parkbesökare
    [Documentation]    Van parkbesökare bokar resa

    Klicka på "Cart"
        Sleep    5 seconds
        Click Button    id:checkout-button
        Sleep    1 seconds
        Handle Alert    ACCEPT
        Sleep    2 seconds