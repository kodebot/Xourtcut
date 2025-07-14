whiteColour  = 0xf8f8f2
redColour    = 0xF25C54
greenColour  = 0x06D6A0
blueColour   = 0x1FA2F3
yellowColour = 0xFFD166
cyanColour   = 0x8BE9FD
orangeColour = 0xFF9F58
purpleColour = 0xbd93f9
pinkColour   = 0xff79c6
blackColour  = 0x000000


-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  print("Xourtcut Plugin initUi called\n");
  ref = app.registerUi({["menu"] = "Arrow", ["callback"] = "clickArrow", ["accelerator"] = "a"});
  ref = app.registerUi({["menu"] = "Circle", ["callback"] = "clickCircle", ["accelerator"] = "c"});
  ref = app.registerUi({["menu"] = "Delete", ["callback"] = "clickDelete", ["accelerator"] = "d"});
  ref = app.registerUi({["menu"] = "Eraser", ["callback"] = "clickEraser", ["accelerator"] = "e"});
  ref = app.registerUi({["menu"] = "Rectangle", ["callback"] = "clickRectangle", ["accelerator"] = "r"});
  ref = app.registerUi({["menu"] = "Select Region", ["callback"] = "clickSelectRegion", ["accelerator"] = "s"});
  ref = app.registerUi({["menu"] = "Line", ["callback"] = "clickLine", ["accelerator"] = "n"});
  ref = app.registerUi({["menu"] = "Pen", ["callback"] = "clickPen", ["accelerator"] = "w"});
  ref = app.registerUi({["menu"] = "Text", ["callback"] = "clickText", ["accelerator"] = "t"});
  ref = app.registerUi({["menu"] = "Fill", ["callback"] = "clickFill", ["accelerator"] = "f"});
  ref = app.registerUi({["menu"] = "Colour white", ["callback"] = "clickWhiteColour", ["accelerator"] = "1"});
  ref = app.registerUi({["menu"] = "Colour red", ["callback"] = "clickRedColour", ["accelerator"] = "2"});
  ref = app.registerUi({["menu"] = "Colour green", ["callback"] = "clickGreenColour", ["accelerator"] = "3"});
  ref = app.registerUi({["menu"] = "Colour blue", ["callback"] = "clickBlueColour", ["accelerator"] = "4"});
  ref = app.registerUi({["menu"] = "Colour purple", ["callback"] = "clickPurpleColour", ["accelerator"] = "5"});
  ref = app.registerUi({["menu"] = "Colour yellow", ["callback"] = "clickYellowColour", ["accelerator"] = "6"});
  ref = app.registerUi({["menu"] = "Colour pink", ["callback"] = "clickPinkColour", ["accelerator"] = "7"});
  ref = app.registerUi({["menu"] = "Colour cyan", ["callback"] = "clickCyanColour", ["accelerator"] = "8"});
  ref = app.registerUi({["menu"] = "Colour orange", ["callback"] = "clickOrangeColour", ["accelerator"] = "9"});
  ref = app.registerUi({["menu"] = "Colour black", ["callback"] = "clickBlackColour", ["accelerator"] = "0"});
  -- layer actions
  ref = app.registerUi({["menu"] = "Show Next Layer", ["callback"] = "showNextLayer", ["accelerator"] = "l"});
  ref = app.registerUi({["menu"] = "Show Previous Layer", ["callback"] = "showPreviousLayer", ["accelerator"] = "h"});
  ref = app.registerUi({["menu"] = "Hide All Layers but 1", ["callback"] = "hideAllLayersBut1", ["accelerator"] = "<Shift>h"});
  ref = app.registerUi({["menu"] = "Show Top Layer", ["callback"] = "showTopLayer", ["accelerator"] = "<Shift>l"});
  ref = app.registerUi({["menu"] = "Add New Top Layer", ["callback"] = "addNewTopLayer", ["accelerator"] = "<Ctrl>l"});
  ref = app.registerUi({["menu"] = "Delete Top Layer", ["callback"] = "deleteTopLayer", ["accelerator"] = "<Ctrl>h"});
  print("Xourtcut plugin registered\n");
end

-- Callback if the menu item is executed

-- shortcut A
function clickArrow()
  local currentToolInfo = app.getToolInfo("active")
  cleanShape()
  if currentToolInfo and currentToolInfo.drawingType == "arrow" then
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_DOUBLE_ARROW"})
  else
    app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW"})
  end
