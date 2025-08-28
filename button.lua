local button = {}

local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

--[[
 part = model part
 title = title of the button
 toggleTitle = title when toggled
 item = item of the button
 toggleItem = item when toggled
 func = function to run when toggled
]]--

function button.button_switch(title1,toggleTitle2,item1,toggleItem2,part,namefunction)
    local toggleAction = mainPage:newAction()
        :title(title1)
        :toggleTitle(toggleTitle2)
        :item(item1)
        :toggleItem(toggleItem2)
        :setOnToggle(function(state)
            namefunction(state)
        end)

        function namefunction(state)
            if state then
                part:setVisible(false)
            else
                part:setVisible(true)
            end
        end
end

function button.Mouth(name,key,Mouthopen,Mouthoff,namefunction)

    function namefunction(state)
        if state then
            Mouthopen:setVisible(true)
            Mouthoff:setVisible(false)
        else
            Mouthopen:setVisible(false)
            Mouthoff:setVisible(true)
        end
    end

    local Mouth = keybinds:newKeybind(name,key)
    local isMouse5Held = false

    Mouth:setOnPress(function()
        if not isMouse5Held then
            isMouse5Held = true
            namefunction(true)
        end
    end)

    Mouth:setOnRelease(function()
        if isMouse5Held then
            isMouse5Held = false
            namefunction(false)
        end
    end)


end

return button