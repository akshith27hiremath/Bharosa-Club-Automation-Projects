require 'webdrivers'
require 'selenium-webdriver'
pathused = "./webdrivers/install/dir"
Webdrivers.install_dir = pathused
# Selenium::WebDriver::Chrome.driver_path = pathused
$driver = Selenium::WebDriver.for :chrome
$driver.get("https://www.camsonline.com/Investors/Statements/Consolidated-Account-Statement")
sleep