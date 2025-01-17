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
end


function AshinaSystem.GetAshina(callback)
  
  local FolderFound = AshinaSystem.FindFolderPhaseAshina()
  local Ashina = FolderFound:FindFirstChild("Ashina", true)
  
  if Ashina and callback then
    callback(Ashina)
  end
  
end

function AshinaSystem.ActivateEspAshina(value)
  
  getgenv().AshinaSystem_Ashina = value
  
  task.spawn(function()
    while getgenv().AshinaSystem_Ashina do
    
      AshinaSystem.GetAshina(function(monster)
        
        if not monster:FindFirstChild("RaelHubIcon") and not monster:FindFirstChild("RaelHubDestaque") then
          RaelHubFunction.CreateEspDistance(monster, Color3.fromRGB(255, 102, 102), monster.Name, true)
        end
        
      end)
      
      task.wait()
      
    end
    
    if not getgenv().AshinaSystem_Ashina then
      
      AshinaSystem.GetAshina(function(monster)
        
        RaelHubFunction.DisableEsp(monster)
        
      end)
      
    end
  end)
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