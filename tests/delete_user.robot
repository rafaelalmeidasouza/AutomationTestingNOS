*** Settings ***
Documentation       Cenários de testes Delete User

Resource            ../config/package.resource


*** Test Cases ***
Scenario: Remove User Successfully
    [Documentation]    Validation Scenarios for User Removal

    Given That There Is A Registered User
    ...    NAME=name test deleted
    ...    GENDER=male
    ...    EMAIL=testdeleted@tests.com
    When Execute The User Removal API
    Then The User Is Properly Removed From The Database
