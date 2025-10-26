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

local FlyEnabled = false
local FlySpeed = 70

-- === Toggle Fly ===
local Toggle = Tab2:Toggle({
    Title = "Fly Mode",
    Desc = "Aktifkan atau matikan mode terbang",
    Icon = "bird",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        FlyEnabled = state
        if FlyEnabled then
            print("Fly Aktif")
            startFly()
        else
            print("Fly Nonaktif")
            stopFly()
        end
    end
})

-- === Slider Speed ===
local Slider = Tab2:Slider({
    Title = "Fly Speed",
    Desc = "Atur kecepatan terbang",
    Step = 1,
    Value = {
        Min = 20,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        FlySpeed = value
        print("Kecepatan terbang: " .. value)
    end
})

-- === Fly System ===
local player = game.Players.LocalPlayer
local character, humanoid, rootPart
local bodyGyro, bodyVel

function startFly()
    character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")

    -- Hentikan physics normal
    humanoid.PlatformStand = true

    -- Tambahkan BodyGyro & BodyVelocity
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.CFrame = rootPart.CFrame
    bodyGyro.Parent = rootPart

    bodyVel = Instance.new("BodyVelocity")
    bodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVel.Velocity = Vector3.zero
    bodyVel.Parent = rootPart

    -- Loop kontrol fly
    task.spawn(function()
        while FlyEnabled and character and rootPart do
            local camera = workspace.CurrentCamera
            local moveDir = Vector3.zero

            if humanoid.MoveDirection.Magnitude > 0 then
                moveDir = camera.CFrame:VectorToWorldSpace(humanoid.MoveDirection)
            end

            -- Selalu mengikuti arah kamera
            bodyGyro.CFrame = CFrame.new(rootPart.Position, rootPart.Position + camera.CFrame.LookVector)

            -- Tidak turun sendiri (BodyVelocity tetap aktif)
            bodyVel.Velocity = moveDir * FlySpeed

            task.wait(0.03)
        end
        stopFly()
    end)
end

function stopFly()
    if humanoid then humanoid.PlatformStand = false end
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVel then bodyVel:Destroy() end
end
