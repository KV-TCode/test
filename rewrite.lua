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

repeat task.wait() 
    if LP.PlayerGui:FindFirstChild("LoadingGUI") and LP.PlayerGui.LoadingGUI:FindFirstChild("Play") then
        LP.PlayerGui.LoadingGUI.Play.Visible = true
        game:GetService("GuiService").SelectedObject = LP.PlayerGui.LoadingGUI.Play
        task.wait(.1)
        SendKey(Enum.KeyCode.Return)
        task.wait(1)
        game:GetService("GuiService").SelectedObject = nil
    end
until LP:FindFirstChild("DataLoaded") and LP:FindFirstChild("DataLoaded").Value

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

function Section(tab, name)
    Tabs[tab]:AddSection(name)
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
    Obj[name] = Tabs[tab]:AddToggle(name, {Title = name, Callback = func or function(v) G[name] = v end})
end

function Slider(tab, name, desc, min, max, rnd, func)
    Obj[name] = Tabs[tab]:AddSlider(name, {Title = name, Description = desc, Min = min, Max = max, Default = min, Rounding = rnd, Callback = func or function(v) G[name] = v end})
end

function DD1(tab, name, desc, args, func)
    Obj[name] = Tabs[tab]:AddDropdown(name, {Title = name, Description = desc, Values = args, Multi = false, Default = "", Callback = func or function(v) G[name] = v end})
end

function DD2(tab, name, desc, args, func)
    Obj[name] = Tabs[tab]:AddDropdown(name, {Title = name, Description = desc, Values = args, Multi = true, Default = {}, Callback = func or function(a) G[name] = {} for i, v in next, a do G[name][i] = i end end})
end

function Box(tab, name, num, func)
    Obj[name] = Tabs[tab]:AddInput(name, {Title = name, Default = "", Numeric = num, Finished = true, Callback = func})
