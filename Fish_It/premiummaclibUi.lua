local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local Window = MacLib:Window({
    Title = "Kuzu Hub",
    Subtitle = "Paid | V3.12",
    Size = UDim2.fromOffset(650, 400),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
})

local Tab1 = TabGroup:Tab({
  Name <string>
  Image <string> -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})
