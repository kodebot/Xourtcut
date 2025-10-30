whiteColour  = 0xf8f8f2
redColour    = 0xF25C54
greenColour  = 0x06D6A0
blueColour   = 0x1FA2F3
yellowColour = 0xFFD166
cyanColour   = 0x8BE9FD
orangeColour = 0xFF9F58
purpleColour = 0xbd93f9
pinkColour   = 0xff79c6
brownColour  = 0x8B4513
blackColour  = 0x000000

-- Global flag to enable or disable logging
local enableLogging = true  -- Set to false to disable all logs

-- Custom logging function
local function log(message)
  if enableLogging then
    print(message)
  end
end

-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  log("Xourtcut Plugin initUi called\n")
  ref = app.registerUi({["menu"] = "Arrow", ["callback"] = "clickArrow", ["accelerator"] = "a"});
  ref = app.registerUi({["menu"] = "Circle", ["callback"] = "clickCircle", ["accelerator"] = "c"});
  ref = app.registerUi({["menu"] = "Delete", ["callback"] = "clickDelete", ["accelerator"] = "d"});
  ref = app.registerUi({["menu"] = "Eraser", ["callback"] = "clickEraser", ["accelerator"] = "e"});
  ref = app.registerUi({["menu"] = "Rectangle", ["callback"] = "clickRectangle", ["accelerator"] = "r"});
  ref = app.registerUi({["menu"] = "Select Region", ["callback"] = "clickSelectRegion", ["accelerator"] = "s"});
  ref = app.registerUi({["menu"] = "Line", ["callback"] = "clickLine", ["accelerator"] = "n"});
  ref = app.registerUi({["menu"] = "Pen", ["callback"] = "clickPen", ["accelerator"] = "w"});
  ref = app.registerUi({["menu"] = "Text", ["callback"] = "clickText", ["accelerator"] = "t"});
  ref = app.registerUi({["menu"] = "LaTeX", ["callback"] = "clickLaTeX", ["accelerator"] = "m"});
  ref = app.registerUi({["menu"] = "Toggle Fill", ["callback"] = "toggleFill", ["accelerator"] = "f"});
  ref = app.registerUi({["menu"] = "Show Fill Opacity Dialog", ["callback"] = "showFillOpacityDialog", ["accelerator"] = "<ctrl>f"});
  ref = app.registerUi({["menu"] = "Toggle Line Style", ["callback"] = "toggleLineStyle", ["accelerator"] = "z"});
  ref = app.registerUi({["menu"] = "Colour white", ["callback"] = "clickWhiteColour", ["accelerator"] = "1"});
  ref = app.registerUi({["menu"] = "Colour red", ["callback"] = "clickRedColour", ["accelerator"] = "2"});
  ref = app.registerUi({["menu"] = "Colour green", ["callback"] = "clickGreenColour", ["accelerator"] = "3"});
  ref = app.registerUi({["menu"] = "Colour blue", ["callback"] = "clickBlueColour", ["accelerator"] = "4"});
  ref = app.registerUi({["menu"] = "Colour purple", ["callback"] = "clickPurpleColour", ["accelerator"] = "5"});
  ref = app.registerUi({["menu"] = "Colour yellow", ["callback"] = "clickYellowColour", ["accelerator"] = "6"});
  ref = app.registerUi({["menu"] = "Colour pink", ["callback"] = "clickPinkColour", ["accelerator"] = "7"});
  ref = app.registerUi({["menu"] = "Colour cyan", ["callback"] = "clickCyanColour", ["accelerator"] = "8"});
  -- ref = app.registerUi({["menu"] = "Colour brown", ["callback"] = "clickBrownColour", ["accelerator"] = "8"});
  ref = app.registerUi({["menu"] = "Colour orange", ["callback"] = "clickOrangeColour", ["accelerator"] = "9"});
  ref = app.registerUi({["menu"] = "Colour black", ["callback"] = "clickBlackColour", ["accelerator"] = "0"});
  ref = app.registerUi({["menu"] = "Increase Pen Size", ["callback"] = "increasePenSize", ["accelerator"] = "equal"});
  ref = app.registerUi({["menu"] = "Decrease Pen Size", ["callback"] = "decreasePenSize", ["accelerator"] = "minus"});
  -- layer actions
  ref = app.registerUi({["menu"] = "Show Next Layer (Current Page)", ["callback"] = "showNextLayerInCurrentPage", ["accelerator"] = "F2"});
  ref = app.registerUi({["menu"] = "Show Previous Layer (Current Page)", ["callback"] = "showPreviousLayerInCurrentPage", ["accelerator"] = "F1"});
  ref = app.registerUi({["menu"] = "Hide All Layers but 1 (All Page)", ["callback"] = "hideAllLayersBut1", ["accelerator"] = "<Shift>h"});
  ref = app.registerUi({["menu"] = "Show Top Layer (All Page)", ["callback"] = "showTopLayer", ["accelerator"] = "<Shift>l"});
  ref = app.registerUi({["menu"] = "Add New Top Layer (Current Page)", ["callback"] = "addNewTopLayerInCurrentPage", ["accelerator"] = "<Ctrl>l"});
  ref = app.registerUi({["menu"] = "Delete Top Layer (Current Page)", ["callback"] = "deleteTopLayerInCurrentPage", ["accelerator"] = "<Ctrl>h"});
  ref = app.registerUi({["menu"] = "Move Selection Layer Up", ["callback"] = "moveSelectionLayerUp", ["accelerator"] = "u"});
  ref = app.registerUi({["menu"] = "Move Selection Layer Down", ["callback"] = "moveSelectionLayerDown", ["accelerator"] = "b"});
  ref = app.registerUi({["menu"] = "Move Selection Layer Down and Add New Layer Below", ["callback"] = "moveSelectionLayerDownAndAddNewLayerBelow", ["accelerator"] = "<Ctrl>b"});
  ref = app.registerUi({["menu"] = "Add New Layer Above Current", ["callback"] = "addNewLayerAboveCurrent", ["accelerator"] = "<Ctrl>k"});
  ref = app.registerUi({["menu"] = "Add New Layer Below Current", ["callback"] = "addNewLayerBelowCurrent", ["accelerator"] = "<Ctrl>j"});
  log("Xourtcut plugin registered\n");
