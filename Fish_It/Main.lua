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
    Author = "Freemium | Fish It",
    Folder = "Lexs_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
})

Window:EditOpenButton({
    Title = "Lexs Hub",
    Icon = "rbxassetid://71947103252559",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("#00fbff"), 
        Color3.fromHex("#ffffff")
    ),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "v0.0.5.7",
    Color = Color3.fromRGB(255, 255, 255),
    Radius = 17,
})

local executorName = "Unknown"
if identifyexecutor then
    executorName = identifyexecutor()
elseif getexecutorname then
    executorName = getexecutorname()
elseif executor then
    executorName = executor
end

-- Pilih warna berdasarkan executor
local executorColor = Color3.fromRGB(200, 200, 200) -- Default (abu-abu)

if executorName:lower():find("flux") then
    executorColor = Color3.fromHex("#30ff6a")     -- Fluxus
elseif executorName:lower():find("delta") then
    executorColor = Color3.fromHex("#38b6ff")     -- Delta
elseif executorName:lower():find("arceus") then
    executorColor = Color3.fromHex("#a03cff")     -- Arceus X
elseif executorName:lower():find("krampus") or executorName:lower():find("oxygen") then
    executorColor = Color3.fromHex("#ff3838")     -- Krampus / Oxygen
elseif executorName:lower():find("volcano") then
    executorColor = Color3.fromHex("#ff8c00")     -- Volcano
elseif executorName:lower():find("synapse") or executorName:lower():find("script") or executorName:lower():find("krypton") then
    executorColor = Color3.fromHex("#ffd700")     -- Synapse / Script-Ware / Krypton
elseif executorName:lower():find("wave") then
    executorColor = Color3.fromHex("#00e5ff")     -- Wave
elseif executorName:lower():find("zenith") then
    executorColor = Color3.fromHex("#ff00ff")     -- Zenith
elseif executorName:lower():find("seliware") then
    executorColor = Color3.fromHex("#00ffa2")     -- Seliware
elseif executorName:lower():find("krnl") then
    executorColor = Color3.fromHex("#1e90ff")     -- KRNL
elseif executorName:lower():find("trigon") then
    executorColor = Color3.fromHex("#ff007f")     -- Trigon
elseif executorName:lower():find("nihon") then
    executorColor = Color3.fromHex("#8a2be2")     -- Nihon
elseif executorName:lower():find("celery") then
    executorColor = Color3.fromHex("#4caf50")     -- Celery
elseif executorName:lower():find("lunar") then
    executorColor = Color3.fromHex("#8080ff")     -- Lunar
elseif executorName:lower():find("valyse") then
    executorColor = Color3.fromHex("#ff1493")     -- Valyse
elseif executorName:lower():find("vega") then
    executorColor = Color3.fromHex("#4682b4")     -- Vega X
elseif executorName:lower():find("electron") then
    executorColor = Color3.fromHex("#7fffd4")     -- Electron
elseif executorName:lower():find("awp") then
    executorColor = Color3.fromHex("#ff005e") -- AWP (merah neon ke pink)
elseif executorName:lower():find("bunni") or executorName:lower():find("bunni.lol") then
    executorColor = Color3.fromHex("#ff69b4") -- Bunni.lol (Hot Pink / Neon Pink)
end

