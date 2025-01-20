local AshinaSystem = {}

function EspMonster(monster)
  local highlight = Instance.new("Highlight")
  highlight.Adornee = monster
  highlight.FillColor = Color3.new(1, 0, 0)
  highlight.Parent = monster
end

function AshinaSystem.FindFolderPhaseAshina()
  for _, pasta in ipairs(Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, model in ipairs(pasta:GetChildren()) do
        if model:IsA("Model") and model.Name == "TeleportDoor" then
          warn("[Rael Hub] FolderAshina was found")
          return pasta
        end
      end
    end
  end
  return nil
end

function AshinaSystem.GetAshina()
  
  local FolderFound = AshinaSystem.FindFolderPhaseAshina()
  
  if not FolderFound then
    
    return nil
    
  end
  
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
  EspMonster(monster)
  
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

return AshinaSystem