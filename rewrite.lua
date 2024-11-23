local Players = game:GetService("Players")
repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer

local LP = game:GetService("Players").LocalPlayer

local ID
if game.PlaceId == 4520749081 then
    ID = 1
elseif game.PlaceId == 6381829480 then
    ID = 2
elseif game.PlaceId == 15759515082 then
    ID = 3
else
    LP:Kick("Game Not Supported")
end

function SendKey(key, d)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
    if d then
        task.wait(d)
    else
        task.wait()
    end
    game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
end

if LP.PlayerGui:FindFirstChild("LoadingGUI") then
    repeat task.wait() until LP.PlayerGui.LoadingGUI:FindFirstChild("Play")
    SendKey(Enum.KeyCode.BackSlash)
    SendKey(Enum.KeyCode.Return)
end

repeat task.wait() until LP:FindFirstChild("DataLoaded") and LP:FindFirstChild("DataLoaded").Value

Mode = CFrame.new(0, 10, 0) * CFrame.Angles(math.rad(-90), 0, 0)

getgenv().Config = {}

local G = getgenv().Config

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Tabs = {}
local Obj = {}

local Window = Fluent:CreateWindow({
  Title = "Test Hub",
  SubTitle = "By TCode",
  TabWidth = 160,
  Size = UDim2.fromOffset(500, 380),
  Theme = "Darker",
  Acrylic = true,
  Transparency = true,
  MinimizeKey = Enum.KeyCode.RightControl
})

function CTabs(args)
    for i, v in next, args do
        Tabs[v[1]] = Window:AddTab({
            Title = v[1],
            Icon = v[2]
        })
    end
end

function Notify(name, desc, dura)
    Fluent:Notify({Title = name, Content = desc, Duration = dura})
end

function Label(tab, name, desc)
    desc = desc or ""
    Obj[name] = Tabs[tab]:AddParagraph({Title = name, Content = desc})
end

function Button(tab, name, func)
    Tabs[tab]:AddButton({Title = name, Callback = func})
end

function Tog(tab, name, func)
    func = func or function(v) G[name] = v end
    Obj[name] = Tabs[tab]:AddToggle(name, {Title = name, Callback = func})
end

function Slider(tab, name, desc, def, min, max, rnd)
    Obj[name] = Tabs[tab]:AddSlider(name, {Title = name, Description = desc, Default = def, Min = min, Max = max, Rounding = rnd, Callback = function(v) G[name] = v end})
end

function DD(tab, name, desc, args, mul, def)
    Obj[name] = Tabs[tab]:AddDropdown(name, {Title = name, Description = desc, Values = args, Multi = mul, Default = def, Callback = function(v) G[name] = v end})
end

function Box(tab, name, def, num)
    Obj[name] = Tabs[tab]:AddInput(name, {Title = name, Default = def, Placeholder = "Placeholder", Numeric = num, Finished = true, Callback = function(v) G[name] = v end})
