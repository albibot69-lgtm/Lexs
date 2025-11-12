local executor = (identifyexecutor and identifyexecutor()) or "Unknown"

local bannedExecutors = {
    "Bunny", "Solara", "TRIGON", "Luna", "XENO", "Swift", "ARGON"
}

for _, name in ipairs(bannedExecutors) do
    if string.find(string.lower(executor), string.lower(name)) then
        warn("❌ Executor \"" .. executor .. "\" tidak didukung oleh LexsHub.")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Executor Tidak Didukung",
            Text = "Executor kamu: " .. executor .. "\nGunakan executor lain seperti Volcano, Velocity DLL.",
            Duration = 8
        })
        return
    end
end

print("✅ Executor terdeteksi:", executor)



local success, WindUI = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/Premium.lua"))()
end)

if not success then
	warn("⚠️ Gagal load WindUI:", WindUI)
	return
end

local Window = getgenv().LexsHubWindow or WindUI
if not Window then
	warn("❌ Tidak menemukan Window WindUI")
	return
end


local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled then
	warn("📱 Mobile terdeteksi — tombol open/close disembunyikan.")
	return
end


local ToggleUI = Instance.new("ScreenGui")
ToggleUI.Name = "LexsHub_OpenClose"
ToggleUI.IgnoreGuiInset = true
ToggleUI.ResetOnSpawn = false
ToggleUI.Parent = PlayerGui

local Button = Instance.new("ImageButton")
Button.Size = UDim2.new(0, 80, 0, 80)
Button.Position = UDim2.new(0, 25, 0, 80)
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.Image = "rbxassetid://71947103252559"
Button.BorderSizePixel = 0
Button.Draggable = true
Button.Parent = ToggleUI

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = Button

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2.5
stroke.Color = Color3.fromRGB(0, 255, 255)
stroke.Parent = Button

local TweenService = game:GetService("TweenService")
Button.MouseEnter:Connect(function()
	TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
end)
Button.MouseLeave:Connect(function()
	TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
end)


local open = true
Button.MouseButton1Click:Connect(function()
	open = not open

	if typeof(Window.Toggle) == "function" then
		Window:Toggle(open)
	else
		for _, gui in ipairs(PlayerGui:GetChildren()) do
			if gui:IsA("ScreenGui") and gui.Name:lower():find("wind") and gui.Name ~= "lexshub_openclose" then
				gui.Enabled = open
			end
		end
	end

	TweenService:Create(stroke, TweenInfo.new(0.25), {
		Color = open and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(0, 0, 0)
	}):Play()

	print(open and "[UI Dibuka]" or "[UI Ditutup]")
end)
