*** Settings ***

Resource    ../locators/SideBarPageLocators.robot
Resource    Common.robot

*** Keywords ***

Open SideNav Bar
    [Documentation]
	...  Open SideNav Bar...
    Click Button  ${sideBarOpenLocator}
    Wait Until Keyword Succeeds     ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${sideBarCloseLocator}
    Sleep  time_=.5s

Close SideNav Bar
    [Documentation]
	...  Close SideNav Bar...
    Click Button  ${sideBarCloseLocator}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${sideBarOpenLocator}
    Sleep  time_=.5s

Validate SideNavigation Open
    [Documentation]
	...  Validate SideNavigation  Open...
    ${value}=  Get Element Attribute  locator=${side_navigation}  attribute=aria-hidden
    Should Be Equal As Strings  first=${value}  second=false

Validate SideNavigation Close
    [Documentation]
	...  Validate SideNavigation  Close...
    ${value}=  Get Element Attribute  locator=${side_navigation}  attribute=aria-hidden
    Should Be Equal As Strings  first=${value}  second=true
    
Click Product Page
    [Documentation]
	...  Click Product Page...
    Click Element [Arguments] ${all_product_locator} ${retryScale}

Verify Logout
    ${Url} =  Get location
    Should Be Equal As Strings  first=${Url}  second=${TEST_ENV_URL}


Click Logout
   [Documentation]
	...  Click Logout...
    Click Element [Arguments] ${logoutLocator} ${retryScale}

Logout From The Application
    [Documentation]
	...  Logout from the application  ...
	Click Element [Arguments] ${sideBarOpenLocator} ${retryScale}
	Click Element [Arguments] ${logoutLocator} ${retryScale}