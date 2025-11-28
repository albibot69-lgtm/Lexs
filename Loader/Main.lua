local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId

_G.scripts_key = _G.scripts_key or scripts_key or "FREE_USER"
local streeLogo = "rbxassetid://71947103252559"

local premiumKeys = {
local Keys = {
    "LexsPrem_a1Xk9QWzJH",
    "LexsPrem_m2Hc4VPeYU",
    "LexsPrem_r3Dz7BLoKI",
    "LexsPrem_t4Np2SZvUF",
    "LexsPrem_v5Gq8XMdTW",
    "LexsPrem_j6Ba1HKeQL",
    "LexsPrem_p7Ws5OTnIR",
    "LexsPrem_x8Eu3CYvMP",
    "LexsPrem_f9Ry6JDtVN",
    "LexsPrem_q0Ui7LGaWR", -- 10
    "LexsPrem_b1Aa8QPxEM",
    "LexsPrem_n2Dc5ZWrUK",
    "LexsPrem_s3Fv6TMnYL",
    "LexsPrem_u4Hg3BLjWO",
    "LexsPrem_w5Jt9YKeIP",
    "LexsPrem_k6Ls4XWdTR",
    "LexsPrem_r7Nz2CVmUJ",
    "LexsPrem_y8Pe7ABtIL",
    "LexsPrem_g9Qh3SWoMP",
    "LexsPrem_s0Rj5DNxVK", -- 20
    "LexsPrem_c1Af4GEqYL",
    "LexsPrem_o2Ee7CHxWR",
    "LexsPrem_t3Hk1BFoUI",
    "LexsPrem_v4Lr9AZpOM",
    "LexsPrem_x5Mq2DYrTP",
    "LexsPrem_l6Nn6WTaIK",
    "LexsPrem_s7Op3QEvRN",
    "LexsPrem_z8Pq8LBmJU",
    "LexsPrem_h9Rs5XVoIL",
    "LexsPrem_t0St4CDnWM", -- 30
    "LexsPrem_d1Ag2HFrOT",
    "LexsPrem_p2Ek5ZBnLI",
    "LexsPrem_u3Fg7TYmWR",
    "LexsPrem_w4Hi3QVpUN",
    "LexsPrem_y5Jm8SXkOP",
    "LexsPrem_m6Kn4BLrUT",
    "LexsPrem_t7Lp9AZoRI",
    "LexsPrem_a8Mr2DYtWN",
    "LexsPrem_i9Ns6WFeJP",
    "LexsPrem_u0Ot3CVmXL", -- 40
    "LexsPrem_e1Ah7QGdKP",
    "LexsPrem_q2El4TFrVN",
    "LexsPrem_v3Fj1XZoUI",
    "LexsPrem_x4Ho6CYmTR",
    "LexsPrem_z5Jp8ABrWL",
    "LexsPrem_n6Ks2DNxOM",
    "LexsPrem_u7Lr9WTaIP",
    "LexsPrem_b8Ms3EVtRN",
    "LexsPrem_j9Nt5BLmXO",
    "LexsPrem_v0Os4AZpUI", -- 50
    "LexsPrem_f1Ai9CHxWL",
    "LexsPrem_r2En6TFoKP",
    "LexsPrem_w3Fi3QGdUN",
    "LexsPrem_y4Hk7AZmTR",
    "LexsPrem_a5Jl2XVoMP",
    "LexsPrem_o6Km8WErIN",
    "LexsPrem_v7Ln4DYtXP",
    "LexsPrem_c8Mr6BTaUL",
    "LexsPrem_k9Ns3CVpOI",
    "LexsPrem_w0Ot8ALrJM", -- 60
    "LexsPrem_g1Aj4TFnWR",
    "LexsPrem_s2Ek9QHoIM",
    "LexsPrem_x3Fl6ZYpTO",
    "LexsPrem_z4Hg3CBtUN",
    "LexsPrem_b5Jm7AVrXL",
    "LexsPrem_p6Kn2DXoTR",
    "LexsPrem_w7Lp5WErIN",
    "LexsPrem_d8Mq8YVaUP",
    "LexsPrem_l9Nr3BLtWO",
    "LexsPrem_x0Ot6CVmIP", -- 70
    "LexsPrem_h1Ak5QGmTO",
    "LexsPrem_t2El3TFoWR",
    "LexsPrem_y3Fi7AZpUL",
    "LexsPrem_a4Hk1XVoMP",
    "LexsPrem_q5Jn6DYtIN",
    "LexsPrem_v6Ks4CBmTR",
    "LexsPrem_e7Lp9WErUL",
    "LexsPrem_m8Mr2AVrXO",
    "LexsPrem_n9Ns5DXoIP",
    "LexsPrem_y0Ot7BLmTR", -- 80
    "LexsPrem_i1Al9TFrUP",
    "LexsPrem_u2En4QGdWL",
    "LexsPrem_z3Fm8AZpTO",
    "LexsPrem_b4Hk2XVoRN",
    "LexsPrem_r5Jl6DYmIP",
    "LexsPrem_w6Kn3CBtUL",
    "LexsPrem_f7Lp7WErMO",
    "LexsPrem_o8Mq5AVnTR",
    "LexsPrem_c9Ns1DXoUP",
    "LexsPrem_z0Ot4BLmIN", -- 90
    "LexsPrem_j1Am2QGdWR",
    "LexsPrem_v2Ek5TFrMO",
    "LexsPrem_a3Fl8AZpTP",
    "LexsPrem_s4Hg1XVoUN",
    "LexsPrem_x5Jn4DYmRI",
    "LexsPrem_g6Ks7CBtWL",
    "LexsPrem_m7Lp2WErIP",
    "LexsPrem_p8Mr9AVnTO",
    "LexsPrem_d9Ns3DXoUL",
    "LexsPrem_a0Ot6BLmWP", -- 100
    "developer_access"
}

local function isPremiumKey(key)
    for _, k in ipairs(premiumKeys) do
        if key == k then return true end
    end
    return false
end

local userType = isPremiumKey(_G.scripts_key) and "Premium" or "Freemium"

local gameScripts = {
    [2753915549] = {
        name = "Blox Fruit",
        free = "https://raw.githubusercontent.com/create-stree/STREE-HUB/main/Main.lua",
        premium = "https://raw.githubusercontent.com/create-stree/STREE-HUB/main/Premium.lua"
    },
    [1239215938] = {
        name = "Climb and Jump Tower",
        free = "https://raw.githubusercontent.com/create-stree/STREE-HUB/refs/heads/main/Climb%20and%20Jump%20Tower/Main.lua",
        premium = "https://raw.githubusercontent.com/create-stree/STREE-HUB/refs/heads/main/Climb%20and%20Jump%20Tower/Premium.lua"
    },
    [121864768012064] = {
        name = "Fish It",
        free = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/freemiumopen.colseui.lua",
        premium = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/PremiumOpen.CloseUi.lua"
    },
    [18687417158] = {
        name = "Forsaken",
        free = "https://raw.githubusercontent.com/create-stree/STREE-HUB/refs/heads/main/Forsaken/Main.lua",
        premium = "https://raw.githubusercontent.com/create-stree/STREE-HUB/refs/heads/main/Forsaken/Premium.lua"
    }
}

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(3, Enum.EasingStyle.Sine), {Size = 30}):Play()

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local bg1 = Instance.new("ImageLabel", gui)
bg1.Size = UDim2.new(1.3,0,1.3,0)
bg1.Position = UDim2.new(0.5,0,0.5,0)
bg1.AnchorPoint = Vector2.new(0.5,0.5)
bg1.BackgroundTransparency = 1
bg1.Image = "rbxassetid://9154083120"
bg1.ImageTransparency = 0.82
bg1.ImageColor3 = Color3.fromRGB(0,255,255)
TweenService:Create(bg1, TweenInfo.new(18, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Rotation = 10}):Play()

