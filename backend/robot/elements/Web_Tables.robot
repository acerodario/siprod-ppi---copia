*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BROWSER}    Chrome
${URL}        https://demoqa.com/webtables

*** Test Cases ***
AgregarRegistrosDesdeLista
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${registros}    Create List
    ...    John Doe john.doe@example.com 30 50000 IT
    ...    Alice Smith alice.smith@example.com 25 60000 HR
    ...    Bob Johnson bob.johnson@example.com 35 70000 Finance
    ...    Emma Brown emma.brown@example.com 28 55000 Sales
    # Iterar sobre los registros y agregarlos
    FOR    ${registro}    IN    @{registros}
        Click Element    xpath://button[@id='addNewRecordButton']    # Hacer clic en el botón "Add"
        Wait Until Element Is Visible    id:firstName    timeout=10s    # Esperar a que aparezca el formulario de ingreso de datos
        ${datos}    Evaluate    "${registro}".split()    # Dividir los datos del registro utilizando split()
        Input Text    id:firstName    ${datos}[0]    # Ingresar nombre
        Input Text    id:lastName    ${datos}[1]    # Ingresar apellido
        Input Text    id:userEmail    ${datos}[2]    # Ingresar correo electrónico
        Input Text    id:age    ${datos}[3]    # Ingresar edad
        Input Text    id:salary    ${datos}[4]    # Ingresar salario
        Input Text    id:department    ${datos}[5]    # Ingresar departamento
        Click Element    id:submit    # Hacer clic en el botón "Submit"
        Wait Until Element Is Visible    xpath://div[@class='action-buttons']//span[@title='Delete']    timeout=10s    # Esperar a que aparezca el botón de eliminar
        # Hacer clic en el botón de eliminar manualmente con dicional
        Run Keyword If    '${registro}' == '${registros[0]}'    Click Element    xpath://div[@class='action-buttons']//span[@title='Delete']
    END
    Input Text    id:searchBox    John    # Ingresar el texto a buscar en la barra de búsqueda
    Sleep    10s    # Esperar 10 segundos
    Close Browser
#este fueeeeee