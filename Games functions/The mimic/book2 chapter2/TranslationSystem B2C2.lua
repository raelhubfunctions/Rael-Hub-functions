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
local configFolder = "RaelHub B2C2" -- Pasta onde os arquivos de tradução serão salvos

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
        return savedConfig.Tab_Oceano, savedConfig.Tab_ComedorCarne, savedConfig.Tab_Meat, savedConfig.Tab_Esqueletos, savedConfig.Tab_Alavancas, savedConfig.Tab_Engima, savedConfig.Tab_Comida, savedConfig.Tab_Teiryu, savedConfig.Tab_Torre, savedConfig.Tab_Chihiro, savedConfig.Tab_Boss, savedConfig.Tab_Others, savedConfig.Tab_Creditos
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end

      local Tab_Oceano = {
        name = RaelHubTradutor.Tradutor("Ocean Phase", currentLanguage),
        section = RaelHubTradutor.Tradutor("Skip this ocean stage", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Skip Ocean [Normal]", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Skip Ocean [Nightmare]", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Ocean Phase" translation completed', currentLanguage), 5)
      
      local Tab_ComedorCarne = {
        name = RaelHubTradutor.Tradutor("Jikininkis Phase", currentLanguage),
        section = RaelHubTradutor.Tradutor("Skip this jikininkis phase", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Skip jikininkis [Normal]", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Skip jikininkis [Nightmare]", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Jikininkis Phase" translation completed', currentLanguage), 5)
      
      local Tab_Meat = {
        name = RaelHubTradutor.Tradutor("Meat Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to safe zone", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show monster", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Teleport to the meat room", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Give the meat to the monster", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Teleport to the final door", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Safe zone", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp Ashina", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport meat room", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Deliver Meats", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Teleport final door", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Meat Phase" translation completed', currentLanguage), 5)
      
      local Tab_Esqueletos = {
        name = RaelHubTradutor.Tradutor("Escape skeletons", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to start cutscene", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Auto escape from skeletons", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Start cutscene", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Auto escape", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Escape skeletons" translation completed', currentLanguage), 5)
      
      local Tab_Alavancas = {
        name = RaelHubTradutor.Tradutor("Levers Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport straight to the door", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Auto actuate levers", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Teleport to exit", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Enter the zone", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Auto levers", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport to exit", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Levers Phase" translation completed', currentLanguage), 5)
      
      local Tab_Engima = {
        name = RaelHubTradutor.Tradutor("Enigma Phase", currentLanguage),
        section = RaelHubTradutor.Tradutor("Skip this stage of the Enigma", currentLanguage),
        button = RaelHubTradutor.Tradutor("Skip Phase", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Enigma Phase" translation completed', currentLanguage), 5)
      
      local Tab_Comida = {
        name = RaelHubTradutor.Tradutor("Food Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Make the meals (working 🥲)", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Auto escape from Zuboshi", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Make chicken automatically", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Making ham automatically"),
        button3 = RaelHubTradutor.Tradutor("Make eyeballs automatically", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Escape from the monster automatically", currentLanguage),
        dropdownstove = RaelHubTradutor.Tradutor("Choosing a stove", currentLanguage),
        dropdowncountertop = RaelHubTradutor.Tradutor("Choose countertop", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Food Phase" translation completed', currentLanguage), 5)
      
      local Tab_Teiryu = {
        name = RaelHubTradutor.Tradutor("Teiryu Phase", currentLanguage),
        section = RaelHubTradutor.Tradutor("Escape from Teiryu automatically ", currentLanguage),
        button = RaelHubTradutor.Tradutor("Automatic escape", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Teiryu Phase" translation completed', currentLanguage), 5)
      
      local Tab_Torre = {
        name = RaelHubTradutor.Tradutor("Ryoshi Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to a safe area", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Teleport to the puzzle", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Safe zone", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Teleport to puzzle", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Ryoshi Phase" translation completed', currentLanguage), 5)
      
      local Tab_Chihiro = {
        name = RaelHubTradutor.Tradutor("Chihiro Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to safe zone", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show Mom's Location", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Teleport to Chihiro", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Teleport to the door to escape this phase", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Auto collect all cards", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Safe area", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp mommy", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport to Chihiro", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Teleport to door", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Auto collect letters", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Chihiro Phase" translation completed', currentLanguage), 5)
      
      local Tab_Boss = {
        section1 = RaelHubTradutor.Tradutor("Auto collect cannon ball", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Become immune to Nagisa's laser", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Best area to kill Nagisa Serpente", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Auto collect ammo", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Anti Nagisa Leizer", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport to zone", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Boss fight" translation completed', currentLanguage), 5)
      
      local Tab_Others = {
        name = RaelHubTradutor.Tradutor("Others", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Auto collect coins", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp coins", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Auto collect coins", currentLanguage),
      }

      notification:createNotification(RaelHubTradutor.Tradutor('"Others" translation completed', currentLanguage), 5)
      
      local Tab_Creditos = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        paragrafo = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates.", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Others" translation completed', currentLanguage), 5)

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
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Oceano, Tab_ComedorCarne, Tab_Meat, Tab_Esqueletos, Tab_Alavancas, Tab_Engima, Tab_Comida, Tab_Teiryu, Tab_Torre, Tab_Chihiro, Tab_Boss, Tab_Others, Tab_Creditos
      
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Tab_Oceano = {
        name = "Ocean Phase",
        section = "Skip this ocean stage",
        button1 = "Skip Ocean [Normal]",
        button2 = "Skip Ocean [Nightmare]"
      }

      local Tab_ComedorCarne = {
        name = "Jikininkis Phase",
        section = "Skip this jikininkis phase",
        button1 = "Skip jikininkis [Normal]",
        button2 = "Skip jikininkis [Nightmare]"
      }
      
      local Tab_Meat = {
        name = "Meat Phase",
        section1 = "Teleport to safe zone",
        section2 = "Show monster",
        section3 = "Teleport to the meat room",
        section4 = "Give the meat to the monster",
        section5 = "Teleport to the final door",
        button1 = "Safe zone",
        button2 = "Esp Ashina",
        button3 = "Teleport meat room",
        button4 = "Deliver Meats",
        button5 = "Teleport final door"
      }
      
      local Tab_Esqueletos = {
        name = "Escape skeletons",
        section1 = "Teleport to start cutscene",
        section2 = "Auto escape from skeletons",
        button1 = "Start cutscene",
        button2 = "Auto escape"
      }
      
      local Tab_Alavancas = {
        name = "Levers Phase",
        section1 = "Teleport straight to the door",
        section2 = "Auto actuate levers",
        section3 = "Teleport to exit",
        button1 = "Enter the zone",
        button2 = "Auto levers",
        button3 = "Teleport to exit"
      }
      
      local Tab_Engima = {
        name = "Enigma Phase",
        section = "Skip this stage of the Enigma",
        button = "Skip Phase"
      }
      
      local Tab_Comida = {
        name = "Food Phase",
        section1 = "Make the meals",
        section4 = "Auto escape from Zuboshi",
        button1 = "Make chicken automatically",
        button2 = "Making ham automatically",
        button3 = "Make eyeballs automatically",
        button4 = "Escape from the monster automatically",
        dropdownstove = "Choosing a stove",
        dropdowncountertop = "Choose countertop"
      }
      
      local Tab_Teiryu = {
        name = "Teiryu Phase",
        section = "Escape from Teiryu automatically",
        button = "Automatic escape"
      }
      
      local Tab_Torre = {
        name = "Ryoshi Phase",
        section1 = "Teleport to a safe area",
        section2 = "Teleport to the puzzle",
        button1 = "Safe zone",
        button2 = "Teleport to puzzle"
      }
      
      local Tab_Chihiro = {
        name = "Chihiro's Phase",
        section1 = "Teleport to safe zone",
        section2 = "Show Mom's Location",
        section3 = "Teleport to Chihiro",
        section4 = "Teleport to the door to escape this phase",
        section5 = "Auto collect all cards",
        button1 = "Safe area",
        button2 = "Esp mommy",
        button3 = "Teleport to Chihiro",
        button4 = "Teleport to door",
        button5 = "Auto collect letters"
      }
      
      local Tab_Boss = {
        section1 = "Auto collect cannon ball",
        section2 = "Become immune to Nagisa's laser",
        section3 = "Best area to kill Nagisa Serpente",
        button1 = "Auto collect ammo",
        button2 = "Anti Nagisa Leizer",
        button3 = "Teleport to zone"
      }
      
      local Tab_Others = {
        name = "Others",
        section2 = "Auto collect coins",
        button2 = "Esp coins",
        button3 = "Auto collect coins"
      }
      
      local Tab_Creditos = {
        name = "Credits",
        paragrafo = "Join my YouTube channel and Discord for new updates."
      }
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Oceano, Tab_ComedorCarne, Tab_Meat, Tab_Esqueletos, Tab_Alavancas, Tab_Engima, Tab_Comida, Tab_Teiryu, Tab_Torre, Tab_Chihiro, Tab_Boss, Tab_Others, Tab_Creditos
      
    end
end

return TranslationModule