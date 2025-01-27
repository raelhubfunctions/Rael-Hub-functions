local MapID = game.PlaceId
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack

local TeleportService = game:GetService("TeleportService")
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

function RaelHubChapter4Module.AutoWin()
  if RaelHubChapter4Module.CheckPart1() then
    local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
    if firetouchinterest then
      local Game_Teleporter = workspace:FindFirstChild("Game Teleporter")
      if Game_Teleporter and HumanoidRootPart then
        firetouchinterest(HumanoidRootPart, Game_Teleporter, 0)
        task.wait(0.1)
        firetouchinterest(HumanoidRootPart, Game_Teleporter, 1)
      end
    else
      
      HumanoidRootPart.CFrame = CFrame.new(89.58648681640625, -50.999027252197266, -1415.93310546875)
      
    end
  elseif RaelHubChapter4Module.CheckPart2() then
    
    local function CollectButterfly()
      local Butterflies = workspace:FindFirstChild("Butterflies")
      if Butterflies then
        for _, Butterfly in ipairs(Butterflies:GetChildren()) do
          local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
          local Prompt = Butterfly:FindFirstChild("ProximityPrompt")
          if HumanoidRootPart and Prompt then
            HumanoidRootPart.CFrame = CFrame.new(Butterfly.Position)
            task.wait(0.3)
            fireproximityprompt(Prompt)
          end
        end
      end
    end
  
    for _ = 1, 10 do
      
      CollectButterfly()
      
    end
    
  elseif RaelHubChapter4Module.CheckPart3() then
    
    local function CollectArms()
      local GameInfo = workspace:FindFirstChild("GameInfo")
      if GameInfo then
        local PuzzleItems = GameInfo:FindFirstChild("PuzzleItems")
        local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
        if PuzzleItems and HumanoidRootPart then
          for _, Armor in ipairs(PuzzleItems:GetChildren()) do
            local Prompt = Armor:FindFirstChild("ProximityPrompt")
            if Prompt then
              HumanoidRootPart.CFrame = CFrame.new(Armor.Position)
              task.wait(0.3)
              fireproximityprompt(Prompt)
            end
          end
        end
      end
    end
    
    local function BurnArmors()
      local Well = workspace:FindFirstChild("Well")
      if Well then
        local Burner = Well:FindFirstChild("Burner")
        if Burner then
          local Prompt = Burner:FindFirstChild("ProximityPrompt")
          local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
          if HumanoidRootPart and Prompt then
            for _ = 1, 7 do
              HumanoidRootPart.CFrame = CFrame.new(Burner.Position)
              fireproximityprompt(Prompt)
              task.wait(0.5)
            end
          end
        end
      end
    end
    
    CollectArms()
    BurnArmors()
    
  end
end

function RaelHubChapter4Module.TeleportToPart4()
  if RaelHubChapter4Module.CheckPart1() then
    local NormalID = 7251865082
    local NightmareID = 7265396387
    
    if MapID == NormalID then
      TeleportService:Teleport(7251867574, LocalPlayer)
    elseif MapID == NightmareID then
      TeleportService:Teleport(7265397848, LocalPlayer)
    end
  elseif RaelHubChapter4Module.CheckPart2() then
    local NormalID = 7251866503
    local NightmareID = 7265396805
    
    if MapID == NormalID then
      TeleportService:Teleport(7251867574, LocalPlayer)
    elseif MapID == NightmareID then
      TeleportService:Teleport(7265397848, LocalPlayer)
    end
  elseif RaelHubChapter4Module.CheckPart3() then
    local NormalID = 7251867155
    local NightmareID = 7265397072
    
    if MapID == NormalID then
      TeleportService:Teleport(7251867574, LocalPlayer)
    elseif MapID == NightmareID then
      TeleportService:Teleport(7265397848, LocalPlayer)
    end
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



