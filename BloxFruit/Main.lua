local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    warn("⚠️ UI failed to load!(SCRIPT DOWN!)")
    return
else
    print("✓ UI loaded successfully!")
end

local Window = WindUI:CreateWindow({
    Title = "Lexs Hub",
    Icon = "rbxassetid://71947103252559",
    Author = "Premium | Blox Fruit",
    Folder = "LEXS_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:SetTheme("Dark")
        end,
    },
})

Window:Tag({
    Title = "v0.0.3.5",
    Color = Color3.fromRGB(255, 255, 255),
    Radius = 17,
})

WindUI:Notify({
    Title = "Lexs Hub Loaded",
    Content = "UI loaded successfully!",
    Duration = 3,
    Icon = "bell",
})

local Tab1 = Window:Tab({
    Title = "Info",
    Icon = "info",
})

local Tab2 = Window:Tab({
    Title = "Players",
    Icon = "user",
})

local Tab3 = Window:Tab({
    Title = "Shop",
    Icon = "shopping-bag",
})

local Tab4 = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2",
})

local Tab5 = Window:Tab({
    Title = "Stats",
    Icon = "chart-no-axes-column",
})

local Tab6 = Window:Tab({
    Title = "Race",
    Icon = "person-standing",
})

local Tab7 = Window:Tab({
    Title = "Teleport",
    Icon = "rocket",
})

local Tab8 = Window:Tab({
    Title = "Misc",
    Icon = "route",
})

local Tab9 = Window:Tab({
    Title = "settings",
    Icon = "settings",
})

Tab1:Section({
    Title = "Community",
    Icon = "chevrons-left-right-ellipsis",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab1:Divider()

Tab1:Button({
    Title = "Discord",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/YYbw8KM5x4")
        end
    end
})

Tab1:Divider()

Tab1:Section({
    Title = "Join discord for update",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

Tab2:Slider({
    Title = "Speed",
    Desc = false,
    Step = 1,
    Value = {
        Min = 18,
        Max = 100,
        Default = 18,
    },
    Callback = function(Value)
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = Value
    end
})

Tab2:Slider({
    Title = "Jump",
    Desc = false,
    Step = 1,
    Value = {
        Min = 50,
        Max = 500,
        Default = 50,
    },
    Callback = function(Value)
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = Value
    end
})

local Button = Tab2:Button({
    Title = "Join Marines Team",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end
})

local Button = Tab2:Button({
    Title = "Join Pirates Team",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
})

local Codes = {
    "NOMOREHACK",
    "BANEXPLOIT",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "EARN_FRUITS",
    "FIGHT4FRUIT",
    "NOEXPLOITER",
    "NOOB2ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "ADMINDARES",
    "fruitconcepts",
    "krazydares",
    "TRIPLEABUSE",
    "SEATROLLING",
    "24NOADMIN",
    "REWARDFUN",
    "Chandler",
    "NEWTROLL",
    "KITT_RESET",
    "Sub2CaptainMaui",
    "kittgaming",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "fudd10_v2",
    "SUB2GAMERROBOT_EXP1",
    "Sub2NoobMaster123",
    "Sub2UncleKizaru",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "StrawHatMaine",
    "Sub2OfficialNoobie",
    "Fudd10",
    "Bignews",
    "TheGreatAce",
    "SECRET_ADMIN",
    "SUB2GAMERROBOT_RESET1",
    "SUB2OFFICIALNOOBIE",
    "AXIORE",
    "BIGNEWS",
    "BLUXXY",
    "CHANDLER",
    "ENYU_IS_PRO",
    "FUDD10",
    "FUDD10_V2",
    "KITTGAMING",
    "MAGICBUS",
    "STARCODEHEO",
    "STRAWHATMAINE",
    "SUB2CAPTAINMAUI",
    "SUB2DAIGROCK",
    "SUB2FER999",
    "SUB2NOOBMASTER123",
    "SUB2UNCLEKIZARU",
    "TANTAIGAMING",
    "THEGREATACE"
}

local Button = Tab2:Button({
    Title = "Auto Redeem Codes",
    Desc = "Redeem semua kode otomatis",
    Locked = false,
    Callback = function()
        for _, code in ipairs(Codes) do
            pcall(function()
                game:GetService("ReplicatedStorage")
                    :WaitForChild("Remotes")
                    :WaitForChild("Redeem")
                    :InvokeServer(code)
            end)
            task.wait(0.1) -- jeda biar ga ke-detect spam
        end
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommF_ = ReplicatedStorage.Remotes.CommF_

Tab3:Button({
    Title = "Buy Black Leg $150,000",
    Desc = "Membeli Black Leg",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyBlackLeg")
    end
})

Tab3:Button({
    Title = "Buy Electro $550,000",
    Desc = "Membeli Electro",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyElectro")
    end
})

Tab3:Button({
    Title = "Buy Water Kung Fu $750,000",
    Desc = "Membeli Water Kung Fu",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyFishmanKarate")
    end
})

Tab3:Button({
    Title = "Buy Dragon Claw 1,500F",
    Desc = "Membeli Dragon Claw (1 & 2)",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
})

Tab3:Button({
    Title = "Buy Superhuman $3,000,000",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuySuperhuman")
    end
})

Tab3:Button({
    Title = "Buy Death Step $5,000,000 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyDeathStep")
    end
})

Tab3:Button({
    Title = "Buy Sharkman Karate $2,500,000 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuySharkmanKarate", true)
        CommF_:InvokeServer("BuySharkmanKarate")
    end
})

Tab3:Button({
    Title = "Buy Electric Claw $3,000,000 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyElectricClaw")
    end
})

Tab3:Button({
    Title = "Buy Dragon Talon $3,000,000 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyDragonTalon")
    end
})

Tab3:Button({
    Title = "Buy God Human $5,000,000 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuyGodhuman")
    end
})

Tab3:Button({
    Title = "Buy Sanguine Art $5,000,000 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BuySanguineArt", true)
        CommF_:InvokeServer("BuySanguineArt")
    end
})

