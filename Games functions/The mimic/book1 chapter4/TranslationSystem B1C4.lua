function RaelHubLoadScreenGui(textvalue)
  local player = game.Players.LocalPlayer
  local playerGui = player:WaitForChild("PlayerGui")

  -- Cria a tela de carregamento
  getgenv().RaelHubScreenGuiLoad = Instance.new("ScreenGui")
  getgenv().RaelHubScreenGuiLoad.Name = "HB20"
  getgenv().RaelHubScreenGuiLoad.Parent = playerGui
  getgenv().RaelHubScreenGuiLoad.ResetOnSpawn = false
  
  -- Imagem de fundo (opcional)
  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Size = UDim2.new(0.7, 0, 0.6, 0)
  imageLabel.Position = UDim2.new(0.15, 0, 0.2, 0)
  imageLabel.Image = "rbxassetid://18665679839"
  imageLabel.BackgroundTransparency = 1
  imageLabel.ScaleType = Enum.ScaleType.Stretch
  imageLabel.Parent = getgenv().RaelHubScreenGuiLoad

  -- Cria o TextLabel
  local title = Instance.new("TextLabel")
  title.Size = UDim2.new(0.6, 0, 0.1, 0)
  title.AnchorPoint = Vector2.new(0.5, 0.5)
  title.Position = UDim2.new(0.5, 0, 0.5, 0) -- Posição centralizada
  title.BackgroundTransparency = 1
  title.Text = textvalue
  title.TextColor3 = Color3.fromRGB(16, 235, 138) -- Cor do texto
  title.Font = Enum.Font.ArialBold
  title.TextScaled = true
  title.TextTransparency = 1 -- Começa invisível
  title.Parent = getgenv().RaelHubScreenGuiLoad



  -- Função para fazer o fade in
  local function fadeInText(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
        object.TextTransparency = 1 - i
        task.wait(increment)
    end
  end

  -- Função para fazer o fade out
  local function fadeOutText(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
        object.TextTransparency = i
        task.wait(increment)
    end
  end

  local function fadeInImage(duration, object)
    local increment = 0.05
    local step = increment / duration
    task.spawn(function()
      for i = 0, 1, step do
        object.ImageTransparency = 1 - i
        task.wait(increment)
      end
    end)
  end


  local function fadeOutImage(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
      object.ImageTransparency = i
      task.wait(increment)
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
  startSound.Parent = getgenv().RaelHubScreenGuiLoad
  startSound:Play()

  -- Exemplo de uso
  fadeInText(0.5, title) -- Faz o texto aparecer
  task.wait(2)
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
  loadingIcon.Parent = getgenv().RaelHubScreenGuiLoad

  fadeInImage(0.5, loadingIcon)

  -- Inicia a rotação do ícone de carregamento
  spawn(function()
    rotateIcon(loadingIcon)
  end)
end

local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()

if getgenv and getgenv().RaelHubAutoTranslator == nil then
  getgenv().RaelHubAutoTranslator = true
  warn("RaelHubAutoTranslator was created and set to true.")
else
  warn("RaelHubAutoTranslator already exists, keeping the current value.")
end

if getgenv().RaelHubAutoTranslator then
  local RaelHubText1 = RaelHubTradutor.Tradutor("THANK YOU FOR USING RAEL HUB")
  RaelHubLoadScreenGui(RaelHubText1)
elseif getgenv().RaelHubAutoTranslator == false then
  local RaelHubText1 = "THANK YOU FOR USING RAEL HUB"
  RaelHubLoadScreenGui(RaelHubText1)
end

local TranslationModule = {}
local configFolder = "RaelHub B1C4" -- Pasta onde os arquivos de tradução serão salvos

-- Serviço de localização do Roblox
local LocalizationService = game:GetService("LocalizationService")

-- Função para detectar o idioma do jogador usando LocalizationService
local function GetPlayerLanguage()
    local result, code = pcall(function()
        return LocalizationService.RobloxLocaleId
    end)
    if result then
        return code:sub(1, 2)
    else
        return "en"
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
    
    if getgenv().RaelHubAutoTranslator then
      local NotificationManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20notification%20system/script.lua"))()

      local notification = NotificationManager.new()
      -- Se as traduções já existem para o idioma atual, carregar
      if savedConfig then
        task.wait(1)
          getgenv().RaelHubScreenGuiLoad:Destroy()
        return savedConfig.Tradution_Main, savedConfig.Translation_Player, savedConfig.Translation_Esp, Translation_Credit
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end

      local Translation_Main = {
        name = RaelHubTradutor.Tradutor("Main", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to part 4 (singleplayer)", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Automatically win this part", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Katana configuration", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Saigomo's heart", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Saigomo Boss features", currentLanguage),
        
        
        button1 = RaelHubTradutor.Tradutor("Teleport to part 4", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Auto win", currentLanguage),
        
        
        toggle1 = RaelHubTradutor.Tradutor("Auto click katana", currentLanguage),
        toggle2 = RaelHubTradutor.Tradutor("Auto equip katana", currentLanguage),
        toggle3 = RaelHubTradutor.Tradutor("Auto destroy saigomo's hearts", currentLanguage),
        toggle4 = RaelHubTradutor.Tradutor("Auto kill saigomo simple", currentLanguage),
        toggle5 = RaelHubTradutor.Tradutor("Recover life", currentLanguage),
        
        description1 = RaelHubTradutor.Tradutor("Activate this in cutscenes or before cutscenes.", currentLanguage)
        
        
      }
      
      
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Main" translation completed', currentLanguage), 5)
      
      
      
      local Translation_Player = {
        
        
        name = RaelHubTradutor.Tradutor("Player", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to players", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Player speed", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Light up your surroundings", currentLanguage),
        
        
        button1 = RaelHubTradutor.Tradutor("Teleport to player", currentLanguage),
        
        toggle1 = RaelHubTradutor.Tradutor("Enable Speed", currentLanguage),
        toggle2 = RaelHubTradutor.Tradutor("Fullbright", currentLanguage),
        
        dropdowntext1 = RaelHubTradutor.Tradutor("Player", currentLanguage),
        
        slidertext = RaelHubTradutor.Tradutor("Speed", currentLanguage),
        
        
      }
      
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Player" translation completed', currentLanguage), 5)
      
      
      
      local Translation_Esp = {
        
        
        toggle1 = RaelHubTradutor.Tradutor("ESP Players", currentLanguage),
        toggle2 = RaelHubTradutor.Tradutor("ESP Monsters", currentLanguage),
        toggle3 = RaelHubTradutor.Tradutor("ESP Objects", currentLanguage)
        
        
      }
      
      shared.TranslationNamesEsps = {
        
        RaelHubTradutor.Tradutor("Key", currentLanguage),
        RaelHubTradutor.Tradutor("Crowbar", currentLanguage),
        RaelHubTradutor.Tradutor("Armor", currentLanguage),
        
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Esp" translation completed', currentLanguage), 5)
      
      
      local Translation_Credit = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        paragraph = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates.", currentLanguage)
      }
      
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Credits" translation completed', currentLanguage), 5)
      
      
      local updatedConfig = {
        Translation_Main = Translation_Main,
        Translation_Player = Translation_Player,
        Translation_Esp = Translation_Esp,
        Translation_Credit = Translation_Credit
      }
      
      
      
      SaveConfig(updatedConfig, currentLanguage)
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Translation_Main, Translation_Player, Translation_Esp, Translation_Credit
      
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Translation_Main = {
        name = "Main",
        section1 = "Teleport to part 4 (singleplayer)",
        section2 = "Automatically win this part",
        section3 = "Katana configuration",
        section4 = "Saigomo's heart",
        section5 = "Saigomo Boss features",
        
        button1 = "Teleport to part 4",
        button2 = "Auto win",
        
        toggle1 = "Auto click katana",
        toggle2 = "Auto equip katana",
        toggle3 = "Auto destroy saigomo's hearts",
        toggle4 = "Auto kill saigomo simple",
        toggle5 = "Recover life",
        
        description1 = "Activate this in cutscenes or before cutscenes."
      }
      
      
      local Translation_Player = {
        name = "Player",
        section1 = "Teleport to players",
        section2 = "Player speed",
        section3 = "Light up your surroundings",
        
        button1 = "Teleport to player",
        
        toggle1 = "Enable Speed",
        toggle2 = "Fullbright",
        
        dropdowntext1 = "Player",
        
        slidertext = "Speed"
      }
      
      local Translation_Esp = {
        toggle1 = "ESP Players",
        toggle2 = "ESP Monsters",
        toggle3 = "ESP Objects"
      }

      shared.TranslationNamesEsps = {
        "Key",
        "Crowbar",
        "Armor"
      }
      
      local Translation_Credit = {
        name = "Credits",
        paragraph = "Join my YouTube channel and Discord for new updates."
      }
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Translation_Main, Translation_Player, Translation_Esp, Translation_Credit
      
    end
end

return TranslationModule
