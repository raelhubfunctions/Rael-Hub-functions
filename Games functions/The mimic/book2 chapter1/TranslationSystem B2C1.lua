local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()

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
local configFolder = "Rael Hub B2C1" -- Pasta de traduções

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
    local currentLanguage = language  -- Use a variável de linguagem passada para a função

    return {
        Tab_Oficine = {
            name = RaelHubTradutor.Tradutor("Teleporte sala", currentLanguage),
            section = RaelHubTradutor.Tradutor("Teleportar para a sala", currentLanguage),
            button = RaelHubTradutor.Tradutor("Teleportar pra sala", currentLanguage)
        },

        Tab_Sisters = {
            name = RaelHubTradutor.Tradutor("Fase das Irmãs", currentLanguage),
            section1 = RaelHubTradutor.Tradutor("Ler livro na sala", currentLanguage),
            section2 = RaelHubTradutor.Tradutor("Esp monstro", currentLanguage),
            section3 = RaelHubTradutor.Tradutor("Auto coletar os ratos", currentLanguage),
            section4 = RaelHubTradutor.Tradutor("Auto escapar dessa sala", currentLanguage),
            section5 = RaelHubTradutor.Tradutor("Auto escapar de Rin", currentLanguage),
            button1 = RaelHubTradutor.Tradutor("Ler livro", currentLanguage),
            button2 = RaelHubTradutor.Tradutor("Esp rin", currentLanguage),
            button3 = RaelHubTradutor.Tradutor("Auto coletar", currentLanguage),
            button4 = RaelHubTradutor.Tradutor("Auto escapar", currentLanguage),
            button5 = RaelHubTradutor.Tradutor("Auto fugir de Rin", currentLanguage),
            Notification = RaelHubTradutor.Tradutor("Carregando...", currentLanguage),
            NotificationContent = RaelHubTradutor.Tradutor("Processando arquivos", currentLanguage)
        },

        Tab_Nagisa = {
            name = RaelHubTradutor.Tradutor("Fase da Nagisa", currentLanguage),
            section1 = RaelHubTradutor.Tradutor("Auto passar da Nagisa", currentLanguage),
            section2 = RaelHubTradutor.Tradutor("Auto escapar da Nagisa", currentLanguage),
            button1 = RaelHubTradutor.Tradutor("Auto ganhar da Nagisa", currentLanguage),
            button2 = RaelHubTradutor.Tradutor("Auto fugir da Nagisa", currentLanguage)
        },

        Tab_PhasesFrame = {
            name = RaelHubTradutor.Tradutor("Fase das pinturas", currentLanguage),
            section1 = RaelHubTradutor.Tradutor("Falar com o kenio", currentLanguage),
            section2 = RaelHubTradutor.Tradutor("Mostrar a localização do monstro", currentLanguage),
            section3 = RaelHubTradutor.Tradutor("Auto coletar a chave", currentLanguage),
            section4 = RaelHubTradutor.Tradutor("Auto coletar os quadros", currentLanguage),
            section5 = RaelHubTradutor.Tradutor("Teleportar para as casas", currentLanguage),
            section6 = RaelHubTradutor.Tradutor("Teleportar para a casa de acender as velas", currentLanguage),
            section7 = RaelHubTradutor.Tradutor("Auto acender as velas", currentLanguage),
            section8 = RaelHubTradutor.Tradutor("Auto coletar a esfera", currentLanguage),
            button1 = RaelHubTradutor.Tradutor("Falar", currentLanguage),
            button2 = RaelHubTradutor.Tradutor("Esp monstro", currentLanguage),
            button3 = RaelHubTradutor.Tradutor("Auto chave", currentLanguage),
            button4 = RaelHubTradutor.Tradutor("Auto coletar quadro", currentLanguage),
            button5 = RaelHubTradutor.Tradutor("Teleportar casa", currentLanguage),
            button6 = RaelHubTradutor.Tradutor("Teleportar casa de acender as velas", currentLanguage),
            button7 = RaelHubTradutor.Tradutor("Auto acender velas", currentLanguage),
            button8 = RaelHubTradutor.Tradutor("Auto coletar esfera", currentLanguage),
            description = RaelHubTradutor.Tradutor("Só funciona corretamente depois que você faz o puzzle da casa 3 e abri a porta da casa das velas", currentLanguage),
            AddDropdownName = RaelHubTradutor.Tradutor("Houses", currentLanguage),
            HouseText = RaelHubTradutor.Tradutor("House ", currentLanguage)
        },

        Tab_VelaFase = {
            name = RaelHubTradutor.Tradutor("Fase das velas", currentLanguage),
            section1 = RaelHubTradutor.Tradutor("Teleportar para zona segura", currentLanguage),
            section2 = RaelHubTradutor.Tradutor("Mostrar monstros", currentLanguage),
            section3 = RaelHubTradutor.Tradutor("Teleportar para as velas", currentLanguage),
            section4 = RaelHubTradutor.Tradutor("Escapar de Tenomo", currentLanguage),
            button1 = RaelHubTradutor.Tradutor("Zona segura", currentLanguage),
            button2 = RaelHubTradutor.Tradutor("Esp monstros", currentLanguage),
            button3 = RaelHubTradutor.Tradutor("Teleportar vela", currentLanguage),
            button4 = RaelHubTradutor.Tradutor("Auto escapar", currentLanguage),
            AddDropdownName = RaelHubTradutor.Tradutor("Candles", currentLanguage),
            NavioVelaText = RaelHubTradutor.Tradutor("Candle ", currentLanguage)
        },

        Tab_Other = {
            name = RaelHubTradutor.Tradutor("Outros", currentLanguage),
            section1 = RaelHubTradutor.Tradutor("Mostrar onde o jogador tá", currentLanguage),
            button1 = RaelHubTradutor.Tradutor("Esp player", currentLanguage),
            section2 = RaelHubTradutor.Tradutor("Iluminar ao redor", currentLanguage),
            button2 = RaelHubTradutor.Tradutor("FullBright", currentLanguage)
        },

        Tab_Creditos = {
            name = RaelHubTradutor.Tradutor("Créditos", currentLanguage),
            paragrafo = RaelHubTradutor.Tradutor("Entre no meu canal do YouTube e no meu Discord para novas atualizações.", currentLanguage)
        }
    }
end

function TranslationModule:GetTabs()
    if not isfolder(configFolder) then
        makefolder(configFolder)
    end

    local currentLanguage = GetPlayerLanguage()
    local savedConfig = LoadConfig(currentLanguage)

    -- Carrega a tradução salva ou cria uma nova
    if savedConfig then
        return savedConfig.Tab_Oficine, savedConfig.Tab_Sisters, savedConfig.Tab_Nagisa, savedConfig.Tab_PhasesFrame, savedConfig.Tab_VelaFase, savedConfig.Tab_Other, savedConfig.Tab_Creditos
    else
        local newConfig = CreateTranslation(currentLanguage)
        SaveConfig(newConfig, currentLanguage)
        return newConfig.Tab_Oficine, newConfig.Tab_Sisters, newConfig.Tab_Nagisa, newConfig.Tab_PhasesFrame, newConfig.Tab_VelaFase, newConfig.Tab_Other, newConfig.Tab_Creditos
    end
end

return TranslationModule