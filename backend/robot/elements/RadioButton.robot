*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://demoqa.com/radio-button

*** Test Cases ***
SeleccionarOpcionesRadio
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://label[@for='yesRadio']    timeout=10s
    ${yes_selected} =    Run Keyword And Return Status    Page Should Contain Element    xpath://input[@id='yesRadio'][@checked='checked']
    Run Keyword If    ${yes_selected} == False
    ...    Click Element    xpath://label[@for='yesRadio']    # Seleccionar "Yes" solo si no está seleccionado
    Wait Until Element Is Visible    xpath://label[@for='impressiveRadio']    timeout=10s
    ${impressive_selected} =    Run Keyword And Return Status    Page Should Contain Element    xpath://input[@id='impressiveRadio'][@checked='checked']
    Run Keyword If    ${impressive_selected} == False
    ...    Click Element    xpath://label[@for='impressiveRadio']    # Seleccionar "Impressive" solo si no está seleccionado
    Wait Until Element Is Visible    xpath://label[@for='yesRadio']    timeout=10s
    ${yes_selected_again} =    Run Keyword And Return Status    Page Should Contain Element    xpath://input[@id='yesRadio'][@checked='checked']
    Run Keyword If    ${yes_selected_again} == False
    ...    Click Element    xpath://label[@for='yesRadio']    # Volver a seleccionar "Yes" solo si no está seleccionado
    Sleep    10s    # Esperar 10 segundos
    Close Browser
# este fue funciona super bien