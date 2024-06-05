*** Settings ***
Documentation       Keywords Referente a API Update User

Resource            ../config/package.resource


*** Variables ***
${RES_UPDATE_USER}      ${EMPTY}
${UPDATE_BODY}          ${EMPTY}
${ID_NEW_USER}          ${EMPTY}


*** Keywords ***
I Have The Data To Update A User
    [Documentation]    Create User Update Body

    [Arguments]    ${NAME}    ${GENDER}    ${EMAIL}

    ${UPDATE_BODY}    Create Dictionary
    ...    name=${NAME}
    ...    gender=${GENDER}
    ...    email=${EMAIL}
    ...    status=active

    Set Test Variable    ${UPDATE_BODY}

I Execute The User Update API
    [Documentation]    Run The User Update API

    [Arguments]    ${NAME}    ${GENDER}    ${EMAIL}

    I Have The Data To Update A User    ${NAME}    ${GENDER}    ${EMAIL}

    ${RES_UPDATE_USER}    I Put On Session
    ...    URL=${UPDATE_USER_ENDPOINT}${ID_NEW_USER}
    ...    EXPECTED_STATUS=200
    ...    JSON=${UPDATE_BODY}

    Set Test Variable    ${UPDATE_BODY}
    Set Test Variable    ${RES_UPDATE_USER}

The Response Should Contain The Details Of The Updated User
    [Documentation]    Validate Details For Updated User

    Dictionary Should Contain Key    ${RES_UPDATE_USER}    id
    Dictionary Should Contain Key    ${RES_UPDATE_USER}    status

    ${actual_name}    Set Variable    ${RES_UPDATE_USER}[name]
    ${actual_gender}    Set Variable    ${RES_UPDATE_USER}[gender]
    ${actual_email}    Set Variable    ${RES_UPDATE_USER}[email]

    Should Be Equal As Strings    ${actual_name}    ${UPDATE_BODY}[name]
    Should Be Equal As Strings    ${actual_gender}    ${UPDATE_BODY}[gender]
    Should Be Equal As Strings    ${actual_email}    ${UPDATE_BODY}[email]

    Log To Console    ${\n}Dados Validados
