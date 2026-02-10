*** Settings ***
Documentation    En reseledare med låg teknisk kunskap besöker sidan för första gången för att boka biljetter åt 
...  ett resesälskap bestående av olika ålderskategorier.
Resource    SheepCodeAB.resource
Suite Setup    Besökare navigerar till KallePark
Suite Teardown    Close Browser

*** Test Cases ***
Bokning av biljett.
    [Tags]    [TS-01.1]   Reseledare    [G-PS]
    [Documentation]    Reseledaren beställer X antal biljetter av en viss typ
    Klicka på "Buy Tickets"
    Välj biljettyp    biljettyp=Child    kategori=VIP    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    88    #Välj antal biljetter
    Välj antal    8    #Välj antal biljetter
    Lägg i varukorgen
    
Logga in
    [Tags]    [TS-01.2]    Reseledare    [G-PS]
    [Documentation]    Reseledaren har blivit skickad till login-sidan.
    Logga In    username=reseledaren@company.se     password=1234
    Tryck Login

Registrera ny användare
    [Tags]    [TS-01.3]    Reseledare    [G-PS]
    [Documentation]    Reseledare lyckas lokalisera registrera ny användare funktionen.
    Klicka på Register
    Användaruppgifter    nytt_username=Lisa    nytt_password=1234
    Tryck Registrera    Password must be at least 8 characters long.
     Användaruppgifter    nytt_username=Lisa    nytt_password=12341234
     Tryck Registrera    Registration successful! Redirecting to login...
     
Logga in igen
    [Tags]    [TS-01.4]    Reseledare    [G-PS]
    [Documentation]    Reseledaren försöker logga in och försöker boka biljetter.
    Logga in igen   nytt_username=Lisa    nytt_password=12341234
    Tryck Login Igen
    Klicka På "Buy Tickets"
    Klicka på "Buy Tickets"
    Välj biljettyp    biljettyp=Child    kategori=VIP    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    4    #Välj antal biljetter
    Lägg i varukorgen
    Välj biljettyp    biljettyp=Adult    kategori=VIP    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    4    #Välj antal biljetter
    Lägg i varukorgen
     Välj biljettyp    biljettyp=Senior    kategori=Regular    #Adult,Child,Senior   #Regular eller VIP
    Välj antal    2    #Välj antal biljetter
    Lägg i varukorgen