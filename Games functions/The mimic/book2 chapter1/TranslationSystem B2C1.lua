local TranslationModule = {}

function TranslationModule:GetTabs()

    Tab_Oficine = {
        name = "Teleporte sala",
        section = "Teleportar para a sala",
        button = "Teleportar pra sala"
    }

    Tab_Sisters = {
        name = "Fase das Irmãs",
        section1 = "Ler livro na sala",
        section2 = "Esp monstro",
        section3 = "Auto coletar os ratos",
        section4 = "Auto escapar dessa sala",
        section5 = "Auto escapar de Rin",
        button1 = "Ler livro",
        button2 = "Esp rin",
        button3 = "Auto coletar",
        button4 = "Auto escapar",
        button5 = "Auto fugir de Rin",
        Notification = "Carregando...",
        NotificationContent = "Processando arquivos"
    }

    Tab_Nagisa = {
        name = "Phase nagisa",
        section1 = "Escape from Nagisa automatically",
        section2 = "Auto escape nagisa",
        button1 = "Auto win nagisa",
        button2 = "Auto escape nagisa"
    }

    Tab_PhasesFrame = {
        name = "Phase kenio",
        section1 = "Talk to Kenio",
        section2 = "Highlight monster",
        section3 = "Collect key automatically",
        section4 = "Feature frames",
        section5 = "House teleportation",
        section6 = "Candle House Teleport",
        section8 = "Collect Orb automatically",
        
        button1 = "Talk kenio",
        button2 = "Esp monster",
        button3 = "Auto collect key",
        button4 = "Auto collect frames",
        button5 = "Show frames",
        button6 = "Auto Light Candles",
        button7 = "Teleport to home",
        button8 = "Teleport to the house of candles",
        button9 = "Auto collect orb",
        
        description1 = "You need to do painting before using this",
        description2 = "Use auto collect frames before this function",
        description3 = "You need to be in the room and have activated Auto collect frames",
        
        AddDropdownName = "Houses",
        HouseText = "House "
    }

    Tab_VelaFase = {
        name = "Fase das velas",
        section1 = "Teleportar para zona segura",
        section2 = "Mostrar monstros",
        section3 = "Teleportar para as velas",
        section4 = "Escapar de Tenomo",
        button1 = "Zona segura",
        button2 = "Esp monstros",
        button3 = "Teleportar vela",
        button4 = "Auto escapar",
        AddDropdownName = "Candles",
        NavioVelaText = "Candle "
    }

    Tab_Other = {
        name = "Outros",
        section1 = "Mostrar onde o jogador tá",
        button1 = "Esp player",
        section2 = "Iluminar ao redor",
        button2 = "FullBright"
    }

    Tab_Creditos = {
        name = "Créditos",
        paragrafo = "Entre no meu canal do YouTube e no meu Discord para novas atualizações."
    }

    return Tab_Oceano, Tab_ComedorCarne, Tab_Meat, Tab_Esqueletos, Tab_Alavancas, Tab_Engima, Tab_Comida, Tab_Teiryu, Tab_Torre, Tab_Chihiro, Tab_Boss, Tab_Others, Tab_Creditos
      
end

return TranslationModule
