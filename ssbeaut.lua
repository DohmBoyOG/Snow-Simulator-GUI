local gamePlayer = game:GetService("Players").LocalPlayer
local ballSize = game:GetService("Players").LocalPlayer.info.snowmanBallSize
local ballCount = game:GetService("Players").LocalPlayer.localData.snowballs
local sackStorage = game:GetService("Players").LocalPlayer.localData.sackStorage
local children = game:GetService("Workspace").snowmanBases:GetChildren()
local bossStep = game:GetService("Workspace").steps

local autoSnow
local rebirthAuto
local autoCandy
local noOptions
local autoYetiMoney
local autoYeti
local autoSell
local sBoss
local customWait

local candyCount = {}

local waitCount = 0



local config = {
    ["HeaderWidth"] = 240,
    ["AccentColor"] = Color3.new(0.6,0,0)
}
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)
--gui:CreateCategory("Clean Up"):CreateButton("Click",function() gui:CleanUp() end)
local main = gui:CreateCategory("Snowman Simulator GUI")
local autofarms = main:CreateSection('Auto Farms')

autofarms:CreateButton('Snowbase', function()
    local snowbase = gui:CreateCategory('Automatic Snowbase Farm')
    local start_base = snowbase:CreateSwitch('Start', function(bool) autoSnow = bool end)
    local options = snowbase:CreateSection('Options')
    local rebirth = options:CreateSwitch('Rebirth', function(bool) rebirthAuto = bool end)
    --local maxBalls = options:CreateSwitch('No Max Size', function(bool) maxBall = bool end)
    options:Collapse()
end)


autofarms:CreateButton("Boss", function() 
    local bossfarms = gui:CreateCategory("Automatic Boss Farm") 
    local yeti = bossfarms:CreateSection('Yeti Giant')
    local start_yeti = yeti:CreateSwitch('Start', function(bool) autoYeti = bool sBoss = 'Yeti Giant' end)
    local yeti_options = yeti:CreateSection('Options')
    local yeti_teleport = yeti_options:CreateButton('Teleport', function()  gamePlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(1549.21375, 1310.87549, -88.4116821, -0.947578907, 0, -0.319522291, 0, 1, 0, 0.319522291, 0, -0.947578907)  end)
    local yeti_money = yeti_options:CreateButton('Manual Boss Reward', function() end)
    local yeti_moneyauto = yeti_options:CreateSwitch('Auto Boss Reward', function(bool) autoYetiMoney = bool sBoss = 'Yeti Giant' end)
    local yeti_slider = yeti_options:CreateSlider("Custom Kill Wait", function(value) customWait = value end,0,100,0.1,false,1)
    local ginger = bossfarms:CreateSection('Bad Batch Gingey')
    local start_ginger = ginger:CreateSwitch('Start', function(bool) autoYeti = bool sBoss = 'Bad Batch Gingey' end)
    local ginger_options = ginger:CreateSection('Options')
    local ginger_teleport = ginger_options:CreateButton('Teleport', function()  gamePlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1498.91821, 3447.21191, -42.1051826, -0.3110888, 0, -0.950380862, 0, 1, 0, 0.950380862, 0, -0.3110888) end)
    local ginger_money = ginger_options:CreateButton('Manual Boss Reward', function() end)
    local ginger_moneyauto = ginger_options:CreateSwitch('Auto Boss Reward', function(bool) autoYetiMoney = bool sBoss = 'Bad Batch Gingey' end)
    local ginger_slider = ginger_options:CreateSlider("Custom Kill Wait", function(value) customWait = value end,0,100,0.1,false,1)
    local teddy = bossfarms:CreateSection('Terrible Teddy Bear')
     local start_teddy = teddy:CreateSwitch('Start', function(bool) autoYeti = bool sBoss = 'Terrible Teddy Bear' end)
    local teddy_options = teddy:CreateSection('Options')
    local teddy_teleport = teddy_options:CreateButton('Teleport', function()  gamePlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(1774.95825, 6845.896, 93.9758835, -0.70693624, 0, 0.707277477, 0, 1, 0, -0.707277477, 0, -0.70693624) end)
    local teddy_money = teddy_options:CreateButton('Manual Boss Reward', function() end)
    local teddy_moneyauto = teddy_options:CreateSwitch('Auto Boss Reward', function(bool) autoYetiMoney = bool sBoss = 'Terrible Teddy Bear' end)
    local teddy_slider = teddy_options:CreateSlider("Custom Kill Wait", function(value) customWait = value end,0,100,0.1,false,1)
     local gumdrop = bossfarms:CreateSection('Gumdrop King')
     local start_gumdrop = gumdrop:CreateSwitch('Start', function(bool) autoYeti = bool sBoss = 'Gumdrop King' end)
    local gumdrop_options = gumdrop:CreateSection('Options')
    local gumdrop_teleport = gumdrop_options:CreateButton('Teleport', function()  gamePlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(1612.96106, 2031.46936, -34.4764557, -0.69781208, 0, -0.716280818, 0, 1, 0, 0.716280818, 0, -0.69781208) end)
    local gumdrop_money = gumdrop_options:CreateButton('Manual Boss Reward', function() end)
    local gumdrop_moneyauto = gumdrop_options:CreateSwitch('Auto Boss Reward', function(bool) autoYetiMoney = bool sBoss = 'Gumdrop King' end)
    local gumdrop_slider = gumdrop_options:CreateSlider("Custom Kill Wait", function(value) customWait = value end,0,100,0.1,false,1)
    yeti:Collapse()
    ginger:Collapse()
    teddy:Collapse()
    gumdrop:Collapse()
    yeti_options:Collapse()
    teddy_options:Collapse()
    ginger_options:Collapse()
    gumdrop_options:Collapse()
    end)




