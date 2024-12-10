*** Settings ***
Resource   ../objects/pages/LoginPage.robot

Documentation   This suite includes login tests

Test Teardown  SeleniumLibrary.Close Browser


*** Variables ***
${LOCKED_USERNAME}             locked_out_user
${INVALID_USERNAME}            invalid_user
${INVALID_PASSWORD}            invalid_password

${lockedMessage}               Epic sadface: Sorry, this user has been locked out.
${invalidMessage}              Epic sadface: Username and password do not match any user in this service


*** Test Cases ***

Verify That A Registered User Can Login To The Application Using The Correct Password
    [Documentation]    Verify that a registered user can login to the application using the correct password
    [tags]  Smoke
    
    Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
    #Logout From The Application

Verify That A Application has username feild
    [Documentation]    Verify That A Application has username feild
    [tags]  Regression

    Verify Element [Arguments] ${txtUsername} 

Verify That A Application has password feild
    [Documentation]    Verify That A Application has password feild
    [tags]  Regression

    Verify Element [Arguments] ${txtPassword} 

Verify That A Application has Login button
    [Documentation]    Verify That A Application has login button
    [tags]  Regression

    Verify Element [Arguments] ${btnLogin} 

Veify Differnet Login Scenarios
    [Documentation]    Veify Differnet Login Scenarios
    [Tags]  Smoke
    [Template]  Verify Differnet Users
    ${LOCKED_USERNAME}    ${PASSWORD}    ${lockedMessage}
    ${INVALID_USERNAME}    ${PASSWORD}    ${invalidMessage}
    ${USERNAME}    ${INVALID_PASSWORD}    ${invalidMessage}

# Verify A lockedout User
#     [Documentation]    Verify A lockedout User
#     [tags]  locked
    
#     Login To The Application [Arguments] ${LOCKED_USERNAME} ${PASSWORD}
#     Verify The Error Message [Arguments] ${lockedMessage}


# Verify A Invalid User
#     [Documentation]    Verify A Invalid User
#     [tags]  locked
    
#     Login To The Application [Arguments] ${INVALID_USERNAME} ${PASSWORD}
#     Verify The Error Message [Arguments] ${invalidMessage}

# Verify A Invalid Password
#     [Documentation]    Verify A Invalid Password
#     [tags]  locked
    
#     Login To The Application [Arguments] ${USERNAME} ${INVALID_PASSWORD}
#     Verify The Error Message [Arguments] ${invalidMessage}
#Verify That The Password is masked
#    [Documentation]    Verify That The Password is masked
#    [tags]  Regression

#    Verify If Password is Masked