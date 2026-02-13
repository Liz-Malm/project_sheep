*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}           http://localhost:8000/jurap.html
${BROWSER}       chrome

*** Keywords ***
Besökare navigerar till KallePark
    Open Browser    ${BASE_URL}    ${BROWSER}
     Maximize Browser Window
     Set Selenium Speed    0.1 seconds

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
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id:login-section
        IF    not ${is_visible}
            Click Link    Login
            Wait Until Element Is Visible    id:login-section    timeout=5s
      END
        Input Text    id:login-username    ${username}
        Input Text    id:login-password    ${password}
Tryck login
        Click Button    Login
        Wait Until Page Contains Element    id:login-message
        Sleep    5 seconds

Klicka på Register
        Click Element    id:register-nav
Användaruppgifter
    [Arguments]    ${nytt_username}    ${nytt_password}
        Input Text    id:reg-username    ${nytt_username}
        Input Text    id:reg-password    ${nytt_password}
Tryck Registrera
    [Arguments]    ${förväntat_svar}
        Click Button    Register
        Wait Until Page Contains    ${förväntat_svar}
        IF    '${förväntat_svar}' == 'Registration successful! Redirecting to login...'
        Wait Until Element Is Visible    id:login-section    timeout=5s
        Element Should Contain    id:login-section    Login
        END

Logga in igen
        [Arguments]    ${nytt_username}    ${nytt_password}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id:login-section
        IF    not ${is_visible}
            Click Link    Login
            Wait Until Element Is Visible    id:login-section    timeout=5s
      END
        Input Text    id:login-username    ${nytt_username}
        Input Text    id:login-password    ${nytt_password}

Tryck login igen
        Click Button    Login
        #Wait Until Page Contains Element    id:login-message
        Wait Until Page Contains Element    id:home-section
        Sleep    2s

Gå till varukorg
    Click Link    Cart
    Sleep    5s
Ta bort biljetter
    Click Button    css:button[onclick="removeFromCart(0)"]
    Sleep    4s
    Click Button    id:checkout-button