autofarms:CreateButton("Candy", function() 
    local candies = gui:CreateCategory("Automatic Candy Farm") 
    local start = candies:CreateSwitch('Start', function(bool) autoCandy = bool end)
    local options = candies:CreateSection('Options')
    local slider = options:CreateSlider("Amount to Wait", function(value) if waitCheck() == true then noOptions = false end waitCount = value end,0,25,1)
    local sell = options:CreateSwitch('AutoSell', function(value) autoSell = value end)
    options:Collapse()
    end)


autofarms:CreateButton("Minions", function() notImplemented() end, false)

autofarms:Collapse()

main:CreateButton("Exit GUI",function() gui:CleanUp() end)

main:CreateTextLabel('Created by DohmBoyOG#0313 \n Version: 0.36 Pre-Release')


------- END GUI STUFF -------

function waitCheck()
    if waitCount > 0 then
        return true;
    else
        return false;
    end
end

        
function maxSize()
    return 8 + 12 * math.clamp(game:GetService("Players").LocalPlayer.localData.collecting.Value / 200, 0, 1)
end

function auto_snowbase()
    --if maxBall == true then
       -- op = ballSize.Value <= maxSize()
    --else
       -- op = ballSize.Value >= maxSize()
        
   -- end
   game:GetService("ReplicatedStorage").ThisGame.Calls.snowballControllerFunc:InvokeServer("startRoll")
    repeat
        for i = 1, 100 do
        game:GetService("ReplicatedStorage").ThisGame.Calls.collectSnow:FireServer()
        game:GetService("RunService").Heartbeat:wait()
        end
    until ballSize.Value >= maxSize()
        
    warn('[Snowball Size]: '..ballSize.Value..'/'..maxSize())
    game:GetService("ReplicatedStorage").ThisGame.Calls.snowballControllerFunc:InvokeServer("stopRoll")
    if ballCount.Value == sackStorage.Value then
        print("Stop Collecting")
        game:GetService("ReplicatedStorage").ThisGame.Calls.snowballController:FireServer("addToSnowman")
        print("Adding Collection to snowman")
        end
        while rebirthAuto == true and getBool() == true do
            wait()
            print("Congrats, its a boy!")
            provideRebirth()
            wait()
        end
end

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

function countCandy()
    local candyCanes = game:GetService("Workspace").gameCandyCanes:GetChildren()
    local count = #candyCanes
    return count
end

function startCollection()
    for _ , candyCanes in next, game:GetService("Workspace").gameCandyCanes:GetChildren() do
        local cane = candyCanes:FindFirstChild("cane")
        if cane then
            gamePlayer.Character.HumanoidRootPart.CFrame  = candyCanes.cane.CFrame * CFrame.new(0,4,0)
            wait(0.40)
        end
    end
end

function sellCandy()
    print(autoSell)
    if autoSell == true then
        for count = 1, 3 do
            local A_1 = "sellCandycanes"
            local A_2 = count
            local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.candycaneSell
            Event:FireServer(A_1, A_2)
        end
    end
end


    

function forceReward()
    local bossPosition = searchBoss(sBoss)
    if bossPosition:FindFirstChild('Boss') and bossPosition.Boss:FindFirstChild('HumanoidRootPart') then
        local A_1 = "hit"
        local A_2 = sBoss
        local A_3 = game:GetService("Workspace").steps.bossLedge.Boss.Boss.Humanoid
        local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.bossReward
        for i= 1, 80 do
            Event:FireServer(A_1, A_2, A_3)
            game:GetService("RunService").Heartbeat:wait()
            end
            print('doing')
    end
end

        

function searchBoss(b)
    for _, findLedge in next, bossStep:GetChildren() do
        if findLedge.Name == 'bossLedge' then
            for _, findBoss in next, findLedge:GetChildren() do
                if findBoss:IsA('Folder') and findBoss.Name == 'Boss' then
                    if findBoss.bossName.Value == b then
                        return findBoss
                    end
                end
            end
        end
    end
end

function autoKill()
    local bossPosition = searchBoss(sBoss)
    if bossPosition:FindFirstChild('Boss') and bossPosition.Boss:FindFirstChild('HumanoidRootPart') then
        local A_1 = "explodeLauncher"
        local A_2 = bossPosition.Boss.HumanoidRootPart.CFrame.p;
        local Event = game:GetService("ReplicatedStorage").ThisGame.Calls.snowballProjectile
        wait(customWait)
        for i=1, 20 do 
        Event:FireServer(A_1, A_2)
        game:GetService("RunService").Heartbeat:wait()
        end
    end
end

function notImplemented()
    wait(0.2)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Not Implemented"; -- the title 
        Text = "This Function is not implemented yet, please be patient this is a WIP"; -- what the text says 
        Duration = 5; -- how long the notification should in secounds
        })
end


while wait() do
    if autoSnow == true then
        auto_snowbase()
    end
    if autoCandy == true and noOptions == true then
        startCollection()
    elseif autoCandy == true and waitCheck() == true then
    --print('[Waiting for] '..'['..waitCount..']'..' Candy Canes')
        if countCandy() >= waitCount then
            --print('Found Candy!')
            startCollection()
            sellCandy()
        end
    end
    
    

    if autoYetiMoney == true then
        print('enabled')
        forceReward()
    end
    if autoYeti == true then
        autoKill()
    end
    
    
end


