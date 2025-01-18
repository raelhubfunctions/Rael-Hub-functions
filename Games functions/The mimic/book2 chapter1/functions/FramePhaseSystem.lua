local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local FramePhaseSystem = {}
local containerVisible = true

_G.Frame_Image = {}

function CriarInterfaceQuadro(Imagem, posX, container)
  local ImageLabel = Instance.new("ImageLabel")
  local BorderFrame = Instance.new("Frame")
  
  BorderFrame.Parent = container
  BorderFrame.Size = UDim2.new(0.10, 0, 0.30, 0)
  BorderFrame.Position = UDim2.new(posX, 0, 0.1, 0)
  BorderFrame.BackgroundColor3 = Color3.fromRGB(34, 168, 110)
  BorderFrame.BorderSizePixel = 2
  BorderFrame.BorderColor3 = Color3.fromRGB(34, 168, 110)
  ImageLabel.Parent = BorderFrame
  ImageLabel.Size = UDim2.new(1, -4, 1, -4)
  ImageLabel.Position = UDim2.new(0, 2, 0, 2)
  ImageLabel.Image = Imagem
  ImageLabel.BackgroundTransparency = 1
end

function CriarTitulo(ScreenGui)
  local TitleLabel = Instance.new("TextLabel")
  
  TitleLabel.Parent = ScreenGui
  TitleLabel.Size = UDim2.new(0.5, 0, 0.05, 0)
  TitleLabel.Position = UDim2.new(0.25, 0, 0.02, 0)
  TitleLabel.Text = "Rael Hub"
  TitleLabel.TextColor3 = Color3.fromRGB(47, 236, 154)
  TitleLabel.BackgroundTransparency = 1
  TitleLabel.TextStrokeTransparency = 0.5
  TitleLabel.TextStrokeColor3 = Color3.fromRGB(47, 236, 154)
  TitleLabel.TextSize = 36
  TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
  TitleLabel.Font = Enum.Font.SourceSansBold
end

function CriarBotao(ScreenGui, container)
  local Button = Instance.new("TextButton")
  Button.Parent = ScreenGui
  Button.Size = UDim2.new(0.05, 0, 0.05, 0)
  Button.Position = UDim2.new(0.95, -10, 0.02, 0)
  Button.BackgroundColor3 = Color3.fromRGB(195, 65, 45)
  Button.BackgroundTransparency = 0
  Button.BorderSizePixel = 0
  Button.Text = "+"
  Button.TextSize = 24
  Button.TextColor3 = Color3.fromRGB(255, 255, 255)

  Button.MouseButton1Click:Connect(function()
    containerVisible = not containerVisible
    container.Visible = containerVisible
    if containerVisible then
      Button.Text = "-"
    else
      Button.Text = "+"
    end
  end)
end

function ShowFrames(senha)
  
  if senha == "RaelKira" then
    
    if _G.Frame_Image and #_G.Frame_Image == 5 then
      
      local ScreenGui = PlayerGui:FindFirstChild("RaelHubFrames")
      if ScreenGui then
        ScreenGui:Destroy()
      end
      ScreenGui = Instance.new("ScreenGui")
      ScreenGui.Name = "RaelHubFrames"
      ScreenGui.ResetOnSpawn = false
      ScreenGui.Parent = PlayerGui
     
      local container = Instance.new("Frame")
      
      ScreenGui.Parent = PlayerGui
      
      container.Parent = ScreenGui
      container.Size = UDim2.new(1, 0, 1, 0)
      container.BackgroundTransparency = 1
      CriarTitulo(ScreenGui)
      
      local totalWidth = 0.10 * 5
      local startX = (1 - totalWidth) / 2 
    
      for i = 1, 5 do
        CriarInterfaceQuadro(_G.Frame_Image[i], startX + (0.10 * (i - 1)), container)
      end
    
      CriarBotao(ScreenGui, container)
    end
    
  end
end

function GetHintpicTexture()
  
  if not shared.FolderFramePhase then
    warn("[Erro] Frame folder not found")
    return
  end
  
  local hintpic = shared.FolderFramePhase:FindFirstChild("hintpic", true)
  
  
  
  if hintpic then
    
    local hintpic_texture = hintpic:FindFirstChild("Decal", true)
    
    print("Texture: " .. hintpic_texture.Texture)
    return hintpic_texture.Texture
    
  end
end

