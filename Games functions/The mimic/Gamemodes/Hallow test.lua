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
local configFolder = "RaelHub Halloween trials"
local LocalizationService = game:GetService("LocalizationService")

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

local function SaveConfig(configTable, language)
    local fileName = configFolder .. "/" .. language .. ".json"
    local json = game:GetService("HttpService"):JSONEncode(configTable)
    writefile(fileName, json)
end

local function LoadConfig(language)
    local fileName = configFolder .. "/" .. language .. ".json"
    if isfile(fileName) then
        local json = readfile(fileName)
        return game:GetService("HttpService"):JSONDecode(json)
    else
        return nil
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
        return savedConfig.Tab_Main, savedConfig.Tab_Player, savedConfig.Tab_Esp, savedConfig.Tab_Credits
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end

      local Tab_Main = {
        name = RaelHubTradutor.Tradutor("Main", currentLanguage),
        tp_third_part_section = RaelHubTradutor.Tradutor("Teleport to third party", currentLanguage),
        tp_final_part_section = RaelHubTradutor.Tradutor("Teleport to the end of the part", currentLanguage),
        auto_win_section = RaelHubTradutor.Tradutor("Automatically win this part", currentLanguage),
        collect_candy_section = RaelHubTradutor.Tradutor("Collect the candy automatically", currentLanguage),
        light_candles_section = RaelHubTradutor.Tradutor("Light all the candles", currentLanguage),
        make_potion_section = RaelHubTradutor.Tradutor("Make potion automatically", currentLanguage),
        aimbot_section = RaelHubTradutor.Tradutor("Throw the potion at the monsters", currentLanguage),
        aimbot_dropdown = RaelHubTradutor.Tradutor("Monsters List:", currentLanguage),
        tp_third_part_button = RaelHubTradutor.Tradutor("Teleport part 3", currentLanguage),
        tp_final_part_button = RaelHubTradutor.Tradutor("Teleport to the final", currentLanguage),
        auto_win_button = RaelHubTradutor.Tradutor("Auto win", currentLanguage),
        light_candles_button = RaelHubTradutor.Tradutor("Light the candles", currentLanguage),
        make_potion_button = RaelHubTradutor.Tradutor("Auto make potion", currentLanguage),
        aimbot_button = RaelHubTradutor.Tradutor("Amboit monsters", currentLanguage),
        collect_candy_button = RaelHubTradutor.Tradutor("Collect the candy automatically", currentLanguage),
        
      }
      notification:createNotification(RaelHubTradutor.Tradutor('"Main" translation completed', currentLanguage), 5)
      
      local Tab_Player = {
        name = RaelHubTradutor.Tradutor("Player", currentLanguage),
        player_list_section = RaelHubTradutor.Tradutor("Players List", currentLanguage),
        player_speed_section = RaelHubTradutor.Tradutor("Modify character speed", currentLanguage),
        player_fullbright_section = RaelHubTradutor.Tradutor("Light up your map", currentLanguage),
        player_list_dropdown = RaelHubTradutor.Tradutor("Players List:", currentLanguage),
        player_speed_slide = RaelHubTradutor.Tradutor("Speed:", currentLanguage),
        tp_player_button = RaelHubTradutor.Tradutor("Teleport for player", currentLanguage),
        spectate_player_button = RaelHubTradutor.Tradutor("Spectate player", currentLanguage),
        player_speed_button = RaelHubTradutor.Tradutor("Enable speed", currentLanguage),
        player_fullbright_button = RaelHubTradutor.Tradutor("Fullbright", currentLanguage),
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Player" translation completed', currentLanguage), 5)
      
      local Tab_Esp = {
        name = RaelHubTradutor.Tradutor("Esp", currentLanguage),
        player_button = RaelHubTradutor.Tradutor("Esp player", currentLanguage),
        candy_button = RaelHubTradutor.Tradutor("Esp candy", currentLanguage),
        objects_button = RaelHubTradutor.Tradutor("Esp objects", currentLanguage),
        monster_button = RaelHubTradutor.Tradutor("Esp monster", currentLanguage)
        
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Esp" translation completed', currentLanguage), 5)
      
      local Tab_Credits = {
        name = RaelHubTradutor.Tradutor("Credits", currentLanguage),
        section = RaelHubTradutor.Tradutor("Script creator", currentLanguage),
        descricao = RaelHubTradutor.Tradutor("Join my YouTube channel and Discord for new updates", currentLanguage),
        ContentNotify = RaelHubTradutor.Tradutor("The script has been copied to the desktop", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Credits" translation completed', currentLanguage), 5)
      
      -- Salvar as traduções para o idioma do jogador
      local updatedConfig = {
        Tab_Main = Tab_Main,
        Tab_Player = Tab_Player,
        Tab_Esp = Tab_Esp,
        Tab_Credits = Tab_Credits
      }
      
      SaveConfig(updatedConfig, currentLanguage)
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Main, Tab_Player, Tab_Esp, Tab_Credits
      
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Tab_Main = {
        name = "Main",
        tp_third_part_section = "Teleport to third party",
        tp_final_part_section = "Teleport to the end of the part",
        auto_win_section = "Automatically win this part",
        collect_candy_section = "Collect the candy automatically",
        light_candles_section = "Light all the candles",
        make_potion_section = "Make potion automatically",
        aimbot_section = "Throw the potion at the monsters",
        aimbot_dropdown = "Monsters List:",
        tp_third_part_button = "Teleport part 3",
        tp_final_part_button = "Teleport to the final",
        auto_win_button = "Auto win",
        light_candles_button = "Light the candles",
        make_potion_button = "Auto make potion",
        aimbot_button = "Amboit monsters",
        collect_candy_button = "Collect the candy automatically",
      }
      
      local Tab_Player = {
        name = "Player",
        player_list_section = "Players List",
        player_speed_section = "Modify character speed",
        player_fullbright_section = "Light up your map",
        player_list_dropdown = "Players List:",
        player_speed_slide = "Speed:",
        tp_player_button = "Teleport for player",
        spectate_player_button = "Spectate player",
        player_speed_button = "Enable speed",
        player_fullbright_button = "Fullbright",
      }
      
      local Tab_Esp = {
        name = "Esp",
        player_button = "Esp player",
        candy_button = "Esp candy",
        objects_button = "Esp objects",
        monster_button = "Esp monster",
      }
      
      local Tab_Credits = {
        name = "Credits",
        section = "Script creator",
        descricao = "Join my YouTube channel and Discord for new updates",
        ContentNotify = "The script has been copied to the desktop",
      }
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Tab_Main, Tab_Player, Tab_Esp, Tab_Credits
      
    end
end

return TranslationModule