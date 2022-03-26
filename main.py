from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

# import sys
# args = sys.argv.split(" ")
# print(sys.argv)
# mode = args[1]
# email = args[2]
# pwd = args[3]

PATH = "D:\chromedriver.exe" #path to chrome driver

driver = webdriver.Chrome(PATH)
op = webdriver.ChromeOptions()
# op.add_argument('headless')
op.add_argument("--log-level=3")
driver = webdriver.Chrome(PATH, options=op)
driver.maximize_window()
driver.get("https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement")

print("site loaded")

def wait(seconds):
  time.sleep(seconds)

wait(2)

inputs = {
  "email": "ujjwalthaakar@gmail.com",
  "password": "bharosa1234"
}


def makeradiovisiblefull():
  removeoutercircle = "const outer = document.querySelectorAll('.mat-radio-outer-circle'); outer.forEach(box => { box.remove(); });"
  removeinnercircle = "const inner = document.querySelectorAll('.mat-radio-inner-circle'); inner.forEach(box => { box.remove(); });"
  makeradiosvisible = "for (elem of document.getElementsByClassName('cdk-visually-hidden')) { elem.classList.remove('cdk-visually-hidden'); }"
  driver.execute_script(removeoutercircle)
  driver.execute_script(removeinnercircle)
  driver.execute_script(makeradiosvisible)

makeradiovisiblefull()

print("radios made visible")

def passtos():
  makeradiovisible = 'document.getElementById("mat-radio-2-input").classList.remove("cdk-visually-hidden")'
  driver.execute_script(makeradiovisible)
  acceptradio = driver.find_element_by_css_selector("input#mat-radio-2-input")
  acceptradio.click()
  wait(1)
  proceed = driver.find_element_by_css_selector("input.check-now-btn.mr-right")
  proceed.click()
  print("accept tos clicked")

def selectdetailed():
  makeradiovisible = 'document.getElementById("mat-radio-6-input").classList.remove("cdk-visually-hidden")'
  wait(0.5)
  driver.execute_script(makeradiovisible)
  detailedradio = driver.find_element_by_id("mat-radio-6-input")
  detailedradio.click()

def inputmail():
  email = driver.find_element_by_css_selector("input[formcontrolname='email_id']")
  email.send_keys(inputs['email'])
  email.send_keys(Keys.TAB)
  print("inputted email")

def inputpassword():
  pwd = driver.find_element_by_css_selector("input[formcontrolname='password']")
  pwd.send_keys(inputs['password'])
  pwd.send_keys(Keys.TAB)
  print("inputted password")

def confirmpassword():
  pwd = driver.find_element_by_css_selector("input[formcontrolname='confirmPassword']")
  pwd.send_keys(inputs['password'])
  pwd.send_keys(Keys.TAB)
  print("confirmed password")

def choosetimeperiod():
  makeradiovisiblefull()
  makeradiovisible = 'document.getElementById("mat-radio-14-input").classList.remove("cdk-visually-hidden")'
  driver.execute_script(makeradiovisible)
  specifictp = driver.find_element_by_id("mat-radio-14-input")
  specifictp.click()

def allow0balancefolios():
  makeradiovisiblefull()
  makeradiovisible = 'document.getElementById("mat-radio-8-input").classList.remove("cdk-visually-hidden")'
  driver.execute_script(makeradiovisible)
  balancefolios = driver.find_element_by_id("mat-radio-8-input")
  balancefolios.click()

def settimeperiods():
  datesvg = driver.find_elements_by_css_selector("body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div.pad-lr > div > div:nth-child(2) > form > div.ng-star-inserted > div:nth-child(1) > mat-form-field > div > div.mat-form-field-flex > div.mat-form-field-suffix.ng-tns-c4-8.ng-star-inserted > mat-datepicker-toggle > button > span > svg")
  print("\n\n\n\n")
  print(datesvg)
  datesvg[0].click()
  wait(1)
  wideyear = driver.find_element_by_css_selector("button[aria-label='Choose month and year']")
  wideyear.click()
  prev20 = driver.find_element_by_css_selector("button[aria-label='Previous 20 years']")
  prev20.click()
  wait(0.5)
  prev20 = driver.find_element_by_css_selector("button[aria-label='Previous 20 years']")
  prev20.click()
  wait(0.5)
  prev20 = driver.find_element_by_css_selector("button[aria-label='Previous 20 years']")
  prev20.click()
  wait(0.5)
  yr1960 = driver.find_element_by_css_selector("td[aria-label='1960']")
  yr1960.click()
  wait(0.5)
  jan = driver.find_element_by_css_selector("td[aria-label='01-Jan-1960']")
  jan.click()
  wait(0.5)
  jan = driver.find_element_by_css_selector("td[aria-label='01-Jan-1960']")
  jan.click()
  wait(0.5)

def submit():
  submitbutton = driver.find_element_by_css_selector(("button[type='submit']"))
  submitbutton.click()

setdelay = 1
passtos()
wait(setdelay)
selectdetailed()
wait(setdelay)
choosetimeperiod()
wait(setdelay)
allow0balancefolios()
wait(setdelay)
settimeperiods()
inputmail()
wait(setdelay)
inputpassword()
wait(setdelay)
confirmpassword()
wait(setdelay)
# submit()
# wait(5)

print("\n\n\n")
raw = driver.page_source
divsuccesstext = driver.find_element_by_css_selector("body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div").text
innerdivtext = driver.find_element_by_css_selector("body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div > div:nth-child(4) > p").text

print(divsuccesstext)
print(innerdivtext)

"""
year button : <button cdkarialive="polite" class="mat-calendar-period-button mat-button" mat-button="" type="button" aria-label="Choose month and year"><span class="mat-button-wrapper">01-APR-2021<div class="mat-calendar-arrow"></div></span><div class="mat-button-ripple mat-ripple" matripple=""></div><div class="mat-button-focus-overlay"></div></button>
prev 20 years button: <button class="mat-calendar-previous-button mat-icon-button" mat-icon-button="" type="button" aria-label="Previous 20 years"><span class="mat-button-wrapper"></span><div class="mat-button-ripple mat-ripple mat-button-ripple-round" matripple=""></div><div class="mat-button-focus-overlay"></div></button>
1960: <td class="mat-calendar-body-cell ng-star-inserted" role="gridcell" tabindex="-1" aria-label="1960" aria-selected="false" style="width: 25%; padding-top: 7.14286%; padding-bottom: 7.14286%;"><div class="mat-calendar-body-cell-content">1960</div></td>
year button: input[aria-label='Choose month and year']
"""