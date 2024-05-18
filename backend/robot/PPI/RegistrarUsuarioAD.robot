*** Settings ***
Library  Selenium2Library

*** Variables ***
${navegador}    Chrome
${localhost}    http://localhost:5173/

*** Test Cases ***
abrir ventana de administrador y crear usuario como Admin
    Open Browser    ${localhost}   ${navegador}
    Abrir admin
    Close All Browsers

*** Keywords ***
Abrir admin
    Click Element    class