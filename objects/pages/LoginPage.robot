*** Settings ***
Resource    ../locators/LoginPageLocators.robot
Resource    Common.robot

*** Keywords ***
Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
    [Documentation]
	...  Login using valid username and password  ...
    
    Open Browser To Login Page
    Submit Login Information [Arguments] ${USERNAME} ${PASSWORD}


Submit Login Information [Arguments] ${username} ${password}
    [Documentation]
	...  Login using the username and password  ...
    
    Set Text [Arguments] ${txtUsername} ${USERNAME} ${retryScale}
    Set Text [Arguments] ${txtPassword} ${PASSWORD} ${retryScale}
    Click Element [Arguments] ${btnLogin} ${retryScale}

Verify If Password is Masked
    [Documentation]
	...  Passwod is masked  ...
    
    Open Browser To Login Page
    Set Text [Arguments] ${txtPassword} ${PASSWORD} ${retryScale}
    Element Should Contain  locator=${txtPassword}  expected=...

Verify Differnet Users
    [Arguments]    ${username}    ${password}    ${message}
    Login To The Application [Arguments] ${username} ${password}
    Verify The Error Message [Arguments] ${errorLocator} ${message}