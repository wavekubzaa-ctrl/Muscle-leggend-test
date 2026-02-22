--[[
    TITLE: BUKWAVE X AIZEN
    GAME: Muscle Legends
    OPTIMIZED FOR: Arceus X Neo
    LANGUAGE: English 
    CREDIT:BUKWAVE X PREMIERHUB
--]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BUKWAVE X AIZEN", "DarkScene")

-- // Variables //
getgenv().AutoFarm = false
getgenv().AutoRebirth = false

-- // Tabs //
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Power Training")

-- // Auto Farm Logic //
local function startFarm()
    task.spawn(function()
        while getgenv().AutoFarm do
            local p = game.Players.LocalPlayer
            local char = p.Character
            if char then
                local tool = char:FindFirstChildOfClass("Tool") or p.Backpack:FindFirstChildOfClass("Tool")
                if tool then
                    if tool.Parent ~= char then
                        tool.Parent = char
                    end
                    tool:Activate()
                end
            end
            task.wait(0.05) -- Optimized for mobile
        end
    end)
end

-- // Auto Rebirth Logic //
local function startRebirth()
    task.spawn(function()
        while getgenv().AutoRebirth do
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            task.wait(2) -- Prevent mobile lag
        end
    end)
end

-- // UI Controls //
MainSection:NewToggle("Auto Lift Weights", "Automatically lift your current weight", function(state)
    getgenv().AutoFarm = state
    if state then
        startFarm()
    end
end)

MainSection:NewToggle("Auto Rebirth Loop", "Automatically rebirth when eligible", function(state)
    getgenv().AutoRebirth = state
    if state then
        startRebirth()
    end
end)

local InfoSection = MainTab:NewSection("Information")
InfoSection:NewLabel("User: BUKWAVE")
InfoSection:NewLabel("Status: Ready")

-- Notification for Arceus X
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "BUKWAVE X AIZEN",
    Text = "Script Activated Successfully",
    Duration = 5
})
