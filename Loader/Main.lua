local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local placeId = game.PlaceId

_G.scripts_key = _G.scripts_key or scripts_key or "FREE_USER"
local Logo = "rbxassetid://122683047852451"

local premiumKeys = {
    "hRCWybDuIIxXeREImBbvjsEueohPzTfX",
}

local function isPremiumKey(key)
    for _, k in ipairs(premiumKeys) do
        if key == k then
            return true
        end
    end
    return false
end

local userType = isPremiumKey(_G.scripts_key) and "Premium" or "Freemium"

local gameScripts = {
    [131623223084840] = {
        name = "Escape Tsunami For Brainrot",
        free = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Loader/LoadingScreenFreemium.lua",
        premium = "https://raw.githubusercontent.com/-a"
    },
    [121864768012064] = {
        name = "Fish It",
        free = "https://raw.githubusercontent.com/-",
        premium = "https://raw.githubusercontent.com/-"
    }
}

local gameData = gameScripts[placeId]
local gameName = gameData and gameData.name or "Unknown Game"

StarterGui:SetCore("SendNotification", {
    Title = "STREE HUB",
    Text = "Detected game: " .. gameName,
    Icon = Logo,
    Duration = 3
})
StarterGui:SetCore("SendNotification", {
    Title = "STREE HUB",
    Text = "User Type: " .. userType,
    Icon = Logo,
    Duration = 3
})

task.wait(2)

if gameData then
    if userType == "Premium" then
        StarterGui:SetCore("SendNotification", {
            Title = "STREE HUB",
            Text = "Loading Premium version for " .. gameName .. "...",
            Icon = Logo,
            Duration = 3
        })
        loadstring(game:HttpGet(gameData.premium))()
    else
        StarterGui:SetCore("SendNotification", {
            Title = "STREE HUB",
            Text = "Loading Freemium version for " .. gameName .. "...",
            Icon = Logo,
            Duration = 3
        })
        loadstring(game:HttpGet(gameData.free))()
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "STREE HUB",
        Text = "Game not supported!",
        Icon = Logo,
        Duration = 4
    })
end
