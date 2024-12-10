*** Settings ***
Resource    ../locators/ShoppingCartPageLocators.robot
Resource    ../locators/CheckoutPageLocators.robot

Resource    Common.robot



*** Keywords ***

Return To Shopping Page
    [Documentation]
	...  Return To Shopping Page  ...
    Click Element [Arguments] ${continue_shopping_locator} ${retryScale}

Validate The Product In Shopping Cart [Arguments] ${product_name}
    [Documentation]
	...  Validate The Product In Shopping Cart  ...
    
    ${product_locator}=  Replace String  string=${shopping_product_locator}  search_for=TEMPLATE  replace_with=${product_name}
    Click Element [Arguments] ${shoppingCartLocator} ${retryScale}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${product_locator}
    Element Should Be Visible        ${product_locator}
    Capture Page Screenshot


Validate The Product Not In Shopping Cart [Arguments] ${product_name}
    [Documentation]
	...  Validate The Product Not In Shopping Cart  ...

    ${product_locator}=  Replace String  string=${shopping_product_locator}  search_for=TEMPLATE  replace_with=${product_name}

    Click Element [Arguments] ${shoppingCartLocator} ${retryScale}
    Element Should Not Be Visible  ${product_locator}
    Capture Page Screenshot

Go To Cart
    [Documentation]
	...  Go To Cart  ...
    Click Element [Arguments] ${shoppingCartLocator} ${retryScale}

Go To Checkout
    [Documentation]
	...  Go To Cart  ...
    Click Element [Arguments] ${checkout_locator} ${retryScale}

Validate Cart Navigation
    [Documentation]    Navigation
    [Tags]  Smoke

    ${Url} =                    Get location
    ${responseContext} =   Split String From Right     ${Url}  /  1
    Should Be Equal As Strings    ${responseContext}[1]    ${cart_context}