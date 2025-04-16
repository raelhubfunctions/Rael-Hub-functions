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
		return "en" -- 
	end
end

local language = Module.GetPlayerLanguage()

function Module.SaveTranslation(nameFolder, version, TableTranslation)
	if not isfolder(nameFolder) then
		makefolder(nameFolder)
	end
	local fileName = nameFolder .. "/" .. language .. " version " .. version .. ".json"
	local json = HttpService:JSONEncode(TableTranslation)
	writefile(fileName, json)
end

function Module.LoadTranslation(nameFolder, version)
	local fileName = nameFolder .. "/" .. language .. " version " .. version .. ".json"
	if isfile(fileName) then
		local json = readfile(fileName)
		return HttpService:JSONDecode(json)
	else
		warn("[Erro] O arquivo não existe")
		return nil
	end
end

function Module.startVerification()
	if getgenv().RaelHubAutoTranslator == nil then
		getgenv().RaelHubAutoTranslator = true
		warn("RaelHubAutoTranslator foi criado e definido como true.")
	else
		warn("RaelHubAutoTranslator já existe, mantendo o valor atual.")
	end
end

function Module.ReturnLoadedTranslations(TableTranslation)
	local TableValues = {}
	for _, Table in pairs(TableTranslation) do
		table.insert(TableValues, Table)
		print(Table)
	end
	return table.unpack(TableValues)
end

return Module