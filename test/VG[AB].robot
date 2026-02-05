*** Settings ***
Resource    SheepCodeAB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
[Tags]    [VG-AB]    Buy    Negative
