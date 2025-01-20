local CrafterSistema = {}

-- Função para teletransportar com verificação
local function teleportTo(part)
    if not part then
        warn("Parte para teleporte não encontrada.")
        return false
    end
    
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(part.Position)
        return true
    else
        warn("Falha ao teletransportar.")
        return false
    end
end

-- Função para acionar o ProximityPrompt com tentativa múltipla
local function fireProximityPromptWithRetry(proximityPrompt, maxRetries)
    local retries = 0
    while retries < maxRetries do
        if proximityPrompt then
            fireproximityprompt(proximityPrompt)
            wait(0.1)
        end
        retries = retries + 1
    end
end

function CrafterSistema.ComidaSystem(folder, comida)
    local pasta = folder
    local givers = pasta:FindFirstChild("Givers")
    if not givers or not givers:FindFirstChild(comida) then
        warn("Comida não encontrada:", comida)
        return
    end
    
    local Objeto = givers[comida]:FindFirstChild("Handle")
    if not Objeto then
        warn("Objeto não encontrado:", comida)
        return
    end
    
    if comida == "Cheese" then
        teleportTo(CFrame.new(-2692.0947265625, 968.2465209960938, -4912.32373046875))
    else
        teleportTo(Objeto)
    end
    
    wait(0.2)
    local proximityPrompt = Objeto:FindFirstChildOfClass("ProximityPrompt")
    if proximityPrompt then
        fireProximityPromptWithRetry(proximityPrompt, 3)
    else
        warn("ProximityPrompt não encontrado no objeto:", comida)
    end
end

function findPartWithProximityPrompt(parts)
    for _, part in ipairs(parts:GetChildren()) do
        local proximityPrompt = part:FindFirstChildOfClass("ProximityPrompt")
        if proximityPrompt then
            return part
        end
    end
    return nil
end

function CrafterSistema.Mesa1System(folder)
    local pasta = folder
    local parts = pasta.WoodenCounters:GetChildren()[19]
    
    local part = findPartWithProximityPrompt(parts)
    
    if part then
        if teleportTo(part) then
            wait(0.2)
            local proximityPrompt = part:FindFirstChildOfClass("ProximityPrompt")
            if proximityPrompt then
                fireProximityPromptWithRetry(proximityPrompt, 3)
            else
                warn("ProximityPrompt não encontrado em Mesa1System.")
            end
        end
    else
        warn("Nenhuma Part com ProximityPrompt encontrada em Mesa1System.")
    end
end

function CrafterSistema.Mesa2System(folder)
    local pasta = folder
    local parts = pasta.WoodenCounters:GetChildren()[24]
    
    local part = findPartWithProximityPrompt(parts)
    
    if part then
        if teleportTo(part) then
            wait(0.2)
            local proximityPrompt = part:FindFirstChildOfClass("ProximityPrompt")
            if proximityPrompt then
                fireProximityPromptWithRetry(proximityPrompt, 3)
            else
                warn("ProximityPrompt não encontrado em Mesa2System.")
            end
        end
    else
        warn("Nenhuma Part com ProximityPrompt encontrada em Mesa2System.")
    end
end

function CrafterSistema.MonstroSystem(folder)
    local pasta = folder
    local Objeto = pasta.TurnInFood:FindFirstChild("Detector")
    
    if teleportTo(CFrame.new(-2753.5341796875, 968.2463989257812, -4920.02978515625)) then
        wait(0.5)
        if Objeto then
            local proximityPrompt = Objeto:FindFirstChildOfClass("ProximityPrompt")
            if proximityPrompt then
                fireProximityPromptWithRetry(proximityPrompt, 3)
            else
                warn("ProximityPrompt não encontrado em MonstroSystem.")
            end
        else
            warn("Detector não encontrado em MonstroSystem.")
        end
    end
end

function CrafterSistema.FogaoSystem(folder)
    local pasta = folder
    local Objeto = pasta.Stoves:GetChildren()[3]:FindFirstChild("Detector")
    
    if teleportTo(Objeto) then
        wait(0.2)
        local proximityPrompt = Objeto:FindFirstChildOfClass("ProximityPrompt")
        if proximityPrompt then
            fireProximityPromptWithRetry(proximityPrompt, 3)
        else
            warn("ProximityPrompt não encontrado em FogaoSystem.")
        end
    end
end

function CrafterSistema.EncontrarPastaCooking()
    for _, pasta in ipairs(game.Workspace:GetChildren()) do
        if pasta:IsA("Folder") then
            for _, PastaCooking in ipairs(pasta:GetChildren()) do
                if PastaCooking:IsA("Folder") and PastaCooking.Name == "Cooking" then
                    print("Pasta 'Cooking' encontrada")
                    return PastaCooking
                end
            end
        end
    end
end

function CrafterSistema.CrafterChicken(folder)
    CrafterSistema.ComidaSystem(folder, "Pot")
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.ComidaSystem(folder, "Chicken")
    wait(0.2)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.ComidaSystem(folder, "Wrapped Meat")
    wait(0.2)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.ComidaSystem(folder, "Cheese")
    wait(0.2)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.FogaoSystem(folder)
    wait(10)
    CrafterSistema.ComidaSystem(folder, "Bowl")
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.FogaoSystem(folder)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.MonstroSystem(folder)
end

function CrafterSistema.CrafterHam(folder)
    CrafterSistema.ComidaSystem(folder, "Pot")
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.ComidaSystem(folder, "Ham")
    wait(0.2)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.ComidaSystem(folder, "Sausage")
    wait(0.2)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.Mesa1System(folder)
    CrafterSistema.FogaoSystem(folder)
    wait(10)
    CrafterSistema.ComidaSystem(folder, "Bowl")
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.FogaoSystem(folder)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.MonstroSystem(folder)
end

function CrafterSistema.CrafterEyeball(folder)
    CrafterSistema.ComidaSystem(folder, "Bowl")
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.ComidaSystem(folder, "Eyeball")
    wait(0.2)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.ComidaSystem(folder, "Spaghetti")
    wait(0.2)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.Mesa2System(folder)
    CrafterSistema.MonstroSystem(folder)
end

return CrafterSistema