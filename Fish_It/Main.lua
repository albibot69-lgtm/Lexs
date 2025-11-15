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
    Folder = "STREE_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            WindUI:SetTheme("Dark")
        end,
    },
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
            setclipboard("https://discord.gg/Tsa7nGXPUw")
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
_G.AutoSell = false
_G.Radar = false
_G.Instant = false
_G.SellDelay = _G.SellDelay or 30
_G.CallMinDelay = _G.CallMinDelay or 0.12
_G.CallBackoff = _G.CallBackoff or 1.5

local lastCall = {}
local function safeCall(key, fn)
    local now = os.clock()
    local minDelay = _G.CallMinDelay or 0.12
    local backoff = _G.CallBackoff or 1.5
    if lastCall[key] and now - lastCall[key] < minDelay then
        task.wait(minDelay - (now - lastCall[key]))
    end
    local ok, res = pcall(fn)
    lastCall[key] = os.clock()
    if not ok then
        local msg = tostring(res):lower()
        if msg:find("429") or msg:find("too many requests") then
            task.wait(backoff)
        else
            task.wait(0.2)
        end
    end
    return ok, res
end

local function rod()
    safeCall("EquipToolFromHotbar", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RE/EquipToolFromHotbar"):FireServer(1)
    end)
end

local function sell()
    safeCall("SellAllItems", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/SellAllItems"):InvokeServer()
    end)
end

local function radar()
    safeCall("UpdateFishingRadar_true", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/UpdateFishingRadar"):InvokeServer(true)
    end)
end

local function autoon()
    safeCall("UpdateAutoFishingState_true", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/UpdateAutoFishingState"):InvokeServer(true)
    end)
end

local function autooff()
    safeCall("UpdateAutoFishingState_false", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/UpdateAutoFishingState"):InvokeServer(false)
    end)
end

local function catch()
    safeCall("FishingCompleted", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
    end)
end

local function charge()
    safeCall("ChargeFishingRod", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer()
    end)
end

local function lempar()
    safeCall("RequestFishingMinigameStarted", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/RequestFishingMinigameStarted"):InvokeServer(-1.233, 0.996, 1761532005.497)
    end)
    safeCall("ChargeFishingRod_after_lempar", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer()
    end)
end

local function autosell()
    while _G.AutoSell do
        sell()
        local delay = tonumber(_G.SellDelay) or 30
        local waited = 0
        while waited < delay and _G.AutoSell do
            task.wait(0.25)
            waited = waited + 0.25
        end
    end
end

local function perform_instant_cycle()
    charge()
    task.wait(0)
    lempar()
    task.wait(1)
    if _G.Instant then
        local loops = 5
        local fast = 0
        for i = 1, loops do
            if not _G.Instant then break end
            catch()
            task.wait(fast)
        end
    else
        catch()
    end
end

local Tab3 = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2"
})

Tab3:Section({
    Title = "Fishing",
    Icon = "fish",
    TextXAlignment = "Left",
    TextSize = 17 
})

Tab3:Divider()

Tab3:Toggle({ Title = "Auto Equip Rod", Value = false, Callback = function(v) _G.AutoEquipRod = v if v then rod() end end })

local CurrentOption = "Instant"
local autoFishingThread = nil
local autosellThread = nil

Tab3:Dropdown({
    Title = "Mode",
    Values = { "Instant", "Legit" },
    Value = "Instant",
    Callback = function(opt)
        CurrentOption = opt
        WindUI:Notify({ Title = "Mode Selected", Content = "Mode: " .. opt, Duration = 3, Icon = "check" })
    end
})

Tab3:Toggle({
    Title = "Auto Fishing",
    Value = false,
    Callback = function(v)
        _G.AutoFishing = v
        if v then
            if CurrentOption == "Instant" then
                _G.Instant = true
                WindUI:Notify({ Title = "Auto Fishing", Content = "Instant Mode ON", Duration = 3 })
                if autoFishingThread then autoFishingThread = nil end
                autoFishingThread = task.spawn(function()
                    while _G.AutoFishing and CurrentOption == "Instant" do
                        perform_instant_cycle()
                        task.wait(1)
                    end
                end)
            else
                WindUI:Notify({ Title = "Auto Fishing", Content = "Legit Mode ON", Duration = 3 })
                if autoFishingThread then autoFishingThread = nil end
                autoFishingThread = task.spawn(function()
                    while _G.AutoFishing and CurrentOption == "Legit" do
                        autoon()
                        task.wait(1)
                    end
                end)
            end
        else
            WindUI:Notify({ Title = "Auto Fishing", Content = "OFF", Duration = 3 })
            autooff()
            _G.Instant = false
            if autoFishingThread then task.cancel(autoFishingThread) end
            autoFishingThread = nil
        end
    end
})

