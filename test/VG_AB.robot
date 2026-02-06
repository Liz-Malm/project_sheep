*** Settings ***
Resource    VG_AB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Skriv in felaktigt datum
    [Tags]    [VG-AB]    Buy    Negative
    Klicka på "Book Safari"