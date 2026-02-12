*** Settings ***
Resource    VG_AB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Registrera Användare
    [Tags]    VG_AB    Buy    Negative
    [Documentation]    Nödvändigt för att kunna logga in.
    Klicka på Register
    Användaruppgifter    nytt_username=TestNeg    nytt_password=12341234
    Tryck Registrera    Registration successful! Redirecting to login...
     
Logga in
    [Tags]    VG_AB     Buy    Negative
    [Documentation]    Nödvändigt för att kunna lägga i varukorgen
    Logga In    username=TestNeg    password=12341234
    Tryck Login
Skriv in felaktigt datum
    [Tags]    VG_AB     Buy    Negative
    Klicka på "Book Safari"
    Välj Datum