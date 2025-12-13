local _env = getgenv()
local badExecutors = {"Xeno", "Solara"}
local execName, exeVersion = (_env.identifyexecutor or function() return "Solara", "version?" end)()
local placeId = game.PlaceId
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")

local placaIdFunctions = {

    ["8056702588"] = {

        Active = function()

            local playerScripts = PlayerGui:FindFirstChild("PlayerScripts")
            local cameraScript = (playerScripts and playerScripts:FindFirstChild("Camera"))
            if not cameraScript then return end

            cameraScript.Enabled = false

        end,

        Disabled = function()

            local playerScripts = PlayerGui:FindFirstChild("PlayerScripts")
            local cameraScript = (playerScripts and playerScripts:FindFirstChild("Camera"))
            if not cameraScript then return end

            cameraScript.Enabled = true

        end

    }

}

if _env.fireproximityprompt and table.find(badExecutors, execName) and not _env.isFireproximityPrompt then
    warn("[Rael Hub sUNC] Your ".. execName .." now has definitive support for the fireproximityprompt function")
    _env.isFireproximityPrompt = true

    _env.fireproximityprompt = function(prompt, cameraStand)
        local camera = workspace.CurrentCamera
        local oldEnabled = prompt.Enabled
        local oldHoldDuration = prompt.HoldDuration
        local oldLineOfSight = prompt.RequiresLineOfSight
        local oldMaxDistance = prompt.MaxActivationDistance
        local oldCameraCFrame = camera.CFrame
        local oldCameraType = camera.CameraType

        local function getCameraStand(prompt)
            if cameraStand then return cameraStand end

            local promptParent = prompt and prompt.Parent
            local promptModel = prompt and prompt:FindFirstAncestorOfClass("Model")
            local isHumanoidRootPart = promptModel and promptModel:FindFirstChild("HumanoidRootPart", true)

            if promptParent and promptParent:IsA("BasePart") then return promptParent end
            if isHumanoidRootPart and isHumanoidRootPart:IsA("BasePart") then return isHumanoidRootPart end

            if promptModel then
                for _, part in ipairs(promptModel:getDescendants()) do
                    if part and part:IsA("BasePart") then return part end
                end
            end

            warn("[Rael hub function] There is no support for camera (fireproximityprompt)")
            return
        end

        local success, err = pcall(function()

            if placaIdFunctions[tostring(placeId)] then
                placaIdFunctions[tostring(placeId)].Active()
                task.wait(0.3)
            end

            local targetPart = getCameraStand(prompt)
            local centerPosition = targetPart and targetPart.Position
            if not centerPosition then return end

            prompt.Enabled = true
            prompt.HoldDuration = 0
            prompt.RequiresLineOfSight = false
            prompt.MaxActivationDistance = math.huge

            task.wait(0.1)

            camera.CameraType = Enum.CameraType.Scriptable

            local offset = Vector3.new(0, 5, 25)
            local cameraPosition = centerPosition + offset

            camera.CFrame = CFrame.new(cameraPosition, centerPosition)

            task.wait(0.1)
            prompt:InputHoldBegin()
            task.wait(0.1)
            prompt:InputHoldEnd()
        end)

        prompt.Enabled = oldEnabled
        prompt.HoldDuration = oldHoldDuration
        prompt.RequiresLineOfSight = oldLineOfSight
        prompt.MaxActivationDistance = oldMaxDistance
        camera.CFrame = oldCameraCFrame
        camera.CameraType = oldCameraType

        if placaIdFunctions[tostring(placeId)] then
            placaIdFunctions[tostring(placeId)].Disabled()
            warn("[Rael Hub sUNC] function disabled")
            task.wait(0.3)
        end

        if not success then
            warn("[Rael Hub sUNC] an error occurred with fireproximityprompt", err)
            return false
        end

        return true

    end
end
