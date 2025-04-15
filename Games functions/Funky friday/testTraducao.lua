local Module = {}
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")

function Module.GetPlayerLanguage()
  local result, code = pcall(function()
    return LocalizationService.RobloxLocaleId
  end)
  if result then
    return code:sub(1, 2)
  else
    return "en"
  end
end

local language = Module.GetPlayerLanguage()

function Module.SaveTranslation(nameFolder, version)
  local fileName = nameFolder .. "/" .. language .. " " .. version .. ".json"
  local json = HttpService:JSONEncode(configTable)
  writefile(fileName, json)
end

function Module.LoadTranslation(nameFolder, version)
  local fileName = nameFolder .. "/" .. language .. " " .. version .. ".json"
  if isfile(fileName) then
    local json = readfile(fileName)
    return HttpService:JSONDecode(json)
  else
    warn("[Erro] File does not exist")
    return nil
  end
end

return Module