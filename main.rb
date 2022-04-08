# setdelay = Random.new.rand(1..5) 
$setdelay = Random.new.rand(1) 
require 'selenium-webdriver'
require 'webdrivers'
$inputs = {
  "email" => "ujjwalthaakar@gmail.com",
  "password" => "bharosa12",
  "date" => ["specific", "04-Feb-1983", "20-Apr-2020"],
  "mode" => "normal"
}

pathused = "./webdrivers/install/dir"
Webdrivers.install_dir = pathused
options = Selenium::WebDriver::Chrome::Options.new
if $inputs['mode'] == "headless"
  options.add_argument('--headless')
end
$driver = Selenium::WebDriver.for :chrome, options: options
$driver.get("https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement")

$tab = Selenium::WebDriver::Keys::KEYS[:tab]

def makeradiovisiblefull()
  removeoutercircle = "const outer = document.querySelectorAll('.mat-radio-outer-circle'); outer.forEach(box => { box.remove(); });"
  removeinnercircle = "const inner = document.querySelectorAll('.mat-radio-inner-circle'); inner.forEach(box => { box.remove(); });"
  makeradiosvisible = "for (elem of document.getElementsByClassName('cdk-visually-hidden')) { elem.classList.remove('cdk-visually-hidden'); }"
  $driver.execute_script(removeoutercircle)
  $driver.execute_script(removeinnercircle)
  $driver.execute_script(makeradiosvisible)
end
makeradiovisiblefull()

def passtos()
  makeradiovisible = 'document.getElementById("mat-radio-2-input").classList.remove("cdk-visually-hidden")'
  $driver.execute_script(makeradiovisible)
  acceptradio = $driver.find_element(:css, "input#mat-radio-2-input")
  acceptradio.click()
  sleep(1)
  proceed = $driver.find_element(:css, "input.check-now-btn.mr-right")
  proceed.click()
  puts("accept tos clicked")
end

def selectdetailed()
  makeradiovisible = 'document.getElementById("mat-radio-6-input").classList.remove("cdk-visually-hidden")'
  sleep(0.5)
  $driver.execute_script(makeradiovisible)
  detailedradio = $driver.find_element(:id, "mat-radio-6-input")
  detailedradio.click()
end

def inputmail()
  email = $driver.find_element(:css, "input[formcontrolname='email_id']")
  email.send_keys($inputs['email'])
  email.send_keys($tab)
  print("inputted email")
end

def inputpassword()
  pwd = $driver.find_element(:css, "input[formcontrolname='password']")
  pwd.send_keys($inputs['password'])
  pwd.send_keys($tab)
  print("inputted password")
end

def confirmpassword()
  pwd = $driver.find_element(:css, "input[formcontrolname='confirmPassword']")
  pwd.send_keys($inputs['password'])
  pwd.send_keys($tab)
  print("confirmed password")
end

def choosetimeperiod()
  makeradiovisiblefull()
  makeradiovisible = 'document.getElementById("mat-radio-14-input").classList.remove("cdk-visually-hidden")'
  $driver.execute_script(makeradiovisible)
  specifictp = $driver.find_element(:id, "mat-radio-14-input")
  specifictp.click()
end

def allow0balancefolios()
  makeradiovisiblefull()
  makeradiovisible = 'document.getElementById("mat-radio-8-input").classList.remove("cdk-visually-hidden")'
  $driver.execute_script(makeradiovisible)
  balancefolios = $driver.find_element(:id, "mat-radio-8-input")
  balancefolios.click()
end