local craftItems = {
    "Dragonheart", "Dragonstorm", "DinoHood", "SharkTooth",
    "TerrorJaw", "SharkAnchor", "LeviathanCrown", "LeviathanShield",
    "LeviathanBoat", "LegendaryScroll", "MythicalScroll"
}

for _, item in ipairs(craftItems) do
    Tab3:Button({
        Title = "Craft " .. item,
        Desc = "Buat item: " .. item,
        Locked = false,
        Callback = function()
            CommF_:InvokeServer("CraftItem", "Craft", item)
        end
    })
end

local hakiList = {
    {"Buy Geppo $10,000", "BuyHaki", "Geppo"},
    {"Buy Buso Haki $25,000", "BuyHaki", "Buso"},
    {"Buy Soru $25,000", "BuyHaki", "Soru"}
}

for _, data in ipairs(hakiList) do
    Tab3:Button({
        Title = data[1],
        Locked = false,
        Callback = function()
            CommF_:InvokeServer(data[2], data[3])
        end
    })
end

Tab3:Button({
    Title = "Buy Observation Haki $750,000",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("KenTalk", "Buy")
    end
})

local buyItems = {
    "Cutlass", "Katana", "Iron Mace", "Duel Katana", "Triple Katana",
    "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane",
    "Slingshot", "Musket", "Flintlock", "Refined Flintlock",
    "Cannon", "Black Cape", "Swordsman Hat", "Tomoe Ring"
}

for _, item in ipairs(buyItems) do
    Tab3:Button({
        Title = "Buy " .. item,
        Locked = false,
        Callback = function()
            CommF_:InvokeServer("BuyItem", item)
        end
    })
end

