*** Settings ***

Resource    SheepCodeAB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Bokning av familjeresa.
    [Tags]    [TS-02.1]   Reseledare
    [Documentation]    Van parkbesökare bokar resa
    
    Klicka på "Register"
       
        Input Text    id:reg-username    MrAndersson
        Input Text    id:reg-password    B3stF8m1ly
        Click Button    Register

    Klicka på "Login"
    
        Input Text    id:login-username    MrAndersson
        Input Text    id:login-password    B3stF8m1ly
        Click Button    Login
        Sleep    2 seconds

    Klicka På "Buy Tickets"
        Välj Biljettyp2    Child    VIP    2
        Välj Biljettyp2    Adult    Regular    2

    Klicka på "Cart"
        Sleep    5 seconds
        Click Button    id:checkout-button
        Sleep    1 seconds
        Handle Alert    ACCEPT
        Sleep    2 seconds