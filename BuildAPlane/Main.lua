local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Lexs Hub",
    Icon = "monitor", 
    Author = "Lexs Hub | Build A Plane",
    Folder = "Lexs_Hub",
    
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
    
})

Window:EditOpenButton({
    Title = "Open Lexs Hub",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local Tab1 = Window:Tab({
    Title = "Main",
    Icon = "gamepad-2", -- optional
    Locked = false,
})

local Toggle = Tab1:Toggle({
    Title = "Inf Aurora",
    Desc = "Aurora inf can off",
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
       
local Toggle = Tab1:Toggle({
    Title = "Auto Purchase Spin Aurora Event",
    Desc = "Auto Purchase Spin (BUG)",
    Icon = false,
    Type = false,
    Default = false,
    Callback = function(state) 
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinEvents"):WaitForChild("PurchaseSpin"):InvokeServer()
    end
})
