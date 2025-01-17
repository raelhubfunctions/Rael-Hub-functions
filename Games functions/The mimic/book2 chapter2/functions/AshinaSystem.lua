local RaelHubFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20functions/script.lua"))()
local AshinaSystem = {}

function AshinaSystem.FindFolderPhaseAshina()
  for _, pasta in ipairs(Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, model in ipairs(pasta:GetChildren()) do
        if model:IsA("Model") and model.Name == "TeleportDoor" then
          return pasta
        end
      end
    end
  end
  return nil
end

function AshinaSystem.GetAshina()
  
  local FolderFound = AshinaSystem.FindFolderPhaseAshina()
  
  for _, Pasta in ipairs(FolderFound:GetChildren()) do
    if Pasta:IsA("Folder") then
      for _, Monster in ipairs(Pasta:GetChildren()) do
        if Monster:IsA("Model") and Monster.Name == "Ashina" then
          return Monster
        end
      end
    end
  end
  return nil
end

function AshinaSystem.ActivateEspAshina()
  
  local monster = AshinaSystem.GetAshina()
  if monster and not monster:FindFirstChild("RaelHubIcon") and not monster:FindFirstChild("RaelHubDestaque") then
    RaelHubFunction.CreateEsp(monster, Color3.fromRGB(255, 102, 102), "88229448947616", monster.Name)
  end
  
end

function AshinaSystem.GetFolderRestaurant()
  
  local FolderFound = AshinaSystem.FindFolderPhaseAshina()
  
  for _, PastaModel in ipairs(FolderFound:GetChildren()) do
    if PastaModel:IsA("Folder") then
      for _, Parte in ipairs(PastaModel:GetChildren()) do
        if Parte:IsA("BasePart") and Parte.Name == "MAINROOMTELEPORT" then
          print(PastaModel.Name)
            
            return PastaModel
            
          
        end
      end
    end
  end
end

function AshinaSystem.SearchDoorsFolder()
  
  local FolderFound = AshinaSystem.FindFolderPhaseAshina()
  
  for _, PastaModel in ipairs(FolderFound:GetChildren()) do
    if PastaModel:IsA("Folder") then
      for _, Parte in ipairs(PastaModel:GetChildren()) do
        if Parte:IsA("Model") and Parte.Name == "ProxDoorA" then
            
            return PastaModel
            
        end
      end
    end
  end
end

function AshinaSystem.TpRestaurantRoom()
  
  local FolderFound = AshinaSystem.GetFolderRestaurant()
  
  for _, modelmeat in ipairs(FolderFound:GetChildren()) do
    if modelmeat:IsA("Model") and modelmeat.Name == "RestaurantRoom" then
      
      local meatParts = modelmeat.Meat:GetChildren()
      local hasVisiblePart = false
      
      for _, part in ipairs(meatParts) do
        if part:IsA("BasePart") and part.Transparency == 0 then
          hasVisiblePart = true
          break
        end
      end
      
      if hasVisiblePart then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = modelmeat.BowlGiver.Prompt.CFrame
      end
      
    end
  end
end

AshinaSystem.ActivateEspAshina(false)

return AshinaSystem