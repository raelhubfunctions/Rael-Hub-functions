local CookingSystem = {}

getgenv().ChooseStove = 1
getgenv().ChooseBench = 1
getgenv().CookingChickenValue = false
getgenv().CookingHamValue = false
getgenv().CookingEyeballValue = false

function GetFolderCooking()
  
  local Cooking = workspace:FindFirstChild("Cooking", true)
  
  if Cooking then
    
    warn("[Rael Hub] FolderCooking was found")
    shared.FolderCooking = Cooking
    return Cooking, Cooking.Parent
    
  end
  
end

local function fireProximityPromptWithRetry(proximityPrompt, maxRetries)
  local retries = 0
  while retries < maxRetries do
    if proximityPrompt then
      fireproximityprompt(proximityPrompt)
      task.wait(0.1)
    end
    retries = retries + 1
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
      
      if getgenv().CookingChickenValue or getgenv().CookingHamValue or getgenv().CookingEyeballValue then
        HumanoidRootPart.CFrame = Position
        task.wait(0.5)
      end
      if getgenv().CookingChickenValue or getgenv().CookingHamValue or getgenv().CookingEyeballValue then
        fireProximityPromptWithRetry(Prompt, 3)
      end
      
    end
  end
  
  local function GetorSetItem(foodname)
    
    local Givers =  shared.FolderCooking:FindFirstChild("Givers")
    
    if Givers then
      
      local Handle = Givers[foodname]:FindFirstChild("Handle")
      
      local Prompt = Handle:FindFirstChildOfClass("ProximityPrompt")
      
      if getgenv().CookingChickenValue or getgenv().CookingHamValue or getgenv().CookingEyeballValue then
        TeleportActivePrompt(CFrame.new(Handle.Position), Prompt)
      end
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
    
    if getgenv().CookingChickenValue or getgenv().CookingHamValue or getgenv().CookingEyeballValue then
      TeleportActivePrompt(CFrame.new(BasePart.Position), Prompt)
    end
    
  end
  
  local function InteractWithTheSolve()
    
    local TabletStove = CookingSystem.GetTableStove()
    
    if not TabletStove then
      
      warn("[Erro] TabletSolve is nil")
      return nil
      
    end
    
    local Detector = TabletStove[getgenv().ChooseStove]:FindFirstChild("Detector")
    
    local Prompt = Detector:FindFirstChildOfClass("ProximityPrompt")
    
    if getgenv().CookingChickenValue or getgenv().CookingHamValue or getgenv().CookingEyeballValue then
      TeleportActivePrompt(CFrame.new(Detector.Position), Prompt)
    end
    
  end
  
  local function CheckPotInStove(calback)
    
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
        if (Position - PotPositions[getgenv().ChooseStove]).Magnitude < 0.1 then
          if calback then
            calback(Pot)
          end
          return true
        end
      end
    end
    return false
    
  end
  
  local function DeliverToTheMonster()
    
    local Detector = shared.FolderCooking.TurnInFood:FindFirstChild("Detector")
    
    if Detector then
      
      local Prompt = Detector:FindFirstChildOfClass("ProximityPrompt")
      
      if Prompt then
        
        if getgenv().CookingChickenValue or getgenv().CookingHamValue or getgenv().CookingEyeballValue then
          TeleportActivePrompt(CFrame.new(-2753.5341796875, 968.2463989257812, -4920.02978515625), Prompt)
        end
      end
    end
  end
      
  if food == "Chicken" then
    
    getgenv().CookingChickenValue = true
    getgenv().CookingHamValue = false
    getgenv().CookingEyeballValue = false
    
    GetorSetItem("Pot")
    InteractWithTheBench()
    GetorSetItem("Chicken")
    InteractWithTheBench()
    GetorSetItem("Wrapped Meat")
    InteractWithTheBench()
    GetorSetItem("Cheese")
    InteractWithTheBench()
    InteractWithTheBench()
    
    InteractWithTheSolve()
      
    task.wait(10)
      
    GetorSetItem("Bowl")
    InteractWithTheBench()
    InteractWithTheSolve()
    InteractWithTheBench()
    InteractWithTheBench()
    DeliverToTheMonster()
    
    getgenv().CookingChickenValue = false
    getgenv().CookingHamValue = false
    getgenv().CookingEyeballValue = false
    
  elseif food == "Ham" then
    
    getgenv().CookingChickenValue = false
    getgenv().CookingHamValue = true
    getgenv().CookingEyeballValue = false
    
    GetorSetItem("Pot")
    InteractWithTheBench()
    GetorSetItem("Ham")
    InteractWithTheBench()
    GetorSetItem("Sausage")
    InteractWithTheBench()
    InteractWithTheBench()
    
    InteractWithTheSolve()
      
    task.wait(10)
      
    GetorSetItem("Bowl")
    InteractWithTheBench()
    InteractWithTheSolve()
    InteractWithTheBench()
    InteractWithTheBench()
    DeliverToTheMonster()
    
    getgenv().CookingChickenValue = false
    getgenv().CookingHamValue = false
    getgenv().CookingEyeballValue = false
    
  elseif food == "Eyeball" then
    
    getgenv().CookingChickenValue = false
    getgenv().CookingHamValue = false
    getgenv().CookingEyeballValue = true
    
    GetorSetItem("Bowl")
    InteractWithTheBench()
    GetorSetItem("Eyeball")
    InteractWithTheBench()
    GetorSetItem("Spaghetti")
    InteractWithTheBench()
    InteractWithTheBench()
    DeliverToTheMonster()
    
    getgenv().CookingChickenValue = false
    getgenv().CookingHamValue = false
    getgenv().CookingEyeballValue = false
    
  end
end

GetFolderCooking()

return CookingSystem