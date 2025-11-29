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
    Author = "Premium | Brainrot Royale",
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
    Title = "V0.0.0.1",
    Color = Color3.fromRGB(255, 255, 255),
    Radius = 17,
})

local executorName = "Unknown"
if identifyexecutor then
    executorName = identifyexecutor()
elseif getexecutorname then
    executorName = getexecutorname()
elseif executor then
    executorName = executor
end

-- Pilih warna berdasarkan executor
local executorColor = Color3.fromRGB(200, 200, 200) -- Default (abu-abu)

if executorName:lower():find("flux") then
    executorColor = Color3.fromHex("#30ff6a")     -- Fluxus
elseif executorName:lower():find("delta") then
    executorColor = Color3.fromHex("#38b6ff")     -- Delta
elseif executorName:lower():find("arceus") then
    executorColor = Color3.fromHex("#a03cff")     -- Arceus X
elseif executorName:lower():find("krampus") or executorName:lower():find("oxygen") then
    executorColor = Color3.fromHex("#ff3838")     -- Krampus / Oxygen
elseif executorName:lower():find("volcano") then
    executorColor = Color3.fromHex("#ff8c00")     -- Volcano
elseif executorName:lower():find("synapse") or executorName:lower():find("script") or executorName:lower():find("krypton") then
    executorColor = Color3.fromHex("#ffd700")     -- Synapse / Script-Ware / Krypton
elseif executorName:lower():find("wave") then
    executorColor = Color3.fromHex("#00e5ff")     -- Wave
elseif executorName:lower():find("zenith") then
    executorColor = Color3.fromHex("#ff00ff")     -- Zenith
elseif executorName:lower():find("seliware") then
    executorColor = Color3.fromHex("#00ffa2")     -- Seliware
elseif executorName:lower():find("krnl") then
    executorColor = Color3.fromHex("#1e90ff")     -- KRNL
elseif executorName:lower():find("trigon") then
    executorColor = Color3.fromHex("#ff007f")     -- Trigon
elseif executorName:lower():find("nihon") then
    executorColor = Color3.fromHex("#8a2be2")     -- Nihon
elseif executorName:lower():find("celery") then
    executorColor = Color3.fromHex("#4caf50")     -- Celery
elseif executorName:lower():find("lunar") then
    executorColor = Color3.fromHex("#8080ff")     -- Lunar
elseif executorName:lower():find("valyse") then
    executorColor = Color3.fromHex("#ff1493")     -- Valyse
elseif executorName:lower():find("vega") then
    executorColor = Color3.fromHex("#4682b4")     -- Vega X
elseif executorName:lower():find("electron") then
    executorColor = Color3.fromHex("#7fffd4")     -- Electron
elseif executorName:lower():find("awp") then
    executorColor = Color3.fromHex("#ff005e") -- AWP (merah neon ke pink)
elseif executorName:lower():find("bunni") or executorName:lower():find("bunni.lol") then
    executorColor = Color3.fromHex("#ff69b4") -- Bunni.lol (Hot Pink / Neon Pink)
end

-- Buat Tag UI
local TagUI = Window:Tag({
    Title = "EXECUTOR | " .. tostring(executorName),
    Icon = "github",
    Color = executorColor,
    Radius = 0
})

local Dialog = Window:Dialog({
    Icon = "circle-plus",
    Title = "Join Discord",
    Content = "For Update",
    Buttons = {
        {
            Title = "Copy Discord",
            Callback = function()
                if setclipboard then
                    setclipboard("https://discord.gg/YYbw8KM5x4")
                    
                    -- Notify jika berhasil
                    WindUI:Notify({
                        Title = "Copied Successfully!",
                        Content = "The Discord link has been copied to the clipboard.",
                        Duration = 3,
                        Icon = "check"
                    })
                else
                    -- Notify jika executor tidak support
                    WindUI:Notify({
                        Title = "Fail!",
                        Content = "Your executor does not support the auto-copy command.",
                        Duration = 3,
                        Icon = "x"
                    })
                end
            end,
        },
        {
            Title = "No",
            Callback = function()
                WindUI:Notify({
                    Title = "Canceled",
                    Content = "You cancel the action.",
                    Duration = 3,
                    Icon = "x"
                })
            end,
        },
    },
})

