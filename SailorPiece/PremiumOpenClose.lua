local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 🔥 LOAD UI
local success, Library = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/Premium.lua"))()
end)

if not success then
	warn("⚠️ Gagal load Ui:", Library)
	return
end

local Window = getgenv().LexsHubWindow or Library
if not Window then
	warn("❌ Tidak menemukan Window WindUI")
	return
end

local ToggleUI = Instance.new("ScreenGui")
ToggleUI.Name = "LexsHub_OpenClose"
ToggleUI.IgnoreGuiInset = true
ToggleUI.ResetOnSpawn = false
ToggleUI.Parent = PlayerGui

local Button = Instance.new("ImageButton")
Button.Size = UDim2.new(0, 60, 0, 60)
Button.Position = UDim2.new(0, 10, 0.5, -30) -- kiri tengah
Button.BackgroundTransparency = 1
Button.Image = "rbxassetid://103875081318049"
Button.Parent = ToggleUI

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = Button

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2.5
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.Parent = Button

local dragging, dragInput, dragStart, startPos

Button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = Button.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Button.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement 
	or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart

		Button.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

local open = true

Button.MouseButton1Click:Connect(function()
	open = not open

	if typeof(Window.Toggle) == "function" then
		Window:Toggle(open)
	else
		for _, gui in ipairs(PlayerGui:GetChildren()) do
			if gui:IsA("ScreenGui") and gui ~= ToggleUI then
				gui.Enabled = open
			end
		end
	end

	TweenService:Create(stroke, TweenInfo.new(0.2), {
		Color = open and Color3.fromRGB(0,170,255) or Color3.fromRGB(50,50,50)
	}):Play()
end)
