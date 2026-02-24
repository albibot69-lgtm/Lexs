local success, LexsHub = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/nyzxhub-rblx/LexsUi/refs/heads/main/New%20Ui%20Lexs.lua"))()
end)

local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

--// LOAD WINDOW
local Window = LexsHub:Window({
    Title   = "Lexs Hub | "..GameName.." |",                --- title
    Footer  = "Premium",                   --- in right after title
    Image   = "103875081318049",           ---- rbxassetid (texture)
    Color   = Color3.fromRGB(0, 208, 255), --- colour text/ui
    Theme   = 9542022979,                  ---- background for theme ui (rbxassetid)
    Version = 1,                           --- version config set as default 1 if u remake / rewrite / big update and change name name in your hub change it to 2 and config will reset
})
--- [[ Notify ]]
if Window then
    Lexs("Window loaded!")
end

local Tabs = {
    Info = Window:AddTab({ Name = "Info", Icon = "player" }),
    Player = Window:AddTab({ Name = "Player", Icon = "user" }), 
    Main = Window:AddTab({ Name = "Main", Icon = "gamepad" }),
    Teleport = Window:AddTab({ Name = "Teleport", Icon = "compas" }),
}

v1 = Tabs.Info:AddSection("Discord", true)

v1:AddParagraph({
    Title = "Join Our Discord",
    Content = "Join Us!",
    Icon = "discord",
    ButtonText = "Copy Discord Link",
    ButtonCallback = function()
        local link = "https://discord.gg/lexshub"
        if setclipboard then
            setclipboard(link)
            Lexs("Successfully Copied!")
        end
    end
})

x1 = Tabs.Player:AddSection("Player")

local P = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
_G.InfiniteJump = false

x1:AddToggle({
    Title = "Infinite Jump",
    Content = "Makes you jump without limits",
    Default = false,
    Callback = function(state)
        _G.InfiniteJump = state
    end
})

