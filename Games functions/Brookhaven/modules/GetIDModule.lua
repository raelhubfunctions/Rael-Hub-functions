local GetIdBrookHaven = {}

local LocalizationService = game:GetService("LocalizationService")

function GetPlayerLanguage()
  local result, code = pcall(function()
    return LocalizationService.RobloxLocaleId
  end)
  if result then
    return code:sub(1, 2)
  else
    return "en"
  end
end

local PlayerLanguage = GetPlayerLanguage()

GetIdBrookHaven.HeadPartsList = {
  ["Korblox"] = 139610147,
  ["Headless Horseman"] = 134082579,
  ["Frost Guard General"] = 139573061,
  ["Cheeks"] = 746767604,
  ["David bazooka"] = 15091383633,
  ["Amory"] = 15091931789,
  ["Jester Equinox"] = 2962659137,
  ["Steampunk Robot"] = 4908014528,
  ["Ud'zal"] = 15366383339,
  ["Magma Fiend"] = 12726967427,
  ["Mr. Toilet"] = 4416630203
}

GetIdBrookHaven.LeftArmPartsList = {
  ["Korblox"] = 139607570,
  ["Headless Horseman"] = 134082453,
  ["Frost Guard General"] = 139572600,
  ["David bazooka"] = 4416785861,
  ["Amory"] = 2831353698,
  ["Jester Equinox"] = 2962661848,
  ["Zumbi"] = 37754607,
  ["Pirate"] = 27847412,
  ["Skeleton"] = 36781447,
  ["Penguin"] = 46359095,
  ["Steampunk Robot"] = 4908007367,
  ["Ud'zal"] = 3333096407,
  ["Magma Fiend"] = 2608534881,
  ["Mr. Toilet"] = 4416456281
}

GetIdBrookHaven.RigthArmPartsList = {
  ["Korblox"] = 139607625,
  ["Headless Horseman"] = 134082473,
  ["Frost Guard General"] = 139572697,
  ["David bazooka"] = 4416788553,
  ["Amory"] = 2831355047,
  ["Jester Equinox"] = 2962663610,
  ["Zumbi"] = 37754562,
  ["Pirate"] = 27847382,
  ["Skeleton"] = 36781407,
  ["Penguin"] = 46359040,
  ["Steampunk Robot"] = 4908010631,
  ["Ud'zal"] = 3333102326,
  ["Magma Fiend"] = 2608537440,
  ["Mr. Toilet"] = 4416609175
}

GetIdBrookHaven.TorsoPartsList = {
  ["Korblox"] = 139607770,
  ["Headless Horseman"] = 134082557,
  ["Frost Guard General"] = 139572973,
  ["David bazooka"] = 4416793922,
  ["Amory"] = 2831357250,
  ["Jester Equinox"] = 2962665090,
  ["Zumbi"] = 37754511,
  ["Pirate"] = 27847359,
  ["Skeleton"] = 36781360,
  ["Penguin"] = 46358991,
  ["Steampunk Robot"] = 4908013767,
  ["Ud'zal"] = 3333104378,
  ["Magma Fiend"] = 2608539495,
  ["Mr. Toilet"] = 4416616726
}

GetIdBrookHaven.LeftLegPartsList = {
  ["Korblox"] = 139607673,
  ["Headless Horseman"] = 134082507,
  ["Frost Guard General"] = 139572789,
  ["David bazooka"] = 4416780826,
  ["Amory"] = 2831355934,
  ["Jester Equinox"] = 2962662653,
  ["Zumbi"] = 37754646,
  ["Pirate"] = 27847445,
  ["Skeleton"] = 36781481,
  ["Penguin"] = 46359181,
  ["Steampunk Robot"] = 4908008480,
  ["Ud'zal"] = 3333101194,
  ["Magma Fiend"] = 2608536258,
  ["Mr. Toilet"] = 4416605868
}

GetIdBrookHaven.RightLegPartsList = {
  ["Korblox"] = 139607718,
  ["Headless Horseman"] = 134082533,
  ["Frost Guard General"] = 139572888,
  ["David bazooka"] = 4416791577,
  ["Amory"] = 2831356536,
  ["Jester Equinox"] = 2962664429,
  ["Zumbi"] = 37754710,
  ["Pirate"] = 27847473,
  ["Skeleton"] = 36781518,
  ["Penguin"] = 46359241,
  ["Steampunk Robot"] = 4908012938,
  ["Ud'zal"] = 3333103459,
  ["Magma Fiend"] = 2608538559,
  ["Mr. Toilet"] = 4416612954
}

