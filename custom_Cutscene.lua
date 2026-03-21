--จัดทำขึ้นโดย Stellar-HQ-Studio ห้ามแจกจ่ายหรือดัดแปรงทำซ้ำโดยเด็ดขาด--

local custom_Cutscene = {}

local G = 0
local tick_counter = 0
_G.OnCutscene = false
local Cutscenetick_max = 10
local cutscene4_logged = false

local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

renderer:setCameraPos(-0.3, 0, .4)
renderer:setFOV(0.3)

local toggleAction = mainPage:newAction()
    :title("e")
    :toggleTitle("d")
    :texture(textures["BABA"], 0, 0, 64, 64, 0.4)
    :setOnToggle(function(state)
        Cutscene()
    end)

function Cutscene()
    if _G.OnCutscene == false then
            _G.OnCutscene = true
            log("start")
    end
    function events.tick()
        if _G.OnCutscene == true then
        tick_counter = tick_counter + 1
            if tick_counter >= 15 then
                G = G + 0.5
                tick_counter = 0
                if G >= 1 then
                    log(G)
                end
            end
            if G >= 4 and not cutscene4_logged then
                renderer:setCameraPos(0, 0, 3)
                cutscene4_logged = true
            end
            if G >= 7 then
                renderer:setCameraPos(0, 0, 0)
            end
        end
        if G >= Cutscenetick_max then
            G = 0
            cutscene4_logged = false
            _G.OnCutscene = false
            renderer:setCameraPos(0, 0, 0)
            log("stop")
        end
    end
    return cutscene
end

function mouse_move(x, y)
    if _G.OnCutscene then
        return true
    end
end

function key_press(key, action, modifiers)
    if _G.OnCutscene then
        return true
    end
end

function key_release(key, action, modifiers)
    if _G.OnCutscene then
        return true
    end
end

return custom_Cutscene