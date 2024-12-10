*** Settings ***

Resource   ../objects/pages/ProductPage.robot
Resource   ../objects/pages/ProductItemPage.robot
Resource   ../objects/pages/LoginPage.robot

Documentation   This suite includes product item page tests

Suite Setup      Run Keywords
...    Login To The Application [Arguments] ${USERNAME} ${PASSWORD}

Suite Teardown   SeleniumLibrary.Close Browser

*** Test Cases ***

Validate The Product Item Details [Arguments] ${product_default}
    [Documentation]    Validate The Product Item Details
    [tags]  Smoke

    Click The Product [Arguments] ${product_default}
    Validate The Product Item Page [Arguments] ${product_item_name_locator} ${product_default}

Check To Return To Product Home
    [Documentation]    Check To Return To Product Home
    [tags]  Smoke

    Click The Product [Arguments] ${product_default}
    Return To Shopping
    Verify The Products are displayed

Add A Product To Shopping Cart From Product Item Page
    [Documentation]    Add A Product To Shopping Cart From Product Item Page
    [Tags]  Smoke1

    Add Product To Cart From Product Item Page [Arguments] ${product_default}


Remove A Product To Shopping Cart From Product Item Page
    [Documentation]    Remove A Product To Shopping Cart From Product Item Page
    [Tags]  Smoke1

    Remove Product From Cart From Product Item Page [Arguments] ${product_default}