local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local Window = MacLib:Window({
    Title = "Lexs Hub",
    Subtitle = "Premium | Fish It | V3.12",
    Size = UDim2.fromOffset(650, 400),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
})

local Tab1=Window:Tab{Title="Main",Icon="landmark"}
local TabGroup = Window:TabGroup()

local Tab1 = TabGroup:Tab({
  Name = "Main"
  Image = "71947103252559"
})
