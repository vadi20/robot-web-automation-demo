*** Settings ***
Resource   ../objects/pages/CheckoutPage.robot
Resource   ../objects/pages/LoginPage.robot

Documentation   This suite includes shopping cart tests

Suite Setup      Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
Suite Teardown   SeleniumLibrary.Close Browser


*** Test Cases ***
Verify If Able To Cancel from Checkout
    [Documentation]    Verify If Able To Cancel from Checkout
    [Tags]  Smoke
    Go To Cart
    Click Checkout
    Cancel Checkout
    Validate Cancel Navigation


Veify Differnet Error Scenarios
    [Documentation]    Veify Differnet Error Scenarios
    [Tags]  Smoke
    [Template]  Verify Differnet Error Scenarios
    ${EMPTY}    ${EMPTY}    ${EMPTY}    Error: First Name is required
    ${EMPTY}    ${lastName}    ${pincode}    Error: First Name is required
    ${firstName}    ${EMPTY}    ${EMPTY}    Error: Last Name is required
    ${firstName}    ${lastName}    ${EMPTY}    Error: Postal Code is required

