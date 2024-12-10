*** Settings ***
Resource   ../objects/pages/CheckoutPage.robot
Resource   ../objects/pages/LoginPage.robot

Documentation   This suite includes shopping cart tests

Suite Setup      Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
Suite Teardown   SeleniumLibrary.Close Browser

*** Variables ***
${product_one}    Sauce Labs Bike Light
${product_two}    Sauce Labs Bolt T-Shirt
@{data1}    ${product_one} 
@{data2}    ${product_one}    ${product_two} 

*** Test Cases ***


Validate Ordering For A Product
    [Documentation]    Validate Ordering For A Product
    [Tags]  Smoke

    Add Product To Cart [Arguments] ${product_one}
    Go To Cart
    Click Checkout
    Add User Information [Arguments] ${firstname} ${lastname} ${pincode}
    Continue Checkout
    Capture Page Screenshot
    Validate Checkout Overview  @{data1}
    Finish Checkout
    Validate Checkout Complete
    Back To Home


Validate Ordering Multiple Products
    [Documentation]    Validate Ordering Multiple Products
    [Tags]  Smoke

    Add Product To Cart [Arguments] ${product_one}
    Add Product To Cart [Arguments] ${product_two}
    Capture Page Screenshot
    Go To Cart
    #Capture Page Screenshot
    Click Checkout
    Add User Information [Arguments] ${firstname} ${lastname} ${pincode}
    Continue Checkout
    Capture Page Screenshot
    Validate Checkout Overview  @{data2}
    #Capture Page Screenshot
    Finish Checkout
    Validate Checkout Complete
    Back To Home


