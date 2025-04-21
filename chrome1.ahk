; Creación objetos
driver:=ComObjCreate("Selenium.CHROMEDriver")
teclas := ComObjCreate("Selenium.Keys")
; Ejecución
driver.Get("https://www.google.com/?hl=es")
boton := driver.findElementbyXpath("//button[@id='W0wltc']")
boton.click()
elemento := driver.findElementbyXpath("//textarea[@name='q']")
elemento.Click()
elemento.sendKeys("hola")
elemento.SendKeys(teclas.Enter)
Sleep, 10000