end

-- Callback if the menu item is executed

-- shortcut A
function clickArrow()
  log("clickArrow called")
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
  log("clickCircle called")
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE"})
  app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = true})
end

-- shortcut D
function clickDelete()
  log("clickDelete called")
  app.uiAction({["action"] = "ACTION_DELETE"})
end

-- shortcut E
function clickEraser()
  log("clickEraser called")
  app.uiAction({["action"] = "ACTION_TOOL_ERASER"})
end

-- shortcut N
function clickLine()
  log("clickLine called")
  cleanShape()
  app.uiAction({["action"] = "ACTION_RULER"})
end

-- shortcut R
function clickRectangle()
  log("clickRectangle called")
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT"})
  app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = true})
end

-- shortcut S
function clickSelectRegion()
  log("clickSelectRegion called")
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_REGION"})
end

-- shortcut W
function clickPen()
  log("clickPen called")
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
  -- needed twice to register
  cleanShape()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

function clickText()
  log("clickText called")
  app.uiAction({["action"] = "ACTION_TOOL_TEXT"})
end

function clickLaTeX()
  log("clickLaTeX called")
  app.uiAction({["action"] = "ACTION_TEX"})
end

function toggleFill()
  log("toggleFill called")
  local currentToolInfo = app.getToolInfo("active")
  print_table(currentToolInfo)
  if currentToolInfo and currentToolInfo.fillOpacity > -1 then
    app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = false, ["enabled"] = false})
  else
    app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = true})
  end
end