WindUI:Notify({
    Title = "Lexs Hub Loaded",
    Content = "UI loaded successfully!",
    Duration = 3,
    Icon = "bell",
})

local Tab1 = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2",
    Locked = false,
})

local Section = Tab1:Section({ 
    Title = "Kill Aura",
    TextXAlignment = "Left",
    TextSize = 17, 
    Opened = true,
})

Tab1:Divider()

local RS = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

local running = false
local function loopScript()
    running = true
    while _G.a and task.wait(0.1) do
        -- Kill semua enemy dalam base kita
        for _, item in workspace.Bases[tostring(player:GetAttribute("Base"))].Enemies:GetDescendants() do
            if item:IsA("Humanoid") then
                task.spawn(function()
                    item.Health = 0
                end)
            end
        end

        -- Ambil semua cash
        for _, item in workspace:GetChildren() do
            if item.Name == "CashTemp" then
                task.spawn(function()
                    item.CFrame = player.Character.HumanoidRootPart.CFrame
                end)
            end
        end
    end
    running = false
end

local Toggle = Tab1:Toggle({
    Title = "Auto Kill & Collect",
    Icon = false,
    Type = false,
    Value = false,
    Callback = function(state)
        _G.a = state
        if state then
            if not running then
                task.spawn(loopScript)
            end
        end
    end
})

_G.AutoStartWave = false

local EventStart = game:GetService("ReplicatedStorage").Remotes.StartWaveEvent
local EventStop = game:GetService("ReplicatedStorage").Remotes.StopWaveEvent

local function doAutoStartWave()
    while _G.AutoStartWave do
        pcall(function()
            EventStart:FireServer()
        end)
        task.wait(1)
    end
end

Tab1:Toggle({
    Title = "Auto Start Wave",
    Default = false,
    Callback = function(v)
        _G.AutoStartWave = v
        if v then
            task.spawn(doAutoStartWave)
        else
            pcall(function()
                EventStop:FireServer()
            end)
        end
    end
})

local Event = game:GetService("ReplicatedStorage").Remotes.PlaybackSpeedEvent

Tab1:Button({
    Title = "Playback Speed",
    Callback = function()
        pcall(function()
            Event:FireServer()
        end)
    end
})

local Section = Tab1:Section({ 
    Title = "Chest",
    TextXAlignment = "Left",
    TextSize = 17, 
    Opened = true,
})

Tab1:Divider()

_G.AutoOpenChest = false
_G.SelectedChest = "1"

local chestList = {
    "1",
    "2",
    "3",
    "4",
    "5",
}

local function doAutoChest()
    while _G.AutoOpenChest do
        pcall(function()
            local args = { _G.SelectedChest }
            game:GetService("ReplicatedStorage").Remotes.OpenChestEvent:FireServer(unpack(args))
            task.wait(0.1)
            game:GetService("ReplicatedStorage").Remotes.DestroyChestEvent:FireServer()
        end)
        task.wait(1)
    end
end

Tab1:Dropdown({
    Title = "Select Chest",
    Values = chestList,
    Default = "1",
    Callback = function(v)
        _G.SelectedChest = v
    end
})

Tab1:Toggle({
    Title = "Auto Open Chest",
    Default = false,
    Callback = function(v)
        _G.AutoOpenChest = v
        if v then
            task.spawn(doAutoChest)
        end
    end
})

local Tab2 = Window:Tab({
    Title = "Shop",
    Icon = "shopping-bag",
    Locked = false,
})

