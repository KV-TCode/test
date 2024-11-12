local plr = game:GetService("Players").LocalPlayer
local VU = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")
local RS = game:GetService("ReplicatedStorage")
local Events, Functions, MOB, Mons, NPC, Item = RS.Chest.Remotes.Events, RS.Chest.Remotes.Functions, RS.MOB, workspace.Monster, workspace.AllNPC, workspace.SpawnItem
local Mon, Boss = Mons.Mon, Mons.Boss

local DailyQuest, Quest
if game.PlaceId == 4520749081 then
	Quest = {
	}
	DailyQuest = {
		{"Kill 20 Soldiers", 1},
		{"Forget and Forgot" , 5},
		{"Venture Lagoons!", 10},
		{"Tomb Raiding!", 50}, -- Shadow Master [Lv. 1650]
		{"Dead Walking", 100}, -- Zombie [Lv. 1500]
		{"Kill 4 King Snow", 500},
		{"Kill 10 Soldier Fishman", 2000}
	}
elseif game.PlaceId == 6381829480 then
	DailyQuest = {
		{"Under The Sea~", 3000},
		{"I'm not,YOU ARE!", 3000},
		{"Box Box!", 3000},
		{"Bone Hunter", 3000},
		{"Order Disobey", 3000},
		{"Dead Above", 3000},
		{"Catch me,If you can", 3000},
		{"The Lost Book", 3800},
		{"Is it Thriller?", 3050, CFrame.new(-6380.73291, 75.3970032, 7030.30176)}, -- Skull Pirate [Lv. 3050]
		{"Left to Dead", 3000}, -- Dead Troupe Captain [Lv. 3850]
		{"One More Time", 3000}, -- Joey [Lv. 3000]
		{"Believer", 3500}, -- Hefty [Lv. 3550]
	}
else
	DailyQuest = {
		{"The Pillar", 4000},
		{"Hide'n Seek!", 4000},
		{"Until Pond", 4000, CFrame.new(-115.978996, 44.9630013, -9149.57715)}, -- Ocean Gladiator [Lv. 4500]
		{"Redemption", 4000, CFrame.new(2838.67212, 35.9669991, 1114.66003)}, -- Fugitive [Lv. 4050]
		{"Rolling in the Depth", 4000, CFrame.new(1561.49902, 45.4389992, 967.440979)}, -- Deep Diver [Lv. 4000]
		{"Mossy Must Gone", 4000},
		{"Into the Bubble-Verse", 4000, CFrame.new(5881.66309, 51.8689995, 9375.15039)} -- Cyborg Gorilla [Lv. 4375]
	}
end

local TypeAttack = {
	["Above"] = CFrame.Angles(0, math.rad(90), 0)
}
local Keys = {"Copper", "Iron", "Gold"}

getgenv().Config = {
	["Distance"] = 10,
	["Sea Event"] = false
}

function Click()
	VU:CaptureController()
    VU:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

function SendKey(key, sec)
	VIM:SendKeyEvent(true, key, false, game)
    if sec then
	    task.wait(sec)
    else
        task.wait()
    end
	VIM:SendKeyEvent(false, key, false, game)
end

function Haki()
	if plr.Character.Services.Haki.Value == 0 then
		Events.Armament:FireServer()
		task.wait()
	end
	if not plr.Character.Services.KenOpen.Value then
		SendKey("Y")
		task.wait()
	end
end

function Attack()
	Functions.SkillAction:InvokeServer("SW_" .. plr.PlayerStats.SwordName.Value .. "_M1")
end

function GetDistance(pos, obj)
	obj = obj or plr.Character
	local a, b
	if typeof(pos) ~= "CFrame" then
		a = pos.HumanoidRootPart.Position
	else
		a = pos.Position
	end
	if typeof(obj) ~= "CFrame" then
		b = obj.HumanoidRootPart.Position
	else
		b = obj.Position
	end
	return (a - b).Magnitude
end

function Check(obj)
	repeat
		task.wait()
	until obj:FindFirstChild("HumanoidRootPart")
end

function CheckMons(name)
	return MOB:FindFirstChild(name) or Boss:FindFirstChild(name) or Mon:FindFirstChild(name)
end

function CheckObject(obj)
	repeat
		task.wait()
	until obj:FindFirstChild("HumanoidRootPart")
end

function TP(pos, obj)
	obj = obj or plr.Character
	CheckObject(obj)
	obj.HumanoidRootPart.CFrame = pos
