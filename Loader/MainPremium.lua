local NotifLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/nyzxhub-rblx/LexsUi/refs/heads/main/notify/lexshubnotify.lua"))()

local games = {
    [94766472396058] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fisch/Premium.lua", name = "Fisch Universe"},
    
    [130594398886540] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/GardenHorizon/Premium.lua", name = "Garden Horizon"},
    [131623223084840] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ETFB/Premium.lua", name = "Escape Tsunami"},
    
    [16981421605] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/RAS/Premium.lua", name = "Reborn As Swordsman"},
    [119987266683883] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/LavaBranrot/Premium.lua", name = "Lava Brainrot"},
    
    [127794225497302] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Abyss/Premium.lua", name = "Abyss"},
    [86111605798689] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/StarFishing/Premium.lua", name = "Star Fishing"},

    [16732694052] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fisch/Premium.lua", name = "Fisch"},
    [131716211654599] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fisch/Premium.lua", name = "Fisch"},

    [70845479499574] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/BiteByNight/Premium.lua", name = "Bite By Night"},

    [138368689293913] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/", name = "Sailor Series"},
    [77747658251236] = {url = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/", name = "Sailor Piece"},
}

local currentPlaceID = game.PlaceId
local currentUniverseID = game.GameId
local WebhookURLunsupport = "https://discord.com/api/webhooks/1496838234951647272/akdelNs_9Dk3Q1Tsv27HhZxEG5Nwy8thmuouozXdp-nBa13Uw-VKMfny_jd_nJTntRMR"
local WebhookURLsupport = "https://discord.com/api/webhooks/1496838367718150215/i3DNKFjzHAt5UN-r3E7ZabvPgvI3EKCgumV9VJFjfnM-kFwau77_EvCMBKqsitapvggU"

local data = games[currentUniverseID] or games[currentPlaceID]

if data then
    print("Lexs Hub: Loading script for " .. data.name)

    NotifLib:MakeNotify({
        Title = "Lexs Hub",
        Content = "Premium Access Granted",
        Icon = "lucide:check",
        Delay = 4
    })

    print("\n\n")

    print("【====================】")
    print("   >>> LEXS HUB <<<   ")
    print("【====================】")

    local steps = {
        "Initializing...",
        "Loading Modules...",
        "Checking Game...",
        "Setting Up UI...",
        "Loading Assets...",
        "Finalizing..."
    }

    for i = 1, 100 do
        local step = steps[math.clamp(math.floor(i/20)+1, 1, #steps)]
        print("    Loading... " .. i .. "% | " .. step)
        task.wait(0.01)
    end

    print("    ✅ Loading Complete!")

    print("\n\n\n")

    local Players = game:GetService("Players")
    local MarketplaceService = game:GetService("MarketplaceService")

    local player = Players.LocalPlayer
    local playerName = player.Name
    local displayName = player.DisplayName
    local userId = player.UserId

    local gameName = "Unknown"
    pcall(function()
        gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)

    print("    ========================================")
    print("    🎮 Game Name   : " .. gameName)
    print("    🗺️ Script Game : " .. data.name)
    print("    👤 Player      : " .. playerName .. " (" .. displayName .. ")")
    print("    🆔 UserId      : " .. userId)
    print("    📍 PlaceId     : " .. game.PlaceId)
    print("    🌍 JobId       : " .. game.JobId)
    print("    ========================================")

    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local MarketplaceService = game:GetService("MarketplaceService")

    local player = Players.LocalPlayer

    local gameName = "Unknown"
    pcall(function()
        gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)

    local executor = "Unknown"
    if identifyexecutor then
        executor = identifyexecutor()
    elseif getexecutorname then
        executor = getexecutorname()
    elseif syn then
        executor = "Synapse X"
    elseif fluxus then
        executor = "Fluxus"
    end

    local thumbnail = ""
    pcall(function()
        local thumbData = game:HttpGet(
            "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
            .. player.UserId .. "&size=420x420&format=Png&isCircular=false"
        )

        local decoded = HttpService:JSONDecode(thumbData)
        thumbnail = decoded.data[1].imageUrl
    end)

    if thumbnail == "" then
        thumbnail = "https://tr.rbxcdn.com/default-avatar.png"
    end

    local dataWebhook = {
        ["username"] = "Lexs Hub Execute Log",
        ["avatar_url"] = "https://cdn.discordapp.com/icons/1421113462339272847/69678e4789851fd8e70b240b504c80d6.webp?size=1024",
        ["embeds"] = {{
            ["title"] = "✅ Supported Game Executed",
            ["color"] = 65280,

            ["thumbnail"] = {
                ["url"] = thumbnail
            },

            ["fields"] = {
                {["name"] = "🎮 Game", ["value"] = gameName, ["inline"] = false},
                {["name"] = "🗺️ Script", ["value"] = data.name, ["inline"] = false},
                {["name"] = "👤 Player", ["value"] = player.Name .. " (" .. player.DisplayName .. ")", ["inline"] = false},
                {["name"] = "🆔 UserId", ["value"] = tostring(player.UserId), ["inline"] = true},
                {["name"] = "⚙️ Executor", ["value"] = executor, ["inline"] = true},
                {["name"] = "📍 PlaceId", ["value"] = tostring(game.PlaceId), ["inline"] = false},
                {["name"] = "🌍 JobId", ["value"] = game.JobId, ["inline"] = false}
            },

            ["footer"] = {
                ["text"] = "Lexs Hub Logger"
            }
        }}
    }

    local request = (syn and syn.request) or (http and http.request) or http_request or request

    if request then
        for i = 1, 3 do
            local ok = pcall(function()
                request({
                    Url = WebhookURLsupport,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = HttpService:JSONEncode(dataWebhook)
                })
            end)

            if ok then break end
            task.wait(1)
        end
    end

    print("Webhook Sent For Supported Game: " .. data.name)

    NotifLib:MakeNotify({
        Title = "Lexs Hub",
        Content = "Loading Premium Script: " .. data.name,
        Icon = "lucide:check",
        Delay = 4
    })

    loadstring(game:HttpGet(data.url))()
else
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

local gameName = "Unknown"
pcall(function()
    gameName = MarketplaceService:GetProductInfo(currentPlaceID).Name
end)

local executor = "Unknown"
if identifyexecutor then
    executor = identifyexecutor()
elseif getexecutorname then
    executor = getexecutorname()
elseif syn then
    executor = "Synapse X"
elseif fluxus then
    executor = "Fluxus"
end

local thumbnail = ""
pcall(function()
    local thumbData = game:HttpGet(
        "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
        .. player.UserId .. "&size=420x420&format=Png&isCircular=false"
    )

    local decoded = HttpService:JSONDecode(thumbData)
    thumbnail = decoded.data[1].imageUrl
end)

if thumbnail == "" then
    thumbnail = "https://tr.rbxcdn.com/default-avatar.png"
end

local dataWebhook = {
    ["username"] = "Lexs Hub Unsupported Execute Log",
    ["avatar_url"] = "https://cdn.discordapp.com/icons/1421113462339272847/69678e4789851fd8e70b240b504c80d6.webp?size=1024",
    ["embeds"] = {{
        ["title"] = "❌ Unsupported Game Detected",
        ["color"] = 16711680,

        ["thumbnail"] = {
            ["url"] = thumbnail
        },

        ["fields"] = {
            {["name"] = "🎮 Game", ["value"] = gameName, ["inline"] = false},
            {["name"] = "👤 Player", ["value"] = player.Name .. " (" .. player.DisplayName .. ")", ["inline"] = false},
            {["name"] = "🆔 UserId", ["value"] = tostring(player.UserId), ["inline"] = true},
            {["name"] = "⚙️ Executor", ["value"] = executor, ["inline"] = true},
            {["name"] = "📍 PlaceId", ["value"] = tostring(currentPlaceID), ["inline"] = false},
            {["name"] = "🌍 JobId", ["value"] = game.JobId, ["inline"] = false}
        },

        ["footer"] = {
            ["text"] = "Lexs Hub Logger"
        }
    }}
}

local request = (syn and syn.request) or (http and http.request) or http_request or request

if request then
    local success = false

    for i = 1, 3 do -- retry 3x
        local ok, err = pcall(function()
            request({
                Url = WebhookURLunsupport,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(dataWebhook)
            })
        end)

        if ok then
            success = true
            break
        else
            warn("Webhook gagal, retry ke-" .. i)
            task.wait(1)
        end
    end

    if not success then
        warn("❌ Webhook gagal total")
    end
else
    warn("❌ Executor tidak support HTTP")
end

    local supported = {}
    for _, v in pairs(games) do
        table.insert(supported, v.name)
    end

    local msg =
        "\n❌ Map not supported!\n" ..
        "🎮 Game: " .. gameName ..
        "\n🆔 PlaceId: " .. currentPlaceID ..
        "\n\n✅ Supported Games:\n- " .. table.concat(supported, "\n- ")

    player:Kick(msg)
    print(msg)
end
