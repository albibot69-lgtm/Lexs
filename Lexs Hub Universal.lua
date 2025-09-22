local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lexs Hub | Script Universal",
   Icon = 75123276914059, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Lexs Hub",
   LoadingSubtitle = "Coded By: Lexs",
   ShowText = "Lexs Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Light", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Lexs, -- Create a custom folder for your hub/game
      FileName = "Lexs Hub"
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Lexs Hub",
      Subtitle = "Lexs Hub Key System",
      Note = "Key In discord.gg/cQmgFXgcWz", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Support Me"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Player", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Player")

local Button = MainTab:CreateButton({
   Name = "Aimbot+Esp Universal",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/hwrSIJDJ/raw"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "No Clip",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/ISwbW8SV/raw"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-universal-gui-43716"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        _G.InfiniteJump = state
        if state then
            print("✅ Infinite Jump Aktif")
        else
            print("❌ Infinite Jump Nonaktif")
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
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Jump Height",
   Range = {50, 1000},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local GameTab = Window:CreateTab("Game Script", 4483362458) -- Title, Image
local Section = GameTab:CreateSection("Blox Fruit Script")

local Button = GameTab:CreateButton({
   Name = "Redz Hub",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/GRAVITY-Blox-Fruits-Actual-Redz-Hub-Script-Updated-40394"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Alchemy Hub",
   Callback = function()
      loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Than Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Cokka Hub",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Blox-Fruits-Cokka-Hub-12647"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Hoho Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
   end,
})

local Section = GameTab:CreateSection("Grow A Garden Script")

local Button = GameTab:CreateButton({
   Name = "Speed Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Than Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Nat Hub",
   Callback = function()
      loadstring(game:HttpGet("https://get.nathub.xyz/loader"))();
   end,
})

local Button = GameTab:CreateButton({
   Name = "Limit Hub",
   Callback = function()
      loadstring(game:HttpGet(('https://raw.githubusercontent.com/FakeModz/LimitHub/refs/heads/main/LimitHub_Luarmor_E.lua')))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "No-Lag Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/Main.lua"))()
   end,
})

local Section = GameTab:CreateSection("99 Night In The Forest Script")

local Button = GameTab:CreateButton({
   Name = "No-Lag Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/Main.lua"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Speed Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Hoho Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "AV Hub",
   Callback = function()
      loadstring(game:HttpGet("https://get-avth-ontop.netlify.app/my-paste/script.lua"))()
   end,
})

local Section = GameTab:CreateSection("Steal A Brainrot Script")

local Button = GameTab:CreateButton({
   Name = "Kurd Hub",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kurd-Hub-29484"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Makal Hub Finder Secret And GOD Only",
   Callback = function()
      getgenv().Rarity = {
    ["Brainrot God"] = {enabled = true},
    ["Secret"] = {enabled = true},
    ["Mythic"] = {enabled = false},
    ["Legendary"] = {enabled = false},
    ["Epic"] = {enabled = false},
    ["Rare"] = {enabled = false},
    ["Common"] = {enabled = false},
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/DoliScriptz/loader/refs/heads/main/finder.txt"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "AV Hub",
   Callback = function()
      loadstring(game:HttpGet("https://get-avth-ontop.netlify.app/my-paste/script.lua"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Hoho Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
   end,
})

local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Section = MiscTab:CreateSection("Misc")

local Button = MiscTab:CreateButton({
   Name = "Auto Rejoin",
   Callback = function()
      



local defaultTime = 10000 -- Enter Time





local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(0.5, -100, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.3
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.3, 0)
label.Text = " - Rejoin Script - "
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextSize = 14
label.Parent = frame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.8, 0, 0.3, 0)
inputBox.Position = UDim2.new(0.1, 0, 0.35, 0)
inputBox.PlaceholderText = "Enter seconds"
inputBox.Text = tostring(defaultTime)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputBox.BackgroundTransparency = 0.2
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.TextSize = 14
inputBox.Parent = frame

local inputBoxCorner = Instance.new("UICorner")
inputBoxCorner.CornerRadius = UDim.new(0, 8)
inputBoxCorner.Parent = inputBox

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.7, 0, 0.2, 0)
button.Position = UDim2.new(0.15, 0, 0.75, 0)
button.Text = "Start Rejoin Bro"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
button.TextSize = 14
button.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = button

local timerFrame = Instance.new("Frame")
timerFrame.Size = UDim2.new(0, 200, 0, 50)
timerFrame.Position = UDim2.new(1, -210, 1, -60)
timerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
timerFrame.BackgroundTransparency = 0.4
timerFrame.Parent = screenGui

local timerFrameCorner = Instance.new("UICorner")
timerFrameCorner.CornerRadius = UDim.new(0, 12)
timerFrameCorner.Parent = timerFrame

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 1, 0)
timerLabel.Text = "0:00:00.00"
timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timerLabel.BackgroundTransparency = 1
timerLabel.TextSize = 18
timerLabel.Parent = timerFrame

local running = false
local connection

local function formatTime(totalSeconds)
    local hours = math.floor(totalSeconds / 3600)
    local minutes = math.floor((totalSeconds % 3600) / 60)
    local seconds = math.floor(totalSeconds % 60)
    local milliseconds = math.floor((totalSeconds - math.floor(totalSeconds)) * 100)
    return string.format("%d:%02d:%02d.%02d", hours, minutes, seconds, milliseconds)
end

local function toggleRejoin()
    local seconds = tonumber(inputBox.Text)
    if seconds and seconds >= 0 then
        timerLabel.Text = formatTime(seconds)
    end

    if not running and seconds and seconds > 0 then
        
        local startTime = os.clock()
        local targetTime = startTime + seconds
        running = true
        button.Text = "Stop Rejoin Bro"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

        connection = game:GetService("RunService").Heartbeat:Connect(function()
            local timeLeft = math.max(0, targetTime - os.clock())
            timerLabel.Text = formatTime(timeLeft)

            if timeLeft <= 0 then
                running = false
                button.Text = "Start Rejoin"
                button.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
                connection:Disconnect()
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
            end
        end)
    elseif running then
        
        running = false
        button.Text = "Start Rejoin"
        button.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
        if connection then
            connection:Disconnect()
        end
        timerLabel.Text = formatTime(seconds or 0)
    end
end

button.MouseButton1Click:Connect(toggleRejoin)

toggleRejoin()
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Anti Afk",
   Callback = function()
      local VirtualUser = game:GetService('VirtualUser')
 
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
 
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AntiAFK loaded!",
    Text = "Coded By Lexs",
    Button1 = "Im Pro Coded Lexs😎",
    Duration = 5
})
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Fps Booster",
   Callback = function()
      repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
