*** Settings ***
Resource    ../locators/ProductPageLocators.robot
Resource    ../locators/ProductItemPageLocators.robot
Resource    ShoppingCartPage.robot
Resource    ProductPage.robot

*** Keywords ***
Add Product To Cart From Product Item Page [Arguments] ${product_name}
    [Documentation]
	...  Add Product To Cart From Product Item Page ...

    Click The Product [Arguments] ${product_name}
    Click Button  ${lstProduct_add}
    Capture Page Screenshot
    Validate The Product In Shopping Cart [Arguments] ${product_name}
    Return To Shopping Page


Remove Product From Cart From Product Item Page [Arguments] ${product_name}
    [Documentation]
	...  Remove Product From Cart From Product Item Page ...

    Click The Product [Arguments] ${product_name}
    Click Button  ${lstProduct_remove}
    Capture Page Screenshot
    Validate The Product Not In Shopping Cart [Arguments] ${product_name}
    Return To Shopping Page


Return To Shopping
    [Documentation]
	...  Return to Home  ...
    Click Button    ${back_to_products}