end
local Quests, DQuests, PosMob, Material, Sword, Accessory, Mob, ParentMob, LockPos, Magnet, Attack, AttackPos, FinishMagnet  = {}, {}, {}, {}, {}, {}
if ID == 1 then
    PosMob = {
        [1] = CFrame.new(-1915, 49, -4569),
        [10] = CFrame.new(-1777, 49, -4461),
        [20] = CFrame.new(-2111, 49, -4800),
        [30] = CFrame.new(-2355, 49, -4560),
        [50] = CFrame.new(-806, 52, -3473),
        [75] = CFrame.new(-456, 73, -3542),
        [100] = CFrame.new(-2229, 49, -2605),
        [120] = CFrame.new(-2195, 50, -2466),
        [145] = CFrame.new(-2355, 103, -2478),
        [180] = CFrame.new(-818, 23, -1473),
        [200] = CFrame.new(-889, 23, -1527),
        [230] = CFrame.new(-616, 25, -1574),
        [250] = CFrame.new(-4196, 15, -3223),
        [300] = CFrame.new(-4236, 18, -2861),
        [350] = CFrame.new(-4379, 15, -2593),
        [400] = CFrame.new(-5409, 28, -1224),
        [450] = CFrame.new(-5421, 28, -1513),
        [500] = CFrame.new(-5319, 21, -1106),
        [525] = CFrame.new(-2930, 92, -494),
        [575] = CFrame.new(-2889, 41, -748),
        [625] = CFrame.new(-3062, 92, -640),
        [675] = CFrame.new(-2734, 41, -604),
        [725] = CFrame.new(-3089, 96, -482),
        [800] = CFrame.new(-4259, 383, 1379),
        [850] = CFrame.new(-4864, 441, 1335),
        [900] = CFrame.new(-4488, 383, 1315),
        [950] = CFrame.new(-4817, 441, 1197),
        [1000] = CFrame.new(1638, 17, 917),
        [1050] = CFrame.new(1518, 17, 803),
        [1100] = CFrame.new(1686, 17, 737),
        [1150] = CFrame.new(1852, 43, 874),
        [1200] = CFrame.new(-1354, 20, 2258),
        [1250] = CFrame.new(-1419, 20, 2107),
        [1300] = CFrame.new(-1082, 20, 2056),
        [1350] = CFrame.new(-1051, 20, 2216),
        [1400] = CFrame.new(-1351, 7, 2521),
        [1450] = CFrame.new(-1162, 7, 2519),
        [1500] = CFrame.new(-2625, 15, 4144),
        [1550] = CFrame.new(-2845, 15, 3997),
        [1600] = CFrame.new(-2954, 20, 4251),
        [1650] = CFrame.new(-2763, 20, 4362),
        [1700] = CFrame.new(2303, 55, -1663),
        [1750] = CFrame.new(2132, 7, -1942),
        [1800] = CFrame.new(2299, 55, -2204),
        [1850] = CFrame.new(2333, 55, -1938),
        [1925] = CFrame.new(2177, 6, -1932),
        [2000] = CFrame.new(-1626, 40, 6158),
        [2050] = CFrame.new(-1960, 40, 6149),
        [2100] = CFrame.new(-1503, 40, 6698),
        [2150] = CFrame.new(-1858, 44, 6645),
        [2200] = CFrame.new(-1866, 45, 6722),
        [3000] = CFrame.new(5470, 38, -6637)
    }
    DQuests = {
        {"Kill 20 Soldiers", 1, "Soldier [Lv. 1]"},
        {"Forget and Forgot" , 5},
        {"Venture Lagoons!", 10},
        {"Tomb Raiding!", 50, "Shadow Master [Lv. 1650]"},
        {"Dead Walking", 100, "Zombie [Lv. 1500]"},
        {"Kill 4 King Snow", 500, "King Snow [Lv. 450]"},
        {"Kill 10 Soldier Fishman", 2000, "Soldier Fishman [Lv. 2150]"}
    }
    Quests = {
		{"Kill 4 Soldiers", 0},
		{"Kill 5 Clown Pirates", 10},
		{"Kill 1 Smoky", 20},
		{"Kill 1 Tashi", 30},
		{"Kill 6 Clown Swordman", 50},
		{"Kill 1 The Clown", 75},
		{"Kill 4 Commander", 100},
		{"Kill 1 Captain", 120},
		{"Kill 1 The Barbaric", 145},
		{"Kill 4 Fighter Fishmans", 180},
		{"Kill 1 Karate Fishman", 200},
		{"Kill 1 Shark Man", 230},
		{"Kill 4 Trainer Chef", 250},
		{"Kill 1 Dark Leg", 300},
		{"Kill 1 Dory", 350},
		{"Kill 5 Snow Soldier", 400},
		{"Kill 1 King Snow", 450},
		{"Kill 1 Little Dear", 500},
		{"Kill 1 Candle Man", 525},
		{"Kill 4 Sand Bandit", 575},
		{"Kill 1 Bomb Man", 625},
		{"Kill 4 Desert Marauder", 675},
		{"Kill 1 King of Sand", 725},
		{"Kill 4 Sky Soldier", 800},
		{"Kill 1 Ball Man", 850},
		{"Kill 4 Cloud Warrior", 900},
		{"Kill 1 Rumble Man", 950},
		{"Kill 4 Elite Soldiers", 1000},
		{"Kill 4 High-class Soldier", 1050},
		{"Kill 1 Leader", 1100},
		{"Kill 1 Pasta", 1150},
		{"Kill 4 Naval personnel", 1200},
		{"Kill 1 Wolf", 1250},
		{"Kill 1 Giraffe", 1300},
		{"Kill 4 Nautical soldier", 1350},
		{"Kill 4 Naval soldier", 1400},
		{"Kill 1 Leo", 1450},
		{"Kill 5 Zombies", 1500},
		{"Kill 4 Elite Zombies", 1550},
		{"Kill 4 Revenant", 1600},
		{"Kill 1 Shadow Master", 1650},
		{"Kill 4 New World Pirates", 1700},
		{"Kill 4 Cutlass Pirates", 1750},
		{"Kill 4 Rear Admirals", 1800},
		{"Kill 1 True Karate Fishman", 1850},
		{"Kill 1 Quake Woman", 1925},
		{"Kill 4 Fishmans", 2000},
		{"Kill 1 Combat Fishman", 2050},
		{"Kill 1 Sword Fishman", 2100},
		{"Kill 4 Soldier Fishman", 2150},
		{"Kill 1 Seasoned Fishman", 2200}
	}
    Material = {
		["Fresh Fish"] = {"Kill 4 Fighter Fishmans", 180},
        ["Thief's rag"] = {"Kill 4 Desert Marauder", 675},
		["Angellic's Feather"] = {"Kill 4 Sky Soldier", 800},
        ["Gunpowder"] = {"Kill 4 Naval personnel", 1200},
        ["Undead's Ooze"] = {"Kill 5 Zombies", 1500},   
		["Twilight's Orb"] = {"Kill 1 Shadow Master", 1650},
    }
    Sword = {
        ["Bisento"] = {"Kill 1 Quake Woman", 1925},
    }