end
local IslandPos = {
    [1] = {
        ["Soldier Town"] = CFrame.new(-2334, 32, -2768),
        ["Raid"] = CFrame.new(-587, 76, -3583),
        ["Stone 2"] = CFrame.new(2042, 55, -4934),
        ["Stone"] = CFrame.new(5731, 78, -6708),
        ["Pirate Island"] = CFrame.new(-877, 34, -3313),
        ["Desert"] = CFrame.new(-2668, 23, -813),
        ["Fishland"] = CFrame.new(-1169, 16, 6229),
        ["Bubble"] = CFrame.new(1311, 30, 879),
        ["War"] = CFrame.new(1839, 12, -1985),
        ["Zombie"] = CFrame.new(-2519, 26, 3689),
        ["Sky"] = CFrame.new(-4231, 377, 1164),
        ["Chef Ship"] = CFrame.new(-4217, 169, -2887),
        ["Shark Park"] = CFrame.new(-833, 32, -1321),
        ["Starter"] = CFrame.new(-2110, 23, -4117),
        ["Lobby"] = CFrame.new(-1238, 24, 1803),
        ["Snow"] = CFrame.new(-5288, 33, -1382)
    },
    [2] = {
        ["Dead Tundra"] = CFrame.new(1017, 23, 880),
        ["Headquater"] = CFrame.new(-9648, 43, 953),
        ["Skull"] = CFrame.new(-5898, 381, 7179),
        ["Flower"] = CFrame.new(9333, 78, -4297),
        ["Carcer"] = CFrame.new(-4122, 41, 1402),
        ["Awake"] = CFrame.new(-4450, 86, 2121),
        ["Snow"] = CFrame.new(-5320, 141, -945),
        ["Fiore"] = CFrame.new(6287, 429, -3002),
        ["Floresco"] = CFrame.new(-4924, 66, 113),
        ["Loaf"] = CFrame.new(-769, 36, 7477),
        ["Raid"] = CFrame.new(-4537, 222, -96),
        ["Docks 3"] = CFrame.new(4755, 39, -2489),
        ["Docks 2"] = CFrame.new(-5886, 70, 1889),
        ["Docks 1"] = CFrame.new(-3493, 41, 163),
        ["Skull Docks"] = CFrame.new(-6521, 62, 5700),
        ["Lava"] = CFrame.new(285, 139, -4342),
        ["Pirate Skull"] = CFrame.new(-9076, 34, -5239)
    },
    [3] = {
        ["Colosseum"] = CFrame.new(-5379, 54, -827),
        ["Castle"] = CFrame.new(1978, 271, -848),
        ["Luma Grove"] = CFrame.new(-3920, 79, 6253),
        ["Cavern"] = CFrame.new(2282, 126, -1475),
        ["Docks 2"] = CFrame.new(3879, 50, 8642),
        ["Arena"] = CFrame.new(2372, 432, 9826),
        ["Docks 3"] = CFrame.new(-927, 30, -7685),
        ["Docks 4"] = CFrame.new(-4465, 34, 528),
        ["Raid"] = CFrame.new(2058, 61, 850),
        ["Docks 1"] = CFrame.new(2186, 40, 1302),
        ["Awake"] = CFrame.new(2067, 60, 567),
        ["Grave"] = CFrame.new(4376, 51, 11140),
        ["Castle 2"] = CFrame.new(4183, 433, 10444)
    }
}
local Boss = {
    ["Saber"] = "Expert Swordman [Lv. 3000]",
    ["Muramasa"] = "King Samurai [Lv. 3500]",
    ["Dragon"] = "Dragon [Lv. 5000]",
    ["BM"] = "Ms. Mother [Lv. 7500]",
    ["Saber2"] = "Lord of Saber [Lv. 8500]",
    ["Jack"] = "Jack o lantern [Lv. 10000]",
    ["Ethereal"] = "Bushido Ape [Lv. 5000]"
}
local Quests, DQuests, PosMob, Material, Sword, Accessory =  {}, {}, {}, {}, {}, {}
local Mode, Mob, ParentMob, LockPos, DialogueEnabled, Attack, AttackPos, SeaEvent = CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0)
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
		["Fresh Fish"] = {"Kill 4 Fighter Fishmans", 180, "Fighter Fishman [Lv. 180]"},
        ["Thief's rag"] = {"Kill 4 Desert Marauder", 675, "Desert Marauder [Lv. 675]"},
		["Angellic's Feather"] = {"Kill 4 Sky Soldier", 800, "Sky Soldier [Lv. 800]"},
        ["Gunpowder"] = {"Kill 4 Naval personnel", 1200, "Naval personnel [Lv. 1200]"},
        ["Undead's Ooze"] = {"Kill 5 Zombies", 1500, "Zombie [Lv. 1500]"},   
		["Twilight's Orb"] = {"Kill 1 Shadow Master", 1650, "Shadow Master [Lv 1650]"},
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
        [2700] = CFrame.new(-4528, 29, 1213),
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
		["Carrot"] = {"Kill 4 Beast Pirates", 2250, "Beast Pirate [Lv 2250]"},
		["Samurai's Bandage"] = {"Kill 1 Kitsune Samurai", 2650, "Kitsune Samurai [Lv 2650]"},
		["Bone"] = {"Kill 4 Skull Pirates", 3025, "Skull Pirate [Lv. 3050]"},
		["Ice Crystal"] = {"Kill 4 Azlan", 3300, "Azlan [Lv. 3300]"},
		["Magma Crystal"] = {"Kill 4 The Volcano", 3325, "The Volcano [Lv. 3325]"},
		["Dark Beard's Totem"] = {"Kill 4 Dark Beard Servant", 3400, "Dark Beard Servant [Lv. 3400]"},
		["Lucidus's Totem"] = {"Kill 5 Vice Admiral", 3500, "Vice Admiral [Lv. 3500]"},
		["Lost Ruby"] = {"Kill 1 Anubis", 3125, "Anubis [Lv. 3150]"},
		["Essence of Fire"] = {"Kill 1 Flame User", 3175, "Flame User [Lv 3200]"},
		["Dragon's Orb"] = {"Kill 1 Elite Skeleton", 3075, "Elite Skeleton [Lv. 3100]"},
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
        ["Hefty Coat"] = {"Kill 1 Hefty", 3550},
        ["Lucidus Coat"] = {"Kill 1 Lucidus", 3575},
        ["Floffy Glasses"] = {"Kill 1 Floffy", 3775},
    }
