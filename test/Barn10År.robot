*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://localhost:8000/jurap.html
${BROWSER}    chrome
${DOWNLOAD_DIR}    ${CURDIR}{/}downloads
${IMAGE_NAME}    testbild.png

*** Keywords ***
Öppna webbläsare med download-mapp
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method    ${options}    add_experimental_option
        ...    prefs
        ...    {"download.default_directory": "${DOWNLOAD_DIR}",
        ...    "download.prompt_for_download": False,
        ...    "directory_upgrade": True
        
        Create Diirectory    ${DOWNLOAD_DIR}
        Open Browser    ${URL}    ${BROWSER}    options=${options}
        
*** Keywords ***
Vänta tills bilden laddats ner
    Wait Until Keyword Succeeds    10x    1s
    ...    File Should Exist    ${DOWNLOAD_DIR}${/}${IMAGE_NAME}
        
        
*** Test Cases ***
Ladda ner bild och verifiera fil
        Öppna Webbläsare Med Download-mapp
        
        Click Element    css=a#download-image
        Vänta tills bilden laddats ner
        
        File Should Exist    ${DOWNLOAD_DIR}${/}${IMAGE_NAME}
        
        Close Browser

*** Test Cases ***
Öppna startsidan och kontrollera titel
        Open Browser    ${URL}    ${BROWSER}
        Title Should Be    Jura-Stina-Kalle Park
        Close Browser

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
        Set Selenium Speed    1s

Klicka på Park Map
    Click Link    Park Map

Inspektera Karta
    #Click Element    xpath=//area[@coords="250,100,350,180"]
    Click Element    css=area[data-zone="herbivore-haven"]
    Sleep    3s
    Click Element    css=area[data-zone="raptor-valley"]
    Sleep    3s
    Click Element    css=area[data-zone="carnivore-zone"]
    Sleep    3s
    #Click Element    css=area[data-zone="night-exhibit"]
    #Sleep    5s

Klicka på Dino Alerts
    Click Link    Dino Alerts
    Sleep    3s
Inspektera Dino Alerts
    #Press Key    xpath=//body    PAGE_DOWN
    Click Element    xpath=//body
    Press Keys       NONE    PAGE_DOWN
    Scroll Element Into View    xpath=/html/body/main/article[7]/section/div/div[2]
    Sleep    3s
    #Scroll Element Into View    id:dino-alerts-container
    Scroll Element Into View    xpath=/html/body/main/article[7]/section/div/div[3]
    Sleep    3s

Klicka På Book Safaris
    Click Link    Book Safaris

Välj Datum
    Wait Until Element Is Enabled    id:safari-date    timeout=10s
    #Input Text    id:safari-date    2026-03-24    clear
    #Clear Element Text    id:safari-date
    #Input Text            id:safari-date    20262402
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
    # Wait Until Element Is Not Visible    xpath=//div[@class='modal']    timeout=10s
    # Click Button    xpath=//button[text()='Add to Cart']
    #${count}=    Get Element Count    xpath=//button[text()='Add to Cart']
    # Log To Console    Antal knappar: ${count}
    Click Element    xpath=(//button[normalize-space()='Add to Cart'])[last()]

Stäng Pop-Up
    Handle Alert    ACCEPT