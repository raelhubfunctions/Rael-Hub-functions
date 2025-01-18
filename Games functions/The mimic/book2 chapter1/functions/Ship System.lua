local ShipSystem = {}

local Workspace = game:GetService("Workspace")

function EspMonster(monster)
  local highlight = Instance.new("Highlight")
  highlight.Adornee = monster
  highlight.FillColor = Color3.new(1, 0, 0)
  highlight.Parent = monster
end

function ShipSystem.FindFolder()
  for _, MainFolder in ipairs(Workspace:GetChildren()) do
    if MainFolder:IsA("Folder") and MainFolder:FindFirstChild("OxygenTanks") then
      
      warn("[Rael Hub] FolderShip was found")  
      shared.FolderShip = MainFolder
      return MainFolder
    end
  end
  return nil
end

function ShipSystem.EspMonster()
  
  if not shared.FolderShip then
    warn("[Erro] FolderShip not found")
    return nil
  end
  
  for _, MonsterBixo in ipairs(shared.FolderShip:GetChildren()) do
    if MonsterBixo:IsA("Folder") then
      for _, obj in ipairs(MonsterBixo:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
          
          EspMonster(obj)
          
        end
      end
    end
  end
  return nil
end

ShipSystem.FindFolder()

return ShipSystem