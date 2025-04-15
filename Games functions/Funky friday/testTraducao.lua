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

function Module.startVerification()
  if getgenv().RaelHubAutoTranslator == nil then
    getgenv().RaelHubAutoTranslator = true
    warn("RaelHubAutoTranslator was created and set to true.")
  else
    warn("RaelHubAutoTranslator already exists, keeping the current value.")
  end
end

function Module.ReturnLoadedTranslations()
  local TableValues = {}
  for _, Table in pairs(versionTranslation) do
    table.insert(TableValues, Table)
    print(Table)
  end
  return table.unpack(TableValues)
end

return Module