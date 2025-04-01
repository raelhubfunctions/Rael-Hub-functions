function RaelHubLoadScreenGui(textvalue)
  local player = game.Players.LocalPlayer
  local playerGui = player:WaitForChild("PlayerGui")

  getgenv().RaelHubScreenGuiLoad = Instance.new("ScreenGui")
  getgenv().RaelHubScreenGuiLoad.Parent = playerGui

  local imageLabel = Instance.new("ImageLabel")
  imageLabel.Size = UDim2.new(0.7, 0, 0.6, 0)
  imageLabel.Position = UDim2.new(0.15, 0, 0.2, 0)
  imageLabel.Image = "rbxassetid://18665679839"
  imageLabel.BackgroundTransparency = 1
  imageLabel.ScaleType = Enum.ScaleType.Stretch
  imageLabel.Parent = getgenv().RaelHubScreenGuiLoad

  local title = Instance.new("TextLabel")
  title.Size = UDim2.new(0.6, 0, 0.1, 0)
  title.AnchorPoint = Vector2.new(0.5, 0.5)
  title.Position = UDim2.new(0.5, 0, 0.5, 0)
  title.BackgroundTransparency = 1
  title.Text = textvalue
  title.TextColor3 = Color3.fromRGB(16, 235, 138)
  title.Font = Enum.Font.ArialBold
  title.TextScaled = true
  title.TextTransparency = 1
  title.Parent = getgenv().RaelHubScreenGuiLoad



  local function fadeInText(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
        object.TextTransparency = 1 - i
        task.wait(increment)
    end
  end

  local function fadeOutText(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
        object.TextTransparency = i
        task.wait(increment)
    end
  end

  local function fadeInImage(duration, object)
    local increment = 0.05
    local step = increment / duration
    task.spawn(function()
      for i = 0, 1, step do
        object.ImageTransparency = 1 - i
        task.wait(increment)
      end
    end)
  end


  local function fadeOutImage(duration, object)
    local increment = 0.05
    local step = increment / duration
    for i = 0, 1, step do
      object.ImageTransparency = i
      task.wait(increment)
    end
  end

  -- Função para fazer o ícone girar
  local function rotateIcon(icon)
    local rotation = 0
    while icon.Parent do
        rotation = rotation + 30 -- Gira o ícone
        icon.Rotation = rotation
        task.wait(0.05) -- Velocidade da rotação
    end
  end

  -- Som ao iniciar (opcional)
  local startSound = Instance.new("Sound")
  startSound.SoundId = "rbxassetid://84663543883498"
  startSound.Volume = 1
  startSound.Parent = getgenv().RaelHubScreenGuiLoad
  startSound:Play()

  -- Exemplo de uso
  fadeInText(0.5, title) -- Faz o texto aparecer
  task.wait(2)
  fadeOutText(0.5, title) -- Faz o texto desaparecer
  title.Text = "RAEL HUB"
  title.AnchorPoint = Vector2.new(0, 0)
  title.Position = UDim2.new(0.2, 0, 0.35, 0)
  fadeInText(0.5, title)

  -- Ícone de carregamento giratório
  local loadingIcon = Instance.new("ImageLabel")
  loadingIcon.Size = UDim2.new(0.1, 0, 0.1, 0) -- Mantém a proporção
  loadingIcon.Position = UDim2.new(0.45, 0, 0.5, 0) -- Centralizado
  loadingIcon.Image = "rbxassetid://106296997072730" -- Ícone de loading
  loadingIcon.BackgroundTransparency = 1
  loadingIcon.ScaleType = Enum.ScaleType.Fit -- Ajuste para manter a proporção
  loadingIcon.Parent = getgenv().RaelHubScreenGuiLoad

  fadeInImage(0.5, loadingIcon)

  -- Inicia a rotação do ícone de carregamento
  spawn(function()
    rotateIcon(loadingIcon)
  end)
end

local RaelHubTradutor = loadstring(game:HttpGet("https://raw.githubusercontent.com/raelhubfunctions/Rael-Hub-functions/refs/heads/main/Rael%20Translation%20API/script.lua"))()

if getgenv and getgenv().RaelHubAutoTranslator == nil then
  getgenv().RaelHubAutoTranslator = true
  warn("RaelHubAutoTranslator was created and set to true.")
else
  warn("RaelHubAutoTranslator already exists, keeping the current value.")
end

if false then
  local RaelHubText1 = RaelHubTradutor.Tradutor("THANK YOU FOR USING RAEL HUB")
  RaelHubLoadScreenGui(RaelHubText1)
elseif true then
  local RaelHubText1 = "I ghost the down cool 🔥"
  RaelHubLoadScreenGui(RaelHubText1)
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

      local House = { name = "المنزل", section1 = "إزالة الحظر عن المنازل", section2 = "وظائف لحظر الأشخاص من منزلك", section3 = "قائمة المنازل", section4 = "إضافة معرف الصوت إلى منزلك (تصريح اللعبة)", section5 = "إضافة معرف الصوت إلى منزلك عبر قائمة اللاعبين (تصريح اللعبة)", toggle1 = "إزالة الحظر تلقائيًا", toggle2 = "حظر اللاعب من منزلك (تكرار)", toggle3 = "حظر الجميع من منزلك (تكرار)", toggle4 = "العبور من باب المنزل", toggle5 = "ظهور جرس الباب", toggle6 = "ظهور صوت طرق الباب", toggle7 = "ظهور الأضواء", button1 = "إزالة الحظر", button2 = "حظر اللاعب من منزلك", button3 = "حظر الجميع من منزلك", button4 = "تحديث قائمة المنازل", button5 = "الحصول على الإذن", button6 = "الانتقال إلى المنزل", button7 = "الانتقال إلى الخزنة", button8 = "تشغيل الموسيقى", button9 = "حفظ قائمة التشغيل", button10 = "تحميل قائمة التشغيل", dropdowntext1 = "المنازل", dropdowntext2 = "معرفات الموسيقى", textboxtext1 = "معرف الموسيقى", textboxtext2 = "أدخل رابط Pastebin الخاص بك", textboxdescription = "دليل على قناة رايل هب" }

local Clothes = { name = "الملابس", section1 = "تلوين اسم الشخصية", section2 = "تلوين الوصف الشخصي", section3 = "تلوين الشخصية", section4 = "حجم الشخصية", section5 = "قائمة اللاعبين", section6 = "قائمة أجزاء الجسم", section7 = "قائمة الدومينوس", section8 = "قائمة الفالكيري", section9 = "قائمة قبعات Sparkle Time Fedora", section10 = "قائمة الجنيات", section11 = "قائمة عناصر الصوت", section12 = "قائمة العناصر المحمولة", toggle1 = "اسم ملون", toggle2 = "وصف ملون", toggle3 = "شخصية ملونة", equipedbutton = "تجهيز الجزء", equipedbutton2 = "تجهيز العنصر", button1 = "تصغير اللاعب", button2 = "إعادة حجم اللاعب الطبيعي", button3 = "نسخ مظهر اللاعب", button4 = "نسخ مظهر أقرب لاعب", button5 = "نسخ مظهر لاعب عشوائي", dropdownplayertext = "قائمة اللاعبين", dropdowncopytype = "اختيار النوع", dropdownhandle = "الرأس", dropdownleftarm = "الذراع اليسرى", dropdownrigtharm = "الذراع اليمنى", dropdowntorso = "الجذع", dropdownleftleg = "الساق اليسرى", dropdownrigthleg = "الساق اليمنى", dropdowndominus = "دومينوس", dropdownvalkyrie = "فالكيري", dropdownstf = "Sparkle Time Fedora", dropdownfairy = "جنيات", dropdownsong = "عناصر الصوت", dropdownhanditem = "العناصر المحمولة" }

local Car = { name = "السيارات", section1 = "تعديل سرعة السيارة", section2 = "تلوين السيارة", section3 = "قائمة السيارات", section4 = "نقاط الظهور", section5 = "رفع السيارة", section6 = "إضافة معرف الصوت إلى السيارة (تصريح اللعبة)", section7 = "إضافة معرف الصوت إلى السيارة عبر قائمة التشغيل (تصريح اللعبة)", textboxtext1 = "سرعة السيارة", textboxtext2 = "معرف الموسيقى", toggle1 = "سيارة ملونة", toggle2 = "سحب السيارة", toggle3 = "ظهور النار", toggle4 = "ظهور بوق السيارة 1", toggle5 = "ظهور بوق السيارة 2", toggle6 = "رفع السيارة", button1 = "تحديث قائمة السيارات", button2 = "الانتقال إلى السيارة", dropdowncar = "السيارات" }

local Jogador = { name = "اللاعب", section1 = "سرعة اللاعب", section2 = "قوة قفز اللاعب", section3 = "القدرة على العبور من الجدران", section4 = "إضاءة الخريطة", slidespeed = "السرعة", slidejump = "القوة", toggle1 = "تفعيل السرعة", toggle2 = "تفعيل قوة القفز", toggle3 = "تفعيل العبور من الجدران", toggle4 = "تفعيل الإضاءة الكاملة" }

local Trolar = {
        name = "مقلب",
        list_player_section = "قائمة اللاعبين",
        kill_pull_section = "قتل وسحب اللاعب",
        fling_section = "رمي اللاعب",
        tp_sp_section = "الانتقال والمراقبة",
        anti_seat_section = "وضعيات منع الجلوس",

        list_player_dropdown = "اللاعبون",
        choose_mode_dropdown = "اختر الوضع",

        dropdown_modes1 = {"حافلة", "أريكة"},
        dropdown_modes2 = {"حافلة", "أريكة", "قارب"},

        uptdplayer_button = "تحديث قائمة اللاعبين",
        teleporte_button = "الانتقال إلى اللاعب",
        teleporteC_button = "الانتقال إلى اللاعب مع السيارة",

        killplayer_toggle = "قتل اللاعب",
        pullplayer_toggle = "سحب اللاعب",
        flingplayer_toggle = "رمي اللاعب",
        spectar_toggle = "مراقبة اللاعب",

        antiseatV_toggle = "منع الجلوس: المركبات",
        antiseatT_toggle = "منع الجلوس: الأدوات",
        antiseatAll_toggle = "منع الجلوس: الكل"
      }

local Ferramenta = { 
        name = "أداة",
        section1 = "تجهيز الأداة",
        section2 = "تجهيز الأسلحة",
        section3 = "إضافة صوت السلاح عبر المعرف",
        section4 = "قائمة معرفات الصوت",
        ToolDropdownName = "أسماء الأدوات",
        ToolGunDropdownName = "أسماء الأسلحة",
        SoundIDDropdownName = "معرفات الصوت",
        SoundIDTextBoxName = "أدخل معرف الصوت",
        buttonEquip = "تجهيز العنصر",
        buttonPlay = "تشغيل الموسيقى",
        togglePlay = "تشغيل الموسيقى بشكل متكرر"
      }

local Cliente = {
        name = "العميل",
        section1 = "تصريح اللعبة",
        section2 = "سحب اللاعبين نحوك",
        section3 = "الاحتراق المستمر",
        button1 = "فتح تصريح موسيقى اللعبة",
        button2 = "سحب جميع اللاعبين",
        button3 = "احتراق الشخصية",
        slidefire = "حجم النار"
      }

local Mostrar = {
        name = "إسب",
        toggle1 = "إظهار اللاعب",
        toggle2 = "إظهار المركبة"
      }

local Creditos = { name = "الاعتمادات", descricao = "انضم إلى خادمي في Discord واشترك في قناتي على YouTube" }


      
      task.wait(0.5)
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      
      return House, Clothes, Car, Jogador, Trolar,  Ferramenta, Cliente, Mostrar, Creditos
    else
      
      local House = { name = "المنزل", section1 = "إزالة الحظر عن المنازل", section2 = "وظائف لحظر الأشخاص من منزلك", section3 = "قائمة المنازل", section4 = "إضافة معرف الصوت إلى منزلك (تصريح اللعبة)", section5 = "إضافة معرف الصوت إلى منزلك عبر قائمة اللاعبين (تصريح اللعبة)", toggle1 = "إزالة الحظر تلقائيًا", toggle2 = "حظر اللاعب من منزلك (تكرار)", toggle3 = "حظر الجميع من منزلك (تكرار)", toggle4 = "العبور من باب المنزل", toggle5 = "ظهور جرس الباب", toggle6 = "ظهور صوت طرق الباب", toggle7 = "ظهور الأضواء", button1 = "إزالة الحظر", button2 = "حظر اللاعب من منزلك", button3 = "حظر الجميع من منزلك", button4 = "تحديث قائمة المنازل", button5 = "الحصول على الإذن", button6 = "الانتقال إلى المنزل", button7 = "الانتقال إلى الخزنة", button8 = "تشغيل الموسيقى", button9 = "حفظ قائمة التشغيل", button10 = "تحميل قائمة التشغيل", dropdowntext1 = "المنازل", dropdowntext2 = "معرفات الموسيقى", textboxtext1 = "معرف الموسيقى", textboxtext2 = "أدخل رابط Pastebin الخاص بك", textboxdescription = "دليل على قناة رايل هب" }

local Clothes = { name = "الملابس", section1 = "تلوين اسم الشخصية", section2 = "تلوين الوصف الشخصي", section3 = "تلوين الشخصية", section4 = "حجم الشخصية", section5 = "قائمة اللاعبين", section6 = "قائمة أجزاء الجسم", section7 = "قائمة الدومينوس", section8 = "قائمة الفالكيري", section9 = "قائمة قبعات Sparkle Time Fedora", section10 = "قائمة الجنيات", section11 = "قائمة عناصر الصوت", section12 = "قائمة العناصر المحمولة", toggle1 = "اسم ملون", toggle2 = "وصف ملون", toggle3 = "شخصية ملونة", equipedbutton = "تجهيز الجزء", equipedbutton2 = "تجهيز العنصر", button1 = "تصغير اللاعب", button2 = "إعادة حجم اللاعب الطبيعي", button3 = "نسخ مظهر اللاعب", button4 = "نسخ مظهر أقرب لاعب", button5 = "نسخ مظهر لاعب عشوائي", dropdownplayertext = "قائمة اللاعبين", dropdowncopytype = "اختيار النوع", dropdownhandle = "الرأس", dropdownleftarm = "الذراع اليسرى", dropdownrigtharm = "الذراع اليمنى", dropdowntorso = "الجذع", dropdownleftleg = "الساق اليسرى", dropdownrigthleg = "الساق اليمنى", dropdowndominus = "دومينوس", dropdownvalkyrie = "فالكيري", dropdownstf = "Sparkle Time Fedora", dropdownfairy = "جنيات", dropdownsong = "عناصر الصوت", dropdownhanditem = "العناصر المحمولة" }

local Car = { name = "السيارات", section1 = "تعديل سرعة السيارة", section2 = "تلوين السيارة", section3 = "قائمة السيارات", section4 = "نقاط الظهور", section5 = "رفع السيارة", section6 = "إضافة معرف الصوت إلى السيارة (تصريح اللعبة)", section7 = "إضافة معرف الصوت إلى السيارة عبر قائمة التشغيل (تصريح اللعبة)", textboxtext1 = "سرعة السيارة", textboxtext2 = "معرف الموسيقى", toggle1 = "سيارة ملونة", toggle2 = "سحب السيارة", toggle3 = "ظهور النار", toggle4 = "ظهور بوق السيارة 1", toggle5 = "ظهور بوق السيارة 2", toggle6 = "رفع السيارة", button1 = "تحديث قائمة السيارات", button2 = "الانتقال إلى السيارة", dropdowncar = "السيارات" }

local Jogador = { name = "اللاعب", section1 = "سرعة اللاعب", section2 = "قوة قفز اللاعب", section3 = "القدرة على العبور من الجدران", section4 = "إضاءة الخريطة", slidespeed = "السرعة", slidejump = "القوة", toggle1 = "تفعيل السرعة", toggle2 = "تفعيل قوة القفز", toggle3 = "تفعيل العبور من الجدران", toggle4 = "تفعيل الإضاءة الكاملة" }

local Trolar = {
        name = "مقلب",
        list_player_section = "قائمة اللاعبين",
        kill_pull_section = "قتل وسحب اللاعب",
        fling_section = "رمي اللاعب",
        tp_sp_section = "الانتقال والمراقبة",
        anti_seat_section = "وضعيات منع الجلوس",

        list_player_dropdown = "اللاعبون",
        choose_mode_dropdown = "اختر الوضع",

        dropdown_modes1 = {"حافلة", "أريكة"},
        dropdown_modes2 = {"حافلة", "أريكة", "قارب"},

        uptdplayer_button = "تحديث قائمة اللاعبين",
        teleporte_button = "الانتقال إلى اللاعب",
        teleporteC_button = "الانتقال إلى اللاعب مع السيارة",

        killplayer_toggle = "قتل اللاعب",
        pullplayer_toggle = "سحب اللاعب",
        flingplayer_toggle = "رمي اللاعب",
        spectar_toggle = "مراقبة اللاعب",

        antiseatV_toggle = "منع الجلوس: المركبات",
        antiseatT_toggle = "منع الجلوس: الأدوات",
        antiseatAll_toggle = "منع الجلوس: الكل"
      }

local Ferramenta = { 
        name = "أداة",
        section1 = "تجهيز الأداة",
        section2 = "تجهيز الأسلحة",
        section3 = "إضافة صوت السلاح عبر المعرف",
        section4 = "قائمة معرفات الصوت",
        ToolDropdownName = "أسماء الأدوات",
        ToolGunDropdownName = "أسماء الأسلحة",
        SoundIDDropdownName = "معرفات الصوت",
        SoundIDTextBoxName = "أدخل معرف الصوت",
        buttonEquip = "تجهيز العنصر",
        buttonPlay = "تشغيل الموسيقى",
        togglePlay = "تشغيل الموسيقى بشكل متكرر"
      }

local Cliente = {
        name = "العميل",
        section1 = "تصريح اللعبة",
        section2 = "سحب اللاعبين نحوك",
        section3 = "الاحتراق المستمر",
        button1 = "فتح تصريح موسيقى اللعبة",
        button2 = "سحب جميع اللاعبين",
        button3 = "احتراق الشخصية",
        slidefire = "حجم النار"
      }

local Mostrar = {
        name = "إسب",
        toggle1 = "إظهار اللاعب",
        toggle2 = "إظهار المركبة"
      }

local Creditos = { name = "الاعتمادات", descricao = "انضم إلى خادمي في Discord واشترك في قناتي على YouTube" }
      
      task.wait(0.5)
      
      getgenv().RaelHubScreenGuiLoad:Destroy()
      
      return House, Clothes, Car, Jogador, Trolar, Ferramenta, Cliente, Mostrar, Creditos
      
    end
end

return TranslationModule
