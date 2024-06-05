*** Settings ***
Documentation       Test Scenarios For Update a User

Resource            ../config/package.resource

Test Teardown       I Clear Data Base


*** Test Cases ***
Scenario: Update Created User Successfully
    [Documentation]    User Insertion Validation Scenarios

    Given That There Is A Created User
    ...    NAME=name test
    ...    GENDER=male
    ...    EMAIL=test@tests.com
    When I Execute The User Update API
    ...    NAME=name test updated
    ...    GENDER=male
    ...    EMAIL=testupdated@tests.com
    Then The Response Should Contain The Details Of The Updated User
