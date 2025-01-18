local RatCollector = {}
local Workspace = game.workspace
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack

function EspMonster(monster)
  local highlight = Instance.new("Highlight")
  highlight.Adornee = monster
  highlight.FillColor = Color3.new(1, 0, 0)
  highlight.Parent = monster
end

function RatCollector.findAISpawnFolder()
  for _, folder in ipairs(Workspace:GetChildren()) do
    if folder:IsA("Folder") and (folder:FindFirstChild("AISpawn") or folder:FindFirstChild("AI SPAWN Point")) then
      
      if not shared.FolderPhaseRats then

        warn("Rats folder was found")
        shared.FolderPhaseRats = folder

      end
    end
  end
  return nil
end

function RatCollector.FindThreeRatsModels()
  
  if not shared.FolderPhaseRats then
    return
  end
  
  
  for _, child in ipairs(shared.FolderPhaseRats:GetChildren()) do
    if child:IsA("Folder") then
      local modelCount = 0
      local hasOtherItems = false

      for _, obj in ipairs(child:GetChildren()) do
        if obj:IsA("Model") then
          modelCount = modelCount + 1
        else
          hasOtherItems = true
          break
        end
      end

      if modelCount == 3 and not hasOtherItems then
        
        if not shared.FolderRatsModel then
          warn("Rats model was found")
          shared.FolderRatsModel = child
        end
      end
    end
  end
  return nil
end

function RatCollector.EspMonsterRin()
  
  if not shared.FolderPhaseRats then
    return
  end
  
  for _, MonsterRin in ipairs(shared.FolderPhaseRats:GetChildren()) do
    if MonsterRin:IsA("Folder") then
      for _, obj in ipairs(MonsterRin:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
          
          EspMonster(obj)

          return obj
        end
      end
    end
  end
  return nil
end

function RatCollector.ActivateBook()
  
  if not shared.FolderPhaseRats then
    return
  end
  
  for _, Pasta in ipairs(shared.FolderPhaseRats:GetChildren()) do
    if Pasta:IsA("Folder") then
      for _, obj in ipairs(Pasta:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "Book" then

          local Interagir = obj:FindFirstChild("Interact")
          if Interagir and Interagir:IsA("BasePart") then
            for _, toque in ipairs(Interagir:GetChildren()) do
              if toque:IsA("ProximityPrompt") then
                fireproximityprompt(toque)
                break
              end
            end
          end
          return obj
        end
      end
    end
  end
  return nil
end

function RatCollector.FindTwelveObjects()
  
  if not shared.FolderPhaseRats then
    
    return
    
  end
  
  for _, child in ipairs(shared.FolderPhaseRats:GetChildren()) do
  if child:IsA("Folder") and #child:GetChildren() == 12 then
    for _, obj in ipairs(child:GetChildren()) do
      for _, descendant in ipairs(obj:GetDescendants()) do
          if descendant:IsA("ProximityPrompt") then
            fireproximityprompt(descendant)
          end
        end
      end
      return child
    end
  end
  return nil
end

function RatCollector.AutoColletRat()
  
  if not shared.FolderPhaseRats then
    
    warn("[Erro] the rat stage folder was not found")
    return
    
  end
  if not shared.FolderRatsModel then
    warn("[Erro] the rats model folder was not found")
    return
  end
  
  local function teleportPlayer(cframe)
    shared.Character.HumanoidRootPart.CFrame = cframe
    task.wait(0.3)
  end
  
  local function ActivateWell()
    teleportPlayer(CFrame.new(-1540.4487, -30.1707, -3544.8022))
    RatCollector.FindTwelveObjects()
  end
  
  local function ActivateBell()
    teleportPlayer(CFrame.new(-1563.4094, -28.9097, -3408.4204))
    RatCollector.FindTwelveObjects()
    task.wait(2)
    teleportPlayer(CFrame.new(-1674.685791015625, -23.473472595214844, -3409.773681640625))
  end
  
  local function WaitPoisoning()
    
    repeat
      
      wait(0.1)
    
    until Backpack:FindFirstChild("Poisoned Rat") or shared.Character:FindFirstChild("Poisoned Rat")
    
  end
  
  if Backpack:FindFirstChild("Rat") or shared.Character:FindFirstChild("Rat") then
    
    ActivateWell()
    WaitPoisoning()
    ActivateBell()
    return "Success"
    
  end
  
  if Backpack:FindFirstChild("Poisoned Rat") or shared.Character:FindFirstChild("Poisoned Rat") then
    
    ActivateBell()
    return "Success"
    
  end
  
  for _, model in ipairs(shared.FolderRatsModel:GetChildren()) do
    if model:IsA("Model") then
      local cube = model:FindFirstChild("Cube")
      if cube and cube:IsA("BasePart") and cube.Transparency == 0 then

        teleportPlayer(CFrame.new(cube.Position))

        for _, prompt in ipairs(cube:GetChildren()) do
          if prompt:IsA("ProximityPrompt") then
            fireproximityprompt(prompt)
          end
        end
        
        ActivateWell()
        WaitPoisoning()
        ActivateBell()
        return "Success"
        
      end
    end
  end
end

task.spawn(function()
  
  repeat
    
    RatCollector.findAISpawnFolder()
    task.wait()
    
  until shared.FolderPhaseRats
  
  repeat
    
    RatCollector.FindThreeRatsModels()
    task.wait()
    
  until shared.FolderRatsModel
  
end)

return RatCollector