function CheckSaigomo()
  if not RaelHubChapter4Module.CheckPart4() then
    
    return nil
    
  end
  
  local BossBattle = Workspace:FindFirstChild("BossBattle")
  if BossBattle then
    local Saigomo = BossBattle:FindFirstChild("Saigomo")
    if Saigomo then
      return Saigomo
    end
  end
  return nil
end



function RaelHubChapter4Module.AutoKillSaigomoSimple(value)
  
  if not RaelHubChapter4Module.CheckPart4() then
    
    return nil
    
  end
  
  getgenv().AutoKillSaigomoSimple = value
  
  local function TeleportUpSaigmo()
    local Saigomo = CheckSaigomo()
    if Saigomo and shared.Character then
      local PlayerRoot = shared.Character:FindFirstChild("HumanoidRootPart")
      local SaigomoRoot = Saigomo:FindFirstChild("HumanoidRootPart")
      if PlayerRoot and SaigomoRoot then
        PlayerRoot.CFrame = CFrame.new(SaigomoRoot.Position + Vector3.new(0, 27, 0))
      end
    end
  end



  local function modifyhitboxsaigomo(sizevector3)
    local Saigomo = CheckSaigomo()
    if Saigomo then
      local SpiderHitbox = Saigomo:FindFirstChild("SpiderHitbox")
      if SpiderHitbox then
        SpiderHitbox.Size = sizevector3
      end
    end
  end
  
  task.spawn(function()
    
    while getgenv().AutoKillSaigomoSimple do
      
      TeleportUpSaigmo()
      modifyhitboxsaigomo(Vector3.new(150, 21, 21))
      
      task.wait()
      
    end
    
    modifyhitboxsaigomo(Vector3.new(12.02400016784668, 21, 21))  -- this is the original value ;-;
    
  end)
end

function RaelHubChapter4Module.EspMonsters(value)
  
  local GameAI = workspace:FindFirstChild("GameAI")
  
  local function ExecuteEsp(name, distancevalue)
    if value then
      for _, Monster in ipairs(GameAI:GetChildren()) do
        if Monster and Monster:IsA("Model") then
          shared.RaelHubFunction.CreateEspDistance(Monster, Color3.fromRGB(255, 102, 102), name, distancevalue)
        end
      end
    else
      for _, Monster in ipairs(GameAI:GetChildren()) do
        if Monster and Monster:IsA("Model") then
          shared.RaelHubFunction.DisableEsp(Monster)
        end
      end
    end
  end
  
  if RaelHubChapter4Module.CheckPart1() then
    ExecuteEsp("", false)
  elseif RaelHubChapter4Module.CheckPart2() then
    ExecuteEsp("Monster", true)
  elseif RaelHubChapter4Module.CheckPart3() then
    ExecuteEsp("Kusunoki", true)
  elseif RaelHubChapter4Module.CheckPart4() then
    ExecuteEsp("Saigomo", true)
  end
end



