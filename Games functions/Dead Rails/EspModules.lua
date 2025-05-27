local Workspace = game:GetService("Workspace")
local EspModules = {}
local RaelHubFunction = shared.RaelHubFunction

function EspModules.EspEntities(value)
    getgenv().EspEntities = value

    while getgenv().EspEntities do
      local NightEnemies = workspace:FindFirstChild("NightEnemies")
      local RuntimeEntities = workspace:FindFirstChild("RuntimeEntities")
      local RuntimeItems = workspace:FindFirstChild("RuntimeItems")
      local ZombiePart = workspace:FindFirstChild("ZombiePart", true)

      if NightEnemies then
        for _, entitie in ipairs(NightEnemies:GetChildren()) do
          RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
        end
      end

      if RuntimeEntities then
        for _, entitie in ipairs(RuntimeEntities:GetChildren()) do
          RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
        end
      end

      if RuntimeItems then
        for _, entitie in ipairs(RuntimeItems:GetChildren()) do
          if entitie.Name == "Model_Runner" then
            RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
          elseif entitie.Name == "Model_Werewolf" then
            RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
          elseif entitie.Name == "Model_Banker" then
            RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
          elseif entitie.Name == "Model_ZombieSheriff" then
            RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
          elseif entitie.Name == "Model_Walker" then
            RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
          end
        end
      end
      
      if ZombiePart then
        local Zombies = ZombiePart:FindFirstChild("Zombies")
        if Zombies then
          for _, zombie in ipairs(Zombies:GetChildren()) do
            
            RaelHubFunction.CreateEspDistance(zombie, Color3.fromRGB(244, 0, 0), zombie.Name, true)
            
          end
        end
      end
      

      for _, ModelBaseplate in ipairs(workspace.Baseplates:GetChildren()) do
          if ModelBaseplate:IsA("Model") then
              local Animals = ModelBaseplate:FindFirstChild("Animals", true)
              if Animals then
                for _, entitie in ipairs(Animals:GetChildren()) do
                  if entitie and entitie:IsA("Model") and entitie.Name == "Model_Wolf" then
                    RaelHubFunction.CreateEspDistance(entitie, Color3.fromRGB(244, 0, 0), entitie.Name, true)
                  end
                end
              end
          end
      end
      task.wait(0.1)
    end
    
    
    -- Desativar esp
    local NightEnemies = workspace:FindFirstChild("NightEnemies")
    local RuntimeEntities = workspace:FindFirstChild("RuntimeEntities")
    local RuntimeItems = workspace:FindFirstChild("RuntimeItems")
    local ZombiePart = workspace:FindFirstChild("ZombiePart", true)
    if NightEnemies then
      for _, entitie in ipairs(NightEnemies:GetChildren()) do
        RaelHubFunction.DisableEsp(entitie)
      end
    end

    if ZombiePart then
      local Zombies = ZombiePart:FindFirstChild("Zombies")
      if Zombies then
        for _, zombie in ipairs(Zombies:GetChildren()) do
          
          RaelHubFunction.DisableEsp(zombie)
          
        end
      end
    end

    if RuntimeEntities then
      for _, entitie in ipairs(RuntimeEntities:GetChildren()) do
        RaelHubFunction.DisableEsp(entitie)
      end
    end

    if RuntimeItems then
      for _, entitie in ipairs(RuntimeItems:GetChildren()) do
        if entitie.Name == "Model_Runner" then
          RaelHubFunction.DisableEsp(entitie)
        elseif entitie.Name == "Model_Werewolf" then
          RaelHubFunction.DisableEsp(entitie)
        elseif entitie.Name == "Model_Banker" then
          RaelHubFunction.DisableEsp(entitie)
        elseif entitie.Name == "Model_ZombieSheriff" then
          RaelHubFunction.DisableEsp(entitie)
        elseif entitie.Name == "Model_Walker" then
          RaelHubFunction.DisableEsp(entitie)
        end
      end
    end

    for _, ModelBaseplate in ipairs(workspace.Baseplates:GetChildren()) do
        if ModelBaseplate:IsA("Model") then
            local Animals = ModelBaseplate:FindFirstChild("Animals", true)
            if Animals then
              for _, entitie in ipairs(Animals:GetChildren()) do
                if entitie and entitie:IsA("Model") and entitie.Name == "Model_Wolf" then
                  RaelHubFunction.DisableEsp(entitie)
                end
              end
            end
        end
    end

end

function EspModules.Espitens(value)

    getgenv().EspItens = value
    
    while getgenv().EspItens do
      local RuntimeItems = workspace:FindFirstChild("RuntimeItems")
      if RuntimeItems then
        for _, item in ipairs(RuntimeItems:GetChildren()) do
          if item.Name == "GoldBar" then
            RaelHubFunction.CreateEspDistance(item, Color3.fromRGB(251, 246, 0), item.Name, true)
          elseif item.Name == "SilverBar" then
            RaelHubFunction.CreateEspDistance(item, Color3.fromRGB(241, 241, 241), item.Name, true)
          elseif item.Name ~= "GoldBar" and item.Name ~= "Model_Runner" and item.Name ~= "SilverBar" then
            RaelHubFunction.CreateEspDistance(item, Color3.fromRGB(0, 230, 251), item.Name, true)
          elseif item:GetAttribute("rael") then
            RaelHubFunction.DisableEsp(item)
          end
        end
      end
      task.wait()
    end

    local RuntimeItems = workspace:FindFirstChild("RuntimeItems")
    if RuntimeItems then
      for _, item in ipairs(RuntimeItems:GetChildren()) do
        if item.Name ~= "Model_Runner" then
          RaelHubFunction.DisableEsp(item)
        end
      end
    end
end

return EspModules
