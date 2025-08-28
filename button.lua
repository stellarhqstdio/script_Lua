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

function button.button_normal(part,title,toggleTitle,item,toggleItem,func)
    local toggleAction = mainPage:newAction()
        :title(title)
        :toggleTitle(toggleTitle)
        :item(item)
        :toggleItem(toggleItem)
        :setOnToggle(function(state)
            func(state)
        end)
end

function button.Mouth(name,key,func)
    local Mouth = keybinds:newKeybind(name, key)
    local isMouse5Held = false

    name:setOnPress(function()
        if not isMouse5Held then
            isMouse5Held = true
            func(true)
        end
    end)

    name:setOnRelease(function()
        if isMouse5Held then
            isMouse5Held = false
            func(false)
        end
    end)


end

return button