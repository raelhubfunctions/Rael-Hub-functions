local RaelHubFisch = {}

function RaelHubFisch.AutoCollectCrabCage(state)
  getgenv().RaelHubAutoCollectCrabCage = state
  while getgenv().RaelHubAutoCollectCrabCage do
    local Active = workspace:FindFirstChild("active")

    if Active then
      for _, Crab in ipairs(Active:GetChildren()) do
        if Crab:IsA("Model") then
          local cage = Crab:FindFirstChild("Cage")
          if cage then
            local BasePart = Crab:FindFirstChild("handle")
            local prompt = Crab:FindFirstChild("Prompt")
            if prompt and prompt.Enabled == true then
              while getgenv().RaelHubAutoCollectCrabCage and Crab.Parent do   
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BasePart.Position)
                task.wait(0.5)
                fireproximityprompt(prompt)
              end
            end
          end
        end
      end
    end
    task.wait(1)
  end
end

function RaelHubFisch.DisableOxygenScript(State)
  local YourPlayer = game.Players.LocalPlayer.Character
  local Client = YourPlayer:FindFirstChild("client")
  if Client then
    local Oxygen = Client:FindFirstChild("oxygen")
    if Oxygen then
      Oxygen.Enabled = not State
    end
  end
end

function RaelHubFisch.AutoTreasure(Value)
  getgenv().RaelHubAutoTesouro = Value
  function AutoDoTreasure()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2829.510009765625, 215.21519470214844, 1516.152099609375)
 
    while true do
      local Jack_Marrow = workspace.world.npcs:FindFirstChild("Jack Marrow")
      if Jack_Marrow then
        local Treasure = Jack_Marrow:FindFirstChild("treasure")
        if Treasure then
          local Repairmap = Treasure:FindFirstChild("repairmap")
          if Repairmap then
            task.wait(0.5)
            Repairmap:InvokeServer()
            break
          end
        end
      end
      task.wait()
    end
    task.wait(0.5)
    for _, Bau in ipairs(workspace.world.chests:GetChildren()) do
      if Bau:FindFirstChild("ChestClosed") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Bau.Position)
        task.wait(0.5)
        fireproximityprompt(Bau.ProximityPrompt)
      end
    end
  end
  while getgenv().RaelHubAutoTesouro do
    local Chests = workspace.world:FindFirstChild("chests")
    if Chests and #Chests:GetChildren() > 0 then
      local BauValue = false
      for _, Bau in ipairs(Chests:GetChildren()) do
        if Bau:FindFirstChild("ChestClosed") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Bau.Position)
          task.wait(0.5)
          fireproximityprompt(Bau.ProximityPrompt)
        end
      end
    end
    local MapBackPack = game.Players.LocalPlayer.Backpack:FindFirstChild("Treasure Map")
    local MapObject = game.Players.LocalPlayer.Character:FindFirstChild("Treasure Map")
    if MapBackPack and not MapObject then
      game.Players.LocalPlayer.Character.Humanoid:EquipTool(MapBackPack)
      task.wait(0.5)
      local PlayerPositionNow = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
      AutoDoTreasure()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PlayerPositionNow)
    elseif MapObject then
      local PlayerPositionNow = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
      AutoDoTreasure()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PlayerPositionNow)
    end
    task.wait(1)
  end
end

function RaelHubFisch.FishingRodSystem()
  local BackPack = game:GetService("Players").LocalPlayer:FindFirstChild("Backpack")

  for _, vara in ipairs(BackPack:GetChildren()) do
    local Events = vara:FindFirstChild("events")
    if Events then
      local Cast = Events:FindFirstChild("cast")
      if Cast then
        getgenv().RaelHubRodEquipedValue = tostring(vara)
      end
    end
  end

  BackPack.ChildAdded:Connect(function(Vara)
    for _, vara in ipairs(BackPack:GetChildren()) do
      local Events = vara:FindFirstChild("events")
      if Events then
        local Cast = Events:FindFirstChild("cast")
        if Cast then
          getgenv().RaelHubRodEquipedValue = tostring(vara)
        end
      end
    end
  end)

  BackPack.ChildRemoved:Connect(function(Vara)
    for _, vara in ipairs(BackPack:GetChildren()) do
      local Events = vara:FindFirstChild("events")
      if Events then
        local Cast = Events:FindFirstChild("cast")
        if Cast then
          getgenv().RaelHubRodEquipedValue = tostring(vara)
        end
      end
    end
  end)

  local DetectorReset
  DetectorReset = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and method == "FireServer" and tostring(self) == "reset" then
      if getgenv().RaelHubAutoFischValue then
        task.spawn(function()
          task.wait(1)
          local rodName = getgenv().RaelHubRodEquipedValue
          local rod = game:GetService("Players").LocalPlayer.Character:FindFirstChild(rodName)

          if rod and rod:FindFirstChild("events") and rod.events:FindFirstChild("cast") then
              local castEvent = rod.events.cast
              local args = {
                [1] = 100,
                [2] = 1
              }
              castEvent:FireServer(unpack(args))
          
          end
        end)
      end
    end
    return DetectorReset(self, ...)
  end)