function RaelHubChapter4Module.EspObjects(value)
  
  if RaelHubChapter4Module.CheckPart1() then
    
    local KeysParts = {
      workspace:GetChildren()[120].Model.Model:GetChildren()[4].Handle, 
      workspace:GetChildren()[31].Handle,
      workspace:GetChildren()[27].Handle
    }
    
    local Crowbar = workspace:GetChildren()[29].Handle
    
    if value then
        
      for index, Key in KeysParts do
        shared.RaelHubFunction.CreateEspObject(Key, Color3.fromRGB(0, 255, 255), "117047144730308", "Key " .. index)
      end
      
      shared.RaelHubFunction.CreateEspObject(Crowbar, Color3.fromRGB(0, 255, 255), "122586788171758", "Crowbar")
      
    else
      
      for index, Key in KeysParts do
        shared.RaelHubFunction.DisableEsp(Key)
      end
      
      shared.RaelHubFunction.DisableEsp(Crowbar)
      
    end
    
  elseif RaelHubChapter4Module.CheckPart2() then
    
    local Butterflies = workspace:FindFirstChild("Butterflies")
    
    local KeysParts = {
      workspace:GetChildren()[23].Handle,
      workspace:GetChildren()[22].Handle,
      workspace:GetChildren()[10].Handle
    }
    
    if Butterflies and value then
      
      for index, Key in KeysParts do
        shared.RaelHubFunction.CreateEspObject(Key, Color3.fromRGB(0, 255, 255), "117047144730308", "Key " .. index)
      end
      
      for _, butterfly in ipairs(Butterflies:GetChildren()) do
        shared.RaelHubFunction.CreateEspObject(butterfly, Color3.fromRGB(0, 255, 255), "71196298747032", "")
      end
      
    elseif Butterflies and not value then
      
      for index, Key in KeysParts do
        shared.RaelHubFunction.DisableEsp(Key)
      end
      
      for _, butterfly in ipairs(Butterflies:GetChildren()) do
        shared.RaelHubFunction.DisableEsp(butterfly)
      end
      
    end
  elseif RaelHubChapter4Module.CheckPart3() then
    
    local Butterfly = workspace:GetChildren()[346].Spirit.Handle
    
    local GameInfo = workspace:FindFirstChild("GameInfo")
    
    if GameInfo then
      
      local PuzzleItems = GameInfo:FindFirstChild("PuzzleItems")
      
      if PuzzleItems and Butterfly and value then
        
        shared.RaelHubFunction.CreateEspObject(Butterfly, Color3.fromRGB(0, 255, 255), "71196298747032", "")
        
        for _, Armor in ipairs(PuzzleItems:GetChildren()) do
          
          shared.RaelHubFunction.CreateEspObject(Armor, Color3.fromRGB(0, 255, 255), "122586788171758", "Armor")
          
        end
        
      elseif PuzzleItems and Butterfly and not value then
        
        shared.RaelHubFunction.DisableEsp(Butterfly)
        
        for _, Armor in ipairs(PuzzleItems:GetChildren()) do
          
          shared.RaelHubFunction.DisableEsp(Armor)
          
        end
        
      end
    end
  elseif RaelHubChapter4Module.CheckPart4() then
    
    getgenv().EspObejct = value
    
    local GameHearts = workspace:FindFirstChild("GameHearts")
    local Butterflies = workspace:FindFirstChild("Butterflies")
    
    if GameHearts and Butterflies then
      
      while getgenv().EspObejct do
      
        for _, Heart in ipairs(GameHearts:GetChildren()) do
          
          if Heart:IsA("Model") and not Heart:FindFirstChild("Destroyed") then
          
            shared.RaelHubFunction.CreateEspDistance(Heart, Color3.fromRGB(148, 5, 9), "Heart", true)
            
          else
            
            shared.RaelHubFunction.DisableEsp(Heart)
            
          end
        end
        
        for _, Heath in ipairs(Butterflies:GetChildren()) do
          
          if Heath:IsA("Model") then
          
            local butterfly = Heath:FindFirstChild("butterfly")
            
            
            
            if butterfly then
              
              if butterfly.Transparency == 0 then
                shared.RaelHubFunction.CreateEspObject(butterfly, Color3.fromRGB(0, 255, 255), "71196298747032", "")
              else
                shared.RaelHubFunction.DisableEsp(butterfly)
              end
              
            end
          end
        end
        
        task.wait()
        
      end
        
      if not getgenv().EspObejct then
        
        for _, Heart in ipairs(GameHearts:GetChildren()) do
          shared.RaelHubFunction.DisableEsp(Heart)
        end
        
        for _, Heath in ipairs(Butterflies:GetChildren()) do
          
          if Heath:IsA("Model") then

            local butterfly = Heath:FindFirstChild("butterfly")

            if butterfly then
              shared.RaelHubFunction.DisableEsp(butterfly)
            end
          end
        end
      end
    end
  end