function showFillOpacityDialog()
  log("showFillOpacityDialog called")
    app.uiAction({["action"] = "ACTION_TOOL_PEN_FILL_OPACITY"})
end

function clickWhiteColour()
  log("clickWhiteColour called")
  changeToolColour(whiteColour)
end

function clickRedColour()
  log("clickRedColour called")
  changeToolColour(redColour)
end

function clickGreenColour()
  log("clickGreenColour called")
  changeToolColour(greenColour)
end

function clickBlueColour()
  log("clickBlueColour called")
  changeToolColour(blueColour)
end

function clickYellowColour()
  log("clickYellowColour called")
  changeToolColour(yellowColour)
end

function clickCyanColour()
  log("clickCyanColour called")
  changeToolColour(cyanColour)
end

function clickBrownColour()
  log("clickBrownColour called")
  changeToolColour(brownColour)
end

function clickOrangeColour()
  log("clickOrangeColour called")
  changeToolColour(orangeColour)
end

function clickPurpleColour()
  log("clickPurpleColour called")
  changeToolColour(purpleColour)
end

function clickPinkColour()
  log("clickPinkColour called")
  changeToolColour(pinkColour)
end

function clickBlackColour()
  log("clickBlackColour called")
  changeToolColour(blackColour)
end

-- color
function changeToolColour(colour)
  log("changeToolColour called with colour: " .. tostring(colour))
  local result = app.changeToolColor({["color"] = colour, ["selection"] = true})

  -- change text tool colour too, because (with the default template) the TEX tool also uses that colour
  app.changeToolColor({["color"] = colour, ["tool"] = "TEXT"})
end

-- pen size
function increasePenSize()
  log("increasePenSize called")
  local activeTool = app.getToolInfo("active")
  log("activeTool type: " .. activeTool["type"])
  local toolType = activeTool["type"]
  local toolInfo
  local actionPrefix
  if toolType == "pen" then
    toolInfo = app.getToolInfo("pen")
    actionPrefix = "ACTION_TOOL_PEN_SIZE_"
    local sizeStr = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
    log("pen size: " .. sizeStr)
  elseif toolType == "highlighter" then
    toolInfo = app.getToolInfo("highlighter")
    actionPrefix = "ACTION_TOOL_HIGHLIGHTER_SIZE_"
    local sizeStr = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
    log("highlighter size: " .. sizeStr)
  elseif toolType == "eraser" then
    toolInfo = app.getToolInfo("eraser")
    actionPrefix = "ACTION_TOOL_ERASER_SIZE_"
    local sizeStr = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
    log("eraser size: " .. sizeStr)
  else
    log("unsupported tool type")
    return
  end
  local currentSize = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
  local sizes = {"veryThin", "thin", "medium", "thick", "veryThick"}
  local sizeToAction = {veryThin = "VERY_FINE", thin = "FINE", medium = "MEDIUM", thick = "THICK", veryThick = "VERY_THICK"}
  for i, size in ipairs(sizes) do
    log("checking " .. size .. " == " .. currentSize)
    if size == currentSize then
      if i < #sizes then
        log("increasing to " .. sizes[i+1])
        app.uiAction({["action"] = actionPrefix .. sizeToAction[sizes[i+1]]})
      else
        log("already max")
      end
      break
    end
  end
end

