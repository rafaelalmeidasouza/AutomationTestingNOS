*** Settings ***
Documentation       Keywords Referente a API Delete User

Resource            ../config/package.resource


*** Variables ***
${RES_DELETE_USER}      ${EMPTY}
${ID_NEW_USER}          ${EMPTY}


*** Keywords ***
Execute The User Removal API
    [Documentation]    Make The API Call To Delete User

    ${RES_DELETE_USER}    I Delete On Session
    ...    URL=${DELETE_USER_ENDPOINT}${ID_NEW_USER}
    ...    EXPECTED_STATUS=204

    RETURN    ${RES_DELETE_USER}

The User Is Properly Removed From The Database
    [Documentation]    Validate That the User Has Been Deleted

    ${expected_message}    Set Variable    Resource not found

    ${res}    I Get User Deleted

    Should Be Equal As Strings    ${res}[message]    ${expected_message}