def settimeperiods()
  datesvg = $driver.find_elements(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div.pad-lr > div > div:nth-child(2) > form > div.ng-star-inserted > div:nth-child(1) > mat-form-field > div > div.mat-form-field-flex > div.mat-form-field-suffix.ng-tns-c4-8.ng-star-inserted > mat-datepicker-toggle > button > span > svg")
  print("\n\n\n\n")
  print(datesvg)
  datesvg[0].click()
  sleep(1)
  wideyear = $driver.find_element(:css, "button[aria-label='Choose month and year']")
  wideyear.click()
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
  sleep(0.5)
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
  sleep(0.5)
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
  sleep(0.5)
  yr1960 = $driver.find_element(:css, "td[aria-label='1960']")
  yr1960.click()
  sleep(0.5)
  jan = $driver.find_element(:css, "td[aria-label='01-Jan-1960']")
  jan.click()
  sleep(0.5)
  jan = $driver.find_element(:css, "td[aria-label='01-Jan-1960']")
  jan.click()
  sleep(0.5)
end

def submit()
  submitbutton = $driver.find_element(:css, ("button[type='submit']"))
  submitbutton.click()
end

def previousyearcategory()
  prev20 = $driver.find_element(:css, "button[aria-label='Previous 20 years']")
  prev20.click()
end
def settimeperiodsspecific()
  fromdate = $inputs["date"][1]
  fromyear = fromdate.split("-")[2]
  puts "#{fromyear}\n"
  frommonth = fromdate.split("-")[1]
  puts "#{frommonth}\n"
  todate = $inputs["date"][2]
  toyear = todate.split("-")[2]
  tomonth = todate.split("-")[1]

  #fromdate
  fromdatesvg = $driver.find_element(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div.pad-lr > div > div:nth-child(2) > form > div.ng-star-inserted > div:nth-child(1) > mat-form-field > div > div.mat-form-field-flex > div.mat-form-field-suffix.ng-tns-c4-8.ng-star-inserted > mat-datepicker-toggle > button > span > svg")
  fromdatesvg.click()
  wideyear = $driver.find_element(:css, "button[aria-label='Choose month and year']")
  wideyear.click()
  while true
    year = $driver.find_elements(:css, "td[aria-label='#{fromyear}']")
    if year.length > 0
      year[0].click()
      break
    else
      previousyearcategory()
    end
    sleep(0.1)
  end
  month = $driver.find_element(:css, "td[aria-label='01-#{frommonth}-#{fromyear}']")
  month.click()
  sleep(0.5)
  day = $driver.find_element(:css, "td[aria-label='#{fromdate}']")
  day.click()

  #todate
  todatesvg = $driver.find_element(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div.pad-lr > div > div:nth-child(2) > form > div.ng-star-inserted > div:nth-child(2) > mat-form-field > div > div.mat-form-field-flex > div.mat-form-field-suffix.ng-tns-c4-9.ng-star-inserted > mat-datepicker-toggle > button > span > svg")
  todatesvg.click()
  wideyear = $driver.find_element(:css, "button[aria-label='Choose month and year']")
  wideyear.click()
  while true
    year = $driver.find_elements(:css, "td[aria-label='#{toyear}']")
    if year.length > 0
      year[0].click()
      break
    else
      previousyearcategory()
    end
    sleep(0.1)
  end
  month = $driver.find_element(:css, "td[aria-label='01-#{tomonth}-#{toyear}']")
  month.click()
  sleep(0.5)
  day = $driver.find_element(:css, "td[aria-label='#{todate}']")
  day.click()
end

passtos()
sleep($setdelay)
selectdetailed()
sleep($setdelay)
choosetimeperiod()
sleep($setdelay)
# allow0balancefolios()
# sleep($setdelay)
settimeperiodsspecific()
# inputmail()
# sleep($setdelay)
# inputpassword()
# sleep($setdelay)
# confirmpassword()
# sleep($setdelay)
# submit()
# sleep(5)
puts("\n\n\n\n\n")
raw = $driver.page_source
# divsuccesstext = $driver.find_element(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div").text
# innerdivtext = $driver.find_element(:css, "body > app-root > div > app-investtransact > div.correct-details.ng-star-inserted > div > div:nth-child(1) > div:nth-child(2) > div > app-statements > div > div > div > div:nth-child(4) > p").text
# m = innerdivtext.match /Your CAMS \+ KFintech summary has been sent to your registered email id (.+) Your reference number is (.+)./
# puts "email: " + m[1] + "\n"
# puts "reference number": m[2] + "\n"
# puts "delay used: "+ $setdelay
# # puts(divsuccesstext)
# puts("\n")
# print(innerdivtext)
sleep