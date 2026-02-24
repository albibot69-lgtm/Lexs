local games = {
    [130594398886540] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/GardenHorizon/Main.lua", -- Garden Horizon
    [131623223084840] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ETFB/Freemium.lua", -- Escape Tsunami
    [16981421605] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/RAS/Main.lua",  --Reborn As Swordman
    [119987266683883] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/LavaBranrot/Main.lua", -- Lava brainrot
    [127794225497302] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Abyss/Main.lua", -- abyss
    [86111605798689] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/StarFishing/Main.lua", -- Star Fishing
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end
