*** Settings ***
Resource    VG_AB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Registrera Användare
    [Tags]    VG_AB    Buy    Setup
    [Documentation]    Nödvändigt för att kunna logga in.
    Klicka på Register
    Användaruppgifter    nytt_username=TestNeg    nytt_password=12341234
    Tryck Registrera    Registration successful! Redirecting to login...
     
Logga in
    [Tags]    VG_AB     Buy    Setup
    [Documentation]    Nödvändigt för att kunna lägga i varukorgen
    Logga In    nytt_username=TestNeg    nytt_password=12341234
    Tryck Login
Köp en vanligbiljett
    [Tags]    VG_AB     Buy    Setup
    [Documentation]    Nödvändigt för att kunna köpa safaritur
      Klicka på "Buy Tickets"
    Välj biljettyp    biljettyp=Child    kategori=VIP    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    1    #Välj antal biljetter
    Lägg i varukorgen

Test av korrekt datumfält
    [Tags]    VG_AB     Date    Positive
    [Documentation]    testar att skriva in ett korrekt datum
    Klicka på Book Safari
    Välj Korrekt Datum    datum=12032026
Välj förtidigt datum
    [Tags]    VG_AB     Date    Negative
    [Documentation]    testar att skriva in olika datum i dåtid,
    Klicka på Book Safari
    Välj Förtidigt Datum    datum=12032024
    Felmeddelande    You cannot book a safari for a date in the past.
Välj datum år 3026
    [Tags]    VG_AB     Date    Negative
    [Documentation]    testar att skriva framtid år 3026
    Klicka på Book Safari
    Välj Datum År 3026    datum=12033026
    
Välj annat datumformat EU
    [Tags]    VG_AB     Date    Negative    bugg
    [Documentation]    testar att skriva datumformat i Europeisk standard
    ...    BUGG. Sidan kommer att släppa igenom ett datum som ser ut 02/02/60330
    Klicka på Book Safari
    Välj Datumformat EU    datum=20260330
    Felmeddelande    #Denna kommer att fallera då jag lyckas få in ett felaktigt datum. och det bör vara en varning.

Välj datumformat GB
    [Tags]    VG_AB     Date    Negative
    [Documentation]    testar att skriva datumformat i brittisk standard
    ...    BUGG. Sidan kommer att släppa igenom ett datum som ser ut 02/06/92026
    Klicka på Book Safari
    Välj Datumformat GB    datum=26092026
    Felmeddelande    #Denna kommer att fallera då jag lyckas få in ett felaktigt datum. och det bör vara en varning.