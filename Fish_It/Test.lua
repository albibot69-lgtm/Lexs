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

--// Fly Script (kamera arah + anti turun) by Ibnu 😎

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local flying = false
local flySpeed = 50 -- default speed
local humanoidRootPart

-- fungsi notif
local function notify(msg, color)
	pcall(function()
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[FLY] " .. msg,
			Color = color or Color3.fromRGB(100,200,255),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
	end)
end

-- update character
local function getCharacter()
	local char = player.Character or player.CharacterAdded:Wait()
	humanoidRootPart = char:WaitForChild("HumanoidRootPart")
	return char
end

getCharacter()
player.CharacterAdded:Connect(getCharacter)

-- arah gerakan
local movement = { Forward = 0, Backward = 0, Left = 0, Right = 0 }

-- Fly logic utama
RunService.RenderStepped:Connect(function(dt)
	if flying and humanoidRootPart then
		local camera = workspace.CurrentCamera
		local moveDirection = Vector3.zero

		-- gerakan mengikuti arah kamera
		moveDirection += camera.CFrame.LookVector * (movement.Forward - movement.Backward)
		moveDirection += camera.CFrame.RightVector * (movement.Right - movement.Left)

		-- hilangkan efek gravitasi
		humanoidRootPart.Velocity = Vector3.zero

		-- hanya gerak kalau ada input
		if moveDirection.Magnitude > 0 then
			humanoidRootPart.CFrame += moveDirection.Unit * (flySpeed * dt)
		end
	end
end)

-- input key
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.W then movement.Forward = 1 end
	if input.KeyCode == Enum.KeyCode.S then movement.Backward = 1 end
	if input.KeyCode == Enum.KeyCode.A then movement.Left = 1 end
	if input.KeyCode == Enum.KeyCode.D then movement.Right = 1 end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then movement.Forward = 0 end
	if input.KeyCode == Enum.KeyCode.S then movement.Backward = 0 end
	if input.KeyCode == Enum.KeyCode.A then movement.Left = 0 end
	if input.KeyCode == Enum.KeyCode.D then movement.Right = 0 end
end)

-- fungsi aktifkan fly
local function toggleFly(state)
	flying = state
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChildOfClass("Humanoid")

	if state then
		notify("Mode Fly diaktifkan ✈️", Color3.fromRGB(120,255,120))
		if humanoid then humanoid.PlatformStand = true end
	else
		notify("Mode Fly dimatikan 🛬", Color3.fromRGB(255,150,150))
		if humanoid then humanoid.PlatformStand = false end
	end
end

-- Toggle UI kamu
local Toggle = Tab2:Toggle({
	Title = "Fly Mode",
	Desc = "Terbang mengikuti arah kamera",
	Icon = "bird",
	Type = "Checkbox",
	Value = false,
	Callback = function(state)
		print("[FLY] Activated: " .. tostring(state))
		toggleFly(state)
	end
})

-- Input UI kamu (atur speed)
local Input = Tab2:Input({
	Title = "Fly Speed",
	Desc = "Atur kecepatan terbang",
	Value = tostring(flySpeed),
	InputIcon = "bird",
	Type = "Input",
	Placeholder = "Masukkan angka kecepatan...",
	Callback = function(input)
		local num = tonumber(input)
		if num and num > 0 then
			flySpeed = num
			notify("Kecepatan fly diatur ke: " .. tostring(num), Color3.fromRGB(120,255,120))
		else
			notify("Input tidak valid. Gunakan angka.", Color3.fromRGB(255,120,120))
		end
	end
})