elseif ID == 2 then
    PosMob = {
        [2250] = CFrame.new(-4085, 57, -5),
        [2300] = CFrame.new(-3978, 98, -324),
        [2350] = CFrame.new(-4353, 57, 351),
        [2400] = CFrame.new(-4469, 135, -1073),
        [2450] = CFrame.new(-4660, 135, -746),
        [2500] = CFrame.new(-5116, 85, -1015),
        [2550] = CFrame.new(-5517, 99, -271),
        [2600] = CFrame.new(-4922, 57, -134),
        [2650] = CFrame.new(-5504, 100, 39),
        [2700] = CFrame.new(-4527, 7, 1214),
        [2750] = CFrame.new(-4408, 29, 912),
        [2800] = CFrame.new(-4098, 29, 1068),
        [2850] = CFrame.new(-5364, 57, 1086),
        [2900] = CFrame.new(-5739, 57, 1245),
        [2950] = CFrame.new(-4846, 57, 2008),
        [3000] = CFrame.new(-5199, 57, 2060),
        [3050] = CFrame.new(-6379, 58, 7037),
        [3051] = CFrame.new(-6314, 58, 6259),
        [3100] = CFrame.new(-5893, 98, 7244),
        [3125] = CFrame.new(1386, 14, 1431),
        [3150] = CFrame.new(2107, 18, 961),
        [3175] = CFrame.new(1886, 52, 1713),
        [3200] = CFrame.new(2031, 14, 1354),
        [3201] = CFrame.new(-163, 43, 8050),
        [3225] = CFrame.new(-1081, 50, 8227),
        [3250] = CFrame.new(-1533, 188, 8864),
        [3275] = CFrame.new(30326, 24, 93404),
        [3300] = CFrame.new(-740, 57, -2826),
        [3325] = CFrame.new(-11, 131, -3625),
        [3350] = CFrame.new(-1043, 153, -3184),
        [3375] = CFrame.new(212, 131, -3993),
        [3400] = CFrame.new(-9258, 59, -4650),
        [3425] = CFrame.new(-9683, 59, -4558),
        [3450] = CFrame.new(-9599, 59, -5272),
        [3475] = CFrame.new(-10273, 96, -4990),
        [3500] = CFrame.new(-10075, 37, 388),
        [3525] = CFrame.new(-10078, 37, 1411),
        [3550] = CFrame.new(-10794, 83, 968),
        [3575] = CFrame.new(-10733, 331, 975),
        [3600] = CFrame.new(5330, 71, -2837),
        [3625] = CFrame.new(5359, 71, -2485),
        [3650] = CFrame.new(6071, 71, -3097),
        [3675] = CFrame.new(6623, 73, -2154),
        [3725] = CFrame.new(7425, 81, -2544),
        [3775] = CFrame.new(7897, 452, -2398),
        [3700] = CFrame.new(6859, 150, -3716),
        [3750] = CFrame.new(8017, 178, -4312),
        [3800] = CFrame.new(9546, 71, -4249),
        [3850] = CFrame.new(10186, 71, -4085),
        [3975] = CFrame.new(9953, 71, -4683),
    }
    DQuests = {
        {"Under The Sea~", 3000},
        {"I'm not,YOU ARE!", 3000},
        {"Box Box!", 3000},
        {"Bone Hunter", 3000},
        {"Order Disobey", 3000},
        {"Dead Above", 3000},
        {"Catch me,If you can", 3000},
        {"The Lost Book", 3800},
        {"Is it Thriller?", 3050, "Skull Pirate [Lv. 3050]"},
        {"Left to Dead", 3000, "Dead Troupe Captain [Lv. 3850]"},
        {"One More Time", 3000, "Joey [Lv. 3000]"},
        {"Believer", 3500, "Hefty [Lv. 3550]"}
    }
    Quests = {
		{"Kill 4 Beast Pirates", 2250},
		{"Kill 4 Beast Swordman", 2300},
		{"Kill 1 Gazelle Man", 2350},
		{"Kill 4 Bandit Beast Pirates", 2400},
		{"Kill 4 Powerful Beast Pirates", 2450},
		{"Kill 1 Violet Samurai", 2500},
		{"Kill 1 Duke", 2550},
		{"Kill 1 Magician", 2600},
		{"Kill 1 Kitsune Samurai", 2650},
		{"Kill 4 Elite Beast Pirates", 2700},
		{"Kill 1 Bear Man", 2750},
		{"Kill 1 Bean", 2800},
		{"Kill 1 Meji", 2850},
		{"Kill 1 Petra", 2900},
		{"Kill 1 Kappa", 2950},
		{"Kill 1 Joey", 3000},
		{"Kill 4 Skull Pirates", 3025},
		{"Kill 1 Elite Skeleton", 3075},
		{"Kill 1 Desert Thief", 3100},
		{"Kill 1 Anubis", 3125},
		{"Kill 1 Pharaoh", 3150},
		{"Kill 1 Flame User", 3175},
		{"Kill 4 Chess Soldiers", 3200},
		{"Kill 1 Sunken Vessel", 3225},
		{"Kill 1 Biscuit Man", 3250},
		{"Kill 1 Dough Master", 3275},
		{"Kill 4 Azlan", 3300},
		{"Kill 4 The Volcano", 3325},
		{"Kill 4 Dark Beard Servant", 3400},
		{"Kill 1 Supreme Swordman", 3425},
		{"Kill 1 Sally", 3450},
		{"Kill 5 Vice Admiral", 3500},
		{"Kill 1 Pondere", 3525},
		{"Kill 1 Hefty", 3550},
		{"Kill 6 Fiore Gladiator", 3600},
		{"Kill 6 Fiore Fighter", 3625},
		{"Kill 7 Fiore Pirate", 3650},
		{"Kill 1 Lomeo", 3675},
		{"Kill 1 Prince Aria", 3700},
		{"Kill 1 Devastate", 3725},
		{"Kill 1 Physicus", 3750},
		{"Kill 1 Floffy", 3775},
		{"Kill 4 Dead Troupe", 3800},
		{"Kill 4 Dead Troupe Captain", 3850},
		{"Kill 1 Ryu", 3950}
	}
    Material = {
		["Carrot"] = {"Kill 4 Beast Pirates", 2250},
		["Samurai's Bandage"] = {"Kill 1 Kitsune Samurai", 2650},
		["Bone"] = {"Kill 4 Skull Pirates", 3025},
		["Ice Crystal"] = {"Kill 4 Azlan", 3300},
		["Magma Crystal"] = {"Kill 4 The Volcano", 3325},
		["Dark Beard's Totem"] = {"Kill 4 Dark Beard Servant", 3400},
		["Lucidus's Totem"] = {"Kill 5 Vice Admiral", 3500},
		["Lost Ruby"] = {"Kill 1 Anubis", 3125},
		["Essence of Fire"] = {"Kill 1 Flame User", 3175},
		["Dragon's Orb"] = {"Kill 1 Elite Skeleton", 3075},
	}
    Sword = {
        ["Sunken Blade"] = {"Kill 1 Sunken Vessel", 3225},
        ["Cookie Sword"] = {"Kill 1 Biscuit Man", 3250},
        ["Metal Trident"] = {"Kill 1 Dough Master", 3275},
        ["Soul Cane"] = {"Kill 1 Sally", 3450},
    }
    Accessory = {
        ["Blue Scarf"] = {"Kill 1 Dough Master", 3275},
        ["Pondere Coat"] = {"Kill 1 Pondere", 3525},
        ["Hefty Glasses | Hefty Coat"] = {"Kill 1 Hefty", 3550},
        ["Lucidus Coat"] = {"Kill 1 Lucidus", 3575},
        ["Floffy Glasses"] = {"Kill 1 Floffy", 3775},
    }
