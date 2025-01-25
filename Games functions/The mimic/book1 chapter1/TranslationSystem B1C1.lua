local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/Raelhub/Rael-hub-function/refs/heads/main/RaelHubTranslatorSystem/script.lua"))()

local Text1 = RaelHubTradutor.Tradutor("OBRIGADO POR USAR RAEL HUB")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cria a tela de carregamento
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Imagem de fundo (opcional)
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.7, 0, 0.6, 0)
imageLabel.Position = UDim2.new(0.15, 0, 0.2, 0)
imageLabel.Image = "rbxassetid://18665679839"
imageLabel.BackgroundTransparency = 1
imageLabel.ScaleType = Enum.ScaleType.Stretch
imageLabel.Parent = screenGui

-- Cria o TextLabel
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 0.1, 0)
title.AnchorPoint = Vector2.new(0.5, 0.5)
title.Position = UDim2.new(0.5, 0, 0.5, 0) -- Posição centralizada
title.BackgroundTransparency = 1
title.Text = Text1
title.TextColor3 = Color3.fromRGB(16, 235, 138) -- Cor do texto
title.Font = Enum.Font.ArialBold
title.TextScaled = true
title.TextTransparency = 1 -- Começa invisível
title.Parent = screenGui



-- Função para fazer o fade in
local function fadeInText(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
        object.TextTransparency = 1 - i
        wait(increment)
    end
end

-- Função para fazer o fade out
local function fadeOutText(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
        object.TextTransparency = i
        wait(increment)
    end
end

local function fadeInImage(duration, object)
  local increment = 0.05
  local step = increment / duration
  task.spawn(function()
    for i = 0, 1, step do
      object.ImageTransparency = 1 - i
      wait(increment)
    end
  end)
end


local function fadeOutImage(duration, object)
  local increment = 0.05
  local step = increment / duration
  for i = 0, 1, step do
    object.ImageTransparency = i
    wait(increment)
  end
end

-- Função para fazer o ícone girar
local function rotateIcon(icon)
    local rotation = 0
    while icon.Parent do
        rotation = rotation + 30 -- Gira o ícone
        icon.Rotation = rotation
        task.wait(0.05) -- Velocidade da rotação
    end
end

-- Som ao iniciar (opcional)
local startSound = Instance.new("Sound")
startSound.SoundId = "rbxassetid://6114974207"
startSound.Volume = 1
startSound.Parent = screenGui
startSound:Play()

-- Exemplo de uso
fadeInText(0.5, title) -- Faz o texto aparecer
wait(2)
fadeOutText(0.5, title) -- Faz o texto desaparecer
title.Text = "RAEL HUB"
title.AnchorPoint = Vector2.new(0, 0)
title.Position = UDim2.new(0.2, 0, 0.35, 0)
fadeInText(0.5, title)

-- Ícone de carregamento giratório
local loadingIcon = Instance.new("ImageLabel")
loadingIcon.Size = UDim2.new(0.1, 0, 0.1, 0) -- Mantém a proporção
loadingIcon.Position = UDim2.new(0.45, 0, 0.5, 0) -- Centralizado
loadingIcon.Image = "rbxassetid://106296997072730" -- Ícone de loading
loadingIcon.BackgroundTransparency = 1
loadingIcon.ScaleType = Enum.ScaleType.Fit -- Ajuste para manter a proporção
loadingIcon.Parent = screenGui

fadeInImage(0.5, loadingIcon)

-- Inicia a rotação do ícone de carregamento
spawn(function()
    rotateIcon(loadingIcon)
end)

local TranslationModule = {}

function TranslationModule:GetTabs()
  local Main = {
    name = "",
    section1 = "",
    section2 = "",
    button = ""
  }

  local Jigoku = {
    name = "",
    section = "",
    button = "",
    title = "",
    content = "",
    ConfirmButton = "",
    CancelButton = "",
    NotifyContent = ""
  }
  local Jogador = {
    name = "",
    section1 = "",
    section2 = "",
    section3 = "",
    dropdowntext = "",
    slidetext = "",
    button = ""
  }
  
  local Mostrar = {
    name = "",
    toggle1 = "",
    toggle2 = "",
    toggle3 = ""
  }
  
  local Creditos = {
    name = "",
    section = "",
    descricao = "",
    ContentNotify = ""
  }
  
  Main.name = RaelHubTradutor.Tradutor("Main")
  Main.section1 = RaelHubTradutor.Tradutor("Auto win part 1")
  Main.section2 = RaelHubTradutor.Tradutor("Auto win part 2")
  Main.button = RaelHubTradutor.Tradutor("Auto win")
  
  Jigoku.name = RaelHubTradutor.Tradutor("Jigoku")
  Jigoku.section = RaelHubTradutor.Tradutor("Teleport to Jigoku map")
  Jigoku.button = RaelHubTradutor.Tradutor("Teleport to Jigoku")
  Jigoku.Title = RaelHubTradutor.Tradutor("Decision")
  Jigoku.Content = RaelHubTradutor.Tradutor("Do you really want to go to the map?")
  Jigoku.ConfirmButton = RaelHubTradutor.Tradutor("Confirm")
  Jigoku.CancelButton = RaelHubTradutor.Tradutor("Cancel ")
  Jigoku.NotifyContent = RaelHubTradutor.Tradutor("Wait one moment")
  
  Jogador.name = RaelHubTradutor.Tradutor("Player")
  Jogador.section1 = RaelHubTradutor.Tradutor("Teleport to players")
  Jogador.section2 = RaelHubTradutor.Tradutor("Player Speed")
  Jogador.section3 = RaelHubTradutor.Tradutor("Light up the map")
  Jogador.dropdowntext = RaelHubTradutor.Tradutor("Players: ")
  Jogador.slidetext = RaelHubTradutor.Tradutor("Speed: ")
  Jogador.button = RaelHubTradutor.Tradutor("Teleport to player")
  
  Mostrar.name = "Esp"
  Mostrar.toggle1 = "Esp " .. RaelHubTradutor.Tradutor(" monster ")
  Mostrar.toggle2 = "Esp " .. RaelHubTradutor.Tradutor(" players ")
  Mostrar.toggle3 = "Esp " .. RaelHubTradutor.Tradutor(" objects ")
  
  Creditos.name = RaelHubTradutor.Tradutor("Credits")
  Creditos.section = RaelHubTradutor.Tradutor("Script creator")
  Creditos.descricao = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates")
  Creditos.ContentNotify = RaelHubTradutor.Tradutor("The script has been copied to the desktop")
  screenGui:Destroy()
  
  return Main, Jigoku, Jogador, Mostrar, Creditos
  
end



return TranslationModule