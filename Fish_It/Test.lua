local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    warn("⚠️ UI failed to load!")
    return
else
    print("✓ UI loaded successfully!")
end

local Window = WindUI:CreateWindow({
    Title = "Lexs Hub",
    Icon = "rbxassetid://71947103252559",
    Author = "Lexs Hub | Fish It",
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
    
     KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "LEXSFOUNDER", "DEVELOPER", "LEXS-74468f3d8d2bcdc2f0af", "LEXS-d553f61fb6712402e923", "LEXS-a9b02ef44f5486a40034" },
        
        Note = "Buy Premium in discord",
        
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://71947103252559",
            Title = " ",
        },
        
        -- ↓ Optional. You can remove it.
        URL = "https://discord.gg/Tsa7nGXPUw",
        
        
        SaveKey = true
    },
})


Window:Tag({
    Title = "v0.0.0.3",
    Color = Color3.fromRGB(0, 255, 0),
    Radius = 17,
})

Window:Tag({
    Title = "Premium",
    Color = Color3.fromRGB(0, 234, 255),
    Radius = 17,
})

WindUI:Notify({
    Title = "Lexs Hub Premium Loaded",
    Content = "UI loaded successfully!",
    Duration = 3,
    Icon = "bell",
})

local Tab1 = Window:Tab({
    Title = "Info",
    Icon = "info",
})

local Section = Tab1:Section({
    Title = "Community Support",
    TextXAlignment = "Left",
    TextSize = 17,
})

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
    Title = "join discord for update",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Tab2 = Window:Tab({
    Title = "Players",
    Icon = "user",
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

_G.CustomJumpPower = 50

local Input = Tab2:Input({
    Title = "WalkSpeed",
    Desc = "Minimum 16 speed",
    Value = "16",
    InputIcon = "user",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(input)
        local speed = tonumber(input)
        if speed and speed >= 16 then
            Humanoid.WalkSpeed = speed
            print("WalkSpeed set to: " .. speed)
        else
            Humanoid.WalkSpeed = 16
            print("⚠️ Invalid input, set to default (16)")
        end
    end
})

local Input = Tab2:Input({
    Title = "Jump Power",
    Desc = "Minimum 50 jump",
    Value = "50",
    InputIcon = "user",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(input)
        local value = tonumber(input)
        if value and value >= 50 then
            _G.CustomJumpPower = value
            local humanoid = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = value
            end
            print("Jump Power set to: " .. value)
        else
            warn("⚠️ Must be number and minimum 50!")
        end
    end
})

-- by Ibnu 😎

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Terrain = Workspace:FindFirstChildOfClass("Terrain")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- fungsi notifikasi kecil di chat
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

-- fungsi utama FPS Boost
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

		-- Matikan accessories dari character (opsional)
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

		-- Aktifkan Streaming Mode
		workspace.StreamingEnabled = true
		workspace.StreamingMinRadius = 64
		workspace.StreamingTargetRadius = 128

		-- Kurangi kualitas rendering (paling rendah)
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

		-- Bersihkan memory
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

-- Buat Toggle di UI kamu
local Toggle = Tab2:Toggle({
	Title = "FPS Boost Super+++++++",
	Icon = false,
	Type = false,
	Value = false, -- default: off
	Callback = function(state)
		applyFPSBoost(state)
	end
})

-- // DISABLE ANIMATION TOGGLE
-- by Ibnu 😎

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Fungsi untuk nonaktifkan / aktifkan animasi
local function toggleAnimation(state)
	local character = player.Character or player.CharacterAdded:Wait()

	if state then
		---------------------------------------------------
		-- 🟢 NONAKTIFKAN ANIMASI
		---------------------------------------------------
		print("[ANIM] Animasi dinonaktifkan")
		
		-- Nonaktifkan script Animate
		local animate = character:FindFirstChild("Animate")
		if animate then
			animate.Disabled = true
		end

		-- Hentikan animasi aktif sekarang
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
				track:Stop()
			end
		end

	else
		---------------------------------------------------
		-- 🔴 AKTIFKAN KEMBALI ANIMASI
		---------------------------------------------------
		print("[ANIM] Animasi diaktifkan kembali")
		
		local animate = character:FindFirstChild("Animate")
		if animate then
			animate.Disabled = false
		end

		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			-- Muat ulang animasi default
			local newAnim = Instance.new("StringValue")
			newAnim.Name = "Animate"
			newAnim.Value = "Default"
		end
	end
end

-- Tambahkan Toggle ke UI kamu
local AnimToggle = Tab2:Toggle({
	Title = "Disable Animation",
	Icon = false,
	Type = false,
	Value = false,
	Callback = function(state)
		toggleAnimation(state)
	end
})
