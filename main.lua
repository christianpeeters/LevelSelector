
local storyboard = require ("storyboard")
storyboard.purgeOnSceneChange = true
--storyboard.level = 0

display.setStatusBar(display.HiddenStatusBar)

centerX = display.contentCenterX
centerY = display.contentCenterY

storyboard.gotoScene ( "menu", { effect = "slideDown"} )
