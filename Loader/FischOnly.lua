local games = {
    [16732694052] = "https://raw.githubusercontent.com/----------",
    [131716211654599] = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/ETFB/Freemium.lua",,
}

local currentID = game.PlaceId
local scriptURL = games[currentID]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    game.Players.LocalPlayer:Kick("This Loadstring Only For Fisch Lol")
end