loadstring(game:HttpGet("https://pastefy.app/08huVciY/raw"))()
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Esp Line Universal",
   Callback = function()
      getgenv().ESPTracers = true
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function AssignTracers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local PlayerChar = game.Workspace:FindFirstChild(player.Name)
            local LocalChar = LocalPlayer.Character
            if not PlayerChar or not LocalChar or not LocalChar:FindFirstChild("HumanoidRootPart") then
                return
            end


            local beam
            if PlayerChar and LocalChar then
                if PlayerChar:FindFirstChild("ESPBeam") then
                    beam = PlayerChar:FindFirstChild("ESPBeam")
                    if beam then
                        beam.Enabled = getgenv().ESPTracers
                        local attachment0 = Instance.new("Attachment", LocalChar:WaitForChild("HumanoidRootPart"))
                        beam.Attachment0 = attachment0
                    end
                end

                if not beam and getgenv().ESPTracers then
                    local attachment0 = Instance.new("Attachment", LocalChar:WaitForChild("HumanoidRootPart"))
                    local attachment1 = Instance.new("Attachment", PlayerChar:WaitForChild("HumanoidRootPart"))

                    beam = Instance.new("Beam")
                    beam.Name = "ESPBeam"
                    beam.Attachment0 = attachment0
                    beam.Attachment1 = attachment1
                    beam.Color = ColorSequence.new(Color3.fromRGB(255,0,0))
                    beam.FaceCamera = true
                    beam.Width0 = 0.15
                    beam.Width1 = 0.15
                    beam.Parent = PlayerChar
                end
            end
        end
    end
end

AssignTracers()

Players.PlayerAdded:Connect(function(player)
    repeat wait() until player.Character or wait(2)
    AssignTracers()
end)

LocalPlayer.CharacterAdded:Connect(function()
    repeat wait() until LocalPlayer.Character or wait(2)
    AssignTracers()
end)
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Esp Name Universal",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/nMnTLSUI/raw"))()
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Esp Highlights",
   Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/u9lU5hPT/raw"))()
   end,
})

local SpawnerTab = Window:CreateTab("Spawner", 4483362458) -- Title, Image
local Section = SpawnerTab:CreateSection("⚠at your own risk⚠")

local Button = SpawnerTab:CreateButton({
   Name = "Dark Spawner (Bug?)",
   Callback = function()
      local Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()
Spawner.Load()
   end,
})

local Button = SpawnerTab:CreateButton({
   Name = "Spawner 2 (Help Me Test)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/veryimportantrr/x/refs/heads/main/gag_visual.lua", true))
   end,
})

Rayfield:Notify({
   Title = "Lexs Hub Loaded",
   Content = "All Script Loaded",
   Duration = 6.5,
   Image = "check",
})

-- Load Config
Rayfield:LoadConfiguration()
