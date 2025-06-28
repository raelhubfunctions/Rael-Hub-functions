local badExecutors = {"Xeno", "Solara"}
local getNameExecutor, getVersionEXecutor = identifyexecutor()

if getgenv().fireproximityprompt and table.find(badExecutors, getNameExecutor) and not getgenv().isFireproximityPrompt then
    warn("[Rael hub] Your ".. getNameExecutor .." now has definitive support for the fireproximityprompt function")
    getgenv().isFireproximityPrompt = true

    getgenv().fireproximityprompt = function(prompt)
        local camera = workspace.CurrentCamera
        local oldEnabled = prompt.Enabled
        local oldHoldDuration = prompt.HoldDuration
        local oldLineOfSight = prompt.RequiresLineOfSight
        local oldMaxDistance = prompt.MaxActivationDistance
        local oldCameraCFrame = camera.CFrame
        local oldCameraType = camera.CameraType

        local success, err = pcall(function()
            prompt.Enabled = true
            prompt.HoldDuration = 0
            prompt.RequiresLineOfSight = false
            prompt.MaxActivationDistance = math.huge

            task.wait(0.1)

            camera.CameraType = Enum.CameraType.Scriptable

            local targetModel = prompt:FindFirstAncestorOfClass("Model")
            local centerPosition

            if targetModel then
                local modelCFrame = targetModel.WorldPivot
                centerPosition = modelCFrame.Position
            else
                centerPosition = prompt.Parent and prompt.Parent.Position or prompt.Position
            end

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

        if not success then
            warn("[Rael Hub] an error occurred with fireproximityprompt", err)
        end
    end
end
