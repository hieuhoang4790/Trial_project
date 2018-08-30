import datetime
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import *
from Locators.BaseLocators import HeaderLocators, PopUpLocators
#29.08.2018 - Matthew
#This class contains the general funtions
class GeneralFunction(object):
    
    #29.08.2018 - Matthew
    #This function is used for getting the Selenium2 webdriver 
    def getCurrentBrowser(self):
        return (BuiltIn().get_library_instance('Selenium2Library'))._current_browser()
    
    #29.08.2018 - Matthew
    #This function is used for getting the Selenium2 webdriver 
    def getCurrentURL(self,driver):
        return driver.current_url
    
    #30.08.2018 - Matthew
    #This function is used for checking the visibility of popup
    def isDisplayPopUp(self,driver,PopupName):
    
        try:
            CurrentTime = datetime.datetime.now().strftime("%d%M%Y%H%M%S")
            WebDriverWait(driver, 1).until(EC.visibility_of_element_located((By.XPATH, PopUpLocators[PopupName])))
            print "isDisplayPopUp:Passed"
        
        except TimeoutException:
            print "isDisplayPopUp:Failed because TimeoutException"
            driver.save_screenshot('FailedisDisplayPopUp'+CurrentTime+'.png')
            raise Exception("isDisplayPopUp:Failed because TimeoutException")
            
        except WebDriverException:
            print "isDisplayHelpPopUp:Failed"
            driver.save_screenshot('FailedisDisplayPopUp'+CurrentTime+'.png')
            raise Exception("isDisplayPopUp:Failed because TimeoutException")
            
#29.08.2018 - Matthew
#This class contains methods of Header
class Headers(object):

    
    #29.08.2018 - Matthew
    #This function is used for clicking Logo/Become a host/Earn Credit/Help/SignUp/Login
    def clickHeaderElement(self,driver,HeaderElementName):
    
        try:
            HeaderElement = WebDriverWait(driver, 1).until(EC.element_to_be_clickable((By.XPATH, HeaderLocators[HeaderElementName])))
            HeaderElement.click()
            print "click"+HeaderElementName+":Passed"
            
        except WebDriverException:
            print "click"+HeaderElementName+": Failed"
            driver.save_screenshot('Failedclick'+HeaderElementName+'.png')
            
    #29.08.2018 - Matthew
    #This function is used for getting structure of Logo
    def getStructureOfLogo(self,driver):
        try:
            StructureLogo = WebDriverWait(driver, 1).until(EC.visibility_of_element_located((By.XPATH, HeaderLocators['PathLogo'])))
            print "getStructureOfLogo:Passed"
            return StructureLogo.get_attribute('d')
            
        except WebDriverException:
            print "getStructureOfLogo: Failed"
            driver.save_screenshot('FailedgetStructureOfLogo.png')

            
            
