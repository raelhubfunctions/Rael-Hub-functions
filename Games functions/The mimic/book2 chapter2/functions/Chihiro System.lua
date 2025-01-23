local ChihiroSystem = {}

getgenv().AutoTeleportChihiro = false
_G.PlayerHeight = 0

function EspMonster(monster)
  local highlight = Instance.new("Highlight")
  highlight.Adornee = monster
  highlight.FillColor = Color3.new(1, 0, 0)
  highlight.Parent = monster
end

function ChihiroSystem.FindFolder()
  for _, pasta in ipairs(Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, model in ipairs(pasta:GetChildren()) do
        if model:IsA("Folder") and model.Name == "DaughterJumpscare" then
          warn("[Rael Hub] FolderChihiro was found")
          shared.FolderChihiro = pasta
          return pasta
        end
      end
    end
  end
  return nil
end

function ChihiroSystem.FindFolderCards()
  
  if not shared.FolderChihiro then
    
    warn("[Erro] FolderChihiro does not exist")
    
  end
  
  for _, pasta in ipairs(Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, model in ipairs(pasta:GetChildren()) do
        if model:IsA("Model") and model.Name == "MotherSlender" then
          return pasta
        end
      end
    end
  end
  return nil
end

function ChihiroSystem.AutoCollectLetters()
  
  if not shared.FolderChihiro then
    
    warn("[Erro] FolderChihiro does not exist")
    
  end
  
  local FolderCards = ChihiroSystem.FindFolderCards()
  
  for _, Pasta in ipairs(FolderCards:GetChildren()) do
    if Pasta:IsA("Folder") then
      for _, PastaNote in ipairs(Pasta:GetChildren()) do
        if PastaNote:IsA("Folder") and PastaNote.Name == "Notes" then
          for _, Part in ipairs(PastaNote:GetChildren()) do
            if Part:IsA("BasePart") then
              local Front = Part:FindFirstChild("Front")
              if Front and Front.Transparency == 0 then
                shared.Character.HumanoidRootPart.CFrame = CFrame.new(Part.Position)

                task.wait(0.5)

               local proximityPrompt = Part:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                  fireproximityprompt(proximityPrompt)
                end
              end
            end
          end
        end
      end
    end
  end
  return nil
end

function ChihiroSistema.TeleportChihiro()
  
  if not shared.FolderChihiro then
    
    warn("[Erro] FolderChihiro does not exist")
    
  end
  
  local Chihiro = shared.FolderChihiro:FindFirstChild("Daughter")
  
  if Chihiro then
    
    shared.Character.HumanoidRootPart.CFrame = CFrame.new(Chihiro.WorldPivot.Position)
    
  end
end

function ChihiroSistema.AutoTeleportChihiro(value)
  
  if not shared.FolderChihiro then
    
    warn("[Erro] FolderChihiro does not exist")
    
  end
  
  getgenv().AutoTeleportChihiro = value
  
  task.spawn(function()
    while getgenv().AutoTeleportChihiro do
      
      local Chihiro = shared.FolderChihiro:FindFirstChild("Daughter")
      
      if Chihiro then
        
        shared.Character.HumanoidRootPart.CFrame = CFrame.new(Chihiro.WorldPivot.Position - Vector3.new(0, _G.PlayerHeight, 0))
        
      else
        
        shared.Character.HumanoidRootPart.CFrame = CFrame.new(-4410.4921875, 683.9530639648438, -2333.083984375)
        
      end
      task.wait()
    end
    
    shared.Character.HumanoidRootPart.CFrame = CFrame.new(-4410.4921875, 683.9530639648438, -2333.083984375)
    
  end)
end

function ChihiroSistema.TeleportForDoor()
  
  if not shared.FolderChihiro then
    
    warn("[Erro] FolderChihiro does not exist")
    
  end
  
  local DoorModel = shared.FolderChihiro:FindFirstChild("Door")
  
  if DoorModel then
    
    shared.Character.HumanoidRootPart.CFrame = CFrame.new(DoorModel.WorldPivot.Position)
    
  end
end


function ChihiroSistema.EspMonsterMother()
  
  if not shared.FolderChihiro then
    
    warn("[Erro] FolderChihiro does not exist")
    
  end
  
  for _, Pasta in ipairs(shared.FolderChihiro:GetChildren()) do
    if Pasta:IsA("Folder") then
      for _, Monster in ipairs(Pasta:GetChildren()) do
        if Monster:IsA("Model") and Monster.Name == "Mother" then
          
          EspMonster(Monster)
          
        end
      end
    end
  end
end

ChihiroSystem.FindFolder()

return ChihiroSistema