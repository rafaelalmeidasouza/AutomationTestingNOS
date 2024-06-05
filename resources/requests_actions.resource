*** Settings ***
Documentation       Keywords Referente as Requests em Geral

Resource            ../config/package.resource


*** Keywords ***
I Create API Session
    ${header}    I Create Header

    Create Session
    ...    alias=nos
    ...    url=${URL}
    ...    headers=${header}
    ...    disable_warnings=True

I Create Header
    ${header}    Create Dictionary
    ...    Authorization=Bearer 58ce1a142761c6c72d668b92645e6d7da80c0731b73f9357ffb4a3f27481770b
    ...    Content-Type=application/json

    RETURN    ${header}

I Post On Session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}    ${JSON}=None

    I Create API Session

    ${res}    POST On Session
    ...    alias=nos
    ...    url=${URL}
    ...    json=${JSON}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res.json()}

I Delete On Session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}

    I Create API Session

    ${res}    DELETE On Session
    ...    alias=nos
    ...    url=${URL}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res}

I Get On Session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}

    I Create API Session

    ${res}    GET On Session
    ...    alias=nos
    ...    url=${URL}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res.json()}

I Put On Session
    [Arguments]    ${URL}    ${EXPECTED_STATUS}    ${JSON}=None

    I Create API Session

    ${res}    PUT On Session
    ...    alias=nos
    ...    url=${URL}
    ...    json=${JSON}
    ...    expected_status=${EXPECTED_STATUS}

    RETURN    ${res.json()}

I Clear Data Base
    Execute The User Removal API