end

function TP1(pos)
	TP(pos * CFrame.new(0, getgenv().Config.Distance, 0) * CFrame.Angles(math.rad(-90), 0, 0))
end

function TP2(pos)
	TP(pos * CFrame.new(0, 150, 0))
end

function Tween(pos, obj)
	obj = obj or plr.Character
	CheckObject(obj)
	local Distance = GetDistance(pos, obj)
	if Distance > 1000 then
		TP(pos * CFrame.new(0, 100, 0), obj)
		Distance = GetDistance(pos, obj)
	end
	pcall(function()
		local tween = game:GetService("TweenService"):Create(obj.HumanoidRootPart, TweenInfo.new(Distance / 300, Enum.EasingStyle.Linear), {CFrame = pos})
		tween:play()
		tween.Completed:Wait()
	end)
end

function GetQuest(quest)
	Functions.Quest:InvokeServer("take", quest)
end

function BuyKey(k)
	local args = {
		[1] = k .. " Key",
		[2] = 10
	}
	Functions.BuyKey:InvokeServer(unpack(args))
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Test Hub",
	SubTitle = "By TCode",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Theme = "Amethyst",
	Acrylic = true,
	Transparency = true,
	MinimizeKey = Enum.KeyCode.RightControl
})

-- local Settings = Window:AddTab({
-- 	Title = "Settings",
-- 	Icon = ""
-- })

-- local Dist = Settings:AddSlider({
-- 	Title = "Distance",
-- 	Description  = "?",
-- 	Default = 10,
-- 	Min = 5,
-- 	Max = 100,
-- 	Rounding = 1,
-- 	Callback = function(v)
-- 		getgenv().Distance = v
-- 	end
-- })

local Farm = Window:AddTab({
	Title = "Farm",
	Icon = ""
})

Farm:AddToggle("", {
	Title = "Auto Daily Quest",
	Default = false,
	Callback = function(v)
		getgenv().Config["Daily Quest"] = v
	end
})

function Prompt(name, a, pos)
	a = a or CFrame.Angles(math.rad(180), 0, 0)
	pos = pos or CFrame.new(0, 0, 0)
	for _, v in next, Item:GetChildren() do
		if v.Name == name then
			TP(v.CFrame * pos)
			workspace.Camera.CFrame = v.CFrame * a
			task.wait(1)
			fireproximityprompt(v:FindFirstChild("PromptQuest") or v:FindFirstChild("ProximityPrompt"))
			task.wait()
			fireproximityprompt(v:FindFirstChild("PromptQuest") or v:FindFirstChild("ProximityPrompt"))
		end
	end
end

function Touch(name)
	for _, v in next, Item:GetChildren() do
		if v.Name == name then
			Tween(v.CFrame)
			task.wait(.1)
		end
	end
end

-- function Kill(mob)
-- 	for _, v in next, 
-- end

function Acp(npc)
	TP(NPC[npc].CFrame)
	repeat
		task.wait(1)
		Click()
	until plr.PlayerGui:FindFirstChild(npc) and plr.PlayerGui[npc]:FindFirstChild("Dialogue") and plr.PlayerGui[npc].Dialogue:FindFirstChild("Accept")
	plr.PlayerGui[npc].Dialogue.Accept.ImageTransparency = 1
	plr.PlayerGui[npc].Dialogue.Accept.Position = UDim2.new(-2, 0, -5, 0)
	plr.PlayerGui[npc].Dialogue.Accept.Size = UDim2.new(0, 10000, 0, 10000)
	task.wait(.1)
	Click()
end

