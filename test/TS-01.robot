*** Settings ***
Resource    SheepCodeAB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Bokning av safari.
    [Tags]    [TS-01]   Reseledare    [G-PS]
    [Documentation]    Reseledaren beställer 12 biljetter och safari
    Klicka på "Buy Tickets"
    Välj biljettyp    Adult    Regular
    Välj antal    8
    Lägg i varukorgen
    Sleep    5 seconds
    
