local LeversSystem = {}

function LeversSystem.FindFolder()
  for _, pasta in ipairs(game.Workspace:GetChildren()) do
    if pasta:IsA("Folder") then
      for _, PastaCooking in ipairs(pasta:GetChildren()) do
        if PastaCooking:IsA("Folder") and PastaCooking.Name == "Cooking" then
          for _, Pasta2 in ipairs(pasta:GetChildren()) do
            if Pasta2:IsA("Folder") then
              for _, PastaHANDLER in ipairs(Pasta2:GetChildren()) do
                if PastaHANDLER:IsA("Folder") and PastaHANDLER.Name == "HANDLER" then
                  
                  warn("[Rael Hub] FolderLevers was found")
                  shared.FolderLevers = Pasta2
                  return Pasta2
                  
                end
              end
            end
          end
        end
      end
    end
  end
end


function LeversSystem.ActivateLevers()
  
  if not shared.FolderLevers then
    
    warn("[Erro] FolderLevers not found")
    return nil
    
  end
  
  if not shared.FolderLevers:FindFirstChild("Levers") then
    return nil
  end

  local levers = shared.FolderLevers.Levers:GetChildren()
    
  for _, alavanca in ipairs(levers) do
    local lever = alavanca:FindFirstChild("Lever")
    if lever and lever:IsA("BasePart") and lever.Transparency == 0 then
      shared.Character.HumanoidRootPart.CFrame = CFrame.new(lever.Position)
      
      task.wait(0.5)
      
      local prompt = lever:FindFirstChildOfClass("ProximityPrompt")
      if prompt then
        fireproximityprompt(prompt)
      end
    end
  end
end

LeversSystem.FindFolder()

return LeversSystem