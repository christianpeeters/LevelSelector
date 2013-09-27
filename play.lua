local storyboard = require( "storyboard" )
local scene = storyboard.newScene()


-- local forward references should go here --

--levelProgress = 0
--levelImg = {}
--allLevels = {}


levels = 
{	
1, 2, 2, 2 , 2,  --1 means level is open to 	be played (level.png)
2, 2, 2, 2, 2,   --2 means level is locked (locked.png)
2, 2, 2, 2, 2   -- 3 means level is completed (greenchecked.png)
}
	
images ={
	{ getFile = "level.png", types = "play"   },
	{ getFile = "lock.png", types = "locked"},
	{ getFile = "greenchecked.png", types = "done"}
}


local function buttonHit(event)
	storyboard.gotoScene ( event.target.destination, {effect = "slideUp"} )	
	print( event.target.destination)
		return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	
	local levelIndex =0
		for i=0,2 do
			for j=1,5 do
				tablePlace =   i*5 + j	
				levelIndex = levelIndex + 1
					local imagesId = levels[levelIndex] 
						levelImg = display.newImageRect (images[imagesId].getFile , 45, 45 )
						levelImg.x = 45 + (j*65)
						levelImg.y  = 85+ (i*65)
						group:insert(levelImg)

						leveltxt = display.newText("Level "..tostring(tablePlace), 0,0, "Helvetica", 10)
						leveltxt.x = 45 + (j*65)
						leveltxt .y = 110+ (i*65)
						leveltxt:setTextColor (250, 255, 251)
						group:insert (leveltxt)
						
					    levelImg.destination = "level0"..tostring(tablePlace)
						
						if images[imagesId].types ~= "locked" then
						levelImg:addEventListener("tap", buttonHit)
						end
 end
	
end
		


	
	-- CREATE display objects and add them to 'group' here.
	-- Example use-case: Restore 'group' from previously saved state.
	
	local title = display.newText( "Level Selection", 0, 0, "Helvetica", 20 )
	title.x = centerX
	title.y = display.screenOriginY + 40
	group:insert(title)
	
	local backBtn = display.newText(  "Back", 0, 0, "Helvetica", 20 )
	backBtn.x = display.screenOriginX + 50
	backBtn.y = display.contentHeight  - 30 
	backBtn.destination = "menu" 
	backBtn:addEventListener("tap", buttonHit)
	group:insert(backBtn)



end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)

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
	



