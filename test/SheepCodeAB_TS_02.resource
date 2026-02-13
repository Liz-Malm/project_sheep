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
     
Klicka på "Register"
    Click Element    id:register-nav

Fyll i användaruppgifter reg
   Input Text    id:reg-username    MrAndersson
   Input Text    id:reg-password    B3stF8m1ly

Fyll i användaruppgifter log
    Input Text    id:login-username    MrAndersson
    Input Text    id:login-password    B3stF8m1ly

Klicka på "Buy Tickets"
    Click Element    id:tickets-nav

Klicka på "Login"
    Click Element    id:login-nav

Klicka på "Cart"
    Click Element    id:cart-nav

Välj biljettyp
    [Arguments]    ${biljettyp}    ${kategori}    ${antal}
      Select From List By Value    id:ticket-type    ${biljettyp}
      Select From List By Value    id:ticket-category    ${kategori}
      Input Text    id:ticket-quantity    ${antal}
      Sleep    1 seconds
      Click Button    Add to Cart
      Sleep    2 seconds
      Handle Alert    ACCEPT