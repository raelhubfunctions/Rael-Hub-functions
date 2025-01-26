local MapID = game.PlaceId
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack

local RaelHubChapter4Module = {}

function CheckPart4()
  
  local Ids = {7251867574, 7265397848}
  
  if table.find(Ids, MapID) then
    
    return true
    
  end

end
  

function RaelHubChapter4Module.EquipKatana(value)
  
  getgenv().EquipKatana = value
  
  if not CheckPart4() then
    
    return nil
    
  end
  
  task.spawn(function()
    while getgenv().EquipKatana do
      
      if shared.Character then

        local KatanaInCharacter = shared.Character:FindFirstChild("Katana")
        local Humanoid = shared.Character:FindFirstChild("Humanoid")
        
        if Humanoid and not KatanaInCharacter then
          
          local KatanaInBackpack = Backpack:FindFirstChild("Katana")
          
          if KatanaInBackpack then
            
            Humanoid:EquipTool(KatanaInBackpack)
            
          end
        end
      end
      
      task.wait()
      
    end
  end)
end

RaelHubChapter4Module.EquipKatana(false)

return RaelHubChapter4Module