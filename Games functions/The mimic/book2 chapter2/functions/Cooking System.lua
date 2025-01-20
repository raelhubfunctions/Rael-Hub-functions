local CookingSystem = {}

getgenv().ChooseStove = "1"
getgenv().ChooseStove = "1"

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
  
end

function CookingSystem.MakeFood(Position)
  
  local function Teleport()
    
    local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
    
    if HumanoidRootPart then
      
      HumanoidRootPart.CFrame = Position
      
    end
    
  end
  
  
  
end

GetFolderCooking()

return CookingSystem