Tab3:Section({
    Title = "Radar",
    Icon = "radar",
    TextXAlignment = "Left",
    TextSize = 17
})

Tab3:Divider()

Tab3:Toggle({
    Title = "Radar",
    Value = false,
    Callback = function(state)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Lighting = game:GetService("Lighting")
        local Replion = require(ReplicatedStorage.Packages.Replion)
        local Net = require(ReplicatedStorage.Packages.Net)
        local spr = require(ReplicatedStorage.Packages.spr)
        local Soundbook = require(ReplicatedStorage.Shared.Soundbook)
        local ClientTimeController = require(ReplicatedStorage.Controllers.ClientTimeController)
        local TextNotificationController = require(ReplicatedStorage.Controllers.TextNotificationController)
        local RemoteRadar = Net:RemoteFunction("UpdateFishingRadar")
        local Data = Replion.Client:GetReplion("Data")
        if Data then
            if RemoteRadar:InvokeServer(state) then
                Soundbook.Sounds.RadarToggle:Play().PlaybackSpeed = 1 + math.random() * 0.3
                local effect = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
                if effect then
                    spr.stop(effect)
                    local profile = ClientTimeController._getLightingProfile and ClientTimeController:_getLightingProfile() or ClientTimeController._getLighting_profile and ClientTimeController:_getLighting_profile()
                    local cc = (profile and profile(profile.ColorCorrection)) and profile.ColorCorrection or {}
                    if not cc.Brightness then cc.Brightness = 0.04 end
                    if not cc.TintColor then cc.TintColor = Color3.fromRGB(255, 255, 255) end
                    effect.TintColor = Color3.fromRGB(42, 226, 118)
                    effect.Brightness = 0.4
                    spr.target(effect, 1, 1, cc)
                end
                spr.stop(Lighting)
                Lighting.ExposureCompensation = 1
                spr.target(Lighting, 1, 2, { ["ExposureCompensation"] = 0 })
                TextNotificationController:DeliverNotification({
                    ["Type"] = "Text",
                    ["Text"] = ("Radar: %*"):format(state and "Enabled" or "Disabled"),
                    ["TextColor"] = state and {["R"]=9,["G"]=255,["B"]=0} or {["R"]=255,["G"]=0,["B"]=0}
                })
            end
        end
    end
})

Tab3:Section({     
    Title = "Gameplay",
    Icon = "gamepad",
    TextXAlignment = "Left",
    TextSize = 17,    
})

Tab3:Divider()

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


local Toggle = Tab3:Toggle({
	Title = "FPS Boost",
	Icon = false,
	Type = false,
	Value = false, -- default: off
	Callback = function(state)
		applyFPSBoost(state)
	end
})

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

