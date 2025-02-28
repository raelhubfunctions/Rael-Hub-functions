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
local configFolder = "RaelHub B2C3" -- Pasta onde os arquivos de tradução serão salvos

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
        return savedConfig.Tab_Yurei, savedConfig.Tab_cutscene, savedConfig.Tab_GiveHeart, savedConfig.Tab_Mapmaze, savedConfig.Tab_DodoMeki, savedConfig.Tab_Enzuzai, savedConfig.Tab_HouseUchiumi, savedConfig.Tab_Train, savedConfig.Tab_larvas, savedConfig.Tab_Lama, savedConfig.Tab_HouseYurei, savedConfig.Tab_BossYurei, savedConfig.Tab_FaseFinal, savedConfig.Tab_Others, savedConfig.Tab_Creditos
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end

      local Tab_Yurei = {
        name = RaelHubTradutor.Tradutor("Auto yurei", currentLanguage),
        section = RaelHubTradutor.Tradutor("Auto go to yurei's house", currentLanguage),
        button = RaelHubTradutor.Tradutor("Auto yurei house", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Auto yurei" translation completed', currentLanguage), 5)
      
      local Tab_cutscene = {
        name = RaelHubTradutor.Tradutor("Skip the Cutscene", currentLanguage),
        section = RaelHubTradutor.Tradutor("Skip the Gozu and Mezu cutscene", currentLanguage),
        button = RaelHubTradutor.Tradutor("Skip Gozu and Mezu", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Skip the Cutscene" translation completed', currentLanguage), 5)
      
      local Tab_GiveHeart = {
        name = RaelHubTradutor.Tradutor("Kenio Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Auto get all hearts", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Escape from GrinDemon", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Auto collect hearts", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Escape from GrinDemon", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Kenio Phase" translation completed', currentLanguage), 5)
      
      local Tab_Mapmaze = {
        name = RaelHubTradutor.Tradutor("GrinDemon Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Show GrinDemon's location", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Throw the torch at GrinDemon", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Safe area", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Self make torch", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Light the torch", currentLanguage),
        section6 = RaelHubTradutor.Tradutor("Pass the gate", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Esp GrinDemon", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Aimbot GrinDemon", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Safe zone", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Collect items", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Ignite torch", currentLanguage),
        button6 = RaelHubTradutor.Tradutor("Tp door (Only when you kill Djabo)", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"GrinDemon Phase" translation completed', currentLanguage), 5)
      
      local Tab_DodoMeki = {
        name = RaelHubTradutor.Tradutor("Phase ", currentLanguage) .. " DodoMeki",
        section1 = RaelHubTradutor.Tradutor("Teleport to safe zone", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show DodoMeki location", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Show bell location", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Teleport to the bells", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Teleport to the puzzle door", currentLanguage),
        section6 = RaelHubTradutor.Tradutor("Escape from Dodomeki", currentLanguage),
        anti_dodomeki_section = RaelHubTradutor.Tradutor("Solve the door puzzle automatically", currentLanguage),
        auto_solve_section = RaelHubTradutor.Tradutor("You will not be detected by the dodomeki", currentLanguage),
        toggle = RaelHubTradutor.Tradutor("Esp bells", currentLanguage),
        anti_dodomeki_toggle = RaelHubTradutor.Tradutor("Anti dodomeki detection", currentLanguage),
        anti_dodomeki_description = RaelHubTradutor.Tradutor("This doesn't work when you try to do the door puzzle", currentLanguage),
        auto_solve_toggle = RaelHubTradutor.Tradutor("Auto resolve puzzle", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Safe zone", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp DodoMeki", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport to the Bell", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Teleport puzzle", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Escape from DodoMeki", currentLanguage),
      
        BellDropdownName = RaelHubTradutor.Tradutor("Bells", currentLanguage),
      }
    
      local SinoText = RaelHubTradutor.Tradutor("Bell ", currentLanguage)
    
      for i = 1, 6 do
        Tab_DodoMeki["SinoButton" .. i] = SinoText .. i
      end
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Dodomeki Phase" translation completed', currentLanguage), 5)
      
      local Tab_Enzuzai = {
        name = RaelHubTradutor.Tradutor("Enzukai Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Activate the Enzukai puzzle", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Click on Enzukai automatically", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Activate puzzle", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Immuni Enzukai", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Enzukai Phase" translation completed', currentLanguage), 5)
      
      local Tab_HouseUchiumi = {
        name = RaelHubTradutor.Tradutor("Uchiumi Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to house area", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Teleport to the roof", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Become immune to isamu", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Automatically do the hearts minigame", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Self cleaning the floor", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Teleport home", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Rooftop Teleport", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Immune isamu", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Auto do the minigame", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Auto sweep", currentLanguage),
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Uchiumi Phase" translation completed', currentLanguage), 5)
      
      local Tab_Train = {
        name = RaelHubTradutor.Tradutor("Subway phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Auto escape from the train", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Become immune to the train monster", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Auto run away train", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Immunity to the train monster", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Subway Phase" translation completed', currentLanguage), 5)
      
      local Tab_larvas = {
        name = RaelHubTradutor.Tradutor("Larvae Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Show Boogeyman's location", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Teleport to safe zone", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Auto end this phase", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Esp Boogeyman", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Safe zone", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Auto finish", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Larvae Phase" translation completed', currentLanguage), 5)
      
      local Tab_Lama = {
        name = RaelHubTradutor.Tradutor("Mud phase", currentLanguage),
        section = RaelHubTradutor.Tradutor("Finish this phase", currentLanguage),
        button = RaelHubTradutor.Tradutor("Auto finish", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Mud phase" translation completed', currentLanguage), 5)
      
      local Tab_HouseYurei = {
        name = RaelHubTradutor.Tradutor("Yurei House", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Show all evil statues", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show the location of the houses", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Teleport to houses", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Yurei monster", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Yurei puzzle", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Esp statues", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp houses", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport to Home", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Anti yurei", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Auto solve puzzle", currentLanguage),
        HouseDropdownName = RaelHubTradutor.Tradutor("Houses", currentLanguage),
      }

      for i = 1, 5 do
        Tab_HouseYurei["NameEsp" .. i] = RaelHubTradutor.Tradutor("House " .. i, currentLanguage)
        Tab_HouseYurei["House" .. i] = RaelHubTradutor.Tradutor("House " .. i, currentLanguage)
      end
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Yurei House" translation completed', currentLanguage), 5)
      
      local Tab_BossYurei = {
        name = RaelHubTradutor.Tradutor("Boss Yurei", currentLanguage),
        aimbotyureisection = RaelHubTradutor.Tradutor("Throw katana at yurei", currentLanguage),
        aimbotyureibutton = RaelHubTradutor.Tradutor("Aimbot Yurei", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Katanas", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Cross all the trees", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Become immune to vines", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Fly + aim", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Collect katanas", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Auto equip katanas", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("No clip Árvore", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Immunities to vines", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Fly (recommended speed: 1)", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Boss Yurei" translation completed', currentLanguage), 5)
      
      local Tab_FaseFinal = {
        name = RaelHubTradutor.Tradutor("Final Phase", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Run the Shinigami cutscene", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Shinigami's Auto Pass", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Run cutscene", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Escape Shinigami", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Final Phase" translation completed', currentLanguage), 5)
      
      local Tab_Others = {
        name = RaelHubTradutor.Tradutor("Others", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Increase fps", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Esp", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Auto collect coins", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Go through all the doors", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Illuminates around you", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Fps Boost", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp player", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Esp coins", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Auto collect coins", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("No clip Doors", currentLanguage),
        button6 = RaelHubTradutor.Tradutor("FullBright", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Others" translation completed', currentLanguage), 5)
      
      local Tab_Creditos = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        section = RaelHubTradutor.Tradutor("Script creator", currentLanguage),
        descricao = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates", currentLanguage),
        ContentNotify = RaelHubTradutor.Tradutor("The script has been copied to the desktop", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Credits" translation completed', currentLanguage), 5)
      
      -- Salvar as traduções para o idioma do jogador
      local updatedConfig = {
        Tab_Yurei = Tab_Yurei,
        Tab_cutscene = Tab_cutscene,
        Tab_GiveHeart = Tab_GiveHeart,
        Tab_Mapmaze = Tab_Mapmaze,
        Tab_DodoMeki = Tab_DodoMeki,
        Tab_Enzuzai = Tab_Enzuzai,
        Tab_HouseUchiumi = Tab_HouseUchiumi,
        Tab_Train = Tab_Train,
        Tab_larvas = Tab_larvas,
        Tab_Lama = Tab_Lama,
        Tab_HouseYurei = Tab_HouseYurei,
        Tab_BossYurei = Tab_BossYurei,
        Tab_FaseFinal = Tab_FaseFinal,
        Tab_Others = Tab_Others,
        Tab_Creditos = Tab_Creditos
      }
      
      SaveConfig(updatedConfig, currentLanguage)
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Yurei, Tab_cutscene, Tab_GiveHeart, Tab_Mapmaze, Tab_DodoMeki, Tab_Enzuzai, Tab_HouseUchiumi, Tab_Train, Tab_larvas, Tab_Lama, Tab_HouseYurei, Tab_BossYurei, Tab_FaseFinal, Tab_Others, Tab_Creditos
      
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Tab_Yurei = {
        name = "Auto yurei",
        section = "Auto go to yurei's house",
        button = "Auto yurei house"
      }
      
      local Tab_cutscene = {
        name = "Skip the Cutscene",
        section = "Skip the Gozu and Mezu cutscene",
        button = "Skip Gozu and Mezu"
      }

      local Tab_GiveHeart = {
        name = "Kenio Phase",
        section1 = "Auto get all hearts",
        section2 = "Escape from GrinDemon",
        button1 = "Auto collect hearts",
        button2 = "Escape from GrinDemon"
      }

      local Tab_Mapmaze = {
        name = "GrinDemon Phase",
        section1 = "Show GrinDemon's location",
        section2 = "Throw the torch at GrinDemon",
        section3 = "Safe area",
        section4 = "Self make torch",
        section5 = "Light the torch",
        section6 = "Pass the gate",
        button1 = "Esp GrinDemon",
        button2 = "Aimbot GrinDemon",
        button3 = "Safe zone",
        button4 = "Collect items",
        button5 = "Ignite torch",
        button6 = "Tp door (Only when you kill Djabo)"
      }
      
      local Tab_DodoMeki = {
        name = "Phase DodoMeki",
        section1 = "Teleport to safe zone",
        section2 = "Show DodoMeki location",
        section3 = "Show bell location",
        section4 = "Teleport to the bells",
        section5 = "Teleport to the puzzle door",
        anti_dodomeki_section = "Solve the door puzzle automatically",
        auto_solve_section = "You will not be detected by the dodomeki",
        toggle = "Esp bells",
        anti_dodomeki_toggle = "Anti dodomeki detection",
        anti_dodomeki_description = "This doesn't work when you try to do the door puzzle",
        auto_solve_toggle = "Auto resolve puzzle",
        button1 = "Safe zone",
        button2 = "Esp DodoMeki",
        button3 = "Teleport to the Bell",
        button4 = "Teleport puzzle",
        button5 = "Escape from DodoMeki",
        BellDropdownName = "Bells"
      }

      local SinoText = "Bell "

      for i = 1, 6 do
        Tab_DodoMeki["SinoButton" .. i] = SinoText .. i
      end

      local Tab_Enzuzai = {
        name = "Enzukai Phase",
        section1 = "Activate the Enzukai puzzle",
        section2 = "Click on Enzukai automatically",
        button1 = "Activate puzzle",
        button2 = "Immuni Enzukai"
      }

      local Tab_HouseUchiumi = {
        name = "Uchiumi Phase",
        section1 = "Teleport to house area",
        section2 = "Teleport to the roof",
        section3 = "Become immune to isamu",
        section4 = "Automatically do the hearts minigame",
        section5 = "Self cleaning the floor",
        button1 = "Teleport home",
        button2 = "Rooftop Teleport",
        button3 = "Immune isamu",
        button4 = "Auto do the minigame",
        button5 = "Auto sweep"
      }
      
      local Tab_Train = {
        name = "Subway phase",
        section1 = "Auto escape from the train",
        section2 = "Become immune to the train monster",
        button1 = "Auto run away train",
        button2 = "Immunity to the train monster"
      }

      local Tab_larvas = {
        name = "Larvae Phase",
        section1 = "Show Boogeyman's location",
        section2 = "Teleport to safe zone",
        section3 = "Auto end this phase",
        button1 = "Esp Boogeyman",
        button2 = "Safe zone",
        button3 = "Auto finish"
      }

      local Tab_Lama = {
        name = "Mud phase",
        section = "Finish this phase",
        button = "Auto finish"
      }

      local Tab_HouseYurei = {
        name = "Yurei House",
        section1 = "Show all evil statues",
        section2 = "Show the location of the houses",
        section3 = "Teleport to houses",
        section4 = "Yurei monster",
        section5 = "Yurei puzzle",
        button1 = "Esp statues",
        button2 = "Esp houses",
        button3 = "Teleport to Home",
        button4 = "Anti yurei",
        button5 = "Auto solve puzzle",
        HouseDropdownName = "Houses"
      }

      for i = 1, 5 do
        Tab_HouseYurei["NameEsp" .. i] = "House " .. i
        Tab_HouseYurei["House" .. i] = "House " .. i
      end

      local Tab_BossYurei = {
        name = "Boss Yurei",
        aimbotyureisection = "Throw katana at yurei",
        aimbotyureibutton = "Aimbot Yurei",
        section1 = "Katanas",
        section2 = "Cross all the trees",
        section3 = "Become immune to vines",
        section4 = "Fly + aim",
        button1 = "Collect katanas",
        button2 = "Auto equip katanas",
        button3 = "No clip Árvore",
        button4 = "Immunities to vines",
        button5 = "Fly (recommended speed: 1)"
      }

      local Tab_FaseFinal = {
        name = "Final Phase",
        section1 = "Run the Shinigami cutscene",
        section2 = "Shinigami's Auto Pass",
        button1 = "Run cutscene",
        button2 = "Escape Shinigami"
      }

      local Tab_Others = {
        name = "Others",
        section1 = "Increase fps",
        section2 = "Esp",
        section3 = "Auto collect coins",
        section4 = "Go through all the doors",
        section5 = "Illuminates around you",
        button1 = "Fps Boost",
        button2 = "Esp player",
        button3 = "Esp coins",
        button4 = "Auto collect coins",
        button5 = "No clip Doors",
        button6 = "FullBright"
      }

      local Tab_Creditos = {
        name = "Credits",
        section = "Script creator",
        descricao = "Join my YouTube channel and Discord for new updates",
        ContentNotify = "The script has been copied to the desktop"
      }
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Yurei, Tab_cutscene, Tab_GiveHeart, Tab_Mapmaze, Tab_DodoMeki, Tab_Enzuzai, Tab_HouseUchiumi, Tab_Train, Tab_larvas, Tab_Lama, Tab_HouseYurei, Tab_BossYurei, Tab_FaseFinal, Tab_Others, Tab_Creditos
      
    end
end

return TranslationModule