*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://demoqa.com/dynamic-properties
${BROWSER}      Chrome

*** Test Cases ***
Interactuar con Elementos Dinámicos
    Abrir el Navegador Hacia la Página
    Esperar a que el Botón se Habilite
    Cambiar el Color del Botón
    Esperar a que el Botón sea Visible
    Cerrar el Navegador

*** Keywords ***
Abrir el Navegador Hacia la Página
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Esperar a que el Botón se Habilite
    Wait Until Element Is Enabled    xpath://button[@id="enableAfter"]
    Log    El botón "Will enable 5 seconds" se ha habilitado.

Cambiar el Color del Botón
    Wait Until Element Is Visible    xpath://button[@id="colorChange"]
    Mouse Over    xpath://button[@id="colorChange"]
    Log    El color del botón "Color Change" ha cambiado al pasar el ratón sobre él.

Esperar a que el Botón sea Visible
    Wait Until Element Is Visible    xpath://button[@id="visibleAfter"]
    Log    El botón "Visible After 5 Seconds" es visible.

Cerrar el Navegador
    Close Browser
