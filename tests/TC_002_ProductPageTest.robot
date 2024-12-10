*** Settings ***
Resource   ../objects/pages/ProductPage.robot
Resource   ../objects/pages/ProductItemPage.robot
Resource   ../objects/pages/LoginPage.robot

Documentation   This suite includes product page tests

Suite Setup      Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
Suite Teardown   SeleniumLibrary.Close Browser

*** Variables ***
${select_low}  lohi
${price_lo_hi}  Price (low to high)
${lower_price_product}  Sauce Labs Onesie

${price_hi_lo}  Price (high to low)
${higher_price_product}  Sauce Labs Fleece Jacket

${name_desc}  Name (Z to A)
${name_desc_product}  Test.allTheThings() T-Shirt (Red)

${name_asc}  Name (A to Z)
${name_asc_product}  Sauce Labs Backpack
${product_one}    Sauce Labs Bike Light
${product_two}    Sauce Labs Bolt T-Shirt


*** Test Cases ***

Verify All Products are displayed
    [Documentation]    Verify All Products are displayed
    [Tags]  Smoke
    
    Verify The Products are displayed


Sort The Product by Low Price
    [Documentation]    Sort The Product by Low Price
    [Tags]  Regression
    
    Sort The Product [Arguments] ${price_lo_hi} ${lower_price_product}
    Validate The Sort [Arguments] ${lower_price_product}

Sort The Product by High Price
    [Documentation]    Sort The Product by High Price
    [Tags]  Regression
    
    Sort The Product [Arguments] ${price_hi_lo} ${higher_price_product}
    Validate The Sort [Arguments] ${higher_price_product}


Sort The Product by Z to A
    [Documentation]    Sort The Product by Z to A
    [Tags]  Regression
    
    Sort The Product [Arguments] ${name_desc} ${name_desc_product}
    Validate The Sort [Arguments] ${name_desc_product}

Sort The Product by A to Z
    [Documentation]    Sort The Product by A to Z
    [Tags]  Regression
    
    Sort The Product [Arguments] ${name_desc} ${name_desc_product}
    Validate The Sort [Arguments] ${name_desc_product}
    Sort The Product [Arguments] ${name_asc} ${name_asc_product}


Add A Product To Shopping Cart
    [Documentation]    Add A Product to Shopping Cart
    [Tags]  Smoke

    Add Product To Cart [Arguments] ${product_default}
    Validate Product In Cart [Arguments] ${product_default}

Remove A Product From Shopping Page
    [Documentation]    Remove A Product From Cart From Shopping Page
    [Tags]  Smoke
    Remove Product From Cart From Shopping Page [Arguments] ${product_default}
    Verify Removed Product From Cart From Shopping Page [Arguments] ${product_default}

Add Multiple Product To Shopping Cart
    [Documentation]    Add Multiple Product to Shopping Cart
    [Tags]  Smoke
    [Template]   Add Multiple Products
    ${product_one}
    ${product_two}


Remove Multiple Product From Shopping Page
    [Documentation]    Remove Multiple Product From Cart From Shopping Page
    [Tags]  Smoke
    [Template]   Remove Multiple Products
    ${product_one}
    ${product_two}
    

Verify If Able To View Cart
    [Documentation]    Verify If Able To View Cart
    [Tags]  Smoke
    Go To Cart