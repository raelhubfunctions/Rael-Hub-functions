
local _env = getgenv()
local raelhubfunctions = {}
local mainDir: string = "https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions"
local moduleDir: string = mainDir .. "/refs/heads/main/Rael%20functions/modules/"
local flyModule = loadstring(game:HttpGet(moduleDir .. "flyModule.lua"))()
local fireproximityprompt = loadstring(game:HttpGet(moduleDir .. "Executor%20support/fireproximityprompt.lua"))()

local VirtualUser: VideoPlayer = game:GetService("VirtualUser")
local TextChatService: TextChatService = game:GetService("TextChatService")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService: RunService = game:GetService("RunService")
local Players: Players = game:GetService("Players")
local Light: Lighting = game:GetService("Lighting")

local Camera: Camera = workspace.CurrentCamera
local Chat: TextChannel = TextChatService.ChatInputBarConfiguration.TargetTextChannel
local LocalPlayer: Player = Players.LocalPlayer
local Character: Model = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

shared.configLight = shared.configLight or {
    ["Ambient"] = Light.Ambient,
    ["ColorShift_Bottom"] = Light.ColorShift_Bottom,
    ["ColorShift_Top"] = Light.ColorShift_Top
}

shared.connections = shared.connections or {}

for _, connection: RBXScriptSignal in pairs(shared.connections) do
    connection:Disconnect()
    connection = nil
end

shared.Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

if not shared.connections["monitorCharacter"] then
  shared.connections["monitorCharacter"] = LocalPlayer.CharacterAdded:Connect(function(newcharacter)
    Character = newcharacter
    shared.Character = newcharacter
  end)
end

local links: { string } = {
    "https://nexviewsservice.shardweb.app/services/rael_hub/start",
    "https://raw.githubusercontent.com/hypertext500/Testando/refs/heads/main/main.luau",
    moduleDir .. "sendModule.lua",
}

for index: number, link: string in pairs(links) do
    task.spawn(function()
        local result: boolean, content: any = pcall(function() loadstring(game:HttpGet(link))() end)
        warn("[Rael hub function] checking the result of function " .. index, result) 
    end)
end

function raelhubfunctions.CreateEspObject(object: Instance, color: Color3, imageId: string, text: string)
  
  if object:FindFirstChild("raelhubicon") or object:FindFirstChild("raelhubhighlight") then 
    warn("[Rael hub error] the raelhubicon or raelhubhighlight exist")
    return 
  end

  local objectPart: BasePart | MeshPart;

  for _, part: BasePart | MeshPart in ipairs(object:GetDescendants()) do
    if part.Name == "HumanoidRootPart" or part:IsA("BasePart") or part:IsA("MeshPart") then 
      objectPart = part
      break
    end
  end
  
  local highlight: Highlight = Instance.new("Highlight")
  highlight.Name = "raelhubhighlight"
  highlight.Adornee = object
  highlight.FillColor = color or Color3.fromRGB(255, 255, 255)
  highlight.Parent = object

  local billboard: BillboardGui = Instance.new("BillboardGui")
  billboard.Name = "raelhubicon"
  billboard.Adornee = objectPart
  billboard.Size = UDim2.new(0, 30, 0, 30)
  billboard.StudsOffset = Vector3.new(0, 0, 0)
  billboard.AlwaysOnTop = true
  billboard.Parent = object

  local imageLabel: ImageLabel = Instance.new("ImageLabel")
  imageLabel.Size = UDim2.new(1, 0, 1, 0)
  imageLabel.BackgroundTransparency = 1
  imageLabel.Image = "rbxassetid://" .. imageId or "12905962634"
  imageLabel.Parent = billboard
  
  local textLabel: TextLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = text or "Instance"
  textLabel.Position = UDim2.new(0, 0, 0, 20)
  textLabel.TextColor3 = color or Color3.fromRGB(255, 255, 255)
  textLabel.TextSize = 13
  textLabel.Font = Enum.Font.GothamBold
  textLabel.Parent = billboard
end

