*** Settings ***
Documentation       Keywords Referente as Requests em Geral

Resource            ../config/package.resource


*** Keywords ***
I Create API Session
    [Documentation]    Create Session for Method Execution

    ${header}    I Create Header

    Create Session
    ...    alias=nos
    ...    url=${URL}
    ...    headers=${header}
    ...    disable_warnings=True

I Create Header
    [Documentation]    Create Header For Session Creation

    ${header}    Create Dictionary
    ...    Authorization=Bearer 91aff8c686f717d44b834041d69f273b3b168888e0e5025706e3e8982151fc0f
    ...    Content-Type=application/json

    RETURN    ${header}

I Post On Session
    [Documentation]    Execute the POST method on the created session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}    ${JSON}=None

    I Create API Session

    ${res}    POST On Session
    ...    alias=nos
    ...    url=${URL}
    ...    json=${JSON}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res.json()}

I Delete On Session
    [Documentation]    Execute the DELETE method on the created session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}

    I Create API Session

    ${res}    DELETE On Session
    ...    alias=nos
    ...    url=${URL}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res}

I Get On Session
    [Documentation]    Execute the GET method on the created session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}

    I Create API Session

    ${res}    GET On Session
    ...    alias=nos
    ...    url=${URL}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res.json()}

I Put On Session
    [Documentation]    Execute the PUT method on the created session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}    ${JSON}=None

    I Create API Session

    ${res}    PUT On Session
    ...    alias=nos
    ...    url=${URL}
    ...    json=${JSON}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res.json()}

I Clear Data Base
    [Documentation]    Remove Created Users
    Execute The User Removal API
