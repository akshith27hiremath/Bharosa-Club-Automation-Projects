from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
PATH = "D:\chromedriver.exe"

driver = webdriver.Chrome(PATH)
driver.get("https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement")
# search = driver.find_element_by_id("mat-radio-3-input")
# email = driver.findElement(By.xpath("//*[@formcontrolname='email_id']"))
# accepttos = driver.find_element_by_css_selector("mat-radio-button[value='ACCEPT']")
# accepttos.send_keys(Keys.RETURN)
# entertos = driver.find_element_by_css_selector("input[value='PROCEED']")
# entertos = driver.send_keys(Keys.RETURN)
email = driver.find_element_by_css_selector("input[formcontrolname='email_id']")
inputs = {
  "email": "example@example.com",
  "pan": "123456",
  "password": "password"
}
email.send_keys("my email")
# email.send_keys(Keys.ENTER)
email.send_keys(Keys.TAB)

pan = driver.find_element_by_css_selector("input[formcontrolname='pan']")
pan.send_keys("1234")
time.sleep(10)
driver.quit()

#mat-radio-3-input = detailed radio button
# detailed_radio_button = driver.find_element_by_xpath('//*[@id="mat-radio-6-input"]')
# detailed_radio_button.click()
# # email = driver.find_element_by_xpath('//*[@id="mat-input-0"]')
# email = driver.find_element_by_css_selector("input[formcontrolname='email_id']")
# email.send_keys(inputs['email'])
"""
xpaths:
detailed radio button: //*[@id="mat-radio-6-input"]
specific time period button: //*[@id="mat-radio-14-input"]
starting date: //*[@id="mat-input-5"]
ending date: //*[@id="mat-input-6"]
email: //*[@id="mat-input-0"]
pan: //*[@id="mat-input-0"]
"""