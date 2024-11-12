local plr = game.Players.LocalPlayer

local v = workspace.SpawnItem.Puzzle_Easy

for i = 1, 3 do
    for j = 1, 3 do
        if i ~= j then
            for k = 1, 3 do
                if k ~= i and k ~= j then
                    local a, b, c = v["Message" .. i], v["Message" .. j], v["Message" .. k]
                    plr.Character.HumanoidRootPart.CFrame = a.CFrame
                    workspace.Camera.CFrame = a.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                    task.wait(.3)
                    fireproximityprompt(a.ProximityPrompt)
                    plr.Character.HumanoidRootPart.CFrame = v:GetChildren()[5].CFrame
                    workspace.Camera.CFrame = v:GetChildren()[5].CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                    task.wait(.3)
                    fireproximityprompt(v:GetChildren()[5].ProximityPrompt)
                    task.wait(.1)
                    plr.Character.HumanoidRootPart.CFrame = b.CFrame
                    workspace.Camera.CFrame = b.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                    task.wait(.3)
                    fireproximityprompt(b.ProximityPrompt)
                    plr.Character.HumanoidRootPart.CFrame = v:GetChildren()[6].CFrame
                    workspace.Camera.CFrame = v:GetChildren()[6].CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                    task.wait(.3)
                    fireproximityprompt(v:GetChildren()[6].ProximityPrompt)
                    task.wait(.1)
                    plr.Character.HumanoidRootPart.CFrame = c.CFrame
                    workspace.Camera.CFrame = c.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                    task.wait(.3)
                    fireproximityprompt(c.ProximityPrompt)
                    plr.Character.HumanoidRootPart.CFrame = v:GetChildren()[7].CFrame
                    workspace.Camera.CFrame = v:GetChildren()[7].CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                    task.wait(.3)
                    fireproximityprompt(v:GetChildren()[7].ProximityPrompt)
                    task.wait(.1)
                end
            end
        end
    end
end
