-- Pastikan WindUI kamu sudah di-load
local success, WindUI = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/Premium.lua"))()
end)

if not success then
	warn("⚠️ Gagal load WindUI:", WindUI)
	return
end

-- Ambil window utama
local Window = getgenv().LexsHubWindow or WindUI
if not Window then
	warn("❌ Tidak menemukan Window WindUI (pastikan Premium.lua kamu punya 'getgenv().LexsHubWindow = Window' dan 'return Window')")
	return
end

-- Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Buat tombol GUI manual
local ToggleUI = Instance.new("ScreenGui")
ToggleUI.Name = "LexsHub_OpenClose"
ToggleUI.IgnoreGuiInset = true
ToggleUI.ResetOnSpawn = false
ToggleUI.Parent = PlayerGui

local Button = Instance.new("ImageButton")
Button.Size = UDim2.new(0, 80, 0, 80) -- 🔹 ukuran kecil proporsional
Button.Position = UDim2.new(0, 25, 0, 25)
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.Image = "rbxassetid://71947103252559" -- 🟢 logo kamu
Button.BorderSizePixel = 0
Button.Draggable = true
Button.Parent = ToggleUI

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = Button

-- Border glow
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2.5
stroke.Color = Color3.fromRGB(0, 255, 255) -- default: cyan
stroke.Parent = Button

-- Hover animasi
local TweenService = game:GetService("TweenService")
Button.MouseEnter:Connect(function()
	TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
end)
Button.MouseLeave:Connect(function()
	TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
end)

-- Sistem buka/tutup UI WindUI
local open = true
Button.MouseButton1Click:Connect(function()
	open = not open

	-- toggle WindUI
	if typeof(Window.Toggle) == "function" then
		Window:Toggle(open)
	else
		for _, gui in ipairs(PlayerGui:GetChildren()) do
			if gui:IsA("ScreenGui") and gui.Name:lower():find("wind") and gui.Name ~= "lexshub_openclose" then
				gui.Enabled = open
			end
		end
	end

	-- animasi warna border (cyan -> hitam)
	TweenService:Create(stroke, TweenInfo.new(0.25), {
		Color = open and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(0, 0, 0)
	}):Play()

	print(open and "[✅ UI Dibuka]" or "[⚫ UI Ditutup]")
end)
