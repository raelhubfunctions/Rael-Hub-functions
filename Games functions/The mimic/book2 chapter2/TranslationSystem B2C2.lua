local TranslationModule = {}

function TranslationModule:GetTabs()
      
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
        section2 = "Auto escape from Zuboshi",
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
        button4 = "Teleport to Chihiro [Safe]",
        button5 = "Teleport to door",
        button6 = "Auto collect letters",
        slidevalue = "Character height",
        toggle = "Teleport to chiriro automatically"
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
      
      return Tab_Oceano, Tab_ComedorCarne, Tab_Meat, Tab_Esqueletos, Tab_Alavancas, Tab_Engima, Tab_Comida, Tab_Teiryu, Tab_Torre, Tab_Chihiro, Tab_Boss, Tab_Others, Tab_Creditos
      
end

return TranslationModule
