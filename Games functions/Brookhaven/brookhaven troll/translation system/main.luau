local module = {}
local languages = {
    ["en-us"] = "",
    ["pt-br"] = ""
}

local LocalizationService = game:GetService("LocalizationService")
local playerLanguage = LocalizationService.RobloxLocaleId

function module:GetTranslationTable()
    local TranslationTable = loadstring(game:HttpGet(""))()
    return TranslationTable
end

return module
