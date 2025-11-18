local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Drawing = Drawing or loadstring(game:HttpGet("https://raw.githubusercontent.com/vallydev/drawing-library/main/library.lua"))()

local SilentAim = false
local FOV_Size = 70
local TargetPart = "Head"
local CurrentTarget = nil
local FOV_Circle = Drawing.new("Circle")
FOV_Circle.Thickness = 1
FOV_Circle.NumSides = 100
FOV_Circle.Radius = FOV_Size
FOV_Circle.Filled = false
FOV_Circle.Visible = false

local mt = getrawmetatable(game)
local oldIndex = mt.__index
setreadonly(mt, false)

mt.__index = function(t, k)
    if t:IsA("Mouse") and k == "Hit" and SilentAim and CurrentTarget and CurrentTarget.Character and CurrentTarget.Character:FindFirstChild(TargetPart) then
        return CurrentTarget.Character[TargetPart].CFrame
    end
    return oldIndex(t, k)
end

local function GetClosestPlayer()
    local Closest = nil
    local ClosestDist = FOV_Size
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild(TargetPart) and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local Pos, OnScreen = Camera:WorldToViewportPoint(v.Character[TargetPart].Position)
            if OnScreen then
                local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if Dist < ClosestDist then
                    ClosestDist = Dist
                    Closest = v
                end
            end
        end
    end
    return Closest
end

RunService.RenderStepped:Connect(function()
    CurrentTarget = (SilentAim and GetClosestPlayer()) or nil
    FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
    FOV_Circle.Radius = FOV_Size
    FOV_Circle.Visible = (CurrentTarget ~= nil)
end)

local Toggle = Tab:Toggle({
    Title = "Silent Aim",
    Desc = "Aktifkan AimSilent",
    Icon = "bird",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        SilentAim = state
    end
})

local Slider = Tab:Slider({
    Title = "Show FOV",
    Desc = "Atur ukuran lingkaran FOV",
    Step = 1,
    Value = {
        Min = 20,
        Max = 200,
        Default = 70,
    },
    Callback = function(value)
        FOV_Size = value
    end
})

local Dropdown = Tab:Dropdown({
    Title = "Aim Part",
    Desc = "Pilih bagian tubuh untuk di-aim",
    Values = { "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso" },
    Value = "Head",
    Callback = function(option)
        TargetPart = option
    end
})