function raelhubfunctions.CreateEspDistance(object: Instance, color: Color3, text: string, showDistance: boolean)

  if object:FindFirstChild("raelhubicon") or object:FindFirstChild("raelhubhighlight") then 
    warn("[Rael hub error] the raelhubicon or raelhubhighlight exist")
    return 
  end

  local objectPart: BasePart | MeshPart;

  for _, part: BasePart | MeshPart in ipairs(object:GetDescendants()) do
    if part.Name == "HumanoidRootPart" or part:IsA("BasePart") or part:IsA("MeshPart") then 
      objectPart = part
      break
    end
  end

  if not objectPart then warn("[Rael hub error] the basepart was not found in the", object); return end

  local raelhubhighlight: Highlight = Instance.new("Highlight")
  raelhubhighlight.Name = "raelhubhighlight"
  raelhubhighlight.Adornee = object
  raelhubhighlight.FillColor = color or Color3.fromRGB(255, 255, 255)
  raelhubhighlight.Parent = object

  local billboard: BillboardGui = Instance.new("BillboardGui")
  billboard.Name = "raelhubicon"
  billboard.Adornee = objectPart
  billboard.Size = UDim2.new(0, 50, 0, 50)
  billboard.StudsOffset = Vector3.new(0, 0, 0)
  billboard.AlwaysOnTop = true
  billboard.Parent = object
    
  local textLabel: TextLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = text or "Instance"
  textLabel.Position = UDim2.new(0, 0, 0, 0)
  textLabel.TextColor3 = color or Color3.fromRGB(255, 255, 255)
  textLabel.TextSize = 13
  textLabel.Font = Enum.Font.GothamBold
  textLabel.Parent = billboard

  local distanceLabel: TextLabel = Instance.new("TextLabel")
  distanceLabel.Size = UDim2.new(1, 0, 1, 0)
  distanceLabel.BackgroundTransparency = 1
  distanceLabel.Text = ""
  distanceLabel.Position = UDim2.new(0, 0, 0, 12)
  distanceLabel.TextColor3 = color or Color3.fromRGB(255, 255, 255)
  distanceLabel.TextSize = 13
  distanceLabel.Font = Enum.Font.GothamBold
  distanceLabel.Parent = billboard

  if not showDistance then return end

  RunService.RenderStepped:Connect(function()
    local targetRoot: BasePart = Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot and not objectPart then return end

    local playerPos = Character.HumanoidRootPart.Position
    local objectPos = objectPart.Position
    local distance = (playerPos - objectPos).Magnitude
      
    distanceLabel.Text = "Distance: " .. math.floor(distance) .. " studs"
  end)
end

function raelhubfunctions.PlayersEspActive()
  for _, player: Player in ipairs(Players:GetPlayers()) do

    local targetCharacter = player.Character
    local raelhubhighlight: Highlight = player:FindFirstChild("raelhubhighlight")
    local raelhubicon: BillboardGui  = player:FindFirstChild("raelhubicon")

    if not targetCharacter or raelhubhighlight or raelhubicon then continue end

    raelhubfunctions.CreateEsp(targetCharacter, Color3.fromRGB(144, 238, 144), "117259180607823", player.Name)
  end
end

function raelhubfunctions.DisableEsp(object: Instance)

  if not object then warn("[Rael hub error] the object was not found"); return end

  local raelhubhighlight: Highlight = object:FindFirstChild("raelhubhighlight")
  local raelhubicon: BillboardGui  = object:FindFirstChild("raelhubicon")
  
  if raelhubhighlight then raelhubhighlight:Destroy() end
  if raelhubicon then raelhubicon:Destroy() end
  
end

function raelhubfunctions.Auto_Click_V1(value: boolean)
  
  _env.RaelHubAutoClickV1 = value
  
  local function mouseClick()
    VirtualUser:CaptureController()
    VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
    task.wait(0.05)
  end
  
  task.spawn(function()
    while _env.RaelHubAutoClickV1 do
      mouseClick()
      task.wait()
    end
  end)
end