function DoQuest()
	local a = plr.CurrentQuest.Value
	if a == "" then
		return
	elseif a == "Forget and Forgot" then
		Acp("Civilian Old")
	elseif a == "Box Box!" then
		local v = Item.Box
		TP(v.CFrame)
		workspace.Camera.CFrame = v.CFrame * CFrame.Angles(math.rad(180), 0, 0)
		task.wait(1)
		fireproximityprompt(v.ProximityPrompt)
		task.wait(.1)
		Acp("Civilian Port")
		task.wait(1)
	elseif a == "Venture Lagoons!" then
		if not workspace.Ships:FindFirstChild(plr.Name .. " Ship") then
			Events.Ship:FireServer("Rowboat", "ShipA")
		end
		task.wait(1)
		repeat
			task.wait()
			TP(workspace.Ships[plr.Name .. " Ship"].VehicleSeat.CFrame)
		until plr.Character.Humanoid.Sit == true
		for _, v in next, Item:GetChildren() do
			if v.Name == "Venture Lagoons!" then
				workspace.Ships[plr.Name .. " Ship"].VehicleSeat.CFrame = v.CFrame * CFrame.new(0, 5, 0) * CFrame.Angles(math.rad(90), 0, 0)
				task.wait(1)
			end
		end
		plr.Character.Humanoid.Sit = false
	elseif a == "Bone Hunter" then
		Prompt("Bone Hunter")
	elseif a == "Order Disobey" then
		Prompt("PosterQuest")
	elseif a == "Dead Above" then
		Prompt("Floating Feather")
	elseif a == "Catch me,If you can" then
		Prompt("Catch me,If you can", CFrame.Angles(0, math.rad(-30), 0))
	elseif a == "The Pillar" then
		Prompt("The Pillar", CFrame.Angles(math.rad(-90), 0, 0))
	elseif a == "Mossy Must Gone" then
		Prompt("Mossy Must Gone", CFrame.Angles(math.rad(-90), 0, 0), CFrame.new(3, 0, 0))
	elseif a == "Hide'n Seek!" then
		Prompt("Hide'n Seek!", CFrame.Angles(math.rad(-90), 0, 0))
	elseif a == "The Lost Book" then
		local v = workspace.Island["H - Fiore"]["Lost Book"].Main
		TP(v.CFrame * CFrame.new(0, 5, 0))
		workspace.Camera.CFrame = v.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
		task.wait(1)
		fireproximityprompt(v.ProximityPrompt)
	elseif a == "I'm not,YOU ARE!" or a == "Under The Sea~"  then
		Touch(a)
	end
end

task.spawn(function()
	while task.wait() do
		if getgenv().Config["Daily Quest"] then
			for _, v in next, DailyQuest do
				if plr.PlayerStats.lvl.Value >= v[2] then
					GetQuest(v[1])
					repeat
						task.wait()
						DoQuest()
					until not getgenv().Config["Daily Quest"] or plr.CurrentQuest.Value == ""
					task.wait(1)
				end
			end
						
				-- 	elseif plr.CurrentQuest.Value == "Kill 4 King Snow" then
				-- 		repeat
				-- 			task.wait(1)
				-- 			TP2(workspace.Areas.Tundra.CFrame)
				-- 		until CheckBoss("King Snow [Lv. 450]")
				-- 		pcall(function()
				-- 			local v = workspace.Monster.Boss["King Snow [Lv. 450]"]
				-- 			getgenv().LockPos = v.HumanoidRootPart.CFrame
				-- 			repeat
				-- 				task.wait()
				-- 				TP1(v.HumanoidRootPart.CFrame)
				-- 				getgenv().BringMob = true
				-- 				Haki()
				-- 				getgenv().Attack = true
				-- 			until not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
				-- 			getgenv().BringMob = false
				-- 			getgenv().Attack = false
				-- 		end)
				-- 	elseif plr.CurrentQuest.Value == "Kill 10 Soldier Fishman" then
				-- 		repeat
				-- 			task.wait(1)
				-- 			TP2(workspace.Areas.Fishland.CFrame)
				-- 		until workspace.Monster.Mon:FindFirstChild("Soldier Fishman [Lv. 2150]")
				-- 		pcall(function()
				-- 			for _, v in next, workspace.Monster.Mon:GetChildren() do
				-- 				if v.Name == "Soldier Fishman [Lv. 2150]" then
				-- 					getgenv().LockPos = v.HumanoidRootPart.CFrame
				-- 					repeat
				-- 						task.wait()
				-- 						TP1(v.HumanoidRootPart.CFrame)
				-- 						getgenv().BringMob = true
				-- 						Haki()
				-- 						getgenv().Attack = true
				-- 					until plr.CurrentQuest.Value == "" or not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
				-- 					getgenv().BringMob = false
				-- 					getgenv().Attack = false
				-- 				end
				-- 			end
				-- 		end)
				-- 	end
				-- else
				-- 	plr.Character.Humanoid.Sit = false
				-- 	GetQuest(DailyQuest[getgenv().Config["Daily Quest"][2]])
				-- 	task.wait(1)
				-- end
		end
	end
end)