function FindHintpic()
  
  if not shared.FolderFramePhase then
    warn("[Erro] Frame folder not found")
    return
  end
  
  repeat
    
    task.wait(1)
    print("wait...")
  until shared.FolderFramePhase:FindFirstChild("hintpic", true)
  
  print("Success")
  
end

function FindSpecialpic()
  
  if not shared.FolderFramePhase then
    warn("[Erro] Frame folder not found")
    return
  end
  
  repeat
    
    task.wait(0.1)
    print("wait...")
  until shared.FolderFramePhase:FindFirstChild("specialpic", true)
  print("Success")
  
end

function GetspecialpicTexture()
  
  if not shared.FolderFramePhase then
    warn("[Erro] Frame folder not found")
    return
  end
  
  local specialpic = shared.FolderFramePhase:FindFirstChild("specialpic", true)
  
  
  
  if specialpic then
    
    local specialpic_texture = specialpic:FindFirstChild("Decal", true)
    
    print("Texture: " .. specialpic_texture.Texture)
    return specialpic_texture.Texture
    
  end
end

function EnableTouch()
  for _, part in pairs(Workspace:GetDescendants()) do
    if part:IsA("ProximityPrompt") then
      fireproximityprompt(part)
    end
  end
end

function CollectFrame(senha)
  
  local function FreezPlayer(value)
    
    local HumanoidRootPart = shared.Character:FindFirstChild("HumanoidRootPart")
    
    if HumanoidRootPart then
      
      HumanoidRootPart.Anchored = value
      
    end
  end
  
  function AddFramesToList(index, cframe, callback, callback2)
    FreezPlayer(false)
    shared.Character.HumanoidRootPart.CFrame = cframe
    task.wait(5)
    EnableTouch()
    task.wait(1)
    FreezPlayer(true)
    task.wait(2)
    callback()
    _G.Frame_Image[index] = callback2()
    task.wait(1)
  end
    
    
  if senha == "RaelSystem32" then
    
    AddFramesToList(1, CFrame.new(-71.8661880493164, 19.296241760253906, 3719.196533203125), FindHintpic, GetHintpicTexture)
    
    AddFramesToList(2, CFrame.new(-166.7793426513672, 19.388465881347656, 3635.34619140625), FindHintpic, GetHintpicTexture)
    
    AddFramesToList(3, CFrame.new(-199.4065704345703, 22.314420700073242, 3769.70703125), FindSpecialpic, GetspecialpicTexture)
    
    AddFramesToList(4, CFrame.new(-268.2510070800781, 19.283910751342773, 3712.910888671875), FindHintpic, GetHintpicTexture)
    
    AddFramesToList(5, CFrame.new(-288.14141845703125, 19.362136840820312, 3811.348876953125), FindHintpic, GetHintpicTexture)
    
    FreezPlayer(false)
    
    for _, Texture in pairs(_G.Frame_Image) do
      
      print("Here texture" .. Texture)
      
    end
    
  end
end

function EspMonster(monster)
  local highlight = Instance.new("Highlight")
  highlight.Adornee = monster
  highlight.FillColor = Color3.new(1, 0, 0)
  highlight.Parent = monster
end

function FramePhaseSystem.FindFolder()
  for _, FolderFrame in ipairs(workspace:GetChildren()) do
    if FolderFrame:IsA("Folder") and FolderFrame:FindFirstChild("Jumpscare") then
      
      if not shared.FolderFramePhase then
        
        shared.FolderFramePhase = FolderFrame
        warn("FolderFrame was found")
        return "Successes"
        
      end
      
    end
  end
  return nil
end

function FramePhaseSystem.TalkKenio()
  
  if not shared.FolderFramePhase then
    
    warn("[Erro] Frame folder not found")
    return
    
  end
  
  for _, Folder in ipairs(shared.FolderFramePhase:GetChildren()) do
    if Folder:IsA("Folder") and Folder:FindFirstChild("Quest") then
      fireproximityprompt(Folder.Quest:FindFirstChildOfClass("ProximityPrompt"))
      return Folder
    end
  end
  return nil
end

function FramePhaseSystem.EspMonster()
  
  if not shared.FolderFramePhase then
    
    warn("[Erro] Frame folder not found")
    return
    
  end
  
  for _, Monster in ipairs(shared.FolderFramePhase:GetChildren()) do
    
    if Monster:IsA("Folder") then
      for _, obj in ipairs(Monster:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
          
          EspMonster(obj)
          
          return obj
          
        end
      end
    end
  end
  return nil
end

FramePhaseSystem.FindFolder()

return FramePhaseSystem