*** Settings ***
Documentation     29.08.2018
...               This suite is used for testing Header
Suite Setup       AccessToPage    ${Homepage.URL}
Suite Teardown    Close All Browsers
Test Setup        BackToPage    ${Homepage.URL}
Test Timeout      3 minutes
Library           Selenium2Library
Library           BuiltIn
Library           Base.GeneralFunction
Library           ../Resources/Homepage.py
Variables         ../Variables/variables.py

*** Test Cases ***
ClickLogo
    [Documentation]    Test case ID: Header_001
    ...
    ...    This test case is used for checking "click Logo"
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Click Logo
    ...
    ...    Expected result: The URL is "https://www.airbnb.com/?logo=1"
    CheckEventAfterClickHeaderElement    ButtonMainNavigationMenu    ${ExpectedResultHeader.ClickLogo_ExpectedURL}

ClickBecomeAHost
    [Documentation]    Test case ID: Header_002
    ...
    ...    This test case is used for checking "click Become A Host"
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Click Become A Host
    ...
    ...    Expected result: "Become A Host" pop-up will be displayed
    CheckEventAfterClickHeaderElement    ButtonBecomeAHost    UlBecomeAHostPopUp

ClickEarnCredit
    [Documentation]    Test case ID: Header_003
    ...
    ...    This test case is used for checking "click Earn Credit"
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Click Earn Credit
    ...
    ...    Expected result: New tab appear with "https://www.airbnb.com/login?redirect_params[action]=index&redirect_params[controller]=referrals&redirect_params[r]=56"
    CheckEventAfterClickHeaderElement    AEarnCredit    ${ExpectedResultHeader.ClickEarnCredit_ExpectedURL}

ClickHelp
    [Documentation]    Test case ID: Header_004
    ...
    ...    This test case is used for checking "click Help"
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Click Help
    ...
    ...    Expected result: "Help" pop-up will be displayed
    CheckEventAfterClickHeaderElement    ButtonHelp    DivHelpPopUp

ClickSignUp
    [Documentation]    Test case ID: Header_005
    ...
    ...    This test case is used for checking "click Sign Up"
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Click Sign Up
    ...
    ...    Expected result: "Sign Up" pop-up will be displayed
    CheckEventAfterClickHeaderElement    ASignup    DivSignUpPopUp

ClickLogIn
    [Documentation]    Test case ID: Header_006
    ...
    ...    This test case is used for checking "click Log In"
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Click Log In
    ...
    ...    Expected result: "Log In" pop-up will be displayed
    CheckEventAfterClickHeaderElement    ButtonLogin    DivLogInPopUp

CheckLogoContent
    [Documentation]    Test case ID: Header_007
    ...
    ...    This test case is used for checking Structure of Logo
    ...
    ...    Steps:
    ...    1. Go to Homepage
    ...
    ...    2. Read Structure of Logo
    ...
    ...    Expected result: Acutal Structure is same as expected Structure of Logo
    ${driver}    Base.GeneralFunction.getCurrentBrowser
    ${StructureLogo}    Homepage.getStructureOfLogo    ${driver}
    Should Be Equal As Strings    ${StructureLogo}    ${ExpectedResultHeader.ExpectedStructureLogo}

*** Keywords ***
AccessToPage
    [Arguments]    ${URL}
    [Documentation]    This keywork is used for creating web driver and access to Page
    Create Webdriver    Chrome
    Go to    ${URL}
    Maximize Browser Window

CheckEventAfterClickHeaderElement
    [Arguments]    ${HeaderElementName}    ${ExpectedResultOrPopUpName}
    [Documentation]    This keywork is used for checking event after clicking Header elements
    ${driver}    Base.GeneralFunction.getCurrentBrowser
    Homepage.clickHeaderElement    ${driver}    ${HeaderElementName}
    ${Windows_Handles_List}    Get Window Handles
    ${Number_Windows}    get length    ${Windows_Handles_List}
    Run Keyword If    ${Number_Windows} > 1    Select window    NEW
    ${Actual_URL}    Base.GeneralFunction.getCurrentURL    ${driver}
    Run Keyword If    '${HeaderElementName}' == 'ButtonMainNavigationMenu' or '${HeaderElementName}' == 'AEarnCredit'    Should Be Equal As Strings    ${Actual_URL}    ${ExpectedResultOrPopUpName}
    ...    ELSE    Base.GeneralFunction.isDisplayPopUp    ${driver}    ${ExpectedResultOrPopUpName}
    Run Keyword If    ${Number_Windows} > 1    close window
    Run Keyword If    ${Number_Windows} > 1    select window

BackToPage
    [Arguments]    ${URL}
    [Documentation]    This keywork is used for going back to page if currrent url is not expected page
    ${CurrentURL}    Get Location
    Run Keyword If    '${URL}' != '${CurrentURL}'    Go to    ${URL}
    ...    ELSE    Reload Page
