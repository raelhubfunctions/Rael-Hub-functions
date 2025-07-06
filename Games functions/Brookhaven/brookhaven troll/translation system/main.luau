local module = {}
local LocalizationService = game:GetService("LocalizationService")
local playerLanguage = LocalizationService.RobloxLocaleId
local translationsAvailable = {"en-us", "pt-br"}

local function ImportaTranslation(language)
    local url = "https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Games%20functions/Brookhaven/brookhaven%20troll/translation%20system/languages/" .. language .. "lua"
    local content = loadstring(game:HttpGet(url))()
    return content
end

function module:GetTranslationTable()
    if not table.find(translationsAvailable, playerLanguage) then
        return ImportaTranslation("en-us")
    end
    return ImportaTranslation(playerLanguage)
end

return module
