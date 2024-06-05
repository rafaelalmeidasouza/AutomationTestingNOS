*** Settings ***
Documentation       Keywords Referente a API Add User

Resource            ../config/package.resource


*** Variables ***
${ADD_NEW_USER_BODY}    ${EMPTY}
${RES_ADD_NEW_USER}     ${EMPTY}


*** Keywords ***
I Have The Data To Create A New User
    [Arguments]    ${NAME}    ${GENDER}    ${EMAIL}

    ${ADD_NEW_USER_BODY}    Create Dictionary
    ...    name=${NAME}
    ...    gender=${GENDER}
    ...    email=${EMAIL}
    ...    status=active

    Set Test Variable    ${ADD_NEW_USER_BODY}

I Execute The User Creation API
    ${RES_ADD_NEW_USER}    I Post On Session
    ...    URL= ${ADD_USER_ENDPOINT}
    ...    EXPECTED_STATUS=201
    ...    JSON=${ADD_NEW_USER_BODY}

    Set Test Variable    ${ID_NEW_USER}    ${RES_ADD_NEW_USER}[id]
    Set Test Variable    ${RES_ADD_NEW_USER}

    Log To Console    ${\n}Usuário Criado: ${ID_NEW_USER}

The Response Should Contain The Details Of The Created User
    Dictionary Should Contain Key    ${RES_ADD_NEW_USER}    id
    Dictionary Should Contain Key    ${RES_ADD_NEW_USER}    status

    ${actual_name}    Set Variable    ${RES_ADD_NEW_USER}[name]
    ${actual_gender}    Set Variable    ${RES_ADD_NEW_USER}[gender]
    ${actual_email}    Set Variable    ${RES_ADD_NEW_USER}[email]

    Should Be Equal As Strings    ${actual_name}    ${ADD_NEW_USER_BODY}[name]
    Should Be Equal As Strings    ${actual_gender}    ${ADD_NEW_USER_BODY}[gender]
    Should Be Equal As Strings    ${actual_email}    ${ADD_NEW_USER_BODY}[email]

    Log To Console    ${\n}Dados Validados

I Execute The User Creation API 2x
    I Execute The User Creation API
    I Execute The User Creation API Duplicated

I Execute The User Creation API Duplicated
    ${RES_ADD_NEW_USER}    I Post On Session
    ...    URL= ${ADD_USER_ENDPOINT}
    ...    EXPECTED_STATUS=422
    ...    JSON=${ADD_NEW_USER_BODY}

    Set Test Variable    ${RES_ADD_NEW_USER}

The Response Should Contain An Error Message Indicating That The Email Is Already In Use
    ${expected_message}    Set Variable    has already been taken

    Should Be Equal As Strings    ${RES_ADD_NEW_USER[0]['message']}    ${expected_message}

    Log To Console    ${\n}Não Foi Possível Criar Novo User Com Os Nesmos Dados

That There Is A Registered User
    [Arguments]    ${NAME}    ${GENDER}    ${EMAIL}

    I Have The Data To Create A New User    NAME=${NAME}    GENDER=${GENDER}    EMAIL=${EMAIL}
    I Execute The User Creation API
