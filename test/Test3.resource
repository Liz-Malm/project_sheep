*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:8000/jurap.html
${BROWSER}    chrome

*** Keywords ***
Öppna startsidan och kontrollera titel
        Open Browser    ${URL}    ${BROWSER}
        Title Should Be    Jura-Stina-Kalle Park
        Maximize Browser Window
        Set Selenium Speed    0.5s

Klicka på Park Map
    Click Link    Park Map

Inspektera Karta
    Click Element    css=area[data-zone="herbivore-haven"]
    Sleep    3s
    Click Element    css=area[data-zone="raptor-valley"]
    Sleep    3s
    Click Element    css=area[data-zone="carnivore-zone"]
    Sleep    3s

Klicka på Dino Alerts
    Click Link    Dino Alerts
    Sleep    3s
Inspektera Dino Alerts
    Click Element    xpath=//body
    Press Keys       NONE    PAGE_DOWN
    Scroll Element Into View    xpath=/html/body/main/article[7]/section/div/div[2]
    Sleep    3s
    Scroll Element Into View    xpath=/html/body/main/article[7]/section/div/div[3]
    Sleep    3s

Klicka På Book Safaris
    Click Link    Book Safaris

Välj Datum
    Wait Until Element Is Enabled    id:safari-date    timeout=5s
    Click Element    id:safari-date
    Press Keys       id:safari-date    2026
    Press Keys       id:safari-date    ARROW_RIGHT
    Press Keys       id:safari-date    03
    Press Keys       id:safari-date    ARROW_RIGHT
    Press Keys       id:safari-date    24
    Press Keys       id:safari-date    TAB

Välj Safarityp
    Select From List By Value    id:safari-type    T-Rex Rumble eXtreme Thrill Pack
    Sleep    3s

Klicka på Add to Cart
    Click Element    xpath=(//button[normalize-space()='Add to Cart'])[last()]
    Sleep    2s

Stäng Pop-Up
    Handle Alert    ACCEPT
    Sleep    2s