end



function RaelHubChapter4Module.RecoverLife(value, callback1, callback2)
  
  if not RaelHubChapter4Module.CheckPart4() then
    
    return nil
    
  end
  
  getgenv().RecoverLife = value
  
  local function UpdateButterflyList()
    
    local Butterflies = workspace:FindFirstChild("Butterflies")
    
    local ListButterfly = {}
    
    if Butterflies then
      for _, Model in pairs(Butterflies:GetChildren()) do
        local Butterfly = Model:FindFirstChild("butterfly")
        if Butterfly and Butterfly:IsA("BasePart") and Butterfly.Transparency == 0 then
          table.insert(ListButterfly, Butterfly)
        end
      end
      
      return ListButterfly
      
    end
  end
  
  local function TeleportToButterfly(max)
    
    local Counter = 0
    
     for _, Butterfly in ipairs(UpdateButterflyList()) do
       
      local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
      
      if Counter == max then
        break
      end
      
      if HumanoidRootPart then
        
        local Prompt = Butterfly:FindFirstChild("ProximityPrompt")
          
        if Prompt then
          
          if getgenv().RecoverLife then
            HumanoidRootPart.CFrame = CFrame.new(Butterfly.Position)
          end
          task.wait(0.5)
          if getgenv().RecoverLife then
            fireproximityprompt(Prompt)
          end
          
          Counter = Counter + 1
          
        end
      end
    end
  end
  
  task.spawn(function()
  
    while getgenv().RecoverLife do
      
      local Humanoid = shared.Character:FindFirstChild("Humanoid")
      
      if Humanoid and Humanoid.Health > 20 and Humanoid.Health < 65 then
        
        if #UpdateButterflyList() > 1 then
          
          if getgenv().RecoverLife then
              
            if callback1 then callback1() end
            TeleportToButterfly(2)
            if callback2 then callback2() end
              
          end
          
        end
        
      elseif Humanoid and Humanoid.Health > 65 and  Humanoid.Health < 85 then
        
        if #UpdateButterflyList() == 1 then
          
          if getgenv().RecoverLife then
              
            if callback1 then callback1() end
            TeleportToButterfly(1)
            if callback2 then callback2() end
              
          end
          
        end
        
      elseif Humanoid and Humanoid.Health > 0 and  Humanoid.Health < 20 then
        
        if #UpdateButterflyList() > 2 then
          
          if getgenv().RecoverLife then
              
            if callback1 then callback1() end
            TeleportToButterfly(3)
            if callback2 then callback2() end
              
          end
          
        elseif #UpdateButterflyList() == 0 then
          
          local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
          
          if HumanoidRootPart then
            
            if getgenv().RecoverLife then
              HumanoidRootPart.CFrame = CFrame.new(2652.878662109375, 274.9132385253906, 2814.821044921875)
            end
            
            repeat
              
              HumanoidRootPart.CFrame = CFrame.new(2652.878662109375, 274.9132385253906, 2814.821044921875)
              task.wait()
              
            until #UpdateButterflyList() > 2 or not getgenv().RecoverLife  
            
            if getgenv().RecoverLife then
              
              if callback1 then callback1() end
              TeleportToButterfly(3)
              if callback2 then callback2() end
              
            end
          end
        end
      end
      task.wait()
    end
    
    _G.ValidityActionsValue = nil
    
  end)
end

warn("[Rael Hub] loaded functions")
RaelHubChapter4Module.AutoClicker(false)
RaelHubChapter4Module.EquipKatana(false)
RaelHubChapter4Module.AutoHeartsSaigomo(false)
RaelHubChapter4Module.RecoverLife(false)
RaelHubChapter4Module.EspMonsters(false)
RaelHubChapter4Module.EspObjects(false)
RaelHubChapter4Module.AutoKillSaigomoSimple(false)

return RaelHubChapter4Module