elseif ID == 3 then
    PosMob = {
        [4000] = CFrame.new(1559, 35, 972),
        [4050] = CFrame.new(2838, 35, 1114),
        [4100] = CFrame.new(3407, 203, 880),
        [4150] = CFrame.new(1767, 58, 224),
        [4200] = CFrame.new(2929, 35, 84),
        [4250] = CFrame.new(1942, 35, -252),
        [4300] = CFrame.new(4363, 45, 9216),
        [4325] = CFrame.new(4800, 45, 10081),
        [4350] = CFrame.new(5566, 46, 9714),
        [4375] = CFrame.new(5877, 45, 9377),
        [4400] = CFrame.new(-728, 0, -8677),
        [4450] = CFrame.new(-70, 85, -8251),
        [4500] = CFrame.new(-116, 44, -9150),
        [4550] = CFrame.new(-5017, 23, 32),
        [4600] = CFrame.new(-5147, 22, 1065),
        [4650] = CFrame.new(-5906, 22, 439),
        [4700] = CFrame.new(-7407, 42, 503),
        [4750] = CFrame.new(-8250, 178, 234),   
    }
    DQuests = {
        {"The Pillar", 4000},
        {"Hide'n Seek!", 4000},
        {"Mossy Must Gone", 4000},
        {"Rolling in the Depth", 4000, "Deep Diver [Lv. 4000]"},
        {"Redemption", 4000, "Fugitive [Lv. 4050]"},
        {"Into the Bubble-Verse", 4000, "Cyborg Gorilla [Lv. 4375]"},
        {"Until Pond", 4000, "Ocean Gladiator [Lv. 4500]"},
    }
    Quests = {
        {"Kill 4 Deep Diver", 4000},
		{"Kill Fugitive", 4050},
		{"Kill 4 Deep one Villager", 4100},
		{"Kill 6 Fishman Guardian", 4150},
		{"Kill The deep one", 4200},
		{"Kill Fishman King's Guard", 4250},
		{"Kill 5 Jungle Gorilla", 4300},
		{"Kill 5 Wilderness Gorilla", 4325},
		{"Kill 5 Jungle Ape", 4350},
		{"Kill 1 Cyborg Gorilla", 4375},
		{"Kill 1 Ripcurrent Raider", 4400},
		{"Kill 1 Tidal Warrior", 4450},
		{"Kill 1 Ocean Gladiator", 4500},
		{"Kill 4 Deepfire Combatant", 4550},
		{"Kill 1 Electro Abyss Warrior", 4600},
		{"Kill 1 Inferno Diver", 4650},
		{"Kill 1 Tempest Tidebreaker", 4700},
		{"Kill 1 Abyssal Swordsman", 4750}
    }
    Material = {
		["Coral"] = {"Kill Fugitive", 4050},
		["Shark's Fin"] = {"Kill 6 Fishman Guardian", 4150},
		["Candy"] = {"Kill 5 Jungle Gorilla", 4300},
		["Essence of Fire"] = {"Kill 1 Inferno Diver", 4650},
	}
    Accessory = {
        ["Dominion Cloak"] = {"Kill 1 Abyssal Swordsman", 4750}
    }
