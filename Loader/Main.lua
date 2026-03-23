local games = {
    [94766472396058] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fisch/Free.lua",         -- Fisch Universe (Main)
    
    [130594398886540] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/GardenHorizon/Main.lua", -- Garden Horizon
    [131623223084840] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ETFB/Freemium.lua", -- Escape Tsunami
    
    [16981421605] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/RAS/Main.lua",  --Reborn As Swordman
    [119987266683883] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/LavaBranrot/Main.lua", -- Lava brainrot
    
    [127794225497302] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Abyss/Main.lua", -- abyss
    [86111605798689] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/StarFishing/Main.lua", -- Star Fishing

    [16732694052] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fisch/Free.lua", -- fisch
    [131716211654599] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fisch/Free.lua", -- fisch
}

local currentPlaceID = game.PlaceId
local currentUniverseID = game.GameId

local scriptURL = games[currentUniverseID] or games[currentPlaceID]

if scriptURL then
    print("Lexs Hub: Loading script for ID " .. (games[currentUniverseID] and "Universe" or "Place"))
    loadstring(game:HttpGet(scriptURL))()
else
    local msg = "\nMap not supported yet!\nPlaceId: " .. tostring(currentPlaceID) .. "\nUniverseId: " .. tostring(currentUniverseID)
    game.Players.LocalPlayer:Kick(msg)
    print(msg)
end
