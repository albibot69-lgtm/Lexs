local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    warn("⚠️ UI failed to load! (Script Down)")
    return
else
    print("✓ UI loaded successfully!")
end

local Window = WindUI:CreateWindow({
    Title = "Lexs Hub",
    Icon = "rbxassetid://71947103252559",
    Author = "Lexs | Mount Sibuatan",
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
    Title = "v0.0.0.1",
    Color = Color3.fromRGB(255, 255, 255),
    Radius = 17,
})

Window:Tag({
    Title = "Freemium",
    Color = Color3.fromRGB(0, 242, 255),
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
    Title = "Join discord for update",
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

local Tab3 = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2", -- optional
    Locked = false,
})

local Toggle = Tab3:Toggle({
    Title = "Tampilkan Koordinat",
    Desc = "Menampilkan posisi karakter dengan tombol copy di bawah",
    Icon = "axis-3d",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        print("Toggle Activated: " .. tostring(state))

        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart")

        if state then
            -- Buat GUI
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "CoordinateDisplay"
            ScreenGui.Parent = player:WaitForChild("PlayerGui")

            -- Label koordinat utama
            local Label = Instance.new("TextLabel")
            Label.Parent = ScreenGui
            Label.Size = UDim2.new(0, 250, 0, 30)
            Label.Position = UDim2.new(0, 10, 0, 10)
            Label.BackgroundTransparency = 0.5
            Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Label.TextColor3 = Color3.fromRGB(0, 255, 0)
            Label.TextSize = 18
            Label.Font = Enum.Font.SourceSansBold
            Label.Text = "Loading position..."

            -- Tombol Copy (icon di bawah)
            local Button = Instance.new("ImageButton")
            Button.Parent = ScreenGui
            Button.Size = UDim2.new(0, 30, 0, 30)
            Button.Position = UDim2.new(0, 120, 0, 45) -- posisi di bawah label tengah
            Button.BackgroundTransparency = 1
            Button.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Button.Image = "rbxassetid://13039504047" -- contoh: icon pointer (bisa diganti)

            -- Text kecil di bawah tombol
            local CopyText = Instance.new("TextLabel")
            CopyText.Parent = ScreenGui
            CopyText.Size = UDim2.new(0, 100, 0, 20)
            CopyText.Position = UDim2.new(0, 80, 0, 75)
            CopyText.BackgroundTransparency = 1
            CopyText.TextColor3 = Color3.fromRGB(180, 255, 180)
            CopyText.TextSize = 14
            CopyText.Font = Enum.Font.SourceSans
            CopyText.Text = "Salin Koordinat"

            -- Update posisi real-time
            local RunService = game:GetService("RunService")
            local conn
            conn = RunService.RenderStepped:Connect(function()
                if not ScreenGui.Parent then
                    conn:Disconnect()
                    return
                end
                local pos = root.Position
                Label.Text = string.format("Vector3.new(%d, %d, %d)", math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
            end)

            -- Klik icon untuk copy koordinat
            Button.MouseButton1Click:Connect(function()
                local pos = root.Position
                local coord = string.format("Vector3.new(%d, %d, %d)", math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
                if setclipboard then
                    setclipboard(coord)

                    -- 🔔 Gunakan WindUI:Notify
                    WindUI:Notify({
                        Title = "Koordinat Disalin!",
                        Content = coord,
                        Duration = 3,
                        Icon = "mouse-pointer-2",
                    })

                else
                    WindUI:Notify({
                        Title = "Clipboard Tidak Didukung",
                        Content = "setclipboard() tidak tersedia di environment ini.",
                        Duration = 3,
                        Icon = "x-circle",
                    })
                end
            end)

            player:SetAttribute("CoordConnection", conn)

            -- Notifikasi awal toggle ON
            WindUI:Notify({
                Title = "Koordinat Aktif",
                Content = "Menampilkan posisi pemain secara real-time.",
                Duration = 3,
                Icon = "axis-3d",
            })
        else
            -- Matikan GUI & koneksi
            local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("CoordinateDisplay")
            if gui then
                gui:Destroy()
            end

            local conn = player:GetAttribute("CoordConnection")
            if conn then
                conn:Disconnect()
                player:SetAttribute("CoordConnection", nil)
            end

            -- Notifikasi toggle OFF
            WindUI:Notify({
                Title = "coordinates are turned off",
                Content = "Tampilan posisi telah disembunyikan.",
                Duration = 3,
                Icon = "axis-3d",
            })
        end
    end
})

local Tab4 = Window:Tab({
    Title = "Teleport",
    Icon = "map-pin", -- optional
    Locked = false,
})