function decreasePenSize()
  log("decreasePenSize called")
  local activeTool = app.getToolInfo("active")
  log("activeTool type: " .. activeTool["type"])
  local toolType = activeTool["type"]
  local toolInfo
  local actionPrefix
  if toolType == "pen" then
    toolInfo = app.getToolInfo("pen")
    actionPrefix = "ACTION_TOOL_PEN_SIZE_"
    local sizeStr = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
    log("pen size: " .. sizeStr)
  elseif toolType == "highlighter" then
    toolInfo = app.getToolInfo("highlighter")
    actionPrefix = "ACTION_TOOL_HIGHLIGHTER_SIZE_"
    local sizeStr = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
    log("highlighter size: " .. sizeStr)
  elseif toolType == "eraser" then
    toolInfo = app.getToolInfo("eraser")
    actionPrefix = "ACTION_TOOL_ERASER_SIZE_"
    local sizeStr = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
    log("eraser size: " .. sizeStr)
  else
    log("unsupported tool type")
    return
  end
  local currentSize = type(toolInfo["size"]) == "table" and toolInfo["size"]["name"] or toolInfo["size"]
  local sizes = {"veryThin", "thin", "medium", "thick", "veryThick"}
  local sizeToAction = {veryThin = "VERY_FINE", thin = "FINE", medium = "MEDIUM", thick = "THICK", veryThick = "VERY_THICK"}
  for i, size in ipairs(sizes) do
    log("checking " .. size .. " == " .. currentSize)
    if size == currentSize then
      if i > 1 then
        log("decreasing to " .. sizes[i-1])
        app.uiAction({["action"] = actionPrefix .. sizeToAction[sizes[i-1]]})
      else
        log("already min")
      end
      break
    end
  end
end

function hideAllLayersBut1()
  log("hideAllLayersBut1 called")
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
  log("showTopLayer called")
  local docStructure = app.getDocumentStructure()
  local page = docStructure["currentPage"]
  local numPages = #docStructure["pages"]

  for i=1, numPages do
    app.setCurrentPage(i)
    app.layerAction("ACTION_GOTO_TOP_LAYER")
  end
  
  app.setCurrentPage(page)
end

-- function addNewTopLayer()
--   local docStructure = app.getDocumentStructure()
--   local numPages = #docStructure["pages"]
--   local page = docStructure["currentPage"]
  
--   for i=1, numPages do
--     app.setCurrentPage(i)
--     app.layerAction("ACTION_GOTO_TOP_LAYER")
--     app.layerAction("ACTION_NEW_LAYER")  
--   end
  
--   app.setCurrentPage(page)
-- end

function addNewTopLayerInCurrentPage()
  log("addNewTopLayerInCurrentPage called")
  app.layerAction("ACTION_GOTO_TOP_LAYER")
  app.layerAction("ACTION_NEW_LAYER")  
  app.uiAction({["action"] = "ACTION_SAVE"})
end

-- function deleteTopLayer()
--   local docStructure = app.getDocumentStructure()
--   local numPages = #docStructure["pages"]
--   local page = docStructure["currentPage"]
  
--   for i=1, numPages do
--     app.setCurrentPage(i)
--     app.layerAction("ACTION_GOTO_TOP_LAYER")
--     app.layerAction("ACTION_DELETE_LAYER")  
--   end
  
--   app.setCurrentPage(page)
-- end

function deleteTopLayerInCurrentPage()
  log("deleteTopLayerInCurrentPage called")
  app.layerAction("ACTION_GOTO_TOP_LAYER")
  app.layerAction("ACTION_DELETE_LAYER")  
  app.uiAction({["action"] = "ACTION_SAVE"})
end

-- function showNextLayer()
--   local docStructure = app.getDocumentStructure()
--   local page = docStructure["currentPage"]
--   local numPages = #docStructure["pages"]

--   for i=1, numPages do
--     app.setCurrentPage(i)
--     app.layerAction("ACTION_GOTO_NEXT_LAYER")
--   end
  
--   app.setCurrentPage(page)
-- end

function showNextLayerInCurrentPage()
  log("showNextLayerInCurrentPage called")
  app.layerAction("ACTION_GOTO_NEXT_LAYER")
end

-- function showPreviousLayer()
--   local docStructure = app.getDocumentStructure()
--   local page = docStructure["currentPage"]
--   local numPages = #docStructure["pages"]

--   for i=1, numPages do
--     app.setCurrentPage(i)
--     app.layerAction("ACTION_GOTO_PREVIOUS_LAYER")
--   end
  
--   app.setCurrentPage(page)
-- end

