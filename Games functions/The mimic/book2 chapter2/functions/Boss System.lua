local NagisaSystem = {}
local VirtualUser = game:GetService("VirtualUser")

function NagisaSystem.AutoClicker(value)
  
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

function NagisaSystem.FindFolder()
  for _, pasta in ipairs(Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, model in ipairs(pasta:GetChildren()) do
        if model:IsA("Folder") and model.Name == "Stage2BOSS" then
          
          warn("[Rael Hub] FolderNagisaBoss was found")
          shared.FolderNagisaBoss = pasta
          return pasta
          
        end
      end
    end
  end
  return nil
end

function NagisaSystem.AntiLeizer(value)
  
  if not shared.FolderNagisaBoss then
    
    warn("[Erro] FolderNagisaBoss not found")
    
  end

  getgenv().AntiLeizer = value
  
  while getgenv().AntiLeizer do
    
    local LeizerPart = shared.FolderNagisaBoss:FindFirstChild("POISON", true)
    
    if LeizerPart.Transparency == 0.5 then
      shared.Character.HumanoidRootPart.CFrame = CFrame.new(1779.863037109375, 233.0954132080078, -4773.52490234375)
    end
    
    task.wait()
    
  end
end

function NagisaSystem.AutoCollectBala(value)
  
  if not shared.FolderNagisaBoss then
    
    warn("[Erro] FolderNagisaBoss not found")
    
  end
  
  
  getgenv().AutoCollectBala = value
  
  while getgenv().AutoCollectBala do
  
    local BallGiverModel = shared.FolderNagisaBoss:FindFirstChild("BallGiver", true)

    if BallGiverModel then
      
      local InteractPart = BallGiverModel:FindFirstChild("Interact")
    
      if InteractPart then
      
        local Prompt = InteractPart:FindFirstChildOfClass("ProximityPrompt")
      
        if Prompt then
          fireproximityprompt(Prompt)
          task.wait(0.5)
        end
      end
      
    end
    task.wait()
    
  end
end

NagisaSystem.FindFolder()
NagisaSystem.AntiLeizer(false)
NagisaSystem.AutoCollectBala(false)

return NagisaSystem