end

function RaelHubFisch.SellFishSelected()
  local PlayerPositionNow = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2511.5849609375, 135.79074096679688, 1582.5435791015625)
  task.wait(0.5)
  while true do
    local Marytn_Merchant = workspace.world.npcs:FindFirstChild("Marytn Merchant")
    if Marytn_Merchant then
      local Merchant = Marytn_Merchant:FindFirstChild("merchant")
      if Merchant then
        local Sell = Merchant:FindFirstChild("sell")
        if Sell then
          task.wait(1)
          Sell:InvokeServer()
            break
        end
      end
    end
    task.wait()
  end
  task.wait(0.5)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PlayerPositionNow)
end

function RaelHubFisch.SellAllFish()
  local PlayerPositionNow = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2511.5849609375, 135.79074096679688, 1582.5435791015625)
  task.wait(0.5)
  while true do
    local Marytn_Merchant = workspace.world.npcs:FindFirstChild("Marytn Merchant")
    if Marytn_Merchant then
      local Merchant = Marytn_Merchant:FindFirstChild("merchant")
      if Merchant then
        local Sellall = Merchant:FindFirstChild("sellall")
        if Sellall then
          task.wait(1)
          Sellall:InvokeServer()
            break
        end
      end
    end
    task.wait()
  end
  task.wait(0.5)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PlayerPositionNow)
