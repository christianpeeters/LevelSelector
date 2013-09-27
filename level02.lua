local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require ("widget")

-- local forward references should go here --

local completegameBtn

local function buttonHit(event)
	storyboard.gotoScene (  event.target.destination, {effect = "slideUp"} )
	return true
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- CREATE display objects and add them to 'group' here.
	-- Example use-case: Restore 'group' from previously saved state.
	
	local title = display.newText( "Level 2", 0, 0, "Helvetica", 38 )
	title.x = centerX
	title.y = display.screenOriginY + 40
	group:insert(title)
	
	local backBtn = display.newText(  "Back", 0, 0, "Helvetica", 25 )
	backBtn.x = display.screenOriginX + 50
	backBtn.y = display.contentHeight - 30 
	backBtn.destination = "play" 
	backBtn:addEventListener("tap", buttonHit)
	group:insert(backBtn)


end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view


	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	local function btnClicked (event)
	
	levels[2] = 3
	levels[3] = 1
	completegameBtn.destination = "play" 
	completegameBtn:addEventListener("tap", buttonHit)
	end
	
	completegameBtn = widget.newButton { label = "Complete level", onRelease=btnClicked}
	completegameBtn.x = centerX
	completegameBtn.y = centerY
	group:insert (completegameBtn)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )


---------------------------------------------------------------------------------

return scene