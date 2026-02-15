local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local placeId = game.PlaceId
local Logo = "rbxassetid://71947103252559"

-- FREE ONLY
local gameScripts = {
    [96151237893653] = {
        name = "Brainrot Royale",
        free = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/BrainrotRoyale/FreemiumOpenCloseui.lua"
    },
    [131623223084840] = {
        name = "Escape Tsunami For Brainrot",
        free = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ETFB/Freemium.luaw"
    },
    [121864768012064] = {
        name = "Fish It",
        free = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/freemiumopen.colseui.lua"
    },
    [18687417158] = {
        name = "Forsaken",
        free = "https://raw.githubusercontent.com/wdwdwdwdwdwdwdwdwd"
    }
}

local gameData = gameScripts[placeId]
local gameName = gameData and gameData.name or "Unknown Game"

-- NOTIF DETECT GAME
StarterGui:SetCore("SendNotification", {
    Title = "Lexs Hub",
    Text = "Detected game: " .. gameName,
    Icon = Logo,
    Duration = 3
})

task.wait(1)

if gameData then
    
    StarterGui:SetCore("SendNotification", {
        Title = "Lexs Hub",
        Text = "Loading Free Version...",
        Icon = Logo,
        Duration = 3
    })

    local success, scriptContent = pcall(function()
        return game:HttpGet(gameData.free)
    end)

    if success and scriptContent and scriptContent ~= "" then
        local f = loadstring(scriptContent)
        if f then
            f()
        else
            warn("Loadstring error")
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "Lexs Hub",
            Text = "Failed to load script!",
            Icon = Logo,
            Duration = 4
        })
    end

else
    StarterGui:SetCore("SendNotification", {
        Title = "Lexs Hub",
        Text = "Game not supported!",
        Icon = Logo,
        Duration = 4
    })
end
