; Creación objetos
driver:=ComObjCreate("Selenium.CHROMEDriver")
; Formulario para hacer login
driver.Get("https://the-internet.herokuapp.com/login")
userName := "tomsmith"
userPass := "SuperSecretPassword!"
driver.findElementbyXpath("//input[@id='username']").sendKeys(userName)
driver.findElementbyXpath("//input[@id='password']").sendKeys(userPass)
driver.findElementByXpath("//button[@type='submit']").click()
sleep 5000