elseif ID == 3 then
    PosMob = {
        [4000] = CFrame.new(1559, 35, 972),
        [4050] = CFrame.new(2838, 35, 1114),
        [4100] = CFrame.new(3407, 203, 880),
        [4150] = CFrame.new(1752, 66, 205),
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
        [4750] = CFrame.new(-8250, 178, 234)
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

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
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

function Dialogue(npc, button)
    DialogueEnabled = true
    TP(workspace.AllNPC[npc].CFrame * CFrame.new(0, 0, -5))
    task.wait(1)
    CheckQuest(npc)
    repeat task.wait() until LP.PlayerGui:FindFirstChild(npc) and LP.PlayerGui[npc]:FindFirstChild("Dialogue") and LP.PlayerGui[npc].Dialogue:FindFirstChild(button) and LP.PlayerGui[npc].Dialogue[button].Visible
    task.wait(1)
    game:GetService("GuiService").SelectedObject = LP.PlayerGui[npc].Dialogue[button]
    task.wait(.1)
    SendKey(Enum.KeyCode.Return)
    task.wait()
    game:GetService("GuiService").SelectedObject = nil
    DialogueEnabled = false
end

function Buy(npc)
    Dialogue(npc, "Accept")
end

function GetDQuests()
    local a = game:GetService("HttpService"):JSONDecode(LP.PlayerStats.DailyQuest.Value)
    local temp = {}
    for _, v in next, DQuests do
        if not a[v[1]] and LP.PlayerStats.lvl.Value >= v[2] then
            table.insert(temp, v)
        end
    end
    if #temp == 0 then
        return nil
    end
    return temp
end

CTabs({
    {"Home", ""},
    {"Settings", ""},
    {"Sea", ""},
    {"Boss", ""},
    {"Fruits", ""},
    {"Shop", ""},
    {"Teleport", ""}
})

Section("Home", "Auto")

Tog("Home", "Auto Level", function(v)
    G["Auto Level"] = v
    if v == true and G["Auto Material"] then
        Obj["Auto Material"]:SetValue(false)
        Notify("Turn Off Auto Material", "Only Farm or Material", 5)
    end 
end)
Tog("Home", "Next Sea")
Tog("Home", "Daily Quest")
Section("Home", "Material")
Tog("Home", "Auto Material", function(v)
    G["Auto Material"] = v
    if v == true then
        if G["Auto Level"] then
            Obj["Auto Level"]:SetValue(false)
            Notify("Turn Off Auto Level", "Only Farm or Material", 5)
        end
        if not G["Select Material"] then
            Obj["Auto Material"]:SetValue(false)
            Notify("Material", "Select Material Please", 5)
        end
    end
end)
local MaterialName = {}
for i, v in next, Material do
    table.insert(MaterialName, i)
end
DD1("Home", "Select Material", "Select it before Auto", MaterialName)

Section("Home", "Test")

Tog("Home", "Auto Quest")
local QuestName = {}
for i, v in next, Quests do
    table.insert(QuestName, i)
end
DD1("Home", "Select Quest", "", QuestName)

Section("Settings", "Farm")
Tog("Settings", "Accept Quest")
Tog("Settings", "Bring Mob")
DD1("Settings", "Mode", "", {"Above", "Behind", "Below"}, function(v)
    G["Mode"] = v
    if v == "Above" then
        Mode = CFrame.new(0, G["Distance"], 0) * CFrame.Angles(math.rad(-90), 0, 0)
    elseif v == "Below" then
        Mode = CFrame.new(0, -G["Distance"], 0) * CFrame.Angles(math.rad(90), 0, 0)
    else
        Mode = CFrame.new(0, 0, G["Distance"])
    end
end)
Box("Settings", "Distance", true, function(v)
    G["Distance"] = v
    if G["Mode"] == "Above" then
        Mode = CFrame.new(0, G["Distance"], 0) * CFrame.Angles(math.rad(-90), 0, 0)
    elseif G["Mode"] == "Below" then
        Mode = CFrame.new(0, -G["Distance"], 0) * CFrame.Angles(math.rad(90), 0, 0)
    else
        Mode = CFrame.new(0, 0, G["Distance"])
    end
end)

Section("Settings", "MISC")
Tog("Settings", "Auto Haki")
Tog("Settings", "Auto Ken")
Tog("Settings", "Hide Notification", function(v) LP.PlayerGui.Popup.Frame.Visible = v end)

Section("Settings", "Stats")
Tog("Settings", "Auto Stat")
DD2("Settings", "Select Stat", "Melee -> Sword -> Defense -> DF", {"Melee", "sword", "Defense", "DF"})
if ID == 2 or ID == 3 then
    Section("Sea", "Auto")
    Tog("Sea", "Auto Sea Event")
    if ID == 2 then
        Tog("Sea", "Auto GS")
    end
    Section("Sea", "Status")
else
    Section("Sea", "Not Support Sea 1")
end

Section("Boss", "Raid Boss")
if ID == 1 then
    Tog("Boss", "Auto Saber")
elseif ID == 2 then
    Tog("Boss", "Auto Muramasa")
    Tog("Boss", "Auto BM")
    Tog("Boss", "Auto Dragon")
elseif ID == 3 then
    Tog("Boss", "Auto Jack o lantern")
    Tog("Boss", "Auto Lord of Saber")
    Tog("Boss", "Auto Etheral")
end

Section("Teleport", "TP Island by Gate Fruit")
local IslandName = {}
for i, v in next, IslandPos[ID] do
    table.insert(IslandName, i)
end
DD1("Teleport", "Select Island", "Select it before TP", IslandName)
Button("Teleport", "TP Island", function()
    if G["Select Island"] == "" then
        Notify("TP Island", "Select Island Pls", 5)
    else
        TP(IslandPos[ID][G["Select Island"]])
    end
end)

Section("Teleport", "TP Sea")

if ID ~= 1 then
    Button("Teleport", "Sea 1", function()
        if ID == 2 then
            Dialogue("Elite Pirate", "Accept")
        else
            Dialogue("The Squid", "Accept")
        end
    end)
end

if ID ~= 2 then
    Button("Teleport", "Sea 2", function()
        if ID == 1 then
            Dialogue("Elite Pirate", "Accept")
        else
            Dialogue("The Squid", "SecondSea")
        end
    end)
end
if ID ~= 3 then
    Button("Teleport", "Sea 3", function()
        if ID == 1 then
            Dialogue("Elite Pirate", "ThirdSea")
        else
            Dialogue("The Squid", "Accept")
        end
    end)
end
if ID == 1 then
    Section("Shop", "Skill")
    Button("Shop", "Buso", function() Buy("BusoShop") end)
    Button("Shop", "Soru", function() Buy("SoruShop") end)
    Button("Shop", "Ken", function() Buy("KenShop") end)
end
Section("Shop", "Melee")
Button("Shop", "Dark Leg", function() Buy("DarkLegShop") end)
Button("Shop", "Water Style", function() Buy("WaterStyleShop") end)
Button("Shop", "Cyborg", function() Buy("CyborgShop") end)
if ID ~= 1 then
    Button("Shop", "Electro", function() Buy("ElectroShop") end)
    Button("Shop", "Dragon Claw", function() Buy("DragonClawShop") end)
end
Section("Shop", "Sword & Accessrory")
if ID == 2 then
    Button("Shop", "Bubble", function() Buy("BubbleSeller") end)
end
Section("Shop", "MISC")
local Codes = {
    "X100KSuccess", "PvPArenaFun", "LegendarySwordsUnlocked", "Update7.1", "WELCOMETOKINGLEGACY", "FruitAwakeningTime", "SKFreeGems", "TelekinesisFruitPower", "InfernoKingAwaits", "Peodiz", "IslandQuestRepeat", "SKGames", "DinoxLive", "RainbowDragon", "Update7Release", "OwnerMeteor", "QuakeTsunamiBoost", "EpicAdventure", "DragonColorRefund", "SeaAdventure", "2MFAV", "Dinosaur100kFollowers", "FREESTATSRESET", "<3LEEPUNGG", "FREE30MINUTESEXP", "PassiveMaster", "ThirdSeaAdventures", "MaterialHunter", "MysticAccessoryFind", "GetYourLuck", "BossSlayer", "KrakensRevenge", "DragonColorsUnlocked", "PlayKingLegacyFor5Gems", "KioruV2PowerUp"}
Button("Shop", "Redeem Code", function() for _, v in next, Codes do game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer(v) task.wait(5) end end)
Button("Shop", "Reset Stats", function() Buy("ResetStatsShop") end)
Button("Shop", "Reroll Race", function() Buy("RaceRerollsGem") end)

Section("Teleport", "Server")

Button("Teleport", "Rejoin", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
end)

Button("Teleport", "Hop", function()
    Hop()
end)

Box("Teleport", "Join JobId", false, function(v)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v, game.Players.LocalPlayer)
end)

