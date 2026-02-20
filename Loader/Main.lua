local games = {
    [121864768012064] = "https://raw.githubusercontent.com/----------",
    [131623223084840] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ETFB/Freemium.lua",
    [16981421605] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/RAS/Main.lua",
    [119987266683883] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/LavaBranrot/Premium.lua",
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end
