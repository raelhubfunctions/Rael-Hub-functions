function RaelHubLoadScreenGui(textvalue)
  local player = game.Players.LocalPlayer
  local playerGui = player:WaitForChild("PlayerGui")

  -- Cria a tela de carregamento
  getgenv().RaelHubScreenGuiLoad = Instance.new("ScreenGui")
  getgenv().RaelHubScreenGuiLoad.Parent = playerGui

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
local configFolder = "RaelHub fisch" -- Pasta onde os arquivos de tradução serão salvos

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
        return savedConfig.Main, savedConfig.Quest, savedConfig.Eventos, savedConfig.Teleports, savedConfig.Jogador, savedConfig.Mostrar, savedConfig.Creditos
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end

      local Main = {
        name = RaelHubTradutor.Tradutor("Main", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to fishing area", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Auto catch the fish", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Stay with infinite oxygen", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Don't be afk", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Auto do the treasure map", currentLanguage),
        section6 = RaelHubTradutor.Tradutor("Fish sale", currentLanguage),
        section7 = RaelHubTradutor.Tradutor("Auto sell fish", currentLanguage),
        section8 = RaelHubTradutor.Tradutor("Crab cage Features", currentLanguage),
        dropdown1 = RaelHubTradutor.Tradutor("Teleporte Area", currentLanguage),
        dropdown2 = RaelHubTradutor.Tradutor("Fishs", currentLanguage),
        toggle1 = RaelHubTradutor.Tradutor("Auto", currentLanguage) .. " " .. RaelHubTradutor.Tradutor("fisch", currentLanguage),
        toggle2 = RaelHubTradutor.Tradutor("Infinite Oxygen", currentLanguage),
        toggle3 = RaelHubTradutor.Tradutor("Anti Afk", currentLanguage),
        toggle4 = RaelHubTradutor.Tradutor("Auto treasure", currentLanguage),
        toggle5 = RaelHubTradutor.Tradutor("Sell fisch automatically", currentLanguage),
        toggle6 = RaelHubTradutor.Tradutor("Auto buy crab cage", currentLanguage),
        toggle7 = RaelHubTradutor.Tradutor("Auto collect crab cage", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Sell the selected fish", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Sell all fish", currentLanguage),
        slide1 = RaelHubTradutor.Tradutor("Delay in selling", currentLanguage),
        slide2 = RaelHubTradutor.Tradutor("Quantity of Crab cage", currentLanguage)
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Main" translation completed', currentLanguage), 5)
      local Quest = {
        name = RaelHubTradutor.Tradutor("Quest", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Automatically buy the trident rod", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("The rod of depths", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Auto", currentLanguage) .. " " .. RaelHubTradutor.Tradutor("trident", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Teleportar para a porta", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Teleport to the abissal", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Teleport to the hexed", currentLanguage),
        button5 = RaelHubTradutor.Tradutor("Teleport to the rod depths", currentLanguage)
        
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Quest" translation completed', currentLanguage), 5)
      local Eventos = {
        name = RaelHubTradutor.Tradutor("Events", currentLanguage),
        section = RaelHubTradutor.Tradutor("Megalodon features", currentLanguage),
        button = RaelHubTradutor.Tradutor("Teleport to the megalodon", currentLanguage),
        toggle1 = RaelHubTradutor.Tradutor("Teleport to the megalodon with the boat", currentLanguage),
        toggle2 = RaelHubTradutor.Tradutor("Esp megalodon", currentLanguage),
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Eventos" translation completed', currentLanguage), 5)
      local Teleports = {
        name = RaelHubTradutor.Tradutor("Teleports", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to the islands", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Teleport to the npcs", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Teleport to the itens", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Teleport to the rods", currentLanguage),
        dropdown1 = RaelHubTradutor.Tradutor("islands", currentLanguage),
        dropdown2 = RaelHubTradutor.Tradutor("npcs", currentLanguage),
        dropdown3 = RaelHubTradutor.Tradutor("itens", currentLanguage),
        dropdown4 = RaelHubTradutor.Tradutor("rods", currentLanguage),
        button = RaelHubTradutor.Tradutor("Teleport player", currentLanguage),
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Teleports" translation completed', currentLanguage), 5)
      local Jogador = {
        name = RaelHubTradutor.Tradutor("Player", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to players", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Remove all textures from the area", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Player Speed", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Pass through objects", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Light up the map", currentLanguage),
        section6 = RaelHubTradutor.Tradutor("Do you walk on water", currentLanguage),
        dropdowntext = RaelHubTradutor.Tradutor("Players: ", currentLanguage),
        slidetext = RaelHubTradutor.Tradutor("Speed: ", currentLanguage),
        button = RaelHubTradutor.Tradutor("Teleport to player", currentLanguage),
        textureButton = RaelHubTradutor.Tradutor("Remove textures", currentLanguage),
        toggle1 = RaelHubTradutor.Tradutor("Ativar velocidade", currentLanguage),
        toggle2 = RaelHubTradutor.Tradutor("Walking On Water", currentLanguage)
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Player" translation completed', currentLanguage), 5)
      local Mostrar = {
        name = "Esp",
        section1 = RaelHubTradutor.Tradutor("Show objects", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show the monsters", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Show players", currentLanguage),
        toggle1 = "Esp " .. RaelHubTradutor.Tradutor(" object ", currentLanguage),
        toggle2 = "Esp " .. RaelHubTradutor.Tradutor(" monster ", currentLanguage),
        toggle3 = "Esp " .. RaelHubTradutor.Tradutor(" players ", currentLanguage)
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Show" translation completed', currentLanguage), 5)
      local Creditos = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        section = RaelHubTradutor.Tradutor("Script creator", currentLanguage),
        descricao = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates", currentLanguage),
        ContentNotify = RaelHubTradutor.Tradutor("The script has been copied to the desktop", currentLanguage)
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Credits" translation completed', currentLanguage), 5)
      -- Salvar as traduções para o idioma do jogador
      local updatedConfig = {
        Main = Main,
        Quest = Quest,
        Eventos = Eventos,
        Teleports = Teleports,
        Jogador = Jogador,
        Mostrar = Mostrar,
        Creditos = Creditos
      }

      SaveConfig(updatedConfig, currentLanguage)
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Main, Quest, Eventos, Teleports, Jogador, Mostrar, Creditos
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Main = {
        name = "Main",
        section1 = "Teleport to fishing area",
        section2 = "Auto catch the fish",
        section3 = "Stay with infinite oxygen",
        section4 = "Don't be afk",
        section5 = "Auto do the treasure map",
        section6 = "Fish sale",
        section7 = "Auto sell fish",
        section8 = "Crab cage Features",
        dropdown1 = "Teleporte Area",
        dropdown2 = "Fishs",
        toggle1 = "Auto fisch",
        toggle2 = "Infinite Oxygen",
        toggle3 = "Anti Afk",
        toggle4 = "Auto treasure",
        toggle5 = "Auto sell",
        toggle6 = "Auto buy crab cage",
        toggle7 = "Auto collect crab cage",
        button1 = "Sell the selected fish",
        button2 = "Sell all fish",
        slide1 = "Delay in selling",
        slide2 = "Quantity of Crab cage"
      }
      local Quest = {
        name = "Quest",
        section1 = "Automatically buy the trident rod",
        section2 = "The rod of depths",
        button1 = "Auto trident",
        button2 = "Teleportar para a porta",
        button3 = "Teleport to the abissal",
        button4 = "Teleport to the hexed",
        button5 = "Teleport to the rod depths"
      }
      local Eventos = {
        name = "Events",
        section = "Megalodon features",
        button = "Teleport to the megalodon",
        toggle1 = "Teleport to the megalodon with the boat",
        toggle2 = "Esp megalodon"
      }
      local Teleports = {
        name = "Teleports",
        section1 = "Teleport to the islands",
        section2 = "Teleport to the npcs",
        section3 = "Teleport to the itens",
        section4 = "Teleport to the rods",
        dropdown1 = "islands",
        dropdown2 = "npcs",
        dropdown3 = "itens",
        dropdown4 = "rods",
        button = "Teleport player",
      }
      local Jogador = {
        name = "Player",
        section1 = "Teleport to players",
        section2 = "Remove all textures from the area",
        section3 = "Player Speed",
        section4 = "Pass through objects",
        section5 = "Light up the map",
        section6 = "Do you walk on water",
        dropdowntext = "Players: ",
        slidetext = "Speed: ",
        button = "Teleport to player",
        textureButton = "Remove textures",
        toggle1 = "Activate speed",
        toggle2 = "Walking On Water"
      }

      local Mostrar = {
        name = "Esp",
        section1 = "Show objects",
        section2 = "Show the monsters",
        section3 = "Show players",
        toggle1 = "Esp object ",
        toggle2 = "Esp monster ",
        toggle3 = "Esp players "
      }

      local Creditos = {
        name = "Credits",
        section = "Script creator",
        descricao = "Join my YouTube channel and Discord for new updates",
        ContentNotify = "The script has been copied to the desktop"
      }

      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Main, Quest, Eventos, Teleports, Jogador, Mostrar, Creditos
      
    end
end

return TranslationModule