end

function TP(pos, obj)
    obj = obj or LP.Character
    if not obj:FindFirstChild("HumanoidRootPart") then
        return
    end
    obj.HumanoidRootPart.CFrame = pos
end

function CheckQuest(npc)
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.CheckQuest:InvokeServer(workspace.AllNPC[npc])
end

function Accept(npc)
    TP(workspace.AllNPC[npc].CFrame * CFrame.new(0, 0, -5))
    repeat
        task.wait()
    until workspace.AllNPC[npc]:FindFirstChild(npc) and workspace.AllNPC[npc][npc].Head:FindFirstChild("ClickToTalk")
    CheckQuest(npc)
    task.wait(1)
    game:GetService("Players").LocalPlayer.PlayerGui.MainGui.BaseFrame.Visible = false
    SendKey(Enum.KeyCode.BackSlash)
    SendKey(Enum.KeyCode.Down)
    SendKey(Enum.KeyCode.Left)
    SendKey(Enum.KeyCode.Return)
    SendKey(Enum.KeyCode.BackSlash)
    game:GetService("Players").LocalPlayer.PlayerGui.MainGui.BaseFrame.Visible = true
end

CTabs({
    {"Farm", ""},
    {"Settings", ""},
    {"Fruits", ""},
    {"Shop", ""},
    {"Teleport", ""}
})