local bg2 = Instance.new("ImageLabel", gui)
bg2.Size = UDim2.new(1.6,0,1.6,0)
bg2.Position = UDim2.new(0.5,0,0.5,0)
bg2.AnchorPoint = Vector2.new(0.5,0.5)
bg2.BackgroundTransparency = 1
bg2.Image = "rbxassetid://9154219234"
bg2.ImageTransparency = 0.9
bg2.ImageColor3 = Color3.fromRGB(0,255,255)
TweenService:Create(bg2, TweenInfo.new(25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = -360}):Play()

local scan = Instance.new("Frame", gui)
scan.Size = UDim2.new(1,0,1,0)
scan.BackgroundColor3 = Color3.fromRGB(255,255,255)
scan.BackgroundTransparency = 0.95
TweenService:Create(scan, TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.97}):Play()

local particles = Instance.new("Frame", gui)
particles.Size = UDim2.new(1,0,1,0)
particles.BackgroundTransparency = 1

for i = 1, 35 do
    local p = Instance.new("Frame", particles)
    p.Size = UDim2.new(0, math.random(2,6), 0, math.random(20,40))
    p.BackgroundColor3 = Color3.fromRGB(0,255,255)
    p.BackgroundTransparency = 0.15
    p.Position = UDim2.new(math.random(),0,math.random(),0)
    TweenService:Create(p, TweenInfo.new(math.random(2,6), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Position = UDim2.new(math.random(),0,math.random(),0)}):Play()
