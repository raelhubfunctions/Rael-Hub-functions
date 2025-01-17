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
local configFolder = "RaelHub Christmas trials" -- Pasta onde os arquivos de tradução serão salvos

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
        return savedConfig.Tab_Talk_elf, savedConfig.Tab_Fix_sledding, savedConfig.Tab_Collect_toys, savedConfig.Tab_Get_key, savedConfig.Tab_Player, savedConfig.Tab_Esp, savedConfig.Tab_Creditos
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end
      
      local Tab_Talk_elf = {
        name = RaelHubTradutor.Tradutor("Talk to the elf", currentLanguage),
        section = RaelHubTradutor.Tradutor("Talk to the elf", currentLanguage),
        button = RaelHubTradutor.Tradutor("To speak", currentLanguage),
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Talk elf" translation completed', currentLanguage), 5)
      
      local Tab_Fix_sledding = {
      
        name = RaelHubTradutor.Tradutor("Fix the sled", currentLanguage),
        section = RaelHubTradutor.Tradutor("Auto repairs Santa's sleigh", currentLanguage),
        button = RaelHubTradutor.Tradutor("Self repair", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Fix sledding" translation completed', currentLanguage), 5)
      
      local Tab_Collect_toys = {
        name = RaelHubTradutor.Tradutor("Collect toys", currentLanguage),
        section = RaelHubTradutor.Tradutor("Auto collect toys", currentLanguage),
        button = RaelHubTradutor.Tradutor("Self collect", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Collect toys" translation completed', currentLanguage), 5)
      
      local Tab_Get_key = {
        name = RaelHubTradutor.Tradutor("Auto pick up key", currentLanguage),
        section = RaelHubTradutor.Tradutor("Auto collect the key", currentLanguage),
        button = RaelHubTradutor.Tradutor("Self collect", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Get key" translation completed', currentLanguage), 5)
      
      local Tab_Player = {
        name = RaelHubTradutor.Tradutor("Players", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to players", currentLanguage),
        section2 = RaelHubTradutor.Tradutor( "Player speed", currentLanguage),
        section3 = RaelHubTradutor.Tradutor( "Light up your surroundings", currentLanguage),
        AddDropdownName = RaelHubTradutor.Tradutor("List of players: ", currentLanguage),
        AddSliderName = RaelHubTradutor.Tradutor("Speed", currentLanguage),
        button = RaelHubTradutor.Tradutor("Teleport player", currentLanguage),
        toggle = RaelHubTradutor.Tradutor("Fullbright", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Player" translation completed', currentLanguage), 5)
      
      local Tab_Esp = {
        name = RaelHubTradutor.Tradutor("Esp", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Show players location", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Show item locations for sled", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Show location of toys", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Show monster location", currentLanguage),
        button1 = RaelHubTradutor.Tradutor("Esp players", currentLanguage),
        button2 = RaelHubTradutor.Tradutor("Esp itens", currentLanguage),
        button3 = RaelHubTradutor.Tradutor("Esp toys", currentLanguage),
        button4 = RaelHubTradutor.Tradutor("Esp monster", currentLanguage),
        ObjectName = RaelHubTradutor.Tradutor("Toy", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Esp" translation completed', currentLanguage), 5)
    
      local Tab_Creditos = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        paragrafo = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates.", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Credits" translation completed', currentLanguage), 5)
      -- Salvar as traduções para o idioma do jogador
      local updatedConfig = {
        Tab_Talk_elf = Tab_Talk_elf,
        Tab_Fix_sledding = Tab_Fix_sledding,
        Tab_Collect_toys = Tab_Collect_toys,
        Tab_Get_key = Tab_Get_key,
        Tab_Player = Tab_Player,
        Tab_Esp = Tab_Esp,
        Tab_Creditos = Tab_Creditos
      }

      SaveConfig(updatedConfig, currentLanguage)
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Talk_elf, Tab_Fix_sledding, Tab_Collect_toys, Tab_Get_key, Tab_Player, Tab_Esp, Tab_Creditos
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Tab_Talk_elf = {
        name = "Talk to the elf",
        section = "Talk to the elf",
        button = "To speak"
      }

      local Tab_Fix_sledding = {
        name = "Fix the sled",
        section = "Auto repairs Santa's sleigh",
        button = "Self repair"
      }

      local Tab_Collect_toys = {
        name = "Collect toys",
        section = "Auto collect toys",
        button = "Self collect"
      }

      local Tab_Get_key = {
        name = "Auto pick up key",
        section = "Auto collect the key",
        button = "Self collect"
      }

      local Tab_Player = {
        name = "Players",
        section1 = "Teleport to players",
        section2 = "Player speed",
        section3 = "Light up your surroundings",
        AddDropdownName = "List of players: ",
        AddSliderName = "Speed",
        button = "Teleport player",
        toggle = "Fullbright"
      }

      local Tab_Esp = {
        name = "Esp",
        section1 = "Show players location",
        section2 = "Show item locations for sled",
        section3 = "Show location of toys",
        section4 = "Show monster location",
        button1 = "Esp players",
        button2 = "Esp itens",
        button3 = "Esp toys",
        button4 = "Esp monster",
        ObjectName = "Toy"
      }

      local Tab_Creditos = {
        name = "Credits",
        paragrafo = "Join my YouTube channel and Discord for new updates."
      }

      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Talk_elf, Tab_Fix_sledding, Tab_Collect_toys, Tab_Get_key, Tab_Player, Tab_Esp, Tab_Creditos
      
    end
end

return TranslationModule