function raelhubfunctions.Criarchao(position: Vector3, colicion: boolean, transparency: number, corRGB: Color3)

  local folderParts: Folder = workspace:FindFirstChild("RaelHubFloor") or Instance.new("Folder")
  folderParts.Name = "RaelHubFloor"
  folderParts.Parent = workspace

  local part: BasePart = Instance.new("Part")
  part.Size = Vector3.new(10, 1, 10)
  part.Position = position
  part.Anchored = true
  part.Color = corRGB
  part.Transparency = transparency
  part.Parent = folderParts

  local function createBarrier(position: Vector3, size: number)
    local barrier: BasePart = Instance.new("Part")
    barrier.Size = size
    barrier.Position = position
    barrier.Anchored = true
    barrier.CanCollide = true
    barrier.Transparency = 1
    barrier.Color = Color3.fromRGB(0, 0, 255)
    barrier.Parent = folderParts
  end

  local barrierThickness: number = 1
  local barrierHeight: number = 10

  local barrierPositions: { Vector3 } = {
    Vector3.new(part.Position.X, part.Position.Y + barrierHeight / 2, part.Position.Z - part.Size.Z / 2 - barrierThickness / 2),
    Vector3.new(part.Position.X, part.Position.Y + barrierHeight / 2, part.Position.Z + part.Size.Z / 2 + barrierThickness / 2),
    Vector3.new(part.Position.X - part.Size.X / 2 - barrierThickness / 2, part.Position.Y + barrierHeight / 2, part.Position.Z),
    Vector3.new(part.Position.X + part.Size.X / 2 + barrierThickness / 2, part.Position.Y + barrierHeight / 2, part.Position.Z),
  }

  if colicion then
    for _, pos in ipairs(barrierPositions) do
      if pos.Z == part.Position.Z then
        createBarrier(pos, Vector3.new(barrierThickness, barrierHeight, part.Size.Z))
      else
        createBarrier(pos, Vector3.new(part.Size.X, barrierHeight, barrierThickness))
      end
    end
  end
end

function raelhubfunctions.ESPPlayers(value: boolean, method: string)
  
  _env.RaelHubEspPlayer = value
  
  task.spawn(function()
    while _env.RaelHubEspPlayer do
      
      for _, player: Player in ipairs(Players:GetPlayers()) do
        
        local targetCharacter: Model = player.Character
        local raelhubhighlight: Highlight = (targetCharacter and targetCharacter:FindFirstChild("raelhubhighlight"))
        local raelhubicon: BillboardGui  = (targetCharacter and targetCharacter:FindFirstChild("raelhubicon"))
        
        if not targetCharacter then continue end

        if method == "Normal" then
          if raelhubhighlight and raelhubicon then continue end        
          raelhubfunctions.CreateEsp(targetCharacter, Color3.fromRGB(144, 238, 144), "117259180607823", player.Name)          
        elseif method == "ShowDistance" then
          if raelhubhighlight and raelhubicon then continue end  
          raelhubfunctions.CreateEspDistance(targetCharacter, Color3.fromRGB(144, 238, 144), player.Name, true)
        end
      end
      
      task.wait(0.1)
      
    end
    
    if not _env.RaelHubEspPlayer then
      
      for _, player: Player in ipairs(Players:GetPlayers()) do
        local targetCharacter = player.Character
        if not targetCharacter then continue end
        raelhubfunctions.DisableEsp(targetCharacter)
      end
      
    end
  end)
end

function raelhubfunctions.SendInChat(msg: string)
  if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
    ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    Chat:SendAsync(msg)
  end
end

function raelhubfunctions.FullBright(value: boolean)

    _env.isActiveFullBright = value

    local function activeFullBright()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
    end

    if shared.connections["fullBright"] then
        shared.connections["fullBright"]:Disconnect()
        shared.connections["fullBright"] = nil
    end

    if not _env.isActiveFullBright then
        for configName, configValue in pairs(shared.configLight) do
            Light[configName] = configValue
        end
        return "Done!"
    end

    activeFullBright()
    shared.connections["fullBright"] = Light.LightingChanged:Connect(activeFullBright)

    return "Done!"
end

function raelhubfunctions.ClickButton(button: TextButton | ImageButton | GuiButton)

    if not _env.getconnections then return warn("[Rael hub error] getconnections does not exist in your executor") end

    local success, err = pcall(function()
        for _, connection: table in pairs(_env.getconnections(button.MouseButton1Click)) do
            if not connection.Function then continue end
            connection.Function()
        end
    end)

    if not success then warn("[Rael hub error] click button:", err) end
