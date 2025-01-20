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
      
      TeleportActivePrompt(CFrame(Handle.Position), Prompt)
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
    
    TeleportActivePrompt(CFrame(BasePart.Position), Prompt)
    
  end
  
  local function InteractWithTheSolve()
    
    local TabletStove = CookingSystem.StoveTable()
    
    if not TabletStove then
      
      warn("[Erro] TabletSolve is nil")
      return nil
      
    end
    
    local Detector = TabletStove[getgenv().ChooseStove]:FindFirstChild("Detector")
    
    local Prompt = Detector:FindFirstChild("ProximityPrompt")
    
    TeleportActivePrompt(CFrame(Detector.Position), Prompt)
    
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
    
  end
end

GetFolderCooking()

return CookingSystem