end

local holder = Instance.new("Frame", gui)
holder.Size = UDim2.new(0.9,0,0.22,0)
holder.Position = UDim2.new(0.5,0,0.4,0)
holder.AnchorPoint = Vector2.new(0.5,0.5)
holder.BackgroundTransparency = 1

local function layer(c,t,z)
    local x = Instance.new("TextLabel", holder)
    x.Size = UDim2.new(1,0,1,0)
    x.BackgroundTransparency = 1
    x.Font = Enum.Font.GothamBlack
    x.TextScaled = true
    x.TextColor3 = c
    x.TextTransparency = t
    x.ZIndex = z
    x.Text = ""
    return x
end

local main = layer(Color3.fromRGB(0,255,255), 0, 100)
local glow = layer(Color3.fromRGB(255,255,255), 0.7, 90)
local glow2 = layer(Color3.fromRGB(0,200,255), 0.4, 80)
local outline = layer(Color3.fromRGB(0,80,120), 0.4, 70)
local depth1 = layer(Color3.fromRGB(0,120,200), 0.6, 60)
local depth2 = layer(Color3.fromRGB(255,255,255), 0.9, 50)

local text = "L E X S   H U B"
for i = 1, #text do
    local s = text:sub(1, i)
    main.Text = s
    glow.Text = s
    glow2.Text = s
    outline.Text = s
    depth1.Text = s
    depth2.Text = s
    task.wait(0.035)
end

local shock = Instance.new("ImageLabel", gui)
shock.Size = UDim2.new(0,0,0,0)
shock.AnchorPoint = Vector2.new(0.5,0.5)
shock.Position = UDim2.new(0.5,0,0.45,0)
shock.BackgroundTransparency = 1
shock.Image = "rbxassetid://13850812317"
shock.ImageColor3 = Color3.fromRGB(0,255,255)
shock.ImageTransparency = 0.25

task.wait(0.05)
TweenService:Create(shock, TweenInfo.new(1.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(2.5,0,2.5,0), ImageTransparency = 1}):Play()

local gframe = Instance.new("Frame", gui)
gframe.Size = UDim2.new(1,0,1,0)
gframe.BackgroundTransparency = 1