-- Buat Tag UI
local TagUI = Window:Tag({
    Title = "EXECUTOR | " .. tostring(executorName),
    Icon = "github",
    Color = executorColor,
    Radius = 0
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

Tab1:Section({
    Title = "Community Support",
    Icon = "hand-fist",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab1:Divider()

Tab1:Button({
    Title = "Discord",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/KDKTYUMyWA")
        end
    end
})

local Section = Tab1:Section({
    Title = "Join discord for update",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local Tab2 = Window:Tab({
    Title = "Players",
    Icon = "user"
})

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
    Title = "Reset Jump Power",
    Desc = "Return Jump Power to normal (50)",
    Callback = function()
        _G.CustomJumpPower = 50
        local humanoid = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = 50
        end
        print("🔄 Jump Power reset to 50")
    end
})

Player.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.UseJumpPower = true
    humanoid.JumpPower = _G.CustomJumpPower or 50
end)

Tab2:Button({
    Title = "Reset Speed",
    Desc = "Return speed to normal (16)",
    Callback = function()
        Humanoid.WalkSpeed = 16
        print("WalkSpeed reset to default (16)")
    end
})

Tab2:Divider()

local UserInputService = game:GetService("UserInputService")

local Toggle = Tab2:Toggle({
    Title = "Infinite Jump",
    Desc = "activate to use infinite jump",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.InfiniteJump = state
        if state then
            print("✅ Infinite Jump Active")
        else
            print("❌ Infinite Jump Inactive")
        end
    end
})

UserInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump then
        local character = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local Toggle = Tab2:Toggle({
    Title = "Noclip",
    Desc = "Walk through walls",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.Noclip = state
        task.spawn(function()
            local Player = game:GetService("Players").LocalPlayer
            while _G.Noclip do
                task.wait(0.1)
                if Player.Character then
                    for _, part in pairs(Player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide == true then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    end
})

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local isFrozen = false
local lastPos = nil

local function notify(msg, color)
	pcall(function()
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[FREEZE] " .. msg,
			Color = color or Color3.fromRGB(150,255,150),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
	end)
end

local function freezeCharacter(char)
	if not char then return end
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if not humanoid or not root then return end

	lastPos = root.CFrame

	humanoid.WalkSpeed = 0
	humanoid.JumpPower = 0
	humanoid.AutoRotate = false
	humanoid.PlatformStand = true

	for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
		pcall(function() track:Stop(0) end)
	end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if animator then
		pcall(function() animator:Destroy() end)
	end

	root.Anchored = true
end

local function unfreezeCharacter(char)
	if not char then return end
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if humanoid then
		humanoid.WalkSpeed = 16
		humanoid.JumpPower = 50
		humanoid.AutoRotate = true
		humanoid.PlatformStand = false
		if not humanoid:FindFirstChildOfClass("Animator") then
			local newAnimator = Instance.new("Animator")
			newAnimator.Parent = humanoid
		end
	end

	if root then
		root.Anchored = false
		if lastPos then
			root.CFrame = lastPos
		end
	end
end

local function toggleFreeze(state)
	isFrozen = state
	local char = player.Character or player.CharacterAdded:Wait()

	if state then
		freezeCharacter(char)
		notify("Freeze character", Color3.fromRGB(100,200,255))
	else
		unfreezeCharacter(char)
		notify("Character released", Color3.fromRGB(255,150,150))
	end
end

local Toggle = Tab2:Toggle({
	Title = "Freeze Character",
	Desc = "freeze your character",
	Icon = false,
	Type = false,
	Value = false,
	Callback = function(state)
		toggleFreeze(state)
	end
})

player.CharacterAdded:Connect(function(char)
	if isFrozen then
		task.wait(0.5)
		freezeCharacter(char)
	end
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Fungsi untuk stop semua animasi yang sedang berjalan
local function stopAllAnimations()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if humanoid then
		for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
			track:Stop(0) -- stop langsung tanpa fade
		end
	end
end

-- Fungsi toggle animasi
local function toggleAnimation(state)
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local animate = char:FindFirstChild("Animate")

	if state then
		---------------------------------------------------
		-- 🟢 MATIKAN SEMUA ANIMASI
		---------------------------------------------------
		print("[ANIM] Semua animasi dinonaktifkan")
		if animate then animate.Disabled = true end
		stopAllAnimations()

		-- Nonaktifkan animator agar game tidak bisa memutar ulang animasi
		local animator = humanoid:FindFirstChildOfClass("Animator")
		if animator then
			animator:Destroy()
		end
	else
		---------------------------------------------------
		-- 🔴 AKTIFKAN KEMBALI ANIMASI
		---------------------------------------------------
		print("[ANIM] Animasi diaktifkan kembali")
		if animate then animate.Disabled = false end

		-- Buat ulang Animator agar animasi bisa jalan lagi
		if humanoid and not humanoid:FindFirstChildOfClass("Animator") then
			local newAnimator = Instance.new("Animator")
			newAnimator.Parent = humanoid
		end
	end
end

local Toggle = Tab2:Toggle({
	Title = "Disable Animations",
	Icon = false,
	Type = false,
	Value = false,
	Callback = function(state)
		toggleAnimation(state)
	end
})

_G.AutoFishing = false
_G.AutoEquipRod = false
_G.Instant = false
_G.InstantDelay = _G.InstantDelay or 0.35
_G.CallMinDelay = _G.CallMinDelay or 0.18
_G.CallBackoff = _G.CallBackoff or 1.5

local lastCall = {}
local function safeCall(k, f)
    local n = os.clock()
    if lastCall[k] and n - lastCall[k] < _G.CallMinDelay then
        task.wait(_G.CallMinDelay - (n - lastCall[k]))
    end
    local ok, result = pcall(f)
    lastCall[k] = os.clock()
    if not ok then
        local msg = tostring(result):lower()
        task.wait(msg:find("429") or msg:find("too many requests") and _G.CallBackoff or 0.2)
    end
    return ok, result
end

local RS = game:GetService("ReplicatedStorage")
local net = RS.Packages._Index["sleitnick_net@0.2.0"].net

local function rod()
    safeCall("rod", function()
        net["RE/EquipToolFromHotbar"]:FireServer(1)
    end)
end

local function sell()
    safeCall("sell", function()
        net["RF/SellAllItems"]:InvokeServer()
    end)
end

local function autoon()
    safeCall("autoon", function()
        net["RF/UpdateAutoFishingState"]:InvokeServer(true)
    end)
end

local function autooff()
    safeCall("autooff", function()
        net["RF/UpdateAutoFishingState"]:InvokeServer(false)
    end)
end

local function catch()
    safeCall("catch", function()
        net["RE/FishingCompleted"]:FireServer()
    end)
end

local function charge()
    safeCall("charge", function()
        net["RF/ChargeFishingRod"]:InvokeServer()
    end)
end

local function lempar()
    safeCall("lempar", function()
        net["RF/RequestFishingMinigameStarted"]:InvokeServer(-139.63, 0.996, -1761532005.497)
    end)
end

local function autosell()
    while _G.AutoSell do
        sell()
        local d = tonumber(_G.SellDelay) or 30
        local t = 0
        while t < d and _G.AutoSell do
            task.wait(0.25)
            t += 0.25
        end
    end
end



local function instant_cycle()
    local delay = tonumber(_G.InstantDelay) or 0.35
    
    -- Charge Rod (async)
    task.spawn(function()
        net["RF/ChargeFishingRod"]:InvokeServer()
    end)

    -- Start minigame + charge again (async)
    task.spawn(function()
        net["RF/RequestFishingMinigameStarted"]:InvokeServer(-139.63, 0.996, -1761532005.497)
        net["RF/ChargeFishingRod"]:InvokeServer()
    end)

    -- One-time wait
    task.wait(delay)

    -- Catch (async)
    task.spawn(function()
        net["RE/FishingCompleted"]:FireServer()
    end)
end

--------------------------------------------------------------------
local Tab3 = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2",
})

Tab3:Section({
    Title = "Fishing",
    Icon = "fish",
    TextXAlignment = "Left",
    TextSize = 17
})

Tab3:Divider()

Tab3:Toggle({
    Title = "Auto Equip Rod",
    Value = false,
    Callback = function(v)
        _G.AutoEquipRod = v
        if v then rod() end
    end
})

local mode = "Instant"
local fishThread
local sellThread

Tab3:Dropdown({
    Title = "Mode",
    Values = {"Instant", "Legit"},
    Value = "Instant",
    Callback = function(v)
        mode = v
    end
})

Tab3:Toggle({
    Title = "Auto Fishing",
    Value = false,
    Callback = function(v)
        _G.AutoFishing = v
        if v then
            if mode == "Instant" then
                _G.Instant = true
                if fishThread then fishThread = nil end
                fishThread = task.spawn(function()
                    while _G.AutoFishing and mode == "Instant" do
                        instant_cycle()
                        task.wait(0.05) -- lebih cepat daripada 0.35 default cycle
                    end
                end)
            else
                if fishThread then fishThread = nil end
                fishThread = task.spawn(function()
                    while _G.AutoFishing and mode == "Legit" do
                        autoon()
                        task.wait(1)
                    end
                end)
            end
        else
            autooff()
            _G.Instant = false
            if fishThread then task.cancel(fishThread) end
            fishThread = nil
        end
    end
})

Tab3:Slider({
    Title = "Instant Fishing Delay",
    Step = 0.01,
    Value = {Min = 0.05, Max = 5, Default = 0.65},
    Callback = function(v)
        _G.InstantDelay = v
    end
})

Tab3:Section({     
    Title = "Item",
    Icon = "list-collapse",
    TextXAlignment = "Left",
    TextSize = 17,    
})

Tab3:Divider()

Tab3:Toggle{
    Title = "Radar",
    Value = false,
    Callback = function(state)
        local RS = game:GetService("ReplicatedStorage")
        local Lighting = game:GetService("Lighting")
        local Replion = require(RS.Packages.Replion).Client:GetReplion("Data")
        local NetFunction = require(RS.Packages.Net):RemoteFunction("UpdateFishingRadar")
        
        if Replion and NetFunction:InvokeServer(state) then
            local sound = require(RS.Shared.Soundbook).Sounds.RadarToggle:Play()
            sound.PlaybackSpeed = 1 + math.random() * 0.3
            
            local colorEffect = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
            if colorEffect then
                require(RS.Packages.spr).stop(colorEffect)
                local timeController = require(RS.Controllers.ClientTimeController)
                local lightingProfile = (timeController._getLightingProfile and timeController:_getLightingProfile() or timeController._getLighting_profile and timeController:_getLighting_profile() or {})
                local colorCorrection = lightingProfile.ColorCorrection or {}
                
                colorCorrection.Brightness = colorCorrection.Brightness or 0.04
                colorCorrection.TintColor = colorCorrection.TintColor or Color3.fromRGB(255, 255, 255)
                
                if state then
                    colorEffect.TintColor = Color3.fromRGB(42, 226, 118)
                    colorEffect.Brightness = 0.4
                    require(RS.Controllers.TextNotificationController):DeliverNotification{
                        Type = "Text",
                        Text = "Radar: Enabled",
                        TextColor = {R = 9, G = 255, B = 0}
                    }
                else
                    colorEffect.TintColor = Color3.fromRGB(255, 0, 0)
                    colorEffect.Brightness = 0.2
                    require(RS.Controllers.TextNotificationController):DeliverNotification{
                        Type = "Text",
                        Text = "Radar: Disabled", 
                        TextColor = {R = 255, G = 0, B = 0}
                    }
                end
                
                require(RS.Packages.spr).target(colorEffect, 1, 1, colorCorrection)
            end
            
            require(RS.Packages.spr).stop(Lighting)
            Lighting.ExposureCompensation = 1
            require(RS.Packages.spr).target(Lighting, 1, 2, {ExposureCompensation = 0})
        end
    end
}

Tab3:Toggle({
    Title = "Bypass Oxygen",
    Desc = "Inf Oxygen",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.DivingGear = state
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RemoteFolder = ReplicatedStorage.Packages._Index:FindFirstChild("sleitnick_net@0.2.0").net
        if _G.DivingGear then
            local args = {
                [1] = 105
            }
            RemoteFolder:FindFirstChild("RF/EquipOxygenTank"):InvokeServer(unpack(args))
        else
            RemoteFolder:FindFirstChild("RF/UnequipOxygenTank"):InvokeServer()
        end
    end
})

_G.AutoSell = false
_G.SellDelay = _G.SellDelay or 30

local Tab4 = Window:Tab({
    Title = "Auto",
    Icon = "gauge",
    Locked = false,
})

Tab4:Section({     
    Title = "Sell",
    Icon = "dollar-sign",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab4:Divider()

Tab4:Toggle({
    Title = "Auto Sell",
    Value = false,
    Callback = function(v)
        _G.AutoSell = v
        if v then
            if autosellThread then task.cancel(autosellThread) end
            autosellThread = task.spawn(autosell)
        else
            _G.AutoSell = false
            if autosellThread then task.cancel(autosellThread) end
            autosellThread = nil
        end
    end
})

Tab4:Slider({ Title = "Sell Delay", Step = 1, Value = { Min = 1, Max = 120, Default = 30 }, Callback = function(v) _G.SellDelay = v end })

local Tab5 = Window:Tab({
    Title = "Shop",
    Icon = "shopping-cart",
})

Tab5:Section({ 
    Title = "Buy Rod",
    Icon = "shrimp",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab5:Divider()

local ReplicatedStorage = game:GetService("ReplicatedStorage")  
local RFPurchaseFishingRod = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseFishingRod"]  

local rods = {  
    ["Luck Rod"] = 79,  
    ["Carbon Rod"] = 76,  
    ["Grass Rod"] = 85,  
    ["Demascus Rod"] = 77,  
    ["Ice Rod"] = 78,  
    ["Lucky Rod"] = 4,  
    ["Midnight Rod"] = 80,  
    ["Steampunk Rod"] = 6,  
    ["Chrome Rod"] = 7,  
    ["Astral Rod"] = 5,  
    ["Ares Rod"] = 126,  
    ["Angler Rod"] = 168,
    ["Bamboo Rod"] = 258
}  

local rodNames = {  
    "Luck Rod (350 Coins)", "Carbon Rod (900 Coins)", "Grass Rod (1.5k Coins)", "Demascus Rod (3k Coins)",  
    "Ice Rod (5k Coins)", "Lucky Rod (15k Coins)", "Midnight Rod (50k Coins)", "Steampunk Rod (215k Coins)",  
    "Chrome Rod (437k Coins)", "Astral Rod (1M Coins)", "Ares Rod (3M Coins)", "Angler Rod (8M Coins)",
    "Bamboo Rod (12M Coins)"
}  

local rodKeyMap = {  
    ["Luck Rod (350 Coins)"]="Luck Rod",  
    ["Carbon Rod (900 Coins)"]="Carbon Rod",  
    ["Grass Rod (1.5k Coins)"]="Grass Rod",  
    ["Demascus Rod (3k Coins)"]="Demascus Rod",  
    ["Ice Rod (5k Coins)"]="Ice Rod",  
    ["Lucky Rod (15k Coins)"]="Lucky Rod",  
    ["Midnight Rod (50k Coins)"]="Midnight Rod",  
    ["Steampunk Rod (215k Coins)"]="Steampunk Rod",  
    ["Chrome Rod (437k Coins)"]="Chrome Rod",  
    ["Astral Rod (1M Coins)"]="Astral Rod",  
    ["Ares Rod (3M Coins)"]="Ares Rod",  
    ["Angler Rod (8M Coins)"]="Angler Rod",
    ["Bamboo Rod (12M Coins)"]="Bamboo Rod"
}  

local selectedRod = rodNames[1]  

Tab5:Dropdown({  
    Title = "Select Rod",  
    Values = rodNames,  
    Value = selectedRod,  
    Callback = function(value)  
        selectedRod = value
    end  
})  

Tab5:Button({  
    Title="Buy Rod",  
    Callback=function()  
        local key = rodKeyMap[selectedRod]  
        if key and rods[key] then  
            local success, err = pcall(function()  
                RFPurchaseFishingRod:InvokeServer(rods[key])  
            end)  
            if success then  
                WindUI:Notify({Title="Rod Purchase", Content="Purchased "..selectedRod, Duration=3})  
            else  
                WindUI:Notify({Title="Rod Purchase Error", Content=tostring(err), Duration=5})  
            end  
        end  
    end  
})

Tab5:Section({
    Title = "Buy Baits",
    Icon = "compass",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab5:Divider()

local RFPurchaseBait = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseBait"]  

local baits = {
    ["TopWater Bait"] = 10,
    ["Lucky Bait"] = 2,
    ["Midnight Bait"] = 3,
    ["Chroma Bait"] = 6,
    ["Dark Mater Bait"] = 8,
    ["Corrupt Bait"] = 15,
    ["Aether Bait"] = 16,
    ["Floral Bait"] = 20,
}

local baitNames = {  
    "Luck Bait (1k Coins)", "Midnight Bait (3k Coins)", "Nature Bait (83.5k Coins)",  
    "Chroma Bait (290k Coins)", "Dark Matter Bait (630k Coins)", "Corrupt Bait (1.15M Coins)",  
    "Aether Bait (3.7M Coins)", "Floral Bait (4M Coins)"  
}

local baitKeyMap = {  
    ["Luck Bait (1k Coins)"] = "Luck Bait",  
    ["Midnight Bait (3k Coins)"] = "Midnight Bait",  
    ["Nature Bait (83.5k Coins)"] = "Nature Bait",  
    ["Chroma Bait (290k Coins)"] = "Chroma Bait",  
    ["Dark Matter Bait (630k Coins)"] = "Dark Matter Bait",  
    ["Corrupt Bait (1.15M Coins)"] = "Corrupt Bait",  
    ["Aether Bait (3.7M Coins)"] = "Aether Bait",  
    ["Floral Bait (4M Coins)"] = "Floral Bait"  
}

local selectedBait = baitNames[1]  

Tab5:Dropdown({  
    Title = "Select Bait",  
    Values = baitNames,  
    Value = selectedBait,  
    Callback = function(value)  
        selectedBait = value  
    end  
})  

Tab5:Button({  
    Title = "Buy Bait",  
    Callback = function()  
        local key = baitKeyMap[selectedBait]  
        if key and baits[key] then  
            local success, err = pcall(function()  
                RFPurchaseBait:InvokeServer(baits[key])  
            end)  
            if success then  
                WindUI:Notify({Title = "Bait Purchase", Content = "Purchased " .. selectedBait, Duration = 3})  
            else  
                WindUI:Notify({Title = "Bait Purchase Error", Content = tostring(err), Duration = 5})  
            end  
        end  
    end  
})

Tab5:Section({
    Title = "Auto Buy Weather Event",
    Icon = "cloud-drizzle",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab5:Divider()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RFPurchaseWeatherEvent = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseWeatherEvent"]

local weatherKeyMap = {
    ["Wind (10k Coins)"] = "Wind",
    ["Snow (15k Coins)"] = "Snow",
    ["Cloudy (20k Coins)"] = "Cloudy",
    ["Storm (35k Coins)"] = "Storm",
    ["Radiant (50k Coins)"] = "Radiant",
    ["Shark Hunt (300k Coins)"] = "Shark Hunt"
}

local weatherNames = {  
    "Wind (10k Coins)", "Snow (15k Coins)", "Cloudy (20k Coins)",  
    "Storm (35k Coins)", "Radiant (50k Coins)", "Shark Hunt (300k Coins)"
}

local selectedWeathers = {}

Tab5:Dropdown({
    Title = "Select Weather Event",
    Values = weatherNames,
    Multi = true,
    Callback = function(values)
        selectedWeathers = values
    end
})

local autoBuyEnabled = false
local buyDelay = 0.5

local function startAutoBuy()
    task.spawn(function()
        while autoBuyEnabled do
            for _, displayName in ipairs(selectedWeathers) do
                local key = weatherKeyMap[displayName]
                if key then
                    local success, err = pcall(function()
                        RFPurchaseWeatherEvent:InvokeServer(key)
                    end)
                    if success then
                        WindUI:Notify({
                            Title = "Buy",
                            Content = "Purchased " .. displayName,
                            Duration = 1
                        })
                    else
                        warn("Error buying weather:", err)
                    end
                    task.wait(buyDelay)
                end
            end
            task.wait(0.1)
        end
    end)
end

Tab5:Toggle({
    Title = "Buy Weather Event",
    Desc = "Automatically purchase selected weather event",
    Value = false,
    Callback = function(state)
        autoBuyEnabled = state
        if state then
            WindUI:Notify({
                Title = "Auto Buy",
                Content = "Enabled",
                Duration = 2
            })
            startAutoBuy()
        else
            WindUI:Notify({
                Title = "Auto Buy",
                Content = "Disabled",
                Duration = 2
            })
        end
    end
})

local Tab6 = Window:Tab({
    Title = "Teleport",
    Icon = "map-pin",
})

Tab6:Section({ 
    Title = "Island",
    Icon = "tree-palm",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Divider()

local IslandLocations = {
    ["Admin Event"] = Vector3.new(-1981, -442, 7428),
    ["Ancient Jungle"] = Vector3.new(1518, 1, -186),
    ["Coral Refs"] = Vector3.new(-2855, 47, 1996),
    ["Crater Island"] = Vector3.new(997, 1, 5012),
    ["Enchant Room"] = Vector3.new(3221, -1303, 1406),
    ["Enchant Room 2"] = Vector3.new(1480, 126, -585),
    ["Esoteric Island"] = Vector3.new(1990, 5, 1398),
    ["Fisherman Island"] = Vector3.new(-175, 3, 2772),
    ["Kohana Volcano"] = Vector3.new(-545.302429, 17.1266193, 118.870537),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Lost Isle"] = Vector3.new(-3643, 1, -1061),
    ["Sacred Temple"] = Vector3.new(1498, -23, -644),
    ["Sysyphus Statue"] = Vector3.new(-3783.26807, -135.073914, -949.946289),
    ["Treasure Room"] = Vector3.new(-3600, -267, -1575),
    ["Tropical Grove"] = Vector3.new(-2091, 6, 3703),
    ["Underground Cellar"] = Vector3.new(2135, -93, -701),
    ["Weather Machine"] = Vector3.new(-1508, 6, 1895),
    ["Ancient Ruin"] = Vector3.new(6051, -541, 4414),
    ["Iron Cavern"] = Vector3.new(-9194, -582, 157),
    ["Classic Island"] = Vector3.new(1178, 3, 2838),
    ["Iron Cafe"] = Vector3.new(-8692, -549, 161),
}

local SelectedIsland = nil

local IslandDropdown = Tab6:Dropdown({
    Title = "Select Island",
    Values = (function()
        local keys = {}
        for name in pairs(IslandLocations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedIsland = Value
    end
})

Tab6:Button({
    Title = "Teleport to Island",
    Callback = function()
        if SelectedIsland and IslandLocations[SelectedIsland] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(IslandLocations[SelectedIsland])
        end
    end
})

Tab6:Section({ 
    Title = "Fishing Spot",
    Icon = "spotlight",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Divider()

local FishingLocations = {
    ["Levers 1"] = Vector3.new(1475,4,-847),
    ["Levers 2"] = Vector3.new(882,5,-321),
    ["levers 3"] = Vector3.new(1425,6,126),
    ["levers 4"] = Vector3.new(1837,4,-309),
    ["Sysyphus Statue"] = Vector3.new(-3712, -137, -1010),
	["King Jelly Spot (For quest elemental)"] = Vector3.new(1473.60, 3.58, -328.23),
	["El Shark Gran Maja Spot"] = Vector3.new(1526, 4, -629),
    ["Ancient Lochness"] = Vector3.new(6078, -586, 4629),
    ["Iron Cavern"] = Vector3.new(-8760, -554, 215),
    ["Classic Island"] = Vector3.new(1463, 70, 2798),
    ["Iron Cafe"] = Vector3.new(-8634, -523, 149),
}

local SelectedFishing = nil

Tab6:Dropdown({
    Title = "Select Spot",
    Values = (function()
        local keys = {}
        for name in pairs(FishingLocations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedFishing = Value
    end
})

Tab6:Button({
    Title = "Teleport to Fishing Spot",
    Callback = function()
        if SelectedFishing and FishingLocations[SelectedFishing] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(FishingLocations[SelectedFishing])
        end
    end
})

Tab6:Section({
    Title = "Location NPC",
    Icon = "bot",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Divider()

local NPC_Locations = {
    ["Alex"] = Vector3.new(43,17,2876),
    ["Aura kid"] = Vector3.new(70,17,2835),
    ["Billy Bob"] = Vector3.new(84,17,2876),
    ["Boat Expert"] = Vector3.new(32,9,2789),
    ["Esoteric Gatekeeper"] = Vector3.new(2101,-30,1350),
    ["Jeffery"] = Vector3.new(-2771,4,2132),
    ["Joe"] = Vector3.new(144,20,2856),
    ["Jones"] = Vector3.new(-671,16,596),
    ["Lava Fisherman"] = Vector3.new(-593,59,130),
    ["McBoatson"] = Vector3.new(-623,3,719),
    ["Ram"] = Vector3.new(-2838,47,1962),
    ["Ron"] = Vector3.new(-48,17,2856),
    ["Scott"] = Vector3.new(-19,9,2709),
    ["Scientist"] = Vector3.new(-6,17,2881),
    ["Seth"] = Vector3.new(107,17,2877),
    ["Silly Fisherman"] = Vector3.new(97,9,2694),
    ["Tim"] = Vector3.new(-604,16,609),
}

local SelectedNPC = nil

local NPCDropdown = Tab6:Dropdown({
    Title = "Select NPC",
    Values = (function()
        local keys = {}
        for name in pairs(NPC_Locations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        SelectedNPC = Value
    end
})

Tab6:Button({
    Title = "Teleport to NPC",
    Callback = function()
        if SelectedNPC and NPC_Locations[SelectedNPC] and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(NPC_Locations[SelectedNPC])
        end
    end
})

Tab6:Section({
    Title = "Player",
    Icon = "user-search",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Divider()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function GetPlayerList()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end
    return list
end

local SelectedPlayer = nil

local Dropdown = Tab6:Dropdown({
    Title = "Teleport Target",
    Values = GetPlayerList(),
    Value = GetPlayerList()[1],
    Callback = function(option)
        SelectedPlayer = option
    end
})

local TPButton = Tab6:Button({
    Title = "Teleport to Player",
    Locked = false,
    Callback = function()
        if not SelectedPlayer then
            warn("Belum pilih player!")
            return
        end

        local target = Players:FindFirstChild(SelectedPlayer)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame =
                target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        else
            warn("Player tidak valid atau tidak ada!")
        end
    end
})

local RefreshButton = Tab6:Button({
    Title = "Refresh Player List",
    Locked = false,
    Callback = function()
        local newList = GetPlayerList()
        local success = false
        
        -- Update dropdown
        if Dropdown.SetValues then
            Dropdown:SetValues(newList)
            success = true
        elseif Dropdown.Refresh then
            Dropdown:Refresh(newList)
            success = true
        elseif Dropdown.Update then
            Dropdown:Update(newList)
            success = true
        else
            warn("Function update dropdown tidak ditemukan!")
        end
        
        -- Set ulang ke player pertama kalau ada
        if newList[1] then
            SelectedPlayer = newList[1]
            if Dropdown.Set then
                Dropdown:Set(newList[1])
            end
        end

        -- Notifikasi + print status refresh
        if success then
            print("✓ Player successfully refreshed (" .. #newList .. " player found)")
            WindUI:Notify({
                Title = "Refresh Successful!",
                Content = tostring(#newList) .. " player found",
                Duration = 3,
                Icon = "check"
            })
        else
            print("✗ Failed to refresh player list")
            WindUI:Notify({
                Title = "Refresh Failed",
                Content = "Unable to update player list",
                Duration = 3,
                Icon = "x"
            })
        end
    end
})

Tab6:Section({
    Title = "Event Teleporter",
    Icon = "calendar",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Divider()

local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

player.CharacterAdded:Connect(function(c)
	character = c
	hrp = c:WaitForChild("HumanoidRootPart")
end)

local megCheckRadius = 150

local autoEventTPEnabled = false
local selectedEvents = {}
local createdEventPlatform = nil

local eventData = {
	["Worm Hunt"] = {
		TargetName = "Model",
		Locations = {
			Vector3.new(2190.85, -1.4, 97.575), 
			Vector3.new(-2450.679, -1.4, 139.731), 
			Vector3.new(-267.479, -1.4, 5188.531),
			Vector3.new(-327, -1.4, 2422)
		},
		PlatformY = 107,
		Priority = 1,
		Icon = "fish"
	},
	["Megalodon Hunt"] = {
		TargetName = "Megalodon Hunt",
		Locations = {
			Vector3.new(-1076.3, -1.4, 1676.2),
			Vector3.new(-1191.8, -1.4, 3597.3),
			Vector3.new(412.7, -1.4, 4134.4),
		},
		PlatformY = 107,
		Priority = 2,
		Icon = "anchor"
	},
	["Ghost Shark Hunt"] = {
		TargetName = "Ghost Shark Hunt",
		Locations = {
			Vector3.new(489.559, -1.35, 25.406), 
			Vector3.new(-1358.216, -1.35, 4100.556), 
			Vector3.new(627.859, -1.35, 3798.081)
		},
		PlatformY = 107,
		Priority = 3,
		Icon = "fish"
	},
	["Shark Hunt"] = {
		TargetName = "Shark Hunt",
		Locations = {
			Vector3.new(1.65, -1.35, 2095.725),
			Vector3.new(1369.95, -1.35, 930.125),
			Vector3.new(-1585.5, -1.35, 1242.875),
			Vector3.new(-1896.8, -1.35, 2634.375)
		},
		PlatformY = 107,
		Priority = 4,
		Icon = "fish"
	},
}

local eventNames = {}
for name in pairs(eventData) do
	table.insert(eventNames, name)
end

local function destroyEventPlatform()
	if createdEventPlatform and createdEventPlatform.Parent then
		createdEventPlatform:Destroy()
		createdEventPlatform = nil
	end
end

local function createAndTeleportToPlatform(targetPos, y)
	destroyEventPlatform()

	local platform = Instance.new("Part")
	platform.Size = Vector3.new(5, 1, 5)
	platform.Position = Vector3.new(targetPos.X, y, targetPos.Z)
	platform.Anchored = true
	platform.Transparency = 1
	platform.CanCollide = true
	platform.Name = "EventPlatform"
	platform.Parent = Workspace
	createdEventPlatform = platform

	hrp.CFrame = CFrame.new(platform.Position + Vector3.new(0, 3, 0))
end

local function runMultiEventTP()
	while autoEventTPEnabled do
		local sorted = {}
		for _, e in ipairs(selectedEvents) do
			if eventData[e] then
				table.insert(sorted, eventData[e])
			end
		end
		table.sort(sorted, function(a, b) return a.Priority < b.Priority end)

		for _, config in ipairs(sorted) do
			local foundTarget, foundPos = nil, nil

			if config.TargetName == "Model" then
				local menuRings = Workspace:FindFirstChild("!!! MENU RINGS")
				if menuRings then
					for _, props in ipairs(menuRings:GetChildren()) do
						if props.Name == "Props" then
							local model = props:FindFirstChild("Model")
							if model and model.PrimaryPart then
								for _, loc in ipairs(config.Locations) do
									if (model.PrimaryPart.Position - loc).Magnitude <= megCheckRadius then
										foundTarget = model
										foundPos = model.PrimaryPart.Position
										break
									end
								end
							end
						end
						if foundTarget then break end
					end
				end
			else
				for _, loc in ipairs(config.Locations) do
					for _, d in ipairs(Workspace:GetDescendants()) do
						if d.Name == config.TargetName then
							local pos = d:IsA("BasePart") and d.Position or (d.PrimaryPart and d.PrimaryPart.Position)
							if pos and (pos - loc).Magnitude <= megCheckRadius then
								foundTarget = d
								foundPos = pos
								break
							end
						end
					end
					if foundTarget then break end
				end
			end

			if foundTarget and foundPos then
				createAndTeleportToPlatform(foundPos, config.PlatformY)
			end
		end
		task.wait(0.05)
	end
	destroyEventPlatform()
end

Tab6:Dropdown({
	Title = "Select Events",
	Values = eventNames,
	Multi = true,
	AllowNone = true,
	Callback = function(values)
		selectedEvents = values
		print("[EventTP] Selected Events:", table.concat(values, ", "))
	end
})

Tab6:Toggle({
	Title = "Auto Event",
	Icon = false,
	Type = false,
	Value = false,
	Callback = function(state)
		autoEventTPEnabled = state
		if state then
			task.spawn(runMultiEventTP)
		else
		end
	end
})

local Tab7 = Window:Tab({
    Title = "Settings",
    Icon = "settings",
})

Tab7:Section({ 
    Title = "Vuln",
    Icon = "shield-alert",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab7:Divider()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GiftingController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("GiftingController"))

local Button = Tab7:Button({
    Title = "Gift Skin Soul Scythe",
    Desc = "you can still buy it but the price is 999,999,999 robux if you are rich you can buy it",
    Locked = false,
    Callback = function()
        if GiftingController and GiftingController.Open then
            GiftingController:Open("Soul Scythe")
            
            -- Notifikasi sukses
            WindUI:Notify({
                Title = "Gift Open",
                Content = "Soul Scythe Gift Opened Successfully",
                Duration = 3,
                Icon = "check"
            })
        else
            -- Notifikasi error
            WindUI:Notify({
                Title = "Failed!!",
                Content = "Patched",
                Duration = 3,
                Icon = "x"
            })
        end
    end
})

Tab7:Section({ 
    Title = "Player In Game",
    Icon = "play",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab7:Divider()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local DefaultMaxZoom = LocalPlayer.CameraMaxZoomDistance
local DefaultMinZoom = LocalPlayer.CameraMinZoomDistance

local Toggle = Tab7:Toggle({
    Title = "Infinite Zoom",
    Desc = "infinite zoom to take a photo",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        if state then
            LocalPlayer.CameraMaxZoomDistance = math.huge
            LocalPlayer.CameraMinZoomDistance = 0.5
        else
            LocalPlayer.CameraMaxZoomDistance = DefaultMaxZoom or 128
            LocalPlayer.CameraMinZoomDistance = DefaultMinZoom or 0.5
        end
    end
})

local Toggle = Tab7:Toggle({
    Title = "AntiAFK",
    Desc = "Prevent Roblox from kicking you when idle",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        _G.AntiAFK = state
        local VirtualUser = game:GetService("VirtualUser")

        if state then
            task.spawn(function()
                while _G.AntiAFK do
                    task.wait(60)
                    pcall(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                end
            end)

            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AntiAFK loaded!",
                Text = "Coded By Lexs",
                Button1 = "Okey",
                Duration = 5
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AntiAFK Disabled",
                Text = "Stopped AntiAFK",
                Duration = 3
            })
        end
    end
})

local Toggle = Tab7:Toggle({
    Title = "Auto Reconnect",
    Desc = "Automatic reconnect if disconnected",
    Icon = false,
    Default = false,
    Callback = function(state)
        _G.AutoReconnect = state
        if state then
            task.spawn(function()
                while _G.AutoReconnect do
                    task.wait(2)

                    local reconnectUI = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
                    if reconnectUI then
                        local prompt = reconnectUI:FindFirstChild("promptOverlay")
                        if prompt then
                            local button = prompt:FindFirstChild("ButtonPrimary")
                            if button and button.Visible then
                                firesignal(button.MouseButton1Click)
                            end
                        end
                    end
                end
            end)
        end
    end
})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId
local AutoRejoinEnabled = true

local BlacklistedUserIds = {
    75974130,
    40397833,
    187190686,
    33372493,
    889918695,
    33679472,
    30944240,
    25050357,
    8462585751,
    8811129148,
    192821024,
    4509801805,
    124505170,
    108397209,
}

Tab7:Toggle({
    Title = "Anti Staff",
    Desc = "Auto serverhop if there is staff",
    Icon = false,
    Type = false,
    Value = true,
    Callback = function(state)
        AutoRejoinEnabled = true
    end
})

local function IsBlacklisted(userId)
    for _, id in ipairs(BlacklistedUserIds) do
        if userId == id then
            return true
        end
    end
    return false
end

local function ServerHop()
    task.wait(6)
    local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    for _, server in ipairs(Servers) do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(PlaceId, server.id, LocalPlayer)
            break
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if AutoRejoinEnabled and player ~= LocalPlayer and IsBlacklisted(player.UserId) then
        WindUI:Notify({
            Title = "Lexs Hub",
            Content = player.Name .. " telah join, serverhop dalam 6 detik...",
            Duration = 6,
            Icon = "alert-triangle",
        })
        ServerHop()
    end
end)

task.spawn(function()
    while task.wait(2) do
        if AutoRejoinEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and IsBlacklisted(player.UserId) then
                    WindUI:Notify({
                        Title = "Lexs Hub",
                        Content = player.Name .. " terdeteksi, serverhop dalam 6 detik...",
                        Duration = 6,
                        Icon = "alert-triangle",
                    })
                    ServerHop()
                end
            end
        end
    end
end)

Tab7:Section({ 
    Title = "Graphics In Game",
    Icon = "chart-bar",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab7:Divider()

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Terrain = Workspace:FindFirstChildOfClass("Terrain")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local function notify(text, color)
	pcall(function()
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[FPS BOOST] " .. text,
			Color = color or Color3.fromRGB(150,255,150),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
	end)
end

local function applyFPSBoost(state)
	if state then
		---------------------------------------------------
		-- 🟢 AKTIFKAN MODE BOOST
		---------------------------------------------------
		notify("Mode Ultra Aktif ✅", Color3.fromRGB(100,255,100))
		print("[FPS BOOST] Mode Ultra Aktif")

		-- Hapus efek Lighting berat
		for _, v in ipairs(Lighting:GetChildren()) do
			if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect")
				or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere")
				or v:IsA("Sky") or v:IsA("Clouds") or v:IsA("PostEffect") then
				v.Parent = nil
			end
		end

		-- Nonaktifkan Lighting kompleks
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 1e6
		Lighting.Brightness = 1
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.EnvironmentSpecularScale = 0
		Lighting.OutdoorAmbient = Color3.new(1,1,1)

		-- Terrain lebih ringan
		if Terrain then
			Terrain.WaterWaveSize = 0
			Terrain.WaterWaveSpeed = 0
			Terrain.WaterReflectance = 0
			Terrain.WaterTransparency = 1
		end

		-- Bersihkan workspace
		for _, obj in ipairs(Workspace:GetDescendants()) do
			-- Hilangkan texture dan decal
			if obj:IsA("Decal") or obj:IsA("Texture") then
				obj.Transparency = 1
			end

			-- Matikan efek visual
			if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Fire")
				or obj:IsA("Smoke") or obj:IsA("Sparkles") then
				obj.Enabled = false
			end

			-- Hapus efek PBR (SurfaceAppearance)
			if obj:IsA("SurfaceAppearance") then
				obj.Parent = nil
			end

			-- Nonaktifkan shadow dan ubah material ke Plastic
			if obj:IsA("BasePart") then
				obj.CastShadow = false
				pcall(function() obj.Material = Enum.Material.Plastic end)
			end
		end
		
		local char = Players.LocalPlayer.Character
		if char then
			for _, acc in ipairs(char:GetChildren()) do
				if acc:IsA("Accessory") then
					acc:Destroy()
				end
			end
			if char:FindFirstChild("Animate") then
				char.Animate.Disabled = true
			end
		end
		
		workspace.StreamingEnabled = true
		workspace.StreamingMinRadius = 64
		workspace.StreamingTargetRadius = 128
		
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		
		collectgarbage("collect")

	else
		---------------------------------------------------
		-- 🔴 MATIKAN MODE BOOST
		---------------------------------------------------
		notify("Mode Ultra Nonaktif ❌", Color3.fromRGB(255,120,120))
		print("[FPS BOOST] Mode Ultra Nonaktif")

		-- Pulihkan Lighting aman
		Lighting.GlobalShadows = true
		Lighting.FogEnd = 1000
		Lighting.Brightness = 2
		Lighting.EnvironmentDiffuseScale = 1
		Lighting.EnvironmentSpecularScale = 1
		Lighting.OutdoorAmbient = Color3.new(0.5,0.5,0.5)

		if Terrain then
			Terrain.WaterWaveSize = 0.15
			Terrain.WaterWaveSpeed = 10
			Terrain.WaterReflectance = 1
			Terrain.WaterTransparency = 0.5
		end

		settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic

		-- Aktifkan kembali animasi karakter
		local char = Players.LocalPlayer.Character
		if char and char:FindFirstChild("Animate") then
			char.Animate.Disabled = false
		end
	end
end


local Toggle = Tab7:Toggle({
	Title = "FPS Boost",
	Icon = false,
	Type = false,
	Value = false,
	Callback = function(state)
		applyFPSBoost(state)
	end
})

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--// State
local blockerEnabled = false
local guiConnections = {}

--// Fungsi blokir GUI
local function blockGuiObject(obj)
    if not blockerEnabled then return end
    if obj:IsA("ScreenGui") or obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then
        local name = obj.Name:lower()
        if string.find(name, "notif") 
        or string.find(name, "popup")
        or string.find(name, "you got")
        or string.find(name, "drop")
        or string.find(name, "reward")
        or string.find(name, "fish")
        or string.find(name, "catch") then
            task.wait()
            pcall(function()
                obj.Enabled = false
                obj:Destroy()
            end)
            print("[Blocked Game Notification]:", obj.Name)
        end
    end
end

--// Toggle MacLib
local Toggle = Tab7:Toggle({
    Title = "Hide All Notifications",
    Desc = "Hide All Notifications Fish Caught",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        blockerEnabled = state

        if state then
            print("[🛑 Game Notification Blocker Enabled]")

            -- Hapus GUI yang sudah ada
            for _, gui in ipairs(PlayerGui:GetChildren()) do
                blockGuiObject(gui)
            end
            for _, gui in ipairs(CoreGui:GetChildren()) do
                blockGuiObject(gui)
            end

            -- Awasi GUI baru
            guiConnections["PlayerGui"] = PlayerGui.ChildAdded:Connect(blockGuiObject)
            guiConnections["CoreGui"] = CoreGui.ChildAdded:Connect(blockGuiObject)

        else
            print("[🔔 Game Notification Blocker Disabled]")
            for _, conn in pairs(guiConnections) do
                conn:Disconnect()
            end
            guiConnections = {}
        end
    end
})

--// Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--// GUI placeholder
local whiteScreen = nil

--// Toggle MacLib
local Toggle = Tab7:Toggle({
    Title = "Disable 3D Rendering",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        if state then
            print("[🛑 3D Rendering Disabled + White Screen Enabled]")

            -- Matikan rendering 3D
            pcall(function()
                RunService:Set3dRenderingEnabled(false)
            end)

            -- Buat layar putih full
            whiteScreen = Instance.new("ScreenGui")
            whiteScreen.IgnoreGuiInset = true
            whiteScreen.ResetOnSpawn = false
            whiteScreen.Name = "WhiteScreenOverlay"
            whiteScreen.Parent = PlayerGui

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.Position = UDim2.new(0, 0, 0, 0)
            frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            frame.BorderSizePixel = 0
            frame.Parent = whiteScreen

        else
            print("[✅ 3D Rendering Re-enabled + White Screen Removed]")

            -- Aktifkan render kembali
            pcall(function()
                RunService:Set3dRenderingEnabled(true)
            end)

            -- Hapus layar putih
            if whiteScreen then
                whiteScreen:Destroy()
                whiteScreen = nil
            end
        end
    end
})

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- State
local vfxDisabled = false
local storedVFX = {}

-- Daftar tipe efek yang ingin dinonaktifkan
local vfxClasses = {
	"ParticleEmitter", "Beam", "Trail", "Smoke", "Fire", "Sparkles", "Explosion",
	"PointLight", "SpotLight", "SurfaceLight", "Highlight"
}

-- Efek Lighting pasca-proses
local lightingEffects = {
	"BloomEffect", "SunRaysEffect", "ColorCorrectionEffect", "DepthOfFieldEffect", "Atmosphere"
}

-- Nonaktifkan semua efek visual
local function disableAllVFX()
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if table.find(vfxClasses, obj.ClassName) then
			if obj.Enabled ~= nil and obj.Enabled == true then
				storedVFX[obj] = true
				obj.Enabled = false
			end
		end
	end

	-- Matikan efek di Lighting
	for _, effName in ipairs(lightingEffects) do
		local eff = Lighting:FindFirstChildOfClass(effName)
		if eff and eff.Enabled ~= nil then
			storedVFX[eff] = true
			eff.Enabled = false
		end
	end

	print("[🧊 All VFX Disabled]")
end

-- Aktifkan kembali efek visual
local function enableAllVFX()
	for obj in pairs(storedVFX) do
		if obj and obj.Parent and obj.Enabled ~= nil then
			obj.Enabled = true
		end
	end
	storedVFX = {}
	print("[✨ All VFX Restored]")
end

-- Toggle UI
local Toggle = Tab7:Toggle({
    Title = "Hide All VFX",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        vfxDisabled = state

        if state then
            disableAllVFX()

            -- Jika efek baru muncul setelah toggle aktif
            Workspace.DescendantAdded:Connect(function(obj)
                if vfxDisabled and table.find(vfxClasses, obj.ClassName) then
                    task.wait()
                    if obj.Enabled ~= nil then
                        obj.Enabled = false
                    end
                end
            end)

            Lighting.DescendantAdded:Connect(function(obj)
                if vfxDisabled and table.find(lightingEffects, obj.ClassName) then
                    task.wait()
                    if obj.Enabled ~= nil then
                        obj.Enabled = false
                    end
                end
            end)

        else
            enableAllVFX()
        end
    end
})

Tab7:Section({ 
    Title = "Server",
    Icon = "server",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab7:Divider()

Tab7:Button({
    Title = "Rejoin Server",
    Desc = "Reconnect to current server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

Tab7:Button({
    Title = "Server Hop",
    Desc = "Switch to another server",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        
        local function GetServers()
            local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&limit=100"
            local response = HttpService:JSONDecode(game:HttpGet(url))
            return response.data
        end

        local function FindBestServer(servers)
            for _, server in ipairs(servers) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    return server.id
                end
            end
            return nil
        end

        local servers = GetServers()
        local serverId = FindBestServer(servers)

        if serverId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, game.Players.LocalPlayer)
        else
            warn("⚠️ No suitable server found!")
        end
    end
})

Tab7:Section({ 
    Title = "Config",
    Icon = "folder-open",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab7:Divider()

local ConfigFolder = "LEXS_HUB/Configs"
if not isfolder("LEXS_HUB") then makefolder("LEXS_HUB") end
if not isfolder(ConfigFolder) then makefolder(ConfigFolder) end

local ConfigName = "default.json"

local function GetConfig()
    return {
        WalkSpeed = Humanoid.WalkSpeed,
        JumpPower = _G.CustomJumpPower or 50,
        InfiniteJump = _G.InfiniteJump or false,
        AutoSell = _G.AutoSell or false,
        InstantCatch = _G.InstantCatch or false,
        AntiAFK = _G.AntiAFK or false,
        AutoReconnect = _G.AutoReconnect or false,
    }
end

local function ApplyConfig(data)
    if data.WalkSpeed then 
        Humanoid.WalkSpeed = data.WalkSpeed 
    end
    if data.JumpPower then
        _G.CustomJumpPower = data.JumpPower
        local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = data.JumpPower
        end
    end
    if data.InfiniteJump ~= nil then
        _G.InfiniteJump = data.InfiniteJump
    end
    if data.AutoSell ~= nil then
        _G.AutoSell = data.AutoSell
    end
    if data.InstantCatch ~= nil then
        _G.InstantCatch = data.InstantCatch
    end
    if data.AntiAFK ~= nil then
        _G.AntiAFK = data.AntiAFK
    end
    if data.AutoReconnect ~= nil then
        _G.AutoReconnect = data.AutoReconnect
    end
end

Tab7:Button({
    Title = "Save Config",
    Desc = "Save all settings",
    Callback = function()
        local data = GetConfig()
        writefile(ConfigFolder.."/"..ConfigName, game:GetService("HttpService"):JSONEncode(data))
        print("✅ Config saved!")
    end
})

Tab7:Button({
    Title = "Load Config",
    Desc = "Use saved config",
    Callback = function()
        if isfile(ConfigFolder.."/"..ConfigName) then
            local data = readfile(ConfigFolder.."/"..ConfigName)
            local decoded = game:GetService("HttpService"):JSONDecode(data)
            ApplyConfig(decoded)
            print("✅ Config applied!")
        else
            warn("⚠️ Config not found, please Save first.")
        end
    end
})

Tab7:Button({
    Title = "Delete Config",
    Desc = "Delete saved config",
    Callback = function()
        if isfile(ConfigFolder.."/"..ConfigName) then
            delfile(ConfigFolder.."/"..ConfigName)
            print("🗑 Config deleted!")
        else
            warn("⚠️ No config to delete.")
        end
    end
})

Tab7:Section({ 
    Title = "Other Scripts",
    Icon = "file-code-2",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab7:Divider()

local Button = Tab7:Button({
    Title = "Infinite Yield",
    Desc = "Other Scripts",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
    end
})

Player.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.UseJumpPower = true
    humanoid.JumpPower = _G.CustomJumpPower or 50
end)

getgenv().LexsHubWindow = Window

return Window
