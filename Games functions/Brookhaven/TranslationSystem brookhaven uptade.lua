local GuiModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/rael-hub-gui/refs/heads/main/Module.lua"))()
local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()

if getgenv and getgenv().RaelHubAutoTranslator == nil then
  getgenv().RaelHubAutoTranslator = true
  warn("RaelHubAutoTranslator was created and set to true.")
else
  warn("RaelHubAutoTranslator already exists, keeping the current value.")
end

if getgenv().RaelHubAutoTranslator then
  GuiModule.RunInterface()
  GuiModule.setValueBar({Text="Finishing"}
  , 1)
elseif getgenv().RaelHubAutoTranslator == false then
  GuiModule.RunInterface({TextThanks = "Thank you for using rael hub"})
  GuiModule.setValueBar({Text="Finishing"}
  , 1)
end

local TranslationModule = {}
local configFolder = "RaelHub brookhaven"

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
    
    if getgenv().RaelHubAutoTranslator and currentLanguage == "pt" then


      local House = {
        name = "Casa",
        section1 = "Remover seu ban nas casas",
        section2 = "Funções para banir o pessoal da sua casa",
        section3 = "Lista de casas",
        section4 = "Adicionar id de som na sua casa (gamepass)",
        section5 = "Adicionar id de som na sua casa via playerlist (gamepass)",
        toggle1 = "Remover o ban automáticamente",
        toggle2 = "Banir o jogador da sua casa (loop)",
        toggle3 = "Banir todo mundo da sua casa (loop)",
        toggle4 = "Atravessar a porta da casa",
        toggle5 = "Spawn campinha",
        toggle6 = "Spawn bater porta",
        toggle7 = "Spawn luzes",
        button1 = "Remover ban",
        button2 = "Banir o jogador da sua casa",
        button3 = "Banir todo mundo da sua casa",
        button4 = "Atulizar lista das casas",
        button5 = "Pegar permissão",
        button6 = "Teleportar para a casa",
        button7 = "Teleportar para o cofre",
        button8 = "Tocar a música",
        button9 = "Salvar a playlist",
        button10 = "Carrgar a playlist",
        dropdowntext1 = "Casas",
        dropdowntext2 = "Musicas ids",
        textboxtext1 = "Musica Id",
        textboxtext2 = "Ensira seu pastebin",
        textboxdescription = "Tutorial no canal rael hub"
      }

      local Clothes = {  
        name = "Roupas",  
        section1 = "Deixar o nome do personagem colorido",  
        section2 = "Deixar o bio do personagem colorido",  
        section3 = "Deixar o personagem colorido",  
        section4 = "Lista de jogadores",  
        section5 = "Lista de partes do corpo do personagem",  
        section6 = "Lista de Dominus",  
        section7 = "Lista de Valquírias",  
        section8 = "Lista de Sparkle time fedora",  
        section9 = "Lista de Fadas",  
        section10 = "Lista de itens de som",  
        section11 = "Lista de itens para mão",
        section12 = "Lista de roupa 3d", 
        toggle1 = "Nome colorido",  
        toggle2 = "Bio colorido",  
        toggle3 = "Personagem colorido",  
        equipedbutton = "Equipar parte",  
        equipedbutton2 = "Equipar item",  
        button1 = "Copiar skin do jogador",  
        button2 = "Copie a skin do jogador mais próximo",  
        button3 = "Copie a skin de um jogador aleatório",  
        dropdownplayertext = "Lista de jogadores",  
        dropdowncopytype = "Escolha do tipo",  
        dropdownhandle = "Cabeça",  
        dropdownleftarm = "Braço esquerdo",  
        dropdownrigtharm = "Braço direito",  
        dropdowntorso = "Tronco",  
        dropdownleftleg = "Pé esquerdo",  
        dropdownrigthleg = "Pé direito",  
        dropdowndominus = "Dominus",  
        dropdownvalkyrie = "Valquírias",  
        dropdownstf = "Sparkle time fedora",  
        dropdownfairy = "fadas",  
        dropdownsong = "Song itens",  
        dropdownhanditem = "Itens de mão",
        dropdownclothes3d = "Roupas 3d"  
          
      }  
        
      local Car = {  
        name = "Carros",  
        section1 = "Modificar a velocidade do veículo",  
        section2 = "Deixar o carro colorido",  
        section3 = "Lista de carros",  
        section4 = "Spawns",  
        section5 = "Fazer o carro subir",  
        section6 = "Adicionar id de som no carro (gamepass)",  
        section7 = "Adicionar id de som no carro via playlist (gamepass)",  
        textboxtext1 = "Velocidade do veículo",  
        textboxtext2 = "Música id",  
        toggle1 = "Carro colorido",  
        toggle2 = "Puxar carro",  
        toggle3 = "Spawn fogo",  
        toggle4 = "Spawn buzina 1",  
        toggle5 = "Spawn buzina 2",  
        toggle6 = "Subir carro",  
        button1 = "Atualizar lista de carros",  
        button2 = "Teleportar para o carro",  
        dropdowncar = "Carros"  
      }  
        
      local Jogador = {   
        name = "Player",  
        section1 = "Velocidade do jogador",  
        section2 = "Potência de pulo do jogador",  
        section3 = "Pode atravessar as paredes",  
        section4 = "Iluminar o mapa",  
        slidespeed = "Velocidade",  
        slidejump = "Potência",  
        toggle1 = "Ativar velocidade",  
        toggle2 = "Ativar potência de pulo",  
        toggle3 = "Ativar no-clip",  
        toggle4 = "Ativar Fullbright"  
      }  
        
      local Trolar = {  
        name = "Troll",  
        list_player_section = "Lista de jogadores",  
        kill_pull_section = "Matar e puxar jogador",  
        fling_section = "Arremessar o jogador",  
        tp_sp_section = "Teleportar e spectar jogador ",  
        anti_seat_section = "Modos de anti se sentar",  
          
        list_player_dropdown = "Jogadores",  
        choose_mode_dropdown = "Escolher modo",  
          
        dropdown_modes1 = {"Ônibus", "Sofá"},  
        dropdown_modes2 = {"Ônibus", "Sofá", "Barco"},  
          
        uptdplayer_button = "Atualizar lista de jogadores",  
        teleporte_button = "Teleportar para jogador",  
        teleporteC_button = "Teleportar para jogador com carro",  
          
        killplayer_toggle = "Matar jogador",  
        pullplayer_toggle = "Puxar jogador",  
        flingplayer_toggle = "Arremessar jogador",  
        spectar_toggle = "Spectar jogador",  
          
        antiseatV_toggle = "Anti seat: Veículos",  
        antiseatT_toggle = "Anti seat: Tools",  
        antiseatAll_toggle = "Anti seat: Tudo"  
          
      }  
        
      local Ferramenta = {   
        name = "Tool",  
        section1 = "Equipar tool",  
        section2 = "Equipar armas",  
        section3 = "Adicionar som de arma através do id",  
        section4 = "Lista de ids de som",  
        ToolDropdownName = "Tools names",  
        ToolGunDropdownName = "Armas names",  
        SoundIDDropdownName = "Sounds ids",  
        SoundIDTextBoxName = "Colocar id de som",  
        buttonEquip = "Equipe item",  
        buttonPlay = "Tocar música",  
        togglePlay = "Tocar música loop"  
      }  
        
      local Cliente = {  
        name = "Cliente",  
        section1 = "Gamepass",  
        section2 = "Puxe os jogadores para perto de você",  
        section3 = "Ficar pegando fogo",  
        button1 = "Desbloquear gamepass de música",  
        button2 = "Puxe todos os jogadores",  
        button3 = "Avatar fogo",  
        slidefire = "Tamanho do fogo"  
      }  
        
      local Mostrar = {  
        name = "Esp",  
        toggle1 = "Esp player",  
        toggle2 = "Esp Veículo"  
      }  
        
      local Creditos = {  
        name = "Creditos",  
        descricao = "Entre no meu discord e se inscreva no meu canal do YouTube"  
      }

      task.wait(0.5)
      
      GuiModule.Destroy()
      
      return House, Clothes, Car, Jogador, Trolar,  Ferramenta, Cliente, Mostrar, Creditos
    else
      
      local House = {
        name = "House",
        section1 = "Remove your ban from houses",
        section2 = "Functions to ban people from your house",
        section3 = "House list",
        section4 = "Add sound ID to your house (gamepass)",
        section5 = "Add sound ID to your house via player list (gamepass)",
        toggle1 = "Automatically remove ban",
        toggle2 = "Ban player from your house (loop)",
        toggle3 = "Ban everyone from your house (loop)",
        toggle4 = "Pass through the house door",
        toggle5 = "Spawn doorbell",
        toggle6 = "Spawn door knocking",
        toggle7 = "Spawn lights",
        button1 = "Remove ban",
        button2 = "Ban player from your house",
        button3 = "Ban everyone from your house",
        button4 = "Update house list",
        button5 = "Get permission",
        button6 = "Teleport to house",
        button7 = "Teleport to the safe",
        button8 = "Play music",
        button9 = "Save playlist",
        button10 = "Load playlist",
        dropdowntext1 = "Houses",
        dropdowntext2 = "Music IDs",
        textboxtext1 = "Music ID",
        textboxtext2 = "Enter your pastebin",
        textboxdescription = "Tutorial on Rael Hub channel"
      }

      local Clothes = {  
        name = "Clothes",  
        section1 = "Make character name colorful",  
        section2 = "Make character bio colorful",  
        section3 = "Make character colorful",  
        section4 = "Player list",  
        section5 = "Character body parts list",  
        section6 = "Dominus list",  
        section7 = "Valkyrie list",  
        section8 = "Sparkle Time Fedora list",  
        section9 = "Fairy list",  
        section10 = "Sound items list",  
        section11 = "Hand items list",
        section12 = "3D clothes list", 
        toggle1 = "Colorful name",  
        toggle2 = "Colorful bio",  
        toggle3 = "Colorful character",  
        equipedbutton = "Equip part",  
        equipedbutton2 = "Equip item",  
        button1 = "Copy player's skin",  
        button2 = "Copy nearest player's skin",  
        button3 = "Copy random player's skin",  
        dropdownplayertext = "Player list",  
        dropdowncopytype = "Choose type",  
        dropdownhandle = "Head",  
        dropdownleftarm = "Left arm",  
        dropdownrigtharm = "Right arm",  
        dropdowntorso = "Torso",  
        dropdownleftleg = "Left leg",  
        dropdownrigthleg = "Right leg",  
        dropdowndominus = "Dominus",  
        dropdownvalkyrie = "Valkyries",  
        dropdownstf = "Sparkle Time Fedora",  
        dropdownfairy = "Fairies",  
        dropdownsong = "Sound items",  
        dropdownhanditem = "Hand items",
        dropdownclothes3d = "3D clothes"  
      }
    
      local Car = {  
        name = "Cars",  
        section1 = "Modify vehicle speed",  
        section2 = "Make the car colorful",  
        section3 = "Car list",  
        section4 = "Spawns",  
        section5 = "Make the car go up",  
        section6 = "Add sound ID to the car (gamepass)",  
        section7 = "Add sound ID to the car via playlist (gamepass)",  
        textboxtext1 = "Vehicle speed",  
        textboxtext2 = "Music ID",  
        toggle1 = "Colorful car",  
        toggle2 = "Pull car",  
        toggle3 = "Spawn fire",  
        toggle4 = "Spawn horn 1",  
        toggle5 = "Spawn horn 2",  
        toggle6 = "Raise car",  
        button1 = "Update car list",  
        button2 = "Teleport to car",  
        dropdowncar = "Cars"  
      }  
    
      local Jogador = {  
        name = "Player",  
        section1 = "Player speed",  
        section2 = "Player jump power",  
        section3 = "Can pass through walls",  
        section4 = "Illuminate the map",  
        slidespeed = "Speed",  
        slidejump = "Power",  
        toggle1 = "Enable speed",  
        toggle2 = "Enable jump power",  
        toggle3 = "Enable no-clip",  
        toggle4 = "Enable Fullbright"  
      }  
    
      local Trolar = {  
        name = "Troll",  
        list_player_section = "Player list",  
        kill_pull_section = "Kill and pull player",  
        fling_section = "Throw the player",  
        tp_sp_section = "Teleport and spectate player",  
        anti_seat_section = "Anti-sit modes",  
          
        list_player_dropdown = "Players",  
        choose_mode_dropdown = "Choose mode",  
          
        dropdown_modes1 = {"Bus", "Sofa"},  
        dropdown_modes2 = {"Bus", "Sofa", "Boat"},  
          
        uptdplayer_button = "Update player list",  
        teleporte_button = "Teleport to player",  
        teleporteC_button = "Teleport to player with car",  
          
        killplayer_toggle = "Kill player",  
        pullplayer_toggle = "Pull player",  
        flingplayer_toggle = "Throw player",  
        spectar_toggle = "Spectate player",  
          
        antiseatV_toggle = "Anti-seat: Vehicles",  
        antiseatT_toggle = "Anti-seat: Tools",  
        antiseatAll_toggle = "Anti-seat: All"  
      }  
    
      local Ferramenta = {  
        name = "Tool",  
        section1 = "Equip tool",  
        section2 = "Equip weapons",  
        section3 = "Add weapon sound via ID",  
        section4 = "Sound ID list",  
        ToolDropdownName = "Tool names",  
        ToolGunDropdownName = "Weapon names",  
        SoundIDDropdownName = "Sound IDs",  
        SoundIDTextBoxName = "Enter sound ID",  
        buttonEquip = "Equip item",  
        buttonPlay = "Play music",  
        togglePlay = "Play music loop"  
      }  
    
      local Cliente = {  
        name = "Client",  
        section1 = "Gamepass",  
        section2 = "Pull players closer to you",  
        section3 = "Stay on fire",  
        button1 = "Unlock music gamepass",  
        button2 = "Pull all players",  
        button3 = "Avatar fire",  
        slidefire = "Fire size"  
      }  
    
      local Mostrar = {  
        name = "Esp",  
        toggle1 = "Esp player",  
        toggle2 = "Esp Vehicle"  
      }  
    
      local Creditos = {  
        name = "Credits",  
        descricao = "Join my Discord and subscribe to my YouTube channel"  
      }
      
      task.wait(0.5)
      
      GuiModule.Destroy()
      
      return House, Clothes, Car, Jogador, Trolar, Ferramenta, Cliente, Mostrar, Creditos
      
    end
end

return TranslationModule