end

-- shortcut C
function clickCircle()
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE"})
end

-- shortcut D
function clickDelete()
  app.uiAction({["action"] = "ACTION_DELETE"})
end

-- shortcut E
function clickEraser()
  app.uiAction({["action"] = "ACTION_TOOL_ERASER"})
end

-- shortcut N
function clickLine()
  cleanShape()
  app.uiAction({["action"] = "ACTION_RULER"})
end

-- shortcut R
function clickRectangle()
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT"})
end

-- shortcut S
function clickSelectRegion()
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_REGION"})
end

-- shortcut W
function clickPen()
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
  -- needed twice to register
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

function clickText()
  app.uiAction({["action"] = "ACTION_TOOL_TEXT"})
end

function clickFill()
  app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = true})
end

-- shortcut 1
function clickWhiteColour()
  changeToolColour(whiteColour)
end

-- shortcut 2
function clickRedColour()
  changeToolColour(redColour)
end

-- shortcut 3
function clickGreenColour()
  changeToolColour(greenColour)
end

-- shortcut 4
function clickBlueColour()
  changeToolColour(blueColour)
end

-- shortcut 5
function clickYellowColour()
  changeToolColour(yellowColour)
end

-- shortcut 6
function clickCyanColour()
  changeToolColour(cyanColour)
end

-- shortcut 7
function clickOrangeColour()
  changeToolColour(orangeColour)
end

-- shortcut 8
function clickPurpleColour()
  changeToolColour(purpleColour)
end

-- shortcut 9
function clickPinkColour()
  changeToolColour(pinkColour)
end

-- shortcut 0
function clickBlackColour()
  changeToolColour(blackColour)
end

-- color
function changeToolColour(colour)
  local result = app.changeToolColor({["color"] = colour, ["selection"] = true})

  -- change text tool colour too, because (with the default template) the TEX tool also uses that colour
  app.changeToolColor({["color"] = colour, ["tool"] = "TEXT"})
end

function hideAllLayersBut1()
  local docStructure = app.getDocumentStructure()
  local page = docStructure["currentPage"]
  local numPages = #docStructure["pages"]

  for i=1, numPages do
    app.setCurrentPage(i)
    app.setCurrentLayer(1, true)  -- makes background layer and layer 1 visible and all other layers invisible
  end
  
  app.setCurrentPage(page)
end

function showTopLayer()
  local docStructure = app.getDocumentStructure()
  local page = docStructure["currentPage"]
  local numPages = #docStructure["pages"]

  for i=1, numPages do
    app.setCurrentPage(i)
    app.layerAction("ACTION_GOTO_TOP_LAYER")
  end
  
  app.setCurrentPage(page)
end

function addNewTopLayer()
  local docStructure = app.getDocumentStructure()
  local numPages = #docStructure["pages"]
  local page = docStructure["currentPage"]
  
  for i=1, numPages do
    app.setCurrentPage(i)
    app.layerAction("ACTION_GOTO_TOP_LAYER")
    app.layerAction("ACTION_NEW_LAYER")  
  end
  
  app.setCurrentPage(page)
end

function deleteTopLayer()
  local docStructure = app.getDocumentStructure()
  local numPages = #docStructure["pages"]
  local page = docStructure["currentPage"]
  
  for i=1, numPages do
    app.setCurrentPage(i)
    app.layerAction("ACTION_GOTO_TOP_LAYER")
    app.layerAction("ACTION_DELETE_LAYER")  
  end
  
  app.setCurrentPage(page)
end

function showNextLayer()
  local docStructure = app.getDocumentStructure()
  local page = docStructure["currentPage"]
  local numPages = #docStructure["pages"]

  for i=1, numPages do
    app.setCurrentPage(i)
    app.layerAction("ACTION_GOTO_NEXT_LAYER")
  end
  
  app.setCurrentPage(page)
end

function showPreviousLayer()
  local docStructure = app.getDocumentStructure()
  local page = docStructure["currentPage"]
  local numPages = #docStructure["pages"]

  for i=1, numPages do
    app.setCurrentPage(i)
    app.layerAction("ACTION_GOTO_PREVIOUS_LAYER")
  end
  
  app.setCurrentPage(page)
end


-- helper functions
function cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = false, ["enabled"] = false})

  app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN"})
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

