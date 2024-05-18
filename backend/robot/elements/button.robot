*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${URL}               https://demoqa.com/buttons
${BROWSER}           Chrome
${right_click_locator}  //*[@id="rightClickBtn"]
${click_locator}    //button[text()='Click Me']  # Selector del botón "Click Me"

*** Test Cases ***
Right Click Test
    Abrir el Navegador Hacia la Página
    Double Click Element    id=doubleClickBtn
    Sleep    3s
    Simulate Right Click    ${right_click_locator}
    Sleep    3s
    Hacer Clic en el Botón

*** Keywords ***
Simulate Right Click
    [Arguments]    ${locator}
    Execute JavaScript
    ...    var element = document.evaluate('${locator}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    element.dispatchEvent(new MouseEvent('contextmenu', {
    ...        bubbles: true,
    ...        cancelable: true,
    ...        view: window
    ...    }));

Abrir el Navegador Hacia la Página
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Hacer Clic en el Botón
    Scroll hacia abajo
    Click Element    ${click_locator}

Scroll hacia abajo
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
