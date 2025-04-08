
  Test_14_Automation_UIA() {
    local 
    global RDA_Automation, Yunit

    RDA_Log_Debug(A_ThisFunc)

    cambio := false
    automation := new RDA_Automation()
    automation.setActionDelay(500)
    windows := automation.windows()
    ; mouse := automation.mouse()
    ; wins := windows.get()
    ; try {
    ;   Yunit.assert(wins.Length() > 0, "There are no windows")
    ;   MsgBox % "Numero de ventanas: " . wins.Length()
    ; } catch e {
    ;   MsgBox % e.Message
    ; }

    ; Abrir notepad / escribir / cambiar tipo de fuente
    Run notepad.exe
    win := windows.waitOne({process: "notepad.exe"})
    sleep 1000
    win.sendKeys("prueba")
    ; win.move(A_ScreenWidth / 2 , A_ScreenHeight/ 2)
    win.sendKeys("^e")
    ; win.resize(600,600)
    uiaWin := win.asUIAElement()
    RDA_Log_Debug(uiaWin.dumpXML())
    btnEditar := uiaWin.findOne("//MenuItem[@Name=""Editar""]")
    btnEditar.click()
    uiaWin := win.asUIAElement()
    RDA_Log_Debug(uiaWin.dumpXML())
    btnFuente := uiaWin.findOne("//MenuItem[@Name=""Fuente""]")
    btnFuente.click()
    RDA_Log_Debug(uiaWin.dumpXML())
    uiaWin := win.asUIAElement()
    familia := uiaWin.findOne("//ComboBox[@name=""Familia""]")
    tipoLetra := uiaWin.findOne("//ComboBox[@name=""Familia""]/ListItem")
    if (tipoLetra.getName() != "Arial") {
      familia.highlight().click()
      win.sendKeys("Arial").sendKeys("{Enter}")
      cambio := true
    }
    RDA_Log_Debug(uiaWin.dumpXML())
    grupoFuente := uiaWin.findOne("//Group[@name=""Fuente""]")
    grupoFuente.highlight().click()
    win.sendKeys("{Backspace}")
    if (cambio){
      win.sendKeys("Se ha cambiado la fuente a Arial")
    }
}
