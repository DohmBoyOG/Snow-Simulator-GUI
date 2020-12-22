local playerList = game:GetService("Players"):GetChildren()
local you = game:GetService("Players").LocalPlayer
local focusTarget = game:GetService("Workspace")
local event = game:GetService("ReplicatedStorage").ThisGame.Calls.snowballProjectile

local icbm = "explodeLauncher" -- or you could use 'explodeSnowballProduct' but it does not work as well so just buy a launcher
--local count = 0

local allTargets = {}
--local currentTarget = {}

function getTargets()
    for _, v in pairs(playerList) do
        if v ~= you and v.localData.playerSettings.pvp.value ~= false then
            table.insert(allTargets, v)
            print("[Target Added] " .. v.name)
        end
    end
end


    

getTargets()
for _, v in pairs(allTargets) do
    print("[Current Target]: " .. v.name)
    repeat
        wait(0.38)
        --me.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,8)
        event:FireServer(icbm, v.Character.HumanoidRootPart.CFrame.p)
        --count = count + 1
        print("[Targets Heath] " .. v.Character.Humanoid.Health)
    until v.Character.Humanoid.Health == 0
    print("Target " .. "[" .. v.name .. "]" .. " Elimated")
end



        