Tog("Farm", "Auto Level", function(v) if G["Auto Material"] then Obj["Auto Material"]:SetValue(false) Notify("Turn Off Auto Material", "Only Farm or Material", 5) end G["Auto Level"] = v end)
if ID == 1 then
    Tog("Farm", "Unlock Sea 2")
elseif ID == 2 then
    Tog("Farm", "Unlock Sea 3")
end
Tog("Farm", "Auto Daily Quest")
Label("Farm", "Material")
Tog("Farm", "Auto Material", function(v) if G["Auto Level"] then Obj["Auto Level"]:SetValue(false) Notify("Turn Off Auto Level", "Only Farm or Material", 5) end G["Auto Material"] = v end)
local MaterialName = {}
for i, v in next, Material do
    table.insert(MaterialName, i)
end
DD("Farm", "Select Material", "Select it before Auto", MaterialName, false, nil)
if ID == 2 or ID == 3 then
    Button("Teleport", "Sea 1", function()
        if ID == 2 then
            Accept("Elite Pirate")
        else
            Accept("The Squid")
        end
    end)
end
Tog("Farm", "Auto Quest")
local QuestName = {}
for i, v in next, Quests do
    table.insert(QuestName, i)
end
DD("Farm", "Select Quest", "", QuestName, false, nil)
if ID == 1 or ID == 3 then
    Button("Teleport", "Sea 2", function()
        local npc
        if ID == 1 then
            npc = "Elite Pirate"
        else
            npc = "The Squid"
        end
        TP(workspace.AllNPC[npc].CFrame * CFrame.new(0, 0, -5))
        repeat
            task.wait()
        until workspace.AllNPC[npc]:FindFirstChild(npc) and workspace.AllNPC[npc][npc].Head:FindFirstChild("ClickToTalk")
        CheckQuest(npc)
        task.wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.BaseFrame.Visible = false
        SendKey(Enum.KeyCode.BackSlash)
        SendKey(Enum.KeyCode.Down)
        SendKey(Enum.KeyCode.Left)
        SendKey(Enum.KeyCode.Left)
        SendKey(Enum.KeyCode.Return)
        SendKey(Enum.KeyCode.BackSlash)
        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.BaseFrame.Visible = true
    end)
end
if ID == 1 or ID == 2 then
    Button("Teleport", "Sea 3", function()
        if ID == 1 then
            Accept("Elite Pirate")
        else
            Accept("The Squid")
        end
    end)
end

Tog("Settings", "Bring Mob")

if not _G.Config then
    _G.Config = {
        ["Bring Mob"] = true,
    }
end

for i, v in next, _G.Config do
    Obj[i]:SetValue(v)
end

Window:SelectTab(1)

function Equip(name)
    name = name or LP.PlayerStats.SwordName.Value
    if LP.Backpack:FindFirstChild(name) then
        local tool = LP.Backpack[name]
        task.wait(1)
        LP.Character.Humanoid:EquipTool(tool)
    end
end

function Distance(pos, obj)
    if not obj or obj.Name == LP.Name then
        return LP:DistanceFromCharacter(pos.Position)
    end
    if typeof(pos) == "CFrame" then
        pos = pos.Position
    end
    return (pos - obj.HumanoidRootPart.Position).Magnitude
end

function Tween(pos, Speed, obj)
    Speed = Speed or 350
    obj = obj or LP.Character
    if not obj:FindFirstChild("HumanoidRootPart") then
        return
    end
    local D = Distance(pos, obj)
    if D > 500 then
        TP(pos * CFrame.new(0, 50, 0), obj)
        D = Distance(pos, obj)
    end
    local tween = game:GetService("TweenService"):Create(obj.HumanoidRootPart, TweenInfo.new(D / Speed, Enum.EasingStyle.Linear), {CFrame = pos})
    tween:Play()
    tween.Completed:Wait()
    tween:Cancel()
    task.wait(.1)
end

function CheckMons(name)
    if workspace.Monster.Mon:FindFirstChild(name) then
        return workspace.Monster.Mon
    end
    if workspace.Monster.Boss:FindFirstChild(name) then
        return workspace.Monster.Boss
    end
    return nil
end

function Hit(pos, weapon, tool)
    weapon = weapon or "SW"
    tool = tool or LP.PlayerStats.SwordName.Value
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(weapon .. "_" .. tool .. "_M1", {["MouseHit"] = pos * CFrame.Angles(-0, 0, -0)})
end

