-- [[ WEBHOOK LOGGER - START ]] -- --(Info Executed)--
local WebhookConfig = {
    Url = "https://discord.com/api/webhooks/1455552801705955430/LF6MI_XBA3073CUDZOv-OtJe74KvUVt-fnXKqqGe3LiGc3g6C0NW76qAoONOwcQQGm2D", 
    ScriptName = "Lexshub | Fish It", 
    EmbedColor = 65535 
}

local function sendWebhookNotification()
    
    local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    
    if not httpRequest then return end 
    if getgenv().WebhookSent then return end 
    getgenv().WebhookSent = true

    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local LocalPlayer = Players.LocalPlayer

    
    local executorName = "Unknown"
    if identifyexecutor then
        executorName = identifyexecutor()
    end

    
    local payload = {
        ["username"] = "Script Logger",
        ["avatar_url"] = "https://cdn.discordapp.com/attachments/1403943739176783954/1451856403621871729/ChatGPT_Image_27_Sep_2025_16.38.53.png",
        ["embeds"] = {{
            ["title"] = "🔔 Script Executed: " .. WebhookConfig.ScriptName,
            ["color"] = WebhookConfig.EmbedColor,
            ["fields"] = {
                {
                    ["name"] = "👤 User Info",
                    ["value"] = string.format("Display: %s\nUser: %s\nID: %s", LocalPlayer.DisplayName, LocalPlayer.Name, tostring(LocalPlayer.UserId)),
                    ["inline"] = true
                },
                {
                    ["name"] = "🎮 Game Info",
                    ["value"] = string.format("Place ID: %s\nJob ID: %s", tostring(game.PlaceId), game.JobId),
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

-----------------------------------------------------------------------------------------------------------



local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local placeId = game.PlaceId
local iconlexs = "rbxassetid://71947103252559"

local gameScripts = {
    [23557829667240] = {
        name = "Chop Your Tree",
        premium = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ChopYourTree.Lua/Premium.luaL"
    },
    [121864768012064] = {
        name = "Fish It",
        premium = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/Premium.lua"
    }
}

local gameData = gameScripts[placeId]
local gameName = gameData and gameData.name or "Unknown Game"

StarterGui:SetCore("SendNotification", {
    Title = "Lexs Hub",
    Text = "Detected game: " .. gameName,
    Icon = iconlexs,
    Duration = 3
})

StarterGui:SetCore("SendNotification", {
    Title = "Lexs Hub",
    Text = "Premium Access Granted",
    Icon = iconlexs,
    Duration = 3
})

if gameData then
    StarterGui:SetCore("SendNotification", {
        Title = "Lexs Hub",
        Text = "Loading Premium Script...",
        Icon = iconlexs,
        Duration = 3
    })

    local success, result = pcall(function()
        return game:HttpGet(gameData.premium)
    end)

    if success and result and result ~= "" then
        local func, err = loadstring(result)
        if func then
            func()
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Lexs Hub",
            Text = "Failed to load script!",
            Icon = iconlexs,
            Duration = 4
        })
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "Lexs Hub",
        Text = "Game not supported!",
        Icon = iconlexs,
        Duration = 4
    })
end
