*** Settings ***
Resource    ../locators/CheckoutPageLocators.robot
Resource    ../pages/ShoppingCartPage.robot
Resource    ../pages/ProductItemPage.robot

*** Keywords ***

Validate Checkout Navigation
    [Documentation]    Validate Checkout Navigation
    [Tags]  Smoke

    ${Url} =                    Get location
    ${responseContext} =   Split String From Right     ${Url}  /  1
    Should Be Equal As Strings    ${responseContext}[1]    ${checkout_context}

Cancel Checkout
    [Documentation]  Cancel Checkout
    [Tags]  Smoke

    Click Button  ${cancel_locator}

Validate Cancel Navigation
    [Documentation]    Validate Cancel Navigatio
    [Tags]  Smoke

    ${Url} =                    Get location
    ${responseContext} =   Split String From Right     ${Url}  /  1
    Should Be Equal As Strings    ${responseContext}[1]    ${cart_context}

Click Checkout
    [Documentation]  Click Checkou
    [Tags]  Smoke

    Click Element  ${checkout_locator}
    

Back To Home
    [Documentation]  Click Checkou
    [Tags]  Smoke

    Click Element  ${back_to_products}

Continue Checkout
    [Documentation]  Continue Checkout
    [Tags]  Smoke

    Click Element  ${continue_locator}


Finish Checkout
    [Documentation]  Continue Checkout
    [Tags]  Smoke

    Click Element  ${finish_locator}


Verify Differnet Error Scenarios
    [Arguments]    ${firstname}    ${lastname}    ${pin}    ${message}
    [Documentation]    Verify Differnet Error Scenarios
    [Tags]  Smoke
    Go To Cart
    Click Checkout
    Add User Information [Arguments] ${firstname} ${lastname} ${pin}
    Continue Checkout
    Verify The Error Message [Arguments] ${errorLocator} ${message}

Add User Information [Arguments] ${firstname} ${lastname} ${pin}
    [Documentation]
	...  Login using the username and password  ...
    
    Set Text [Arguments] ${firstname_locator} ${firstname} ${retryScale}
    Set Text [Arguments] ${lastname_locator} ${lastname} ${retryScale}
    Set Text [Arguments] ${pin_locator} ${pin} ${retryScale}


Validate Checkout Overview  [Arguments]  @{product_list}
    [Documentation]
	...  Validate Checkout Overview  ...
    FOR  ${product_name}  IN  @{product_list}
        ${checkout_product_item_name_final}=  Replace String  string=${check_out_product_element}  search_for=TEMPLATE  replace_with=${product_name}
        Validate The Product Item Page [Arguments] ${checkout_product_item_name_final} ${product_name}
    END
    


Validate Checkout Complete
    [Documentation]
	...  Validate Checkout Complete  ...
    
    
    ${elem} =   Get WebElements     ${order_completion_locator}
    Should Be Equal As Strings    ${elem[0].text}    ${successful_order}
