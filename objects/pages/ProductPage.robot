*** Settings ***
Resource    ../locators/ProductPageLocators.robot
Resource    ShoppingCartPage.robot

*** Keywords ***
Verify The Products are displayed
    [Documentation]
	...  Verify The Products are displayed  ...
    
    ${elem} =   Get WebElements     ${lstProduct_name}
    Should Be Equal As Strings    ${elem[0].text}    ${product_default}


Sort The Product [Arguments] ${filter} ${value}
    [Documentation]
	...  Sort The Product by Low Price	...  

    ${product_element_sort_locator}=  Replace String  string=${lstProduct_sort_locator}  search_for=TEMPLATE  replace_with=${filter}
    Click Element [Arguments] ${drpSort} ${retryScale}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${product_element_sort_locator}
    Click Element [Arguments] ${product_element_sort_locator} ${retryScale}

Validate The Sort [Arguments] ${value}
    [Documentation]
	...  Validate The Sort	...  
    ${elem} =   Get WebElements     ${lstProduct_name}
    Should Be Equal As Strings    ${elem[0].text}    ${value}
    Capture Page Screenshot


Add Product To Cart [Arguments] ${product_name}
    [Documentation]
	...  Add Product To Cart ...

    ${product_element_button_locator}=  Replace String  string=${lstProduct_button_locator}  search_for=TEMPLATE  replace_with=${product_name}
    Click Button   ${product_element_button_locator}
    Capture Page Screenshot
    

Validate Product In Cart [Arguments] ${product_name}
    [Documentation]
	...  Validate Product In Cart ...

    Validate The Product In Shopping Cart [Arguments] ${product_name}
    Return To Shopping Page
    Capture Page Screenshot

Remove Product From Cart From Shopping Page [Arguments] ${product_name}
    [Documentation]
	...  Remove Product from Cart ...
    ${product_element_button_locator}=  Replace String  string=${lstProduct_button_locator}  search_for=TEMPLATE  replace_with=${product_name}
    Click Button   ${product_element_button_locator}
    Capture Page Screenshot

Verify Removed Product From Cart From Shopping Page [Arguments] ${product_name}
    [Documentation]
	...  Remove Product from Cart ...
    Validate The Product Not In Shopping Cart [Arguments] ${product_name}
    Return To Shopping Page

Click The Product [Arguments] ${product_name}
    [Documentation]
	...  Click The Product ...
    ${product_element_locator}=  Replace String  string=${product_element}  search_for=TEMPLATE  replace_with=${product_name}
    Click Element [Arguments] ${product_element_locator} ${retryScale}


Add Multiple Products
    [Arguments]    ${product}   
    Add Product To Cart [Arguments] ${product}
    Validate Product In Cart [Arguments] ${product}

Remove Multiple Products
    [Arguments]    ${product}   
    Remove Product From Cart From Shopping Page [Arguments] ${product}
    Verify Removed Product From Cart From Shopping Page [Arguments] ${product}