local RaelHubFunction = {}
local flyFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/Roblox-fly-module/refs/heads/main/Module.lua"))()

local VirtualUser = game:GetService("VirtualUser")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Camera = workspace.CurrentCamera
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Chat = TextChatService.ChatInputBarConfiguration.TargetTextChannel
local Light = game:GetService("Lighting")
local originalAmbient = Light.Ambient
local originalColorShiftBottom = Light.ColorShift_Bottom
local originalColorShiftTop = Light.ColorShift_Top
local originalClockTime = Light.ClockTime

shared.Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

if not _G.MonitorCharacter then

  _G.MonitorCharacter = LocalPlayer.CharacterAdded:Connect(function(newcharacter)
    
    Character = newcharacter
    shared.Character = newcharacter
    
  end)
  
end

if not _G.RaelHubMonitorRunService then
  _G.RaelHubMonitorRunService = RunService.Heartbeat:Connect(function()
    if getgenv().RaelHubAimbotValue and getgenv().RaelHubAimbotPlayer and getgenv().RaelHubAimbotTarget then
      local Target_Part = getgenv().RaelHubAimbotPlayer:FindFirstChild(getgenv().RaelHubAimbotTarget, true)
      if Target_Part then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Target_Part.Position)
      end
    end
  end)
end
  
loadstring(game:HttpGet("https://raw.githubusercontent.com/hypertext500/Testando/refs/heads/main/main.luau"))()