if not _G.Config then
    _G.Config = {
        ["Accept Quest"] = true,
        ["Auto Haki"] = true,
        ["Auto Ken"] = true,
        ["Bring Mob"] = true,
        ["Distance"] = 8,
        ["Mode"] = "Above",
        ["Hide Notification"] = true,
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
    if D > 1000 then
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
    if pos then
        game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(weapon .. "_" .. tool .. "_M1", {["MouseHit"] = pos * CFrame.Angles(-0, 0, -0)})
    else
        game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(weapon .. "_" .. tool .. "_M1")
    end
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

function BringMob()
    local lv = tonumber(string.match(Mob, "%d+"))
    for _, v in next, ParentMob:GetChildren() do
        if v.Name == Mob and v:FindFirstChild("HumanoidRootPart") then
            -- if ParentMob.Name == "Mon" then
            --     if Distance(LockPos, v) <= 300 and Distance(LockPos, v) > 5 then
            --         -- Tween(LockPos, 500, v)
            --         TP(LockPos, v)
            --     end
            --     if lv == 800 or lv == 900 or lv == 3500 then --  
            --         v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            --     else
            --         v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
            --     end
            -- end
            -- if v.Humanoid:FindFirstChild("Animator") then
            --     v.Humanoid.Animator:Destroy()
            -- end
            if Distance(LockPos, v) <= 300 then
                v.HumanoidRootPart.CFrame = LockPos * CFrame.new(math.random(-1, 1), 0, math.random(-1, 1))
            end
            v.HumanoidRootPart.CanCollide = false
            -- sethiddenproperty(LP,"SimulationRadius",math.huge)
        end
    end
end

function GetLockPos(lv)
    if Mob == "Chess Soldier [Lv. 3200]" then
        lv = lv + 1
    end
    LockPos = PosMob[lv]
end

function Kill(toggle, mob)
    Mob = mob or LP.PlayerGui.MainGui.QuestFrame.QuestBoard.TextFrame.QuestName.Text
    ParentMob = CheckMons(Mob)
    local lv = tonumber(string.match(Mob, "%d+"))
    GetLockPos(lv)
    if ParentMob then
        -- for _, v in next, ParentMob:GetChildren() do
        --     if v.Name == Mob and v:FindFirstChild("HumanoidRootPart") then
        --         TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, G["Distance"]))
        --         Hit()
        --         task.wait(.5)
        --     end
        -- end
        for _, v in next, ParentMob:GetChildren() do
            if v.Name == Mob and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                repeat
                    task.wait()
                    if Distance(LockPos, v) > 1000 then
                        if LockPos == PosMob[lv] then
                            LockPos = PosMob[lv + 1]
                        else
                            LockPos = PosMob[lv]
                        end
                    end
                    Equip()
                    pcall(function()
                        TP(v.HumanoidRootPart.CFrame * Mode)
                        AttackPos = v.HumanoidRootPart.CFrame
                    end)
                    if G["Bring Mob"] then
                        BringMob()
                    end
                    Attack = true
                until DialogueEnabled or not G[toggle] or not v.Parent or v.Humanoid.Health <= 0
                Attack = false
            end
        end
        TP(LockPos * CFrame.new(50, 100, 50))
        task.wait(.1)
    else
        TP(LockPos * CFrame.new(50, 100, 50))
        task.wait(1)
    end
