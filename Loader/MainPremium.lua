local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local placeId = game.PlaceId
local iconlexs = "rbxassetid://71947103252559"

local gameScripts = {
    [76558904092080] = {
        name = "The Forge",
        premium = "https://raw.githubusercontent.com/albibot69-lgtm/L"
    },
    [121864768012064] = {
        name = "Fish It",
        premium = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/PremiumOpen.CloseUi.lua"
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
