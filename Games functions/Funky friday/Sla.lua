local TranslationFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Games%20functions/Funky%20friday/testTraducao.lua"))()
local NotificationManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20notification%20system/script.lua"))()
local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()
local RaelHubLoadModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/rael-hub-gui/refs/heads/main/Module.lua"))()

local TranslationModule = {}
local Game_Name = "Funky Friday"
local Version_Script = "V1"
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
      print(TranslationsTable)
      LoadingTranslationsText()
      return TranslationFunctions.ReturnLoadedTranslations(TranslationsTable)
    
    end
    
    RaelHubLoadModule.setValueBar({Text="Saving the translations"}, 0.7)
    
    local Main = {
      name = TranslateText("Main"),
      section1 = TranslateText("Auto player for you"),
      section2 = TranslateText("Auto put all funky friday code"),
      toggle = TranslateText("Auto play"),
      button = TranslateText("Redeem codes")
    }
      
    TranslationLogs('"Main" translation completed')
    
    local Jogador = {
      name = TranslateText("Player"),
      section1 = TranslateText("Teleport to players"),
      section2 = TranslateText("Player Speed"),
      section3 = TranslateText("Pass through objects"),
      section4 = TranslateText("Light up the map"),
      section5 = TranslateText("Do you walk on water"),
      dropdowntext = TranslateText("Players: "),
      slidetext = TranslateText("Speed: "),
      button = TranslateText("Teleport to player"),
      toggle1 = TranslateText("Ativar velocidade"),
      toggle2 = TranslateText("Walking On Water")
    }
    
    TranslationLogs('"Player" translation completed')
    
    local Mostrar = {
      name = "Esp",
      section1 = TranslateText("Show objects"),
      section2 = TranslateText("Show the monsters"),
      section3 = TranslateText("Show players"),
      toggle1 = "Esp " .. TranslateText(" object "),
      toggle2 = "Esp " .. TranslateText(" monster "),
      toggle3 = "Esp " .. TranslateText(" players ")
    }
    
    TranslationLogs('"Show" translation completed')
    
    local Creditos = {
      name = TranslateText("Credits"),
      section = TranslateText("Script creator"),
      descricao = TranslateText("Join my YouTube channel and Discord for new updates"),
      ContentNotify = TranslateText("The script has been copied to the desktop")
    }
    
    TranslationLogs('"Credits" translation completed')
    
    local updatedConfig = {
      Main = Main,
      Jogador = Jogador,
      Mostrar = Mostrar,
      Creditos = Creditos
    }
    
    TranslationFunctions.SaveTranslation("Rael Hub " .. Game_Name, Version_Script, updatedConfig)
    
    TranslationLogs("Translation completed successfully")
    
    RaelHubLoadModule.setValueBar({Text="Finishing"}, 1)
    RaelHubLoadModule.Destroy()
    
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

    RaelHubLoadModule.setValueBar({Text="Finishing"}, 1)
    RaelHubLoadModule.Destroy()
    return Main, Jogador, Mostrar, Creditos
    
  end
end

TranslationModule:GetTabs()