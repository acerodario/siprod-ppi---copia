*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://demoqa.com/interaction
${BROWSER}        Chrome
${FULL_NAME}      John Doe
${EMAIL}          john.doe@example.com
${CURRENT_ADDRESS}    123 Main Street
${PERMANENT_ADDRESS}   456 Elm Street
${WAIT_TIME}      10s

*** Test Cases ***
Fill Form on DemoQA
    [Documentation]    Llena el formulario en la página DemoQA
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath://*[text()='Elements']
    Click Element    xpath://*[text()='Text Box']
    Input Text    id=userName    ${FULL_NAME}
    Input Text    id=userEmail    ${EMAIL}
    Input Text    id=currentAddress    ${CURRENT_ADDRESS}
    Input Text    id=permanentAddress    ${PERMANENT_ADDRESS}
    Scroll Page Down
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Click Button    id=submit
    Sleep    ${WAIT_TIME}    # Esperar ${WAIT_TIME} antes de cerrar el navegador
    Close Browser

*** Keywords ***
Scroll Page Down
    [Documentation]    Desplaza la página hacia abajo
    Scroll Element Into View    id=submit    # Desplaza el botón "Submit" a la vista aqui aplicamos el custom 
#funciona 1000 de 10