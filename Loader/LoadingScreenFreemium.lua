-- [[ WEBHOOK LOGGER - START ]] -- --(Info Executed)--
local WebhookConfig = {
    Url = "https://discord.com/api/webhooks/1469931454875177096/wp0xOaczNi6N-Z1xEhF-Qpj-CX92INuhbGE1xO8Hjmiq82e24c4mXiVpug62726D84Tf",
    ScriptName = "Lexshub | Free | All Game",
    EmbedColor = 65535
}

local function sendWebhookNotification()
    local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if not httpRequest then return end
    if getgenv().WebhookSent then return end
    getgenv().WebhookSent = true

    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local MarketplaceService = game:GetService("MarketplaceService")
    local LocalPlayer = Players.LocalPlayer

    -- EXECUTOR
    local executorName = "Unknown"
    if identifyexecutor then
        executorName = identifyexecutor()
    end

    -- 🔹 AMBIL NAMA GAME
    local gameName = "Unknown Game"
    pcall(function()
        local info = MarketplaceService:GetProductInfo(game.PlaceId)
        gameName = info.Name
    end)

    local payload = {
        ["username"] = "Script Logger",
        ["avatar_url"] = "https://cdn.discordapp.com/attachments/1403943739176783954/1451856403621871729/ChatGPT_Image_27_Sep_2025_16.38.53.png",
        ["embeds"] = {{
            ["title"] = "🔔 Script Executed: " .. WebhookConfig.ScriptName,
            ["color"] = WebhookConfig.EmbedColor,
            ["fields"] = {
                {
                    ["name"] = "👤 User Info",
                    ["value"] = string.format(
                        "Display: %s\nUser: %s\nID: %s",
                        LocalPlayer.DisplayName,
                        LocalPlayer.Name,
                        tostring(LocalPlayer.UserId)
                    ),
                    ["inline"] = true
                },
                {
                    ["name"] = "🎮 Game Info",
                    ["value"] = string.format(
                        "Game: %s\nPlace ID: %s\nJob ID: %s",
                        gameName,
                        tostring(game.PlaceId),
                        game.JobId
                    ),
                    ["inline"] = true
                },
                {
                    ["name"] = "⚙️ Executor",
                    ["value"] = executorName,
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "Time: " .. os.date("%c")
            }
        }}
    }

    httpRequest({
        Url = WebhookConfig.Url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode(payload)
    })
end

task.spawn(function()
    pcall(sendWebhookNotification)
end)



local CONFIG = {
    ContainerWidth = 380,
    ContainerHeight = 100,
    BarHeight = 8,
    BarPaddingX = 32,
    BarLerpSpeed = 0.4,
    FadeInSpeed = 0.4,
    FadeOutSpeed = 0.3,
}

local loader = {}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GraphiteLoader"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

pcall(function()
    screenGui.Parent = game:GetService("CoreGui")
end)
if not screenGui.Parent then
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

local container = Instance.new("Frame")
container.Size = UDim2.new(0, CONFIG.ContainerWidth, 0, CONFIG.ContainerHeight)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundColor3 = Color3.fromRGB(38, 38, 42)
container.BorderSizePixel = 0
container.BackgroundTransparency = 1
container.Parent = screenGui

Instance.new("UICorner", container).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", container)
stroke.Color = Color3.fromRGB(68, 68, 72)
stroke.Thickness = 1
stroke.Transparency = 1

local statusLabel = Instance.new("TextLabel", container)
statusLabel.Size = UDim2.new(1, -CONFIG.BarPaddingX * 2, 0, 20)
statusLabel.Position = UDim2.new(0, CONFIG.BarPaddingX, 0, 28)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Initializing..."
statusLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextTransparency = 1

local barBackground = Instance.new("Frame", container)
barBackground.Size = UDim2.new(1, -CONFIG.BarPaddingX * 2, 0, CONFIG.BarHeight)
barBackground.Position = UDim2.new(0, CONFIG.BarPaddingX, 0, 60)
barBackground.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
barBackground.BorderSizePixel = 0
barBackground.BackgroundTransparency = 1
Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 3)

local barFill = Instance.new("Frame", barBackground)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
barFill.BorderSizePixel = 0
barFill.BackgroundTransparency = 1
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 3)

local barGradient = Instance.new("UIGradient", barFill)
barGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 180, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
}

local TweenService = game:GetService("TweenService")

TweenService:Create(container, TweenInfo.new(CONFIG.FadeInSpeed), {BackgroundTransparency = 0}):Play()
TweenService:Create(stroke, TweenInfo.new(CONFIG.FadeInSpeed), {Transparency = 0}):Play()
TweenService:Create(statusLabel, TweenInfo.new(CONFIG.FadeInSpeed), {TextTransparency = 0}):Play()
TweenService:Create(barBackground, TweenInfo.new(CONFIG.FadeInSpeed), {BackgroundTransparency = 0}):Play()
TweenService:Create(barFill, TweenInfo.new(CONFIG.FadeInSpeed), {BackgroundTransparency = 0}):Play()

function updateLoader(text, percent)
    statusLabel.Text = text
    barFill:TweenSize(
        UDim2.new(math.clamp(percent, 0, 100) / 100, 0, 1, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        CONFIG.BarLerpSpeed,
        true
    )
end

function loader:Remove()
    TweenService:Create(container, TweenInfo.new(CONFIG.FadeOutSpeed), {BackgroundTransparency = 1}):Play()
    TweenService:Create(stroke, TweenInfo.new(CONFIG.FadeOutSpeed), {Transparency = 1}):Play()
    TweenService:Create(statusLabel, TweenInfo.new(CONFIG.FadeOutSpeed), {TextTransparency = 1}):Play()
    TweenService:Create(barBackground, TweenInfo.new(CONFIG.FadeOutSpeed), {BackgroundTransparency = 1}):Play()
    TweenService:Create(barFill, TweenInfo.new(CONFIG.FadeOutSpeed), {BackgroundTransparency = 1}):Play()

    task.delay(CONFIG.FadeOutSpeed, function()
        screenGui:Destroy()
    end)
end

task.spawn(function()
    task.wait(2)
    updateLoader("Checking Script", 20)
    task.wait(0.8)
    updateLoader("Loading Assets", 45)
    task.wait(0.8)
    updateLoader("Initializing Scripts", 70)
    task.wait(0.8)
    updateLoader("Finalizing", 90)
    task.wait(0.6)
    updateLoader("Complete", 100)
    task.wait(0.5)

    loader:Remove()
    task.wait(0.2)

    loadstring(game:HttpGet("https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Loader/Main.lua"))() -- replace with your loadstring
end)
