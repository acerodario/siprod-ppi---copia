*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${BROWSER}         Chrome
${URL}             https://demoqa.com/elements
${CHECK_BOX}       id:item-1
${HOME_LINK}       xpath://span[text()='Home']
${HOME}            xpath://span[@class='rct-title' and text()='Home']
${MAX_CLICKS}      5

*** Test Cases ***
Click_Home_Test
    Open Browser    ${URL}    ${BROWSER}
    Click Element   ${CHECK_BOX}
    Sleep    5s    # Esperar 5 segundos
    ${clicks_remaining}=    Set Variable    ${MAX_CLICKS}
    FOR    ${index}    IN RANGE    ${MAX_CLICKS}
        ${clicks_remaining}=    Evaluate    int(${clicks_remaining}) 
        Run Keyword If    ${clicks_remaining} > 0    Click Home Element
    END

*** Keywords ***
Click Home Element
    Wait Until Element Is Visible    ${HOME_LINK}    timeout=10s
    Click Element    ${HOME_LINK}
#este fueeeeeeeeeeee