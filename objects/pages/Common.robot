*** Settings ***
Resource   ../../configs/EnvDetails.robot
Resource   ../../configs/BrowserDetails.robot
Resource   ../../configs/SeleniumConfigs.robot
Resource   ../../configs/ApplicationVariables.robot


Library    SeleniumLibrary
Library    String
Library    OperatingSystem
#Library    Browser

*** Variables ***
${cart_context}  cart.html
${checkout_context}  checkout-step-one.html


*** Keywords ***
Open Browser To Login Page
    [Documentation]
	...  Open the browser and navigates to the login page  ...
	
    SeleniumLibrary.Open Browser      ${TEST_ENV_URL}   ${BROWSER}
    Set Window Size	    ${WINDOW_WIDTH}     ${WINDOW_HEIGHT}
    Set Selenium Timeout     ${SELENIUM_TIMEOUT}
    Set Log Level    DEBUG     

Click Element [Arguments] ${locator} ${retryScale}
    [Documentation]        
	...  Click on a given button  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Enabled    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Click Element  ${locator}


Set Text [Arguments] ${textBoxLocator} ${text} ${retryScale}
    [Documentation]        
	...  Input text into a text box  ...

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Enabled    ${textBoxLocator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Input Text    ${textBoxLocator}    ${text}

Verify Element [Arguments] ${elementName}
    [Documentation]        
	...  Check the element  ...

    Open Browser To Login Page
    Page Should Contain Element  ${elementName}

Verify The Message [Arguments] ${elementName} ${messageName}
    [Documentation]        
	...  Check the element  ...

    ${response}    SeleniumLibrary.Get Text   ${elementName}
	Should Be Equal As Strings    ${response}    ${messageName}
    #Wait Until Keyword Succeeds    ${SMALL_RETRY_COUNT}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${elementName}
    #Wait Until Keyword Succeeds    ${SMALL_RETRY_COUNT}     ${RETRY_DELAY}    Element Text Should Be    ${elementName}    ${messageName}     


Verify The Error Message [Arguments] ${elementName} ${message}
    [Documentation]        
	...  Check the element  ...

    Verify The Message [Arguments] ${elementName} ${message}



Validate The Product Item Page [Arguments] ${product_item_name_locator} ${product_name}
     [Documentation]
	...  Validate The Product Item Pagee  ...

    ${elem} =   Get WebElements     ${product_item_name_locator}
    Should Be Equal As Strings    ${elem[0].text}    ${product_name}