UIS.JumpRequest:Connect(function()
    if _G.InfiniteJump then
        local h = P.Character and P.Character:FindFirstChildOfClass("Humanoid")
        if h then
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local Player = game:GetService("Players").LocalPlayer

x1:AddToggle({
    Title = "Noclip",
    Content = "Walk through walls",
    Default = false,
    Callback = function(state)
        _G.Noclip = state
        if state then
            task.spawn(function()
                while _G.Noclip do
                    task.wait(0.1)
                    local character = Player.Character
                    if character then
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") and part.CanCollide then
                                part.CanCollide = false
                            end
                        end
                    end
                end
            end)
        end
    end
})

local P, SG = game.Players.LocalPlayer, game.StarterGui
local frozen, last

local function msg(t,c)
	pcall(function()
		SG:SetCore("ChatMakeSystemMessage",{
			Text="[FREEZE] "..t,
			Color=c or Color3.fromRGB(150,255,150),
			Font=Enum.Font.SourceSansBold,
			FontSize=Enum.FontSize.Size24
		})
	end)
end

local function setFreeze(s)
	local c = P.Character or P.CharacterAdded:Wait()
	local h = c:FindFirstChildOfClass("Humanoid")
	local r = c:FindFirstChild("HumanoidRootPart")
	if not h or not r then return end

	if s then
		last = r.CFrame
		h.WalkSpeed,h.JumpPower,h.AutoRotate,h.PlatformStand = 0,0,false,true
		for _,t in ipairs(h:GetPlayingAnimationTracks()) do t:Stop(0) end
		local a = h:FindFirstChildOfClass("Animator")
		if a then a:Destroy() end
		r.Anchored = true
		msg("Freeze character",Color3.fromRGB(100,200,255))
	else
		h.WalkSpeed,h.JumpPower,h.AutoRotate,h.PlatformStand = 16,50,true,false
		if not h:FindFirstChildOfClass("Animator") then Instance.new("Animator",h) end
		r.Anchored = false
		if last then r.CFrame = last end
		msg("Character released",Color3.fromRGB(255,150,150))
	end
end

x1:AddToggle({
	Title = "Freeze Character",
	Default = false,
	Callback=function(s)
		frozen = s
		setFreeze(s)
	end
})

P.CharacterAdded:Connect(function(c)
	if frozen then task.wait(.5); setFreeze(true) end
end)

Players = game:GetService("Players")
Player = Players.LocalPlayer

_G.DisableAnimation = false

function getHumanoid()
    return (Player.Character or Player.CharacterAdded:Wait()):WaitForChild("Humanoid")
end

function stopAnimation()
    humanoid = getHumanoid()
    animator = humanoid:FindFirstChildOfClass("Animator")

    if animator then
        for _, v in pairs(animator:GetPlayingAnimationTracks()) do
            v:Stop()
        end
        animator.Enabled = false
    end
end

function enableAnimation()
    humanoid = getHumanoid()
    animator = humanoid:FindFirstChildOfClass("Animator")

    if animator then
        animator.Enabled = true
    end
end

x1:AddToggle({
    Title = "Disable Animation",
    Content = "Matikan semua animasi karakter.",
    Default = false,
    Callback = function(state)
        _G.DisableAnimation = state

        if state then
            stopAnimation()
        else
            enableAnimation()
        end
    end
})

Player.CharacterAdded:Connect(function()
    task.wait(0.3)
    if _G.DisableAnimation then
        stopAnimation()
    end
end)

x2 = Tabs.Main:AddSection("Blantant")


local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local AutoFish = false

local CastDelay = 0.4
local ConfirmMultiplier = 0.6

-- INPUT CAST DELAY
x2:AddInput({
    Title = "Cast Delay",
    Default = "0.4",
    Callback = function(v)
        local num = tonumber(v)
        if num and num >= 0.05 then
            CastDelay = num
        end
    end
})

-- INPUT CONFIRM SPEED
x2:AddInput({
    Title = "Complete Delay",
    Default = "0.6",
    Callback = function(v)
        local num = tonumber(v)
        if num and num > 0 then
            ConfirmMultiplier = num
        end
    end
})

-- GET NEAREST GALAXY
local function getNearestGalaxy()
    local char = Player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local nearest
    local dist = math.huge

    for _, v in ipairs(workspace.Galaxies:GetChildren()) do
        local d = (v:GetPivot().Position - hrp.Position).Magnitude
        if d < dist then
            dist = d
            nearest = v
        end
    end

    return nearest
end

-- CONFIRM DENGAN DELAY
RS.Events.Global.ClientRecieveItems.OnClientEvent:Connect(function(_,_,_,catchData,_,waitData)
    if not AutoFish then return end
    if catchData then
        for i, fishData in pairs(catchData) do
            local fishId = fishData.id
            if fishId then
                local delayTime = (waitData and waitData[i] or 3) * ConfirmMultiplier
                task.wait(delayTime)
                RS.Events.Global.ClientItemConfirm:FireServer(fishId)
            end
        end
    end
end)

-- LOOP
task.spawn(function()
    while true do
        if AutoFish then
            local char = Player.Character
            if char then
                local rod = char:FindFirstChild("Rod")
                if rod then
                    local target = getNearestGalaxy()
                    if target then
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local castPos = target:GetPivot().Position + Vector3.new(0,5,0)
                            local castDir = (castPos - hrp.Position).Unit

                            RS.Events.Global.Cast:FireServer(
                                char:FindFirstChildOfClass("Humanoid"),
                                castPos,
                                castDir,
                                rod.Model.Nodes.RodTip.Attachment
                            )

                            task.wait(0.1)

                            RS.Events.Global.WithdrawBobber:FireServer(
                                char:FindFirstChildOfClass("Humanoid")
                            )
                        end
                    end
                end
            end
        end
        task.wait(CastDelay)
    end
end)

-- TOGGLE
x2:AddToggle({
    Title = "Enable Blantant",
    Default = false,
    Callback = function(v)
        AutoFish = v
    end
})

x2 = Tabs.Main:AddSection("Auto Sell")

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local AutoSell = false
local SellDelay = 10 -- default 10 detik

-- SELL FUNCTION
local function sell()
    local args = {
        {
            id = "sell-all",
            text = "Sell <font color='#26ff47'>all</font> of my stars [$255].",
            npc = "Star Merchant"
        }
    }

    RS:WaitForChild("Dialogue")
      :WaitForChild("Events")
      :WaitForChild("Global")
      :WaitForChild("ClientChoosesDialogueOption")
      :FireServer(unpack(args))
end

-- INPUT DETIK
x2:AddInput({
    Title = "Delay Sell (Seconds)",
    Default = "10",
    Callback = function(v)
        local num = tonumber(v)
        if num and num >= 1 then
            SellDelay = num
        end
    end
})

-- TOGGLE
x2:AddToggle({
    Title = "Auto Sell",
    Default = false,
    Callback = function(v)
        AutoSell = v
    end
})

-- LOOP TIMER
task.spawn(function()
    while true do
        if AutoSell then
            sell()
            task.wait(SellDelay)
        else
            task.wait(0.5)
        end
    end
end)

local RS = game:GetService("ReplicatedStorage")

local SellRemote = RS:WaitForChild("Dialogue")
    :WaitForChild("Events")
    :WaitForChild("Global")
    :WaitForChild("ClientChoosesDialogueOption")

local function sellNow()
    local args = {
        {
            id = "sell-all",
            text = "Sell <font color='#26ff47'>all</font> of my stars [$1,505].",
            npc = "Star Merchant"
        }
    }

    SellRemote:FireServer(unpack(args))
end

-- BUTTON
x2:AddButton({
    Title = "Sell All Now",
    Callback = function()
        sellNow()
    end
})

x7 = Tabs.Teleport:AddSection("Teleport Player")

local P = game:GetService("Players")
local LP = P.LocalPlayer
local S
local D

local function L()
    local t = {}
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= LP then
            t[#t + 1] = p.Name
        end
    end
    return t
end

D = x7:AddDropdown({
    Title = "Teleport Target",
    Content = "Select the player you want to teleport",
    Options = L(),
    Callback = function(v)
        S = v
    end
})

x7:AddButton({
    Title = "Teleport to Player",
    Callback = function()
        local T = S and P:FindFirstChild(S)
        if T and T.Character and T.Character:FindFirstChild("HumanoidRootPart")
        and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame =
                T.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end
})

x7:AddButton({
    Title = "Refresh Player List",
    Callback = function()
        local n = L()

        if D.SetOptions then
            D:SetOptions(n)
        elseif D.Update then
            D:Update(n)
        elseif D.Refresh then
            D:Refresh(n)
        end

        if n[1] then
            S = n[1]
            if D.Set then
                D:Set(n[1])
            end
        end

        Lexs("Player list successfully refreshed (" .. tostring(#n) .. " Players)")
    end
})


if Window then
    Lexs("Thanks For Using Premium LexsHub!")
end

--// ANTI AFK 
local VIM=game:GetService("VirtualInputManager")
task.spawn(function()
 while true do
  task.wait(math.random(600,700))
  local k={{Enum.KeyCode.LeftShift,Enum.KeyCode.E},{Enum.KeyCode.LeftControl,Enum.KeyCode.F},{Enum.KeyCode.LeftShift,Enum.KeyCode.Q},{Enum.KeyCode.E,Enum.KeyCode.F}}
  local c=k[math.random(#k)]
  pcall(function()
   for _,x in pairs(c)do VIM:SendKeyEvent(true,x,false,nil)end
   task.wait(.1)
   for _,x in pairs(c)do VIM:SendKeyEvent(false,x,false,nil)end
  end)
 end
end)
