local afk_api = {}

function  events.MOUSE_MOVE(x,y)
    if x , y then
        log("a")
    else
        log("b")
    end
end



return afk_api