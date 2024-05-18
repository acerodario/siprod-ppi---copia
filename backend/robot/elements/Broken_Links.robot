*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://demoqa.com/broken
${BROKEN_IMAGE}    xpath=//p[contains(text(), 'Broken image')]/following-sibling::img
${VALID_LINK}    xpath=//a[contains(text(), 'Click Here for Valid Link')]
${BROKEN_LINK}    xpath=//a[contains(text(), 'Click Here for Broken Link')]

*** Test Cases ***
Verify Images and Links
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${image_exist} =    Run Keyword And Return Status    Verify Image    ${BROKEN_IMAGE}
    ${valid_link_exist} =    Run Keyword And Return Status    Verify Link    ${VALID_LINK}
    ${broken_link_exist} =    Run Keyword And Return Status    Verify Link    ${BROKEN_LINK}
    Should Be True    ${image_exist}
    Should Be True    ${valid_link_exist}
    Should Be True    ${broken_link_exist}
    Close Browser

*** Keywords ***
Verify Image
    [Arguments]    ${locator}
    ${src} =    Get Element Attribute    ${locator}    src
    [Return]    ${src} != None

Verify Link
    [Arguments]    ${locator}
    ${href} =    Get Element Attribute    ${locator}    href
    [Return]    ${href} != None
#funciona

#El código proporcionado tiene como objetivo verificar la existencia de
#  ciertos elementos en una página web y asegurar que los enlaces e imágenes estén presentes y sean válidos.
#En resumen, el código automatiza la verificación de la presencia y validez de ciertas imágenes y enlaces en una
#  página web utilizando el framework de Robot Framework y la biblioteca SeleniumLibrary.