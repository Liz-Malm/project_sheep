*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}           http://localhost:8000/jurap.html
${BROWSER}       chrome

*** Keywords ***
Besökare navigerar till KallePark
    Open Browser    ${BASE_URL}    ${BROWSER}
     Maximize Browser Window
     Set Selenium Speed    1 seconds
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
        Input Text    id:login-username    ${username}
        Input Text    id:login-password    ${password}
Tryck login
        Click Button    Login
        Wait Until Page Contains Element    id:login-message
        Sleep    5 seconds
Klicka på "Book Safari"
    Click Element    id:safari-nav
Välj datum
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    #Input Text    id:safari-date    2026-03-24    clear
    #Clear Element Text    id:safari-date
    #Input Text            id:safari-date    20262402
    Clear Element Text    id:safari-date
    Input Text            id:safari-date    03242026
    Press Keys            id:safari-date    ENTER
    Sleep    10s