Tab3:Button({
    Title = "Buy Pole V2 5,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("ThunderGodTalk")
    end
})

Tab3:Button({
    Title = "Buy Kabucha 1,500F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
        CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    end
})

Tab3:Button({
    Title = "Buy Bizarre Rifle 250 Ectoplasm",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("Ectoplasm", "Buy", 1)
    end
})

Tab3:Button({
    Title = "Change Race Ghoul (Ectoplasm)",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("Ectoplasm", "Change", 4)
    end
})

Tab3:Button({
    Title = "Change Race Cyborg",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("CyborgTrainer", "Buy")
    end
})

Tab3:Button({
    Title = "Reset Stats 2,500F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
        CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})

Tab3:Button({
    Title = "Random Race 3,000F",
    Locked = false,
    Callback = function()
        CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
        CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Variabel toggle
local ToggleMelee = false
local ToggleDefense = false
local ToggleSword = false
local ToggleGun = false
local ToggleFruit = false

local AddAmount = 1

local function AddPoint(stat)
    local args = {"AddPoint", stat, AddAmount}
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

local MeleeToggle = Tab5:Toggle({
    Title = "Melee",
    Desc = "Tambah poin Melee otomatis",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        ToggleMelee = state
    end
})

local DefenseToggle = Tab5:Toggle({
    Title = "Defense",
    Desc = "Tambah poin Defense otomatis",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        ToggleDefense = state
    end
})

local SwordToggle = Tab5:Toggle({
    Title = "Sword",
    Desc = "Tambah poin Sword otomatis",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        ToggleSword = state
    end
})

local GunToggle = Tab5:Toggle({
    Title = "Gun",
    Desc = "Tambah poin Gun otomatis",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        ToggleGun = state
    end
})

local FruitToggle = Tab5:Toggle({
    Title = "Fruit",
    Desc = "Tambah poin Demon Fruit otomatis",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        ToggleFruit = state
    end
})

task.spawn(function()
    while task.wait(0.2) do
        local Points = LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data.Points
        if Points and Points.Value >= AddAmount then
            if ToggleMelee then AddPoint("Melee") end
            if ToggleDefense then AddPoint("Defense") end
            if ToggleSword then AddPoint("Sword") end
            if ToggleGun then AddPoint("Gun") end
            if ToggleFruit then AddPoint("Demon Fruit") end
        end
    end
end)


local Button = Tab9:Button({
    Title = "Fps Boost",
    Desc = "Boost Your Fps",
    Locked = false,
    Callback = function()
        local v1210 = true
        local l_game_0 = game
        local l_Workspace_2 = l_game_0.Workspace
        local _ = l_game_0.Lighting
        local _ = l_Workspace_2.Terrain
        settings().Rendering.QualityLevel = "Level01"
        for _, v1216 in pairs(l_game_0:GetDescendants()) do
            if not v1216:IsA("Part") and not v1216:IsA("Union") and not v1216:IsA("CornerWedgePart") and not v1216:IsA("TrussPart") then
                if v1216:IsA("Decal") or v1216:IsA("Texture") and v1210 then
                    v1216.Transparency = 1
                elseif v1216:IsA("ParticleEmitter") or v1216:IsA("Trail") then
                    v1216.Lifetime = NumberRange.new(0)
                elseif not v1216:IsA("Explosion") then
                    if v1216:IsA("Fire") or v1216:IsA("SpotLight") or v1216:IsA("Smoke") then
                        v1216.Enabled = false
                    end
                else
                    v1216.BlastPressure = 1
                    v1216.BlastRadius = 1
                end
            else
                v1216.Material = "Plastic"
                v1216.Reflectance = 0
            end
        end
    end
})


local Button = Tab7:Button({
    Title = "Join Sea 1",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})

local Button = Tab7:Button({
    Title = "Join Sea 2",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

local Button = Tab7:Button({
    Title = "Join Sea 3",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