if game.PlaceId == 4520749081 then
	
elseif game.PlaceId == 6381829480 then
	-- task.spawn(function()
	-- 	while task.wait() do
	-- 		if getgenv().Config["Daily Quest"][1] and getgenv().Config["Daily Quest"][2] ~= "" then
	-- 			if plr.CurrentQuest.Value ~= "" then
    --                 if plr.CurrentQuest.Value == "One More Time" then
	-- 					repeat
	-- 						task.wait(1)
	-- 						TP(workspace.AllNPC["Japan 6 Quest"].CFrame * CFrame.new(0, 0, -15))
	-- 					until workspace.Monster.Boss:FindFirstChild("Joey [Lv. 3000]")
	-- 					pcall(function()
	-- 						local v = workspace.Monster.Boss["Joey [Lv. 3000]"]
	-- 						getgenv().LockPos = v.HumanoidRootPart.CFrame
	-- 						repeat
	-- 							task.wait()
	-- 							TP1(v.HumanoidRootPart.CFrame)
	-- 							getgenv().BringMob = true
	-- 							Haki()
	-- 							getgenv().Attack = true
	-- 						until not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
	-- 						getgenv().BringMob = false
	-- 						getgenv().Attack = false
	-- 					end)
    --                 elseif plr.CurrentQuest.Value == "Believer" then
	-- 					repeat
	-- 						task.wait(1)
	-- 						TP(workspace.AllNPC["Soldier Head Quater 2 Quest"].CFrame * CFrame.new(0, 0, -15))
	-- 					until workspace.Monster.Boss:FindFirstChild("Hefty [Lv. 3550]")
	-- 					pcall(function()
	-- 						local v = workspace.Monster.Boss["Hefty [Lv. 3550]"]
	-- 						getgenv().LockPos = v.HumanoidRootPart.CFrame
	-- 						repeat
	-- 							task.wait()
	-- 							TP1(v.HumanoidRootPart.CFrame)
	-- 							getgenv().BringMob = true
	-- 							Haki()
	-- 							getgenv().Attack = true
	-- 						until not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
	-- 						getgenv().BringMob = false
	-- 						getgenv().Attack = false
	-- 					end)
    --                 elseif plr.CurrentQuest.Value == "Left to Dead" then
	-- 					repeat
	-- 						task.wait(1)
	-- 						TP(CFrame.new(10028.0293, 102.078606, -3953.87476))
	-- 					until workspace.Monster.Mon:FindFirstChild("Dead Troupe Captain [Lv. 3850]")
	-- 					pcall(function()
	-- 						for _, v in next, workspace.Monster.Mon:GetChildren() do
	-- 							if v.Name == "Dead Troupe Captain [Lv. 3850]" then
	-- 								getgenv().LockPos = v.HumanoidRootPart.CFrame
	-- 								repeat
	-- 									task.wait()
	-- 									TP1(v.HumanoidRootPart.CFrame)
	-- 									getgenv().BringMob = true
	-- 									Haki()
	-- 									getgenv().Attack = true
	-- 								until plr.CurrentQuest.Value == "" or not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
	-- 								getgenv().BringMob = false
	-- 								getgenv().Attack = false
	-- 							end
	-- 						end
	-- 					end)
	-- 				end
	-- 			else
	-- 				GetQuest(DailyQuest[getgenv().Config["Daily Quest"][2]])
	-- 				task.wait(1)
	-- 			end
	-- 		end
	-- 	end
	-- end)
	local SeaBoss = Farm:AddParagraph({
		Title = "Sea Boss",
		Content = "Wait For Happy 🔴"
	})
	local AutoSeaEvent = Farm:AddToggle("", {
		Title = "Auto Sea Event",
		Default = false,
		Callback = function(v)
			getgenv().Config["Sea Event"] = v
		end
	})
	task.spawn(function()
		while task.wait(5) do
			for _, v in next, workspace.Island:GetChildren() do
				if string.find(v.Name, "Legacy") or string.find(v.Name, "Sea King") then
					if string.find(v.Name, "Legacy") then
						SeaBoss:SetDesc("Sea King 🟢")
					else
						SeaBoss:SetDesc("Hydra 🟢")
					end
					getgenv().SK = v.Name
				else
					SeaBoss:SetDesc("Wait For Happy 🔴")
					getgenv().SK = nil 
				end
			end
		end
	end)
	task.spawn(function()
		while task.wait() do
			if getgenv().Config["Sea Event"] and getgenv().SK then
				local v = workspace.SeaMonster:FindFirstChild("SeaKing")
				if v then
					repeat
						task.wait()
						TP1(v.HumanoidRootPart.CFrame)
						Haki()
						getgenv().Attack = true
					until not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
					getgenv().Attack = false
				else
					local chest = workspace.Island[getgenv().SK]:FindFirstChild("ChestSpawner") or workspace.Island[getgenv().SK]:FindFirstChild("SeaBeastChest")
					if chest then
						TP(chest.CFrame)
					else
						TP2(workspace.Island[getgenv().SK].Main.CFrame)
					end
				end
			end
		end
	end)