end

function QuestLv(lv)
    local l, r, ans = 1, #Quests
    while l <= r do
        local m = math.floor((l + r) / 2)
        if  Quests[m][2] <= lv then
            ans, l = Quests[m], m + 1
        else
            r = m - 1
        end
    end
    return ans
end

function CheckBoss(name)
    return game:GetService("ReplicatedStorage").MOB:FindFirstChild(name) or workspace.Monster.Boss:FindFirstChild(name)
end

function KillBoss(boss, toggle)
    if workspace.Monster.Boss:FindFirstChild(boss) then
        local v = workspace.Monster.Boss[boss]
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            repeat
                task.wait()
                Equip()
                pcall(function()
                    TP(v.HumanoidRootPart.CFrame * Mode)
                    AttackPos = v.HumanoidRootPart.CFrame
                end)
                Attack = true
            until DialogueEnabled or not G[toggle] or not v.Parent or v.Humanoid.Health <= 0
            Attack = false
        end
    elseif CheckBoss(boss) then
        TP(game:GetService("ReplicatedStorage").MOB[boss].HumanoidRootPart.CFrame * CFrame.new(50, 100, 50))
        task.wait(.1)
    end
end

task.spawn(function()
    while task.wait() do
        if G["Auto Quest"] then
            local q, lv = unpack(Quests[G["Select Quest"]])
            if not LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible or LP.CurrentQuest.Value ~= q then
                GetQuest(q)
                task.wait(.1)
            else
                Kill("Auto Quest")
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not DialogueEnabled then
            if G["Auto Sea Event"] and SeaEvent then
            elseif G["Auto GS"] and (workspace.GhostMonster:FindFirstChild("Ghost Ship") or workspace:FindFirstChild("Chest1")) then
                local v = workspace.GhostMonster:FindFirstChild("Ghost Ship")
                if v and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat
                        task.wait()
                        Equip()
                        pcall(function()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                            AttackPos = v.HumanoidRootPart.CFrame
                        end)
                        Attack = true
                    until DialogueEnabled or not G["Auto GS"] or not v.Parent or v.Humanoid.Health <= 0
                    Attack = false
                end
                task.wait(1)
                local old = LP.PlayerStats.Accessory.Value
                task.wait(1)
                game:GetService("ReplicatedStorage").Chest.Remotes.Functions.AccessoryEq:InvokeServer("Bullitus")
                repeat
                    task.wait(1)
                    local flag = false
                    for _, v in next, workspace:GetChildren() do
                        if string.find(v.Name, "Chest") and v:FindFirstChild("RootPart") then
                            flag = true
                            TP(v.RootPart.CFrame)
                            task.wait(2)
                        end
                    end
                until not flag
                TP(LP.Character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                task.wait(1)
                game:GetService("ReplicatedStorage").Chest.Remotes.Functions.AccessoryEq:InvokeServer(old)
            elseif G["Auto Skull King"] and workspace.SeaMonster:FindFirstChild("Skull King") then
            elseif G["Auto Lord of Saber"] and CheckBoss(Boss["Saber2"]) then
                KillBoss(Boss["Saber2"], "Auto Lord of Saber")
            elseif G["Auto Ethereal"] and CheckBoss(Boss["Ethereal"]) then
                KillBoss(Boss["Ethereal"], "Auto Ethereal")
            elseif G["Auto Jack o lantern"] and CheckBoss(Boss["Jack"]) then
                KillBoss(Boss["Jack"], "Auto Jack o lantern")
            elseif G["Auto BM"] and CheckBoss(Boss["BM"]) then
                KillBoss(Boss["BM"], "Auto BM")
            elseif G["Auto Muramasa"] and CheckBoss(Boss["Muramasa"]) then
                KillBoss(Boss["Muramasa"], "Auto Muramasa")
            elseif G["Auto Dragon"] and CheckBoss(Boss["Dragon"]) then
                KillBoss(Boss["Dragon"], "Auto Dragon")
            elseif G["Auto Saber"] and CheckBoss(Boss["Saber"]) then
                KillBoss(Boss["Saber"], "Auto Saber")
            elseif G["Auto Daily Quest"] and GetDQuests()  then
                local q, lv, mob = unpack(GetDQuests()[1])
                local lvl = LP.PlayerStats.lvl.Value
                if (lvl >= lv) and ((not LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible) or (LP.CurrentQuest.Value ~= q)) then
                    GetQuest(q)
                    task.wait(.1)
                else
                    local a = LP.CurrentQuest.Value
                    repeat
                        task.wait()
                        if a == "Forget and Forgot" then
                            Dialogue("Civilian Old", "Accept")
                        elseif a == "Box Box!" then
                            Prompt("Box")
                            Dialogue("Civilian Port", "Accept")
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
                                    TP(v.CFrame, ship)
                                    SendKey("W", 1)
                                end
                            end
                            LP.Character.Humanoid.Sit = false
                            task.wait(.1)
                            TP(LP.Character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                            task.wait(1)
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
                        elseif mob then
                            Kill("Auto Daily Quest", mob)
                        end
                    until DialogueEnabled or not G["Auto Daily Quest"] or not LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible
                end
            elseif G["Auto Material"] and G["Select Material"] then
                local lvl, q, lv, mob = LP.PlayerStats.lvl.Value, unpack(Material[G["Select Material"]])
                if G["Accept Quest"] and lvl >= lv and ((not LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible) or LP.CurrentQuest.Value ~= q) then
                    GetQuest(q)
                    task.wait(.1)
                else
                    Kill("Auto Material", mob)
                end
            elseif G["Auto Level"] then
                local lvl = LP.PlayerStats.lvl.Value
                if G["Next Sea"] then
                    if ID == 1 then
                            if lvl >= 2250 and LP.PlayerStats.SecondSeaProgression.Value == "No" then
                                local q = "Second Sea Map"
                                if not LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible or LP.CurrentQuest.Value ~= q then
                                    GetQuest(q)
                                    task.wait(.1)
                                else
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerStats.Material.Value, "Map") then
                                        Dialogue("Traveler", "Accept")
                                    else
                                        Kill("Next Sea", "Seasoned Fishman [Lv. 2200]")
                                    end
                                end
                            else
                                Obj["Next Sea"]:SetValue(false)
                                Notify("Next Sea", "Now, u can go to Sea 2 in Teleport Tab", 5)
                            end
                    elseif ID == 2 then
                        if lvl >= 4000 then
                            
                        end
                    end
                else
                    local q, lv = unpack(QuestLv(lvl))
                    if lvl >= lv and ((not LP.PlayerGui.MainGui.QuestFrame.QuestBoard.Visible) or LP.CurrentQuest.Value ~= q) then
                        GetQuest(q)
                        task.wait(.1)
                    else
                        Kill("Auto Level")
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if G["Auto Haki"] and LP.PlayerStats.BusoShopValue.Value == "BusoHaki" and LP.Character:FindFirstChild("Services") and LP.Character.Services:FindFirstChild("Haki") and LP.Character.Services.Haki.Value == 0 then
            game:GetService("ReplicatedStorage").Chest.Remotes.Events.Armament:FireServer()
        end
        if G["Auto Ken"] and LP.PlayerStats.KenShopValue.Value == "KenHaki" and LP.Character:FindFirstChild("Services") and LP.Character.Services:FindFirstChild("KenOpen") and not LP.Character.Services.KenOpen.Value and LP.Character.Services.KenHaki.Value > 0 then
            SendKey("Y")
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if G["Auto Stat"] and G["Select Stat"] and LP.PlayerStats.Points.Value > 0 then
            for _, v in next, G["Select Stat"] do
                if LP.PlayerStats[v].Value < 4800 then
                    LP.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(v, LP.PlayerStats.Points.Value)
                    break
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Attack then
            Hit(AttackPos)
            AttackPos = nil
            SendKey("Z")
            SendKey("X")
        end
    end
end)
task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if DialogueEnabled or G["Auto Level"] or G["Auto Daily Quest"] or G["Auto Material"] or G["Auto Accessory"] or G["Auto Sword"] or G["Auto Saber"] or G["Auto BM"] or G["Auto Muramasa"] or G["Auto Dragon"] or G["Auto GS"] or G["Auto Lord of Saber"] or G["Auto Ethereal"] or G["Auto Sea Event"] then
            if LP.Character:FindFirstChild("Head") and not LP.Character.Head:FindFirstChild("tcode") then
                local a = Instance.new("BodyVelocity", LP.Character.Head)
                a.Name = "tcode"
                a.Velocity = Vector3.new(0, 0, 0)
                a.MaxForce = Vector3.new(100000, 100000, 100000)
                for _, v in next, LP.Character:GetDescendants() do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        elseif LP.Character:FindFirstChild("Head") and LP.Character.Head:FindFirstChild("tcode") then
            LP.Character.Head.tcode:Destroy()
        end
    end)
end)
