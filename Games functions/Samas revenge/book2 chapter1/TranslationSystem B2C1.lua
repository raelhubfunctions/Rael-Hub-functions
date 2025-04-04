local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()

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
local configFolder = "RaelHub SR B2C1" -- Pasta onde os arquivos de tradução serão salvos

-- Serviço de localização do Roblox
local LocalizationService = game:GetService("LocalizationService")

-- Função para detectar o idioma do jogador usando LocalizationService
local function GetPlayerLanguage()
    local result, code = pcall(function()
        return LocalizationService.RobloxLocaleId
    end)
    if result then
        return code:sub(1, 2) -- Retorna o código do idioma, como "en", "pt", etc.
    else
        return "en" -- Se houver erro, usa o inglês como padrão
    end
end

-- Função para salvar as traduções com base no idioma
local function SaveConfig(configTable, language)
    local fileName = configFolder .. "/" .. language .. ".json"
    local json = game:GetService("HttpService"):JSONEncode(configTable)
    writefile(fileName, json)
end

-- Função para carregar as traduções de um arquivo com base no idioma
local function LoadConfig(language)
    local fileName = configFolder .. "/" .. language .. ".json"
    if isfile(fileName) then
        local json = readfile(fileName)
        return game:GetService("HttpService"):JSONDecode(json)
    else
        return nil -- Retorna nil se o arquivo não existir
    end
end

-- Função principal para carregar ou traduzir
function TranslationModule:GetTabs()
    -- Verifica se a pasta de traduções existe, se não, cria
    if not isfolder(configFolder) then
        makefolder(configFolder)
    end

    -- Detectar o idioma do jogador usando o LocalizationService
    local currentLanguage = GetPlayerLanguage()

    -- Carregar as traduções do idioma do jogador se já existirem
    local savedConfig = LoadConfig(currentLanguage)

    -- Se as traduções já existem para o idioma atual, carregar
    if savedConfig then
        wait(1)
        screenGui:Destroy()
        return savedConfig.RepetitiveTexts, savedConfig.SkipPart, savedConfig.FisrtMap, savedConfig.OcenaPart, savedConfig.VillainPart, savedConfig.KeyPart, savedConfig.VictoriaPart, savedConfig.WhitePart, savedConfig.GhostPart, savedConfig.FinalPart, savedConfig.Jogador, savedConfig.Mostrar, savedConfig.Creditos
    end

    local RepetitiveTexts = {
      SafeZoneSection = RaelHubTradutor.Tradutor("Teleport to safe zone", currentLanguage),
      SafeZoneButton = RaelHubTradutor.Tradutor("Safe zone", currentLanguage),
      AutoCompleteButton = RaelHubTradutor.Tradutor("Auto complete", currentLanguage),
      Notify = RaelHubTradutor.Tradutor("Start the phase first", currentLanguage)
    }
    
    local SkipPart = {
      name = RaelHubTradutor.Tradutor("Skip part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Skip unnecessary part", currentLanguage),
    }
    local FisrtMap = {
      name = RaelHubTradutor.Tradutor("Crawl Part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Complete the crawl map", currentLanguage),
      button = RaelHubTradutor.Tradutor("Crawl Part", currentLanguage)
     
    }
    local OcenaPart = {
      name = RaelHubTradutor.Tradutor("Oceano Part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Skip ocean part", currentLanguage),
      button = RaelHubTradutor.Tradutor("Skip ocean", currentLanguage)
    }
    local VillainPart = {
      name = RaelHubTradutor.Tradutor("Villain Part", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Chat with the Village", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Talk Village", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Auto collect all orbs", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Auto collect orb", currentLanguage),
      Notify = RaelHubTradutor.Tradutor("Village not spawning", currentLanguage)
    }
    local KeyPart = {
      name = RaelHubTradutor.Tradutor("Key Part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Auto take the key and open the door", currentLanguage),
      button = RaelHubTradutor.Tradutor("Auto pass", currentLanguage)
      
    }
    local VictoriaPart = {
      name = RaelHubTradutor.Tradutor("Victoria Part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Auto complete the victoria part", currentLanguage),
    }
    local WhitePart = {
      name = RaelHubTradutor.Tradutor("Butterfly Part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Auto take the butterfly and open the door", currentLanguage),
      button = RaelHubTradutor.Tradutor("Auto pass", currentLanguage)
    }
    local GhostPart = {
      name = RaelHubTradutor.Tradutor("Ghost Part", currentLanguage),
      section = RaelHubTradutor.Tradutor("Auto complete ghost part", currentLanguage),
    }
    local FinalPart = {
      name = RaelHubTradutor.Tradutor("Final Part", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Skip the maze", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Skip maze", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Teleport to final area", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Enter the final area", currentLanguage)
      
    }

    local Jogador = {
        name = RaelHubTradutor.Tradutor("Player", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to players", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Player Speed", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Light up the map", currentLanguage),
        dropdowntext = RaelHubTradutor.Tradutor("Players: ", currentLanguage),
        slidetext = RaelHubTradutor.Tradutor("Speed: ", currentLanguage),
        button = RaelHubTradutor.Tradutor("Teleport to player", currentLanguage),
        toggle = RaelHubTradutor.Tradutor("Ativar velocidade", currentLanguage)
    }

    local Mostrar = {
        name = "Esp",
        section1 = RaelHubTradutor.Tradutor("Show objects", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show the monsters", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Show players", currentLanguage),
        toggle1 = "Esp " .. RaelHubTradutor.Tradutor(" object ", currentLanguage),
        toggle2 = "Esp " .. RaelHubTradutor.Tradutor(" monster ", currentLanguage),
        toggle3 = "Esp " .. RaelHubTradutor.Tradutor(" players ", currentLanguage)
    }

    local Creditos = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        section = RaelHubTradutor.Tradutor("Script creator", currentLanguage),
        descricao = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates", currentLanguage),
        ContentNotify = RaelHubTradutor.Tradutor("The script has been copied to the desktop", currentLanguage)
    }

    -- Salvar as traduções para o idioma do jogador
    local updatedConfig = {
        RepetitiveTexts = RepetitiveTexts,
        SkipPart = SkipPart,
        FisrtMap = FisrtMap,
        OcenaPart = OcenaPart,
        VillainPart = VillainPart,
        KeyPart = KeyPart,
        VictoriaPart = VictoriaPart,
        WhitePart = WhitePart,
        GhostPart = GhostPart,
        FinalPart = FinalPart,
        Jogador = Jogador,
        Mostrar = Mostrar,
        Creditos = Creditos
    }

    SaveConfig(updatedConfig, currentLanguage)

    screenGui:Destroy()
    return RepetitiveTexts, SkipPart, FisrtMap, OcenaPart, VillainPart, KeyPart, VictoriaPart, WhitePart, GhostPart, FinalPart, Jogador, Mostrar, Creditos
end

return TranslationModule