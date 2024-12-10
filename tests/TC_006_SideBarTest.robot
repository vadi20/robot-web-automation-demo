*** Settings ***
Resource   ../objects/pages/SideBarPage.robot
Resource   ../objects/pages/LoginPage.robot
Resource   ../objects/pages/ProductPage.robot

Documentation   This suite includes shopping cart tests

Suite Setup      Login To The Application [Arguments] ${USERNAME} ${PASSWORD}
Suite Teardown   SeleniumLibrary.Close Browser


*** Test Cases ***

Check Able To Open Side Navigation Panel
    [Documentation]    Check Able To Open Side Navigation Panel
    [Tags]  Smoke

    Open SideNav Bar
    Validate SideNavigation Open
    Close SideNav Bar

Check Able To Close Side Navigation Panel
    [Documentation]    Check Able To Close Side Navigation Panel
    [Tags]  Smoke

    Open SideNav Bar
    Close SideNav Bar
    Validate SideNavigation Close

Check Able To Navigate To Product Page
    [Documentation]    Check Able To Navigate To Product Page
    [Tags]  Smoke

    Open SideNav Bar
    Click Product Page
    Verify The Products are displayed
    Close SideNav Bar

Check Able to Logout
    [Documentation]    Check Able to Logout
    [Tags]  Smoke

    Open SideNav Bar
    Click Logout
    Verify Logout

