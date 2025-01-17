local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/Raelhub/Rael-hub-function/refs/heads/main/RaelHubTranslatorSystem/script.lua"))()

local Text1 = RaelHubTradutor.Tradutor("OBRIGADO POR USAR RAEL HUB")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cria a tela de carregamento
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RaelHubLoad"
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
local TranslationModule = {}
local configFolder = "RaelHubHalloween" -- Pasta de traduções

-- Serviço de localização do Roblox
local LocalizationService = game:GetService("LocalizationService")

-- Função para detectar o idioma do jogador usando LocalizationService
local function GetPlayerLanguage()
    local result, code = pcall(function()
        return LocalizationService.RobloxLocaleId
    end)
    return result and code:sub(1, 2) or "en"
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
    end
    return nil
end

-- Função para traduzir e estruturar os textos
local function CreateTranslation(language)
    return {
        Main = {
            name = RaelHubTradutor.Tradutor("Main", language),
            section1 = RaelHubTradutor.Tradutor("Auto win part 1", language),
            section2 = RaelHubTradutor.Tradutor("Auto win part 2", language),
            section3 = RaelHubTradutor.Tradutor("Auto win part 3", language),
            button = RaelHubTradutor.Tradutor("Auto win", language)
        },
        Tab_Candy = {
            section = RaelHubTradutor.Tradutor("Auto coletar todos os doces", language),
            button = RaelHubTradutor.Tradutor("Auto coletar doces", language)
        },
        Part2 = {
            EspName = RaelHubTradutor.Tradutor("Pumpkin", language),
            button1 = RaelHubTradutor.Tradutor("Auto win (Singleplayer)", language),
            button2 = RaelHubTradutor.Tradutor("Auto win (Multiplayer)", language),
            description1 = RaelHubTradutor.Tradutor("Teleportar direto para terceira parte", language),
            description2 = RaelHubTradutor.Tradutor("Acende todas as velas", language)
        },
        Part3 = {
            button1 = RaelHubTradutor.Tradutor("Auto win (Singleplayer)", language),
            button2 = RaelHubTradutor.Tradutor("Auto criar a poção", language),
            description1 = RaelHubTradutor.Tradutor("Teleportar direto para kabocha", language),
            description2 = RaelHubTradutor.Tradutor("Auto fazer a poção", language)
        },
        Jogador = {
            name = RaelHubTradutor.Tradutor("Player", language),
            section1 = RaelHubTradutor.Tradutor("Teleport to players", language),
            section2 = RaelHubTradutor.Tradutor("Player Speed", language),
            section3 = RaelHubTradutor.Tradutor("Light up the map", language),
            dropdowntext = RaelHubTradutor.Tradutor("Players: ", language),
            slidetext = RaelHubTradutor.Tradutor("Speed: ", language),
            button = RaelHubTradutor.Tradutor("Teleport to player", language)
        },
        Mostrar = {
            name = "Esp",
            toggle1 = "Esp " .. RaelHubTradutor.Tradutor(" object ", language),
            toggle2 = "Esp " .. RaelHubTradutor.Tradutor(" monster ", language),
            toggle3 = "Esp " .. RaelHubTradutor.Tradutor(" players ", language)
        },
        Creditos = {
            name = RaelHubTradutor.Tradutor("Credits", language),
            section = RaelHubTradutor.Tradutor("Script creator", language),
            descricao = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates", language),
            ContentNotify = RaelHubTradutor.Tradutor("The script has been copied to the desktop", language)
        }
    }
end

-- Função principal para carregar ou traduzir
function TranslationModule:GetTabs()
    if not isfolder(configFolder) then
        makefolder(configFolder)
    end

    local currentLanguage = GetPlayerLanguage()
    local savedConfig = LoadConfig(currentLanguage)

    -- Carrega a tradução salva ou cria uma nova
    if savedConfig then
        return savedConfig.Main, savedConfig.Tab_Candy, savedConfig.Part2, savedConfig.Part3, savedConfig.Jogador, savedConfig.Mostrar, savedConfig.Creditos
    else
        local newConfig = CreateTranslation(currentLanguage)
        SaveConfig(newConfig, currentLanguage)
        return newConfig.Main, newConfig.Tab_Candy, newConfig.Part2, newConfig.Part3, newConfig.Jogador, newConfig.Mostrar, newConfig.Creditos
    end
end

return TranslationModule