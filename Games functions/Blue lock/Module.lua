local RaelHubBlueLockRivals = {}
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local PlayerStats = LocalPlayer.PlayerStats
local Character = LocalPlayer.Character
local Camera = workspace.CurrentCamera

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

getgenv().StaminaINF = false
getgenv().GrabBall = false
getgenv().AimbotBallValue = false
getgenv().EnableSpeedMethodOne = false
getgenv().EnableSpeedMethodTwo = false
getgenv().InfiniteJumpEnabled = false
getgenv().TPSpeed = 0.3

shared.Character = LocalPlayer.Character
shared.RaelHubFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Games%20functions/Blue%20lock/Module.lua"))()

if not _G.CharacterFunction then

  _G.CharacterFunction = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    if newCharacter.Name == "Character" then
      Character = newCharacter
      shared.Character = newCharacter
    end
  end)

end

if not _G.AimbotRunService then


  _G.AimbotRunService = RunService.RenderStepped:Connect(function()
    
    local TargetBallPart = workspace:FindFirstChild("Football")
    
    if TargetBallPart and getgenv().AimbotBallValue then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, TargetBallPart.Position)
    end
    
    if getgenv().EnableSpeedMethodTwo then
      
      local Humanoid = Character:FindFirstChild("Humanoid")
      
      if Humanoid then
      
        if Humanoid.MoveDirection.Magnitude > 0 then
          local speed = getgenv().TPSpeed
            Character:TranslateBy(Humanoid.MoveDirection * speed)
        end
      end
    end
    
  end)
  
end

if not _G.INFJumpService then
  
  _G.INFJumpService = UserInputService.JumpRequest:connect(function()
	  if getgenv().InfiniteJumpEnabled then
		  local Humanoid = Character:FindFirstChildOfClass("Humanoid")
		  if Humanoid then
		    Humanoid:ChangeState("Jumping")
		  end
	  end
  end)
  
end

function RaelHubBlueLockRivals.StaminaINF(type, value)
  getgenv().StaminaINF = value
  
  while getgenv().StaminaINF do
    if type == "Remote" then
      
      task.spawn(function()
        
        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("StaminaService"):WaitForChild("RE"):WaitForChild("DecreaseStamina"):FireServer(0/0)
        
      end)
      
      task.wait(0.5)
      
    elseif type == "PlayerStats" then
      
      local Stamina = PlayerStats:FindFirstChild("Stamina")
      
      if Stamina then
        Stamina.Value = 100
      end
      
    end
    task.wait()
  end
end

function RaelHubBlueLockRivals.GrabBall(value)
  getgenv().GrabBall = value
  task.spawn(function()
    while getgenv().GrabBall do
      
      local Football = workspace:FindFirstChild("Football")
      local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
      
      if HumanoidRootPart and Football then
        HumanoidRootPart.CFrame = CFrame.new(Football.Position)
      end
      task.wait()
    end
  end)
end

function RaelHubBlueLockRivals.AimbotBall(value)
  getgenv().AimbotBallValue = value
end

function RaelHubBlueLockRivals.EnableSpeedMethodTwo(value, speedvalue)
  
  
  
end

function RaelHubBlueLockRivals.EnableSpeedMethodOne(value, speedvalue)
  
  getgenv().EnableSpeedMethodOne = value
  
  task.spawn(function()
    while getgenv().EnableSpeedMethodOne do
      local Humanoid = Character:FindFirstChild("Humanoid")
      
      if Humanoid then
        
        sethiddenproperty(Humanoid, "WalkSpeed", speedvalue)
        setscriptable(Humanoid, "WalkSpeed", false)
        
      end
      task.wait(0.5)
    end
  end)
  
end

function RaelHubBlueLockRivals.EnableSpeedMethodTwo(value, speed)
  
  getgenv().EnableSpeedMethodTwo = value
  
  if speed == 1 then
    getgenv().TPSpeed = 0.3
  elseif speed == 2 then
    getgenv().TPSpeed = 0.4
  elseif speed == 3 then
    getgenv().TPSpeed = 0.5
  elseif speed == 4 then
    getgenv().TPSpeed = 0.6
  elseif speed == 5 then
    getgenv().TPSpeed = 0.8
  end
  
end

function RaelHubBlueLockRivals.EspBall(value)
  
  getgenv().EspBall = value
  
  task.spawn(function()
    while getgenv().EspBall do
      
      local BallPart = workspace:FindFirstChild("Football", true)
      
      if BallPart and not BallPart:FindFirstChild("RaelHubIcon") and not BallPart:FindFirstChild("RaelHubDestaque") then
        shared.RaelHubFunction.CreateEspObject(BallPart, Color3.fromRGB(0, 80, 242), "135730101430798", "Ball")
      end
      task.wait()
    end
    if not getgenv().EspBall then
      
      local BallPart = workspace:FindFirstChild("Football", true)
      
      if BallPart then
        shared.RaelHubFunction.DisableEsp(BallPart)
      end
      
    end
    
  end)
end

function RaelHubBlueLockRivals.INFJump(value)
  
  getgenv().InfiniteJumpEnabled = value
  
end

return RaelHubBlueLockRivals