end

local Shop = Window:AddTab({
	Title = "Shop",
	Icon = ""
})

Shop:AddButton({
	Title = "Redeem Code",
	Description = "X2 Exp, Gems, etc",
	Callback = function()
		local Code = {"X100KSuccess", "PvPArenaFun", "LegendarySwordsUnlocked", "Update7.1", "WELCOMETOKINGLEGACY", "FruitAwakeningTime", "Halloween2024", "SKFreeGems", "TelekinesisFruitPower", "InfernoKingAwaits", "Peodiz", "IslandQuestRepeat", "SKGames", "DinoxLive", "RainbowDragon", "Update7Release", "OwnerMeteor", "QuakeTsunamiBoost", "EpicAdventure", "DragonColorRefund", "SeaAdventure", "2MFAV", "Dinosaur100kFollowers", "FREESTATSRESET", "<3LEEPUNGG", "FREE30MINUTESEXP", "PassiveMaster", "ThirdSeaAdventures", "MaterialHunter", "MysticAccessoryFind", "AwakenTheBuddha", "GetYourLuck", "BossSlayer", "KrakensRevenge", "DragonColorsUnlocked", "PlayKingLegacyFor5Gems", "KioruV2PowerUp"}
		for _, v in next, Code do
			Functions.redeemcode:InvokeServer(v)
			task.wait(2)
		end
	end
})

local Misc = Window:AddTab({
	Title = "Misc",
	Icon = ""
})

Misc:AddToggle("", {
	Title = "Auto Collect Fruit",
	Default = false,
	Callback = function(v)
		getgenv().Config["Collect Fruit"] = v
	end
})

task.spawn(function()
	while task.wait() do
		if getgenv().Config["Collect Fruit"] then
			for _, v in next, workspace.AllDroppedFruit:GetChildren() do
				v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
				task.wait(.1)
			end
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if getgenv().Config["Daily Quest"] then
			getgenv().NoClip = true
		else
			getgenv().NoClip = false
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if getgenv().NoClip then
			if not plr.Character.HumanoidRootPart:FindFirstChild("tcode") then
				local a = Instance.new("BodyVelocity")
				a.Name = "tcode"
				a.Velocity = Vector3.new(0, 0, 0)
				a.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				a.Parent = plr.Character.HumanoidRootPart
				for _, v in next, plr.Character:GetDescendants() do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		elseif plr.Character.HumanoidRootPart:FindFirstChild("tcode") then
			plr.Character.HumanoidRootPart.tcode:Destroy()
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if getgenv().Attack then
			Attack()
		end
	end
end)

task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		if getgenv().BringMob and getgenv().LockPos then
			for _, v in next, workspace.Monster.Mon:GetChildren() do
				if string.find(v.Name, "Lv") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (getgenv().LockPos.Position - v.HumanoidRootPart.Position).Magnitude <= 300 and (getgenv().LockPos.Position - v.HumanoidRootPart.Position).Magnitude > 5 then
					v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
					Tween(getgenv().LockPos, v.HumanoidRootPart)
					v.Humanoid:ChangeState(14)
					v.HumanoidRootPart.CanCollide = false
					v.Head.CanCollide = false
					if v.Humanoid:FindFirstChild("Animator") then
						v.Humanoid.Animator:Destroy()
					end
					sethiddenproperty(plr,"SimulationRadius",math.huge)
					if not v.HumanoidRootPart:FindFirstChild("tcode") then
						local a = Instance.new("BodyVelocity")
						a.Parent = v.HumanoidRootPart
						a.Name = "tcode"
						a.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						a.Velocity = Vector3.new(0, 0, 0)
					end
				end
			end
		end
	end)
end)
