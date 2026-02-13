*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}           http://localhost:8000/jurap.html
${BROWSER}       chrome

*** Keywords ***
Besökare navigerar till KallePark
    Open Browser    ${BASE_URL}    ${BROWSER}
     Maximize Browser Window

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

Logga in
        [Arguments]    ${nytt_username}    ${nytt_password}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    id:login-section
        IF    not ${is_visible}
            Click Link    Login
            Wait Until Element Is Visible    id:login-section    timeout=5s
        END
        Input Text    id:login-username    ${nytt_username}
        Input Text    id:login-password    ${nytt_password}
Tryck login
        Click Button    Login
        Wait Until Page Contains Element    id:login-message
        Sleep    5 seconds

Klicka på "Buy Tickets"
    Click Element    id:tickets-nav
    #Set Selenium Speed    1 seconds

Välj biljettyp
    [Arguments]    ${biljettyp}    ${kategori}
      Select From List By Value    id:ticket-type    ${biljettyp}
      Select From List By Value    id:ticket-category    ${kategori}
Välj antal
    [Arguments]    ${antal}
      Input Text    id:ticket-quantity    ${antal}
      #Sleep    1 seconds
Lägg i varukorgen
      Click Button    //*[@id="ticket-form"]/button
      Handle Alert    ACCEPT
      Sleep    5s

Klicka på Book Safari
    Click Element    id:safari-nav
    Set Selenium Speed    0.5 seconds
    Sleep    2s
Välj korrekt datum
    [Arguments]    ${datum}
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    Clear Element Text    id:safari-date
    Input Text            id:safari-date    ${datum}
    Press Keys            id:safari-date    ENTER
    Sleep    2s
    Handle Alert    ACCEPT
Tryck Add to Cart
      Click Button    css:button[onclick="Add to Cart"]
Välj förtidigt datum
     [Arguments]    ${datum}
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    Clear Element Text    id:safari-date
    Input Text            id:safari-date    ${datum}
    Press Keys            id:safari-date    ENTER
    
Felmeddelande     #Hanterar felmeddelandet "You cannot book a safari for a date in the past."
    [Arguments]     ${förväntat_felmeddelande}
    
         Wait Until Element Is Visible    id:safari-message    timeout=5s
    Element Should Contain           id:safari-message    ${förväntat_felmeddelande}
Välj datum år 3026
    [Arguments]    ${datum}
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    Clear Element Text    id:safari-date
    Input Text            id:safari-date    ${datum}
    Press Keys            id:safari-date    ENTER
    Sleep    5s
    Handle Alert    ACCEPT

Välj datumformat EU
    [Arguments]    ${datum}
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    Clear Element Text    id:safari-date
    Input Text            id:safari-date    ${datum}
    Press Keys            id:safari-date    ENTER
    Sleep    5s
    Handle Alert    ACCEPT

Välj datumformat GB
    [Arguments]    ${datum}
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    Clear Element Text    id:safari-date
    Input Text            id:safari-date    ${datum}
    Press Keys            id:safari-date    ENTER
    Sleep    5s
    Handle Alert    ACCEPT