; Gets data from excel and sends it to notepad
getExcelData(){
    local
    global RDA_Automation

    ; Open excel
    Run "C:\Users\294492\Documents\AutoHotkey\rda-ahk-main\test\pruebas.xlsx" ; Path to excel file
    WinWaitActive, ahk_class XLMAIN
    sleep 1000
    ; Create object and get data
    xlApp := ComObjActive("Excel.Application") ; Excel must be running.
    rangeStr := "A2:C2"
    MyRange := xlApp.Range(rangeStr) ; Get/save a reference to the specified Range.
    values := [] ; Array to store data
    Loop, % MyRange.Columns.Count()
        values.push(MyRange.Cells(1, A_Index).Text)
    ; Launch notepad
    automation := new RDA_Automation()
    automation.setActionDelay(500)
    windows := automation.windows() ; Get operations over Windows at OS level
    Run notepad.exe
    notepad := windows.waitOne({process: "notepad.exe"}) ; Waits to appear an element that match given query
    sleep 1000
    notepad.sendKeys("values from " . rangeStr . "{Enter}")
    Loop % values.Length() ; Write in notepad
        notepad.sendKeys(values[A_Index] . "{Enter}")
    Process, Close, EXCEL.EXE
    ExitApp
}
