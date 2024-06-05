*** Settings ***
Documentation       Keywords Referente a API Get User Created

Resource            ../config/package.resource


*** Variables ***
${RES_GET_USER}     ${EMPTY}
${ID_NEW_USER}      ${EMPTY}


*** Keywords ***
I Get User Deleted
    [Documentation]    Perform GET call to validate deleted user

    ${RES_GET_USER}    I Get On Session
    ...    URL=${GET_USER_ENDPOINT}${ID_NEW_USER}
    ...    EXPECTED_STATUS=404

    RETURN    ${RES_GET_USER}
