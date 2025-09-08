local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Lexs Hub | Break Your Bone",
    Icon = "monitor",
    Author = "Discord: discord.gg/cQmgFXgcWz",
    Folder = "MyLexsHub",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
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
            Background = "rbxassetid://75123276914059", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("I have your password account")
        end,
    },
    
    -- !  ↓  remove this all, 
    -- !  ↓  if you DON'T need the key system
    KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "Support Me"},
        
        Note = "Lexs Hub | Break Your Bone Key System",
        
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "Dev",
        },
        
        -- ↓ Optional. You can remove it.
        URL = "https://discord.gg/cQmgFXgcWz",
        
        -- ↓ Optional. You can remove it.
        SaveKey = false, -- automatically save and load the key.
        
        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2",
    Locked = false,
})

local Section = MainTab:Section({ 
    Title = "Afk Farm",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Toggle = MainTab:Toggle({
    Title = "Auto Play",
    Desc = "You Need To Start First And Click Anti Afk Feature",
    Icon = "check",
    Type = "Checkbox",
    Default = false,
    Callback = function(state) 
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SetAFK"):FireServer()
    end
})

local Button = MainTab:Button({
    Title = "Anti Afk",
    Desc = "Anti Kick Afk 20 Minute",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Anti%20Afk"))()
    end
})

local Section = MainTab:Section({ 
    Title = "Auto Buy",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = MainTab:Button({
    Title = "Auto Buy Next Ragdoll",
    Desc = "Buy Next Ragdoll (Need Money)",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseNextRagdoll"):FireServer()
    end
})

local Section = MainTab:Section({ 
    Title = "Auto Upgrade",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = MainTab:Button({
    Title = "Auto Upgrade",
    Desc = "(Torso Only Need Money)",
    Locked = false,
    Callback = function()
        local args = {
	"Torso"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoneUpgrade"):FireServer(unpack(args))

    end
})

local Button = MainTab:Button({
    Title = "Auto Upgrade",
    Desc = "(Head Only Need Money)",
    Locked = false,
    Callback = function()
        local args = {
	"Head"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoneUpgrade"):FireServer(unpack(args))
    end
})

local Button = MainTab:Button({
    Title = "Auto Upgrade",
    Desc = "(Leg Only Need Money)",
    Locked = false,
    Callback = function()
        local args = {
	"Leg"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoneUpgrade"):FireServer(unpack(args))

    end
})

local Button = MainTab:Button({
    Title = "Auto Upgrade",
    Desc = "(Arm Only Need Money)",
    Locked = false,
    Callback = function()
        local args = {
	"Arm"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoneUpgrade"):FireServer(unpack(args))
    end
})

local Section = MainTab:Section({ 
    Title = "Auto Roll",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = MainTab:Button({
    Title = "Auto Roll Material",
    Desc = "Auto Roll (Need Money)",
    Locked = false,
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SetAFK"):FireServer()
    end
})
