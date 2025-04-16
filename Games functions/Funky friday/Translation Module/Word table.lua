local Modules = {}

function Modules.LoadTableTranslation()
  
  RaelHubLoadModule.setValueBar({Text="Translating the script"}, 0.7)
    
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
end

return Modules