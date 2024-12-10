*** Settings ***
Resource   ../objects/pages/ShoppingCartPage.robot
Resource   ../objects/pages/LoginPage.robot
Resource   ../objects/pages/ProductPage.robot
Resource   ../objects/pages/CheckoutPage.robot

Documentation   This suite includes shopping cart tests

Suite Setup      Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
Suite Teardown   SeleniumLibrary.Close Browser


*** Test Cases ***
Check Whether Able To Go Back To Shopping Page
    [Documentation]    Check Whether Able To Go Back To Shopping Page
    [Tags]  Smoke

    Go To Cart
    Return To Shopping Page
    Verify The Products are displayed

Validate If In Cart
    [Documentation]    Validate If In Cart
    [Tags]  Smoke

    Go To Cart
    Validate Cart Navigation

Verify If Able To Navigate to Checkout Page
    [Documentation]    Verify If Able To Navigate to Checkout Page
    [Tags]  Smoke
    Go To Checkout
    Capture Page Screenshot
    Validate Checkout Navigation