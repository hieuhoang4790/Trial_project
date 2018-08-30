# 26.08.2018 - Matthew
# This dictionary is used for locators of Header
HeaderLocators = {
    'ButtonMainNavigationMenu':'//a[@aria-label="Airbnb homepage"]',
    'PathLogo':'//a[@aria-label="Airbnb homepage"]//*[name()="path"]',
    'InputQuery':'//input[@name="query"]',
    'ButtonBecomeAHost':'//button[.//div[text()="Become a host"]]',
    'AEarnCredit':'//a[.//div[text()="Earn credit"]]',
    'ButtonHelp':'//button[.//div[text()="Help"]]',
    'ASignup':'//a[.//div[text()="Sign up"]]',
    'ButtonLogin':'//button[.//div[text()="Log in"]]',
    'AHostAHome':'//a[.//div[text()="Host a home"]]',
    'AHostAnExperience':'//a[.//div[text()="Host an experience"]]'
}

# 29.08.2018 - Matthew
# This dictionary is used for locators of Pop-Up
PopUpLocators = {
    'DivSignUpPopUp':'//div[@class="_wpwi48" and .//div[text()="Sign up with Email"]]',
    'DivLogInPopUp':'//div[@class="_wpwi48" and .//button[.//div[text()="Log in with Facebook"]]]',
    'UlBecomeAHostPopUp':'//ul[@class="_ki8z5d" and .//div[text()="Host a home"] and .//div[text()="Host an experience"]]',
    'DivHelpPopUp':'//div[@aria-label="Airbnb Help"]'
}