function Prompt(item, a, pos)
    a = a or CFrame.Angles(math.rad(180), 0, 0)
    pos = pos or CFrame.new(0, 0, 0)
    for _, v in next, workspace.SpawnItem:GetChildren() do
        if v.Name == item then
            TP(v.CFrame * pos)
            workspace.Camera.CFrame = v.CFrame * a
            task.wait(1)
            if v:FindFirstChild("PromptQuest") then
                v.PromptQuest.Enabled = true
                fireproximityprompt(v.PromptQuest)
            else
                v.ProximityPrompt.Enabled = true
                fireproximityprompt(v.ProximityPrompt)
            end
            task.wait(.1)
        end
    end
    task.wait(1)
end

function GetQuest(q)
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.Quest:InvokeServer("take", q)
end

function CheckDailyQuest()
    if not DQuests or #DQuests == 0 then
        return false
    end
    local a = game:GetService("HttpService"):JSONDecode(LP.PlayerStats.DailyQuest.Value)
    local temp = {}
    for _, v in next, DQuests do
        if not a[v[1]] then
            table.insert(temp, v)
        end
    end
    DQuests = temp
    return #DQuests > 0
end

function BringMob()
    local lv = tonumber(string.match(Mob, "%d+"))
    for _, v in next, ParentMob:GetChildren() do
        if v.Name == Mob and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            if not v.Head:FindFirstChild("tcode") then
                local a = Instance.new("BodyVelocity", v.Head)
                a.Name = "tcode"
                a.Velocity = Vector3.new(0, 0, 0)
                a.MaxForce = Vector3.new(100000, 100000, 100000)
            end
            if Distance(LockPos, v) <= 250 and Distance(LockPos, v) > 3 then
                Tween(LockPos, 500, v)
            end
            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
            v.HumanoidRootPart.Transparency = 1
            v.HumanoidRootPart.CanCollide = false
            v.Head.CanCollide = false
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
        end
    end
    FinishMagnet = true
end

function GetLockPos(lv)
    if Mob == "Chess Soldier [Lv. 3200]" then
        lv = lv + 1
    end
    LockPos = PosMob[lv]
end

function Kill(v, toggle, mob)
    Mob = mob or LP.PlayerGui.MainGui.QuestFrame.QuestBoard.TextFrame.QuestName.Text
    ParentMob = CheckMons(Mob)
    local lvl = tonumber(string.match(Mob, "%d+"))
    GetLockPos(lvl)
    if ParentMob then
        for _, v in next, ParentMob:GetChildren() do
            if v.Name == Mob and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                repeat
                    task.wait()
                    if lvl == 3050 then
                        if Distance(LockPos, v) > 300 then
                            if LockPos == PosMob[3050] then
                                LockPos = PosMob[3051]
                            else
                                LockPos = PosMob[3050]
                            end
                        end
                    end
                    Magnet = true
                    Equip()
                    repeat task.wait() until FinishMagnet
                    pcall(function()
                        TP(v.HumanoidRootPart.CFrame * Mode)
                        AttackPos = v.HumanoidRootPart.CFrame
                    end)
                    Attack = true
                until not G[toggle] or LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible == false or not v.Parent or v.Humanoid.Health <= 0
                Attack = false
                Magnet = false
                FinishMagnet = false
            end
        end
        TP(LockPos * CFrame.new(0, 100, 0))
        task.wait(1)
    else
        TP(LockPos * CFrame.new(0, 100, 0))
        task.wait(1)
    end
end

