local TowerSystem = {}

function Createfloor(position)
  local part = Instance.new("Part")
  part.Size = Vector3.new(10, 1, 10)
  part.Position = position
  part.Anchored = true 
  part.BrickColor = BrickColor.new("Bright green")
  barrier.Transparency = 1
  part.Parent = game.Workspace

  local function createBarrier(position, size)
    local barrier = Instance.new("Part")
    barrier.Size = size
    barrier.Position = position
    barrier.Anchored = true
    barrier.CanCollide = true
    barrier.Transparency = 1
    barrier.BrickColor = BrickColor.new("Bright blue")
    barrier.Parent = game.Workspace
  end

  local barrierThickness = 1
  local barrierHeight = 10

  local barrierPositions = {
    Vector3.new(part.Position.X, part.Position.Y + barrierHeight / 2, part.Position.Z - part.Size.Z / 2 - barrierThickness / 2),
    Vector3.new(part.Position.X, part.Position.Y + barrierHeight / 2, part.Position.Z + part.Size.Z / 2 + barrierThickness / 2),
    Vector3.new(part.Position.X - part.Size.X / 2 - barrierThickness / 2, part.Position.Y + barrierHeight / 2, part.Position.Z),
    Vector3.new(part.Position.X + part.Size.X / 2 + barrierThickness / 2, part.Position.Y + barrierHeight / 2, part.Position.Z),
  }

  for _, pos in ipairs(barrierPositions) do
    if pos.Z == part.Position.Z then
      createBarrier(pos, Vector3.new(barrierThickness, barrierHeight, part.Size.Z))
    else
      createBarrier(pos, Vector3.new(part.Size.X, barrierHeight, barrierThickness))
    end
  end
end

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
      
      local Base = PuzzleModel:FindFirstChild("Base")
      local Part1 = Base:FindFirstChild("Part1")
      local Part2 = Base:FindFirstChild("Part1")
      
      
      if Part1.Transparency == 0 and Part2.Transparency == 0 then
        
        local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
        
        if Part1.Color == Color3.fromRGB(27, 42, 53) then
          
          if HumanoidRootPart then
            
            Createfloor(Vector3.new(Base.Position))
            
            HumanoidRootPart.CFrame = CFrame.new(Base.Position + Vector3.new(0, 15, 0))
            
          end
          
        elseif Part2.Color == Color3.fromRGB(27, 42, 53) then
          
          if HumanoidRootPart then
            
            Createfloor(Vector3.new(Base.Position))
            
            HumanoidRootPart.CFrame = CFrame.new(Base.Position + Vector3.new(0, 15, 0))
            
          end
        end
      end
    end
  end
end

TowerSystem.FindFolderTower()

return TowerSystem