end
RaelHubFisch.FishingArea = {
  Ancient_Waterfall = function()
    
    local position = Vector3.new(5800.4091796875, 135.3014678955078, 406.3511657714844)
    local rotation = Vector3.new(0, -65.072998046875, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  end,
  Ancient_Isles = function()
    
    local position = Vector3.new(5454.9765625, 138.4757080078125, -315.81341552734375)
    local rotation = Vector3.new(-179.99099731445312, 10.02400016784668, 179.99899291992188)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
    

  end,
  Ancient_Archives = function()
    
    local position = Vector3.new(-3057.473876953125, -777.9583740234375, 1890.9439697265625)
    local rotation = Vector3.new(180, 79.9010009765625, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))


  end,
  Ancient_Pond = function()
    
    local position = Vector3.new(6038.2939453125, 196.474609375, 333.2248840332031)
    local rotation = Vector3.new(179.99899291992188, 73.61599731445312, -179.99899291992188)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))


  end,
  Mushgrove_Swamp = function()
    local position = Vector3.new(2685.083740234375, 132.49908447265625, -731.6041870117188)
    local rotation = Vector3.new(180, 38.22100067138672, 180)
    
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
    
  
  end,
  Statue_Of_Sovereignhty = function()
    local position = Vector3.new(74.63957214355469, 141.92999267578125, -1027.432373046875)
    local rotation = Vector3.new(180, -54.56399917602539, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
    
  end,
  Terrapin_Island = function()
    local position = Vector3.new(-206.06219482421875, 132.50001525878906, 1928.44140625)
    local rotation = Vector3.new(0, 82.13200378417969, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
    
  end,
  Snowcaps_Island = function()
    local position = Vector3.new(2547.140380859375, 134.92489624023438, 2385.06640625)
    local rotation = Vector3.new(0, 56.650001525878906, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  end,
  SunsStone_Island = function()
    local position = Vector3.new(-836.9609985351562, 133.17218017578125, -1154.4503173828125)
    local rotation = Vector3.new(180, -68.43299865722656, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
  end,
  Brine_Pool = function()
    local position = Vector3.new(-1772.36279296875, -142.69313049316406, -3435.273193359375)
    local rotation = Vector3.new(0, -53.72700119018555, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  end,
  Keepers_Altas = function()
    local position = Vector3.new(1421.5670166015625, -834.7742919921875, -247.43807983398438)
    local rotation = Vector3.new(180, -62.935001373291016, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  end,
  Roslit_Volcano = function()
    local position = Vector3.new(-1995.8079833984375, 156.07608032226562, 257.9688720703125)
    local rotation = Vector3.new(180, 73.04299926757812, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  end,
  Desolate_Deep = function()
    local position = Vector3.new(-1504.619140625, -234.71902465820312, -2863.5224609375)
    local rotation = Vector3.new(0, -53.18299865722656, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  
  end,
  Colossal_Squid = function()
    local position = Vector3.new(2819.313232421875, 130.4823760986328, 2690.485595703125)
    local rotation = Vector3.new(0, -65.89700317382812, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  
  end,
  Ocean = function()
    local position = Vector3.new(-1397.56787109375, 133.77084350585938, 756.482421875)
    local rotation = Vector3.new(180, -57.244998931884766, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  
  end,
  Vertigo = function()
    local position = Vector3.new(-111.54090118408203, -733.3721313476562, 1211.3763427734375)
    local rotation = Vector3.new(180, 49.948001861572266, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))


  end,
  Roslit_Bay = function()
    local position = Vector3.new(-1397.56787109375, 133.77084350585938, 756.482421875)
    local rotation = Vector3.new(180, -57.244998931884766, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

  end,
  Moosewood = function()
    local position = Vector3.new(285.14703369140625, 133.61595153808594, 215.8972930908203)
    local rotation = Vector3.new(180, 89.21800231933594, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
  end,
  The_Depths = function()
    
    local position = Vector3.new(939.510009765625, -738.0830688476562, 1457.8468017578125)
    local rotation = Vector3.new(180, 6.980999946594238, 180)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

    
  end,
  Captain_Goldfish = function()
    
    local position = Vector3.new(-2678.404296875, 170.4841766357422, 1742.462158203125)
    local rotation = Vector3.new(178.9949951171875, 72.47200012207031, -179.13400268554688)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))

    
  end,
  Forsaken_Shores = function()
    local position = Vector3.new(-2483.699951171875, 133.65463256835938, 1469.519287109375)
    local rotation = Vector3.new(0, -41.869998931884766, 0)

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
  end,
  None = function()
    print("You can fish as much as you want")
  end,
}

RaelHubFisch.TeleportSpots = {
  Northern = CFrame.new(19535.4453125, 132.67010498046875, 5293.35546875),
  the_detphs_maze_exit = CFrame.new(978.142822265625, -701.1101684570312, 1253.7423095703125),
  the_detphs_sentence = CFrame.new(11.46270751953125, -706.1237182617188, 1230.847900390625),
  forsaken_Shores = CFrame.new(-2515.0400390625, 135.79074096679688, 1576.5709228515625),
  altar = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
  arch = CFrame.new(998.966796875, 126.6849365234375, -1237.1434326171875),
  birch = CFrame.new(1742.3203125, 138.25787353515625, -2502.23779296875),
  brine = CFrame.new(-1794.10596, -145.849701, -3302.92358, -5.16176224e-05, 3.10316682e-06, 0.99999994, 0.119907647, 0.992785037, 3.10316682e-06, -0.992785037, 0.119907647, -5.16176224e-05),
  deep = CFrame.new(-1510.88672, -237.695053, -2852.90674, 0.573604643, 0.000580655003, 0.81913209, -0.000340352941, 0.999999762, -0.000470530824, -0.819132209, -8.89541116e-06, 0.573604763),
  deepshop = CFrame.new(-979.196411, -247.910156, -2699.87207, 0.587748766, 0, 0.809043527, 0, 1, 0, -0.809043527, 0, 0.587748766),
  enchant = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
  executive = CFrame.new(-29.836761474609375, -250.48486328125, 199.11614990234375),
  keepers = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
  mod_house = CFrame.new(-30.205902099609375, -249.40594482421875, 204.0529022216797),
  moosewood = CFrame.new(383.10113525390625, 131.2406005859375, 243.93385314941406),
  mushgrove = CFrame.new(2501.48583984375, 127.7583236694336, -720.699462890625),
  roslit = CFrame.new(-1476.511474609375, 130.16842651367188, 671.685302734375),
  snow = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
  snowcap = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
  spike = CFrame.new(-1254.800537109375, 133.88555908203125, 1554.2021484375),
  statue = CFrame.new(72.8836669921875, 138.6964874267578, -1028.4193115234375),
  sunstone = CFrame.new(-933.259705, 128.143951, -1119.52063, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685),
  swamp = CFrame.new(2501.48583984375, 127.7583236694336, -720.699462890625),
  terrapin = CFrame.new(-143.875244140625, 141.1676025390625, 1909.6070556640625),
  trident = CFrame.new(-1479.48987, -228.710632, -2391.39307, 0.0435845852, 0, 0.999049723, 0, 1, 0, -0.999049723, 0, 0.0435845852),
  vertigo = CFrame.new(-112.007278, -492.901093, 1040.32788, -1, 0, 0, 0, 1, 0, 0, 0, -1),
  volcano = CFrame.new(-1888.52319, 163.847565, 329.238281, 1, 0, 0, 0, 1, 0, 0, 0, 1),
  wilson = CFrame.new(2938.80591, 277.474762, 2567.13379, 0.4648332, 0, 0.885398269, 0, 1, 0, -0.885398269, 0, 0.4648332),
  wilsons_rod = CFrame.new(2879.2085, 135.07663, 2723.64233, 0.970463336, -0.168695927, -0.172460333, 0.141582936, -0.180552125, 0.973321974, -0.195333466, -0.968990743, -0.151334763),
  arcient_Isle = CFrame.new(6071.46044921875, 194.98016357421875, 314.3388671875)
}

RaelHubFisch.TeleportNPCS = {

    Witch = CFrame.new(409.638092, 134.451523, 311.403687, -0.74079144, 0, 0.671735108, 0, 1, 0, -0.671735108, 0, -0.74079144),
    Quiet_Synph = CFrame.new(566.263245, 152.000031, 353.872101, -0.753558397, 0, -0.657381535, 0, 1, 0, 0.657381535, 0, -0.753558397),
    Pierre = CFrame.new(391.38855, 135.348389, 196.712387, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Phineas = CFrame.new(469.912292, 150.69342, 277.954987, 0.886104584, -0, -0.46348536, 0, 1, -0, 0.46348536, 0, 0.886104584),
    Paul = CFrame.new(381.741882, 136.500031, 341.891022, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Shipwright = CFrame.new(357.972595, 133.615967, 258.154541, 0, 0, -1, 0, 1, 0, 1, 0, 0),
    Angler = CFrame.new(480.102478, 150.501053, 302.226898, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    Marc = CFrame.new(466.160034, 151.00206, 224.497086, -0.996853352, 0, -0.0792675018, 0, 1, 0, 0.0792675018, 0, -0.996853352),
    Lucas = CFrame.new(449.33963, 181.999893, 180.689072, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    Latern_Keeper = CFrame.new(-39.0456772, -246.599976, 195.644363, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Latern_Keeper2 = CFrame.new(-17.4230175, -304.970276, -14.529892, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    Inn_Keeper = CFrame.new(487.458466, 150.800034, 231.498932, -0.564704418, 0, -0.825293183, 0, 1, 0, 0.825293183, 0, -0.564704418),
    Roslit_Keeper = CFrame.new(-1512.37891, 134.500031, 631.24353, 0.738236904, 0, -0.674541533, 0, 1, 0, 0.674541533, 0, 0.738236904),
    FishingNpc_1 = CFrame.new(-1429.04138, 134.371552, 686.034424, 0, 0.0168599077, -0.999857903, 0, 0.999857903, 0.0168599077, 1, 0, 0),
    FishingNpc_2 = CFrame.new(-1778.55408, 149.791779, 648.097107, 0.183140755, 0.0223737024, -0.982832015, 0, 0.999741018, 0.0227586292, 0.983086705, -0.00416803267, 0.183093324),
    FishingNpc_3 = CFrame.new(-1778.26807, 147.83165, 653.258606, -0.129575253, 0.501478612, 0.855411887, -2.44146213e-05, 0.862683058, -0.505744994, -0.991569638, -0.0655529201, -0.111770131),
    Henry = CFrame.new(483.539307, 152.383057, 236.296143, -0.789363742, 0, 0.613925934, 0, 1, 0, -0.613925934, 0, -0.789363742),
    Daisy = CFrame.new(581.550049, 165.490753, 213.499969, -0.964885235, 0, -0.262671858, 0, 1, 0, 0.262671858, 0, -0.964885235),
    Appraiser = CFrame.new(453.182373, 150.500031, 206.908783, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    Jack_Marrow = CFrame.new(-2829.510009765625, 215.21527099609375, 1516.150146484375),
    Cort = CFrame.new(-2511.5849609375, 135.79074096679688, 1582.5435791015625),
    Mod_Keeper = CFrame.new(-39.0905838, -245.141144, 195.837891, -0.948549569, -0.0898146331, -0.303623199, -0.197293222, 0.91766715, 0.34490931, 0.247647122, 0.387066364, -0.888172567),
    Ashe = CFrame.new(-1709.94055, 149.862411, 729.399536, -0.92290163, 0.0273250472, -0.384064913, 0, 0.997478604, 0.0709675401, 0.385035753, 0.0654960647, -0.920574605),
    Alfredrickus = CFrame.new(-1520.60632, 142.923264, 764.522034, 0.301733732, 0.390740901, -0.869642735, 0.0273988936, 0.908225596, 0.417582989, 0.952998459, -0.149826124, 0.26333645),
    Meteoriticist = CFrame.new(5922.65625, 261.9778747558594, 594.5787963867188),
    Shipwright = CFrame.new(5866.82373046875, 143.49661254882812, 9.936059951782227)
}

RaelHubFisch.TeleportsItens = {
  Sundial_Totem = CFrame.new(-1149.4296875, 136.8978729248047, -1077.2891845703125),
  Aurora_Totem = CFrame.new(-1813.074951171875, -136.9279327392578, -3281.102294921875),
  Tempest_Totem = CFrame.new(36.451210021972656, 135.41331481933594, 1946.019287109375),
  Smokescreen_Totem = CFrame.new(2791.48388671875, 139.67677307128906, -629.5872192382812),
  Bait_Crate = CFrame.new(-1051.33154296875, 203.14059448242188, -1099.1392822265625),
  Quality_Bait_Crate = CFrame.new(-174.5283966064453, 143.30850219726562, 1935.2476806640625),
  Crab_Cage = CFrame.new(-1487.75732421875, 133.35275268554688, 635.1741943359375),
  Fish_Radar = CFrame.new(366.99005126953125, 137.00001525878906, 276.0728759765625),
  GPS = CFrame.new(514.9971923828125, 150.89993286132812, 282.6951904296875),
  Basic_Diving_Gear = CFrame.new(-1653.477294921875, -212.65240478515625, -2823.486572265625),
  Advanced_Diving_Gear = CFrame.new(-978.9635009765625, -242.51019287109375, -2687.447509765625),
  Tidebreaker = CFrame.new(-1639.45947265625, -213.67945861816406, -2849.58203125),
  Flippers = CFrame.new(-1639.45947265625, -213.67945861816406, -2849.58203125),
  Super_Flippers = CFrame.new(-970.062744140625, -244.91510009765625, -2696.084716796875),
  Glider = CFrame.new(-1637.8697509765625, -211.32920837402344, -2859.380126953125),
  Coral_Geode = CFrame.new(-1644.2064208984375, -213.679443359375, -2848.64990234375),
  Conception_Conch = CFrame.new(-1632.965087890625, -213.67941284179688, -2860.5),
  Eclipse_Totem = CFrame.new(5967.33203125, 274.1360778808594, 839.1844482421875),
  Meteoro_Totem = CFrame.new(-1948, 275.3567199707031, 230)
}

RaelHubFisch.TeleportsRods = {
  Training_Rod =  CFrame.new(457.701171875, 150.5010223388672, 230.80340576171875),
  Plastic_Rod = CFrame.new(454.3351135253906, 150.90122985839844, 229.50869750976562),
  Carbon_Rod = CFrame.new(453.86956787109375, 151.00904846191406, 225.4403533935547),
  Fast_Rod = CFrame.new(453.962646484375, 151.83743286132812, 226.67315673828125),
  Lucky_Rod = CFrame.new(446.0989074707031, 150.50001525878906, 222.30819702148438),
  Long_Rod = CFrame.new(486.8112487792969, 174.50001525878906, 145.0164031982422),
  Steady_Rod = CFrame.new(-1511.3436279296875, 142.1073455810547, 760.0213012695312),
  Fortune_Rod = CFrame.new(-1521.318359375, 141.79971313476562, 771.779296875),
  Rapid_Rod = CFrame.new(-1509.29296875, 142.45596313476562, 759.9772338867188),
  Nocturnal_Rod = CFrame.new(-141.86985778808594, -514.8735961914062, 1139.127197265625),
  Aurora_Rod = CFrame.new(-144.52243041992188, -513.2681884765625, 1129.6273193359375),
  Rod_of_The_Depths = CFrame.new(1705.1605224609375, -902.489990234375, 1448.060546875),
  Magnet_Rod = CFrame.new(-195.9535675048828, 132.50001525878906, 1931.5823974609375),
  Kings_Rod = CFrame.new(1376.0523681640625, -809.552734375, -303.6128234863281),
  Reinforced_Rod = CFrame.new(-986.000244140625, -242.5101776123047, -2689.334716796875),
  Trident_Rod = CFrame.new(-1482.8294677734375, -223.5010223388672, -2194.683837890625),
  Scurvy_Rod = CFrame.new(-2827.561279296875, 215.02590942382812, 1513.1224365234375),
  Relic_Rod = CFrame.new(4096.28271484375, 40.02178192138672, 24.718124389648438),
  Phoenix_Rod = CFrame.new(5970.1953125, 272.317626953125, 852.5142211914062)
}



return RaelHubFisch