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
    Logga In    nytt_username=TestNeg    nytt_password=12341234
    Tryck Login
Köp en vanligbiljett
    [Tags]    VG_AB     Buy    Negative
    [Documentation]    Nödvändigt för att kunna köpa safaritur
      Klicka på "Buy Tickets"
    Välj biljettyp    biljettyp=Child    kategori=VIP    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    1    #Välj antal biljetter
    Lägg i varukorgen

Test av korrekt datumfält
    [Tags]    VG_AB     Buy    Negative
    [Documentation]    testar att skriva in ett korrekt datum
    Klicka på Book Safari
    Välj Korrekt Datum    datum=12032026
Välj förtidigt datum
    [Documentation]    testar att skriva in olika datum i dåtid,
    Klicka på Book Safari
    Välj Förtidigt Datum    datum=12032024
    Felmeddeland    You cannot book a safari for a date in the past.
Välj datum år 3026
    [Documentation]    testar att skriva framtid år 3026
    Klicka på Book Safari
    Välj Datum År 3026    datum=12033026
    
    