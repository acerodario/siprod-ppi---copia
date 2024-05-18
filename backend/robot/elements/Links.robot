*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://demoqa.com/links

*** Test Cases ***
AbrirEnlacesYCerrarVentana
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    3s
    Click Element    //a[@id='simpleLink']
    Sleep    3s
    Switch Window    NEW
    Close Window
    Switch Window    MAIN
    Click Element    //a[@id='dynamicLink']
    Sleep    3s
    Switch Window    NEW
    Close Window
    Switch Window    MAIN
    Click Element    //a[@id='created']
    Sleep    3s
    Execute JavaScript    window.scrollBy(0, 500)  # Desplazarse hacia abajo 500 píxeles
    Sleep    3s
    Click Element    //a[@id='no-content']
    Sleep    3s
    Click Element    //a[@id='moved']
    Sleep    3s
    Click Element    //a[@id='bad-request']
    Sleep    3s
    Click Element    //a[@id='unauthorized']
    Sleep    3s
    Click Element    //a[@id='forbidden']
    Sleep    3s
    Click Element    //a[@id='invalid-url']
    Sleep    3s
    Close Browser
#funcionaaaaaaaaaaaaaaaa