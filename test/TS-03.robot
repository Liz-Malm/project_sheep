*** Settings ***
Resource    Test3.resource
Suite Setup    Öppna startsidan och kontrollera titel
Suite Teardown    Close Browser

*** Test Cases ***
Kolla Kartan
    [Tags]    [TS-03.1]
    [Documentation]    Barnet klickar runt på kartan
    Klicka På Park Map
    Inspektera Karta

Kolla Dino Alerts
    [Tags]    [TS-03.2]
    [Documentation]    Barnet kollar in Dino Alerts
    Klicka På Dino Alerts
    Inspektera Dino Alerts

Försök Boka Safari
    [Tags]    [TS-03.3]
    [Documentation]    Barnet försöker boka Safari
    Klicka På Book Safaris
    Välj Datum
    Välj Safarityp
    Klicka På Add To Cart
    Stäng Pop-Up