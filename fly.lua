--// Fly Script v6 by Ibnu 😎
--// Anti turun total (lock posisi manual), arah kamera 3D

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local flying = false
local flySpeed = 50
local move = {Forward = 0, Backward = 0, Left = 0, Right = 0}
local lastPosition = root.Position

-- 🔔 Notif helper
local function notify(msg, color)
	pcall(function()
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "[FLY] " .. msg,
			Color = color or Color3.fromRGB(0,255,200),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size24
		})
	end)
end

-- 🧍 Update jika respawn
player.CharacterAdded:Connect(function(char)
	character = char
	root = char:WaitForChild("HumanoidRootPart")
	humanoid = char:WaitForChild("Humanoid")
	lastPosition = root.Position
end)

-- 🎮 Input gerakan
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.W then move.Forward = 1 end
	if input.KeyCode == Enum.KeyCode.S then move.Backward = 1 end
	if input.KeyCode == Enum.KeyCode.A then move.Left = 1 end
	if input.KeyCode == Enum.KeyCode.D then move.Right = 1 end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then move.Forward = 0 end
	if input.KeyCode == Enum.KeyCode.S then move.Backward = 0 end
	if input.KeyCode == Enum.KeyCode.A then move.Left = 0 end
	if input.KeyCode == Enum.KeyCode.D then move.Right = 0 end
end)

-- ✈️ Fly Loop
RunService.RenderStepped:Connect(function(dt)
	if flying and root and humanoid then
		local cam = workspace.CurrentCamera
		local cf = cam.CFrame
		local direction = Vector3.zero

		direction += cf.LookVector * (move.Forward - move.Backward)
		direction += cf.RightVector * (move.Right - move.Left)

		-- Nonaktifkan physics sepenuhnya
		humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero

		-- Hitung posisi baru
		local newPos = lastPosition
		if direction.Magnitude > 0 then
			newPos = newPos + direction.Unit * (flySpeed * dt)
		end

		-- Atur orientasi dan posisi manual
		root.CFrame = CFrame.new(newPos, newPos + cf.LookVector)
		lastPosition = newPos -- simpan posisi biar tidak turun sama sekali
	end
end)

-- 🔁 Toggle
local function toggleFly(state)
	flying = state
	if state then
		notify("Fly diaktifkan ✈️", Color3.fromRGB(0,255,120))
		humanoid.PlatformStand = true
		lastPosition = root.Position
	else
		notify("Fly dimatikan 🛬", Color3.fromRGB(255,120,120))
		humanoid.PlatformStand = false
	end
end

-- 🧩 Toggle UI
local Toggle = Tab2:Toggle({
	Title = "Fly Mode",
	Desc = "Terbang penuh, tidak akan turun sama sekali",
	Icon = "bird",
	Type = "Checkbox",
	Value = false,
	Callback = function(state)
		print("[FLY] Activated: " .. tostring(state))
		toggleFly(state)
	end
})

-- 💨 Input Speed
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
			notify("Kecepatan fly diatur ke " .. num)
		else
			notify("Input tidak valid. Gunakan angka!", Color3.fromRGB(255,100,100))
		end
	end
})