GetIdBrookHaven.GetDominusIds = {
  ["Dominus Empyreus"] = 21070012,
  ["Dominus Infernus"] = 31101391,
  ["Dominus Frigidus"] = 48545806,
  ["Dominus Messor"] = 64444871,
  ["Dominus Vespertilio"] = 96103379,
  ["Dominus Áureo"] = 18218678061,
  ["Dominus Astra"] = 162067148,
  ["Dominus Rex"] = 250395631,
  ["Dominus Pittacium"] = 335080779,
  ["Dominus Praefectus"] = 527365852,
  ["Dominus Venari"] = 1483720409,
  ["Dominus Claves"] = 1483721076,
  ["Deadly Dark Dominus"] = 3154654707,
  ["Dominus Formidulosus"] = 4255053867,
  ["Dominus Desperationis"] = 14565909491,
  ["Dominus Azurelight"] = 14565851673
}

GetIdBrookHaven.GetSongItensList = {
  ["Brighteyes Bloxy Glue Hat"] = 24114402,
  ["Brighteyes' Witches Brew Hat"] = 305888394,
  ["Telamon Chicken Costume"] = 24112667,
  ["Temporary Harmonic"] = 33070696
}

GetIdBrookHaven.GetValkyrieIds = {
  Valkyrie_Helm = 1365767,
  Blackvalk = 124730194,
  Festive_Sword_Valkyrie = 189963816,
  Tixvalk = 382881237,
  Orinthian_Valkyrie = 928840419,
  Sparkle_Time_Valkyrie = 1180433861,
  Violet_Valkyrie = 1402432199,
  Redvalk = 2274774123,
  Sinister_Valk = 2738532568,
  Emerald_Valkyrie = 2830437685,
  Summer_Valk = 3756522670,
  Ice_Valkyrie = 4390891467,
  Valkyrie_of_the_Metaverse = 6845626233,
  Valiant_Valkyrie_of_Testing = 7781687598,
  Hallowis_Valk = 15054110920,
  Timeless_Valkyrie_Helm = 17517206952
}

GetIdBrookHaven.GetFairyIds = {
  Fall_Fairy = 128217885,
  Winter_Fairy = 141742418,
  St_Patrick_is_Day_Fairy = 226189871,
  Spring_Fairy = 150381051
}

GetIdBrookHaven.GetSparkleTimeFedoraIds = {
  Yellow_Sparkle_Time_Fedora = 1285307,
  Purple_Sparkle_Time_Fedora = 63043890,
  Red_Sparkle_Time_Fedora = 72082328,
  Green_Sparkle_Time_Fedora = 100929604,
  Midnight_Blue_Sparkle_Time_Fedora = 119916949,
  Teal_Sparkle_Time_Fedora = 147180077,
  Orange_Sparkle_Time_Fedora = 215751161,
  Black_Sparkle_Time_Fedora = 259423244,
  Pink_Sparkle_Time_Fedora = 334663683,
  Sky_Blue_Sparkle_Time_Fedora = 493476042,
  White_Sparkle_Time_Fedora = 1016143686,
  Bluesteel_Fedora = 98346834
}

GetIdBrookHaven.GetClothes3dIds = {
  ["Chinelo Adidas"] = 13336755067,
  ["Chinelo Preto"] = 13336738534,
  ["Chinelo Branco"] = 13336764113,
  ["Garras de Anime Branco"] = 14942141376,
  ["Garras de Anime Negras"] = 15153876013,
  ["Machado de 8 bits azul"] = 14055019006,
  ["Tung Tung Sahur"] = 116926833176436,
  ["Galinha do mine"] = 91756266312256,
  ["Terno de Sid"] = 87442757321244,
  ["Shrek Wazowski"] = 83299976508675,
  ["Rato Dançando Meme"] = 86990565981438,
  ["Traje de Rato Fofo Triste"] = 16844527194,
  ["Terno de frango"] = 16883061747
}

GetIdBrookHaven.GetGunsNames = {
  ["Glock"] = "Glock",
  ["GlockBrown"] = "GlockBrown",
  ["Shotgun"] = "Shotgun",
  ["Assault"] = "Assault",
  ["Sniper"] = "Sniper"
}

GetIdBrookHaven.GetToolsNames = {
  ["Couch"] = "Couch",
  ["Glock"] = "Glock",
  ["GlockBrown"] = "GlockBrown",
  ["Shotgun"] = "Shotgun",
  ["Assault"] = "Assault",
  ["Sniper"] = "Sniper"
}

GetIdBrookHaven.GetHandItemsIds = {
  ["Urrible Teddy Bear"] = 3339372724,
  ["Spell Magnate's Staff"] = 3210526113,
  ["Oinan Steelhoof – Axe"] = 3240543366
}

GetIdBrookHaven.GetSoundGunID = {
  
  ["OoOoOOO"] = 9084006093,
  ["AHHHHH"] = 7772283448,
  ["BRUHH"] = 6349641063,
  ["Wet Fart"] = 6445594239,
  ["Minecraft XP"] = 6647877129,
  ["Pipe"] = 6729922069,
  ["Toma jack"] = 132603645477541,
  ["Sai daí, lava prato"] = 101232400175829,
  ["I ghost the down cool"] = 84663543883498,
  ["Pede ifood, pede"] = 133843750864059,
  ["Cérebro burro"] = 82284055473737
  
}

return GetIdBrookHaven
