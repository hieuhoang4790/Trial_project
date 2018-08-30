from PageObjectLibrary import PageObject
from Resources.Base import Headers
from Locators.BaseLocators import *

class Homepage(PageObject,Headers):
    
    _locators = dict(HeaderLocators,**PopUpLocators)