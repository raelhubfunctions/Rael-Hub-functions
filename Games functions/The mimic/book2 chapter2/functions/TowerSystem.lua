local TowerSystem = {}

function TowerSystem.FindFolderTower()
  for _, pasta in ipairs(Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, model in ipairs(pasta:GetChildren()) do
        if model:IsA("Folder") and model.Name == "SquidGames" then
          
          warn("[Rael Hub] FolderTower was found")
          shared.FolderTower = pasta
          return pasta
        end
      end
    end
  end
  return nil
end

function TowerSystem.FindFolderModelPuzzle()
  
  if not shared.FolderTower then
    warn("[Erro] FolderTower does not exist")
    return nil
  end
    
  for _, Folder in ipairs(shared.FolderTower:GetChildren()) do
    if Folder:IsA("Folder") then
      for _, ModelTower in ipairs(Folder:GetChildren()) do
        if ModelTower:IsA("Model") and (ModelTower.Name == "1" or ModelTower.Name == "2" or ModelTower.Name == "3") then
          
          shared.FolderModelPuzzle = Folder
          warn("[Rael Hub] FolderModelTower was found")
          return Folder
          
        end
      end
    end
  end
  
  warn("[Erro] Are you really in the towers phase?")
  return nil
  
end

function TowerSystem.TeleportePuzzle()
  
  TowerSystem.FindFolderModelPuzzle()
  
  if not shared.FolderModelPuzzle then
    warn("[Erro] FolderModelPuzzle does not exist")
    return nil
  end
  
  for _, PuzzleModel in ipairs(shared.FolderModelPuzzle:GetChildren()) do
    
    if PuzzleModel:IsA("Model") then
      
      local Part1 = PuzzleModel:FindFirstChild("Part1", true)
      local Part2 = PuzzleModel:FindFirstChild("Part1", true)
      
      
      if Part1.Transparency == 0 and Part2.Transparency == 0 then
        
        local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
        
        if Part1.Color == Color3.fromRGB(27, 42, 53) then
          
          if HumanoidRootPart then
            
            HumanoidRootPart.CFrame = CFrame.new(Part1.Position)
            
          end
          
        elseif Part2.Color == Color3.fromRGB(27, 42, 53) then
          
          if HumanoidRootPart then
            
            HumanoidRootPart.CFrame = CFrame.new(Part1.Position)
            
          end
        end
      end
    end
  end
end

TowerSystem.FindFolderTower()

return TowerSystem