function showPreviousLayerInCurrentPage()
  log("showPreviousLayerInCurrentPage called")
  app.layerAction("ACTION_GOTO_PREVIOUS_LAYER")
end

function moveSelectionLayerUp()
  log("moveSelectionLayerUp called")
  -- Check if there's a selection first
  local docStructure = app.getDocumentStructure()
  if not docStructure then
    log("No document structure available")
    return
  end
  
  -- Get current page and layer info
  local currentPage = docStructure["currentPage"]
  local pages = docStructure["pages"]
  if not pages or not pages[currentPage] then
    log("Invalid page structure")
    return
  end
  
  local currentLayerIndex = pages[currentPage]["currentLayer"]
  local numLayers = #pages[currentPage]["layers"]
  
  if currentLayerIndex >= numLayers then
    log("Already at top layer, cannot move selection up")
    return
  end
  
  -- Perform the action with error handling
  local success = pcall(function()
    app.uiAction({["action"] = "ACTION_MOVE_SELECTION_LAYER_UP"})
  end)
  
  if success then
    app.setCurrentLayer(currentLayerIndex - 1, false)
    app.setCurrentLayer(currentLayerIndex, false)
    app.uiAction({["action"] = "ACTION_SAVE"})
  else
    log("Failed to move selection layer up")
  end
end

function moveSelectionLayerDown()
  log("moveSelectionLayerDown called")
  -- Check if there's a selection first
  local docStructure = app.getDocumentStructure()
  if not docStructure then
    log("No document structure available")
    return
  end
  
  -- Get current page and layer info
  local currentPage = docStructure["currentPage"]
  local pages = docStructure["pages"]
  if not pages or not pages[currentPage] then
    log("Invalid page structure")
    return
  end
  
  local currentLayerIndex = pages[currentPage]["currentLayer"]
  if currentLayerIndex <= 1 then
    log("Already at bottom layer, cannot move selection down")
    return
  end
  
  -- Perform the action with error handling
  local success = pcall(function()
    app.uiAction({["action"] = "ACTION_MOVE_SELECTION_LAYER_DOWN"})
  end)
  
  if success then
    -- refresh layer view  
    app.setCurrentLayer(currentLayerIndex + 1, false)
    app.setCurrentLayer(currentLayerIndex, false)
    app.uiAction({["action"] = "ACTION_SAVE"})
  else
    log("Failed to move selection layer down")
  end
end

