local TranslationFunctions = 
local TranslationModule = {}
local nameScript = ""
local versionTranslation = "V1"

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
        return savedConfig.Main, savedConfig.Jogador, savedConfig.Mostrar, savedConfig.Creditos
      else
        
        local text = RaelHubTradutor.Tradutor("This may take a few minutes.", currentLanguage)
        notification:createNotification(text, 5)
        
      end

      local Main = {
        name = RaelHubTradutor.Tradutor("Main", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Autoplay for you", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Auto put all funky friday code ", currentLanguage),
        toggle = RaelHubTradutor.Tradutor("Auto play", currentLanguage),
        button = RaelHubTradutor.Tradutor("Redeem codes", currentLanguage)
      }
      
      notification:createNotification(RaelHubTradutor.Tradutor('"Main" translation completed', currentLanguage), 5)
      local Jogador = {
        name = RaelHubTradutor.Tradutor("Player", currentLanguage),
        section1 = RaelHubTradutor.Tradutor("Teleport to players", currentLanguage),
        section2 = RaelHubTradutor.Tradutor("Player Speed", currentLanguage),
        section3 = RaelHubTradutor.Tradutor("Pass through objects", currentLanguage),
        section4 = RaelHubTradutor.Tradutor("Light up the map", currentLanguage),
        section5 = RaelHubTradutor.Tradutor("Do you walk on water", currentLanguage),
        dropdowntext = RaelHubTradutor.Tradutor("Players: ", currentLanguage),
        slidetext = RaelHubTradutor.Tradutor("Speed: ", currentLanguage),
        button = RaelHubTradutor.Tradutor("Teleport to player", currentLanguage),
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
        Jogador = Jogador,
        Mostrar = Mostrar,
        Creditos = Creditos
      }

      SaveConfig(updatedConfig, currentLanguage)
      notification:createNotification(RaelHubTradutor.Tradutor('Translation completed successfully', currentLanguage), 5)
      getgenv().RaelHubScreenGuiLoad:Destroy()
      return Main, Jogador, Mostrar, Creditos
    elseif getgenv().RaelHubAutoTranslator == false then
      
      local Main = {
        name = "Main",
        section1 = "Autoplay for you",
        section2 = "Auto put all funky friday code",
        toggle = "Auto play",
        button = "Redeem codes"
      }
      local Jogador = {
        name = "Player",
        section1 = "Teleport to players",
        section2 = "Player Speed",
        section3 = "Pass through objects",
        section4 = "Light up the map",
        section5 = "Do you walk on water",
        dropdowntext = "Players: ",
        slidetext = "Speed: ",
        button = "Teleport to player",
        toggle1 = "Enable speed",
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
      return Main, Jogador, Mostrar, Creditos
      
    end
end

return TranslationModule