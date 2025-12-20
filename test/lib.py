from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time



def login(selenium, device_user, device_password):
    selenium.find_by_xpath("//input[@name='username']").send_keys(device_user)
    password = selenium.find_by_xpath("//input[@name='password']")
    password.send_keys(device_password)
    selenium.screenshot('login')
    password.send_keys(Keys.RETURN)
    selenium.find_by_xpath("//h2[contains(.,'Discover')]")
