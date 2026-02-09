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

Klicka på "Register"
    Click Element    id:register-nav

Klicka på "Login"
    Click Element    id:login-nav

Klicka på "Cart"
    Click Element    id:cart-nav

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


Välj biljettyp2
    [Arguments]    ${biljettyp}    ${kategori}    ${antal}
      Select From List By Value    id:ticket-type    ${biljettyp}
      Select From List By Value    id:ticket-category    ${kategori}
      Input Text    id:ticket-quantity    ${antal}
      Sleep    1 seconds
      Click Button    Add to Cart
      Sleep    2 seconds
      Handle Alert    ACCEPT