end

function raelhubfunctions.freezeplayer(time: number, sync: boolean)
  
    local rootPlayer: BasePart = (Character and Character:FindFirstChild("HumanoidRootPart"))
    if not rootPlayer then return warn("[Rael hub error] the rootPlayer not exist") end

    if not sync then
        task.spawn(function()
            rootPlayer.Anchored = true
            task.wait(time)
            rootPlayer.Anchored = false
        end)
        return "Done!"
    end

    rootPlayer.Anchored = true
    task.wait(time)
    rootPlayer.Anchored = false
    return "Done!"
end

function raelhubfunctions.FlyToPosition(targetPosition: Vector3, speed: number)
  
    local rootPlayer: BasePart = (Character and Character:FindFirstChild("HumanoidRootPart"))
    if not rootPlayer then return warn("[Rael hub error] the rootPlayer not exist") end 

    local bodyVelocity: BodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Name = "Fly to position"
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = (targetPosition - rootPlayer.Position).unit * speed
    bodyVelocity.Parent = rootPlayer

    shared.connections["flyToPosition"] = RunService.Stepped:Connect(function()
        
        if (targetPosition - rootPlayer.Position).magnitude > 5 then return end
        if bodyVelocity then bodyVelocity:Destroy() end

        if shared.connections["flyToPosition"] then
            shared.connections["flyToPosition"]:Disconnect()
            shared.connections["flyToPosition"] = nil
        end
        
        rootPlayer.CFrame = CFrame.new(targetPosition)
    end)
end

function raelhubfunctions.StopFly()
    if not shared.connections["flyToPosition"] then return end
    shared.connections["flyToPosition"]:Disconnect()
    shared.connections["flyToPosition"] = nil
end

function raelhubfunctions.NoClip(value: boolean)
    _env.RaelHubNoclip = value

    local function noClip(state: boolean)
        if not Character then return end
        for _, part: BasePart | MeshPart in ipairs(Character:GetDescendants()) do
            if (not part:IsA("BasePart") and not part:IsA("MeshPart")) then continue end

            if state then
                if part.CanCollide then
                    part.CanCollide = false
                    part:SetAttribute("RaelHubNoClip", true)
                end
            else
                if part:GetAttribute("RaelHubNoClip") then
                    part.CanCollide = true
                    part:SetAttribute("RaelHubNoClip", nil)
                end
            end
        end
    end

    if not _env.RaelHubNoclip then
        if shared.connections["noClip"] then
          shared.connections["noClip"]:Disconnect()
          shared.connections["noClip"] = nil
        end
        noClip(false)
        return "Noclip Disabled"
    end

    noClip(true)
    shared.connections["noClip"] = RunService.Heartbeat:Connect(function()
      noClip(true)
    end)
    return "Noclip Enabled"
end

function raelhubfunctions.SpectatePlayer(value: boolean, username: string)
  
  _env.RaelHubSpectatePlayer = value

  local function spectateplayer(username: string)
    local playerTarget: Player = Players:FindFirstChild(username)
    local characterTarget: Model = (playerTarget and playerTarget.Character)
    local humanoidTarget: Humanoid = (characterTarget and characterTarget:FindFirstChild("Humanoid"))
    
    if not humanoidTarget then warn("[Rael hub error] player or character or humanoid not exist"); return end

    Camera.CameraSubject = humanoidTarget
  end
  
  task.spawn(function()
    while _env.RaelHubSpectatePlayer do
      spectateplayer(username)
      task.wait()
    end
    
    if not _env.RaelHubSpectatePlayer then
      local humanoid: Humanoid = Character:FindFirstChild("Humanoid")
      if not humanoid then warn("[Rael hub error] your humanoid not exist"); return end
      Camera.CameraSubject = humanoid
    end
  end)
end

function raelhubfunctions.fly(value, speed)
  flyModule.flymodel1(value, speed)
end

function raelhubfunctions.flyV2(value, speed)
  flyModule.flymodel2(value, speed)
end

shared.RaelHubFunction = raelhubfunctions

return raelhubfunctions