function RaelHubFunction.ShowCountText(text, count)
  
  if shared.ScreenGuiShowCountTextTime then
    
    shared.ScreenGuiShowCountTextTime:Destroy()
    
  end
  
  if shared.ScreenGuiShowCountText then
    
    shared.ScreenGuiShowCountText:Destroy()
    
  end
  shared.ScreenGuiShowCountText = Instance.new("ScreenGui")
  shared.ScreenGuiShowCountText.Name = "ShowCountText"
  shared.ScreenGuiShowCountText.Parent = LocalPlayer.PlayerGui
    
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
  textLabel.Position = UDim2.new(0.1, 0, 0.35, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.TextColor3 = Color3.fromRGB(255, 69, 50)
  textLabel.TextStrokeColor3 = Color3.fromRGB(255, 69, 50)
  textLabel.TextSize = 30
  textLabel.Font = Enum.Font.SourceSans
  textLabel.Text = text
  textLabel.Parent = shared.ScreenGuiShowCountText
    
  textLabel.BorderSizePixel = 0
  textLabel.TextWrapped = true
  textLabel.TextScaled = true
  textLabel.TextStrokeTransparency = 0
  textLabel.TextXAlignment = Enum.TextXAlignment.Center

  shared.ScreenGuiShowCountTextTime = Instance.new("ScreenGui")
  shared.ScreenGuiShowCountTextTime.Name = "TimerGui"
  shared.ScreenGuiShowCountTextTime.Parent = LocalPlayer.PlayerGui

  local timerTextLabel = Instance.new("TextLabel")
  timerTextLabel.Parent = shared.ScreenGuiShowCountTextTime
  timerTextLabel.Size = UDim2.new(0, 100, 0, 30)
  timerTextLabel.Position = UDim2.new(0.5, -50, 0.55, 0)
  timerTextLabel.BackgroundTransparency = 1
  timerTextLabel.TextColor3 = Color3.new(50/255, 255/255, 107/255)
  timerTextLabel.Font = Enum.Font.SourceSans
  timerTextLabel.TextSize = 50
  timerTextLabel.Text = tostring(count)

  local countdown = coroutine.wrap(function()
    for i = count, 1, -1 do
      timerTextLabel.Text = tostring(i)
      task.wait(1)
    end
    shared.ScreenGuiShowCountTextTime:Destroy()
    shared.ScreenGuiShowCountText:Destroy()
  end)
  countdown()
end

local mapName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local username = localPlayer.Name
local userId = localPlayer.UserId
local ExecName, ExecVersion = identifyexecutor()

local ws = WebSocket.connect("wss://roblox-system-online.squareweb.app")
ws:Send(userId .. "|" .. username .. "|" .. mapName "|" .. ExecName)

function RaelHubFunction.CreateNotification(texto, duracao)
    local NotificationScreenGui = Instance.new("ScreenGui")
    NotificationScreenGui.Name = "RaelHubNotification"
    NotificationScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 310, 0, 90)  -- Mantendo o tamanho original do container
    notificationFrame.Position = UDim2.new(1, 310, 1, -110)
    notificationFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    notificationFrame.BackgroundTransparency = 1
    notificationFrame.ClipsDescendants = true
    notificationFrame.Parent = NotificationScreenGui

    local backgroundImage = Instance.new("ImageLabel")
    backgroundImage.Size = UDim2.new(1, 0, 1, 0)  -- A imagem ocupa todo o container
    backgroundImage.Position = UDim2.new(0, 0, 0, 0)
    backgroundImage.Image = "rbxassetid://18665679839"
    backgroundImage.BackgroundTransparency = 1
    backgroundImage.Parent = notificationFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = backgroundImage

    -- Mantendo o título como estava antes
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 25)
    titleLabel.Position = UDim2.new(0, 0, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Rael Hub"
    titleLabel.TextColor3 = Color3.fromRGB(34, 168, 110)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.ArialBold
    titleLabel.Parent = notificationFrame

    -- Texto de notificação que se adapta ao tamanho da ImageLabel
    local notificationText = Instance.new("TextLabel")
    notificationText.Size = UDim2.new(1, 0, 0, 30)  -- Tamanho fixo da caixa de texto, como antes
    notificationText.Position = UDim2.new(0, 0, 0, 40)
    notificationText.BackgroundTransparency = 1
    notificationText.Text = texto
    notificationText.TextColor3 = Color3.new(1, 1, 1)
    notificationText.TextScaled = true
    notificationText.TextWrapped = true  -- Permitir quebra de linha
    notificationText.Font = Enum.Font.ArialBold
    notificationText.Parent = notificationFrame

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.Parent = notificationText

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://7817336081"
    sound.Parent = NotificationScreenGui
    sound:Play()

    local function animateNotification()
        local finalPosition = UDim2.new(1, -310, 1, -110)
        notificationFrame:TweenPosition(finalPosition, "Out", "Quad", 0.7, true)
        task.wait(duracao)
        notificationFrame:TweenPosition(UDim2.new(1, 310, 1, -110), "In", "Quad", 1, true)
        task.wait(1)
        NotificationScreenGui:Destroy()
    end

    task.spawn(animateNotification)

    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(animateNotification)
end

function RaelHubFunction.CreateEsp(objeto, cor, imageId, texto)
  if not objeto or not objeto:IsA("Model") or not objeto:FindFirstChild("HumanoidRootPart") then
    return
  end

  local highlight = Instance.new("Highlight")
  highlight.Name = "RaelHubDestaque"
  highlight.Adornee = objeto
  highlight.FillColor = cor
  highlight.Parent = objeto

  local billboard = Instance.new("BillboardGui")
  billboard.Name = "RaelHubIcon"
  billboard.Adornee = objeto:FindFirstChild("HumanoidRootPart")
  billboard.Size = UDim2.new(0, 30, 0, 30)
  billboard.StudsOffset = Vector3.new(0, 0, 0)
  billboard.AlwaysOnTop = true
  billboard.Parent = objeto

  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Size = UDim2.new(1, 0, 1, 0)
  imageLabel.BackgroundTransparency = 1
  imageLabel.Image = "rbxassetid://" .. imageId
  imageLabel.Parent = billboard
  
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = texto
  textLabel.Position = UDim2.new(0, 0, 0, 20)
  textLabel.TextColor3 = cor
  textLabel.TextSize = 13
  textLabel.Font = Enum.Font.GothamBold
  textLabel.Parent = billboard
end

function RaelHubFunction.CreateEspObject(objeto, cor, imageId, texto)
  
  if objeto:FindFirstChild("RaelHubIcon") then
    return
  end
  
  if objeto:FindFirstChild("RaelHubDestaque") then
    return
  end
  
  local highlight = Instance.new("Highlight")
  highlight.Name = "RaelHubDestaque"
  highlight.Adornee = objeto
  highlight.FillColor = cor
  highlight.Parent = objeto

  local billboard = Instance.new("BillboardGui")
  billboard.Name = "RaelHubIcon"
  billboard.Adornee = objeto:FindFirstChildOfClass("BasePart")
  billboard.Size = UDim2.new(0, 30, 0, 30)
  billboard.StudsOffset = Vector3.new(0, 0, 0)
  billboard.AlwaysOnTop = true
  billboard.Parent = objeto

  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Size = UDim2.new(1, 0, 1, 0)
  imageLabel.BackgroundTransparency = 1
  imageLabel.Image = "rbxassetid://" .. imageId
  imageLabel.Parent = billboard
  
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = texto
  textLabel.Position = UDim2.new(0, 0, 0, 20)
  textLabel.TextColor3 = cor
  textLabel.TextSize = 13
  textLabel.Font = Enum.Font.GothamBold
  textLabel.Parent = billboard
end

function RaelHubFunction.CreateEspDistance(objeto, cor, texto, mostrarDistancia)
  
  if objeto:FindFirstChild("RaelHubIcon") then
    return
  end
  
  if objeto:FindFirstChild("RaelHubDestaque") then
    return
  end
  
  local highlight = Instance.new("Highlight")
  highlight.Name = "RaelHubDestaque"
  highlight.Adornee = objeto
  highlight.FillColor = cor
  highlight.Parent = objeto

  local basePart = nil
  if objeto:IsA("BasePart") then
    basePart = objeto
  else
    for _, descendant in ipairs(objeto:GetDescendants()) do
      if descendant.Name == "HumanoidRootPart" and descendant:IsA("BasePart") then
        basePart = descendant
        break
      elseif descendant:IsA("BasePart") then
        basePart = descendant
        break
      end
    end
  end

  if not basePart then
    warn("Nenhuma BasePart encontrada no objeto: " .. objeto.Name)
    return
  end

  local billboard = Instance.new("BillboardGui")
  billboard.Name = "RaelHubIcon"
  billboard.Adornee = basePart
  billboard.Size = UDim2.new(0, 50, 0, 50)
  billboard.StudsOffset = Vector3.new(0, 0, 0)
  billboard.AlwaysOnTop = true
  billboard.Parent = objeto
    
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = texto
  textLabel.Position = UDim2.new(0, 0, 0, 0)
  textLabel.TextColor3 = cor
  textLabel.TextSize = 13
  textLabel.Font = Enum.Font.GothamBold
  textLabel.Parent = billboard

  local distanciaLabel = Instance.new("TextLabel")
  distanciaLabel.Size = UDim2.new(1, 0, 1, 0)
  distanciaLabel.BackgroundTransparency = 1
  distanciaLabel.Text = ""
  distanciaLabel.Position = UDim2.new(0, 0, 0, 12)
  distanciaLabel.TextColor3 = cor
  distanciaLabel.TextSize = 13
  distanciaLabel.Font = Enum.Font.GothamBold
  distanciaLabel.Parent = billboard

  if mostrarDistancia then
    RunService.RenderStepped:Connect(function()
      if Character and Character:FindFirstChild("HumanoidRootPart") then
        local playerPos = Character.HumanoidRootPart.Position
        local objectPos = basePart.Position
        local distancia = (playerPos - objectPos).Magnitude

        distanciaLabel.Text = "Distance: " .. math.floor(distancia) .. " studs"
      end
    end)
  end
end

function RaelHubFunction.PlayersEspActive()
  for _, jogador in ipairs(Players:GetPlayers()) do
    local personagem = jogador.Character

    if personagem then
      if not personagem:FindFirstChild("RaelHubDestaque") and not personagem:FindFirstChild("RaelHubIcon") then
        RaelHubFunction.CreateEsp(personagem, Color3.fromRGB(144, 238, 144), "117259180607823", jogador.Name)
      end
    end
  end
end

function RaelHubFunction.DisableEsp(objeto)
  if objeto then
    local RaelHubDestaque = objeto:FindFirstChild("RaelHubDestaque")
    local RaelHubIcon = objeto:FindFirstChild("RaelHubIcon")
    
    if RaelHubDestaque then
      RaelHubDestaque:Destroy()
    end
    if RaelHubIcon then
      RaelHubIcon:Destroy()
    end
  end
end

function RaelHubFunction.PlayersEspDisabled()
  local players = game:GetService("Players")
        
  for _, jogador in ipairs(players:GetPlayers()) do
    local personagem = jogador.Character

    if personagem then
      RaelHubFunction.DisableEsp(personagem)
    end
  end
end

function RaelHubFunction.EspPlayer()
  while RaelHubEspState do
    RaelHubFunction.PlayersEspActive()
    task.wait(1) -- Atraso para evitar execução rápida demais
  end
  RaelHubFunction.PlayersEspDisabled() -- Desativa o ESP se o estado mudar para false
end

function RaelHubFunction.EspMonstroActive(Monstros)
  for _, Monstro in ipairs(Monstros) do
    if Monstro then
        RaelHubFunction.CreateEsp(Monstro, Color3.fromRGB(255, 102, 102), "88229448947616", "")
    else
      print("Nenhum monstro encontrado.")
    end
  end
end

function RaelHubFunction.EspMonstroDisabled(Monstros)
  for _, Monstro in ipairs(Monstros) do
    if Monstro then
        RaelHubFunction.DisableEsp(Monstro)
    else
      print("Nenhum monstro encontrado.")
    end
  end
end

function RaelHubFunction.dofullbright()
  Light.Ambient = Color3.new(1, 1, 1)
  Light.ColorShift_Bottom = Color3.new(1, 1, 1)
  Light.ColorShift_Top = Color3.new(1, 1, 1)
  Light.ClockTime = 14 -- Deixa o céu de dia
end

function RaelHubFunction.restoreLighting()
  Light.Ambient = originalAmbient
  Light.ColorShift_Bottom = originalColorShiftBottom
  Light.ColorShift_Top = originalColorShiftTop
  Light.ClockTime = originalClockTime
end

local FlyRun = game:GetService("RunService")
local connection

function RaelHubFunction.FlyTo(destination, speed)
  if Character then
    local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local humanoid = Character:FindFirstChildOfClass("Humanoid")

    if humanoidRootPart and humanoid then
     humanoid.Jump = true

      wait(0.2)

      local bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
      bodyVelocity.Velocity = (destination - humanoidRootPart.Position).unit * speed
      bodyVelocity.Parent = humanoidRootPart
      
      connection = FlyRun.Stepped:Connect(function()
        if (destination - humanoidRootPart.Position).magnitude < 5 then
          bodyVelocity:Destroy()
          humanoidRootPart.CFrame = CFrame.new(destination)
          StopFly()
        end
      end)

      return bodyVelocity
    end
  end
end

function StopFly(bodyVelocity)
  if connection then
    connection:Disconnect()
    connection = nil
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
  end
end

function RaelHubFunction.Auto_Click_V1(value)
  
  getgenv().RaelHubAutoClickV1 = value
  
  local function Click()
    VirtualUser:CaptureController()
    VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
    task.wait(0.05)
  end
  
  task.spawn(function()
    while getgenv().RaelHubAutoClickV1 do
      
      Click()
      task.wait()
      
    end
  end)
end

function RaelHubFunction.Criarchao(position, colicion, transparency, corRGB)
    -- Cria uma pasta no Workspace para armazenar as partes
    local pasta = game.Workspace:FindFirstChild("RaelHubFloor") or Instance.new("Folder")
    pasta.Name = "RaelHubFloor"
    pasta.Parent = game.Workspace

    -- Cria o mini chão
    local part = Instance.new("Part")
    part.Size = Vector3.new(10, 1, 10) -- Define o tamanho do mini chão (quadrado)
    part.Position = position -- Define a posição do mini chão
    part.Anchored = true -- Faz o mini chão ficar parado no lugar
    part.Color = corRGB -- Usa a cor RGB passada como parâmetro
    part.Transparency = transparency -- Define a transparência
    part.Parent = pasta -- Armazena o mini chão dentro da pasta

    -- Função para criar uma barreira
    local function createBarrier(position, size)
        local barrier = Instance.new("Part")
        barrier.Size = size
        barrier.Position = position
        barrier.Anchored = true
        barrier.CanCollide = true
        barrier.Transparency = 1 -- Define a barreira como totalmente transparente
        barrier.Color = Color3.fromRGB(0, 0, 255) -- Barreiras com cor azul
        barrier.Parent = pasta -- Armazena as barreiras dentro da pasta
    end

    -- Tamanho das barreiras
    local barrierThickness = 1
    local barrierHeight = 10

    -- Posições das barreiras ao redor do mini chão
    local barrierPositions = {
        Vector3.new(part.Position.X, part.Position.Y + barrierHeight / 2, part.Position.Z - part.Size.Z / 2 - barrierThickness / 2), -- Frente
        Vector3.new(part.Position.X, part.Position.Y + barrierHeight / 2, part.Position.Z + part.Size.Z / 2 + barrierThickness / 2), -- Trás
        Vector3.new(part.Position.X - part.Size.X / 2 - barrierThickness / 2, part.Position.Y + barrierHeight / 2, part.Position.Z), -- Esquerda
        Vector3.new(part.Position.X + part.Size.X / 2 + barrierThickness / 2, part.Position.Y + barrierHeight / 2, part.Position.Z), -- Direita
    }

    -- Cria as barreiras
    if colicion then
        for _, pos in ipairs(barrierPositions) do
            if pos.Z == part.Position.Z then
                createBarrier(pos, Vector3.new(barrierThickness, barrierHeight, part.Size.Z)) -- Barreiras laterais
            else
                createBarrier(pos, Vector3.new(part.Size.X, barrierHeight, barrierThickness)) -- Barreiras frente e trás
            end
        end
    end
end

function RaelHubFunction.ESPPlayers(value, method)
  
  getgenv().RaelHubEspPlayer = value
  
  task.spawn(function()
    while getgenv().RaelHubEspPlayer do
      
      for _, Player in ipairs(Players:GetPlayers()) do
        
        local CharacterPlayer = Player.Character or Player.CharacterAdded:Wait()
        local RaelHubDestaque = CharacterPlayer:FindFirstChild("RaelHubDestaque")
        local RaelHubIcon = CharacterPlayer:FindFirstChild("RaelHubIcon")
        
        if method == "Normal" then
          
          if not RaelHubDestaque and not RaelHubIcon then
            
            RaelHubFunction.CreateEsp(CharacterPlayer, Color3.fromRGB(144, 238, 144), "117259180607823", Player.Name)
            
          end
          
        elseif method == "ShowDistance" then
          if not RaelHubDestaque and not RaelHubIcon then
            RaelHubFunction.CreateEspDistance(CharacterPlayer, Color3.fromRGB(144, 238, 144), Player.Name, true)
          end
        end
      end
      
      task.wait(0.1)
      
    end
    
    if not getgenv().RaelHubEspPlayer then
      
      for _, Player in ipairs(Players:GetPlayers()) do
        
        local CharacterPlayer = Player.Character or Player.CharacterAdded:Wait()
        
        RaelHubFunction.DisableEsp(CharacterPlayer)
        
      end
      
    end
  end)
end

function RaelHubFunction.SendInChat(msg)
  if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
    ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    Chat:SendAsync(msg)
  end
end

function RaelHubFunction.InfoFullBright()
  
  local Lighting = game:GetService("Lighting")
  
  shared.OriginalAmbient = Lighting.Ambient
  shared.OriginalColorShiftBottom = Lighting.ColorShift_Bottom
  shared.OriginalColorShiftTop = Lighting.ColorShift_Top
  shared.OriginalClockTime = Lighting.ClockTime

end

function RaelHubFunction.FullBright(value)
  
  getgenv().RaelHubFullBright = value
  
  local Lighting = game:GetService("Lighting")
  
  if getgenv().RaelHubFullBright then
    
    RaelHubFunction.InfoFullBright()
    
    if not _G.RaelHubFullBrightService then
      
      local function ActiveFullBright()
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
        Lighting.ColorShift_Top = Color3.new(1, 1, 1)
        Lighting.ClockTime = 14
      end
      
      ActiveFullBright()
      
      _G.RaelHubFullBrightService = Lighting.LightingChanged:Connect(ActiveFullBright)
    
    end
    
  else
    
    if _G.RaelHubFullBrightService then
      
      _G.RaelHubFullBrightService:Disconnect()
      _G.RaelHubFullBrightService = nil
      
      Lighting.Ambient = shared.OriginalAmbient
      Lighting.ColorShift_Bottom = shared.OriginalColorShiftBottom
      Lighting.ColorShift_Top = shared.OriginalColorShiftTop
      Lighting.ClockTime = shared.OriginalClockTime
      
    end
    
  end
end

function RaelHubFunction.ClickButton(button)
  local success, err = pcall(function()
    for _, connection in pairs(getconnections(button.MouseButton1Click)) do
      if connection.Function then
        connection.Function()
      end
    end
  end)

  if not success then
   print("Error clicking button: " .. tostring(err))
  end
end

function RaelHubFunction.freezeplayer(Time)
  
  local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
  
  if HumanoidRootPart then
    
    task.spawn(function()
      HumanoidRootPart.Anchored = true
      task.wait(Time)
      HumanoidRootPart.Anchored = false
    end)
    
  end
end

function RaelHubFunction.FlyToPosition(targetPosition, speed)
  
  local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
  
  if HumanoidRootPart then
  
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = (targetPosition - HumanoidRootPart.Position).unit * speed
    bodyVelocity.Parent = HumanoidRootPart
    
    _G.RaelHubFlyService = RunService.Stepped:Connect(function()
      
      if (targetPosition - HumanoidRootPart.Position).magnitude < 5 then
        
        bodyVelocity:Destroy()
        
        _G.RaelHubFlyService:Disconnect()
        _G.RaelHubFlyService = nil
        
        HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        
      end
    end)
  end
end

function RaelHubFunction.StopFly()
  if _G.RaelHubFlyService then
    _G.RaelHubFlyService:Disconnect()
    _G.RaelHubFlyService = nil
  end
end

function RaelHubFunction.NoClip(value)
  
  getgenv().RaelHubNoclip = value
  
  local function EnableDisableCollide(vvalue)
    
    for _, Part in ipairs(Character:GetDescendants()) do
      
      if Part and Part:IsA("BasePart") then
        
        Part.CanCollide = vvalue
        
      end
    end
  end
  
  task.spawn(function()
  
    while getgenv().RaelHubNoclip do
      
      EnableDisableCollide(false)
      task.wait()
    end
    
    if not getgenv().RaelHubNoclip then
      
      EnableDisableCollide(true)
      
    end
    
  end)
end

function RaelHubFunction.SpectatePlayer(value, playername)
  
  getgenv().RaelHubSpectatePlayer = value
  
  local function spectateplayer()
    
    local player = Players:FindFirstChild(playername)
    
    if player then
      
      local playercharacter = player.Character
    
      if not playercharacter then return end
      
      local TargetHumanoid = playercharacter:FindFirstChild("Humanoid")
      
      if TargetHumanoid then
        
        Camera.CameraSubject = TargetHumanoid
        
      end
    end
  end
  
  task.spawn(function()
  
    while getgenv().RaelHubSpectatePlayer do
      spectateplayer()
      task.wait()
    end
    
    if not getgenv().RaelHubSpectatePlayer then
      
      local Humanoid = Character:FindFirstChild("Humanoid")
      
      if Humanoid then
        Camera.CameraSubject = Humanoid
      end
      
    end
  end)
end

function RaelHubFunction.AimbotPlayer(value, player, target)
  
  local Target_Part = target
  
  if Target_Part == "Torso" then Target_Part = "HumanoidRootPart" end
  
  getgenv().RaelHubAimbotValue = value
  getgenv().RaelHubAimbotTarget = Target_Part
  
  for _, Player in ipairs(Players:GetPlayers()) do
    if Player.Name == player then
      
      local Target_Character = Player.Character
      
      if Target_Character then
        getgenv().RaelHubAimbotPlayer = Target_Character
      end
      break
    end
  end
end

function RaelHubFunction.fly(speed, value)
  flyFunction(speed, value)
end

shared.RaelHubFunction = RaelHubFunction


return RaelHubFunction
