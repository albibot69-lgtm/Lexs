local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Lexs Hub",
    Icon = "Monitor", -- lucide icon
    Author = "Lexs Hub | Build A Plane",
    Folder = "Lexs Hub",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
    
    --       remove this all, 
    -- !  ↓  if you DON'T need the key system
    KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "SupportMe"},
        
        Note = "Lexs Hub Key System",
        
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "Thumbnail",
        },
        
        -- ↓ Optional. You can remove it.
        URL = "https://discord.gg/cQmgFXgcWz",
        
        -- ↓ Optional. You can remove it.
        SaveKey = false, -- automatically save and load the key.
        
        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})

local Tab1 = Window:Tab({
    Title = "Main",
    Icon = "gampad-2", -- optional
    Locked = false,
})

local Toggle = Tab1:Toggle({
    Title = "Inf Aurora",
    Desc = "Aurora inf",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state) 
        while true do
local args = {
	Instance.new("Part", nil)
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UIEvents"):WaitForChild("AuroraCollect"):FireServer(unpack(args))

task.wait(0.00000001)
end
    end
})
       