function moveSelectionLayerDownAndAddNewLayerBelow()
  log("=== Starting moveSelectionLayerDownAndAddNewLayerBelow ===")

  -- Check if there's a selection first
  log("Checking document structure...")
  local docStructure = app.getDocumentStructure()
  if not docStructure then
    log("ERROR: No document structure available")
    return
  end
  log("Document structure obtained successfully")

  -- Get current page and layer info
  local currentPage = docStructure["currentPage"]
  local pages = docStructure["pages"]
  log("Current page: " .. tostring(currentPage))
  log("Pages table exists: " .. tostring(pages ~= nil))
  if not pages or not pages[currentPage] then
    log("ERROR: Invalid page structure")
    return
  end
  log("Page structure valid")

  local currentLayerIndex = pages[currentPage]["currentLayer"]
  local numLayers = #pages[currentPage]["layers"]
  log("Current layer index: " .. tostring(currentLayerIndex))
  log("Total layers: " .. tostring(numLayers))

  if currentLayerIndex <= 0 then
    log("WARNING: Already at bottom layer (index " .. tostring(currentLayerIndex) .. "), cannot move selection down")
    return
  end
  log("Layer index valid for moving down")

  -- Check if there's actually a selection
  log("Checking for active selection...")
  local activeTool = app.getToolInfo("active")
  log("Active tool info: " .. (activeTool and tostring(activeTool.type) or "nil"))
  -- Note: We can't directly check for selection, but tool type might give a hint

  -- Perform the move action with error handling
  log("Attempting to move selection layer down...")
  local moveSuccess, moveError = pcall(function()
    app.uiAction({["action"] = "ACTION_MOVE_SELECTION_LAYER_DOWN"})
  end)

  if not moveSuccess then
    log("ERROR: Failed to move selection layer down. Error: " .. tostring(moveError))
    return
  end
  log("Successfully moved selection layer down")

  -- Refresh layer view like in moveSelectionLayerDown
  log("Refreshing layer view...")
  pcall(function()
    app.setCurrentLayer(currentLayerIndex - 1, false)
    app.setCurrentLayer(currentLayerIndex, false)
  end)

  -- Add new layer below current with error handling (assuming current layer is now the moved position)
  log("Attempting to add new layer below current...")
  local addSuccess, addError = pcall(function()
    addNewLayerBelowCurrent()
  end)
  
  if not addSuccess then
    log("ERROR: Failed to add new layer below current. Error: " .. tostring(addError))
  else
    log("Successfully added new layer below current")
  end

  -- Final document structure check
  log("Getting final document structure...")
  local finalDocStructure = app.getDocumentStructure()
  if finalDocStructure then
    local finalCurrentPage = finalDocStructure["currentPage"]
    local finalPages = finalDocStructure["pages"]
    local finalCurrentLayerIndex = finalPages and finalPages[finalCurrentPage] and finalPages[finalCurrentPage]["currentLayer"]
    local finalNumLayers = finalPages and finalPages[finalCurrentPage] and #finalPages[finalCurrentPage]["layers"]
    log("Final state - current layer index: " .. tostring(finalCurrentLayerIndex) .. ", total layers: " .. tostring(finalNumLayers))
  end

  app.uiAction({["action"] = "ACTION_SAVE"})
  log("=== Finished moveSelectionLayerDownAndAddNewLayerBelow ===")
end

function addNewLayerAboveCurrent()
  log("addNewLayerAboveCurrent called")
  -- Get current document structure for validation
  local docStructure = app.getDocumentStructure()
  if not docStructure then
    log("No document structure available")
    return
  end
  
  -- Perform actions with error handling
  local success1 = pcall(function()
    app.layerAction("ACTION_NEW_LAYER")
  end)
  
  if not success1 then
    log("Failed to create new layer")
    return
  end
  
  local success2 = pcall(function()
    app.layerAction("ACTION_GOTO_PREVIOUS_LAYER")
  end)
  
  if not success2 then
    log("Failed to go to previous layer")
  end
  app.uiAction({["action"] = "ACTION_SAVE"})
end

