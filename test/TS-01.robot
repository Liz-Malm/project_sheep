*** Settings ***
Resource    SheepCodeAB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Bokning av safari.
    [Tags]    [TS-01.1]   Reseledare    [G-PS]
    [Documentation]    Reseledaren beställer 12 biljetter och safari
    Klicka på "Buy Tickets"
    Välj biljettyp    Child    VIP    #Regular eller VIP
    Välj Antal    1000
    Välj Antal    -1
    Välj Antal    0
    Välj antal    8
    Lägg i varukorgen

    
