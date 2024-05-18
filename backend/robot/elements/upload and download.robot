*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${BROWSER}         Chrome
${URL}             https://demoqa.com/elements

*** Test Cases ***
test
    abrir_nav
    imagen
    Close Browser

*** Keywords ***

abrir_nav
    Open Browser    ${URL}    ${BROWSER}

imagen
    Execute JavaScript    window.scrollTo(0, 200);
    Click Element    id:item-7
    Sleep    3s
    Execute JavaScript    window.scrollTo(0, 200);
    Choose File    id=uploadFile    C:\\Users\\Brahyan\\Documents\\DibujosKrita\\dibujoTerminado\\gojo.png
    Sleep    3s
    Click Element    id:downloadButton
    Sleep    3s
    Close Browser
