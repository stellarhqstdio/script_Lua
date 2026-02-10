--จัดทำขึ้นโดย Stellar-HQ-Studio ห้ามแจกจ่ายหรือดัดแปรงทำซ้ำโดยเด็ดขาด--

local afk = {}

local G = 0
local tick_counter = 0

local part = 

function setpart(partmodel)
   part = partmodel  
end

setpart(models.froghat.root.Head.bone)

function events.entity_init()
    log(part)
    log("ลงทะเบียน model สำเร็จ")
end

--[[function events.tick(part)
   tick_counter = tick_counter + 1
   if tick_counter >= 40 then
      G = G + 1
      tick_counter = 0
   end
   log(part)
   
end
]]--




return afk