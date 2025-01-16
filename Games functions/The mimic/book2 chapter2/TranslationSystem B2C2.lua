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
local configFolder = "RaelHub B2C2" -- Pasta onde os arquivos de tradução serão salvos

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
        return savedConfig.Tab_Oceano, savedConfig.Tab_ComedorCarne, savedConfig.Tab_Meat, savedConfig.Tab_Esqueletos, savedConfig.Tab_Alavancas, savedConfig.Tab_Engima, savedConfig.Tab_Comida, savedConfig.Tab_Teiryu, savedConfig.Tab_Torre, savedConfig.Tab_Chihiro, savedConfig.Tab_Boss, savedConfig.Tab_Others, savedConfig.Tab_Creditos
        
    end

    
    local Tab_Oceano = {
      name = RaelHubTradutor.Tradutor("Fase do Oceano", currentLanguage),
      section = RaelHubTradutor.Tradutor("Pular essa fase do oceano", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Pular oceano [Normal]", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Pular oceano [Nightmare]", currentLanguage)
    }

    local Tab_ComedorCarne = {
      name = RaelHubTradutor.Tradutor("Fase jikininkis", currentLanguage),
      section = RaelHubTradutor.Tradutor("Pular essa fase dos jikininkis", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Pular jikininkis [Normal]", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Pular jikininkis [Nightmare]", currentLanguage)
    }

    local Tab_Meat = {
      name = RaelHubTradutor.Tradutor("Fase das Carnes", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Teleportar para zona segura", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Mostrar monstro", currentLanguage),
      section3 = RaelHubTradutor.Tradutor("Teleportar para a sala das carnes", currentLanguage),
      section4 = RaelHubTradutor.Tradutor("Dá as carnes para o monstro", currentLanguage),
      section5 = RaelHubTradutor.Tradutor("Teleportar para a porta final", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Zona segura", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Esp Ashina", currentLanguage),
      button3 = RaelHubTradutor.Tradutor("Tp sala das carnes", currentLanguage),
      button4 = RaelHubTradutor.Tradutor("Entregar Carnes", currentLanguage),
      button5 = RaelHubTradutor.Tradutor("Tp porta final", currentLanguage)
    }

    local Tab_Esqueletos = {
      name = RaelHubTradutor.Tradutor("Fugir esqueletos", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Teleportar para começar a cutscene", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Auto escapar dos esqueletos", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Começar cutscene", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Auto escapar", currentLanguage)
    }

    local Tab_Alavancas = {
      name = RaelHubTradutor.Tradutor("Fase Alavancas", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Teleportar direto para a porta", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Auto acionar alavancas", currentLanguage),
      section3 = RaelHubTradutor.Tradutor("Teleportar para saída", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Entrar na zona", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Auto alavancas", currentLanguage),
      button3 = RaelHubTradutor.Tradutor("Tp saída", currentLanguage)
    }

    local Tab_Engima = {
      name = RaelHubTradutor.Tradutor("Fase do Enigma", currentLanguage),
      section = RaelHubTradutor.Tradutor("Pular essa fase do Enigma", currentLanguage),
      button = RaelHubTradutor.Tradutor("Pular fase", currentLanguage)
    }

    local Tab_Comida = {
      name = RaelHubTradutor.Tradutor("Fase da comida", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Auto fazer o frango", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Auto fazer o presunto", currentLanguage),
      section3 = RaelHubTradutor.Tradutor("Auto fazer Globos oculares", currentLanguage),
      section4 = RaelHubTradutor.Tradutor("Auto fugir do Zuboshi", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Auto frango", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Auto ") .. RaelHubTradutor.Tradutor(" presunto"),
      button3 = RaelHubTradutor.Tradutor("Auto Globos oculares", currentLanguage),
      button4 = RaelHubTradutor.Tradutor("Auto escapar", currentLanguage)
    }

    local Tab_Teiryu = {
      name = RaelHubTradutor.Tradutor("Fase da Teiryu", currentLanguage),
      section = RaelHubTradutor.Tradutor("Auto fugir da Teiryu", currentLanguage),
      button = RaelHubTradutor.Tradutor("Auto escapar", currentLanguage)
    }

    local Tab_Torre = {
      name = RaelHubTradutor.Tradutor("Fase do Ryoshi", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Teleportar para uma área segura", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Teleportar  para o puzzle", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Zona segura", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Tp puzzle", currentLanguage)
    }

    local Tab_Chihiro = {
      name = RaelHubTradutor.Tradutor("Fase da Chihiro", currentLanguage),
      section1 = RaelHubTradutor.Tradutor("Teleportar para zona segura", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Mostrar localização da mamãe", currentLanguage),
      section3 = RaelHubTradutor.Tradutor("Teleportar para Chihiro", currentLanguage),
      section4 = RaelHubTradutor.Tradutor("Teleportar para porta de escapar dessa fase", currentLanguage),
      section5 = RaelHubTradutor.Tradutor("Auto coletar todas as cartas", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Área segura", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Esp mamãe", currentLanguage),
      button3 = RaelHubTradutor.Tradutor("Tp Chihiro", currentLanguage),
      button4 = RaelHubTradutor.Tradutor("Tp porta", currentLanguage),
      button5 = RaelHubTradutor.Tradutor("Auto coletar cartas", currentLanguage)
    }

    local Tab_Boss = {
      section1 = RaelHubTradutor.Tradutor("Auto coletar bola de canhão", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Auto se proteger com o Leizer da Nagisa", currentLanguage),
      section3 = RaelHubTradutor.Tradutor("Melhor área pra matar a Nagisa Serpente", currentLanguage),
      button1 = RaelHubTradutor.Tradutor("Auto coletar munição", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Auto proteger laizer Nagisa", currentLanguage),
      button3 = RaelHubTradutor.Tradutor("Teleportar para zona", currentLanguage)
    }

    local Tab_Others = {
      name = RaelHubTradutor.Tradutor("Outros", currentLanguage),
      section2 = RaelHubTradutor.Tradutor("Auto coletar as moedas", currentLanguage),
      button2 = RaelHubTradutor.Tradutor("Esp moedas", currentLanguage),
      button3 = RaelHubTradutor.Tradutor("Auto coletar moedas", currentLanguage),
    }

    local Tab_Creditos = {
      name = RaelHubTradutor.Tradutor("Créditos", currentLanguage),
      paragrafo = RaelHubTradutor.Tradutor("Entre no meu canal do YouTube e no meu Discord para novas atualizações.", currentLanguage)
    }
    
    

    -- Salvar as traduções para o idioma do jogador
    local updatedConfig = {
        Tab_Oceano = Tab_Oceano,
        Tab_ComedorCarne = Tab_ComedorCarne,
        Tab_Meat = Tab_Meat,
        Tab_Esqueletos = Tab_Esqueletos,
        Tab_Alavancas = Tab_Alavancas,
        Tab_Engima = Tab_Engima,
        Tab_Comida = Tab_Comida,
        Tab_Teiryu = Tab_Teiryu,
        Tab_Torre = Tab_Torre,
        Tab_Chihiro = Tab_Chihiro,
        Tab_Boss = Tab_Boss,
        Tab_Others = Tab_Others,
        Tab_Creditos = Tab_Creditos
    }

    SaveConfig(updatedConfig, currentLanguage)

    screenGui:Destroy()
    return Tab_Oceano, Tab_ComedorCarne, Tab_Meat, Tab_Esqueletos, Tab_Alavancas, Tab_Engima, Tab_Comida, Tab_Teiryu, Tab_Torre, Tab_Chihiro, Tab_Boss, Tab_Others, Tab_Creditos
end

return TranslationModule