task.spawn(function()
    while gframe.Parent do
        if math.random(1,9) == 1 then
            local g = Instance.new("Frame", gframe)
            g.Size = UDim2.new(1,0,0, math.random(10,30))
            g.Position = UDim2.new(0,0, math.random(), 0)
            g.BackgroundColor3 = Color3.fromRGB(0,255,255)
            g.BackgroundTransparency = 0.65
            TweenService:Create(g, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
            task.wait(0.22)
            g:Destroy()
        end
        task.wait(0.05)
    end
end)

local logo = Instance.new("ImageLabel", gui)
logo.Size = UDim2.new(0,0,0,0)
logo.AnchorPoint = Vector2.new(0.5,0.5)
logo.Position = UDim2.new(0.5,0,0.68,0)
logo.BackgroundTransparency = 1
logo.Image = streeLogo
logo.ImageColor3 = Color3.fromRGB(0,255,255)

local flash = Instance.new("Frame", gui)
flash.Size = UDim2.new(1,0,1,0)
flash.BackgroundColor3 = Color3.fromRGB(255,255,255)
flash.BackgroundTransparency = 1
flash.ZIndex = 999

TweenService:Create(logo, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,300,0,300)}):Play()
TweenService:Create(flash, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
task.wait(0.1)
TweenService:Create(flash, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()

local s1 = Instance.new("Sound", SoundService) s1.SoundId = "rbxassetid://535716488" s1.Volume = 2
local s2 = Instance.new("Sound", SoundService) s2.SoundId = "rbxassetid://138081500" s2.Volume = 2
local s3 = Instance.new("Sound", SoundService) s3.SoundId = "rbxassetid://9117908220" s3.Volume = 2
local s4 = Instance.new("Sound", SoundService) s4.SoundId = "rbxassetid://1847853090" s4.Volume = 2
task.delay(0.1, function() s1:Play() end)
task.delay(0.3, function() s2:Play() end)
task.delay(0.7, function() s3:Play() end)
task.delay(1.2, function() s4:Play() end)

TweenService:Create(logo, TweenInfo.new(14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360}):Play()

local elec = Instance.new("Frame", gui)
elec.Size = UDim2.new(1,0,1,0)
elec.BackgroundTransparency = 1

task.spawn(function()
    while elec.Parent do
        local spark = Instance.new("Frame", elec)
        spark.Size = UDim2.new(0, math.random(6,14), 0, math.random(6,14))
        spark.Position = UDim2.new(0.5 + math.random(-20,20)/100,0, 0.68 + math.random(-20,20)/100,0)
        spark.BackgroundColor3 = Color3.fromRGB(0,255,255)
        spark.BackgroundTransparency = 0
        TweenService:Create(spark, TweenInfo.new(0.25), {BackgroundTransparency = 1, Position = spark.Position + UDim2.new(0,0,-0.05,0)}):Play()
        task.wait(0.03)
        spark:Destroy()
    end
end)

local shockwave = Instance.new("ImageLabel", gui)
shockwave.Size = UDim2.new(0,0,0,0)
shockwave.AnchorPoint = Vector2.new(0.5,0.5)
shockwave.Position = UDim2.new(0.5,0,0.45,0)
shockwave.BackgroundTransparency = 1
shockwave.Image = "rbxassetid://13850812317"
shockwave.ImageColor3 = Color3.fromRGB(0,255,255)
shockwave.ImageTransparency = 0.35

TweenService:Create(shockwave, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(2,0,2,0), ImageTransparency = 1}):Play()

local elecBurst = Instance.new("Frame", gui)
elecBurst.Size = UDim2.new(1,0,1,0)
elecBurst.BackgroundTransparency = 1

task.spawn(function()
    for i = 1, 18 do
        local b = Instance.new("Frame", elecBurst)
        b.Size = UDim2.new(0, math.random(6,18), 0, math.random(6,18))
        b.Position = UDim2.new(0.5 + math.random(-30,30)/100,0, 0.68 + math.random(-30,30)/100,0)
        b.BackgroundColor3 = Color3.fromRGB(0,255,255)
        b.BackgroundTransparency = 0
        b.Rotation = math.random(-180,180)
        TweenService:Create(b, TweenInfo.new(0.35, Enum.EasingStyle.Quad), {BackgroundTransparency = 1, Position = b.Position + UDim2.new(0, math.random(-40,40),0, math.random(-40,40))}):Play()
        game.Debris:AddItem(b, 0.4)
        task.wait(0.03)
    end
end)

local depthShadow = Instance.new("TextLabel", holder)
depthShadow.Size = UDim2.new(1,0,1,0)
depthShadow.BackgroundTransparency = 1
depthShadow.Font = Enum.Font.GothamBlack
depthShadow.TextScaled = true
depthShadow.TextColor3 = Color3.fromRGB(0,40,40)
depthShadow.TextTransparency = 0.8
depthShadow.ZIndex = 5
depthShadow.Text = main.Text
depthShadow.Position = UDim2.new(0,8,0,8)

task.wait(2)
TweenService:Create(blur, TweenInfo.new(2), {Size = 0}):Play()
gui:Destroy()

local gameData = gameScripts[placeId]
local gameName = gameData and gameData.name or "Unknown Game"

StarterGui:SetCore("SendNotification", {
    Title = "Lexs Hub",
    Text = "Detected game: " .. gameName,
    Icon = streeLogo,
    Duration = 3
})
StarterGui:SetCore("SendNotification", {
    Title = "Lexs Hub",
    Text = "User Type: " .. userType,
    Icon = streeLogo,
    Duration = 3
})

task.wait(2)

if gameData then
    local scriptUrl = userType == "Premium" and gameData.premium or gameData.free
    StarterGui:SetCore("SendNotification", {
        Title = "Lexs Hub",
        Text = "Loading " .. userType .. " version for " .. gameName .. "...",
        Icon = streeLogo,
        Duration = 3
    })
    local success, scriptContent = pcall(function() return game:HttpGet(scriptUrl) end)
    if success and scriptContent and scriptContent ~= "" then
        local f, e = loadstring(scriptContent)
        if f then
            f()
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Lexs Hub",
            Text = "Failed to load script for " .. gameName .. "! Check URL or connection.",
            Icon = streeLogo,
            Duration = 4
        })
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "Lexs Hub",
        Text = "Game not supported!",
        Icon = streeLogo,
        Duration = 4
    })
end
