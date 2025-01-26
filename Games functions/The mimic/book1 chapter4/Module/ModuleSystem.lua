local MapID = game.PlaceId
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack

local VirtualUser = game:GetService("VirtualUser")

local RaelHubChapter4Module = {}

function RaelHubChapter4Module.CheckPart1()
  local Ids = {7251865082, 7265396387}
  if table.find(Ids, MapID) then
    return true
  end
end
function RaelHubChapter4Module.CheckPart2()
  local Ids = {7251866503, 7265396805}
  if table.find(Ids, MapID) then
    return true
  end
end
function RaelHubChapter4Module.CheckPart3()
  local Ids = {7251867155, 7265397072}
  if table.find(Ids, MapID) then
    return true
  end
end
function RaelHubChapter4Module.CheckPart4()
  local Ids = {7251867574, 7265397848}
  if table.find(Ids, MapID) then
    return true
  end
end



function RaelHubChapter4Module.AutoClicker(value)
  
  function autoClick()
    VirtualUser:CaptureController()
    VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
    task.wait(0.05)
  end
  
  getgenv().RaelHubAutoClicker = value
  
  task.spawn(function()
    while getgenv().RaelHubAutoClicker do
      autoClick()
    end
  end)
end



function RaelHubChapter4Module.EquipKatana(value)
  
  getgenv().EquipKatana = value
  
  if not RaelHubChapter4Module.CheckPart4() then
    
    return nil
    
  end
  
  task.spawn(function()
    while getgenv().EquipKatana do
      
      if shared.Character then

        local KatanaInCharacter = shared.Character:FindFirstChild("Katana")
        local Humanoid = shared.Character:FindFirstChild("Humanoid")
        
        if Humanoid and not KatanaInCharacter then
          
          local KatanaInBackpack = Backpack:FindFirstChild("Katana")
          
          if KatanaInBackpack then
            
            Humanoid:EquipTool(KatanaInBackpack)
            
          end
        end
      end
      
      task.wait()
      
    end
  end)
end



function RaelHubChapter4Module.AutoHeartsSaigomo(value)
  
  if not RaelHubChapter4Module.CheckPart4() then
    
    return nil
    
  end
  
  getgenv().AutoHeartSaigomo = value
  
  task.spawn(function()
    
    while getgenv().AutoHeartSaigomo do
    
      local GameHearts = workspace:FindFirstChild("GameHearts")
      
      if GameHearts then
        
        local Hearts = GameHearts:GetChildren()
        
        for _, Heart in ipairs(Hearts) do
          
          if Heart:IsA("Model") and not Heart:FindFirstChild("Destroyed") then
            
            local HeartRoot = Heart:FindFirstChild("Root")
            
            if HeartRoot and shared.Character then
              
              local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
              
              if HumanoidRootPart then
                
                HumanoidRootPart.CFrame = CFrame.new(HeartRoot.Position + Vector3.new(0, 20, 0))
                
              end
            end
          end
        end
      end
      
      task.wait()
      
    end
  end)
end



function RaelHubChapter4Module.AutoKillSaigomoSimple(value)
  
  if not RaelHubChapter4Module.CheckPart4() then
    
    return nil
    
  end
  
  getgenv().AutoKillSaigomoSimple = value
  
  local function TeleportUpSaigmo()
    local BossBattle = Workspace:FindFirstChild("BossBattle")
    if BossBattle then
      local Saigomo = BossBattle:FindFirstChild("Saigomo")
      if Saigomo and shared.Character then
        local PlayerRoot = shared.Character:FindFirstChild("HumanoidRootPart")
        local SaigomoRoot = Saigomo:FindFirstChild("HumanoidRootPart")
        if PlayerRoot and SaigomoRoot then
          PlayerRoot.CFrame = CFrame.new(SaigomoRoot.Position + Vector3.new(0, 27, 0))
        end
      end
    end
  end



  local function modifyhitboxsaigomo(sizevector3)
    local BossBattle = Workspace:FindFirstChild("BossBattle")
    if BossBattle then
      local Saigomo = BossBattle:FindFirstChild("Saigomo")
      if Saigomo then
        local SpiderHitbox = Saigomo:FindFirstChild("SpiderHitbox")
        if SpiderHitbox then
          SpiderHitbox.Size = sizevector3
        end
      end
    end
  end
  
  task.spawn(function()
    
    while getgenv().AutoKillSaigomoSimple do
      
      TeleportUpSaigmo()
      modifyhitboxsaigomo(Vector3.new(150, 21, 21))
      
      task.wait()
      
    end
  end)
end



warn("[Rael Hub] loaded functions")
RaelHubChapter4Module.AutoClicker(false)
RaelHubChapter4Module.EquipKatana(false)
RaelHubChapter4Module.AutoHeartsSaigomo(false)

return RaelHubChapter4Module