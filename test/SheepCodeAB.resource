*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}           http://localhost:8000/jurap.html
${BROWSER}       chrome

*** Keywords ***
Besökare navigerar till KallePark
    Open Browser    ${BASE_URL}    ${BROWSER}
     Maximize Browser Window
     Set Selenium Speed    0.5 seconds

Klicka på "Buy Tickets"
    Click Element    id:tickets-nav

Välj biljettyp
    [Arguments]    ${biljettyp}    ${kategori}
      Select From List By Value    id:ticket-type    ${biljettyp}
      Select From List By Value    id:ticket-category    ${kategori}
Välj antal
    [Arguments]    ${antal}
      Input Text    id:ticket-quantity    ${antal}
      Sleep    1 seconds
Lägg i varukorgen
      Click Button    //*[@id="ticket-form"]/button
      Sleep    2 seconds
      Handle Alert    ok
        
