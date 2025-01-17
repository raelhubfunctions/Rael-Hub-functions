local RunService = game:GetService("RunService")

function FlyToPosition(data)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoidRootPart and humanoid then
            humanoid.Jump = true
            wait(0.2)
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = (targetPosition - humanoidRootPart.Position).unit * speed
            bodyVelocity.Parent = humanoidRootPart
            
            local function noclip()
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end

            local function clip()
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end

            noclip()
            
            local connection
            connection = RunService.Stepped:Connect(function()
                if (targetPosition - humanoidRootPart.Position).magnitude < 5 then
                    bodyVelocity:Destroy()
                    connection:Disconnect()
                    humanoidRootPart.CFrame = CFrame.new(targetPosition)
                    clip()
                end
            end)
        end
    end
end

return {
    FlyToPosition = FlyToPosition
}