task.spawn(function()
    while task.wait() do
        if G["Auto Quest"] then
            local q, lv = unpack(Quests[G["Select Quest"]])
            if LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible == false or LP.CurrentQuest.Value ~= q then
                GetQuest(q)
                task.wait(1)
            else
                Kill(v, "Auto Quest")
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if G["Auto Daily Quest"] and CheckDailyQuest() then
            local q, lv, t = unpack(DQuests[1])
            if LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible == false or LP.CurrentQuest.Value ~= q then
                GetQuest(q)
                task.wait(1)
            else
                local a = LP.CurrentQuest.Value
                repeat
                    task.wait()
                    if a == "Forget and Forgot" then
                        Accept("Civilian Old")
                    elseif a == "Box Box!" then
                        Prompt("Box")
                        Accept("Civilian Port")
                        task.wait(1)
                    elseif a == "Venture Lagoons!" then
                        if not workspace.Ships:FindFirstChild(LP.Name .. " Ship") then
                            game:GetService("ReplicatedStorage").Chest.Remotes.Events.Ship:FireServer("Rowboat", "ShipA")
                        end
                        repeat
                            task.wait()
                        until workspace.Ships:FindFirstChild(LP.Name .. " Ship") and workspace.Ships[LP.Name .. " Ship"]:FindFirstChild("VehicleSeat")
                        local ship = workspace.Ships[LP.Name .. " Ship"]
                        repeat
                            task.wait()
                            TP(ship.VehicleSeat.CFrame)
                        until LP.Character.Humanoid.Sit == true
                        for _, v in next, workspace.SpawnItem:GetChildren() do
                            if v.Name == "Venture Lagoons!" then
                                TP(v.CFrame * CFrame.new(-3, 0, 0), ship)
                                SendKey("W", 1)
                            end
                        end
                        LP.Character.Humanoid.Sit = false
                    elseif a == "Bone Hunter" then
                        Prompt(a, CFrame.Angles(math.rad(135), 0, 0), CFrame.new(0, -5, 3))
                    elseif a == "Order Disobey" then
                        Prompt("PosterQuest", nil, CFrame.new(3, 0, 0))
                    elseif a == "Dead Above" then
                        Prompt("Floating Feather")
                    elseif a == "Catch me,If you can" then
                        Prompt("Catch me,If you can", CFrame.new(0, 0, 3))
                    elseif a == "Mossy Must Gone" then
                        Prompt("Mossy Must Gone", CFrame.Angles(math.rad(-90), 0, 0), CFrame.new(3, 0, 0))
                    elseif a == "Hide'n Seek!" then
                        Prompt(a, CFrame.Angles(math.rad(-120), 0, 0), CFrame.new(-3, 3, 0))
                    elseif a == "The Pillar"  then
                        Prompt(a)
                    elseif a == "The Lost Book" then
                        local v = workspace.Island["H - Fiore"]["Lost Book"].Main
                        TP(v.CFrame * CFrame.new(0, 0, -5))
                        workspace.Camera.CFrame = v.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
                        task.wait(1)
                        fireproximityprompt(v.ProximityPrompt)
                        task.wait(1)
                    elseif a == "I'm not,YOU ARE!" or a == "Under The Sea~" then
                        for _, v in next, workspace.SpawnItem:GetChildren() do
                            if v.Name == a then
                                Tween(v.CFrame)
                                task.wait(.1)
                            end
                        end
                        task.wait(1)
                    elseif t then
                        Kill(v, "Auto Daily Quest", t)
                    end
                until not G["Auto Daily Quest"] or LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible == false
            end
        elseif G["Auto Daily Quest"] then
            Obj["Auto Daily Quest"]:SetValue(false)
            Notify("Turn Off Daily Quests", "Not Found", 5)
        elseif G["Auto Material"] and G["Select Material"] then
            local temp = G["Select Material"]
            local q, lv = unpack(Material[temp])
            if LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible == false or LP.CurrentQuest.Value ~= q then
                GetQuest(q)
                task.wait(1)
            else
                Kill(v, "Auto Material")
            end
        elseif G["Auto Material"] then
            Obj["Auto Material"]:SetValue(false)
            Notify("Material", "Select Material Please", 5)
        end
    end
end)

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if G["Auto Level"] or G["Auto Daily Quest"] or G["Auto Material"] or G["Auto Accessory"] or G["Auto Sword"] or G["Unlock Sea 2"] or G["Unlock Sea 3"] or G["Auto Saber"] or G["Auto Big Mom"] or G["Auto GS"] or G["Auto Lord of Saber"] or G["Auto Ethereal"] or G["Auto Sea Event"] then
            if LP.Character:FindFirstChild("Head") and not LP.Character.Head:FindFirstChild("tcode") then
                local a = Instance.new("BodyVelocity", LP.Character.Head)
                a.Name = "tcode"
                a.Velocity = Vector3.new(0, 0, 0)
                a.MaxForce = Vector3.new(100000, 100000, 100000)
                -- LP.Character.Humanoid.Sit = false
                for _, v in next, LP.Character:GetDescendants() do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        elseif LP.Character:FindFirstChild("Head") and LP.Character.Head:FindFirstChild("tcode") then
            LP.Character.Head.tcode:Destroy()
        end
        if Attack and AttackPos then
            Hit(AttackPos)
            SendKey("Z")
            SendKey("X")
        end
        if G["Bring Mob"] and Magnet and LockPos and Mob and ParentMob then
            BringMob()
        end
    end)
end)
