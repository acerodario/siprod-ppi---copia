*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://demoqa.com/login
${PAUSE_TIME}     1s

*** Test Cases ***
Registro y Login en DemoQA
    Abrir el navegador y cargar la página
    Scroll hacia abajo
    Llenar formulario de registro
    Click Element    xpath=//button[@id='register']
    Esperar a la redirección
    Volver al formulario de inicio de sesión
    Llenar formulario de inicio de sesión
    Click Element    xpath=//button[@id='login']  # Agregamos el clic en el botón de inicio de sesión
    Esperar 10 segundos
    Cerrar la ventana después de 30 segundos

*** Keywords ***
Abrir el navegador y cargar la página
    Open Browser    ${URL}    ${BROWSER}

Scroll hacia abajo
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

Llenar formulario de registro
    Click Element    xpath=//button[@id='newUser']
    Input Text    xpath=//input[@id='firstname']    acero
    Input Text    xpath=//input[@id='lastname']    TuApelliacero
    Input Text    xpath=//input[@id='userName']    TuUserName16dario
    Input Text    xpath=//input[@id='password']    P@ssw0rd!
    Scroll hacia abajo

Esperar a la redirección
    Wait Until Page Contains Element    xpath=//button[@id='gotologin']

Volver al formulario de inicio de sesión
    Click Element    xpath=//button[@id='gotologin']

Llenar formulario de inicio de sesión
    Input Text    xpath=//input[@id='userName']    TuUserName12
    Input Text    xpath=//input[@id='password']    P@ssw0rd!

Esperar 10 segundos
    Sleep    10s

Cerrar la ventana después de 30 segundos
    Sleep    3s  # Espera adicional después de llenar el formulario
    Close Browser
