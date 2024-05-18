*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${navegador}    Chrome
${paginaInicial}    https://www.google.com/
${busqueda}    https://demoqa.com/automation-practice-form
${palabraB}    demoqa

#Variables del formulario
${nombre}    Carlos
${apellido}    Meneses
${correoElectronico}    carlosmeneses@gmail.com
${numeroCel}    314726891
${diaNacimiento}    27
${direccionCasa}    call 83 a nor #78-98

*** Test Cases ***
practice forms
    Open Browser    ${busqueda}   ${navegador}
    Ejecucion de jercicios practice forms
    Close Browser

*** Keywords ***
Ejecucion de jercicios practice forms
    #Ingresamos los datos en el formulario
    Input Text    id:firstName    ${nombre}
    Input Text    id:lastName    ${apellido}
    Input Text    id:userEmail    ${correoElectronico}
    # Seleccionamos el género Male
    Click Element    css=label[for="gender-radio-1"]       
    Input Text    id:userNumber    ${numeroCel}
    #Fecha
    Click Element    xpath://*[@id="dateOfBirthInput"]
    Select From List By Label    css:.react-datepicker__month-select    January
    Sleep    1s
    Select From List By Value    css:.react-datepicker__year-select    2001
    Sleep    1s
    Click Element    css:.react-datepicker__day--0${diaNacimiento}
    Sleep    1s

    # Selección de Areas
    Seleccionar Areas    Computer Science    Social Studies
    Sleep    3s

    #scroll
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

    #Seleccionamos Hobbies
    Seleccionar hobbies    Sports    Music
    Sleep    3s

    #escoger una imagen
    Choose File    id=uploadPicture    C:\\Users\\Brahyan\\Documents\\DibujosKrita\\dibujoTerminado\\gojo.png
    

    #Ingresando la direccion de la casa :)
    Input Text     id:currentAddress    ${direccionCasa}
    Sleep    2s

    #Selección de State
    Click Element    xpath://div[@id="state"]/div/div[1]/div[1]
    Input Text    xpath://input[@id="react-select-3-input"]    NCR
    Press Key    xpath://input[@id="react-select-3-input"]    \\13
    Sleep    1s

    #Selección de City
    Click Element    xpath://div[@id="city"]/div/div[1]/div[1]
    Input Text    xpath://input[@id="react-select-4-input"]    Noida
    Press Key    xpath://input[@id="react-select-4-input"]    \\13
    Sleep    1s
    
    #eviar todo el formulario siuuu
    Click Element    xpath://*[@id="submit"]
    Sleep    3s
    

*** Keywords ***
Seleccionar Areas
    [Arguments]    @{materias}
    FOR    ${materia}    IN    @{materias}
        Input Text    id:subjectsInput    ${materia}
        Sleep    2s
        Press Key    id:subjectsInput   \\13
    END

Seleccionar hobbies
    [Arguments]    @{hobbies}
    FOR    ${hobbies}    IN    @{hobbies}
        Click Element    xpath://label[text()='${hobbies}']
        Sleep    1s
    END

