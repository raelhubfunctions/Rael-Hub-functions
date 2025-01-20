local CookingSystem = {}

getgenv().ChooseStove = 1
getgenv().ChooseBench = 1

function GetFolderCooking()
  
  local Cooking = workspace:FindFirstChild("Cooking", true)
  
  if Cooking then
    
    warn("[Rael Hub] FolderCooking was found")
    shared.FolderCooking = Cooking
    return Cooking, Cooking.Parent
    
  end
  
end

function CookingSystem.GetTableStove()
  
  if not shared.FolderCooking then
    
    warn("[Error] FolderCooking does not exist")
    return nil
    
  end
  
  local Folder = shared.FolderCooking
  
  local StoveTable = {
    
    Folder.Stoves:GetChildren()[3],
    Folder.Stoves:GetChildren()[2],
    Folder.Stoves:GetChildren()[4],
    Folder.Stoves:GetChildren()[1]
    
  }
  
  return StoveTable
  
end

function CookingSystem.GetBenches()
  
  if not shared.FolderCooking then
    
    warn("[Error] FolderCooking does not exist")
    return nil
    
  end
  
  local Folder = shared.FolderCooking
  
  local BenchTable = {
    
    Folder.WoodenCounters:GetChildren()[24],
    Folder.WoodenCounters:GetChildren()[32],
    Folder.WoodenCounters:GetChildren()[10],
    Folder.WoodenCounters:GetChildren()[30]
    
  }
  
  return BenchTable
  
end

function CookingSystem.MakeFood(food)
  
  if not shared.FolderCooking then
    
    warn("[Error] FolderCooking does not exist")
    return nil
    
  end
  
  local function TeleportActivePrompt(Position, Prompt)
    
    local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
    
    if HumanoidRootPart then
      
      HumanoidRootPart.CFrame = Position
      task.wait(1)
      fireproximityprompt(Prompt)
      
    end
  end
  
  local function FoodGetorSet(foodname)
    
    local Givers =  shared.FolderCooking:FindFirstChild("Givers")
    
    if Givers then
      
      local Handle = Givers[foodname]:FindFirstChild("Handle")
      
      local Prompt = Handle:FindFirstChildOfClass("ProximityPrompt")
      
      TeleportActivePrompt(CFrame.new(Handle.Position), Prompt)
    end
  end
  
  local function InteractWithTheBench()
    
    local TableBenches = CookingSystem.GetBenches()
    
    if not TableBenches then
      
      warn("[Erro] TableBenches is nil")
      return nil
      
    end
    
    local function GetBaseAndPrompt(model)
      
      for _, Obj in ipairs(model:GetChildren()) do
        
        if Obj:IsA("BasePart") then
          
          local Prompt = Obj:FindFirstChildOfClass("ProximityPrompt")
          
          if Prompt then
            
            return Obj, Prompt
            
          end
        end
      end
    end
    
    local BasePart, Prompt = GetBaseAndPrompt(TableBenches[getgenv().ChooseBench])
    
    TeleportActivePrompt(CFrame.new(BasePart.Position), Prompt)
    
  end
  
  local function InteractWithTheSolve()
    
    local TabletStove = CookingSystem.StoveTable()
    
    if not TabletStove then
      
      warn("[Erro] TabletSolve is nil")
      return nil
      
    end
    
    local Detector = TabletStove[getgenv().ChooseStove]:FindFirstChild("Detector")
    
    local Prompt = Detector:FindFirstChild("ProximityPrompt")
    
    TeleportActivePrompt(CFrame.new(Detector.Position), Prompt)
    
  end
  
  local function CheckPotInStove()
    
    local SystemBin = shared.FolderCooking.SystemBin
    
    local PotPositions = {
      Vector3.new(-2701.040771484375, 969.5958862304688, -4903.8017578125),
      Vector3.new(-2710.281005859375, 969.5958862304688, -4903.8017578125),
      Vector3.new(-2719.7724609375, 969.5958862304688, -4903.8017578125),
      Vector3.new(-2729.154052734375, 969.5958862304688, -4903.8017578125)
    }
    
    for _, Pot in ipairs(SystemBin:GetChildren()) do
      
      if Pot then
        
        local Position = Pot.WorldPivot.Position
        
        if Position == PotPositions[getgenv().ChooseStove] then
          
          return Pot
          
        end
      end
    end
    
    return false
    
  end
  
  if food == "Chicken" then
    
    
    FoodGetorSet("Pot")
    InteractWithTheBench()
    FoodGetorSet("Chicken")
    InteractWithTheBench()
    FoodGetorSet("Wrapped Meat")
    InteractWithTheBench()
    FoodGetorSet("Cheese")
    InteractWithTheBench()
    InteractWithTheBench()
    
    if not InteractWithTheSolve() then
      
      InteractWithTheSolve()
      
      local CheckSolve = CheckPotInStove()
      
      if CheckSolve then
        
        warn("O seu pote esta na mesa")
        
      end
    end
  end
end

GetFolderCooking()




return CookingSystem