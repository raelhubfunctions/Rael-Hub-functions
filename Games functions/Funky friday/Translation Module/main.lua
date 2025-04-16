local TranslationFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-hub-gui/refs/heads/main/Utils/TranslationFunctions.lua"))()
local NotificationManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20notification%20system/script.lua"))()
local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()
local RaelHubLoadModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/rael-hub-gui/refs/heads/main/Module.lua"))()

local TranslationModule = {}
local Game_Name = "Funky Friday"
local Version_Script = "0.50"
local notification = NotificationManager.new()
local currentLanguage = TranslationFunctions.GetPlayerLanguage()
TranslationFunctions.startVerification()

local function LoadingTranslationsText()
  RaelHubLoadModule.setValueBar({Text="Loading translations"}, 0.7)
  task.wait(1)
  RaelHubLoadModule.setValueBar({Text="Finishing"}, 1)
  RaelHubLoadModule.Destroy()
end

local function TranslationLogs(text)
  local textTranslated = RaelHubTradutor.Tradutor(text)
  notification:createNotification(text, 5)
end

function TranslationModule:GetTabs()
  
  local TranslationsTable = TranslationFunctions.LoadTranslation("Rael Hub " .. Game_Name, Version_Script)
  local TranslateText = RaelHubTradutor.Tradutor
  
  if getgenv().RaelHubAutoTranslator then
    
    local ExecutorSupport = RaelHubLoadModule.RunInterface({Executors = {"xeno", "solara", "jjexploit"}})
    
    if not ExecutorSupport then return end
    
    if TranslationsTable then
      LoadingTranslationsText()
      return TranslationFunctions.ReturnLoadedTranslations(TranslationsTable)
    end
    
    
    
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

    RaelHubLoadModule.setValueBar({Text="Finishing"}, 1)
    RaelHubLoadModule.Destroy()
    return Main, Jogador, Mostrar, Creditos
    
  end
end

TranslationModule:GetTabs()