local Section = Tab2:Section({ 
    Title = "Buildings Shop",
    TextXAlignment = "Left",
    TextSize = 17, 
    Opened = true,
})

Tab2:Divider()

_G.AutoBuy = false
_G.SelectedItem = "Cannon"

local items = {
    "Cannon",
    "Wall",
    "Tung Tower",
    "Tesla",
    "Gold Mine",
    "Inferno",
    "Launcher",
    "Air Blaster",
    "Crossbow",
    "Magic Tower",
    "Tung Hut",
}

local function doAutoBuy()
    while _G.AutoBuy do
        local args = { _G.SelectedItem }
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.BuyDefenseEvent:FireServer(unpack(args))
        end)
        task.wait(1)
    end
end

Tab2:Dropdown({
    Title = "Select Item",
    Values = items,
    Default = "Cannon",
    Callback = function(v)
        _G.SelectedItem = v
    end
})

Tab2:Toggle({
    Title = "Auto Buy Building",
    Default = false,
    Callback = function(v)
        _G.AutoBuy = v
        if v then
            task.spawn(doAutoBuy)
        end
    end
})


local Section = Tab2:Section({ 
    Title = "Weapons Shop",
    TextXAlignment = "Left",
    TextSize = 17, 
    Opened = true,
})

Tab2:Divider()

_G.AutoBuy = false
_G.SelectedItem = "Wood Chest"

local Event = game:GetService("ReplicatedStorage").Remotes.BuyChestEvent

local items = {
    "Wood Chest",
    "Silver Chest",
    "Gold Chest",
    "Legendary Chest",
}

local function doAutoBuy()
    while _G.AutoBuy do
        local args = { _G.SelectedItem }
        pcall(function()
            Event:FireServer(unpack(args))
        end)
        task.wait(1)
    end
end

Tab2:Dropdown({
    Title = "Select Chest",
    Values = items,
    Default = "Cannon",
    Callback = function(v)
        _G.SelectedItem = v
    end
})

Tab2:Toggle({
    Title = "Auto Buy Chest",
    Default = false,
    Callback = function(v)
        _G.AutoBuy = v
        if v then
            task.spawn(doAutoBuy)
        end
    end
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local Tab3 = Window:Tab({
    Tittle = "Settings",
    Icon = "settings",
    Locked = false,
})

Tab3:Slider({
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

Tab3:Slider({
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

local Button = Tab3:Button({
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

Tab3:Button({
    Title = "Reset Speed",
    Desc = "Return speed to normal (16)",
    Callback = function()
        Humanoid.WalkSpeed = 16
        print("WalkSpeed reset to default (16)")
    end
})

Tab3:Divider()

local UserInputService = game:GetService("UserInputService")

local Toggle = Tab3:Toggle({
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

local Toggle = Tab3:Toggle({
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

local Toggle = Tab3:Toggle({
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

Tab3:Divider()

Tab3:Toggle({
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

Tab3:Toggle({
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

Tab3:Section({ 
    Title = "Server",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab3:Divider()

local Button = Tab3:Button({
    Title = "Rejoin",
    Desc = "rejoin to the same server",
    Locked = false,
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

TeleportService:Teleport(game.PlaceId, player)

    end
})

Tab3:Button({
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

Tab3:Section({ 
    Title = "Config",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab3:Divider()

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

Tab3:Button({
    Title = "Save Config",
    Desc = "Save all settings",
    Callback = function()
        local data = GetConfig()
        writefile(ConfigFolder.."/"..ConfigName, game:GetService("HttpService"):JSONEncode(data))
        print("✅ Config saved!")
    end
})

Tab3:Button({
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

Tab3:Button({
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

Tab3:Section({ 
    Title = "Other Scripts",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab3:Divider()

Tab3:Button({
    Title = "Infinite Yield",
    Desc = "Other Scripts",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
    end
})

getgenv().LexsHubWindow = Window

return Window
