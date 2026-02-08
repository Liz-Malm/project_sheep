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
      #Alert Should Be Present    You must be logged in to purchase tickets.
      Handle Alert    ACCEPT

Logga in
    [Arguments]    ${username}    ${password}
        Input Text    id:login-username    ${username}
        Input Text    id:login-password    ${password}
Tryck login
        Click Button    Login
        Wait Until Page Contains Element    id:login-message
        Sleep    5 seconds
