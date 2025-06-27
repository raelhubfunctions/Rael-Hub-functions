local TranslationModule = {}

function TranslationModule:GetTabs()

    local Tab_Oficine = {
        name = "Teleport Room",
        section = "Teleport to the room",
        button = "Teleport to room"
    }

    local Tab_Sisters = {
        name = "Sisters Phase",
        section1 = "Read book in the room",
        section2 = "ESP monster",
        section3 = "Auto collect rats",
        section4 = "Auto escape this room",
        section5 = "Auto escape from Rin",
        button1 = "Read book",
        button2 = "ESP Rin",
        button3 = "Auto collect",
        button4 = "Auto escape",
        button5 = "Auto escape Rin",
        Notification = "Loading...",
        NotificationContent = "Processing files"
    }

    local Tab_Nagisa = {
        name = "Nagisa Phase",
        section1 = "Escape from Nagisa automatically",
        section2 = "Auto escape Nagisa",
        button1 = "Auto win Nagisa",
        button2 = "Auto escape Nagisa"
    }

    local Tab_PhasesFrame = {
        name = "Kenio Phase",
        section1 = "Talk to Kenio",
        section2 = "Highlight monster",
        section3 = "Collect key automatically",
        section4 = "Feature frames",
        section5 = "House teleportation",
        section6 = "Candle House Teleport",
        section8 = "Collect Orb automatically",
        
        button1 = "Talk to Kenio",
        button2 = "ESP monster",
        button3 = "Auto collect key",
        button4 = "Auto collect frames",
        button5 = "Show frames",
        button6 = "Auto light candles",
        button7 = "Teleport to house",
        button8 = "Teleport to candle house",
        button9 = "Auto collect orb",
        
        description1 = "You need to finish the painting before using this",
        description2 = "Use auto collect frames before this function",
        description3 = "You need to be in the room and have activated auto collect frames",
        
        AddDropdownName = "Houses",
        HouseText = "House "
    }

    local Tab_VelaFase = {
        name = "Candles Phase",
        section1 = "Teleport to safe zone",
        section2 = "Show monsters",
        section3 = "Teleport to candles",
        section4 = "Escape from Tenomo",
        button1 = "Safe zone",
        button2 = "ESP monsters",
        button3 = "Teleport to candle",
        button4 = "Auto escape",
        AddDropdownName = "Candles",
        NavioVelaText = "Candle "
    }

    local Tab_Others = {
        name = "Others",
        section1 = "Show where the player is",
        button1 = "ESP player",
        section2 = "Light up surroundings",
        button2 = "FullBright"
    }

    local Tab_Creditos = {
        name = "Credits",
        paragrafo = "Join my YouTube channel and Discord for new updates."
    }

    return Tab_Oficine, Tab_Sisters, Tab_Nagisa, Tab_PhasesFrame, Tab_VelaFase, Tab_Others, Tab_Creditos
end

return TranslationModule