function addNewLayerBelowCurrent()
  log("=== Starting addNewLayerBelowCurrent ===")

  -- Get current document structure for validation
  log("Getting document structure...")
  local docStructure = app.getDocumentStructure()
  if not docStructure then
    log("ERROR: No document structure available")
    return
  end
  log("Document structure obtained successfully")

  -- Get current layer index
  local currentPage = docStructure["currentPage"]
  local pages = docStructure["pages"]
  log("Current page: " .. tostring(currentPage))
  log("Pages table exists: " .. tostring(pages ~= nil))
  if not pages or not pages[currentPage] then
    log("ERROR: Invalid page structure")
    return
  end
  log("Page structure valid")

  local currentLayerIndex = pages[currentPage]["currentLayer"]
  local numLayers = #pages[currentPage]["layers"]
  log("Current layer index: " .. tostring(currentLayerIndex))
  log("Total layers: " .. tostring(numLayers))

  -- Check if we can go to previous layer (not at bottom)
  if currentLayerIndex <= 1 then
    log("WARNING: Cannot add layer below the bottom layer (current layer index: " .. tostring(currentLayerIndex) .. ")")
    return
  end
  log("Layer index valid for adding below")

  -- Perform actions with error handling
  log("Attempting to go to previous layer...")
  local success1, error1 = pcall(function()
    app.layerAction("ACTION_GOTO_PREVIOUS_LAYER")
  end)

  if not success1 then
    log("ERROR: Failed to go to previous layer. Error: " .. tostring(error1))
    return
  end
  log("Successfully went to previous layer")

  -- Get layer index after goto previous
  local afterGotoPrev = app.getDocumentStructure()
  if afterGotoPrev then
    local prevLayerIndex = afterGotoPrev["pages"] and afterGotoPrev["pages"][currentPage] and afterGotoPrev["pages"][currentPage]["currentLayer"]
    log("Layer index after goto previous: " .. tostring(prevLayerIndex))
  end

  log("Attempting to create new layer...")
  local success2, error2 = pcall(function()
    app.layerAction("ACTION_NEW_LAYER")
  end)

  if not success2 then
    log("ERROR: Failed to create new layer. Error: " .. tostring(error2))
    return
  end
  log("Successfully created new layer")

  -- Get layer index after new layer
  local afterNewLayer = app.getDocumentStructure()
  if afterNewLayer then
    local newLayerIndex = afterNewLayer["pages"] and afterNewLayer["pages"][currentPage] and afterNewLayer["pages"][currentPage]["currentLayer"]
    local newNumLayers = afterNewLayer["pages"] and afterNewLayer["pages"][currentPage] and #afterNewLayer["pages"][currentPage]["layers"]
    log("Layer index after new layer: " .. tostring(newLayerIndex) .. ", total layers: " .. tostring(newNumLayers))
  end

  log("Attempting first goto next layer...")
  local success3, error3 = pcall(function()
    app.layerAction("ACTION_GOTO_NEXT_LAYER")
  end)

  if not success3 then
    log("ERROR: Failed first goto next layer. Error: " .. tostring(error3))
  else
    log("Successfully completed first goto next layer")
  end

  log("Attempting second goto next layer...")
  local success4, error4 = pcall(function()
    app.layerAction("ACTION_GOTO_NEXT_LAYER")
  end)

  if not success4 then
    log("ERROR: Failed second goto next layer. Error: " .. tostring(error4))
  else
    log("Successfully completed second goto next layer")
  end

  -- Get final layer index
  local finalDoc = app.getDocumentStructure()
  if finalDoc then
    local finalLayerIndex = finalDoc["pages"] and finalDoc["pages"][currentPage] and finalDoc["pages"][currentPage]["currentLayer"]
    local finalNumLayers = finalDoc["pages"] and finalDoc["pages"][currentPage] and #finalDoc["pages"][currentPage]["layers"]
    log("Final layer index: " .. tostring(finalLayerIndex) .. ", total layers: " .. tostring(finalNumLayers))
  end

  log("Saving document...")
  app.uiAction({["action"] = "ACTION_SAVE"})
  log("Document saved")

  log("=== Finished addNewLayerBelowCurrent ===")
end

function toggleLineStyle()
  log("toggleLineStyle called")
  local currentToolInfo = app.getToolInfo("active")
  -- start the app from terminal to see the print output
  log("clickDashed called, currentToolInfo: " .. tostring(currentToolInfo.lineStyle) .. "\n")
  if currentToolInfo and currentToolInfo.lineStyle == "plain" then
    app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_DASH"})
  elseif currentToolInfo and currentToolInfo.lineStyle == "dash" then
    app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_DOT"})
  else
    app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN"})
  end
end


-- helper functions
function cleanShape()
  log("cleanShape called")
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled"] = false})
  app.uiAction({["action"] = "ACTION_TOOL_FILL", ["selection"] = false, ["enabled"] = false})

  app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN"})
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

function print_table(t, indent)
  indent = indent or ""
  for k, v in pairs(t) do
    local key = tostring(k)
    if type(v) == "table" then
      log(indent .. key .. " = {")
      print_table(v, indent .. "  ")
      log(indent .. "}")
    else
      log(indent .. key .. " = " .. tostring(v))
    end
  end
end

