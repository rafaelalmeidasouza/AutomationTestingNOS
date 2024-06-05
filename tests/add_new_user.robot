*** Settings ***
Documentation       Test Scenarios For Adding a User

Resource            ../config/package.resource

Test Teardown       I Clear Data Base


*** Test Cases ***
Scenario: Insert User Successfully
    [Documentation]    User Insertion Validation Scenarios

    Given I Have The Data To Create A New User
    ...    NAME=name test
    ...    GENDER=male
    ...    EMAIL=test@tests.com
    When I Execute The User Creation API
    Then The Response Should Contain The Details Of The Created User

Scenario: Fail to Insert User with Existing Email
    [Documentation]    User Insertion Validation Scenarios With Existing Email

    Given I Have The Data To Create A New User
    ...    NAME=name test duplicated
    ...    GENDER=male
    ...    EMAIL=testduplicated@tests.com
    When I Execute The User Creation API 2x
    Then The Response Should Contain An Error Message Indicating That The Email Is Already In Use
