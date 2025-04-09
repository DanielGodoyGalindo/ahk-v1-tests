getUIAElemnt(win){
    uiaWin := win.asUIAElement()
    RDA_Log_Debug(uiaWin.dumpXML())
    return uiaWin
}

class Test_RDA_Notepad {
    Begin() {
    }

    Test_Automation_UIA_Notepad(){
        local 
        global RDA_Automation, Yunit

        RDA_Log_Debug(A_ThisFunc)

        ; open notepad, get data from user, change size and show user input and date
        
        automation := new RDA_Automation()
        automation.setActionDelay(500)
        windows := automation.windows() ; Get operations over Windows at OS level
        Run notepad.exe
        notepad := windows.waitOne({process: "notepad.exe"}) ; Waits to appear an element that match given query
        notepad.sendKeys("^e") ; Sends simulated keystrokes
        notepad.sendKeys("{Delete}")
        InputBox, userString, Write something... ; Get data from user
        InputBox, textSize, Choose text size:
        ; userString := "hola que tal"
        ; textSize:= "10"
        uiaWin := getUIAElemnt(notepad)
        uiaWin.findOne("//MenuItem[@Name=""Editar""]").highlight().click()
        uiaWin := getUIAElemnt(notepad)
        uiaWin.findOne("//MenuItem[@Name=""Fuente""]").highlight().click()
        uiaWin := getUIAElemnt(notepad)
        comboBoxElements := uiaWin.find("//ComboBox") ; Get all ComboBox Element
        ; comboBoxElements[1] --> Abrir archivos
        ; comboBoxElements[2] --> Tamaño
        comboBoxElements[2].highlight().click()
        Send, % textSize
        notepad.sendKeys("{Enter}")
        uiaWin := getUIAElemnt(notepad)
        grupoFuente := uiaWin.findOne("//Group[@name=""Fuente""]")
        grupoFuente.highlight().click()
        notepad.sendKeys("{Backspace}")
        Send, % userString
        notepad.sendKeys("{Enter}{F5}")
    }

    End() {
    }

}