Tab4:Section({     
    Title = "Enchant",
    Icon = "flask-conical",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab4:Divider()

local Toggle = Tab4:Toggle({
    Title = "Auto Enchant",
    Desc = "Gacha to get good enchants (No Work For Now)",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state)
        if state then
            _G.AutoEnchant = true
            print("Auto Enchant: ON")

            local Enchants = {
                {Name = "Stargazer I", Chance = 7},
                {Name = "Shiny I", Chance = 5},
                {Name = "Experienced I", Chance = 7},
                {Name = "Storm Hunter I", Chance = 7},
                {Name = "Perfection", Chance = 2},
            }

            local function RollEnchant()
                local total = 0
                for _, e in ipairs(Enchants) do
                    total += e.Chance
                end
                local roll = math.random(1, total)
                for _, e in ipairs(Enchants) do
                    roll -= e.Chance
                    if roll <= 0 then
                        return e.Name
                    end
                end
            end

            task.spawn(function()
                while _G.AutoEnchant do
                    local result = RollEnchant()
                    print("🎲 You got enchant:", result)
                    task.wait(1.5)
                end
            end)
        else
            _G.AutoEnchant = false
            print("Auto Enchant: OFF")
        end
    end
})

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

local Tab5Section = Tab5:Section({ 
    Title = "Buy Weathers",
    Icon = "cloud",
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
    ["Crystal Cavern"] = Vector3.new(-1841, -456, 7186),
    ["Enchant Room"] = Vector3.new(3221, -1303, 1406),
    ["Enchant Room 2"] = Vector3.new(1480, 126, -585),
    ["Esoteric Island"] = Vector3.new(1990, 5, 1398),
    ["Fisherman Island"] = Vector3.new(-175, 3, 2772),
    ["Halloween"] = Vector3.new(2106, 81, 3295),
    ["Kohana Volcano"] = Vector3.new(-545.302429, 17.1266193, 118.870537),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Lost Isle"] = Vector3.new(-3643, 1, -1061),
    ["Sacred Temple"] = Vector3.new(1498, -23, -644),
    ["Sysyphus Statue"] = Vector3.new(-3783.26807, -135.073914, -949.946289),
    ["Treasure Room"] = Vector3.new(-3600, -267, -1575),
    ["Tropical Grove"] = Vector3.new(-2091, 6, 3703),
    ["Underground Cellar"] = Vector3.new(2135, -93, -701),
    ["Weather Machine"] = Vector3.new(-1508, 6, 1895),
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
    ["Coral Refs"] = Vector3.new(-2855, 47, 1996),
    ["Konoha"] = Vector3.new(-603, 3, 719),
    ["Levers 1"] = Vector3.new(1475,4,-847),
    ["Levers 2"] = Vector3.new(882,5,-321),
    ["levers 3"] = Vector3.new(1425,6,126),
    ["levers 4"] = Vector3.new(1837,4,-309),
    ["Sacred Temple"] = Vector3.new(1475,-22,-632),
    ["El Shark Gran Maja Spot"] = Vector3.new(1526, 4, -629),
    ["Sysyphus Statue"] = Vector3.new(-3712, -137, -1010),
    ["Zombie Megalodon Spot"] = Vector3.new(2124, 103, 3338),
    ["King Jelly Spot (For quest elemental)"] = Vector3.new(1473.60, 3.58, -328.23),
    ["Volcano"] = Vector3.new(-632, 55, 197),
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
    Title = "Event Teleporter",
    Icon = "calendar",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab6:Divider()

local Event_Locations = {
    ["Black Hole"] = Vector3.new(883, -1.4, 2542),
    ["Ghost Shark Hunt"] = Vector3.new(489.559, -1.35, 25.406),
    ["Megalodon Hunt"] = Vector3.new(-1076.3, -1.4, 1676.2),
    ["Meteor Rain"] = Vector3.new(383, -1.4, 2452),
    ["Shark Hunt"] = Vector3.new(1.65, -1.35, 2095.725),
    ["Storm Hunt"] = Vector3.new(1735.85, -1.4, -208.425),
    ["Worm Hunt"] = Vector3.new(1591.55, -1.4, -105.925),
}

local ActiveEvent = nil

local EventDropdown = Tab6:Dropdown({
    Title = "Select Event",
    Values = (function()
        local keys = {}
        for name in pairs(Event_Locations) do
            table.insert(keys, name)
        end
        table.sort(keys)
        return keys
    end)(),
    Callback = function(Value)
        ActiveEvent = Value
    end
})

Tab6:Button({
    Title = "Teleport to Event",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Char = Player.Character or Player.CharacterAdded:Wait()
        local HRP = Char:FindFirstChild("HumanoidRootPart")
        if not HRP then return end
        if ActiveEvent and Event_Locations[ActiveEvent] then
            HRP.CFrame = CFrame.new(Event_Locations[ActiveEvent])
        end
    end
})

local Tab7 = Window:Tab({
    Title = "Settings",
    Icon = "settings",
})

Tab7:Keybind({
    Title = "Close/Open ui",
    Desc = "Keybind to Close/Open ui",
    Value = "L",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
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
