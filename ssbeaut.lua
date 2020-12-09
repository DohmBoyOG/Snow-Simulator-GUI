---[-Scripted by DohmBoyOG#0313-]---
---[-Credits Given in comments of code, if idea was inspired by them or complete copied-]---
---[-Congrats if you deob'ed this script, congrats! you wasted your time!-]---

local library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua")))()

local gamePlayer = game:GetService("Players").LocalPlayer
local ballSize = game:GetService("Players").LocalPlayer.info.snowmanBallSize
local ballCount = game:GetService("Players").LocalPlayer.localData.snowballs
local sackStorage = game:GetService("Players").LocalPlayer.localData.sackStorage
local children = game:GetService("Workspace").snowmanBases:GetChildren()
local christmasGifts = game:GetService("Workspace").giftSpawns
local boss = game:GetService("Workspace").steps.bossLedge.Boss.Boss.HumanoidRootPart

local w = library:CreateWindow("Snowman Sim V-1a-p")

local b = w:CreateFolder("Auto Farm List") -- Creates the folder(U will put here your buttons,etc)
local l = w:CreateFolder("Exit GUI")


local noOptions = true
local candyFarm = false
local waitCandy = false
local prioritizeCandy = false
local snowAuto = false
local rebirthAuto = false
local autoGift = false
local alreadyCollected = false
local bossYeti = false
local moneyYeti = false

local candyColor = {}
local candyCount = {}

local waitCount = 0

local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart

function getBool()
    for _, gamePlots in pairs(children) do
        if gamePlots.player.Value == gamePlayer then
            return gamePlots.rebirthActive.Value
        end
    end
end

function provideRebirth() ---[ Code block Taken and put into a function from user 'umbtw' on v3rmillion forums]---
    for _, value in pairs(children) do
        if value.player.value == gamePlayer then
            if value.player.value == gamePlayer then
                LandPlot = value
            end
        end
    end

    local A_1 = "acceptRebirth"
    local A_2 = LandPlot
    local A_3 = true

    local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.snowmanEvent

    Event:FireServer(A_1, A_2, A_3)
end ---[ End of taken code, i CBA to do it myself even though i know how] ---

function maxSize()
    return 8 + 12 * math.clamp(game:GetService("Players").LocalPlayer.localData.collecting.Value / 200, 0, 1)
end

function countCandy()
    local candyCanes = game:GetService("Workspace").gameCandyCanes:GetChildren()
    local count = #candyCanes
    return count
end

function startCollection()
    for _, candyCanes in next, game:GetService("Workspace").gameCandyCanes:GetChildren() do
        playerPosition.CFrame = candyCanes.cane.CFrame * CFrame.new(0, 4, 0)
        wait(0.30)
    end
end

function collectGift()
    for _, smGift in next, christmasGifts:GetChildren() do
        if smGift.Name == "snowmanGift" and smGift.ownerName.Value == gamePlayer.Name then
            for _, click in next, smGift:GetDescendants() do
                if click:isA("ClickDetector") then
                    fireclickdetector(click)
                end
            end
        end
    end
end

function isGift()
    for _, smGift in next, christmasGifts:GetChildren() do
        if smGift.Name == "snowmanGift" and smGift.ownerName.Value == gamePlayer.Name then
            return true
        end
    end
end

b:Button(
    "Candy Canes",
    function()
        local a = library:CreateWindow("Candy Cane Farm ")
        local b = a:CreateFolder("Start Farm")
        local c = a:CreateFolder("Options")

        b:Toggle(
            "Start Collection",
            function(bool)
                shared.toggle = bool
                if waitCandy == false and prioritizeCandy == false then
                    noOptions = true
                end
                candyFarm = bool
            end
        )

        c:Toggle(
            "Wait For Candy",
            function(bool)
                shared.toggle = bool
                noOptions = false
                waitCandy = bool
            end
        )

        c:Slider(
            "Amount",
            {
                min = 1,
                max = 25,
                precise = false
            },
            function(value)
                noOptions = false
                waitCount = value
            end
        )

        c:Toggle(
            "Prioritize",
            function(bool)
                shared.toggle = bool
                prioritizeCandy = bool
            end
        )

        c:Dropdown(
            "Color Candy Cane",
            {"Red", "Green", "Gold"},
            true,
            function(color)
                candyColor = color
            end
        )
    end
)

b:Button(
    "Snowman Base",
    function()
        local a = library:CreateWindow("Snowman Base Farm ")
        local b = a:CreateFolder("Start Farm")
        local c = a:CreateFolder("Options")

        b:Toggle(
            "AutoFarm On",
            function(bool)
                shared.toggle = bool
                snowAuto = bool
            end
        )

        c:Toggle(
            "Auto Rebirth",
            function(bool)
                shared.toggle = bool
                rebirthAuto = bool
            end
        )

        c:Toggle(
            "Auto Gift",
            function(bool)
                shared.toggle = bool
                autoGift = bool
            end
        )
    end
)

b:Button(
    "Bosses",
    function()
        local a = library:CreateWindow("Boss Menu ")
        local b = a:CreateFolder("Yeti Giant")

        b:Button(
            "Teleport",
            function()
                 playerPosition.CFrame =
                    game:GetService("Workspace").steps.bossLedge.portal.teleportSpot.CFrame
            end
        )

        b:Button(
            "Manual Money",
            function()
                local A_1 = "hit"
                local A_2 = "Yeti Giant"
                local A_3 = game:GetService("Workspace").steps.bossLedge.Boss.Boss.Humanoid
                local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.bossReward
                Event:FireServer(A_1, A_2, A_3)
            end
        )

        b:Toggle(
            "Auto Money",
            function(bool)
                shared.toggle = bool
                moneyYeti = bool
            end
        )

        b:Toggle(
            "Auto Farm",
            function(bool)
                shared.toggle = bool
                bossYeti = bool
            end
        )
    end
)

l:DestroyGui()
l:Label("DohmBoyOG#0313",{
    TextSize = 15; -- Self Explaining
    TextColor = Color3.fromRGB(255,74,0); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

while wait() do
    if noOptions == true and candyFarm == true and wait(1.30) then
        startCollection()
    elseif candyFarm == true and waitCandy == true and wait(1.30) then
        if countCandy() >= waitCount then
            startCollection()
        end
    end
    if snowAuto == true then ---[ This code block was inspired by user 'kekekeke' on the v3rmillion forums] ---
        wait()
        game:GetService("ReplicatedStorage").ThisGame.Calls.snowballController:FireServer("startRoll")
        repeat
            game:GetService("ReplicatedStorage").ThisGame.Calls.collectSnow:FireServer()
            wait()
        until ballSize.Value >= maxSize()
        game:GetService("ReplicatedStorage").ThisGame.Calls.snowballControllerFunc:InvokeServer("stopRoll")
        if ballCount.Value == sackStorage.Value then
            print("Stop Collecting")
            game:GetService("ReplicatedStorage").ThisGame.Calls.snowballController:FireServer("addToSnowman")
            print("Adding Collection to snowman")
            print(isGift())
        end ---[ End Inspired Codeblock ]---
        while rebirthAuto == true and getBool() == true do
            if autoGift == true and isGift() == true then
                collectGift()
                print("Collecting Gift from Frosty!")
                wait()
            end
            wait()
            print("Congrats, its a boy!")
            provideRebirth()
            wait()
        end
        if autoGift == true and isGift() == true and rebirthAuto == false and alreadyCollected == false then
            wait()
            print("Collecting Gift from Frosty!")
            collectGift()
            wait()
            alreadyCollected = true
        end
    end

    while bossYeti == true do
        wait(0.10)
        local A_1 = "explodeLauncher"
        local A_2 = boss.CFrame.p
        local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.snowballProjectile
        Event:FireServer(A_1, A_2)
    end

    while moneyYeti == true do
        wait()
        local A_1 = "hit"
        local A_2 = "Yeti Giant"
        local A_3 = game:GetService("Workspace").steps.bossLedge.Boss.Boss.Humanoid
        local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.bossReward
        Event:FireServer(A_1, A_2, A_3)
    end
end








